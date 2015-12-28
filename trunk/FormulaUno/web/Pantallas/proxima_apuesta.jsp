<%@page import="java.util.HashMap"%>
<%
long antiCache=System.currentTimeMillis();

HashMap datosCarrera = (HashMap) request.getAttribute("datosCarrera");

if(datosCarrera==null){
    datosCarrera=new HashMap();
}
String nombre_carrera = (String) datosCarrera.get("nombre");
String fecha_carrera = (String) datosCarrera.get("fecha_carrera");
String fecha_cierre_apuestas = (String) datosCarrera.get("fecha_cierre_apuestas");
String fecha_carrera_formateada = (String) datosCarrera.get("fecha_carrera_formateada");
String fecha_cierre_apuestas_formateada = (String) datosCarrera.get("fecha_cierre_apuestas_formateada");
%>
<script type="text/javascript">
    var mensaje="";
    function lanzarAltaApuesta(){
        if(validarApuesta())
            document.frmDatosProxApuesta.submit();
        else
            alert(mensaje);
    }
    function validarApuesta(){
        mensaje="";
        var validacionApuestas=new Array(10);
        validacionApuestas[0]=document.frmDatosProxApuesta.primero.options[document.frmDatosProxApuesta.primero.selectedIndex].value;
        validacionApuestas[1]=document.frmDatosProxApuesta.segund.options[document.frmDatosProxApuesta.segund.selectedIndex].value;
        validacionApuestas[2]=document.frmDatosProxApuesta.tercero.options[document.frmDatosProxApuesta.tercero.selectedIndex].value;
        validacionApuestas[3]=document.frmDatosProxApuesta.cuarto.options[document.frmDatosProxApuesta.cuarto.selectedIndex].value;
        validacionApuestas[4]=document.frmDatosProxApuesta.quinto.options[document.frmDatosProxApuesta.quinto.selectedIndex].value;
        validacionApuestas[5]=document.frmDatosProxApuesta.sexto.options[document.frmDatosProxApuesta.sexto.selectedIndex].value;
        validacionApuestas[6]=document.frmDatosProxApuesta.septimo.options[document.frmDatosProxApuesta.septimo.selectedIndex].value;
        validacionApuestas[7]=document.frmDatosProxApuesta.octavo.options[document.frmDatosProxApuesta.octavo.selectedIndex].value;
        validacionApuestas[8]=document.frmDatosProxApuesta.noveno.options[document.frmDatosProxApuesta.noveno.selectedIndex].value;
        validacionApuestas[9]=document.frmDatosProxApuesta.decimo.options[document.frmDatosProxApuesta.decimo.selectedIndex].value;

        for(var i=0; i<validacionApuestas.length;i++){
            if(validacionApuestas[i]==""){
                mensaje="Has dejado algún puesto en blanco.";
                return false;
            }
            
            for(var j=i+1;j<validacionApuestas.length;j++){
                if(validacionApuestas[i]==validacionApuestas[j]){
                    mensaje="Hay pilotos repetidos entre los 10 primeros.";
                    return false;
                }
            }
        }

        if(document.frmDatosProxApuesta.pole.options[document.frmDatosProxApuesta.pole.selectedIndex].value==""){
            mensaje="Te falta por elegir la pole.";
            return false;
        }

        return true;
    }
</script>

<h1>Mi apuesta para el <%=nombre_carrera%>.</h1>
<div style="width:360px;float:left;">
    <FORM name="frmDatosProxApuesta" method="post" action="./guardarApuesta.f1?antiCache=<%=antiCache%>">
        <input type="hidden" name="accion" value="alta"/>
        <p>
            <label class="posicionesLabel" for="pole">Pole:</label>
            <select name="pole">
                <jsp:include page="./comboPilotos.jsp?indSelect=pole" flush="false"/>
            </select>
        </p>
        <hr style="width:85%"/>
        <p>
            <label class="posicionesLabel" for="primero">Primer clasificado:</label>
            <select name="primero">
                <jsp:include page="./comboPilotos.jsp?indSelect=primero" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="segund">Segundo clasificado:</label>
            <select name="segund">
                <jsp:include page="./comboPilotos.jsp?indSelect=segundo" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="tercero">Tercer clasificado:</label>
            <select name="tercero">
                <jsp:include page="./comboPilotos.jsp?indSelect=tercero" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="cuarto">Cuarto clasificado:</label>
            <select name="cuarto">
                <jsp:include page="./comboPilotos.jsp?indSelect=cuarto" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="quinto">Quinto clasificado:</label>
            <select name="quinto">
                <jsp:include page="./comboPilotos.jsp?indSelect=quinto" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="sexto">Sexto clasificado:</label>
            <select name="sexto">
                <jsp:include page="./comboPilotos.jsp?indSelect=sexto" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="septimo">Séptimo clasificado:</label>
            <select name="septimo">
                <jsp:include page="./comboPilotos.jsp?indSelect=septimo" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="octavo">Octavo clasificado:</label>
            <select name="octavo">
                <jsp:include page="./comboPilotos.jsp?indSelect=octavo" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="noveno">Noveno clasificado:</label>
            <select name="noveno">
                <jsp:include page="./comboPilotos.jsp?indSelect=noveno" flush="false"/>
            </select><br /><br />
            <label class="posicionesLabel" for="decimo">Décimo clasificado:</label>
            <select name="decimo">
                <jsp:include page="./comboPilotos.jsp?indSelect=decimo" flush="false"/>
            </select>
            <BR />
            <BR />
             <%
            String permiteGuardar=(String)request.getAttribute("permiteGuardar");
            if(permiteGuardar==null) permiteGuardar="N";
            if(permiteGuardar.equals("S")){%>
                <span style="float:right;">
                <a href="#" onclick="lanzarAltaApuesta();" class="enlacef1">Guardar apuesta</a>
                </span>
            <%}
            %>
        </p>
    </FORM>
</div>
<div style="width:350px;float:left;text-align:center;">
    <BR />
    <BR />
    <BR />
    <BR />
    Próximo GP: <b><%=nombre_carrera%></b><BR />
    <%=fecha_carrera_formateada%><BR />
    Cierre de las apuestas: <%=fecha_cierre_apuestas_formateada%>
    <BR /><BR />
    <%
        String indAviso=(String)request.getAttribute("indAviso");
        if(indAviso==null) indAviso="N";
        if(indAviso.equals("S")){%>
            <div id="divConfirmacion">
                Tu apuesta se ha guardado correctamente.<BR /><BR />
                Puedes cambiarla todas las veces que quieras hasta el cierre de apuestas.
            </div>
            <script type="text/javascript">
                function ocultaDivConfirm(){
                    document.getElementById("divConfirmacion").style.display="none";
                }
                setTimeout("ocultaDivConfirm()",6000);
            </script>
        <%}
        %>
</div>