<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameFU = object.getAttributeValue("name")?uncap_first>
    <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${object}s")>
    <#assign objectNamePLFL = objectNamePL?uncap_first>
<h3>Top ${objectNamePL}</h3>
<div class="grid grid-pad">
  <div *ngFor="let ${objectNameFU} of ${objectNamePLFL}" (click)="gotoDetail${objectName}(${objectNameFU})" class="col-1-4">
    <div class="module ${objectNameFU}">
      <h4>{{${objectNameFU}.name}}</h4>
    </div>
  </div>
</div>
<${objectName}-search></${objectName}-search>
</#list>


<!--
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
-->