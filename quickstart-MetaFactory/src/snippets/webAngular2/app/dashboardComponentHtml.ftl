<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
<#list modelObjects as modelObject>
    <#assign modelObjectName = modelObject.getAttributeValue("name")>
    <#assign modelObjectNameFU = modelObject.getAttributeValue("name")?uncap_first>
    <#assign modelObjectNamePL = metafactory.getElementProperty(modelObject, "name.plural", "${modelObject}s")>
    <#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<h3>Top ${modelObjectNamePL}</h3>
<div class="grid grid-pad">
  <div *ngFor="let ${modelObjectNameFU} of ${modelObjectNamePLFL}" (click)="gotoDetail${modelObjectNameFU}(${modelObjectNameFU})" class="col-1-4">
    <div class="module ${modelObjectNameFU}">
      <h4>{{${modelObjectNameFU}.name}}</h4>
    </div>
  </div>
</div>
<${modelObjectNameFU}-search></${modelObjectNameFU}-search>
</#list>


<!--
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
-->