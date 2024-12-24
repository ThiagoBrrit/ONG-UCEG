<%@page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title></title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="consulta.css">
    </head>
    <body>
        <%
            //variavel para acessar o banco de dados
            String database   = "webong" ;
            String enderecoBD = "jdbc:mysql://localhost:3306/" + database ;
            String usuarioBD  = "root" ;
            String senhaBD    = "" ;

            //Driver
            String driver = "com.mysql.jdbc.Driver" ;

            //Carregar o driver na memoria
            Class.forName( driver ) ;

            //Cria uma variavel para conexao com o banco de dados
            Connection conexao;

            //Abrir a conexao com o banco
            conexao = DriverManager.getConnection( enderecoBD, usuarioBD , senhaBD ) ;

            //comando para consultar no banco
            String sql = "SELECT * FROM dados " ;
            String sqll = "SELECT * FROM atividades " ;
            String sqlll = "SELECT * FROM incricao " ;

            //cria a variavel do tipo Statement
            PreparedStatement stm = conexao.prepareStatement( sql );
            PreparedStatement stmm = conexao.prepareStatement( sqll );
            PreparedStatement stmmm = conexao.prepareStatement( sqlll );

            //cria a variavel do tipo ResultSet
            //para armazenar os dados que estão banco
            ResultSet dados  = stm.executeQuery() ;
            ResultSet dadoss  = stmm.executeQuery() ;
            ResultSet dadosss  = stmmm.executeQuery() ;

            out.print("<h1>Dados</h1>") ;
            out.print("<table border=1>") ;

            while ( dados.next() )
            {
                out.print("<tr>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("codigo") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("nome_completo") ) ;                    
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("email") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("data_nascimento") ) ;
                    out.print("</td>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("numero_contato") ) ;
                    out.print("</td>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("genero") ) ;
                    out.print("</td>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("endereco") ) ;
                    out.print("</td>") ;                                        
                out.print("</tr>") ;
            }

            out.print("</table>") ;

            out.print("<h1>Atividades</h1>") ;
            out.print("<table border=1>") ;

                while ( dadoss.next() )
                {
                    out.print("<tr>") ;
                        out.print("<td>") ;
                            out.print( dadoss.getString("codigo") ) ;
                        out.print("</td>") ;
    
                        out.print("<td>") ;
                            out.print( dadoss.getString("atividades") ) ;                    
                        out.print("</td>") ;
    
                        out.print("<td>") ;
                            out.print( dadoss.getString("dias_participacao") ) ;
                        out.print("</td>") ;
    
                        out.print("<td>") ;
                            out.print( dadoss.getString("horario") ) ;
                        out.print("</td>") ;
                        out.print("<td>") ;
                            out.print( dadoss.getString("encontrou_ong") ) ;
                        out.print("</td>") ;
                        out.print("<td>") ;
                            out.print( dadoss.getString("retricao") ) ;
                        out.print("</td>") ;                                      
                    out.print("</tr>") ;
                }
    
                out.print("</table>") ;

                out.print("<h1>Inscrição</h1>") ;
                out.print("<table border=1>") ;

                    while ( dadosss.next() )
                    {
                        out.print("<tr>") ;
                            out.print("<td>") ;
                                out.print( dadosss.getString("codigo") ) ;
                            out.print("</td>") ;
        
                            out.print("<td>") ;
                                out.print( dadosss.getString("codigo_dados") ) ;                    
                            out.print("</td>") ;
                            out.print("<td>") ;
                                out.print( dadosss.getString("codigo_atividades") ) ;
                            out.print("</td>") ;
                            out.print("<td>") ;
                                out.print( dadosss.getString("data_inscricao") ) ;
                            out.print("</td>") ;                                       
                        out.print("</tr>") ;
                    }
        
                    out.print("</table>") ;


            
        %>
    </body>
</html>