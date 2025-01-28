# Wave Analytics Engineer Take Home Assignment 
This repository contains a mock dataset designed for use in the technical assessments portion of the interview process. This Take Home Assignment is the property of Wave Financial Inc., is confidential and is not to be disseminated without Wave Financial Inc.'s prior consent.

The assignment details, outlining what you need to do, were shared with you separately by Wave's recruitment team. This repository includes the dbt project scaffolding and raw data in CSV format. You are expected to use them to complete the assignment.

We expect this portion of the assignment to take approximetely 2-3 hours to complete. This assignment is intended to evaluate your dbt skills and how effectively you work with data.

This dbt project was initially created with DuckDB as the database but we encourage applicants to use any database of their choice (see the section below for alternatives).

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

If you see the message `All checks passed!`, you are good to go


### Seed the starting data:
```
dbt seed
```

Those will be materialized in the main schema in the database, e.g `main.transaction_termination_reasons_seed`.


### Optional - Working with other databases
If you wish to work with other databases, you can do that by changing two things:

Install required adapter, e.g. Postgres:

```
pip install dbt-postgres
```

Change the database connection in the `profiles.yml` file. You can find more information on how to do this in the [dbt documentation](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml).

**Important** DO NOT commit your database credentials to the repository!

### Data description
You can read more about the input data in the [data set description file](dataset_description.md).