<#--stop if $currentModelPackage is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context"> </#if>

<#--import naming.ftl so that code completion is available in this particular freemarker template-->
<#import "/webAngular2/util/naming.ftl" as naming />

<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>
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
<#-- Create the Component imports for all the objects in the MetaFactory model. -->
<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
    <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${objectName}s")>
    <#assign objectNamePLLC = objectNamePL?lower_case>
import { ${objectNamePL}Component }           from './${objectNamePLLC}.component';
import { ${objectName}DetailComponent }   from './${objectNameLC}-detail.component';
import { ${objectName}Service }           from './${objectNameLC}.service';
import { ${objectName}SearchComponent }   from './${objectNameLC}-search.component';
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
        <#-- Declare the Components for all the objects in the MetaFactory model. -->
        <#list modelObjects as object>
            <#assign objectName = object.getAttributeValue("name")>
            <#assign objectNamePL = metafactory.getElementProperty(object, "name.plural", "${objectName}s")>
        ${objectName}DetailComponent,
        ${objectNamePL}Component,
        ${objectName}SearchComponent,
        </#list>
    ],
    providers: [
        <#-- Add the providers for all the objects in the MetaFactory model. -->
        <#list modelObjects as object>
            <#assign objectName = object.getAttributeValue("name")>
            <#assign serviceName = naming.getTSServiceName(objectName)>
        ${serviceName},
        </#list>
    ],
    bootstrap:    [
        AppComponent
    ]
})


export class AppModule {

}