<#--stop if $currentModelObject is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context" ></#if>
<#assign modelEntities = currentModelPackage.getChildren("object", nsModel)>
<#global appName = context.getPatternPropertyValue("app.name") >
<#global appTitle = context.getPatternPropertyValue("app.title") >
import { Component }          from '@angular/core';



@Component({
  selector: '${appName}',

  template: `
    <h1>{{title}}</h1>
    <nav>
      <a routerLink="/dashboard" routerLinkActive="active">Dashboard</a>
<#list modelEntities as entity>
    <#assign entityNameLC = entity.getAttributeValue("name")?lower_case>
    <#assign entityNameFU = entity.getAttributeValue("name")?cap_first>
    <#assign entityNameFL = entity.getAttributeValue("name")?uncap_first>
    <#assign entityName   = entity.getAttributeValue("name")>
    <#assign entityNamePL = generator.getElementProperty(entity, "name.plural", "${entityName}s")>
    <#assign entityNamePLFL = entityNamePL?uncap_first>
      <a routerLink="/${entityNamePLFL}" routerLinkActive="active">${entityNamePL}</a>
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