# xnat-tools-examples

Sample scripts invoking [xnat-tools](https://github.com/brown-bnc/xnat-tools).

## Getting started in Oscar

Please clone this repository. If this is your first time working with xnat-tools, you can use BNC's shared folder in Oscar.

### Set-up the scripts

1. Login into Oscar

2. In the terminal navigate into the directory where you will download this code

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

5. Navigate to scripts folder
   ```
   cd oscar-sbatch
   ```

6. Set-up variables/secrets

   Create a `.env` file inside the current directory and place your secrets

   ⚠️ At the end of this session you should delete the file, or at least your password

   ```
   XNAT_USER=<user>
   XNAT_PASSWORD=<psswd>
   XNAT_SESSION=<xnat_session_accession_number>
   ```

   ⚠️ If you your code and data does not live in `/gpfs/data/bnc/shared` then you also need to make sure that `data_dir`, `bids_root_dir` and `bidsmap_file` inside `xnat2bids_single_session.sh` are correct

7. Run script

   ```
   sbatch xnat2bids_single_session.sh
   ```

8. View logs

   ```
   cat ../logs/<jobid>.txt
   ```

