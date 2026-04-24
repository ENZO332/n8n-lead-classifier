# Lead Classification with n8n + AI + PostgreSQL

## Descripción

Sistema de automatización desarrollado en n8n que recibe mensajes de potenciales clientes (leads), los clasifica utilizando un modelo de lenguaje (LLM) y los persiste en una base de datos PostgreSQL.

El flujo procesa los datos en tiempo real a través de un webhook, aplica lógica de clasificación y almacena los resultados para su posterior análisis.

---

## Funcionalidades

* Recepción de mensajes mediante Webhook (HTTP POST)
* Clasificación automática de leads:

  * hot → alta intención de compra
  * warm → interés moderado
  * cold → consulta general
* Priorización automática:

  * hot → 1
  * warm → 2
  * cold → 3
* Persistencia de datos en PostgreSQL
* Procesamiento en tiempo real

---

## Tecnologías utilizadas

* n8n (automatización de workflows)
* LLM local (Ollama)
* PostgreSQL (persistencia de datos)
* SQL (consultas e inserción de datos)

---

## Uso

1. Importar el workflow en n8n
2. Configurar credenciales de PostgreSQL
3. Activar el workflow
4. Enviar una request:

```bash
curl -X POST http://localhost:5678/webhook-test/lead \
-H "Content-Type: application/json" \
-d '{"message":"Quiero contratar hoy mismo"}'
```

---

## Configuración de la base de datos

Ejecutar el archivo `db.sql` en PostgreSQL para crear la base de datos, tabla y usuario necesarios:

```bash
psql -U postgres -f db.sql
```

---

## Ejemplo de respuesta

```json
{
  "status": "ok",
  "categoria": "warm",
  "prioridad": 2
}
```

---

## Persistencia de datos

Cada request se almacena en la base de datos PostgreSQL:

| id | message | categoria | prioridad | created_at |
| -- | ------- | --------- | --------- | ---------- |

Esto permite analizar leads y construir funcionalidades adicionales como dashboards o reportes.

---

## Limitaciones

El modelo de lenguaje utilizado (LLM local) puede presentar un comportamiento conservador, clasificando algunos mensajes como "warm" en lugar de "hot".

Esto se debe a limitaciones del modelo y no del flujo implementado.

---

## Posibles mejoras

* Implementación de endpoint GET para consulta de leads
* Dashboard de visualización
* Sistema híbrido (IA + reglas de negocio)
* Integración con CRM o APIs externas

---

## Autor

Enzo Juarez

