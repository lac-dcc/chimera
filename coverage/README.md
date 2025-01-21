# Coverage experiments

In this directory there are scripts that can be used to test different EDA tools
with respect to code coverage.
[Clang's source-based code coverage](https://clang.llvm.org/docs/SourceBasedCodeCoverage.html)
is used to compile and instrument these tools for coverage. There are scripts
available here that will properly configure and compile the tools for code
coverage.

The `run_coverage_experiments.py` script can be used to run experiments and
produce charts which evaluate the code coverage percentage that different
datasets achieve for different tools.

The currently supported tools are:

- Verible's syntactic analyzer
- Verible's code formatter
- Verible's code obfuscator
- Icarus Verilog's parser
- Verilator

More tools can be added to these experiments by including them to the YAML
configuration file `config/coverage_config.yaml`. Futhermore it is necessary to
add support to the new tool in the `run_coverage.sh` script.

## Docker

There are many different depedencies that are needed to make these experiments
work. To ease this process, we have made a Dockerfile which you can use to
automatically install and configure the dependencies for this experiment.

### Configuring the Docker image

You will need to have Docker installed in your machine. You can take a look at
[Docker's website](https://docs.docker.com/desktop/install/linux-install/)
on how to install it.

Once Docker is installed, you can run the following command in the `docker`
directory (you might need root access to run these commands):

    docker build -t chimera .

Once this command finishes, you can access the container using this command:

    docker run -it chimera

## Running coverage experiments
To run the coverage experiment, you can simply run this command inside the
`coverage` directory:
    
    python3 scripts/run_coverage_experiments.py

This experiment may take a long time to finish (almost 40 hours). Thus, you
might want to run it in the background using something like the
[`nohup` command](https://www.man7.org/linux/man-pages/man1/nohup.1.html).

Alternatively, if you are using our Docker image, you can also use the
`--detach` (`-d`) option. For instance, you can run this command to run the
script for experiemnts in a Docker container in the background:

    docker run -d --rm -w /root/chimera/coverage chimera -c "python3 scripts/run_coverage_experiments.py"
