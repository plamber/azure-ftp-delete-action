# azure-ftp-delete-action
Azure Action to delete files from an Azure Website using the FTP command and a publishing profile

## Example usage

```
name: Cleanup
on: push
jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v2
      
    - name: Removes the files from the Azure Webapp
      uses: plamber/azure-ftp-delete-action@v1
      with:
        profile: ${{ secrets.AZUREPUBLISHINGPROFILE }}

```
