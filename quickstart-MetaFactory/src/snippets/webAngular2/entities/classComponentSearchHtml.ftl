<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the HTML search file-->
<#--------------------------------------------------------------------------------------------------------------------->

<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->
<div id="search-component">
  <h4>${modelObjectName} Search</h4>
  <input #searchBox id="search-box" (keyup)="search(searchBox.value)" />
  <div>
    <div *ngFor="let ${modelObjectNameFL} of ${modelObjectNamePLFL} | async"
         (click)="gotoDetail(${modelObjectNameFL})" class="search-result" >
      <#assign comboAttributes = metafactory.findChildrenByProperty(currentModelObject, "attribute", "gui.show.in.combo")>
      <#list comboAttributes as comboAttribute>
        <#assign comboAttributeName = comboAttribute.getAttributeValue("name")?uncap_first>
          {{${modelObjectNameFL}.${comboAttributeName}}}<#sep>, </#sep>
      </#list>
    </div>
  </div>
</div>