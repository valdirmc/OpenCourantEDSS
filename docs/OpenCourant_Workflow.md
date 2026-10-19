# OpenCourant — Workflow Avell / Nitro

**Data:** 2026-10-19  
**Commit base:** `b19ec63f3`

## Máquinas e branches

| Máquina | Caminho | Branch | Tracking | Propósito |
|---------|---------|--------|----------|-----------|
| **Avell** | `/home/valdir/000_VALDIR/00_CAE/FemEDSS/OpenCourant` | `prod` | `origin/prod` | Produção, alinhada com upstream |
| **Nitro** | `/run/media/valdir/MAIN/000_VALDIR/GIT_PJR/FemEDSS/OpenCourant` | `dev` | `origin/dev` | Desenvolvimento / testes |

## Remotes

```bash
origin    https://github.com/valdirmc/OpenCourantEDSS.git
upstream  https://github.com/OpenCourant/OpenCourant.git
```

## Atualizar produção (Avell)

```bash
cd /home/valdir/000_VALDIR/00_CAE/FemEDSS/OpenCourant
./sync_prod.sh
```

Ou manualmente:

```bash
git fetch upstream
git checkout prod
git merge upstream/main
git push origin prod
```

## Desenvolver (Nitro)

```bash
cd /run/media/valdir/MAIN/000_VALDIR/GIT_PJR/FemEDSS/OpenCourant
# editar docs, exemplos, scripts
git add ...
git commit -m "descrição"
git push
```

## Levar algo de dev → prod

Na Avell:

```bash
git fetch origin
git cherry-pick <hash>     # um commit específico
# ou
git merge origin/dev       # se quiser tudo (cuidado)
git push origin prod
```

## Estrutura local (Avell)

```
00_CAE/
├── FatEDSS/
├── FemEDSS/
│   ├── CalculiX/
│   ├── FemEDSS-app/
│   ├── Fenics-EDSS/
│   └── OpenCourant/          ← este repositório
└── PostEDSS/
```

## Notas

- A branch `prod` deve permanecer o mais próxima possível de `upstream/main`.
- Documentos e exemplos experimentais ficam na `dev` (Nitro).
- Se um documento/exemplo for estável e útil em produção, faça cherry-pick ou merge seletivo para `prod`.
