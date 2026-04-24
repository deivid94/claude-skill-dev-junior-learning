# 🧠 Code Mentor v2 - Claude Skill

Seu mentor de programação Node.js/React que **ensina você a pensar**, não a copiar código.

> **Método**: Socrático puro. Você descobre a solução, não recebe pronta.

---

## ✨ O Que É?

Uma skill para Claude que guia você através de:
- ✅ **Análise crítica** de código (sem dar resposta pronta)
- ✅ **Debugging sistemático** (5-step method)
- ✅ **Aprendizado estruturado** (12 semanas roadmap)
- ✅ **Padrões reconhecimento** (Map/Filter, Debounce, SSOT, etc)
- ✅ **Pensamento arquitetural** (Node.js + React)

---

## 📊 Testes & Performance

```
Phase 1 (Triggering):  12/13 = 92% ✅
Phase 2 (Functional):   6/6  = 100% ✅
Phase 3 (Negative):     3/3  = 100% ✅

TOTAL: 21/22 = 95.5% ✅
```

Skill **validada e testada** empiricamente.

---

## 🚀 Instalação Rápida (2 Min)

### Opção 1: Automática (Recomendado)

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/code-mentor-skill.git
cd code-mentor-skill

# 2. Execute o script
bash install.sh

# ✅ Pronto! Skill instalada globalmente
```

### Opção 2: Manual

```bash
# 1. Crie pasta global
mkdir -p ~/.claude/skills

# 2. Copie arquivo
cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md

# 3. Crie config
cat > ~/.clauderc << 'EOF'
{
  "skills_directory": "~/.claude/skills",
  "auto_load_user_skills": true
}
EOF

# ✅ Pronto!
```

---

## 📁 Estrutura do Repositório

```
code-mentor-skill/
├── skill/
│   └── SKILL.md                    # 599 linhas - A skill completa
├── install.sh                      # Script de instalação automática
├── README.md                       # Este arquivo
├── GETTING-STARTED.md              # Guia de início rápido
├── TROUBLESHOOTING.md              # Solução de problemas
├── docs/
│   ├── FEATURES.md                 # Recursos detalhados
│   ├── USAGE-EXAMPLES.md           # Exemplos de uso
│   ├── TESTING.md                  # Testes da skill
│   ├── ARCHITECTURE.md             # Design da skill
│   └── UPDATES.md                  # Histórico de versões
└── .github/
    └── workflows/
        └── validate.yml            # CI/CD (futuro)
```

---

## 💻 Verificar Instalação

```bash
# Ver skill instalada
ls ~/.claude/skills/code-mentor-nodejs-react.md
# ✅ Deve existir

# Testar em qualquer projeto
cd ~/seu-projeto
claude chat "não entendi Map"
# ✅ Skill deve carregar automaticamente
```

---

## 🎯 Como Usar

### Triggers que funcionam:

```bash
claude chat "não entendi async/await"
claude chat "revisa meu código"
claude chat "tá dando erro, me ajuda"
claude chat "como estruturar esse projeto?"
claude chat "qual tipo de dados usar?"
```

### Método de Ensino:

A skill **faz perguntas para você descobrir**, não dá respostas prontas:

```
Você: "Não entendi Map"
↓
Skill: "Você precisa buscar por chave? Precisa manter ordem?"
↓
Você: "Sim, buscar por ID rápido"
↓
Skill: "E qual operação é mais rápida: buscar em Array ou Map?"
↓
Você descobre: Map é O(1), Array é O(n)! 🎯
```

---

## 📚 Documentação

- **[GETTING-STARTED.md](./GETTING-STARTED.md)** - 5 min para começar
- **[FEATURES.md](./docs/FEATURES.md)** - Tudo que skill faz
- **[USAGE-EXAMPLES.md](./docs/USAGE-EXAMPLES.md)** - Exemplos práticos
- **[TROUBLESHOOTING.md](./TROUBLESHOOTING.md)** - Problemas comuns
- **[ARCHITECTURE.md](./docs/ARCHITECTURE.md)** - Design técnico

---

## 🔧 Requisitos

- ✅ Claude CLI instalado (`npm install -g @anthropic-ai/claude-cli`)
- ✅ Bash shell (macOS, Linux, WSL)
- ✅ 5MB de espaço em disco

---

## 🛠️ Configuração Avançada

### ~/.clauderc (Completo)

```json
{
  "default_model": "claude-opus-4-6",
  "skills_directory": "~/.claude/skills",
  "auto_load_user_skills": true,
  "temperature": 0.7,
  "max_tokens": 2048,
  "timeout": 30
}
```

### Por-Projeto (Sobrescreve Global)

```bash
# Na raiz do seu projeto
cat > .clauderc << 'EOF'
{
  "skills_directory": "./local-skills",
  "temperature": 0.5
}
EOF
```

---

## 📈 O Que Skill Cobre

### JavaScript Fundamentals (Weeks 1-2)
- Naming, functions, loops, arrays
- Anti-padrões e boas práticas

### Async JavaScript (Weeks 3-4)
- Promises, async/await, error handling
- Debugging de callbacks

### React Basics (Weeks 5-6)
- Components, JSX, hooks, state
- Props e composition

### React Advanced (Weeks 7-8)
- useEffect, custom hooks, patterns
- Performance e reusability

### Full-Stack Integration (Weeks 9-10)
- Node.js APIs, routing, controllers
- Services e separation of concerns

### Professional Practices (Weeks 11-12)
- TypeScript, testing, Git
- Code review, debugging

---

## 🤔 FAQ

### Skill funciona offline?
✅ Sim! Precisa apenas do Claude CLI instalado.

### Posso customizar?
✅ Sim! Edite `skill/SKILL.md` conforme quiser.

### Funciona em Windows?
✅ Sim! Use WSL ou PowerShell com bash.

### Posso contribuir melhorias?
✅ Sim! Faça fork e PR com melhorias.

### É grátis?
✅ Sim! Open source sob MIT.

---

## 🔄 Atualizar Skill

```bash
# Quando sair versão nova
git pull origin main

# Recopie para global
cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md

# Restart Claude
pkill -f claude
```

---

## 🤝 Contribuindo

1. Fork o repositório
2. Crie branch: `git checkout -b feature/melhoria`
3. Commit: `git commit -m "feat: adiciona X"`
4. Push: `git push origin feature/melhoria`
5. Abra PR

---

## 📝 Changelog

### v2.0 (Current)
- ✅ Método Socrático puro
- ✅ 12-week roadmap
- ✅ 5-step debugging method
- ✅ Anti-padrões com exemplos
- ✅ Padrões de reconhecimento
- ✅ 95.5% test coverage

### v1.0
- Básico Socrático

---

## 📞 Suporte

### Problemas?

1. **Skill não carrega?**
   - Veja [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)

2. **Como usar?**
   - Leia [GETTING-STARTED.md](./GETTING-STARTED.md)

3. **Dúvidas técnicas?**
   - Abra issue no GitHub

---

## 📄 Licença

MIT License - Veja [LICENSE](./LICENSE)

---

## 🙏 Créditos

Criado com ❤️ por um dev que acredita que **entender > copiar**

---

## 🚀 Próximas Features

- [ ] Análise de performance
- [ ] Integração com GitHub (CI/CD)
- [ ] Testes automatizados
- [ ] Plugin package manager
- [ ] Múltiplas linguagens

---

**Feliz aprendizado!** 🧠✨

Vamos pensar juntos.
