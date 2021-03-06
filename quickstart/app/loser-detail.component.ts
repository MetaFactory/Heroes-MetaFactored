import { Component, OnInit }      from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Location }               from '@angular/common';

import { Loser }     from './loser';
import { LoserService }       from './loser.service';

@Component({
  moduleId: module.id,
  selector: 'Loser-detail',
  templateUrl: 'loser-detail.component.html',
  styleUrls: [ 'loser-detail.component.css' ]
})
export class LoserDetailComponent implements OnInit {
  loser: Loser;

  constructor(
    private loserService: LoserService,
    private route: ActivatedRoute,
    private location: Location
  ) {}

  ngOnInit(): void {
    this.route.params.forEach((params: Params) => {
      let id = +params['id'];
      this.loserService.getLoser(id)
        .then(loser => this.loser = loser);
    });
  }

  save(): void {
    this.loserService.update(this.loser)
      .then(() => this.goBack());
  }

  goBack(): void {
    this.location.back();
  }
}
