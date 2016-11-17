<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the TypeScript class file-->
<#--------------------------------------------------------------------------------------------------------------------->

<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign attributes = currentModelObject.getChildren("attribute", nsModel)>
<#assign references = currentModelObject.getChildren("reference", nsModel)>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->

<#-- Create the imports for the references in the MetaFactory model. -->
<#list references as reference>
    <#assign referenceClassFile = reference.getAttributeValue("type")?lower_case>
    <#assign referenceClassName = reference.getAttributeValue("type")>
import { ${referenceClassName} }  from './${referenceClassFile}';
</#list>

export class ${modelObjectName} {
<#list attributes as attribute>
<#--Generate the attributes:-->
    <#assign attributeName = attribute.getAttributeValue("name")>
    <#assign attributeType = attribute.getAttributeValue("type")>
    ${attributeName}: ${metafactory.getValueFromMap( "typeScriptTypes", attributeType)};
</#list>
<#list references as reference>
<#--Generate the referenced types:-->
    <#assign referenceName = reference.getAttributeValue("name")>
    <#assign referenceType = reference.getAttributeValue("type")>
    <#assign referencedObjectElement = metafactory.findChildByAttribute(currentModelPackage, "object", "name" , referenceType)>
    <#assign objectNamePL = metafactory.getElementProperty(referencedObjectElement, "name.plural", "${referenceName}s")>
    <#assign objectNamePLFL = objectNamePL?uncap_first>
    <#if reference.getAttributeValue("multiplicity").endsWith("..1")>
    ${referenceName} : ${referenceType};
    <#elseif reference.getAttributeValue("multiplicity").endsWith("..n")>
    ${objectNamePLFL} : ${referenceType}[];
    </#if>
</#list>
}