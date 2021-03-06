<%@ page contentType="text/html;charset=UTF-8" %>
<html>

    <head>
        <title>Field guide produced by ALA using aggregated sources</title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'fieldguide.css')}" type="text/css">
        <link rel="shortcut icon" type="image/x-icon" href="${resource(file: 'favicon.ico')}">
    </head>

    <body>
        <img src="${resource(dir: 'images', file: 'fieldguide-header.jpg')}" width="100%" style="margin-bottom: 10px"/>

        <a href="${data.link}" >${data.title} - click here to view original query</a>

        <g:each var="family" in="${data.families}">
           <g:each var="commonName" in="${family.value}" status="i" >
                <g:each var="taxon" in="${commonName.value}" status="j">
                    <div>
                        <g:if test="${i == 0}">
                            <h2>${family.key}</h2>
                        </g:if>
                        <g:if test="${j == 0}">
                            <h3>${commonName.key}</h3>
                        </g:if>
                        <h4>${taxon.scientificName}</h4>
                        <g:if test="${taxon.imageURL != null}">
                            <img src="${taxon.imageURL.replace('raw','smallRaw')}" />
                        </g:if>
                        <img src=" ${grailsApplication.config.service.biocache.ws.url}/density/map?q=lsid:%22${taxon.guid}%22%20AND%20geospatial_kosher:true" width="30%"/>
                    </div>
                </g:each>
            </g:each>
        </g:each>

        <h1>Attribution</h1>
        <g:each var="family" in="${data.families}">
            <g:each var="commonName" in="${family.value}" status="i" >
                <g:each var="taxon" in="${commonName.value}" status="j">
                    <div>
                        <h4>${taxon.scientificName}</h4>
                        <g:if test="${ taxon.taxonInfosourceName }">
                            <h5>Taxonomic information supplied by: <a href="${taxon.taxonInfosourceURL}">${taxon.taxonInfosourceName}</a></h5>
                        </g:if>
                        <g:if test="${ taxon.taxonInfosourceName }">
                            <h5>Image sourced from: <a href="${taxon.imageInfosourceURL}">${taxon.imageInfosourceName}</a></h5>
                        </g:if>
                        <g:if test="${ taxon.imageCreator }">
                            <h5>Image by: <a href="${taxon.imageisPartOf}">${taxon.imageCreator}</a></h5>
                        </g:if>
                        <g:if test="${ taxon.imageRights }">
                            <h5>Image rights: ${taxon.imageRights}</h5>
                        </g:if>
                    </div>
                </g:each>
            </g:each>
        </g:each>

    </body>
</html>