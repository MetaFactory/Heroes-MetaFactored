<#assign modelEntities = currentModelPackage.getChildren("object", nsModel)>
import './rxjs-extensions';

import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule }   from '@angular/forms';
import { HttpModule }    from '@angular/http';

// Imports for loading & configuring the in-memory web api
import { InMemoryWebApiModule } from 'angular-in-memory-web-api';
import { InMemoryDataService }  from './in-memory-data.service';

import { AppComponent }         from './app.component';
import { DashboardComponent }   from './dashboard.component';
<#-- Create the Component imports for the objects in the MetaFactory model. -->
<#list modelEntities as entity>
    <#assign entityName = entity.getAttributeValue("name")>
    <#assign entityNameLC = entity.getAttributeValue("name")?lower_case>
    <#assign entityNameFU = entity.getAttributeValue("name")?cap_first>
    <#assign entityNamePL = generator.getElementProperty(entity, "name.plural", "${entityName}s")>
    <#assign entityNamePLLC = entityNamePL?lower_case>
import { ${entityNamePL}Component }           from './${entityNamePLLC}.component';
import { ${entityName}DetailComponent }   from './${entityNameLC}-detail.component';
import { ${entityName}Service }           from './${entityNameLC}.service';
import { ${entityName}SearchComponent }   from './${entityNameLC}-search.component';
</#list>
import { routing }              from './app.routing';


<#-- Insert the Components and Services for the objects of the MetaFactory mode. -->
@NgModule({
    imports:      [
        BrowserModule,
        FormsModule,
        HttpModule,
        InMemoryWebApiModule.forRoot(InMemoryDataService),
        routing
    ],
    declarations: [
        AppComponent,
        DashboardComponent,
        <#list modelEntities as entity>
            <#assign entityName = entity.getAttributeValue("name")>
            <#assign entityNamePL = generator.getElementProperty(entity, "name.plural", "${entityName}s")>
        ${entityName}DetailComponent,
        ${entityNamePL}Component,
        ${entityName}SearchComponent,
        </#list>
    ],
    providers: [
        <#list modelEntities as entity>
            <#assign entityName = entity.getAttributeValue("name")>
        ${entityName}Service,
        </#list>
    ],
    bootstrap:    [
        AppComponent
    ]
})


export class AppModule {

}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/