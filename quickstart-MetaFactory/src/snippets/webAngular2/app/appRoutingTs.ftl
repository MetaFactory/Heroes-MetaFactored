<#--stop if $currentModelObject is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context" ></#if>
<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DashboardComponent }  from './dashboard.component';
<#-- Create the Component imports for the objects in the MetaFactory model. -->
<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
    <#assign objectNameFU = object.getAttributeValue("name")?cap_first>
    <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${objectName}s")>
    <#assign objectNamePLLC = objectNamePL?lower_case>
import { ${objectNamePL}Component }       from './${objectNamePLLC}.component';
import { ${objectName}SearchComponent }   from './${objectNameLC}-search.component';
import { ${objectName}DetailComponent }   from './${objectNameLC}-detail.component';
</#list>

const appRoutes: Routes = [
  {
    path: '',
    redirectTo: '/dashboard',
    pathMatch: 'full'
  },
  {
    path: 'dashboard',
    component: DashboardComponent
  },
<#--Add the component routes for the objectDetailComponent, objectDialogComponent and objectsComponent -->
<#list modelObjects as object>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
    <#assign objectNameFU = object.getAttributeValue("name")?cap_first>
    <#assign objectNameFL = object.getAttributeValue("name")?uncap_first>
    <#assign objectName   = object.getAttributeValue("name")>
    <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${objectName}s")>
    <#assign objectNamePLFL = objectNamePL?uncap_first>
   {
    path: '${objectNameFL}-search/:id',     // id of the single selected object.
    component: ${objectNameFU}SearchComponent
  },{
    path: '${objectNameFL}-detail/:id',     // id of the single selected object.
    component: ${objectNameFU}DetailComponent
  }, {
    path: '${objectNamePLFL}',
    component: ${objectNamePL}Component
  },
</#list>
];
export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/