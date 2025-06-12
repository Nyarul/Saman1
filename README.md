
# UMT Vehicle Summons Management System

A **dynamic web application** designed to help staff and students at **Universiti Malaysia Terengganu (UMT)** manage vehicle summons in the campus area. The system provides functionalities for user authentication, role-based access, and an interactive interface to review, issue, and manage summons.

---

## 🚀 Features

- **User Authentication**: Secure login and user management for staff and students.
- **Role-Based Access**: Different access levels for **Admin** and **Staff** users.
  - **Admin** can view all students, manage summons, and update their statuses.
  - **Staff** can issue summons to students.
- **Summons Management**: Students can view their summons, and admins can manage the status (Issued, Paid, or Appealed).
- **Database Integration**: Local database to store summons information with relationships to vehicles and users.

---

## 🛠 Setup Instructions

To set up the project on your local machine, follow these steps:

### Prerequisites

- **Java** (JDK 8 or later)
- **Apache Tomcat** (for running the application locally)
- **MySQL** or **MariaDB** (for the local database)

### Steps to Run Locally

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/umt-vehicle-summons.git
   ```

2. **Set up the Database**:
   - Import the provided SQL dump file into your MySQL or MariaDB instance to create the necessary tables:
     - Database: `umt_transport_db`
     - Table: `summons`, `users`, `vehicles` (ensure correct foreign key relationships)

     **SQL Dump**: `umt_transport_db.sql`

3. **Configure the Database Connection**:
   - In your project, modify the `DBConnection.java` file to reflect your local database configuration (e.g., database URL, username, password).

4. **Deploy on Tomcat**:
   - Copy the project to the `webapps` directory of your **Apache Tomcat** installation.
   - Start the **Tomcat server** on port `8080`.

5. **Access the Application**:
   - Open your browser and go to `http://localhost:8080/Saman1` to access the application.

---

## 🖥 Technologies Used

- **Java** (Servlets, JSP)
- **MySQL / MariaDB** (for local database)
- **Apache Tomcat** (for running the application)

---

## 🔧 Database Schema

### `summons` Table

```sql
CREATE TABLE `summons` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `issued_by` int(11) NOT NULL,
  `violation_type` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` enum('issued','paid','appealed') DEFAULT 'issued',
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

### Example Data

```sql
INSERT INTO `summons` (`id`, `vehicle_id`, `issued_by`, `violation_type`, `location`, `amount`, `status`, `issued_at`, `paid_at`) VALUES
(1, 3, 2001, 'Speeding', 'ks', 50.00, 'appealed', '2025-06-12 07:04:11', NULL),
(2, 3, 2001, 'No Vehicle Sticker', 'pusat kuliah', 50.00, 'paid', '2025-06-12 07:05:14', NULL);
```

---

## 💬 Contributing

Feel free to fork the repository and submit issues or pull requests if you would like to contribute. All contributions are welcome!

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
