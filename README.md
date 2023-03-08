# Spike on using the Kolide approach to multi-tenancy

## Domain / implementation

- Set up Company and User many to many, like GRM.
- Add a Project class which belongs to a single Company. I.e. is tenanted.
- Add a ProjectsController to list projects.
- Add seed data for multiple companies.
- Add ‘Kolide classes’, updated to reflect that Company and User are many to many in our model.
- Stub current company / user in controller.
- If you include the Kolide model concern on Project, projects list only includes projects for the current company.
- If there’s no current company you get an error.
- Added an untenanted Stakeholder class, many too many with Projects. (This is a simplification of GRM - here all companies can see all Stakeholders.) Not much to see here, classes are untenanted unless you add the model concern.

—

## Questions

- Should CompanyUser be tenanted? (User can’t be tenanted as has many Companies…)
- Should join tables from tenanted to untenanted e.g. ProjectStakeholders be tenanted? Probably. Note that even if PS is untenanted, you can't use it to get to other tenants projects `ProjectStakeholder.all.map(&:project)` returns nil for other tenant's projects.
- Issues creating / deleting classes with associations to tenanted classes. E.g to delete a Company (untenanted) which has Projects (tenanted) you need to set Current.company, even if there are no Project instances. This is true even if there is no dependent destroy.

## Seeds

- Issues creating / deleting, see above.

## Console

- Article suggests same approach we currently use, not tested yet.

## Tests

- Model test for untenanted create e.g. - Company works with no set up as expected.
- Model test for tenanted create requires Current to be set up.

## Compared to Acts as Tenant

- AaT can use subdomains for tenant name.
- AaT provides methods to set tenants for blocks, like Apartment.
- AaT has convenience validation `validates_uniqueness_to_tenant`
- AaT replaces belongs_to with `acts_as_tenant(:account)`
