<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>

<#assign attributes = currentModelObject.getChildren("attribute", nsModel)>
<#assign references = currentModelObject.getChildren("reference", nsModel)>


<#-- Create the imports for the references in the MetaFactory model. -->
<#list references as reference>
    <#assign referenceClassFile = reference.getAttributeValue("type")?lower_case>
    <#assign referenceClassName = reference.getAttributeValue("type")>
import { ${referenceClassName} }  from './${referenceClassFile}';
</#list>

export class ${modelObjectName} {
<#if !attributes.isEmpty()>
<#--Generate the attributes:-->
<#--// Attributes:-->
    <#list attributes as attribute>
        <#assign attributeNameFU = attribute.getAttributeValue("name")?uncap_first>
        <#assign attributeType = attribute.getAttributeValue("type")>
    ${attributeNameFU}: ${metafactory.getValueFromMap( "typeScriptTypes", attributeType)};
    </#list>
</#if>
<#if !references.isEmpty()>
<#--Generate the referenced types:-->
<#--// Referenced attributes:-->
    <#list references as reference>
        <#assign referenceName = reference.getAttributeValue("name")>
        <#assign referenceNameFU = referenceName?uncap_first>
        <#assign referenceType = reference.getAttributeValue("type")>
        <#assign referencedObjectElement = metafactory.findChildByAttribute(currentModelPackage, "object", "name" , referenceType)>
        <#assign objectNamePL = metafactory.getElementProperty(referencedObjectElement, "name.plural", "${referenceName}s")>
        <#assign objectNamePLFL = objectNamePL?uncap_first>
        <#if reference.getAttributeValue("multiplicity").endsWith("..1")>
    ${referenceNameFU} : ${referenceType};
        </#if>
        <#if reference.getAttributeValue("multiplicity").endsWith("..n")>
    ${objectNamePLFL} : ${referenceType}[];
        </#if>
    </#list>
</#if>
}