<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>
<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
<div id="search-component">
  <h4>${modelObjectName} Search</h4>
  <input #searchBox id="search-box" (keyup)="search(searchBox.value)" />
  <div>
    <div *ngFor="let ${modelObjectNameFL} of ${modelObjectNamePLFL} | async"
         (click)="gotoDetail(${modelObjectNameFL})" class="search-result" >
      {{${modelObjectNameFL}.name}}
    </div>
  </div>
</div>


<!-- 
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
-->