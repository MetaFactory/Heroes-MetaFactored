<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign attributes = currentModelObject.getChildren("attribute", nsModel)>
<h2>My ${modelObjectNamePL}</h2>
<div>
  <label>${modelObjectName} name:</label> <input #${modelObjectNameFL}Name />
  <button (click)="add(${modelObjectNameFL}Name.value); ${modelObjectNameFL}Name.value=''">
    Add
  </button>
</div>
<ul class="${modelObjectNamePLFL}">
  <li *ngFor="let ${modelObjectNameFL} of ${modelObjectNamePLFL}" (click)="onSelect(${modelObjectNameFL})"
      [class.selected]="${modelObjectNameFL} === selected${modelObjectName}">
    <span class="badge">{{${modelObjectNameFL}.id}}</span>
    <span>{{${modelObjectNameFL}.name}}</span>
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


<!--
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
-->