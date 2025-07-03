<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Inserir Dados</title>
    <script>
        function mostrarFormulario() {
            var tabela = document.getElementById("tabela").value;
            var formularios = document.getElementsByClassName("formulario-tabela");
            for (var i = 0; i < formularios.length; i++) {
                formularios[i].style.display = "none";
            }
            document.getElementById("form_" + tabela).style.display = "block";
        }
    </script>
</head>
<body>
    <h1>Inserir Dados</h1>

    <label for="tabela">Escolha a tabela:</label>
    <select id="tabela" name="tabela" onchange="mostrarFormulario()">
        <option value="">-- Selecione --</option>
        <option value="usuario">Usuário</option>
        <option value="conta">Conta</option>
        <option value="categoria">Categoria</option>
        <option value="transacao">Transação</option>
        <option value="meta_financeira">Meta Financeira</option>
    </select>

    <!-- Formulário: Usuário -->
    <form id="form_usuario" class="formulario-tabela" style="display:none;" action="novosdados.php" method="POST">
        <input type="hidden" name="tabela" value="usuario">
        Nome: <input type="text" name="nome"><br>
        Senha: <input type="password" name="senha"><br>
        <button type="submit">Inserir</button>
    </form>

    <!-- Formulário: Conta -->
    <form id="form_conta" class="formulario-tabela" style="display:none;" action="novosdados.php" method="POST">
        <input type="hidden" name="tabela" value="conta">
        Nome: <input type="text" name="nome"><br>
        Tipo: 
        <select name="tipo">
            <option value="corrente">Corrente</option>
            <option value="poupança">Poupança</option>
            <option value="carteira">Carteira</option>
            <option value="outro">Outro</option>
        </select><br>
        Saldo Inicial: <input type="number" step="0.01" name="saldo_inicial"><br>
        ID do Usuário: <input type="number" name="fk_usuario"><br>
        <button type="submit">Inserir</button>
    </form>

    <!-- Formulário: Categoria -->
    <form id="form_categoria" class="formulario-tabela" style="display:none;" action="novosdados.php" method="POST">
        <input type="hidden" name="tabela" value="categoria">
        Nome: <input type="text" name="nome"><br>
        Tipo: 
        <select name="tipo">
            <option value="receita">Receita</option>
            <option value="despesa">Despesa</option>
        </select><br>
        <button type="submit">Inserir</button>
    </form>

    <!-- Formulário: Transação -->
    <form id="form_transacao" class="formulario-tabela" style="display:none;" action="novosdados.php" method="POST">
        <input type="hidden" name="tabela" value="transacao">
        Valor: <input type="number" step="0.01" name="valor"><br>
        Data: <input type="date" name="data_transacao"><br>
        Descrição: <input type="text" name="descricao"><br>
        Tipo: 
        <select name="tipo">
            <option value="receita">Receita</option>
            <option value="despesa">Despesa</option>
        </select><br>
        Conta (ID): <input type="number" name="db_conta"><br>
         Categoria: <select name="db_categoria">
            <option value="1">Salario </option>
            <option value="2">Alimentação</option>
            <option value="3">Transporte</option>
            <option value="4">Investimento</option>
            <option value="5">Snoopynho</option>
            <option value="6">Manutenção</option>
        </select><br>
        <button type="submit">Inserir</button>
    </form>

    <!-- Formulário: Meta Financeira -->
    <form id="form_meta_financeira" class="formulario-tabela" style="display:none;" action="novosdados.php" method="POST">
        <input type="hidden" name="tabela" value="meta_financeira">
        Título: <input type="text" name="titulo"><br>
        Valor Objetivo: <input type="number" step="0.01" name="valor_objetivo"><br>
        Valor Atual: <input type="number" step="0.01" name="valor_atual"><br>
        Data Limite: <input type="date" name="data_limite"><br>
        ID do Usuário: <input type="number" name="db_usuario"><br>
        <button type="submit">Inserir</button>
    </form>

</body>
</html>
