#!/bin/bash

# ✨ Code Mentor v2 - Installation Script
# Clone do repositório no seu computador

set -e  # Exit on error

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "╔════════════════════════════════════════════════════════╗"
echo "║   Code Mentor v2 - Global Installation                ║"
echo "║   Instala em qualquer projeto automaticamente          ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Detectar SO
OS="Linux"
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macOS"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  OS="Windows"
fi

echo -e "${BLUE}🖥️  Detected OS: ${OS}${NC}"
echo ""

# Step 1: Validar estrutura do repositório
echo -e "${YELLOW}Step 1: Validando estrutura do repositório...${NC}"

if [ ! -f "skill/SKILL.md" ]; then
  echo -e "${RED}❌ Error: skill/SKILL.md não encontrado${NC}"
  echo "   Este script deve ser executado na raiz do repositório"
  echo "   Estrutura esperada:"
  echo "   code-mentor-skill/"
  echo "   ├── skill/"
  echo "   │   └── SKILL.md"
  echo "   ├── install.sh"
  echo "   └── README.md"
  exit 1
fi

echo -e "${GREEN}✅ Estrutura validada${NC}"
echo ""

# Step 2: Criar diretório global
echo -e "${YELLOW}Step 2: Criando diretório de skills global...${NC}"

mkdir -p ~/.claude/skills

if [ -d ~/.claude/skills ]; then
  echo -e "${GREEN}✅ Diretório criado/confirmado: ~/.claude/skills${NC}"
else
  echo -e "${RED}❌ Falha ao criar diretório${NC}"
  exit 1
fi

echo ""

# Step 3: Copiar skill
echo -e "${YELLOW}Step 3: Copiando Code Mentor skill...${NC}"

cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md

if [ -f ~/.claude/skills/code-mentor-nodejs-react.md ]; then
  LINES=$(wc -l < ~/.claude/skills/code-mentor-nodejs-react.md)
  echo -e "${GREEN}✅ Skill copiada com sucesso (${LINES} linhas)${NC}"
else
  echo -e "${RED}❌ Falha ao copiar skill${NC}"
  exit 1
fi

echo ""

# Step 4: Criar/atualizar config
echo -e "${YELLOW}Step 4: Configurando Claude CLI...${NC}"

cat > ~/.clauderc << 'CONFIGEOF'
{
  "default_model": "claude-opus-4-6",
  "skills_directory": "~/.claude/skills",
  "auto_load_user_skills": true,
  "temperature": 0.7,
  "max_tokens": 2048
}
CONFIGEOF

if [ -f ~/.clauderc ]; then
  echo -e "${GREEN}✅ Configuração criada: ~/.clauderc${NC}"
else
  echo -e "${RED}❌ Falha ao criar configuração${NC}"
  exit 1
fi

echo ""

# Step 5: Validar YAML frontmatter
echo -e "${YELLOW}Step 5: Validando YAML frontmatter...${NC}"

if head -1 ~/.claude/skills/code-mentor-nodejs-react.md | grep -q "^---"; then
  echo -e "${GREEN}✅ YAML frontmatter válido${NC}"
else
  echo -e "${RED}❌ YAML frontmatter inválido${NC}"
  exit 1
fi

echo ""

# Step 6: Verificação final
echo -e "${YELLOW}Step 6: Verificação final...${NC}"

# Arquivo
if [ -f ~/.claude/skills/code-mentor-nodejs-react.md ]; then
  echo -e "${GREEN}✅ Arquivo skill verificado${NC}"
else
  echo -e "${RED}❌ Arquivo skill não encontrado${NC}"
  exit 1
fi

# Config
if grep -q "code-mentor-nodejs-react" ~/.clauderc 2>/dev/null || \
   grep -q "skills_directory" ~/.clauderc 2>/dev/null; then
  echo -e "${GREEN}✅ Configuração verificada${NC}"
else
  echo -e "${YELLOW}⚠️  Config pode precisar de ajuste manual${NC}"
fi

echo ""

# Sucesso!
echo "╔════════════════════════════════════════════════════════╗"
echo -e "${GREEN}║   ✨ Instalação Completa! ✨                        ║${NC}"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

echo -e "${BLUE}📍 Localização:${NC}"
echo "   Skill:  ~/.claude/skills/code-mentor-nodejs-react.md"
echo "   Config: ~/.clauderc"
echo ""

echo -e "${BLUE}🚀 Próximos passos:${NC}"
echo "   1. Reinicie Claude CLI:"
echo "      ${YELLOW}pkill -f claude${NC}"
echo ""
echo "   2. Teste em qualquer projeto:"
echo "      ${YELLOW}cd ~/seu-projeto${NC}"
echo "      ${YELLOW}claude chat \"não entendi\"${NC}"
echo ""
echo "   3. Skill deve carregar automaticamente! ✅"
echo ""

echo -e "${BLUE}💡 Dicas:${NC}"
echo "   • Skill agora disponível em TODOS os projetos"
echo "   • Não precisa copiar em cada pasta"
echo "   • Atualizar: git pull && cp skill/SKILL.md ~/.claude/skills/code-mentor-nodejs-react.md"
echo "   • Verificar: ls ~/.claude/skills/"
echo ""

echo -e "${BLUE}📚 Documentação:${NC}"
echo "   • GETTING-STARTED.md - Comece aqui"
echo "   • TROUBLESHOOTING.md - Solução de problemas"
echo "   • docs/ - Documentação completa"
echo ""

echo -e "${GREEN}Feliz aprendizado! 🎉${NC}"
echo ""

# Sugerir reset se necessário
if ! command -v claude &> /dev/null; then
  echo -e "${YELLOW}⚠️  Claude CLI não encontrado no PATH${NC}"
  echo "   Instale com: npm install -g @anthropic-ai/claude-cli"
  echo ""
fi
