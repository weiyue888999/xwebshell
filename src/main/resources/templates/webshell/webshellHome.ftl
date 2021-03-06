<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${base}/static/webshell/bootstrap-4.2.1.min.css">
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${base}/static/webshell/jquery-3.3.1.slim.min.js"></script>
    <script src="${base}/static/webshell/popper-1.14.6.min.js"></script>
    <script src="${base}/static/webshell/bootstrap-4.2.1.min.js"></script>


    <script type="text/javascript">
        window.addEventListener('resize', function () {
            var terminalSize = getTerminalSize();
            ws.send(JSON.stringify({ action: 'resize', cols: terminalSize.cols, rows: terminalSize.rows }));
            xterm.resize(terminalSize.cols, terminalSize.rows);
        });
    </script>

    <link href="${base}/static/webshell/xterm.css" rel="stylesheet" />
    <link href="${base}/static/webshell/main.css" rel="stylesheet" />
    <script src="${base}/static/webshell/xterm.js" type="text/javascript"></script>
    <script src="${base}/static/webshell/web-console.js?eleId=${eleId}" type="text/javascript"></script>
    <script type="text/javascript">
    	${startupJavaScript}
    </script>
    <title>${webshellURLObject.title}</title>
</head>

<body>
    <nav style="display:none;" class="navbar navbar-expand navbar-light bg-light flex-column flex-md-row bd-navbar">
        <a href="https://github.com/alibaba/arthas" target="_blank" title="" class="navbar-brand"><img src="static/png"
                alt="Arthas" title="Welcome to Arthas web console" style="height: 25px;" class="img-responsive"></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="https://alibaba.github.io/arthas" target="_blank">Documentation
                        <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://alibaba.github.io/arthas/arthas-tutorials" target="_blank">Online Tutorials</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://github.com/alibaba/arthas" target="_blank">Github</a>
                </li>
            </ul>
        </div>

        <form class="form-inline my-2 my-lg-0">
            <div class="col">
                <div class="input-group ">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="ip-addon">IP</span>
                    </div>
                    <input value="127.0.0.1" v-model="ip" type="text" class="form-control" name="ip" id="ip"
                        placeholder="please enter ip address" aria-label="ip" aria-describedby="ip-addon">
                </div>
            </div>

            <div class="col">
                <div class="input-group ">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="port-addon">Port</span>
                    </div>
                    <input value="8080" v-model="port" type="text" class="form-control" name="port" id="port"
                        placeholder="please enter port" aria-label="port" aria-describedby="port-addon">
                </div>
            </div>

            <div class="col-inline">
                <button title="connect" type="button" class="btn btn-info form-control" onclick="startConnect()">Connect</button>
                <button title="disconnect" type="button" class="btn btn-info form-control" onclick="disconnect()">Disconnect</button>
                <a target="_blank" href="arthas-output/" class="btn btn-info" role="button">Arthas Output</a>
            </div>

        </form>

    </nav>

    <div class="container-fluid px-0">
        <div class="col px-0" id="terminal-card${eleId}">
            <div id="terminal${eleId}"></div>
        </div>
    </div>

    <div title="fullscreen" id="fullSc${eleId}" class="fullSc">
        <button id="fullScBtn" onclick="xtermFullScreen()"><img src="${base}/static/webshell/fullsc.png"></button>
    </div>
</body>

</html>