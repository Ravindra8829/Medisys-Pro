# Medisys Pro

A comprehensive Medical Store Management System for pharmacies and medical stores. This project is designed for educational and learning purposes, providing a full-stack solution for managing medicines, employees, sales, billing, and inventory.

---

## 🏗️ Architecture

- **Backend:** Java (JSP/Servlets)
- **Frontend:** JSP, HTML, CSS, JavaScript (Bootstrap, jQuery, DataTables)
- **Database:** MySQL
- **Deployment:** Apache Tomcat (WAR file)

---

## 🚀 Features

### Core Modules

1. **Authentication & Authorization** – Admin and Employee login
2. **Medicine Management** – Add, update, delete, and search medicines
3. **Employee Management** – Add, view, and manage employees (admin only)
4. **Sales & Billing** – Create sales, generate bills, view sales history
5. **Inventory Management** – Track stock, view available and not available medicines
6. **Notifications** – View important notifications
7. **Reporting** – View and print bills, sales, and inventory reports
8. **Role-based Access** – Admin and Employee roles with different permissions

---

## 📋 Prerequisites

- Java 8 or higher
- Apache Tomcat 8 or higher
- MySQL 5.6 or higher
- MySQL Connector/J (JDBC driver)

---

## 🛠️ Setup Instructions

### 1. Database Setup

- Create a new MySQL database (e.g., `medisys_pro`).
- Import the provided `medisys_pro.sql` file to set up tables and initial data:

  ```sql
  CREATE DATABASE medisys_pro;
  USE medisys_pro;
  -- Import medisys_pro.sql
  ```

### 2. Backend & Deployment

- Deploy the `MedisysProNewR1.war` file to your Apache Tomcat server.
- Or, copy the `MedisysProNewR1/` directory to your Tomcat `webapps/` folder if running in exploded mode.
- Update the database connection settings in `WEB-INF/classes/com/code/conn/DbConnection.java` if needed:

  ```java
  String url = "jdbc:mysql://localhost:3306/medisys_pro";
  String username = "your_mysql_username";
  String password = "your_mysql_password";
  ```

- Start/restart Tomcat and access the application at `http://localhost:8080/MedisysProNewR1/`

---

## 📁 Project Structure

```
MedisysProNewR1/
├── *.jsp                        # JSP pages (UI)
├── assets/                      # CSS, JS, images, fonts
├── header/                      # Common header/menu JSP
├── img/                         # Images
├── META-INF/                    # Manifest
├── WEB-INF/                     # Web config, classes, libraries
│   ├── web.xml                  # Deployment descriptor
│   ├── classes/com/code/        # Java source and compiled classes
│   └── lib/                     # JAR dependencies
├── medisys_pro.sql              # Database schema
├── MedisysProNewR1.war          # Deployable WAR file
```

---

## 🔐 Authentication

- **Admin:** Full access to all modules (medicine, employee, sales, reports)
- **Employee:** Limited access (sales, view medicines, view stock)

---

## 🔧 Configuration

- **Database:** Update credentials in `DbConnection.java` as per your MySQL setup.
- **Libraries:** Ensure all required JARs are present in `WEB-INF/lib/` (e.g., MySQL Connector/J, iTextPDF, Apache Commons)

---

## 🚀 Deployment

- Deploy the WAR file to Tomcat or use the exploded directory.
- Access via browser: `http://localhost:8080/MedisysProNewR1/`

---

## 🔒 Security Considerations

- Passwords are stored as plain text (for demo/learning only). For production, use hashing (e.g., BCrypt).
- No public access; only registered users (admin/employee) can log in.
- Input validation is basic; enhance for production use.

---

## 📝 License

This project is for educational and learning purposes only. Not for production or commercial use.

---

## 🤝 Support

For questions or support, contact on [LinkedIn](https://www.linkedin.com/in/ravindra-kumar-suthar-882ravi/)

---

**Note:** This is an educational project. All features and modules are for learning and demonstration purposes only.
