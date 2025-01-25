
## Data Set Details: 

This dummy data is a representation of subscribers to a subscription product. The data also includes dummy information on the business customers purchasing the subscription. Please be sure to outline any assumptions made when modelling the data and preparing the presentation.

Note that in the dataset, monthly subscriptions are represented by the latest instance of the monthly subscription. Assume for monthly subscriptions that the first monthly subscription instance was created at the ‘subscription_created_at’ date and that the customer has subscribed up until the point the data was extracted around June 2024, with the ‘subscription_current_term_end’ when their subscription is set to renew or expire.

The ‘Premium’ subscription is available to purchase via the web and mobile app (Apple App Store and Google Play Store), with options to subscribe monthly or annually. A subscription is considered active if it has not been cancelled.

Subscriptions can have three statuses: Active, Non-Renewing (the business still has access to all subscription features, but has turned off auto-renew), or Cancelled (the business no longer has access to subscription features).

Businesses signing up for subscriptions can have a ‘product permutation’ based on which products they have previously used within the app: Accounting, Invoicing, Payments, and/or Payroll in the order in which each product was used.

---

## Data Glossary 

### Table: `business`
The `business` table has records about each business who is subscribed to *Surf*s product, it has the following colimns:

| Column Name        | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `id`               | A unique identifier for each business record.                              |
| `create_date`      | The date when the business record was created.                             |
| `country`          | The country where the business is located.                                 |
| `organizational_type` | The category of the organization's structure. |
| `type`             | The primary classification of the business.          |
| `subtype`          | A more specific classification within the primary business type.           |


---

### Table: `subscription_items`

The `subscription_items` table captures details about the individual subscription plan, including their unit type, billing cycle, and pricing.

| Column Name           | Description                                                                   |
|-----------------------|-------------------------------------------------------------------------------|
| `id`                 | A unique identifier for each subscription item record (subscription plan).                       |
| `unit_type`          | The subscription plan.        |
| `billing_period_unit` | The unit of time for the billing period (month or year).                 |
| `unit_price`         | The price charged at this subscription plan.                                          |

---
### Table: `subscriptions`

The `subscriptions` table provides detailed information about customer subscriptions, including their business association, purchase details, term periods, and status.

| Column Name               | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `id`                      | A unique identifier for each subscription.                          |
| `business_id`             | Linking the subscription to a business.              |
| `purchase_channel`        | The channel through which the subscription was purchased (e.g., Apple App Store, Google Play Store). |
| `created_at`              | The date and time when the subscription was created.                       |
| `subscription_plan`       | The subscription plan ID and the currency code used in this subscription (e.g., USD, CAD).              |
| `current_term_start`      | The start date of the current subscription term.                           |
| `current_term_end`        | The end date of the current subscription term.                             |
| `exchange_rate`           | The exchange rate applied for currency conversion, if applicable.          |
| `status`                  | The current status of the subscription (e.g., active, cancelled).          |
| `cancel_schedule_created_at` | The date when the subscription cancellation was scheduled, if applicable. |
| `cancelled_at`            | The date when the subscription was cancelled, if applicable.               |
