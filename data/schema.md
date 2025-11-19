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

## 📝 Notas
A medida que expanda el dataset o el dashboard, agregar aquí nuevas tablas o campos.
