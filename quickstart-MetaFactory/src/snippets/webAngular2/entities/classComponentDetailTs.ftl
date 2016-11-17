<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the TypeScript details component file-->
<#--------------------------------------------------------------------------------------------------------------------->

<#--import naming.ftl so that code completion is available in this particular freemarker template-->
<#import "/webAngular2/util/naming.ftl" as naming />

<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNameLC = modelObjectName?lower_case>
<#assign tsServiceName = naming.getTSServiceName(modelObjectName)>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->
import { Component, OnInit }      from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Location }               from '@angular/common';

import { ${modelObjectName} }     from './${modelObjectNameLC}';
import { ${tsServiceName} }       from './${modelObjectNameLC}.service';

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