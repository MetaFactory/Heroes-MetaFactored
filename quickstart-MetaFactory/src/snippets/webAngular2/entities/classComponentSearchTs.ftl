<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = generator.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>
import { Component, OnInit } from '@angular/core';
import { Router }            from '@angular/router';
import { Observable }        from 'rxjs/Observable';
import { Subject }           from 'rxjs/Subject';

import { ${modelObjectName}SearchService } from './${modelObjectNameLC}-search.service';
import { ${modelObjectName} } from './${modelObjectNameLC}';

@Component({
  moduleId: module.id,
  selector: '${modelObjectName}-search',
  templateUrl: '${modelObjectNameLC}-search.component.html',
  styleUrls: [ '${modelObjectNameLC}-search.component.css' ],
  providers: [${modelObjectName}SearchService]
})
export class ${modelObjectName}SearchComponent implements OnInit {
  ${modelObjectNamePLFL}: Observable<${modelObjectName}[]>;
  private searchTerms = new Subject<string>();

  constructor(
    private ${modelObjectNameFL}SearchService: ${modelObjectName}SearchService,
    private router: Router) {}

  // Push a search term into the observable stream.
  search(term: string): void {
    this.searchTerms.next(term);
  }

  ngOnInit(): void {
    this.${modelObjectNamePLFL} = this.searchTerms
      .debounceTime(300)        // wait for 300ms pause in events
      .distinctUntilChanged()   // ignore if next search term is same as previous
      .switchMap(term => term   // switch to new observable each time
        // return the http search observable
        ? this.${modelObjectNameFL}SearchService.search(term)
        // or the observable of empty ${modelObjectNamePLFL} if no search term
        : Observable.of<${modelObjectName}[]>([]))
      .catch(error => {
        // TODO: real error handling
        console.log(error);
        return Observable.of<${modelObjectName}[]>([]);
      });
  }

  gotoDetail(${modelObjectNameFL}: ${modelObjectName}): void {
    let link = ['${modelObjectNameFL}-detail', ${modelObjectNameFL}.id];
    this.router.navigate(link);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/