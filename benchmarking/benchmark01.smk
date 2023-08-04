# Snakefile
functions = ["info", "get", "list"]

rule all:
    input:
        expand("r_outputs/output_{function}.txt", function=functions),
        expand("python_outputs/output_{function}.txt", function=functions),
        expand("julia_outputs/output_{function}.txt", function=functions),
        expand("curl_outputs/output_{function}.txt", function=functions)

# Python benchmarking
rule benchmark_python:
    input:
        script="python_scripts/biokegg_{function}.py",
    output:
        "python_outputs/output_{function}.txt"
    shell:
        """
        /usr/bin/time -o "{output}" python3 {input.script}
        /usr/bin/time -a -o "{output}" python3 {input.script}
        /usr/bin/time -a -o "{output}" python3 {input.script}
        /usr/bin/time -a -o "{output}" python3 {input.script}
        /usr/bin/time -a -o "{output}" python3 {input.script}
        """

rule benchmark_r:
    input:
        script="r_scripts/keggrest_{function}.R",
    output:
        "r_outputs/output_{function}.txt"
    shell:
        """
        /usr/bin/time -o "{output}" Rscript {input.script}
        /usr/bin/time -a -o "{output}" Rscript {input.script}
        /usr/bin/time -a -o "{output}" Rscript {input.script}
        /usr/bin/time -a -o "{output}" Rscript {input.script}
        /usr/bin/time -a -o "{output}" Rscript {input.script}
        """

rule benchmark_julia:
    input:
        script="julia_scripts/keggapi_{function}.jl",
    output:
        "julia_outputs/output_{function}.txt"
    shell:
        """
        /usr/bin/time -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        """

rule benchmark_curl:
    input:
        script="shell_scripts/curl_{function}.sh",
    output:
        "curl_outputs/output_{function}.txt"
    shell:
        """
        /usr/bin/time -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        /usr/bin/time -a -o "{output}" julia {input.script}
        """