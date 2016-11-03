<#--stop if $currentModelObject is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context" ></#if>
<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
<#global appName = context.getPatternPropertyValue("app.name") >
<#global appTitle = context.getPatternPropertyValue("app.title") >
import { Component }          from '@angular/core';



@Component({
  selector: '${appName}',

  template: `
    <h1>{{title}}</h1>
    <nav>
      <a routerLink="/dashboard" routerLinkActive="active">Dashboard</a>
        <#--For every object in the model make a link to the component.-->
<#list modelObjects as object>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
    <#assign objectNameFU = object.getAttributeValue("name")?cap_first>
    <#assign objectNameFL = object.getAttributeValue("name")?uncap_first>
    <#assign objectName   = object.getAttributeValue("name")>
    <#assign objectNamePL = generator.getElementProperty(object, "name.plural", "${objectName}s")>
    <#assign objectNamePLFL = objectNamePL?uncap_first>
      <a routerLink="/${objectNamePLFL}" routerLinkActive="active">${objectNamePL}</a>
</#list>
    </nav>
    <router-outlet></router-outlet>
  `,
  styleUrls: ['app/app.component.css']
})

export class AppComponent {
    title = '${appTitle}';
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/