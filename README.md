# Assitants API
A tool that allows developers to craft AI assistants that can
perform various tasks

---
## Extending the OpenAI API
This assistant API is an extension with more specific tools in order to make
easier the creation of assistants, bots, tools etc.

## Assistants API benefits
1. Problems it helps to solve
    - Help the develper on managing:
        - Data
        - Models
        - Prompts
        - Application state
        - Embeddings
        - File uploading and information retriaval
2. Persistent threading for ongoing conversations or tasks
    - Ability to save messages and context of the conversation, making
      it not necessary to resend the entire context all over again on
      every interaction
    - Retrieval mechanisms for digging through data already present in the
      context
        - Upload files for use of the models.
    - Code interpreter
        - Write, analyse and run code...
    - **Function calling** to execute tasks
        - We can specify functions, algorithms, agents, external tools, etc
          in order to perform a certain task

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

```mermaid
  info
```

```geojson
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 1,
      "properties": {
        "ID": 0
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
              [-90,35],
              [-90,30],
              [-85,30],
              [-85,35],
              [-90,35]
          ]
        ]
      }
    }
  ]
}
```


