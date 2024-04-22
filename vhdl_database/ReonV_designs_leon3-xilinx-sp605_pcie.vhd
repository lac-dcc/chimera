library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.misc.all;

package pcie is
component pcie_master_fifo_sp605 is 
   generic (
     memtech       : integer := DEFMEMTECH;
     dmamst        : integer := NAHBMST;
     fifodepth     : integer := 5; 
     hslvndx       : integer := 0;
     device_id     : integer := 9;              -- PCIE device ID
     vendor_id     : integer := 16#10EE#;       -- PCIE vendor ID
     nsync         : integer range 1 to 2 := 2; -- 1 or 2 sync regs between clocks
     pcie_bar_mask : integer := 16#FFE#;
     haddr         : integer := 16#A00#;
     hmask         : integer := 16#fff#;
     pindex        : integer := 0;
     paddr         : integer := 0;
     pmask         : integer := 16#fff#
          ); 
   port( 
    rst           : in std_logic;
    clk           : in std_logic;
    -- System Interface
    sys_clk_p     : in std_logic;
    sys_clk_n     : in std_logic;
    sys_reset_n   : in std_logic;    
    -- PCI Express Fabric Interface
    pci_exp_txp   : out std_logic;
    pci_exp_txn   : out std_logic;
    pci_exp_rxp   : in std_logic;
    pci_exp_rxn   : in std_logic;
    ahbso         : out ahb_slv_out_type;  
    ahbsi         : in  ahb_slv_in_type;
    apbi          : in  apb_slv_in_type;
    apbo          : out apb_slv_out_type
  );
end component; 

component pcie_master_target_sp605 is 
  generic (
    master        : integer := 1;
    hmstndx       : integer := 0;
    hslvndx       : integer := 0;
    abits         : integer := 21;
    device_id     : integer := 9;               -- PCIE device ID
    vendor_id     : integer := 16#10EE#;        -- PCIE vendor ID
    pcie_bar_mask : integer := 16#FFE#;
    nsync         : integer range 1 to 2 := 2;  -- 1 or 2 sync regs between clocks
    haddr         : integer := 0;
    hmask         : integer := 16#fff#;
    pindex        : integer := 0;
    paddr         : integer := 0;
    pmask         : integer := 16#fff#
          ); 
  port( 
    rst           : in std_logic;
    clk           : in std_logic;
    -- System In  terface
    sys_clk_p     : in std_logic;
    sys_clk_n     : in std_logic;
    sys_reset_n   : in std_logic;
 
    -- PCI Express Fabric Interface
    pci_exp_txp   : out std_logic;
    pci_exp_txn   : out std_logic;
    pci_exp_rxp   : in std_logic;
    pci_exp_rxn   : in std_logic;
    -- AMBA Interface
    ahbso         : out ahb_slv_out_type;  
    ahbsi         : in  ahb_slv_in_type;
    apbi          : in  apb_slv_in_type;
    apbo          : out apb_slv_out_type;
    ahbmi         : in ahb_mst_in_type;
    ahbmo         : out ahb_mst_out_type
  );
end component; 

component pciedma is
  generic (
    memtech       : integer := DEFMEMTECH;
    dmstndx       : integer := 0;
    dapbndx       : integer := 0;
    dapbaddr      : integer := 0;
    dapbmask      : integer := 16#fff#;
    dapbirq       : integer := 0;
    blength       : integer := 16;
    fifodepth     : integer := 5;        -- FIFO depth
    device_id     : integer := 9;        -- PCI device ID
    vendor_id     : integer := 16#10EE#; -- PCI vendor ID
    slvndx        : integer := 0;
    apbndx        : integer := 0;
    apbaddr       : integer := 0;
    apbmask       : integer := 16#fff#;
    haddr         : integer := 16#A00#;
    hmask         : integer := 16#FFF#;
    nsync         : integer range 1 to 2 := 2;	-- 1 or 2 sync regs between clocks
    pcie_bar_mask : integer := 16#FFE#
    );
   port(
     rst         : in std_logic;
     clk         : in std_logic;
                 
     sys_clk_p   :  in std_logic;
     sys_clk_n   :  in std_logic;
     sys_reset_n :  in std_logic;
    
    -- PCI Express Fabric Interface
     pci_exp_txp :  out std_logic;
     pci_exp_txn :  out std_logic;
     pci_exp_rxp :  in std_logic;
     pci_exp_rxn :  in std_logic;

     dapbo       : out apb_slv_out_type;
     dahbmo      : out ahb_mst_out_type;
     apbi        : in apb_slv_in_type;
     apbo        : out apb_slv_out_type;
     ahbmi       : in  ahb_mst_in_type;
     ahbsi       : in  ahb_slv_in_type;
     ahbso       : out ahb_slv_out_type
);
end component; 
end;

