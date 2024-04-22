


-----------------------------------------------------------------------------
-- LEON3 Demonstration design test bench configuration
-- Copyright (C) 2009 Aeroflex Gaisler
------------------------------------------------------------------------------


library techmap;
use techmap.gencomp.all;

package config is
-- Technology and synthesis options
  constant CFG_FABTECH : integer := virtex7;
  constant CFG_MEMTECH : integer := virtex7;
  constant CFG_PADTECH : integer := virtex7;
  constant CFG_TRANSTECH : integer := TT_XGTP0;
  constant CFG_NOASYNC : integer := 0;
  constant CFG_SCAN : integer := 0;
-- Clock generator
  constant CFG_CLKTECH : integer := virtex7;
  constant CFG_CLKMUL : integer := (4);
  constant CFG_CLKDIV : integer := (8);
  constant CFG_OCLKDIV : integer := 1;
  constant CFG_OCLKBDIV : integer := 0;
  constant CFG_OCLKCDIV : integer := 0;
  constant CFG_PCIDLL : integer := 0;
  constant CFG_PCISYSCLK: integer := 0;
  constant CFG_CLK_NOFB : integer := 0;
-- LEON processor core
  constant CFG_LEON : integer := 3;
  constant CFG_NCPU : integer := (4);
  constant CFG_NWIN : integer := (8);
  constant CFG_V8 : integer := 16#32# + 4*0;
  constant CFG_MAC : integer := 0;
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
  constant CFG_DLINE : integer := 8;
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
  constant CFG_TLB_REP : integer := 0;
  constant CFG_MMU_PAGE : integer := 0;
  constant CFG_DSU : integer := 1;
  constant CFG_ITBSZ : integer := 4 + 64*1;
  constant CFG_ATBSZ : integer := 4;
  constant CFG_AHBPF : integer := 2;
  constant CFG_AHBWP : integer := 2;
  constant CFG_LEONFT_EN : integer := 0 + (0)*8;
  constant CFG_LEON_NETLIST : integer := 0;
  constant CFG_DISAS : integer := 0 + 0;
  constant CFG_PCLOW : integer := 2;
  constant CFG_STAT_ENABLE : integer := 1;
  constant CFG_STAT_CNT : integer := (4);
  constant CFG_STAT_NMAX : integer := (0);
  constant CFG_STAT_DSUEN : integer := 1;
  constant CFG_NP_ASI : integer := 1;
  constant CFG_WRPSR : integer := 1;
  constant CFG_ALTWIN : integer := 0;
  constant CFG_REX : integer := 0;
-- L2 Cache
  constant CFG_L2_EN : integer := 0;
  constant CFG_L2_SIZE : integer := 128;
  constant CFG_L2_WAYS : integer := 4;
  constant CFG_L2_HPROT : integer := 0;
  constant CFG_L2_PEN : integer := 0;
  constant CFG_L2_WT : integer := 0;
  constant CFG_L2_RAN : integer := 0;
  constant CFG_L2_SHARE : integer := 0;
  constant CFG_L2_LSZ : integer := 32;
  constant CFG_L2_MAP : integer := 16#00F0#;
  constant CFG_L2_MTRR : integer := (0);
  constant CFG_L2_EDAC : integer := 0;
  constant CFG_L2_AXI : integer := 1;
-- AMBA settings
  constant CFG_DEFMST : integer := (0);
  constant CFG_RROBIN : integer := 1;
  constant CFG_SPLIT : integer := 0;
  constant CFG_FPNPEN : integer := 1;
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
-- USB DSU
  constant CFG_GRUSB_DCL : integer := 0;
  constant CFG_GRUSB_DCL_UIFACE : integer := 1;
  constant CFG_GRUSB_DCL_DW : integer := 8;
-- Ethernet DSU
  constant CFG_DSU_ETH : integer := 1 + 0 + 0;
  constant CFG_ETH_BUF : integer := 16;
  constant CFG_ETH_IPM : integer := 16#C0A8#;
  constant CFG_ETH_IPL : integer := 16#0033#;
  constant CFG_ETH_ENM : integer := 16#020000#;
  constant CFG_ETH_ENL : integer := 16#000000#;
-- LEON2 memory controller
  constant CFG_MCTRL_LEON2 : integer := 1;
  constant CFG_MCTRL_RAM8BIT : integer := 1;
  constant CFG_MCTRL_RAM16BIT : integer := 1;
  constant CFG_MCTRL_5CS : integer := 0;
  constant CFG_MCTRL_SDEN : integer := 0;
  constant CFG_MCTRL_SEPBUS : integer := 0;
  constant CFG_MCTRL_INVCLK : integer := 0;
  constant CFG_MCTRL_SD64 : integer := 0;
  constant CFG_MCTRL_PAGE : integer := 0 + 0;
-- Xilinx MIG 7-Series
  constant CFG_MIG_7SERIES : integer := 1;
  constant CFG_MIG_7SERIES_MODEL : integer := 0;
-- AHB status register
  constant CFG_AHBSTAT : integer := 0;
  constant CFG_AHBSTATN : integer := (1);
-- AHB ROM
  constant CFG_AHBROMEN : integer := 0;
  constant CFG_AHBROPIP : integer := 0;
  constant CFG_AHBRODDR : integer := 16#000#;
  constant CFG_ROMADDR : integer := 16#000#;
  constant CFG_ROMMASK : integer := 16#E00# + 16#000#;
-- AHB RAM
  constant CFG_AHBRAMEN : integer := 1;
  constant CFG_AHBRSZ : integer := 4;
  constant CFG_AHBRADDR : integer := 16#A00#;
  constant CFG_AHBRPIPE : integer := 0;

-- Gaisler Ethernet core
  constant CFG_GRETH : integer := 1;
  constant CFG_GRETH1G : integer := 0;
  constant CFG_ETH_FIFO : integer := 8;




  constant CFG_GRETH_FT : integer := 0;
  constant CFG_GRETH_EDCLFT : integer := 0;

-- USB Host Controller
  constant CFG_GRUSBHC : integer := 0;
  constant CFG_GRUSBHC_NPORTS : integer := (1);
  constant CFG_GRUSBHC_EHC : integer := 0;
  constant CFG_GRUSBHC_UHC : integer := 0;
  constant CFG_GRUSBHC_NCC : integer := 1;
  constant CFG_GRUSBHC_NPCC : integer := (1);
  constant CFG_GRUSBHC_PRR : integer := 0;
  constant CFG_GRUSBHC_PR1 : integer := 0*2**26 + 0*2**22 + 0*2**18 + 0*2**14 + 0*2**10 + 0*2**6 + 0*2**2 + (1/4);
  constant CFG_GRUSBHC_PR2 : integer := 0*2**26 + 0*2**22 + 0*2**18 + 0*2**14 + 0*2**10 + 0*2**6 + 0*2**2 + (1 mod 4);
  constant CFG_GRUSBHC_ENDIAN : integer := 1;
  constant CFG_GRUSBHC_BEREGS : integer := 0;
  constant CFG_GRUSBHC_BEDESC : integer := 0;
  constant CFG_GRUSBHC_BLO : integer := 3;
  constant CFG_GRUSBHC_BWRD : integer := (16);
  constant CFG_GRUSBHC_UTM : integer := 2;
  constant CFG_GRUSBHC_VBUSCONF : integer := 3;

-- GR USB 2.0 Device Controller
  constant CFG_GRUSBDC : integer := 0;
  constant CFG_GRUSBDC_AIFACE : integer := 0;
  constant CFG_GRUSBDC_UIFACE : integer := 1;
  constant CFG_GRUSBDC_DW : integer := 8;
  constant CFG_GRUSBDC_NEPI : integer := (1);
  constant CFG_GRUSBDC_NEPO : integer := (1);
  constant CFG_GRUSBDC_I0 : integer := (1024);
  constant CFG_GRUSBDC_I1 : integer := (1024);
  constant CFG_GRUSBDC_I2 : integer := (1024);
  constant CFG_GRUSBDC_I3 : integer := (1024);
  constant CFG_GRUSBDC_I4 : integer := (1024);
  constant CFG_GRUSBDC_I5 : integer := (1024);
  constant CFG_GRUSBDC_I6 : integer := (1024);
  constant CFG_GRUSBDC_I7 : integer := (1024);
  constant CFG_GRUSBDC_I8 : integer := (1024);
  constant CFG_GRUSBDC_I9 : integer := (1024);
  constant CFG_GRUSBDC_I10 : integer := (1024);
  constant CFG_GRUSBDC_I11 : integer := (1024);
  constant CFG_GRUSBDC_I12 : integer := (1024);
  constant CFG_GRUSBDC_I13 : integer := (1024);
  constant CFG_GRUSBDC_I14 : integer := (1024);
  constant CFG_GRUSBDC_I15 : integer := (1024);
  constant CFG_GRUSBDC_O0 : integer := (1024);
  constant CFG_GRUSBDC_O1 : integer := (1024);
  constant CFG_GRUSBDC_O2 : integer := (1024);
  constant CFG_GRUSBDC_O3 : integer := (1024);
  constant CFG_GRUSBDC_O4 : integer := (1024);
  constant CFG_GRUSBDC_O5 : integer := (1024);
  constant CFG_GRUSBDC_O6 : integer := (1024);
  constant CFG_GRUSBDC_O7 : integer := (1024);
  constant CFG_GRUSBDC_O8 : integer := (1024);
  constant CFG_GRUSBDC_O9 : integer := (1024);
  constant CFG_GRUSBDC_O10 : integer := (1024);
  constant CFG_GRUSBDC_O11 : integer := (1024);
  constant CFG_GRUSBDC_O12 : integer := (1024);
  constant CFG_GRUSBDC_O13 : integer := (1024);
  constant CFG_GRUSBDC_O14 : integer := (1024);
  constant CFG_GRUSBDC_O15 : integer := (1024);

-- CAN 2.0 interface
  constant CFG_CAN : integer := 0;
  constant CFG_CAN_NUM : integer := (1);
  constant CFG_CANIO : integer := 16#C00#;
  constant CFG_CANIRQ : integer := (13);
  constant CFG_CANSEPIRQ: integer := 0;
  constant CFG_CAN_SYNCRST : integer := 0;
  constant CFG_CANFT : integer := 0;

-- Spacewire interface
  constant CFG_SPW_EN : integer := 0;
  constant CFG_SPW_NUM : integer := (1);
  constant CFG_SPW_AHBFIFO : integer := 16;
  constant CFG_SPW_RXFIFO : integer := 16;
  constant CFG_SPW_RMAP : integer := 0;
  constant CFG_SPW_RMAPBUF : integer := 4;
  constant CFG_SPW_RMAPCRC : integer := 0;
  constant CFG_SPW_NETLIST : integer := 0;
  constant CFG_SPW_FT : integer := 0;
  constant CFG_SPW_GRSPW : integer := 2;
  constant CFG_SPW_RXUNAL : integer := 0;
  constant CFG_SPW_DMACHAN : integer := (1);
  constant CFG_SPW_PORTS : integer := (1);
  constant CFG_SPW_INPUT : integer := 3;
  constant CFG_SPW_OUTPUT : integer := 0;
  constant CFG_SPW_RTSAME : integer := 0;

-- UART 1
  constant CFG_UART1_ENABLE : integer := 1;
  constant CFG_UART1_FIFO : integer := 32;

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
  constant CFG_GRGPIO_IMASK : integer := 16#0000#;
  constant CFG_GRGPIO_WIDTH : integer := (8);

-- I2C master
  constant CFG_I2C_ENABLE : integer := 1;

-- VGA and PS2/ interface
  constant CFG_KBD_ENABLE : integer := 0;
  constant CFG_VGA_ENABLE : integer := 0;
  constant CFG_SVGA_ENABLE : integer := 0;

-- SPI memory controller
  constant CFG_SPIMCTRL : integer := 0;
  constant CFG_SPIMCTRL_SDCARD : integer := 0;
  constant CFG_SPIMCTRL_READCMD : integer := 16#0B#;
  constant CFG_SPIMCTRL_DUMMYBYTE : integer := 0;
  constant CFG_SPIMCTRL_DUALOUTPUT : integer := 0;
  constant CFG_SPIMCTRL_SCALER : integer := (1);
  constant CFG_SPIMCTRL_ASCALER : integer := (8);
  constant CFG_SPIMCTRL_PWRUPCNT : integer := (0);
  constant CFG_SPIMCTRL_OFFSET : integer := 16#0#;

-- SPI controller
  constant CFG_SPICTRL_ENABLE : integer := 1;
  constant CFG_SPICTRL_NUM : integer := (1);
  constant CFG_SPICTRL_SLVS : integer := (1);
  constant CFG_SPICTRL_FIFO : integer := (1);
  constant CFG_SPICTRL_SLVREG : integer := 0;
  constant CFG_SPICTRL_ODMODE : integer := 0;
  constant CFG_SPICTRL_AM : integer := 0;
  constant CFG_SPICTRL_ASEL : integer := 0;
  constant CFG_SPICTRL_TWEN : integer := 0;
  constant CFG_SPICTRL_MAXWLEN : integer := (0);
  constant CFG_SPICTRL_SYNCRAM : integer := 0;
  constant CFG_SPICTRL_FT : integer := 0;
  constant CFG_SPICTRL_PROT : integer := 0;

-- Dynamic Partial Reconfiguration
  constant CFG_PRC : integer := 0;
  constant CFG_CRC_EN : integer := 0;
  constant CFG_EDAC_EN : integer := 0;
  constant CFG_WORDS_BLOCK : integer := 100;
  constant CFG_DCM_FIFO : integer := 0;
  constant CFG_DPR_FIFO : integer := 9;

-- GRLIB debugging
  constant CFG_DUART : integer := 0;
end;
