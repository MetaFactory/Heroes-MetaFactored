<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>
<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
<div *ngIf="${modelObjectNameFL}">
  <h2>{{${modelObjectNameFL}.name}} details!</h2>
  <div>
    <label>id: </label>{{${modelObjectNameFL}.id}}</div>
  <div>
    <label>name: </label>
    <input [(ngModel)]="${modelObjectNameFL}.name" placeholder="name" />
   </div>
  <button (click)="goBack()">Back</button>
  <button (click)="save()">Save</button>
</div>


<!--
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
-->