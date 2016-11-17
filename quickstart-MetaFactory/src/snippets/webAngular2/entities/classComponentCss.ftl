<#--------------------------------------------------------------------------------------------------------------------->
<#--Generates the CSS component file-->
<#--------------------------------------------------------------------------------------------------------------------->
<#if !(currentModelObject)??>  <#stop "currentModelObject not found in context" ></#if>

<#assign modelObjectName = currentModelObject.getAttributeValue("name")>
<#assign modelObjectNamePL = metafactory.getElementProperty(currentModelObject, "name.plural", "${modelObjectName}s")>
<#assign modelObjectNamePLFL = modelObjectNamePL?uncap_first>

<#--------------------------------------------------------------------------------------------------------------------->
<#--freemarker output logic from here-->
<#--------------------------------------------------------------------------------------------------------------------->
.selected {
  background-color: #CFD8DC !important;
  color: white;
}
.${modelObjectNamePLFL} {
  margin: 0 0 2em 0;
  list-style-type: none;
  padding: 0;
  width: 35em;
}
.${modelObjectNamePLFL} li {
  cursor: pointer;
  position: relative;
  left: 0;
  background-color: #EEE;
  margin: .5em;
  padding: .3em 0;
  height: 1.6em;
  border-radius: 4px;
}
.${modelObjectNamePLFL} li:hover {
  color: #607D8B;
  background-color: #DDD;
  left: .1em;
}
.${modelObjectNamePLFL} li.selected:hover {
  background-color: #BBD8DC !important;
  color: white;
}
.${modelObjectNamePLFL} .text {
  position: relative;
  top: -3px;
}
.${modelObjectNamePLFL} .badge {
  display: inline-block;
  font-size: small;
  color: white;
  padding: 0.8em 0.7em 0 0.7em;
  background-color: #607D8B;
  line-height: 1em;
  position: relative;
  left: -1px;
  top: -4px;
  height: 1.8em;
  margin-right: .8em;
  border-radius: 4px 0 0 4px;
}
button {
  font-family: Arial;
  background-color: #eee;
  border: none;
  padding: 5px 10px;
  border-radius: 4px;
  cursor: pointer;
  cursor: hand;
}
button:hover {
  background-color: #cfd8dc;
}
button.delete {
  float:right;
  margin-top: 2px;
  margin-right: .8em;
  background-color: gray !important;
  color:white;
}