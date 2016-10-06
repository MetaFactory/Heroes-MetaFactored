<#--stop if currentModelPackage is null-->
<#if !(currentModelPackage)??>  <#stop "currentModelPackage not found in context" ></#if>
<#assign modelObjects = currentModelPackage.getChildren("object", nsModel)>

import { InMemoryDbService } from 'angular-in-memory-web-api';
export class InMemoryDataService implements InMemoryDbService {
  createDb() {
<#list modelObjects as object>
    <#assign objectName = object.getAttributeValue("name")>
    <#assign objectNameLC = object.getAttributeValue("name")?lower_case>
    <#assign objectNameFU = object.getAttributeValue("name")?cap_first>
    <#assign objectNamePL = generator.getElementProperty(object, "name.plural", "${objectName}s")>
    <#assign objectNamePLLC = objectNamePL?lower_case>
    let ${objectNamePLLC} = [
      {id: 11, name: 'Mr. Nice'},
      {id: 12, name: 'Narco'},
      {id: 13, name: 'Bombasto'},
      {id: 14, name: 'Celeritas'},
      {id: 15, name: 'Magneta'},
      {id: 16, name: 'RubberMan'},
      {id: 17, name: 'Dynama'},
      {id: 18, name: 'Dr IQ'},
      {id: 19, name: 'Magma'},
      {id: 20, name: 'Tornado'}
    ];
</#list>
<#list modelObjects as object>
    <#assign numberObjects = modelObjects.size()>
    <#assign objectNamePL = generator.getElementProperty(object, "name.plural")>
    <#assign objectNamePLLC = objectNamePL?lower_case><#if object_index == 0>    return {</#if><#if object_index == numberObjects-1>${objectNamePLLC}};<#else>${objectNamePLLC},</#if></#list>
    }
}





/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/


    <#--createDb() {-->
        <#--let heroes = [-->
            <#--{id: 11, name: 'Mr. Nice'},-->
            <#--{id: 12, name: 'Narco'},-->
            <#--{id: 13, name: 'Bombasto'},-->
            <#--{id: 14, name: 'Celeritas'},-->
            <#--{id: 15, name: 'Magneta'},-->
            <#--{id: 16, name: 'RubberMan'},-->
            <#--{id: 17, name: 'Dynama'},-->
            <#--{id: 18, name: 'Dr IQ'},-->
            <#--{id: 19, name: 'Magma'},-->
            <#--{id: 20, name: 'Tornado'}-->
        <#--];-->
        <#--let losers = [-->
            <#--{id: 11, name: 'A'},-->
            <#--{id: 12, name: 'B'},-->
            <#--{id: 13, name: 'C'},-->
            <#--{id: 14, name: 'D'},-->
            <#--{id: 15, name: 'E'},-->
            <#--{id: 16, name: 'F'},-->
            <#--{id: 17, name: 'G'},-->
            <#--{id: 18, name: 'H'},-->
            <#--{id: 19, name: 'I'},-->
            <#--{id: 20, name: 'J'}-->
        <#--];-->
        <#--return {heroes, losers};-->
    <#--}-->