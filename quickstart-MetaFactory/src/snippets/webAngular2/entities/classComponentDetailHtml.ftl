<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the HTML details file-->
<#--------------------------------------------------------------------------------------------------------------------->

<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->
<div *ngIf="${modelObjectNameFL}">
  <h2>{{${modelObjectNameFL}.name}} details!</h2>
<#assign attributes = currentModelObject.getChildren("attribute", nsModel)>
<#list attributes as attribute>
  <#assign attributeName = attribute.getAttributeValue( "name")>
  <#if attributeName == "id">
      <div><label>id: </label>{{${modelObjectNameFL}.id}}</div>
  <#else>
      <div>
          <label>${attributeName}: </label>
          <input [(ngModel)]="${modelObjectNameFL}.${attributeName}" placeholder="${attributeName}" />
      </div>
  </#if>
</#list>

  <button (click)="goBack()">Back</button>
  <button (click)="save()">Save</button>
</div>