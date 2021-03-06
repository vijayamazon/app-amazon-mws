# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table amazon_order (
  id                        bigint auto_increment not null,
  amazon_order_id           varchar(255) not null,
  seller_order_id           varchar(255),
  purchase_date             varchar(255),
  last_update_date          varchar(255) not null,
  order_status              varchar(255),
  fulfillment_channel       varchar(255),
  sales_channel             varchar(255),
  order_channel             varchar(255),
  ship_service_level        varchar(255),
  name                      varchar(255),
  address_line1             varchar(255),
  address_line2             varchar(255),
  address_line3             varchar(255),
  city                      varchar(255),
  county                    varchar(255),
  district                  varchar(255),
  state_or_region           varchar(255),
  postal_code               varchar(255),
  country_code              varchar(255),
  phone                     varchar(255),
  currency_code             varchar(255),
  amount                    varchar(255),
  number_of_items_shipped   varchar(255),
  number_of_items_unshipped varchar(255),
  payment_execution_detail  varchar(255),
  payment_method            varchar(255),
  marketplace_id            varchar(255),
  buyer_email               varchar(255),
  buyer_name                varchar(255),
  shipment_service_level_category varchar(255),
  shipped_by_amazon_tfm     varchar(255),
  tfm_shipment_status       varchar(255),
  cba_displayable_shipping_label varchar(255),
  order_type                varchar(255),
  earliest_ship_date        varchar(255),
  latest_ship_date          varchar(255),
  earliest_delivery_date    varchar(255),
  latest_delivery_date      varchar(255),
  is_business_order         varchar(255),
  is_premium_order          varchar(255),
  is_prime                  varchar(255),
  mws_response              varchar(2000) not null,
  app_name                  varchar(255) not null,
  status                    integer,
  is_handle                 tinyint(1) default 0,
  created_at                datetime,
  updated_at                datetime not null,
  constraint ck_amazon_order_status check (status in (0,1,2)),
  constraint pk_amazon_order primary key (id))
;

create table amazon_order_item (
  id                        bigint auto_increment not null,
  asin                      varchar(255),
  seller_sku                varchar(255),
  order_item_id             varchar(255),
  title                     varchar(2000),
  quantity_ordered          varchar(255),
  quantity_shipped          varchar(255),
  item_price_currency_code  varchar(255),
  item_price_amount         varchar(255),
  shipping_price_currency_code varchar(255),
  shipping_price_amount     varchar(255),
  gift_wrap_price_currency_code varchar(255),
  gift_wrap_price_amount    varchar(255),
  item_tax_currency_code    varchar(255),
  item_tax_amount           varchar(255),
  shipping_tax_currency_code varchar(255),
  shipping_tax_amount       varchar(255),
  gift_wrap_tax_currency_code varchar(255),
  gift_wrap_tax_amount      varchar(255),
  shipping_discount_currency_code varchar(255),
  shipping_discount_amount  varchar(255),
  promotion_discount_currency_code varchar(255),
  promotion_discount_amount varchar(255),
  promotion_ids             varchar(255),
  cod_fee_currency_code     varchar(255),
  cod_fee_amount            varchar(255),
  cod_fee_discount_currency_code varchar(255),
  cod_fee_discount_amount   varchar(255),
  gift_message_text         varchar(255),
  gift_wrap_level           varchar(255),
  invoice_data_invoice_requirement varchar(255),
  invoice_data_buyer_selected_invoice_category varchar(255),
  invoice_data_invoice_title varchar(255),
  invoice_data_invoice_information varchar(255),
  condition_note            varchar(255),
  condition_id              varchar(255),
  condition_subtype_id      varchar(255),
  scheduled_delivery_start_date varchar(255),
  scheduled_delivery_end_date varchar(255),
  mws_response              varchar(2000) not null,
  order_id                  bigint not null,
  is_handle                 tinyint(1) default 0,
  created_at                datetime,
  updated_at                datetime not null,
  constraint pk_amazon_order_item primary key (id))
;

create table ebay_monetary_detail (
  id                        bigint auto_increment not null,
  master_id                 bigint,
  is_handled                tinyint(1) default 0,
  type                      integer,
  status                    varchar(255),
  from_type                 varchar(255),
  from_name                 varchar(255),
  to_type                   varchar(255),
  to_name                   varchar(255),
  time                      datetime,
  amount                    decimal(15,3),
  amount_currency           varchar(255),
  reference_id_type         varchar(255),
  reference_id              varchar(255),
  fee                       decimal(15,3),
  fee_currency              varchar(255),
  refund_type               varchar(255),
  update_at                 datetime not null,
  constraint ck_ebay_monetary_detail_type check (type in (0,1,2)),
  constraint pk_ebay_monetary_detail primary key (id))
;

create table ebay_order_detail (
  id                        bigint auto_increment not null,
  master_id                 bigint,
  is_handled                tinyint(1) default 0,
  item_id                   varchar(255),
  sku                       varchar(255),
  quantity                  integer,
  price                     decimal(15,3),
  price_currency            varchar(255),
  transaction_id            varchar(255),
  shipping_carrier          varchar(255),
  shipping_tracking_num     varchar(255),
  sales_record_number       integer,
  total_tax_amount          decimal(15,3),
  total_tax_amount_currency varchar(255),
  create_at                 datetime,
  actual_shipping_cost      decimal(15,3),
  actual_shipping_cost_currency varchar(255),
  actual_handling_cost      decimal(15,3),
  actual_handling_cost_currency varchar(255),
  site                      varchar(255),
  tax_amount                decimal(15,3),
  tax_on_subtotal           decimal(15,3),
  tax_on_shipping           decimal(15,3),
  tax_on_handling           decimal(15,3),
  waste_recycling_fee_tax_amount decimal(15,3),
  title                     varchar(2000),
  estimated_delivery_time_min datetime,
  estimated_delivery_time_max datetime,
  buyer_email               varchar(255),
  static_alias              varchar(255),
  update_at                 datetime not null,
  constraint pk_ebay_order_detail primary key (id))
;

create table ebay_order_master (
  id                        bigint auto_increment not null,
  is_handled                tinyint(1) default 0,
  order_id                  varchar(255),
  buyer_id                  varchar(255),
  shipping_service          varchar(255),
  shipped_time              datetime,
  sales_record_number       integer,
  tax                       decimal(15,3),
  tax_currency              varchar(255),
  tax_percent               decimal(15,3),
  tax_state                 varchar(255),
  shipping_included_in_tax  tinyint(1) default 0,
  insurance                 decimal(15,3),
  insurance_currency        varchar(255),
  total                     decimal(15,3),
  total_currency            varchar(255),
  subtotal                  decimal(15,3),
  subtotal_currency         varchar(255),
  amount_adjust             decimal(15,3),
  amount_adjust_currency    varchar(255),
  amount_paid               decimal(15,3),
  amount_paid_currency      varchar(255),
  amount_saved              decimal(15,3),
  amount_saved_currency     varchar(255),
  payment_method            varchar(255),
  checkout_status           varchar(255),
  last_modified_time        datetime,
  create_date               datetime,
  paypal_date               datetime,
  paypal_email              varchar(255),
  paypal_status             varchar(255),
  paid_time                 datetime,
  order_status              varchar(255),
  seller_email              varchar(255),
  seller_user_id            varchar(255),
  eias_token                varchar(255),
  integrated_merchant_credit_card_enabled tinyint(1) default 0,
  fire_at_date              datetime,
  buyer_name                varchar(255),
  buyer_phone               varchar(255),
  buyer_street1             varchar(255),
  buyer_street2             varchar(255),
  buyer_city                varchar(255),
  buyer_state               varchar(255),
  buyer_zip                 varchar(255),
  buyer_country             varchar(255),
  is_multi_leg_shipping     tinyint(1) default 0,
  shipping_recipient_name   varchar(255),
  shipping_recipient_phone  varchar(255),
  shipping_street1          varchar(255),
  shipping_street2          varchar(255),
  shipping_city             varchar(255),
  shipping_state            varchar(255),
  shipping_zip              varchar(255),
  shipping_country          varchar(255),
  shipping_reference_id     varchar(255),
  get_it_fast               tinyint(1) default 0,
  shipping_cost             decimal(15,3),
  shipping_cost_currency    varchar(255),
  global_shipping_service   varchar(255),
  global_shipping_cost      decimal(15,3),
  global_shipping_cost_currency varchar(255),
  global_shipping_import_charge decimal(15,3),
  global_shipping_import_charge_currency varchar(255),
  order_detail_num          integer,
  monetary_detail_num       integer,
  erp_platform_account_id   bigint,
  creating_user_role        varchar(255),
  update_at                 datetime not null,
  constraint pk_ebay_order_master primary key (id))
;




# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table amazon_order;

drop table amazon_order_item;

drop table ebay_monetary_detail;

drop table ebay_order_detail;

drop table ebay_order_master;

SET FOREIGN_KEY_CHECKS=1;

