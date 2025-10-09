---

# Global Gadgets Database System

### Overview

The **Global Gadgets Database** was developed as part of an SQL database design and implementation project for a pseudo retail client, **Global Gadgets Ltd**, an e-commerce business specializing in electronic products. The client required a **fully normalized, secure, and scalable relational database system** to support daily operations such as managing customers, products, orders, payments, inventory, shipping, and supplier relationships.

This project demonstrates a complete end-to-end database design process, from **conceptual modeling and normalization** to **implementation using T-SQL in Microsoft SQL Server Management Studio (SSMS)**.

---

## **Client Requirements**

The client requested a database system capable of:

* Managing **customers**, **suppliers**, and **product catalogs** efficiently.
* Supporting **order processing**, **payments**, **refunds**, and **reviews**.
* Tracking **inventory and supplier deliveries** in real-time.
* Ensuring **data accuracy, concurrency control**, and **security**.
* Enabling **audit trails**, **reporting**, and **traceability** across all business transactions.
* Providing a foundation for **scalable future integration** (e.g., analytics, automation, or ERP systems).

---

## **Database Features**

### **1. Comprehensive Entity Design**

The database consists of **13 interrelated tables**, representing all key business entities and relationships:

| **Entity**         | **Purpose**                                                                       |
| ------------------ | --------------------------------------------------------------------------------- |
| `Customers`        | Stores user profiles, login credentials, and account statuses.                    |
| `Orders`           | Tracks all customer purchase transactions.                                        |
| `OrderDetails`     | Captures product quantity, price, and discount per order item.                    |
| `Products`         | Contains product listings, descriptions, and active status.                       |
| `Categories`       | Groups products into manageable classifications (e.g., Electronics, Accessories). |
| `Suppliers`        | Stores supplier information for sourcing products.                                |
| `Supplies`         | Links products and suppliers with delivery and cost details.                      |
| `Inventory`        | Tracks stock levels and ensures real-time updates.                                |
| `PaymentMethods`   | Lists available payment types (e.g., Credit Card, PayPal, Bank Transfer).         |
| `Payments`         | Records all payment transactions linked to orders.                                |
| `Refunds`          | Handles partial or full order refunds.                                            |
| `ShippingMethods`  | Defines available delivery options and estimated times.                           |
| `Reviews`          | Stores customer product reviews and star ratings.                                 |
| `SupplierAuditLog` | Maintains audit history for supplier updates and activity.                        |

---

### **2. Key Functional Highlights**

* **Referential Integrity:**
  All tables are connected through **primary and foreign keys** with cascading rules (`ON DELETE` / `ON UPDATE`) to maintain consistent relationships.

* **Normalization:**
  The database is fully normalized up to **Third Normal Form (3NF)** to eliminate redundancy and ensure logical data structuring.

* **Business Logic Enforcement:**
  Implemented through **CHECK constraints**, **DEFAULT values**, and **UNIQUE keys** for data accuracy and consistency.

* **Automatic Audit and Stock Management:**

  * **Triggers** update stock levels automatically upon order placement or cancellation.
  * **SupplierAuditLog** tracks supplier updates for accountability.

* **Secure Payment Tracking:**
  Payment and refund data are handled using **referential links** and **timestamped confirmation fields**.

* **Review Integration:**
  Customers can submit one review per product per order, validated by a **unique constraint** across (`customer_id`, `product_id`, `orderdetail_id`).

---

## **Database Design & Normalization**

The database was designed using a **top-down conceptual modeling approach**, followed by **normalization to 3NF**.

### **Conceptual Model**

* Defined major entities (Customers, Orders, Products, Suppliers, Payments, etc.).
* Established one-to-many and many-to-many relationships using junction tables like `OrderDetails` and `Supplies`.
* Developed an **Entity Relationship Diagram (ERD)** representing logical relationships.

### **Normalization Steps**

* **1NF:** Ensured atomic attributes and unique rows per table.
* **2NF:** Eliminated partial dependencies in composite keys (e.g., `OrderDetails`).
* **3NF:** Removed transitive dependencies (e.g., separating category and supplier data).

**Result:**
Each table contains only data relevant to its entity, promoting **efficiency**, **consistency**, and **scalability**.

---

## **Data Integrity, Concurrency, and Security**

### **Data Integrity**

* All relationships use **foreign key constraints** with `ON DELETE CASCADE` or `SET NULL` to prevent orphan records.
* **CHECK constraints** (e.g., stock ≥ 0, ratings between 1–5).
* **Triggers** maintain synchronized inventory and audit updates.

### **Concurrency Control**

* **Transaction blocks** (`BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`) ensure atomic updates.
* **Locking mechanisms** (`SERIALIZABLE` or `UPDLOCK`) prevent simultaneous conflicting inventory updates.
* SQL Server’s concurrency control guarantees accurate stock adjustments even under high-traffic conditions.

### **Database Security**

* **Role-based access control (RBAC)** ensures limited permissions per user role.
* **Transparent Data Encryption (TDE)** and **Always Encrypted** protect data at rest and in transit.
* **Audit logs** and **Extended Events** track system and user activities.
* **Least privilege** principles applied to minimize attack surfaces.

---

## **Technologies Used**

* **Database Management System:** Microsoft SQL Server 2021
* **Query Language:** T-SQL
* **Modeling Tool:** SSMS Diagram Designer 
* **Version Control:** Git & GitHub

---

## **Key Learning Outcomes**

* Applying **relational modeling principles** to real-world business cases.
* Implementing **constraints, triggers, and stored procedures** for data automation.
* Designing a **secure, high-integrity transactional database**.
* Managing **concurrency, security, and recovery planning** in SQL Server environments.

---

## 📷 **Sample ERD (Entity Relationship Diagram)**
<img width="975" height="740" alt="image" src="https://github.com/user-attachments/assets/150b68b0-6fd5-4345-8743-3575f8d86e38" />

This diagram illustrates entity relationships, primary/foreign key dependencies, and normalization flow across the schema.

## **Future Enhancements**

* Integration with a **web-based dashboard** for real-time analytics.
* Implementation of **stored procedures** for order processing and inventory reports.
* Addition of **machine learning modules** for product recommendation and sales forecasting.
* Development of **role-based user interfaces** for customers, suppliers, and administrators.

---

## **Author**

**Chijioke C. Uhegwu**
📧 Email: [[chijiokeuhegwu@gmail.com](mailto:chijiokeuhegwu@gmail.com)]
🌐 GitHub: [github.com/ChijiokeUhegwu](https://github.com/ChijiokeUhegwu)

---

## 🏁 **License**

This project is provided for **academic and professional demonstration purposes** under the MIT License.
Feel free to explore, adapt, and reference with proper attribution.

---
