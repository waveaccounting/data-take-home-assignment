
# Wave Analytics Engineer Take Home Task Assignment 
This repository contains a mock dataset designed for use in technical assessments. This Take Home task assignment is the property of Wave Financial Inc., is confidential and is not to be disseminated without Wave Financial Inc.'s prior consent.

The assignment details, outlining what you need to do, were shared with you separately by the Wave recruitment team. This repository includes the dbt project scaffolding and raw data in CSV format, which you are expected to use to complete the assignment tasks.

We expect this portion of the assignment to take about 2-3 hours to complete. This assignment is intended to evaluate your dbt skills and how effectively you work with data.

This dbt project was initially created with DuckDB as the database but encourage applicants to use any database of their choice (see the section below for alternatives).

## Getting started

* Fork this repo into your github account

* Clone the repo to your local machine

```
git clone https://github.com/hiivemarkets/data-tech-interview
Install the requirements
```

### create a virtual environment
```
python3 -m venv venv
source venv/bin/activate
```

### install the requirements
```
pip install -r requirements.txt
```

### Run dbt debug to make sure that all is set:
```
dbt debug
```

Iy you see the message `All checks passed!`, you are good to go


### Seed the starting data:
```
dbt seed
```

Those will be materialized in main schema in the database, e.g `main.transaction_termination_reasons_seed`.


### Working with other databases
If you want to work with other databases, you can do that by changing two things:

Install required adapter, e.g. for Postgres:

```
pip install dbt-postgres
```

Change the database connection in the `profiles.yml` file. You can find more information on how to do this in the [dbt documentation](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml).

**Important** Don't commit your database credentials to the repository!

### Data description
You can read more about the input data in the [data set description file](dataset_description.md).