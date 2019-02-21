<?php

    // declarar variável especificando seu tipo
    // $valor1 = (int) null;
    // $valor2 = (int) null;
    // $resultado = (float) null;
    // $operacao = (string) null;

    // gettype identifica o tipo de dados da variável
    // echo(gettype($valor1));

    // settype converte o tipo das variáveis(semelhante ao parse do javascript)
    // settype($valor1,'int');

    // echo("<br>".gettype($valor1));

    // var_dump($valor1);

    require_once('modulo.php');
    
    // Declaração de variáveis
    $valor1 = null;
    $valor2 = null;
    $resultado = null;
    $operacao = "";
    $verConta = "";


    if(isset($_POST['btn_calcular'])){
        // strtoupper() = converte a string em maiúscula
        // strtolower() = converte a string em minúscula
        $valor1 = $_POST['txt_valor1'];
        $valor2 = $_POST['txt_valor2'];
        
        if((!isset($_POST['txt_valor1']) || !isset($_POST['txt_valor2']) || !isset($_POST['rdo_operacao'])) || $valor1 == null || $valor2 == null){
            $resultado = VAZIO;
        }
        else{
            $operacao = $_POST['rdo_operacao'];
            
            if(!is_numeric($valor1) || !is_numeric($valor2)) {
                $resultado = INVALIDO;
            }else{
                $resultado = calcular($valor1, $valor2, $operacao);
            }
        }
    }

?>

<html>
    <head>
        <script>
            const validar = (caracter) =>{
                /* Verifica em qual padrão de navegador o caractér está sendo enviado
                se for pelo padrão 'event' então utilizamos 'charCode', caso contrátio, utilizamos 'which1' */
                if(window.event)
                    // Tranforma o caracter em ASCII
                    var letra = caracter.charCode;
                else
                    // Tranforma o caracter em ASCII
                    var letra = caracter.which
                //Verifica se o ASCII do caracter digitado esta entrew 48 e 57, que corresponde aos numeros de 0 até 9
                if(letra < 48 || letra > 57){
                    if(letra != 46 && letra != 44)
                    //FV
                    // Cancelando o evento 'keypress', ou seja, não deixa a tecla ir para a caixa
                    return false;
                    
                }
            }
        </script>
        <link rel="stylesheet" href="css/styleCalc.css">
        <title>

        </title>
    </head>
    <body>
        <div id="all">
            <div id="header">
                <h1 id="title-header"> CALCULADORA SIMPLES </h1>
            </div>
            <form name="frm-calculator" method="post" action="">
                <div id="content-left">
                    <div id="values">
                        <h4 id="valor1">Valor 1:</h4>
                        <input onkeypress="return validar(event);" type="text" id="txt-valor1" name="txt_valor1" value="<?php echo($valor1) ?>">
                        <h4 id="valor2">Valor 2:</h4>
                        <input onkeypress="return validar(event);" type="text" id="txt-valor2" name="txt_valor2" value="<?php echo($valor2) ?>">
                    </div>
                    <div id="radios">
                        <input type="radio" class="radios" name="rdo_operacao" <?php echo($operacao =='somar' ? "checked" : ""); ?> value="somar"> Somar<br>
                        <input type="radio" class="radios" name="rdo_operacao" <?php echo($operacao =='subtrair' ? "checked" : ""); ?> value="subtrair"> Subtrair<br>
                        <input type="radio" class="radios" name="rdo_operacao" <?php echo($operacao =='multiplicar' ? "checked" : ""); ?> value="multiplicar"> Multiplicar<br>
                        <input type="radio" class="radios" name="rdo_operacao" <?php echo($operacao =='dividir' ? "checked" : ""); ?> value="dividir"> Dividir
                    </div>
                    <div id="submit">
                        <input id="btn-submit" type="submit" name="btn_calcular" value="Calcular">
                        <input id="btn-limpar" type="reset" name="btn_limpar" value="Limpar">
                    </div>
                </div>
                <div id="content-right">
                    <div id="right-head">
                        <h3 id="title-right">Resultados:</h3>
                    </div>
                    <div id="right-box">
                        <p id="operacao"><?php echo($valor2 == 0 ? "" : strtoupper($operacao)); ?></p>
                        <p id="conta"><?php echo($verConta); ?>
                        </p>
                        <p id="txt-result"><?php echo($resultado); ?></p>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>