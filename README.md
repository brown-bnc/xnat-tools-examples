# xnat-tools-examples

Sample scripts invoking [xnat-tools](https://github.com/brown-bnc/xnat-tools).
Thus far the scripts included assume you are working from oscar

## Getting started

Plase clone this repository. If this is your first time working with xnat-tools, you can use BNC's shared folder in Oscar.

### 1. Set-up the scripts

1. Login into Oscar

2. In the reminal navigate into the directory where you will download this code

   ```
   cd /gpfs/data/bnc/shared/xnat-tools-examples
   ```

3. Clone this repository

   ```
   git clone https://github.com/brown-bnc/xnat-tools-examples.git $USER
   ```

4. Make a logs directory

   ```
   cd $USER
   mkdir -m 775 logs
   ```

### 2. Set-up variables

1. Export your xnat user and password in the current session

```
export XNAT_USER=<user>
export XNAT_PASSWORD=<psswd>
export XNAT_SESSION=<xnat_session_accession_number>
```

⚠️ If you your code and data does not live in `/gpfs/data/bnc/shared` then you also need to make sure that `data_dir`, `bids_root_dir` and `bidsmap_file` inside `xnat2bids_single_session.sh` are correct

### 2. Run script

```
cd scripts
sbatch xnat2bids_single_session.sh
```
