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
use IEEE.NUMERIC_bit.all;
package pcie is
  type pci_ahb_dma_in_type is record
    address         : std_logic_vector(31 downto 0);
    wdata           : std_logic_vector(31 downto 0);
    start           : std_ulogic;
    burst           : std_ulogic;
    write           : std_ulogic;
    busy            : std_ulogic;
    irq             : std_ulogic;
    size            : std_logic_vector(1 downto 0);
  end record;

  type pci_ahb_dma_out_type is record
    start           : std_ulogic;
    active          : std_ulogic;
    ready           : std_ulogic;
    retry           : std_ulogic;
    mexc            : std_ulogic;
    haddr           : std_logic_vector(9 downto 0);
    rdata           : std_logic_vector(31 downto 0);
  end record;

  type data_vector_to_check is array (natural range <>) of std_logic_vector(31 downto 0);


component pciedma is
  generic (
    fabtech       : integer := DEFFABTECH;  
    memtech       : integer := DEFMEMTECH;
    dmstndx       : integer := 0;
    dapbndx       : integer := 0;
    dapbaddr      : integer := 0;
    dapbmask      : integer := 16#fff#;
    dapbirq       : integer := 0;
    blength       : integer := 16;
    abits         : integer := 21;
    dmaabits      : integer := 26;
    fifodepth     : integer := 5;               -- FIFO depth
    device_id     : integer := 0;               -- PCI device ID
    vendor_id     : integer := 0;               -- PCI vendor ID
    slvndx        : integer := 0;
    apbndx        : integer := 0;
    apbaddr       : integer := 0;
    apbmask       : integer := 16#fff#;
    haddr         : integer := 16#A00#;
    hmask         : integer := 16#FFF#;
    nsync         : integer range 1 to 2 := 2;  -- 1 or 2 sync regs between clocks
    pcie_bar_mask : integer := 16#ffe#;
    lane_width    : integer := 1;
    Gen           : integer := 1    );
   port(
    rst           : in std_logic;
    clk           : in std_logic;
                  
    sys_clk_p     : in std_logic;--check needed
    sys_clk_n     : in std_logic;--
    sys_reset_n   : in std_logic;
    
    -- PCI Express Fabric Interface
    pci_exp_txp   : out std_logic_vector(lane_width-1 downto 0);
    pci_exp_txn   : out std_logic_vector(lane_width-1 downto 0);
    pci_exp_rxp   : in  std_logic_vector(lane_width-1 downto 0);
    pci_exp_rxn   : in  std_logic_vector(lane_width-1 downto 0);
--    trn_clk     :  out std_logic;

    dapbo         : out apb_slv_out_type;
    dahbmo        : out ahb_mst_out_type;
    apbi          : in  apb_slv_in_type;
    apbo          : out apb_slv_out_type;
    ahbmi         : in  ahb_mst_in_type;
    ahbsi         : in  ahb_slv_in_type;
    ahbso         : out ahb_slv_out_type
);
end component;

component pcie_master_target_virtex is 
  generic (  
    fabtech        : integer := DEFFABTECH;  
    hmstndx        : integer := 0;
    hslvndx        : integer := 0;
    abits          : integer := 21;
    device_id      : integer := 9;              -- PCIE device ID
    vendor_id      : integer := 16#10EE#;       -- PCIE vendor ID
    pcie_bar_mask  : integer := 16#FFE#;
    nsync          : integer range 1 to 2 := 2; -- 1 or 2 sync regs between clocks
    haddr          : integer := 0;
    hmask          : integer := 16#fff#;
    pindex         : integer := 0;
    paddr          : integer := 0;
    pmask          : integer := 16#fff#;
    Master         : integer := 1;
    lane_width     : integer := 1;
    Gen            : integer := 1
          ); 
  port(
    rst            : in  std_logic;
    clk            : in  std_logic;
    -- System Interface
    sys_clk_p      : in  std_logic;
    sys_clk_n      : in  std_logic;
    sys_reset_n    : in  std_logic;
    -- PCI Express Fabric Interface
    pci_exp_txp    : out std_logic_vector(lane_width-1 downto 0);
    pci_exp_txn    : out std_logic_vector(lane_width-1 downto 0); 
    pci_exp_rxp    : in  std_logic_vector(lane_width-1 downto 0);
    pci_exp_rxn    : in  std_logic_vector(lane_width-1 downto 0);
    -- AMBA Interface
    ahbso          : out ahb_slv_out_type;  
    ahbsi          : in  ahb_slv_in_type;
    apbi           : in  apb_slv_in_type;
    apbo           : out apb_slv_out_type;
    ahbmi          : in  ahb_mst_in_type;
    ahbmo          : out ahb_mst_out_type

  );
end component;

component pcie_master_fifo_virtex is 
  generic (
    fabtech:          integer := DEFFABTECH;  
    memtech:          integer := DEFMEMTECH;
    dmamst:           integer := NAHBMST;
    fifodepth:        integer := 5;               -- FIFO depth
    hslvndx:          integer := 0;
    abits:            integer := 21;
    device_id:        integer := 9;               -- PCIE device ID
    vendor_id:        integer := 16#10EE#;        -- PCIE vendor ID
    pcie_bar_mask:    integer := 16#FFE#;
    nsync:            integer range 1 to 2 := 2;  -- 1 or 2 sync regs between clocks
    haddr:            integer := 16#A00#;
    hmask:            integer := 16#fff#;
    pindex:           integer := 0;
    paddr:            integer := 0;
    pmask:            integer := 16#fff#;
    lane_width:       integer := 1;
    Gen:              integer := 1
         ); 
  port(
    rst              : in  std_logic;
    clk              : in  std_logic;
    -- System Interface
    sys_clk_p        : in  std_logic;
    sys_clk_n        : in  std_logic;
    sys_reset_n      : in  std_logic;
    -- PCI Express Fabric Interface
    pci_exp_txp      : out std_logic_vector(lane_width-1 downto 0);
    pci_exp_txn      : out std_logic_vector(lane_width-1 downto 0); 
    pci_exp_rxp      : in  std_logic_vector(lane_width-1 downto 0);
    pci_exp_rxn      : in  std_logic_vector(lane_width-1 downto 0);

    -- AMBA Interface
    ahbso            : out ahb_slv_out_type;  
    ahbsi            : in  ahb_slv_in_type;
    apbi             : in  apb_slv_in_type;
    apbo             : out apb_slv_out_type
  );
end component; 



  function buffer_available(fabtech : integer;trn_tbuf_av : std_logic_vector(5 downto 0))return std_logic;   
  function conv_to_bitvector(Gen : in integer;width : in integer)return bit_vector;
  function fn_usr_clk_frequency(lane_width : in integer;Gen : in integer) return integer;
  function fn_TARGET_LINK_SPEED(lane_width : in integer;Gen : in integer) return bit_vector;

end;


package body pcie is

  function buffer_available(fabtech     : integer;
                            trn_tbuf_av : std_logic_vector(5 downto 0))
  return std_logic is  
  variable s:       std_logic;
  begin
    if fabtech = virtex5 then
      if trn_tbuf_av(3 downto 0) = "1111" then 
        s         := '0'; 
      else
        s         := '1'; 
      end if;
    elsif fabtech = virtex6 then
      if trn_tbuf_av < "000010" then
        s         := '1'; 
      else
        s         := '0'; 
      end if;
    else
      s           := '1'; 
    end if;
  return s;
  end function;

  function conv_to_bitvector(Gen : in integer;width : in integer)
  return bit_vector is
  variable result : bit_vector(width-1 downto 0);   
  begin
    result:=bit_vector(to_unsigned(Gen,width));
    return result;
  end function;
  
  function fn_usr_clk_frequency(lane_width : in integer;Gen : in integer)
  return integer is
  variable result : integer;   
  begin
  result           := 1;
  case lane_width is
       when 1 =>
            result := 1;         
       when 2 =>
            if Gen = 1 then 
            result := 1;
            else 
            result := 2; 
            end if;
       when 4 =>
            if Gen = 1 then 
            result := 2;
            else 
            result := 3; 
           end if;
       when 8 =>
           result := 3;
       when others =>
  end case;
      return result;
  end function;
  
  function fn_TARGET_LINK_SPEED(lane_width : in integer;Gen : in integer)
  return bit_vector is
  variable result : bit_vector(3 downto 0);   
  begin
  result           := x"0";
  case lane_width is
       when 1 =>
            if Gen = 1 then 
            result := x"0";
            else 
            result := x"2"; 
            end if;
       when 2 =>
            if Gen = 1 then 
            result := x"0";
            else 
            result := x"2"; 
            end if;
       when 4 =>
            if Gen = 1 then 
            result := x"0";
            else 
            result := x"2"; 
            end if;
       when 8 =>
            result := x"0";
       when others =>
  end case;    
  return result;
  end function;
end;

