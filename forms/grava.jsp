<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sucesso</title>

    <style>
        body {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 999;
        }

        .alert {
            width: 400px;
            background-color: #EBEBEB;
            padding: 18px;
            box-shadow: 0 2px 5px #000000a8;
            border: #787878;
            border-radius: 16px;
        }

        .sucesso {
        display: flex;
        flex-direction: row;
        align-items: center;
        }

        span {
        color: #7312BE;
        font-size: 2rem;
        font-family: "Roboto", sans-serif;
        font-weight: 500;
        }

        hr {
        height: 2px;
        background-color: #c0c0c0;
        border: none;
        }

        p {
        font-size: 1rem;
        font-family: "Roboto", sans-serif;
        font-weight: 400;
        }
    </style>
</head>

<body>
    <div class="alert" id="alertSucesso">
        <div class="content">
            <div class="sucesso">
                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="#7312BE"
                    class="bi bi-check-all" viewBox="0 0 16 16">
                    <path
                        d="M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486z" />
                </svg>
                <span>Sucesso</span>
            </div>
            <hr id="hr_test">
            <p>Parabéns! Você deu o primeiro passo para se juntar à nossa comunidade esportiva!</p>
        </div>
    </div>

    <%@page language="java" import="java.sql.*" %>
<%

    //dados
    String vnome = request.getParameter("nome_completo");
    String vemail = request.getParameter("email");
    String vdata = request.getParameter("data_nascimento");
    String vcontato = request.getParameter("celular");
    String vgenero = request.getParameter("genero");
    String vendereco = request.getParameter("endereco");

    //atividades
    String vatividades = request.getParameter("participacao");
    String vdias = request.getParameter("dias_participacao");
    String vhorario = request.getParameter("horario");
    String vfould = request.getParameter("como_soube_ong");
    String vretriscao = request.getParameter("restricoes");

    //variaveis para o banco de dados
    String banco    = "webong" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql como o comando INSERT
    String sqlDados = "INSERT INTO dados (nome_completo, email, data_nascimento, numero_contato, genero, endereco) values (?,?,?,?,?,?)";

    PreparedStatement stmDados = conexao.prepareStatement(sqlDados, Statement.RETURN_GENERATED_KEYS) ;
    stmDados.setString( 1 , vnome) ;
    stmDados.setString( 2 , vemail ) ;
    stmDados.setString( 3 , vdata ) ;
    stmDados.setString( 4 , vcontato ) ;
    stmDados.setString( 5 , vgenero ) ;
    stmDados.setString( 6 , vendereco ) ;
    stmDados.execute() ;

    ResultSet rsDados = stmDados.getGeneratedKeys();
        int idDados = 0;
        if (rsDados.next()) {
            idDados = rsDados.getInt(1);
        }
    stmDados.close() ;

    String sqlAtividades = "INSERT INTO atividades (atividades, dias_participacao, horario, encontrou_ong, retricao) values (?,?,?,?,?)";

    PreparedStatement stmAtividades = conexao.prepareStatement(sqlAtividades, Statement.RETURN_GENERATED_KEYS) ;
    stmAtividades.setString( 1 , vatividades) ;
    stmAtividades.setString( 2 , vdias ) ;
    stmAtividades.setString( 3 , vhorario ) ;
    stmAtividades.setString( 4 , vfould ) ;
    stmAtividades.setString( 5 , vretriscao ) ;
    stmAtividades.execute() ;

    ResultSet rsAtividades = stmAtividades.getGeneratedKeys();
        int idAtividades = 0;
        if (rsAtividades.next()) {
            idAtividades = rsAtividades.getInt(1);
        }

    stmAtividades.close() ;

    String sqlInscricao = "INSERT INTO incricao (codigo_dados, codigo_atividades, data_inscricao) values (?,?,?)";

    PreparedStatement stmInscricao = conexao.prepareStatement(sqlInscricao);
    stmInscricao.setInt(1, idDados);
    stmInscricao.setInt(2, idAtividades);

    java.util.Date dataAtualUtil = new java.util.Date(); // Data e hora atual no formato util.Date
    java.sql.Date dataAtualSQL = new java.sql.Date(dataAtualUtil.getTime()); // Converte para java.sql.Date
    stmInscricao.setDate(3, dataAtualSQL);

    stmInscricao.executeUpdate();
    stmInscricao.close();
%>

<script>
    
        setTimeout(() => {
            window.location.href = "../home/home.html";
        }, 3000);

</script>

</body>
</html>
