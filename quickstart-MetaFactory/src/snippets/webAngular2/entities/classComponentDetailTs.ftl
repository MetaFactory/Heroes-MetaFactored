<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>
<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>
import { Component, OnInit }      from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Location }               from '@angular/common';

import { ${modelObjectName} }        from './${modelObjectNameLC}';
import { ${modelObjectName}Service } from './${modelObjectNameLC}.service';

@Component({
  moduleId: module.id,
  selector: '${modelObjectName}-detail',
  templateUrl: '${modelObjectNameLC}-detail.component.html',
  styleUrls: [ '${modelObjectNameLC}-detail.component.css' ]
})
export class ${modelObjectName}DetailComponent implements OnInit {
  ${modelObjectNameLC}: ${modelObjectName};

  constructor(
    private ${modelObjectNameLC}Service: ${modelObjectName}Service,
    private route: ActivatedRoute,
    private location: Location
  ) {}

  ngOnInit(): void {
    this.route.params.forEach((params: Params) => {
      let id = +params['id'];
      this.${modelObjectNameLC}Service.get${modelObjectName}(id)
        .then(${modelObjectNameLC} => this.${modelObjectNameLC} = ${modelObjectNameLC});
    });
  }

  save(): void {
    this.${modelObjectNameLC}Service.update(this.${modelObjectNameLC})
      .then(() => this.goBack());
  }

  goBack(): void {
    this.location.back();
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/