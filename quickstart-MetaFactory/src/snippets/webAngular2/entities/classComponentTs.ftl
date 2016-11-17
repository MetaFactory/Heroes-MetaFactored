<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the TypeScript component file-->
<#--------------------------------------------------------------------------------------------------------------------->

<#--stop if $currentModelObject is null-->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNameFL = modelObjectName?uncap_first>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>
<#assign modelObjectNameLC = modelObjectName?lower_case>
<#assign attributes = currentModelObject.getChildren("attribute", nsModel)>
<#assign references = currentModelObject.getChildren("reference", nsModel)>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->
import { Component, OnInit} from '@angular/core';
import { Router }           from '@angular/router';

<#-- Create the Component imports for the objects in the MetaFactory model. -->
import { ${modelObjectName} }                from './${modelObjectNameLC}';
import { ${modelObjectName}Service }         from './${modelObjectNameLC}.service';

@Component({
  moduleId: module.id,
  selector: 'my-${modelObjectNamePLFL}',
  templateUrl: '${modelObjectNamePLFL}.component.html',
  styleUrls: [ '${modelObjectNamePLFL}.component.css' ]
})
export class ${modelObjectNamePL}Component implements OnInit {
  ${modelObjectNamePLFL}: ${modelObjectName}[];
  selected${modelObjectName}: ${modelObjectName};

  constructor(
    private ${modelObjectNameFL}Service: ${modelObjectName}Service,
    private router: Router) { }

  get${modelObjectNamePL}(): void {
    this.${modelObjectNameFL}Service
        .get${modelObjectNamePL}()
        .then(${modelObjectNamePLFL} => this.${modelObjectNamePLFL} = ${modelObjectNamePLFL});
  }

  add(name: string): void {
    name = name.trim();
    if (!name) { return; }
    this.${modelObjectNameFL}Service.create(name)
      .then(${modelObjectNameFL} => {
        this.${modelObjectNamePLFL}.push(${modelObjectNameFL});
        this.selected${modelObjectName} = null;
      });
  }

  delete(${modelObjectNameFL}: ${modelObjectName}): void {
    this.${modelObjectNameFL}Service
        .delete(${modelObjectNameFL}.id)
        .then(() => {
          this.${modelObjectNamePLFL} = this.${modelObjectNamePLFL}.filter(h => h !== ${modelObjectNameFL});
          if (this.selected${modelObjectName} === ${modelObjectNameFL}) { this.selected${modelObjectName} = null; }
        });
  }

  ngOnInit(): void {
    this.get${modelObjectNamePL}();
  }

  onSelect(${modelObjectNameFL}: ${modelObjectName}): void {
    this.selected${modelObjectName} = ${modelObjectNameFL};
  }

  gotoDetail(): void {
    this.router.navigate(['${modelObjectNameFL}-detail', this.selected${modelObjectName}.id]);
  }
}