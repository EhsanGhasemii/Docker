## How to run the docker image? 
### Use `docker run` with `-e` instead (no secrets in image)

Skip setting ENV in Dockerfile, and use this:

```Dockerfile
FROM dpage/pgadmin4:2025-05-27-1
```

Then run with:

```bash
docker run -d \
  --name pgadmin \
  -p 5050:80 \
  -e PGADMIN_DEFAULT_EMAIL=admin@admin.com \
  -e PGADMIN_DEFAULT_PASSWORD=admin \
  -v pgadmin_data:/var/lib/pgadmin \
  my_pgadmin
```


You now have pgAdmin running — next step is connecting it to your **Label Studio PostgreSQL** database using the details you've shared.

---

## 🔑 Your Label Studio DB Info:

| Field        | Value             |
| ------------ | ----------------- |
| **Host/IP**  | `111.222.333.444` |
| **Port**     | `88888`           |
| **Username** | `user`            |
| **Password** | `password`        |
| **Database** | `labelstudio`     |

---

## 📥 Step-by-Step: Connect in pgAdmin

1. 🧭 Open **pgAdmin** in your browser (`http://localhost:5050`).
2. 🔐 Log in with your **[admin@admin.com](mailto:admin@admin.com)** / **admin** credentials (or whatever you set).
3. ➕ In the left sidebar, right-click on **Servers** > **Create > Server...**

---

### 🔧 In the "Create - Server" dialog:

#### 🟢 General Tab:

* **Name**: `Label Studio` (or anything you like)

#### 🟣 Connection Tab:

| Field                 | Value             |
| --------------------- | ----------------- |
| **Host name/address** | `111.222.333.444` |
| **Port**              | `88888`           |
| **Maintenance DB**    | `labelstudio`     |
| **Username**          | `user`            |
| **Password**          | `password`        |
| 🔒 Save Password      | ✅ (checked)       |

Then click **Save**.

---

## ✅ Done!

You should now see:

* The server listed in the sidebar.
* You can expand it to view:

  * Databases → `labelstudio`
  * Schemas, Tables, etc.

---

## 🧠 Tip: Explore Label Studio Tables

Label Studio uses tables like:

* `task` — annotation tasks
* `project` — projects
* `annotation` — results from human annotators
* `user` — user accounts

You can use the **Query Tool** in pgAdmin to inspect data like:

```sql
SELECT * FROM annotation LIMIT 10;
```

