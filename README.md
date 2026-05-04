# 🧑‍💼 Employee Management API

A complete, production-ready **REST API** for managing employees built with **FastAPI** and **MySQL**. Features full CRUD operations, Pydantic validation, interactive docs, and Docker support.

---

## 📁 Project Structure

```
employee_management_api/
├── app/
│   ├── __init__.py
│   ├── main.py              # FastAPI entry point
│   ├── database.py          # MySQL connection
│   ├── schemas.py           # Pydantic request/response models
│   ├── crud.py              # CRUD operations (raw SQL)
│   └── routers/
│       ├── __init__.py
│       └── employees.py     # Employee route handlers
├── .env.example             # Sample environment config
├── .gitignore
├── Dockerfile
├── docker-compose.yml       # Full stack (API + MySQL)
├── init_db.sql              # Database schema + seed data
├── postman_collection.json  # Ready-to-import Postman tests
├── requirements.txt
└── README.md
```

---

## ⚡ Quick Start

### Prerequisites
- Python 3.9+
- MySQL Server **OR** Docker

---

### Option A — Local Setup

**1. Clone the repo**
```bash
git clone https://github.com/your-username/employee-management-api.git
cd employee-management-api
```

**2. Create virtual environment**
```bash
python -m venv venv
source venv/bin/activate      # Linux/macOS
venv\Scripts\activate         # Windows
```

**3. Install dependencies**
```bash
pip install -r requirements.txt
```

**4. Set up MySQL database**
```bash
mysql -u root -p < init_db.sql
```

**5. Configure environment**
```bash
cp .env.example .env
# Edit .env with your DB credentials
```

**6. Run the server**
```bash
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

---

### Option B — Docker (Full Stack)

```bash
docker-compose up --build
```

This spins up both the **FastAPI app** and **MySQL** with seed data loaded automatically.

---

## 🌐 API Docs

Once running, visit:

| Interface | URL |
|-----------|-----|
| Swagger UI | http://localhost:8000/docs |
| ReDoc | http://localhost:8000/redoc |

---

## 📋 API Endpoints

| Method | Endpoint | Description | Status Code |
|--------|----------|-------------|-------------|
| `GET` | `/` | Welcome message | 200 |
| `POST` | `/employees/` | Create new employee | 201 |
| `GET` | `/employees/` | Get all employees | 200 |
| `GET` | `/employees/{id}` | Get employee by ID | 200 |
| `PUT` | `/employees/{id}` | Update employee | 200 |
| `DELETE` | `/employees/{id}` | Delete employee | 200 |

---

## 📦 Request & Response Examples

### Create Employee — `POST /employees/`

**Request Body:**
```json
{
  "first_name": "Michael",
  "last_name": "Scott",
  "email": "michael.scott@dundermifflin.com",
  "department": "Management",
  "salary": 85000.00,
  "hire_date": "2023-08-01"
}
```

**Response `201`:**
```json
{
  "message": "Employee created successfully",
  "id": 4
}
```

---

### Get All Employees — `GET /employees/`

**Response `200`:**
```json
[
  {
    "id": 1,
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "department": "Engineering",
    "salary": 75000.0,
    "hire_date": "2023-01-15"
  }
]
```

---

### Update Employee — `PUT /employees/{id}`

**Request Body (partial update supported):**
```json
{
  "salary": 91000.00,
  "department": "Regional Manager"
}
```

---

## ❌ Error Responses

| Status | Meaning |
|--------|---------|
| `404` | Employee not found |
| `409` | Email already exists (duplicate) |
| `422` | Validation error (invalid input) |
| `500` | Database / server error |

---

## 🧪 Testing with Postman

1. Open Postman
2. Click **Import** → select `postman_collection.json`
3. Set the `base_url` variable to `http://localhost:8000`
4. Run requests in order: Create → Get All → Get by ID → Update → Delete

---

## ⚙️ Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DB_HOST` | `localhost` | MySQL host |
| `DB_PORT` | `3306` | MySQL port |
| `DB_USER` | `root` | Database user |
| `DB_PASSWORD` | *(empty)* | Database password |
| `DB_NAME` | `employee_db` | Database name |

---

## 🛠️ Tech Stack

- **[FastAPI](https://fastapi.tiangolo.com/)** — Modern Python web framework
- **[MySQL](https://www.mysql.com/)** — Relational database
- **[Pydantic v2](https://docs.pydantic.dev/)** — Data validation & serialization
- **[mysql-connector-python](https://dev.mysql.com/doc/connector-python/en/)** — MySQL driver
- **[Uvicorn](https://www.uvicorn.org/)** — ASGI server
- **[Docker](https://www.docker.com/)** — Containerization

---

## 📄 License

MIT — feel free to use and modify.
