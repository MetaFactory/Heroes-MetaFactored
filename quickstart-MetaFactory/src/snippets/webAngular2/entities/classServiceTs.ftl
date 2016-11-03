<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>
import { Injectable }    from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { ${modelObjectName} } from './${modelObjectNameLC}';
<#-- Create the Class imports for the referenced objects in the MetaFactory model. -->
<#--/** Import Angular2 imports for the entity references: */-->
<#assign references = currentModelObject.getChildren("reference", nsModel)>
<#list references as reference>
    <#assign referenceName = reference.getAttributeValue("name")>
    <#assign referenceNameLC = referenceName?lower_case>
    <#assign referenceNameFC = referenceName?cap_first>
import { ${referenceNameFC} } from './${referenceNameLC}';
</#list>

@Injectable()
export class ${modelObjectName}Service {

  private headers = new Headers({'Content-Type': 'application/json'});
  private ${modelObjectNamePLFL}Url = 'app/${modelObjectNamePLFL}';  // URL to web api

  constructor(private http: Http) { }

  get${modelObjectNamePL}(): Promise<${modelObjectName}[]> {
    return this.http.get(this.${modelObjectNamePLFL}Url)
               .toPromise()
               .then(response => response.json().data as ${modelObjectName}[])
               .catch(this.handleError);
  }

  get${modelObjectName}(id: number): Promise<${modelObjectName}> {
    return this.get${modelObjectNamePL}()
               .then(${modelObjectNamePLFL} => ${modelObjectNamePLFL}.find(${modelObjectNameFL} => ${modelObjectNameFL}.id === id));
  }

  delete(id: number): Promise<void> {
    const url = `${dollar}{this.${modelObjectNamePLFL}Url}/${dollar}{id}`;
    return this.http.delete(url, {headers: this.headers})
      .toPromise()
      .then(() => null )
      .catch(this.handleError);
  }

  create(name: string): Promise<${modelObjectName}> {
    return this.http
      .post(this.${modelObjectNamePLFL}Url, JSON.stringify({name: name}), {headers: this.headers})
      .toPromise()
      .then(res => res.json().data)
      .catch(this.handleError);
  }

  update(${modelObjectNameFL}: ${modelObjectName}): Promise<${modelObjectName}> {
    const url = `${dollar}{ this.${modelObjectNamePLFL}Url}/${dollar}{${modelObjectNameFL}.id}`;
    return this.http
      .put(url, JSON.stringify(${modelObjectNameFL}), {headers: this.headers})
      .toPromise()
      .then(() => ${modelObjectNameFL})
      .catch(this.handleError);
  }

  private handleError (error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }
}
