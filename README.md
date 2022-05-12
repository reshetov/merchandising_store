### Description

Test merchandising store implementation. Includes two models **Product** and **Discount** and also small REST API to interact with application.

### Required

- Github
- Ruby 3.1.2 or more

### Installation
#### 1. Clone the project
```bash
git clone git@github.com:organization/project-name.git
```
#### 2. Create database.yml file
```bash
cp config/database.yml.example config/database.yml
```
#### 3. Install required gems
```bash
bundle install
```
#### 4. Create and setup database
```bash
bundle exec rake db:create db:setup
```
#### 5. Start Rails server
```bash
bundle exec rails s
```

### API endpoinds
#### Get available products
```bash
curl http://localhost:3000/products -H 'Content-Type: application/json'
```
#### Get filtered by code/name products
```bash
curl http://localhost:3000/products?q=hoo -H 'Content-Type: application/json'
```
#### Update product by ID
```bash
curl -X PATCH 'http://localhost:3000/products/<product id>' -H 'Content-Type: application/json' -d '{"price": "6.7"}'
```
  - **\<product id\>** - ID of the updated product
#### Get total amount list of products
```bash
curl 'http://localhost:3000/products/total?items[<productId1>]=<productQuantity1>&items[<productId2>]=<productQuantity2>' -H 'Content-Type: application/json'
```
  - **\<productId\>** - product ID in list
  -** \<productQuantity\>** - quantity of product in list
#### Get total amount list of products with discount
```bash
curl 'http://localhost:3000/products/total?discount=1&items[<productId1>]=<productQuantity1>&items[<productId2>]=<productQuantity2>' -H 'Content-Type: application/json'
```
  - **\<productId\>** - product ID in list
  -** \<productQuantity\>** - quantity of product in list

### Tests
#### Run application tests
```bash
bundle exec rspec
```
