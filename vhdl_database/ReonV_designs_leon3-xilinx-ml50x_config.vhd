

-----------------------------------------------------------------------------
-- LEON3 Demonstration design test bench configuration
-- Copyright (C) 2012 Aeroflex Gaisler
------------------------------------------------------------------------------


library techmap;
use techmap.gencomp.all;
library grlib;
use grlib.devices.all;

package config is

-- Board selection







  constant CFG_BOARD_SELECTION : system_device_type := XILINX_ML507;
-- Technology and synthesis options
  constant CFG_FABTECH : integer := virtex5;
  constant CFG_MEMTECH : integer := virtex5;
  constant CFG_PADTECH : integer := virtex5;
  constant CFG_TRANSTECH : integer := TT_XGTP0;
  constant CFG_NOASYNC : integer := 0;
  constant CFG_SCAN : integer := 0;
-- Clock generator
  constant CFG_CLKTECH : integer := virtex5;
  constant CFG_CLKMUL : integer := (6);
  constant CFG_CLKDIV : integer := (10);
  constant CFG_OCLKDIV : integer := 1;
  constant CFG_OCLKBDIV : integer := 0;
  constant CFG_OCLKCDIV : integer := 0;
  constant CFG_PCIDLL : integer := 0;
  constant CFG_PCISYSCLK: integer := 0;
  constant CFG_CLK_NOFB : integer := 0;
-- LEON processor core
  constant CFG_LEON : integer := 3;
  constant CFG_NCPU : integer := (1);
  constant CFG_NWIN : integer := (8);
  constant CFG_V8 : integer := 1 + 4*0;
  constant CFG_MAC : integer := 1;
  constant CFG_SVT : integer := 1;
  constant CFG_RSTADDR : integer := 16#00000#;
  constant CFG_LDDEL : integer := (1);
  constant CFG_NWP : integer := (2);
  constant CFG_PWD : integer := 1*2;
  constant CFG_FPU : integer := (1+0) + 16*0 + 32*0;
  constant CFG_GRFPUSH : integer := 0;
  constant CFG_ICEN : integer := 1;
  constant CFG_ISETS : integer := 4;
  constant CFG_ISETSZ : integer := 4;
  constant CFG_ILINE : integer := 8;
  constant CFG_IREPL : integer := 0;
  constant CFG_ILOCK : integer := 0;
  constant CFG_ILRAMEN : integer := 0;
  constant CFG_ILRAMADDR: integer := 16#8E#;
  constant CFG_ILRAMSZ : integer := 1;
  constant CFG_DCEN : integer := 1;
  constant CFG_DSETS : integer := 4;
  constant CFG_DSETSZ : integer := 4;
  constant CFG_DLINE : integer := 4;
  constant CFG_DREPL : integer := 0;
  constant CFG_DLOCK : integer := 0;
  constant CFG_DSNOOP : integer := 1*2 + 4*1;
  constant CFG_DFIXED : integer := 16#0#;
  constant CFG_BWMASK : integer := 16#00F0#;
  constant CFG_CACHEBW : integer := 64;
  constant CFG_DLRAMEN : integer := 0;
  constant CFG_DLRAMADDR: integer := 16#8F#;
  constant CFG_DLRAMSZ : integer := 1;
  constant CFG_MMUEN : integer := 1;
  constant CFG_ITLBNUM : integer := 8;
  constant CFG_DTLBNUM : integer := 8;
  constant CFG_TLB_TYPE : integer := 0 + 1*2;
  constant CFG_TLB_REP : integer := 1;
  constant CFG_MMU_PAGE : integer := 0;
  constant CFG_DSU : integer := 1;
  constant CFG_ITBSZ : integer := 2 + 64*0;
  constant CFG_ATBSZ : integer := 2;
  constant CFG_AHBPF : integer := 0;
  constant CFG_AHBWP : integer := 2;
  constant CFG_LEONFT_EN : integer := 0 + 0*8;
  constant CFG_LEON_NETLIST : integer := 0;
  constant CFG_DISAS : integer := 0 + 0;
  constant CFG_PCLOW : integer := 2;
  constant CFG_STAT_ENABLE : integer := 0;
  constant CFG_STAT_CNT : integer := 1;
  constant CFG_STAT_NMAX : integer := 0;
  constant CFG_STAT_DSUEN : integer := 0;
  constant CFG_NP_ASI : integer := 1;
  constant CFG_WRPSR : integer := 1;
  constant CFG_ALTWIN : integer := 0;
  constant CFG_REX : integer := 1;
-- L2 Cache
  constant CFG_L2_EN : integer := 0;
  constant CFG_L2_SIZE : integer := 64;
  constant CFG_L2_WAYS : integer := 1;
  constant CFG_L2_HPROT : integer := 0;
  constant CFG_L2_PEN : integer := 0;
  constant CFG_L2_WT : integer := 0;
  constant CFG_L2_RAN : integer := 0;
  constant CFG_L2_SHARE : integer := 0;
  constant CFG_L2_LSZ : integer := 32;
  constant CFG_L2_MAP : integer := 16#00F0#;
  constant CFG_L2_MTRR : integer := (0);
  constant CFG_L2_EDAC : integer := 0;
  constant CFG_L2_AXI : integer := 0;
-- AMBA settings
  constant CFG_DEFMST : integer := (0);
  constant CFG_RROBIN : integer := 1;
  constant CFG_SPLIT : integer := 0;
  constant CFG_FPNPEN : integer := 0;
  constant CFG_AHBIO : integer := 16#FFF#;
  constant CFG_APBADDR : integer := 16#800#;
  constant CFG_AHB_MON : integer := 0;
  constant CFG_AHB_MONERR : integer := 0;
  constant CFG_AHB_MONWAR : integer := 0;
  constant CFG_AHB_DTRACE : integer := 0;
-- DSU UART
  constant CFG_AHB_UART : integer := 1;
-- JTAG based DSU interface
  constant CFG_AHB_JTAG : integer := 1;
-- Ethernet DSU
  constant CFG_DSU_ETH : integer := 1 + 0 + 0;
  constant CFG_ETH_BUF : integer := 8;
  constant CFG_ETH_IPM : integer := 16#C0A8#;
  constant CFG_ETH_IPL : integer := 16#0033#;
  constant CFG_ETH_ENM : integer := 16#020000#;
  constant CFG_ETH_ENL : integer := 16#000505#;
-- LEON2 memory controller
  constant CFG_MCTRL_LEON2 : integer := 1;
  constant CFG_MCTRL_RAM8BIT : integer := 0;
  constant CFG_MCTRL_RAM16BIT : integer := 1;
  constant CFG_MCTRL_5CS : integer := 0;
  constant CFG_MCTRL_SDEN : integer := 0;
  constant CFG_MCTRL_SEPBUS : integer := 0;
  constant CFG_MCTRL_INVCLK : integer := 0;
  constant CFG_MCTRL_SD64 : integer := 0;
  constant CFG_MCTRL_PAGE : integer := 0 + 0;
-- Xilinx MIG
  constant CFG_MIG_DDR2 : integer := 0;
  constant CFG_MIG_RANKS : integer := (1);
  constant CFG_MIG_COLBITS : integer := (10);
  constant CFG_MIG_ROWBITS : integer := (13);
  constant CFG_MIG_BANKBITS: integer := (2);
  constant CFG_MIG_HMASK : integer := 16#F00#;
-- DDR controller
  constant CFG_DDR2SP : integer := 1;
  constant CFG_DDR2SP_INIT : integer := 1;
  constant CFG_DDR2SP_FREQ : integer := (190);
  constant CFG_DDR2SP_TRFC : integer := (130);
  constant CFG_DDR2SP_DATAWIDTH : integer := (64);
  constant CFG_DDR2SP_FTEN : integer := 0;
  constant CFG_DDR2SP_FTWIDTH : integer := 0;
  constant CFG_DDR2SP_COL : integer := (10);
  constant CFG_DDR2SP_SIZE : integer := (256);
  constant CFG_DDR2SP_DELAY0 : integer := (10);
  constant CFG_DDR2SP_DELAY1 : integer := (10);
  constant CFG_DDR2SP_DELAY2 : integer := (10);
  constant CFG_DDR2SP_DELAY3 : integer := (10);
  constant CFG_DDR2SP_DELAY4 : integer := (10);
  constant CFG_DDR2SP_DELAY5 : integer := (10);
  constant CFG_DDR2SP_DELAY6 : integer := (10);
  constant CFG_DDR2SP_DELAY7 : integer := (10);
  constant CFG_DDR2SP_NOSYNC : integer := 0;
-- AHB status register
  constant CFG_AHBSTAT : integer := 1;
  constant CFG_AHBSTATN : integer := (1);
-- AHB ROM
  constant CFG_AHBROMEN : integer := 0;
  constant CFG_AHBROPIP : integer := 0;
  constant CFG_AHBRODDR : integer := 16#000#;
  constant CFG_ROMADDR : integer := 16#000#;
  constant CFG_ROMMASK : integer := 16#E00# + 16#000#;
-- AHB RAM
  constant CFG_AHBRAMEN : integer := 0;
  constant CFG_AHBRSZ : integer := 4;
  constant CFG_AHBRADDR : integer := 16#A00#;
  constant CFG_AHBRPIPE : integer := 0;
-- Gaisler Ethernet core
  constant CFG_GRETH : integer := 1;
  constant CFG_GRETH1G : integer := 0;
  constant CFG_ETH_FIFO : integer := 32;
  constant CFG_GRETH_SGMII : integer := 0;
-- UART 1
  constant CFG_UART1_ENABLE : integer := 1;
  constant CFG_UART1_FIFO : integer := 4;
-- LEON3 interrupt controller
  constant CFG_IRQ3_ENABLE : integer := 1;
  constant CFG_IRQ3_NSEC : integer := 0;
-- Modular timer
  constant CFG_GPT_ENABLE : integer := 1;
  constant CFG_GPT_NTIM : integer := (2);
  constant CFG_GPT_SW : integer := (8);
  constant CFG_GPT_TW : integer := (32);
  constant CFG_GPT_IRQ : integer := (8);
  constant CFG_GPT_SEPIRQ : integer := 1;
  constant CFG_GPT_WDOGEN : integer := 0;
  constant CFG_GPT_WDOG : integer := 16#0#;
-- GPIO port
  constant CFG_GRGPIO_ENABLE : integer := 1;
  constant CFG_GRGPIO_IMASK : integer := 16#0FFFE#;
  constant CFG_GRGPIO_WIDTH : integer := (32);

-- I2C master
  constant CFG_I2C_ENABLE : integer := 1;

-- AMBA Wrapper for Xilinx System Monitor
  constant CFG_GRSYSMON : integer := 0;

-- VGA and PS2/ interface
  constant CFG_KBD_ENABLE : integer := 1;
  constant CFG_VGA_ENABLE : integer := 0;
  constant CFG_SVGA_ENABLE : integer := 1;

-- AMBA System ACE Interface Controller
  constant CFG_GRACECTRL : integer := 1;

-- PCIEXP interface
 constant CFG_PCIEXP : integer := 0;
 constant CFG_PCIE_TYPE : integer := 0;
 constant CFG_PCIE_SIM_MAS : integer := 0;
 constant CFG_PCIEXPVID : integer := 16#0#;
 constant CFG_PCIEXPDID : integer := 16#0#;
  constant CFG_NO_OF_LANES : integer := 1;

-- GRLIB debugging
  constant CFG_DUART : integer := 0;
end;
