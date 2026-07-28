{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
	      size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            # root = {
            #   size = "100%";
            #   content = {
            #     type = "btrfs";
            #     extraArgs = [ "-f" ]; # Override existing partition
            #     mountpoint = "/";
            #     mountOptions = [
            #       "compress=zstd"
            #       "noatime"
            #     ];
            #   };
            # };
	    zfs = {
	    	size = "100%";
		content = {
		  type = "zfs";
		  pool = "zroot";
		};
	    };
          };
        };
       };
      };
      zpool = {
      	zroot = {
	  type = "zpool";
	  rootFsOptions = {
	    acltype = "posixacl";
	    atime = "off";
	    compression = "zstd";
	    mountpoint = "none";
	    xattr = "sa";
	  };
	  options.ashift = "12";

	  datasets = {
	    "local" = {
	      type = "zfs_fs";
	      mountpoint = "/home";
	      options."com.sun:auto-snapshot" = "true";
	    };
	    "local/nix" = {
	      type = "zfs_fs";
	      mountpoint = "/nix";
	      options."com.sun:auto-snapshot" = "false";
	    };
	    "local/root" = {
	      type = "zfs_fs";
	      mountpoint = "/";
	      options."com.sun:auto-snapshot" = "false";
	      postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^zroot/local/root@blank$' || zfs snapshot zroot/local/root@blank";
	    };
	  };
	};
      };
  };
}
