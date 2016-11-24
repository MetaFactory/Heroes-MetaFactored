# Heroes-MetaFactored

## Introduction

[MetaFactory](http://www.metafactory.nl) is a code generator. It was used to generate the code that is similar to the
[Angular2 Heroes](https://angular.io/docs/ts/latest/tutorial/) application. This github repository can be cloned to
see which patterns (code instructions) were written to generate the Heroes application.

A [blog](https://www.metafactory.nl/angular-2-tour-of-heroes-and-metafactory/) about the MetaFactoring of the Tour of Heroes is available on the MetaFactory website: [Angular 2 Tour of Heroes and MetaFactory](https://www.metafactory.nl/angular-2-tour-of-heroes-and-metafactory/) .  

## How to install

In order to generate the resulting code base we need the tool MetaFactory for which we also created a plugin for IntelliJ.
Please [leave us an email](mailto:info@metafactory.nl?subject=Request%20for%20MetaFactory%20download%20from%20github) and we will send you the tool and plugin so you can play with it.

Unfortunately there is not yet a downloadable version available, but this is on our shortlist to introduce.

Once you obtained MetaFactory and the IntelliJ plugin, the project needs to be setup.

* clone this github repository
* open IntelliJ and create new project from existing sources
* go to project structure and add 2 new modules:
  * quickstart
  * quickstart-MetaFactory
* mark quickstart-MetaFactory as MetaFactory module
* mark quickstart/snippets directory as sources

## How to run

In order to generate the application with MetaFactory first the following steps has to be taken:

* cd to Heroes-MetaFactored\quickstart
* npm install
* npm run typings install

When this is successful without Errors the application can be generated with MetaFactory.

After generation the application can be executed by:

* cd to Heroes-MetaFactored\quickstart
* npm start

