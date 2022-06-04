import { TestBed, inject } from '@angular/core/testing';

import { CustomerService } from './customer.service';

describe('AddCustomerService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CustomerService]
    });
  });

  it('should be created', inject([CustomerService], (service: CustomerService) => {
    expect(service).toBeTruthy();
  }));
});
