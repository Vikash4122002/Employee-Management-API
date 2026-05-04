<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=28&duration=3000&pause=1000&color=00D4AA&center=true&vCenter=true&width=700&lines=Employee+Management+API;FastAPI+%7C+MySQL+%7C+Docker;Production-Ready+REST+API" alt="Typing SVG" />

<br/>

[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com/)
[![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org/)
[![Pydantic](https://img.shields.io/badge/Pydantic-E92063?style=for-the-badge&logo=pydantic&logoColor=white)](https://docs.pydantic.dev/)

<br/>

> **Full CRUD REST API · Docker Multi-Container · Interactive Swagger Docs · Pydantic v2 Validation · Raw SQL (no ORM)**

</div>

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Live Demo](#-live-demo)
- [Key Features](#-key-features)
- [API Endpoints](#-api-endpoints)
- [Request & Response Examples](#-request--response-examples)
- [Error Handling](#-error-handling)
- [Quick Start](#-quick-start)
- [Project Structure](#-project-structure)
- [Tech Stack & Skills Demonstrated](#-tech-stack--skills-demonstrated)
- [About This Project](#-about-this-project)
- [Key Code Patterns](#-key-code-patterns)
- [Future Enhancements](#-future-enhancements)
- [Testing](#-testing)
- [Author](#-author)

---

## 🎯 Project Overview

A **production-grade Employee Management REST API** built with FastAPI and MySQL,
fully containerized with Docker. Mirrors real-world backend development practices
used at top companies — clean architecture, proper validation, structured error
handling, and one-command deployment.

| Dimension      | Detail                                   |
| -------------- | ---------------------------------------- |
| **Framework**  | FastAPI (Python 3.11)                    |
| **Database**   | MySQL 8.0 (raw SQL — no ORM)             |
| **Validation** | Pydantic v2 with custom validators       |
| **Deployment** | Docker + Docker Compose (multi-container)|
| **Docs**       | Auto-generated Swagger UI + ReDoc        |
| **Testing**    | Postman collection included              |

---

## 📸 Live Demo

> **▶ Clone and run in 60 seconds — see [Quick Start](#-quick-start)**

```bash
git clone https://github.com/Vikash4122002/Employee-Management-API.git
cd Employee-Management-API
docker-compose up --build
```

Then open 👉 **http://localhost:8000/docs**

![API Docs Screenshot](docs/screenshot.png)

---

## 🏆 Key Features

| Feature                  | Detail                                          |
| ------------------------ | ----------------------------------------------- |
| ✅ Full CRUD             | Create, Read, Update, Delete employees          |
| ✅ Validation            | Pydantic v2 — email, field length, salary ≥ 0  |
| ✅ Error Handling        | 404, 409, 422, 500 with clear JSON messages     |
| ✅ Interactive Docs      | Swagger UI at `/docs`, ReDoc at `/redoc`        |
| ✅ Docker Ready          | One command spins up API + MySQL                |
| ✅ Health Checks         | MySQL healthcheck before API starts             |
| ✅ Seed Data             | 3 sample employees loaded automatically         |
| ✅ Postman Collection    | Import and test instantly                       |

---

## 📋 API Endpoints

| Method   | Endpoint            | Description              | Status Code |
| -------- | ------------------- | ------------------------ | ----------- |
| `GET`    | `/`                 | Welcome + links to docs  | 200         |
| `POST`   | `/employees/`       | Create new employee      | 201         |
| `GET`    | `/employees/`       | Get all employees        | 200         |
| `GET`    | `/employees/{id}`   | Get employee by ID       | 200         |
| `PUT`    | `/employees/{id}`   | Update employee (partial)| 200         |
| `DELETE` | `/employees/{id}`   | Delete employee          | 200         |

---

## 📦 Request & Response Examples

### ➕ Create Employee — `POST /employees/`

**Request Body:**

```json
{
  "first_name": "Vikash",
  "last_name":  "Kumar",
  "email":      "vikash@example.com",
  "department": "Engineering",
  "salary":     75000,
  "hire_date":  "2024-01-15"
}
```

**Response `201 Created`:**

```json
{
  "message": "Employee created successfully",
  "id": 4
}
```

---

### 📋 Get All Employees — `GET /employees/`

**Response `200 OK`:**

```json
[
  {
    "id":         1,
    "first_name": "John",
    "last_name":  "Doe",
    "email":      "john.doe@example.com",
    "department": "Engineering",
    "salary":     75000.0,
    "hire_date":  "2023-01-15"
  }
]
```

---

### ✏️ Update Employee — `PUT /employees/{id}`

Supports **partial updates** — only send the fields you want to change:

```json
{
  "salary":     90000,
  "department": "Senior Engineering"
}
```

---

## ❌ Error Handling

| Status | When It Happens        | Example Response                          |
| ------ | ---------------------- | ----------------------------------------- |
| `404`  | Employee ID not found  | `{"detail": "Employee not found"}`        |
| `409`  | Duplicate email        | `{"detail": "Email already exists"}`      |
| `422`  | Invalid input data     | Auto-generated by Pydantic                |
| `500`  | DB connection failure  | `{"detail": "Database connection failed"}`|

---

## ⚡ Quick Start

### 🐳 Option A — Docker (Recommended)

> No Python or MySQL installation needed. Just Docker.

```bash
# 1. Clone the repository
git clone https://github.com/Vikash4122002/Employee-Management-API.git
cd Employee-Management-API

# 2. Start API + MySQL with one command
docker-compose up --build

# 3. Open interactive docs
#    http://localhost:8000/docs
```

**What Docker starts automatically:**

| Container        | Role                  | Port   |
| ---------------- | --------------------- | ------ |
| `employee-api`   | FastAPI application   | `8000` |
| `employee-mysql` | MySQL 8.0 database    | `3306` |

---

### 🐍 Option B — Local Python + MySQL

```bash
# 1. Create virtual environment
python -m venv venv
source venv/bin/activate        # Mac / Linux
venv\Scripts\activate           # Windows

# 2. Install dependencies
pip install -r requirements.txt

# 3. Set up database
mysql -u root -p < init_db.sql

# 4. Configure environment
cp .env.example .env
# Edit .env with your MySQL credentials

# 5. Run the server
uvicorn app.main:app --reload
```

---

### 🛑 Stop / Restart

```bash
# Stop (keeps data)
docker-compose down

# Start again — fast, no rebuild needed
docker-compose up

# Full reset — wipes the database
docker-compose down -v
docker-compose up --build
```

---

## 🏗 Project Structure

```
employee_management_api/
│
├── 📂 app/
│   ├── __init__.py
│   ├── main.py                  ← FastAPI entry point & app config
│   ├── database.py              ← MySQL connection handler
│   ├── schemas.py               ← Pydantic request/response models
│   ├── crud.py                  ← All database operations (raw SQL)
│   └── routers/
│       ├── __init__.py
│       └── employees.py         ← Route handlers (HTTP layer)
│
├── 📄 init_db.sql               ← Schema creation + seed data
├── 📄 requirements.txt          ← Python dependencies
├── 🐳 Dockerfile                ← API container definition
├── 🐳 docker-compose.yml        ← Multi-container orchestration
├── 📋 postman_collection.json   ← Ready-to-import API tests
├── 🔒 .env.example              ← Environment variable template
├── 🚫 .gitignore
└── 📖 README.md
```

---

## 🛠 Tech Stack & Skills Demonstrated

| Tool / Technology           | How It's Used                                              |
| --------------------------- | ---------------------------------------------------------- |
| **FastAPI**                 | REST API framework, dependency injection, async routes     |
| **Pydantic v2**             | Request validation, response serialization, validators     |
| **MySQL 8.0**               | Relational data storage with raw SQL queries               |
| **mysql-connector-python**  | MySQL driver — connection management                       |
| **Docker**                  | Containerized API image with Python 3.11-slim              |
| **Docker Compose**          | Multi-container orchestration with healthchecks            |
| **python-dotenv**           | Environment-based configuration                            |
| **Uvicorn**                 | ASGI production server                                     |

---

## 💡 About This Project

Built to demonstrate **real backend developer skills** — not just making something
that works, but making it the right way.

**Deliberate design choices:**

| Choice                  | Reason                                                        |
| ----------------------- | ------------------------------------------------------------- |
| Raw SQL over ORM        | Shows direct MySQL knowledge — no black-box magic             |
| Pydantic v2             | Full request validation with meaningful, typed error messages |
| Layered architecture    | Routes → CRUD → Database — each layer has exactly one job     |
| Docker healthcheck      | API waits for MySQL to be *ready*, not just *started*         |
| Partial updates on PUT  | Only updates fields you send — real-world REST pattern        |
| 409 conflict handling   | Duplicate email caught at DB constraint level, not app level  |

---

## 🔢 Key Code Patterns

**Dynamic partial update — `crud.py`:**

```python
# Only updates fields that are actually sent in the request
update_fields = []
values        = []

if employee_update.salary is not None:
    update_fields.append("salary = %s")
    values.append(employee_update.salary)

if employee_update.department is not None:
    update_fields.append("department = %s")
    values.append(employee_update.department)

# Dynamically builds:
# UPDATE employees SET salary = %s, department = %s WHERE id = %s
```

**Environment-based config — `database.py`:**

```python
connection = mysql.connector.connect(
    host     = os.getenv("DB_HOST",     "localhost"),
    port     = int(os.getenv("DB_PORT", 3306)),
    user     = os.getenv("DB_USER",     "root"),
    password = os.getenv("DB_PASSWORD", ""),
    database = os.getenv("DB_NAME",     "employee_db"),
)
```

---

## 🚀 Future Enhancements

- [ ] **JWT Authentication**  — Secure endpoints with token-based auth
- [ ] **Pagination**          — `?page=1&limit=10` on GET all employees
- [ ] **Search & Filter**     — Filter by department, salary range
- [ ] **Unit Tests**          — pytest test suite with isolated test database
- [ ] **CI/CD Pipeline**      — GitHub Actions for automated testing on push
- [ ] **Connection Pooling**  — Replace single connections with a pool
- [ ] **Rate Limiting**       — Protect API from abuse / DoS

---

## 🧪 Testing

**Option 1 — Swagger UI (browser, zero setup)**

```
http://localhost:8000/docs
→ Click any endpoint
→ Click "Try it out"
→ Click "Execute"
```

**Option 2 — Postman**

```
1. Open Postman
2. Click Import → select postman_collection.json
3. Set base_url variable → http://localhost:8000
4. Run in order: Create → Get All → Get by ID → Update → Delete
```

---

## 👨‍💻 Author

<div align="center">

**Vikash Kumar**

B.Tech ECE · Backend Development · Data & APIs

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Vikash4122002)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/vikash-kumar111107/)

</div>

---

<div align="center">

### ⭐ If this project helped you, give it a star!

*Built with real backend thinking — clean architecture, not just working code.*

</div>
