<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the HTML component file-->
<#--------------------------------------------------------------------------------------------------------------------->

<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign attributes = currentModelObject.getChildren("attribute", nsModel)>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->
<h2>My ${modelObjectNamePL}</h2>
<div>
  <label>${modelObjectName} name:</label> <input #${modelObjectNameFL}Name />
  <button (click)="add(${modelObjectNameFL}Name.value); ${modelObjectNameFL}Name.value=''">
    Add a ${modelObjectName}
  </button>
</div>
<ul class="${modelObjectNamePLFL}">
  <li *ngFor="let ${modelObjectNameFL} of ${modelObjectNamePLFL}" (click)="onSelect(${modelObjectNameFL})"
      [class.selected]="${modelObjectNameFL} === selected${modelObjectName}">
    <#assign attributes = currentModelObject.getChildren("attribute", nsModel)>
    <#list attributes as attribute>
      <#assign attributeName = attribute.getAttributeValue( "name")>
      <#if attributeName == "id">
    <span class="badge">{{${modelObjectNameFL}.${attributeName}}}</span>
      <#else>
    <span>{{${modelObjectNameFL}.${attributeName}}}</span>
      </#if>
    </#list>
    <button class="delete"
      (click)="delete(${modelObjectNameFL}); $event.stopPropagation()">x</button>
  </li>
</ul>
<div *ngIf="selected${modelObjectName}">
  <h2>
    {{selected${modelObjectName}.name | uppercase}} is my ${modelObjectNameFL}
  </h2>
  <button (click)="gotoDetail()">View Details</button>
</div>