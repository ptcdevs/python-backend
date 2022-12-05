def parse_uvicorn(sys_argv):
    host = sys_argv[sys_argv.index("--host") + 1] if "--host" in sys_argv else "127.0.0.1"
    port = sys_argv[sys_argv.index("--port") + 1] if "--port" in sys_argv else "8000"

    return (host, port)
