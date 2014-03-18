<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>

    <h2><fmt:message key="info"> </fmt:message></h2>

    <table class="table table-striped" style="width:600px;">
        <tr>
            <th><fmt:message key="name"> </fmt:message></th>
            <td><b><c:out value="${owner.firstName} ${owner.lastName}"/></b></td>
        </tr>
        <tr>
            <th><fmt:message key="adress"> </fmt:message></th>
            <td><c:out value="${owner.address}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="city"> </fmt:message></th>
            <td><c:out value="${owner.city}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="tel"> </fmt:message></th>
            <td><c:out value="${owner.telephone}"/></td>
        </tr>
         <tr>
            <td> 
            	<spring:url value="{ownerId}/edit.html" var="editUrl">
                    <spring:param name="ownerId" value="${owner.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(editUrl)}" class="btn btn-info">Editar Proprietários</a></td>
            <td>
            	<spring:url value="{ownerId}/pets/new.html" var="addUrl">
                    <spring:param name="ownerId" value="${owner.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(addUrl)}"  class="btn btn-success">Adicionar novo animal de estimação</a></td>
        </tr>
    </table>

    <h2><fmt:message key="donos"> </fmt:message></h2>

    <c:forEach var="pet" items="${owner.pets}">
        <table class="table" style="width:600px;">
            <tr>
                <td valign="top" style="width: 120px;">
                    <dl class="dl-horizontal">
                        <dt><fmt:message key="name"> </fmt:message></dt>
                        <dd><c:out value="${pet.name}"/></dd>
                        <dt><fmt:message key="niver"> </fmt:message></dt>
                        <dd><joda:format value="${pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt><fmt:message key="type"> </fmt:message></dt>
                        <dd><c:out value="${pet.type.name}"/></dd>
                    </dl>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                        <tr>
                            <th><fmt:message key="visitdate"> </fmt:message></th>
                            <th><fmt:message key="descricao"> </fmt:message></th>
                        </tr>
                        </thead>
                        <c:forEach var="visit" items="${pet.visits}">
                            <tr>
                                <td><joda:format value="${visit.date}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${visit.description}"/></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td> 
                            	<spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
			                        <spring:param name="ownerId" value="${owner.id}"/>
			                        <spring:param name="petId" value="${pet.id}"/>
			                    </spring:url>
			                    <a href="${fn:escapeXml(petUrl)}">Editar Animal de estimação</a>
			                </td>
                            <td>
			                    <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
			                        <spring:param name="ownerId" value="${owner.id}"/>
			                        <spring:param name="petId" value="${pet.id}"/>
			                    </spring:url>
			                    <a href="${fn:escapeXml(visitUrl)}">Adicionar Visitante</a>
                            </td>
                       	</tr>
                    </table>
                </td>
            </tr>
        </table>
    </c:forEach>

    <jsp:include page="../fragments/footer.jsp"/>

</div>

</body>

</html>
