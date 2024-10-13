<%@ page language="java" contentType="text/html; charset=ISO-
8859-1"

pageEncoding="ISO-8859-1"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>R�sultat du Calcul IMC</title>
</head>
<body>
    <h2>R�sultats du calcul de l'IMC</h2>

    <% 
        // R�cup�rer les donn�es du formulaire
        double poids = Double.parseDouble(request.getParameter("poids"));
        double taille = Double.parseDouble(request.getParameter("taille"));
        int age = Integer.parseInt(request.getParameter("age"));
        String enceinte = request.getParameter("enceinte");
        String musclee = request.getParameter("musclee");

        // Calcul de l'IMC
        double imc = poids * 10000 / (taille * taille);

        // D�finir l'interpr�tation de l'IMC en fonction de l'OMS
        String interpretation = "";
        if (imc < 16) {
            interpretation = "Anorexie ou d�nutrition";
        } else if (imc < 18.5) {
            interpretation = "Maigreur";
        } else if (imc < 25) {
            interpretation = "Corpulence normale";
        } else if (imc < 30) {
            interpretation = "Surpoids";
        } else if (imc < 35) {
            interpretation = "Ob�sit� mod�r�e (Classe 1)";
        } else if (imc < 40) {
            interpretation = "Ob�sit� �lev�e (Classe 2)";
        } else {
            interpretation = "Ob�sit� morbide ou massive";
        }

        // Stocker les r�sultats dans les attributs de la requ�te
        request.setAttribute("imc", imc);
        request.setAttribute("interpretation", interpretation);
        request.setAttribute("age", age);
        request.setAttribute("enceinte", enceinte);
        request.setAttribute("musclee", musclee);
    %>

    <c:choose>
        <c:when test="${age < 18 || age > 65}">
            <p><strong>Attention !</strong> Cet outil n'est pas adapt� pour les personnes �g�es de moins de 18 ans ou de plus de 65 ans.</p>
        </c:when>
        <c:when test="${enceinte == 'oui'}">
            <p><strong>Attention !</strong> Cet outil n'est pas adapt� pour les femmes enceintes. Veuillez consulter un professionnel de la sant�.</p>
        </c:when>
       
        <c:when test="${musclee == 'oui'}">
            <p><strong>Attention !</strong> Cet outil peut ne pas refl�ter correctement votre corpulence en raison de votre musculature. Veuillez consulter un professionnel de la sant� pour un �valuation plus pr�cise.</p>
        </c:when>
       
        <c:otherwise>
            <p>Votre IMC est : <strong>${imc}</strong></p>
            <p>Interpr�tation de l'IMC selon l'OMS : <strong>${interpretation}</strong></p>
        </c:otherwise>
    </c:choose>

    <a href="index.html">Revenir au formulaire</a>
</body>
</html>
