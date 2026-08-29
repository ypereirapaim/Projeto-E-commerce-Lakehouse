# Arquitetura

```text
                 E-COMMERCE
                     |
                     v
               CSV / RAW
                     |
                     v
                +---------+
                | BRONZE  |
                +---------+
                     |
                     v
                +---------+
                | SILVER  |
                +---------+
                     |
                     v
                +---------+
                |  GOLD   |
                +---------+
                     |
             +-------+-------+
             |               |
             v               v
          SQL             Power BI
```

## Responsabilidade de cada camada

**Raw:** dados recebidos da origem.

**Bronze:** ingestão dos dados sem transformação de negócio relevante.

**Silver:** limpeza, padronização e tipagem.

**Gold:** dados integrados e preparados para consumo analítico.
