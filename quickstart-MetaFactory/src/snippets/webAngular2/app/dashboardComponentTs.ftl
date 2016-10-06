<#--stop if currentModelPackage is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context" ></#if>
<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
import { Component, OnInit } from '@angular/core';
import { Router }            from '@angular/router';

<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
import { ${objectName} }        from './${objectNameLC}';
import { ${objectName}Service } from './${objectNameLC}.service';
</#list>

@Component({
  moduleId: module.id,
  selector: 'my-dashboard',
  templateUrl: 'dashboard.component.html',
  styleUrls: [ 'dashboard.component.css' ]
})
export class DashboardComponent implements OnInit {
<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
    <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${object}s")>
    <#assign objectNamePLFL = objectNamePL?uncap_first>
  ${objectNamePLFL}: ${objectName}[] = [];
</#list>

  constructor(
    private router: Router,
<#list modelObjects as object>
    <#assign numberObjects = modelObjects.size()>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameFU = object.getAttributeValue("name")?uncap_first>
    private ${objectNameFU}Service: ${objectName}Service<#if object_index == numberObjects-1>) {<#else >,</#if>
</#list>
  }

  ngOnInit(): void {
<#list modelObjects as object>
    <#assign objectNameFU = object.getAttributeValue("name")?uncap_first>
    <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${object}s")>
    <#assign objectNamePLFL = objectNamePL?uncap_first>
    this.${objectNameFU}Service.get${objectNamePL}()
      .then(${objectNamePLFL} => this.${objectNamePLFL} = ${objectNamePLFL}.slice(1, 5));
</#list>
  }

<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameFU = object.getAttributeValue("name")?uncap_first>
  gotoDetail${objectName}(${objectNameFU}: ${objectName}): void {
    let link = ['${objectNameFU}-detail', ${objectNameFU}.id];
    this.router.navigate(link);
  }

</#list>
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/