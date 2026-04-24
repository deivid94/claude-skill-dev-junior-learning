# 🔧 Troubleshooting - Code Mentor v2

Soluções para problemas comuns.

---

## ❌ Skill Não Carrega

### Sintoma
```bash
$ claude chat "não entendi"
# Não carrega skill, responde genérico
```

### Solução

**Step 1: Verificar arquivo**
```bash
ls -la ~/.claude/skills/code-mentor-nodejs-react.md
```

Se **NÃO EXISTIR**:
```bash
cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md
```

Se **EXISTIR**:
```bash
wc -l ~/.claude/skills/code-mentor-nodejs-react.md
# Deve ter 599 linhas
```

---

**Step 2: Verificar config**
```bash
cat ~/.clauderc
```

Deve ter:
```json
{
  "skills_directory": "~/.claude/skills",
  "auto_load_user_skills": true
}
```

Se **FALTA**, recrie:
```bash
cat > ~/.clauderc << 'EOF'
{
  "default_model": "claude-opus-4-6",
  "skills_directory": "~/.claude/skills",
  "auto_load_user_skills": true
}
EOF
```

---

**Step 3: Verificar YAML**
```bash
# Primeiras 10 linhas devem ser:
head -10 ~/.claude/skills/code-mentor-nodejs-react.md
```

Deve mostrar:
```yaml
---
name: code-mentor-nodejs-react
description: ...
---
```

Se **NÃO TIVER** as linhas `---`, arquivo está corrompido.

---

**Step 4: Restart Claude**
```bash
pkill -f claude
sleep 2
```

Teste novamente:
```bash
claude chat "não entendi"
# Agora deve funcionar ✅
```

---

## 🚫 Erro: "Permission Denied"

### Ao executar install.sh
```bash
bash: ./install.sh: Permission denied
```

### Solução

```bash
# Dê permissão
chmod +x install.sh

# Execute
bash install.sh
```

---

## 🚫 Erro: "File Not Found"

### Ao rodar script
```bash
Error: code-mentor-v2-complete.md not found
```

### Solução

```bash
# Certifique que ambos arquivos estão na mesma pasta
ls -la

# Deve mostrar:
# code-mentor-v2-complete.md
# install.sh

# Se não tiver o arquivo .md:
# Baixe do repositório novamente
```

---

## ❓ Skill Carrega Mas Não Responde Certo

### Sintoma
```bash
$ claude chat "não entendi Map"
# Carrega skill, mas dá resposta genérica/código pronto
```

### Causa
Provavelmente skill foi editada incorretamente.

### Solução

**Recopie original:**
```bash
# Reset para versão original
git checkout skill/SKILL.md

# Recopie
cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md

# Restart
pkill -f claude
```

---

## 🐌 Claude Muito Lento

### Sintoma
```bash
$ claude chat "test"
# Demora muito para responder
```

### Verificar

**1. Muitas skills carregadas?**
```bash
ls ~/.claude/skills/
# Se tem muitas, pode ficar lento

# Remova skills não usadas
rm ~/.claude/skills/outra-skill.md
```

**2. Token limit muito alto?**
```bash
cat ~/.clauderc | grep max_tokens
# Se > 4096, reduza para 2048
```

**3. Internet lenta?**
```bash
# Verifique conexão
ping google.com
```

---

## 🔌 Offline / Sem Internet

### Skill funcionará offline?
```
NÃO - Claude CLI precisa conectar a API.
SIM - Skill está armazenada localmente, carrega sem delay.
```

---

## 🪟 Windows (PowerShell)

### install.sh não funciona

**Opção 1: Use WSL**
```bash
# Instale WSL (recomendado)
# Depois rode script normal em WSL
```

**Opção 2: PowerShell**
```powershell
# No PowerShell como Admin:

# 1. Criar pasta
New-Item -Path "$env:APPDATA\claude\skills" -ItemType Directory -Force

# 2. Copiar arquivo
Copy-Item ".\skill\SKILL.md" -Destination "$env:APPDATA\claude\skills\code-mentor-nodejs-react.md"

# 3. Criar config
@{
    "skills_directory" = "$env:APPDATA\claude\skills"
    "auto_load_user_skills" = $true
} | ConvertTo-Json | Out-File -FilePath "$env:APPDATA\claude\.clauderc"
```

---

## 🍎 macOS (M1/M2 Silicon)

### Problema de permissão
```bash
# Execute como:
bash -i install.sh
```

---

## 🐧 Linux

### Distribuição específica

**Ubuntu/Debian:**
```bash
sudo bash install.sh
# ou
bash install.sh  # sem sudo (recomendado)
```

**Fedora/RHEL:**
```bash
bash install.sh
```

---

## 📦 Versionamento

### Skill desatualizada

```bash
# Verifique versão
grep "name:" ~/.claude/skills/code-mentor-nodejs-react.md | head -1

# Atualize
git pull origin main
cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md
```

---

## 🔍 Debug Mode

### Ativar logs detalhados

```bash
# macOS/Linux
export DEBUG=claude:*
claude chat "test"

# Windows PowerShell
$env:DEBUG = "claude:*"
claude chat "test"
```

Mostrará:
- Onde carrega skills
- Qual skill foi ativada
- Erros detalhados

---

## 📱 Diferentes Terminais

### iTerm2 (macOS)
```bash
# Funciona normalmente
bash install.sh
```

### Windows Terminal
```bash
# Use WSL para melhor compatibilidade
bash install.sh
```

### Vim/Neovim (Dentro do terminal)
```bash
:!bash install.sh
```

---

## 🆘 Ainda Não Resolveu?

### Resets Nucleares

**Option 1: Reset completo**
```bash
# Remove tudo
rm -rf ~/.claude

# Reinstala
bash install.sh
```

**Option 2: Config mínima**
```bash
# Remove config
rm ~/.clauderc

# Cria nova
cat > ~/.clauderc << 'EOF'
{
  "skills_directory": "~/.claude/skills",
  "auto_load_user_skills": true
}
EOF

pkill -f claude
```

---

## 📞 Se Nada Funcionar

1. **Veja logs:**
   ```bash
   claude --verbose chat "test"
   ```

2. **Abra issue no GitHub:**
   - Inclua: SO, versão Claude, logs
   - Descreva o problema
   - Mostre o que tentou

3. **Verifique Internet:**
   ```bash
   curl https://api.anthropic.com
   ```

---

## ✅ Checklist Final

- [ ] Arquivo em `~/.claude/skills/code-mentor-nodejs-react.md`
- [ ] Config em `~/.clauderc`
- [ ] `auto_load_user_skills: true`
- [ ] Claude CLI reiniciado (`pkill -f claude`)
- [ ] Testou em novo projeto
- [ ] Skill carrega com triggers

Se tudo ✅, está funcionando! 🎉

---

**Ainda com dúvidas?**

- Leia [README.md](../README.md)
- Veja [GETTING-STARTED.md](../GETTING-STARTED.md)
- Abra issue no GitHub

Estou aqui pra ajudar! 🚀
