# Lead Classification with n8n + AI

## Descripción
Workflow de n8n que clasifica mensajes de potenciales clientes usando un modelo de lenguaje (LLM).

## Funcionalidades
- Webhook para recibir mensajes
- Clasificación automática: hot / warm / cold
- Priorización de leads
- Respuesta en tiempo real

## Uso

curl -X POST http://localhost:5678/webhook-test/lead \
-H "Content-Type: application/json" \
-d '{"message":"Quiero contratar hoy mismo"}'

## Ejemplo de respuesta

{
  "status": "ok",
  "categoria": "warm",
  "prioridad": 2
}

## Nota
El modelo puede clasificar algunos casos como "warm" debido a su comportamiento conservador.

## Autor
Enzo Juarez
