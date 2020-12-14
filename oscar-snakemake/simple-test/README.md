## Getting Strated 


### Load latest anaconda module

```
module load anaconda/2020.02
```

### Create new environment from YAML

In your terminal, from the **current directory**, create a new environment using the given file

```
conda env create -f environment.yaml
```

### Activate the new environment

```
conda activate bnc-snakemake-test
```


### Virtualenv

I couldn't get conda to install a recent version

In current directory 


```
python3 -m venv .venv
source source .venv/bin/activate
python3 -m pip install snakemake
```

