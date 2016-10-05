<#--stop if $currentModelObject is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context" ></#if>
<#assign modelEntities = currentModelPackage.getChildren("object", nsModel)>
import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DashboardComponent }  from './dashboard.component';
<#-- Create the Component imports for the objects in the MetaFactory model. -->
<#list modelEntities as entity>
    <#assign entityName = entity.getAttributeValue("name")>
    <#assign entityNameLC = entity.getAttributeValue("name")?lower_case>
    <#assign entityNameFU = entity.getAttributeValue("name")?cap_first>
    <#assign entityNamePL = generator.getElementProperty(entity, "name.plural", "${entityName}s")>
    <#assign entityNamePLLC = entityNamePL?lower_case>
import { ${entityNamePL}Component }       from './${entityNamePLLC}.component';
import { ${entityName}DetailComponent }   from './${entityNameLC}-detail.component';
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
<#list modelEntities as entity>
    <#assign entityNameLC = entity.getAttributeValue("name")?lower_case>
    <#assign entityNameFU = entity.getAttributeValue("name")?cap_first>
    <#assign entityNameFL = entity.getAttributeValue("name")?uncap_first>
    <#assign entityName   = entity.getAttributeValue("name")>
    <#assign entityNamePL = generator.getElementProperty(entity, "name.plural", "${entityName}s")>
    <#assign entityNamePLFL = entityNamePL?uncap_first>
   {
    <#--path: '${entityNameLC}-detail/:id',     // id of the single selected entity.-->
    path: 'detail/:id',     // id of the single selected entity.
    component: ${entityNameFU}DetailComponent
  }, {
    path: '${entityNamePLFL}',
    component: ${entityNamePL}Component
  },
</#list>
];
export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/