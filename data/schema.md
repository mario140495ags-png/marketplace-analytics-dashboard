# Database Schema (Neon / PostgreSQL)

Esta sección documenta la estructura de las tablas utilizadas por el dashboard.

---

## 🗂 Tabla: orders
- id (int)
- user_id (int)
- product_id (int)
- created_at (timestamp)
- price (numeric)
- status (text)

---

## 🗂 Tabla: products
- id (int)
- name (text)
- category (text)
- price (numeric)

---

## 🗂 Tabla: users 
- user_id (integer)
- full_name text
- created_at timestamp without time zone
- email text
- city text
- platform text

-- 

## 🗂 Tabla: vendors
- vendor_id	integer
- created_at	timestamp without time zone
- vendor_name	text

--

## 🗂 Tabla: categories
- category_id	integer
- category_name	text

--

## 🗂 Tabla: products
- product_id	integer
- vendor_id	integer
- category_id	integer
- price	numeric
- created_at	timestamp without time zone
- product_name	text

--

## 🗂 Tabla: order_items
- order_item_id	integer
- order_id	integer
- product_id	integer
- quantity	integer
- unit_price	numeric

--

## 🗂 Tabla: deliveries
-- delivery_id	integer
-- order_id	integer
-- delivery_timestamp	timestamp without time zone
-- delivery_status	text
-- courier_name	text

-- 

## 🗂 Tabla: views
-- table_catalog	name
-- table_schema	name
-- table_name	name
-- view_definition	character varying
-- check_option	character varying
-- is_updatable	character varying
-- is_insertable_into	character varying
-- is_trigger_updatable	character varying
-- is_trigger_deletable	character varying
-- is_trigger_insertable_into	character varying

-- 

## 🗂 Tabla: product_views
-- view_id	integer
-- user_id	integer
-- product_id	integer
-- view_timestamp	timestamp without time zone

-- 

## 🗂 Tabla: social_posts
-- post_id	integer
-- post_timestamp	timestamp without time zone
-- platform	text
-- content_type	text
-- caption	text

## 📝 Notas
se irán agregando tablas conforme al avance del proyecto.
