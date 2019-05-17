# lvm_vol
## Create logical volume with specified size, format filesystem, mount to specified mountpoint

[Variables][Used Variables]

## Variables

1. volname:
    * example: hdbdatalog
2. vg_name:
    * example: vghdbdatalog
3. lv_size: 
    * example: 25g or 100%FREE
4. mountpoint: 
    * example: /mnt/hana/data_log
5. fstype: 
    * example: xfs
6. mnt_opts:
    * example: defaults
7. lv_action: 
    * example "create" | "delete"
8. lv_opts:
    * example "--stripes 8 --stripesize 256"
