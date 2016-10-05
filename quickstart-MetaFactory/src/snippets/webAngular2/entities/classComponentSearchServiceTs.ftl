<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = generator.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>

import { Injectable }     from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs';

import { ${modelObjectName} }           from './${modelObjectNameLC}';

@Injectable()
export class ${modelObjectName}SearchService {

  constructor(private http: Http) {}

  search(term: string): Observable<${modelObjectName}[]> {
    return this.http
               .get(`app/${modelObjectNamePLFL}/?name=${dollar}{term}`)
               .map((r: Response) => r.json().data as ${modelObjectName}[]);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/