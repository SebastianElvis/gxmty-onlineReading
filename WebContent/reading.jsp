<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/gxmty/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/gxmty/css/modern-business.css" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="/gxmty/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
		#the-pdf{
			width:100%;
		}
		
		#prev{
			float:left;
		}
		#next{
			float:right;
		}
		#page{
			text-align:center;
			position:relative;
		}
	</style>
</head>

<body>

    <!-- Navigation -->
    <s:include value="./templates/navigation.html"/>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">One Column Portfolio
                    <small>Subheading</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">One Column Portfolio</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Project One -->
        <div class="row">
        	<span id="decodedUri">
        		<s:property value="decodedUri"/>
        	</span>
        </div>
        <div class="row">
        
            <div class="col-md-8">
                <div>
                	<h5 id="page">Page: <span id="page_num"></span> / <span id="page_count"></span></h5>
                    <button id="prev" class="btn btn-primary" onClick="goPrevious()">←</button>
                    <button id="next" class="btn btn-primary" onClick="goNext()">→</button>
                </div>
                <canvas id="the-pdf" style="border:1px solid black"></canvas>
            </div>
            
            <div class="col-md-4">
                <h3>Notes</h3>
                <h4>Make notes as you wish</h4>
                <p></p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <s:include value="templates/footer.html" />

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="/gxmty/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/gxmty/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="/gxmty/js/pdf.js"></script>
    <script type="text/javascript">
    //
    // NOTE: 
    // Modifying the URL below to another server will likely *NOT* work. Because of browser
    // security restrictions, we have to use a file server with special headers
    // (CORS) - most servers don't support cross-origin browser requests.
    //
    
    
    //var url = $("#decodedUri").val();
    var url = '/gxmty/test.pdf';
    
    //
    // Disable workers to avoid yet another cross-origin issue (workers need the URL of
    // the script to be loaded, and currently do not allow cross-origin scripts)
    //
    PDFJS.disableWorker = true;

    var pdfDoc = null,
        pageNum = 1,
        scale = 1.5,
        canvas = document.getElementById('the-pdf'),
        ctx = canvas.getContext('2d');

    //
    // Get page info from document, resize canvas accordingly, and render page
    //
    function renderPage(num) {
      // Using promise to fetch the page
      pdfDoc.getPage(num).then(function(page) {
        var viewport = page.getViewport(scale);
        canvas.height = viewport.height;
        canvas.width = viewport.width;

        // Render PDF page into canvas context
        var renderContext = {
          canvasContext: ctx,
          viewport: viewport
        };
        page.render(renderContext);
      });

      // Update page counters
      document.getElementById('page_num').textContent = pageNum;
      document.getElementById('page_count').textContent = pdfDoc.numPages;
    }

    //
    // Go to previous page
    //
    function goPrevious() {
      if (pageNum <= 1)
        return;
      pageNum--;
      renderPage(pageNum);
    }

    //
    // Go to next page
    //
    function goNext() {
      if (pageNum >= pdfDoc.numPages)
        return;
      pageNum++;
      renderPage(pageNum);
    }

    //
    // Asynchronously download PDF as an ArrayBuffer
    //
    PDFJS.getDocument(url).then(function getPdfHelloWorld(_pdfDoc) {
      pdfDoc = _pdfDoc;
      renderPage(pageNum);
    });
    </script>  

</body>

</html>
