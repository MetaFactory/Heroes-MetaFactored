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
import { HeroesComponent }           from './heroes.component';
import { HeroDetailComponent }   from './hero-detail.component';
import { HeroService }           from './hero.service';
import { HeroSearchComponent }   from './hero-search.component';
import { LosersComponent }           from './losers.component';
import { LoserDetailComponent }   from './loser-detail.component';
import { LoserService }           from './loser.service';
import { LoserSearchComponent }   from './loser-search.component';
import { routing }              from './app.routing';


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
        HeroDetailComponent,
        HeroesComponent,
        HeroSearchComponent,
        LoserDetailComponent,
        LosersComponent,
        LoserSearchComponent,
    ],
    providers: [
        HeroService,
        LoserService,
    ],
    bootstrap:    [
        AppComponent
    ]
})


export class AppModule {

}
