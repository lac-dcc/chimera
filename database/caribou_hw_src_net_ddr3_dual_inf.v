//*****************************************************************************
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 2.0
//  \   \         Application        : MIG
//  /   /         Filename           : example_top.v
// /___/   /\     Date Last Modified : $Date: 2011/06/02 08:35:03 $
// \   \  /  \    Date Created       : Tue Sept 21 2010
//  \___\/\___\
//
// Device           : 7 Series
// Design Name      : DDR3 SDRAM
// Purpose          :
//   Top-level  module. This module serves both as an example,
//   and allows the user to synthesize a self-contained design,
//   which they can be used to test their hardware.
//   In addition to the memory controller, the module instantiates:
//     1. Synthesizable testbench - used to model user's backend logic
//        and generate different traffic patterns
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps/1ps

module ddr3_dual_inf #
  (
   //***************************************************************************
   // The following parameters refer to width of various ports
   //***************************************************************************
   parameter C0_BANK_WIDTH            = 3,
                                     // # of memory Bank Address bits.
   parameter C0_CK_WIDTH              = 1,
                                     // # of CK/CK# outputs to memory.
   parameter C0_COL_WIDTH             = 10,
                                     // # of memory Column Address bits.
   parameter C0_CS_WIDTH              = 1,
                                     // # of unique CS outputs to memory.
   parameter C0_nCS_PER_RANK          = 1,
                                     // # of unique CS outputs per rank for phy
   parameter C0_CKE_WIDTH             = 1,
                                     // # of CKE outputs to memory.
   parameter C0_DATA_BUF_ADDR_WIDTH   = 5,
   parameter C0_DQ_CNT_WIDTH          = 6,
                                     // = ceil(log2(DQ_WIDTH))
   parameter C0_DQ_PER_DM             = 8,
   parameter C0_DM_WIDTH              = 8,
                                     // # of DM (data mask)
   parameter C0_DQ_WIDTH              = 64,
                                     // # of DQ (data)
   parameter C0_DQS_WIDTH             = 8,
   parameter C0_DQS_CNT_WIDTH         = 3,
                                     // = ceil(log2(DQS_WIDTH))
   parameter C0_DRAM_WIDTH            = 8,
                                     // # of DQ per DQS
   parameter C0_ECC                   = "OFF",
   parameter C0_nBANK_MACHS           = 4,
   parameter C0_RANKS                 = 1,
                                     // # of Ranks.
   parameter C0_ODT_WIDTH             = 1,
                                     // # of ODT outputs to memory.
   parameter C0_ROW_WIDTH             = 16,
                                     // # of memory Row Address bits.
   parameter C0_ADDR_WIDTH            = 30,
                                     // # = RANK_WIDTH + BANK_WIDTH
                                     //     + ROW_WIDTH + COL_WIDTH;
                                     // Chip Select is always tied to low for
                                     // single rank devices
   parameter C0_USE_CS_PORT          = 1,
                                     // # = 1, When Chip Select (CS#) output is enabled
                                     //   = 0, When Chip Select (CS#) output is disabled
                                     // If CS_N disabled, user must connect
                                     // DRAM CS_N input(s) to ground
   parameter C0_USE_DM_PORT           = 1,
                                     // # = 1, When Data Mask option is enabled
                                     //   = 0, When Data Mask option is disbaled
                                     // When Data Mask option is disabled in
                                     // MIG Controller Options page, the logic
                                     // related to Data Mask should not get
                                     // synthesized
   parameter C0_USE_ODT_PORT          = 1,
                                     // # = 1, When ODT output is enabled
                                     //   = 0, When ODT output is disabled
                                     // Parameter configuration for Dynamic ODT support:
                                     // USE_ODT_PORT = 0, RTT_NOM = "DISABLED", RTT_WR = "60/120".
                                     // This configuration allows to save ODT pin mapping from FPGA.
                                     // The user can tie the ODT input of DRAM to HIGH.
   parameter C0_PHY_CONTROL_MASTER_BANK = 1,
                                     // The bank index where master PHY_CONTROL resides,
                                     // equal to the PLL residing bank
   parameter C0_MEM_DENSITY           = "4Gb",
                                     // Indicates the density of the Memory part
                                     // Added for the sake of Vivado simulations
   parameter C0_MEM_SPEEDGRADE        = "107E",
                                     // Indicates the Speed grade of Memory Part
                                     // Added for the sake of Vivado simulations
   parameter C0_MEM_DEVICE_WIDTH      = 8,
                                     // Indicates the device width of the Memory Part
                                     // Added for the sake of Vivado simulations

   //***************************************************************************
   // The following parameters are mode register settings
   //***************************************************************************
   parameter C0_AL                    = "0",
                                     // DDR3 SDRAM:
                                     // Additive Latency (Mode Register 1).
                                     // # = "0", "CL-1", "CL-2".
                                     // DDR2 SDRAM:
                                     // Additive Latency (Extended Mode Register).
   parameter C0_nAL                   = 0,
                                     // # Additive Latency in number of clock
                                     // cycles.
   parameter C0_BURST_MODE            = "8",
                                     // DDR3 SDRAM:
                                     // Burst Length (Mode Register 0).
                                     // # = "8", "4", "OTF".
                                     // DDR2 SDRAM:
                                     // Burst Length (Mode Register).
                                     // # = "8", "4".
   parameter C0_BURST_TYPE            = "SEQ",
                                     // DDR3 SDRAM: Burst Type (Mode Register 0).
                                     // DDR2 SDRAM: Burst Type (Mode Register).
                                     // # = "SEQ" - (Sequential),
                                     //   = "INT" - (Interleaved).
   parameter C0_CL                    = 13,
                                     // in number of clock cycles
                                     // DDR3 SDRAM: CAS Latency (Mode Register 0).
                                     // DDR2 SDRAM: CAS Latency (Mode Register).
   parameter C0_CWL                   = 9,
                                     // in number of clock cycles
                                     // DDR3 SDRAM: CAS Write Latency (Mode Register 2).
                                     // DDR2 SDRAM: Can be ignored
   parameter C0_OUTPUT_DRV            = "HIGH",
                                     // Output Driver Impedance Control (Mode Register 1).
                                     // # = "HIGH" - RZQ/7,
                                     //   = "LOW" - RZQ/6.
   parameter C0_RTT_NOM               = "60",
                                     // RTT_NOM (ODT) (Mode Register 1).
                                     //   = "120" - RZQ/2,
                                     //   = "60"  - RZQ/4,
                                     //   = "40"  - RZQ/6.
   parameter C0_RTT_WR                = "OFF",
                                     // RTT_WR (ODT) (Mode Register 2).
                                     // # = "OFF" - Dynamic ODT off,
                                     //   = "120" - RZQ/2,
                                     //   = "60"  - RZQ/4,
   parameter C0_ADDR_CMD_MODE         = "1T" ,
                                     // # = "1T", "2T".
   parameter C0_REG_CTRL              = "OFF",
                                     // # = "ON" - RDIMMs,
                                     //   = "OFF" - Components, SODIMMs, UDIMMs.
   parameter C0_CA_MIRROR             = "OFF",
                                     // C/A mirror opt for DDR3 dual rank

   parameter C0_VDD_OP_VOLT           = "150",
                                     // # = "150" - 1.5V Vdd Memory part
                                     //   = "135" - 1.35V Vdd Memory part

   
   //***************************************************************************
   // The following parameters are multiplier and divisor factors for PLLE2.
   // Based on the selected design frequency these parameters vary.
   //***************************************************************************
   parameter C0_CLKIN_PERIOD          = 4288,
                                     // Input Clock Period
   parameter C0_CLKFBOUT_MULT         = 8,
                                     // write PLL VCO multiplier
   parameter C0_DIVCLK_DIVIDE         = 1,
                                     // write PLL VCO divisor
   parameter C0_CLKOUT0_PHASE         = 337.5,
                                     // Phase for PLL output clock (CLKOUT0)
   parameter C0_CLKOUT0_DIVIDE        = 2,
                                     // VCO output divisor for PLL output clock (CLKOUT0)
   parameter C0_CLKOUT1_DIVIDE        = 2,
                                     // VCO output divisor for PLL output clock (CLKOUT1)
   parameter C0_CLKOUT2_DIVIDE        = 32,
                                     // VCO output divisor for PLL output clock (CLKOUT2)
   parameter C0_CLKOUT3_DIVIDE        = 8,
                                     // VCO output divisor for PLL output clock (CLKOUT3)

   //***************************************************************************
   // Memory Timing Parameters. These parameters varies based on the selected
   // memory part.
   //***************************************************************************
   parameter C0_tCKE                  = 5000,
                                     // memory tCKE paramter in pS
   parameter C0_tFAW                  = 25000,
                                     // memory tRAW paramter in pS.
   parameter C0_tRAS                  = 34000,
                                     // memory tRAS paramter in pS.
   parameter C0_tRCD                  = 13910,
                                     // memory tRCD paramter in pS.
   parameter C0_tREFI                 = 7800000,
                                     // memory tREFI paramter in pS.
   parameter C0_tRFC                  = 300000,
                                     // memory tRFC paramter in pS.
   parameter C0_tRP                   = 13910,
                                     // memory tRP paramter in pS.
   parameter C0_tRRD                  = 5000,
                                     // memory tRRD paramter in pS.
   parameter C0_tRTP                  = 7500,
                                     // memory tRTP paramter in pS.
   parameter C0_tWTR                  = 7500,
                                     // memory tWTR paramter in pS.
   parameter C0_tZQI                  = 128_000_000,
                                     // memory tZQI paramter in nS.
   parameter C0_tZQCS                 = 64,
                                     // memory tZQCS paramter in clock cycles.

   //***************************************************************************
   // Simulation parameters
   //***************************************************************************
   parameter C0_SIM_BYPASS_INIT_CAL  = "OFF", //"FAST", 
                                     // # = "OFF" -  Complete memory init &
                                     //              calibration sequence
                                     // # = "SKIP" - Not supported
                                     // # = "FAST" - Complete memory init & use
                                     //              abbreviated calib sequence

   parameter C0_SIMULATION          =  "FALSE", //"TRUE",// 
                                     // Should be TRUE during design simulations and
                                     // FALSE during implementations

   //***************************************************************************
   // The following parameters varies based on the pin out entered in MIG GUI.
   // Do not change any of these parameters directly by editing the RTL.
   // Any changes required should be done through GUI and the design regenerated.
   //***************************************************************************
   parameter C0_BYTE_LANES_B0         = 4'b1111,
                                     // Byte lanes used in an IO column.
   parameter C0_BYTE_LANES_B1         = 4'b1110,
                                     // Byte lanes used in an IO column.
   parameter C0_BYTE_LANES_B2         = 4'b1111,
                                     // Byte lanes used in an IO column.
   parameter C0_BYTE_LANES_B3         = 4'b0000,
                                     // Byte lanes used in an IO column.
   parameter C0_BYTE_LANES_B4         = 4'b0000,
                                     // Byte lanes used in an IO column.
   parameter C0_DATA_CTL_B0           = 4'b1111,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C0_DATA_CTL_B1           = 4'b0000,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C0_DATA_CTL_B2           = 4'b1111,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C0_DATA_CTL_B3           = 4'b0000,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C0_DATA_CTL_B4           = 4'b0000,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C0_PHY_0_BITLANES        = 48'h3FE_1FF_1FF_2FF,
   parameter C0_PHY_1_BITLANES        = 48'hFFE_FF0_CB4_000,
   parameter C0_PHY_2_BITLANES        = 48'h3FE_3FE_3BF_2FF,

   // control/address/data pin mapping parameters
   parameter C0_CK_BYTE_MAP
     = 144'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_12,
   parameter C0_ADDR_MAP
     = 192'h126_127_132_136_135_133_139_124_131_129_137_134_13A_128_138_13B,
   parameter C0_BANK_MAP   = 36'h125_12A_12B,
   parameter C0_CAS_MAP    = 12'h115,
   parameter C0_CKE_ODT_BYTE_MAP = 8'h00,
   parameter C0_CKE_MAP    = 96'h000_000_000_000_000_000_000_117,
   parameter C0_ODT_MAP    = 96'h000_000_000_000_000_000_000_112,
   parameter C0_CS_MAP     = 120'h000_000_000_000_000_000_000_000_000_114,
   parameter C0_PARITY_MAP = 12'h000,
   parameter C0_RAS_MAP    = 12'h11A,
   parameter C0_WE_MAP     = 12'h11B,
   parameter C0_DQS_BYTE_MAP
     = 144'h00_00_00_00_00_00_00_00_00_00_20_21_22_23_03_02_01_00,
   parameter C0_DATA0_MAP  = 96'h009_000_003_001_007_006_005_002,
   parameter C0_DATA1_MAP  = 96'h014_018_010_011_017_016_012_013,
   parameter C0_DATA2_MAP  = 96'h021_022_025_020_027_023_026_028,
   parameter C0_DATA3_MAP  = 96'h033_039_031_035_032_038_034_037,
   parameter C0_DATA4_MAP  = 96'h231_238_237_236_233_232_234_239,
   parameter C0_DATA5_MAP  = 96'h226_227_225_229_221_222_224_228,
   parameter C0_DATA6_MAP  = 96'h214_215_210_218_217_213_219_212,
   parameter C0_DATA7_MAP  = 96'h207_203_204_206_202_201_205_209,
   parameter C0_DATA8_MAP  = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA9_MAP  = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA10_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA11_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA12_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA13_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA14_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA15_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA16_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_DATA17_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C0_MASK0_MAP  = 108'h000_200_211_223_235_036_024_015_004,
   parameter C0_MASK1_MAP  = 108'h000_000_000_000_000_000_000_000_000,

   parameter C0_SLOT_0_CONFIG         = 8'b0000_0001,
                                     // Mapping of Ranks.
   parameter C0_SLOT_1_CONFIG         = 8'b0000_0000,
                                     // Mapping of Ranks.

   //***************************************************************************
   // IODELAY and PHY related parameters
   //***************************************************************************
   parameter C0_IBUF_LPWR_MODE        = "OFF",
                                     // to phy_top
   parameter C0_DATA_IO_IDLE_PWRDWN   = "ON",
                                     // # = "ON", "OFF"
   parameter C0_BANK_TYPE             = "HP_IO",
                                     // # = "HP_IO", "HPL_IO", "HR_IO", "HRL_IO"
   parameter C0_DATA_IO_PRIM_TYPE     = "HP_LP",
                                     // # = "HP_LP", "HR_LP", "DEFAULT"
   parameter C0_CKE_ODT_AUX           = "FALSE",
   parameter C0_USER_REFRESH          = "OFF",
   parameter C0_WRLVL                 = "ON",
                                     // # = "ON" - DDR3 SDRAM
                                     //   = "OFF" - DDR2 SDRAM.
   parameter C0_ORDERING              = "NORM",
                                     // # = "NORM", "STRICT", "RELAXED".
   parameter C0_CALIB_ROW_ADD         = 16'h0000,
                                     // Calibration row address will be used for
                                     // calibration read and write operations
   parameter C0_CALIB_COL_ADD         = 12'h000,
                                     // Calibration column address will be used for
                                     // calibration read and write operations
   parameter C0_CALIB_BA_ADD          = 3'h0,
                                     // Calibration bank address will be used for
                                     // calibration read and write operations
   parameter C0_TCQ                   = 100,
   parameter IODELAY_GRP           = "IODELAY_MIG",
                                     // It is associated to a set of IODELAYs with
                                     // an IDELAYCTRL that have same IODELAY CONTROLLER
                                     // clock frequency.
   parameter SYSCLK_TYPE           = "NO_BUFFER",
                                     // System clock type DIFFERENTIAL, SINGLE_ENDED,
                                     // NO_BUFFER
   parameter REFCLK_TYPE           = "NO_BUFFER",
                                     // Reference clock type DIFFERENTIAL, SINGLE_ENDED,
                                     // NO_BUFFER, USE_SYSTEM_CLOCK
   parameter SYS_RST_PORT          = "FALSE",
                                     // "TRUE" - if pin is selected for sys_rst
                                     //          and IBUF will be instantiated.
                                     // "FALSE" - if pin is not selected for sys_rst
      
   parameter DRAM_TYPE             = "DDR3",
   parameter CAL_WIDTH             = "HALF",
   parameter STARVE_LIMIT          = 2,
                                     // # = 2,3,4.

   //***************************************************************************
   // Referece clock frequency parameters
   //***************************************************************************
   parameter REFCLK_FREQ           = 200.0,
                                     // IODELAYCTRL reference clock frequency
   parameter DIFF_TERM_REFCLK      = "TRUE",
                                     // Differential Termination for idelay
                                     // reference clock input pins
   //***************************************************************************
   // System clock frequency parameters
   //***************************************************************************
   parameter C0_tCK                   = 1177,//1072,
                                     // memory tCK paramter.
                                     // # = Clock Period in pS.
   parameter C0_nCK_PER_CLK           = 4,
                                     // # of memory CKs per fabric CLK
   parameter C0_DIFF_TERM_SYSCLK      = "TRUE",
                                     // Differential Termination for System
                                     // clock input pins

   
   //***************************************************************************
   // AXI4 Shim parameters
   //***************************************************************************
   
   parameter C0_UI_EXTRA_CLOCKS = "FALSE",
                                     // Generates extra clocks as
                                     // 1/2, 1/4 and 1/8 of fabrick clock.
                                     // Valid for DDR2/DDR3 AXI interfaces
                                     // based on GUI selection
   parameter C0_C_S_AXI_ID_WIDTH              = 4,
                                             // Width of all master and slave ID signals.
                                             // # = >= 1.
   parameter C0_C_S_AXI_MEM_SIZE              = "4294967296",
                                     // Address Space required for this component
   parameter C0_C_S_AXI_ADDR_WIDTH            = 32,
                                             // Width of S_AXI_AWADDR, S_AXI_ARADDR, M_AXI_AWADDR and
                                             // M_AXI_ARADDR for all SI/MI slots.
                                             // # = 32.
   parameter C0_C_S_AXI_DATA_WIDTH            = 512,
                                             // Width of WDATA and RDATA on SI slot.
                                             // Must be <= APP_DATA_WIDTH.
                                             // # = 32, 64, 128, 256.
   parameter C0_C_MC_nCK_PER_CLK              = 4,
                                             // Indicates whether to instatiate upsizer
                                             // Range: 0, 1
   parameter C0_C_S_AXI_SUPPORTS_NARROW_BURST = 1,
                                             // Indicates whether to instatiate upsizer
                                             // Range: 0, 1
   parameter C0_C_RD_WR_ARB_ALGORITHM          = "RD_PRI_REG",
                                             // Indicates the Arbitration
                                             // Allowed values - "TDM", "ROUND_ROBIN",
                                             // "RD_PRI_REG", "RD_PRI_REG_STARVE_LIMIT"
                                             // "WRITE_PRIORITY", "WRITE_PRIORITY_REG"
   parameter C0_C_S_AXI_REG_EN0               = 20'h00000,
                                             // C_S_AXI_REG_EN0[00] = Reserved
                                             // C_S_AXI_REG_EN0[04] = AW CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[05] =  W CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[06] =  B CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[07] =  R CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[08] = AW CHANNEL UPSIZER REGISTER SLICE
                                             // C_S_AXI_REG_EN0[09] =  W CHANNEL UPSIZER REGISTER SLICE
                                             // C_S_AXI_REG_EN0[10] = AR CHANNEL UPSIZER REGISTER SLICE
                                             // C_S_AXI_REG_EN0[11] =  R CHANNEL UPSIZER REGISTER SLICE
   parameter C0_C_S_AXI_REG_EN1               = 20'h00000,
                                             // Instatiates register slices after the upsizer.
                                             // The type of register is specified for each channel
                                             // in a vector. 4 bits per channel are used.
                                             // C_S_AXI_REG_EN1[03:00] = AW CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[07:04] =  W CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[11:08] =  B CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[15:12] = AR CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[20:16] =  R CHANNEL REGISTER SLICE
                                             // Possible values for each channel are:
                                             //
                                             //   0 => BYPASS    = The channel is just wired through the
                                             //                    module.
                                             //   1 => FWD       = The master VALID and payload signals
                                             //                    are registrated.
                                             //   2 => REV       = The slave ready signal is registrated
                                             //   3 => FWD_REV   = Both FWD and REV
                                             //   4 => SLAVE_FWD = All slave side signals and master
                                             //                    VALID and payload are registrated.
                                             //   5 => SLAVE_RDY = All slave side signals and master
                                             //                    READY are registrated.
                                             //   6 => INPUTS    = Slave and Master side inputs are
                                             //                    registrated.
                                             //   7 => ADDRESS   = Optimized for address channel
   parameter C0_C_S_AXI_CTRL_ADDR_WIDTH       = 32,
                                             // Width of AXI-4-Lite address bus
   parameter C0_C_S_AXI_CTRL_DATA_WIDTH       = 32,
                                             // Width of AXI-4-Lite data buses
   parameter C0_C_S_AXI_BASEADDR              = 32'h0000_0000,
                                             // Base address of AXI4 Memory Mapped bus.
   parameter C0_C_ECC_ONOFF_RESET_VALUE       = 1,
                                             // Controls ECC on/off value at startup/reset
   parameter C0_C_ECC_CE_COUNTER_WIDTH        = 8,
                                             // The external memory to controller clock ratio.

   //***************************************************************************
   // Debug parameters
   //***************************************************************************
   parameter C0_DEBUG_PORT            = "OFF",
                                     // # = "ON" Enable debug signals/controls.
                                     //   = "OFF" Disable debug signals/controls.

   //***************************************************************************
   // Temparature monitor parameter
   //***************************************************************************
   parameter C0_TEMP_MON_CONTROL                          = "EXTERNAL",
                                     // # = "INTERNAL", "EXTERNAL"
      
   
   //***************************************************************************
   // The following parameters refer to width of various ports
   //***************************************************************************
   parameter C1_BANK_WIDTH            = 3,
                                     // # of memory Bank Address bits.
   parameter C1_CK_WIDTH              = 1,
                                     // # of CK/CK# outputs to memory.
   parameter C1_COL_WIDTH             = 10,
                                     // # of memory Column Address bits.
   parameter C1_CS_WIDTH              = 1,
                                     // # of unique CS outputs to memory.
   parameter C1_nCS_PER_RANK          = 1,
                                     // # of unique CS outputs per rank for phy
   parameter C1_CKE_WIDTH             = 1,
                                     // # of CKE outputs to memory.
   parameter C1_DATA_BUF_ADDR_WIDTH   = 5,
   parameter C1_DQ_CNT_WIDTH          = 6,
                                     // = ceil(log2(DQ_WIDTH))
   parameter C1_DQ_PER_DM             = 8,
   parameter C1_DM_WIDTH              = 8,
                                     // # of DM (data mask)
   parameter C1_DQ_WIDTH              = 64,
                                     // # of DQ (data)
   parameter C1_DQS_WIDTH             = 8,
   parameter C1_DQS_CNT_WIDTH         = 3,
                                     // = ceil(log2(DQS_WIDTH))
   parameter C1_DRAM_WIDTH            = 8,
                                     // # of DQ per DQS
   parameter C1_ECC                   = "OFF",
   parameter C1_nBANK_MACHS           = 4,
   parameter C1_RANKS                 = 1,
                                     // # of Ranks.
   parameter C1_ODT_WIDTH             = 1,
                                     // # of ODT outputs to memory.
   parameter C1_ROW_WIDTH             = 16,
                                     // # of memory Row Address bits.
   parameter C1_ADDR_WIDTH            = 30,
                                     // # = RANK_WIDTH + BANK_WIDTH
                                     //     + ROW_WIDTH + COL_WIDTH;
                                     // Chip Select is always tied to low for
                                     // single rank devices
   parameter C1_USE_CS_PORT          = 1,
                                     // # = 1, When Chip Select (CS#) output is enabled
                                     //   = 0, When Chip Select (CS#) output is disabled
                                     // If CS_N disabled, user must connect
                                     // DRAM CS_N input(s) to ground
   parameter C1_USE_DM_PORT           = 1,
                                     // # = 1, When Data Mask option is enabled
                                     //   = 0, When Data Mask option is disbaled
                                     // When Data Mask option is disabled in
                                     // MIG Controller Options page, the logic
                                     // related to Data Mask should not get
                                     // synthesized
   parameter C1_USE_ODT_PORT          = 1,
                                     // # = 1, When ODT output is enabled
                                     //   = 0, When ODT output is disabled
                                     // Parameter configuration for Dynamic ODT support:
                                     // USE_ODT_PORT = 0, RTT_NOM = "DISABLED", RTT_WR = "60/120".
                                     // This configuration allows to save ODT pin mapping from FPGA.
                                     // The user can tie the ODT input of DRAM to HIGH.
   parameter C1_PHY_CONTROL_MASTER_BANK = 1,
                                     // The bank index where master PHY_CONTROL resides,
                                     // equal to the PLL residing bank
   parameter C1_MEM_DENSITY           = "4Gb",
                                     // Indicates the density of the Memory part
                                     // Added for the sake of Vivado simulations
   parameter C1_MEM_SPEEDGRADE        = "107E",
                                     // Indicates the Speed grade of Memory Part
                                     // Added for the sake of Vivado simulations
   parameter C1_MEM_DEVICE_WIDTH      = 8,
                                     // Indicates the device width of the Memory Part
                                     // Added for the sake of Vivado simulations

   //***************************************************************************
   // The following parameters are mode register settings
   //***************************************************************************
   parameter C1_AL                    = "0",
                                     // DDR3 SDRAM:
                                     // Additive Latency (Mode Register 1).
                                     // # = "0", "CL-1", "CL-2".
                                     // DDR2 SDRAM:
                                     // Additive Latency (Extended Mode Register).
   parameter C1_nAL                   = 0,
                                     // # Additive Latency in number of clock
                                     // cycles.
   parameter C1_BURST_MODE            = "8",
                                     // DDR3 SDRAM:
                                     // Burst Length (Mode Register 0).
                                     // # = "8", "4", "OTF".
                                     // DDR2 SDRAM:
                                     // Burst Length (Mode Register).
                                     // # = "8", "4".
   parameter C1_BURST_TYPE            = "SEQ",
                                     // DDR3 SDRAM: Burst Type (Mode Register 0).
                                     // DDR2 SDRAM: Burst Type (Mode Register).
                                     // # = "SEQ" - (Sequential),
                                     //   = "INT" - (Interleaved).
   parameter C1_CL                    = 13,
                                     // in number of clock cycles
                                     // DDR3 SDRAM: CAS Latency (Mode Register 0).
                                     // DDR2 SDRAM: CAS Latency (Mode Register).
   parameter C1_CWL                   = 9,
                                     // in number of clock cycles
                                     // DDR3 SDRAM: CAS Write Latency (Mode Register 2).
                                     // DDR2 SDRAM: Can be ignored
   parameter C1_OUTPUT_DRV            = "HIGH",
                                     // Output Driver Impedance Control (Mode Register 1).
                                     // # = "HIGH" - RZQ/7,
                                     //   = "LOW" - RZQ/6.
   parameter C1_RTT_NOM               = "60",
                                     // RTT_NOM (ODT) (Mode Register 1).
                                     //   = "120" - RZQ/2,
                                     //   = "60"  - RZQ/4,
                                     //   = "40"  - RZQ/6.
   parameter C1_RTT_WR                = "OFF",
                                     // RTT_WR (ODT) (Mode Register 2).
                                     // # = "OFF" - Dynamic ODT off,
                                     //   = "120" - RZQ/2,
                                     //   = "60"  - RZQ/4,
   parameter C1_ADDR_CMD_MODE         = "1T" ,
                                     // # = "1T", "2T".
   parameter C1_REG_CTRL              = "OFF",
                                     // # = "ON" - RDIMMs,
                                     //   = "OFF" - Components, SODIMMs, UDIMMs.
   parameter C1_CA_MIRROR             = "OFF",
                                     // C/A mirror opt for DDR3 dual rank

   parameter C1_VDD_OP_VOLT           = "150",
                                     // # = "150" - 1.5V Vdd Memory part
                                     //   = "135" - 1.35V Vdd Memory part

   
   //***************************************************************************
   // The following parameters are multiplier and divisor factors for PLLE2.
   // Based on the selected design frequency these parameters vary.
   //***************************************************************************
   parameter C1_CLKIN_PERIOD          = 4288,
                                     // Input Clock Period
   parameter C1_CLKFBOUT_MULT         = 8,
                                     // write PLL VCO multiplier
   parameter C1_DIVCLK_DIVIDE         = 1,
                                     // write PLL VCO divisor
   parameter C1_CLKOUT0_PHASE         = 337.5,
                                     // Phase for PLL output clock (CLKOUT0)
   parameter C1_CLKOUT0_DIVIDE        = 2,
                                     // VCO output divisor for PLL output clock (CLKOUT0)
   parameter C1_CLKOUT1_DIVIDE        = 2,
                                     // VCO output divisor for PLL output clock (CLKOUT1)
   parameter C1_CLKOUT2_DIVIDE        = 32,
                                     // VCO output divisor for PLL output clock (CLKOUT2)
   parameter C1_CLKOUT3_DIVIDE        = 8,
                                     // VCO output divisor for PLL output clock (CLKOUT3)

   //***************************************************************************
   // Memory Timing Parameters. These parameters varies based on the selected
   // memory part.
   //***************************************************************************
   parameter C1_tCKE                  = 5000,
                                     // memory tCKE paramter in pS
   parameter C1_tFAW                  = 25000,
                                     // memory tRAW paramter in pS.
   parameter C1_tRAS                  = 34000,
                                     // memory tRAS paramter in pS.
   parameter C1_tRCD                  = 13910,
                                     // memory tRCD paramter in pS.
   parameter C1_tREFI                 = 7800000,
                                     // memory tREFI paramter in pS.
   parameter C1_tRFC                  = 300000,
                                     // memory tRFC paramter in pS.
   parameter C1_tRP                   = 13910,
                                     // memory tRP paramter in pS.
   parameter C1_tRRD                  = 5000,
                                     // memory tRRD paramter in pS.
   parameter C1_tRTP                  = 7500,
                                     // memory tRTP paramter in pS.
   parameter C1_tWTR                  = 7500,
                                     // memory tWTR paramter in pS.
   parameter C1_tZQI                  = 128_000_000,
                                     // memory tZQI paramter in nS.
   parameter C1_tZQCS                 = 64,
                                     // memory tZQCS paramter in clock cycles.

   //***************************************************************************
   // Simulation parameters
   //***************************************************************************
   parameter C1_SIM_BYPASS_INIT_CAL   = "OFF", //"FAST", //
                                     // # = "OFF" -  Complete memory init &
                                     //              calibration sequence
                                     // # = "SKIP" - Not supported
                                     // # = "FAST" - Complete memory init & use
                                     //              abbreviated calib sequence

   parameter C1_SIMULATION           = "FALSE", //"TRUE",// 
                                     // Should be TRUE during design simulations and
                                     // FALSE during implementations

   //***************************************************************************
   // The following parameters varies based on the pin out entered in MIG GUI.
   // Do not change any of these parameters directly by editing the RTL.
   // Any changes required should be done through GUI and the design regenerated.
   //***************************************************************************
   parameter C1_BYTE_LANES_B0         = 4'b1111,
                                     // Byte lanes used in an IO column.
   parameter C1_BYTE_LANES_B1         = 4'b1110,
                                     // Byte lanes used in an IO column.
   parameter C1_BYTE_LANES_B2         = 4'b1111,
                                     // Byte lanes used in an IO column.
   parameter C1_BYTE_LANES_B3         = 4'b0000,
                                     // Byte lanes used in an IO column.
   parameter C1_BYTE_LANES_B4         = 4'b0000,
                                     // Byte lanes used in an IO column.
   parameter C1_DATA_CTL_B0           = 4'b1111,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C1_DATA_CTL_B1           = 4'b0000,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C1_DATA_CTL_B2           = 4'b1111,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C1_DATA_CTL_B3           = 4'b0000,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C1_DATA_CTL_B4           = 4'b0000,
                                     // Indicates Byte lane is data byte lane
                                     // or control Byte lane. '1' in a bit
                                     // position indicates a data byte lane and
                                     // a '0' indicates a control byte lane
   parameter C1_PHY_0_BITLANES        = 48'h3FE_3FE_3FE_2FF,
   parameter C1_PHY_1_BITLANES        = 48'hFFE_FF0_C6A_000,
   parameter C1_PHY_2_BITLANES        = 48'h3FE_3FE_3FE_2FF,

   // control/address/data pin mapping parameters
   parameter C1_CK_BYTE_MAP
     = 144'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_12,
   parameter C1_ADDR_MAP
     = 192'h139_138_137_136_13B_13A_135_134_133_132_131_129_128_127_126_12B,
   parameter C1_BANK_MAP   = 36'h12A_125_124,
   parameter C1_CAS_MAP    = 12'h115,
   parameter C1_CKE_ODT_BYTE_MAP = 8'h00,
   parameter C1_CKE_MAP    = 96'h000_000_000_000_000_000_000_116,
   parameter C1_ODT_MAP    = 96'h000_000_000_000_000_000_000_111,
   parameter C1_CS_MAP     = 120'h000_000_000_000_000_000_000_000_000_113,
   parameter C1_PARITY_MAP = 12'h000,
   parameter C1_RAS_MAP    = 12'h11A,
   parameter C1_WE_MAP     = 12'h11B,
   parameter C1_DQS_BYTE_MAP
     = 144'h00_00_00_00_00_00_00_00_00_00_22_23_21_20_00_01_03_02,
   parameter C1_DATA0_MAP  = 96'h024_025_027_026_023_022_029_028,
   parameter C1_DATA1_MAP  = 96'h036_037_032_033_034_035_039_038,
   parameter C1_DATA2_MAP  = 96'h014_015_018_019_013_012_017_016,
   parameter C1_DATA3_MAP  = 96'h003_002_006_007_005_009_004_001,
   parameter C1_DATA4_MAP  = 96'h201_206_204_207_202_203_209_205,
   parameter C1_DATA5_MAP  = 96'h215_214_216_217_219_213_218_212,
   parameter C1_DATA6_MAP  = 96'h236_235_233_239_234_237_238_232,
   parameter C1_DATA7_MAP  = 96'h225_226_228_229_224_227_222_223,
   parameter C1_DATA8_MAP  = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA9_MAP  = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA10_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA11_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA12_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA13_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA14_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA15_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA16_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_DATA17_MAP = 96'h000_000_000_000_000_000_000_000,
   parameter C1_MASK0_MAP  = 108'h000_221_231_211_200_000_011_031_021,
   parameter C1_MASK1_MAP  = 108'h000_000_000_000_000_000_000_000_000,

   parameter C1_SLOT_0_CONFIG         = 8'b0000_0001,
                                     // Mapping of Ranks.
   parameter C1_SLOT_1_CONFIG         = 8'b0000_0000,
                                     // Mapping of Ranks.

   //***************************************************************************
   // IODELAY and PHY related parameters
   //***************************************************************************
   parameter C1_IBUF_LPWR_MODE        = "OFF",
                                     // to phy_top
   parameter C1_DATA_IO_IDLE_PWRDWN   = "ON",
                                     // # = "ON", "OFF"
   parameter C1_BANK_TYPE             = "HP_IO",
                                     // # = "HP_IO", "HPL_IO", "HR_IO", "HRL_IO"
   parameter C1_DATA_IO_PRIM_TYPE     = "HP_LP",
                                     // # = "HP_LP", "HR_LP", "DEFAULT"
   parameter C1_CKE_ODT_AUX           = "FALSE",
   parameter C1_USER_REFRESH          = "OFF",
   parameter C1_WRLVL                 = "ON",
                                     // # = "ON" - DDR3 SDRAM
                                     //   = "OFF" - DDR2 SDRAM.
   parameter C1_ORDERING              = "NORM",
                                     // # = "NORM", "STRICT", "RELAXED".
   parameter C1_CALIB_ROW_ADD         = 16'h0000,
                                     // Calibration row address will be used for
                                     // calibration read and write operations
   parameter C1_CALIB_COL_ADD         = 12'h000,
                                     // Calibration column address will be used for
                                     // calibration read and write operations
   parameter C1_CALIB_BA_ADD          = 3'h0,
                                     // Calibration bank address will be used for
                                     // calibration read and write operations
   parameter C1_TCQ                   = 100,
   

   
   //***************************************************************************
   // System clock frequency parameters
   //***************************************************************************
   parameter C1_tCK                   = 1177,//1072,
                                     // memory tCK paramter.
                                     // # = Clock Period in pS.
   parameter C1_nCK_PER_CLK           = 4,
                                     // # of memory CKs per fabric CLK
   parameter C1_DIFF_TERM_SYSCLK      = "TRUE",
                                     // Differential Termination for System
                                     // clock input pins

   
   //***************************************************************************
   // AXI4 Shim parameters
   //***************************************************************************
   
   parameter C1_UI_EXTRA_CLOCKS = "FALSE",
                                     // Generates extra clocks as
                                     // 1/2, 1/4 and 1/8 of fabrick clock.
                                     // Valid for DDR2/DDR3 AXI interfaces
                                     // based on GUI selection
   parameter C1_C_S_AXI_ID_WIDTH              = 4,
                                             // Width of all master and slave ID signals.
                                             // # = >= 1.
   parameter C1_C_S_AXI_MEM_SIZE              = "4294967296",
                                     // Address Space required for this component
   parameter C1_C_S_AXI_ADDR_WIDTH            = 32,
                                             // Width of S_AXI_AWADDR, S_AXI_ARADDR, M_AXI_AWADDR and
                                             // M_AXI_ARADDR for all SI/MI slots.
                                             // # = 32.
   parameter C1_C_S_AXI_DATA_WIDTH            = 512,
                                             // Width of WDATA and RDATA on SI slot.
                                             // Must be <= APP_DATA_WIDTH.
                                             // # = 32, 64, 128, 256.
   parameter C1_C_MC_nCK_PER_CLK              = 4,
                                             // Indicates whether to instatiate upsizer
                                             // Range: 0, 1
   parameter C1_C_S_AXI_SUPPORTS_NARROW_BURST = 1,
                                             // Indicates whether to instatiate upsizer
                                             // Range: 0, 1
   parameter C1_C_RD_WR_ARB_ALGORITHM          = "RD_PRI_REG",
                                             // Indicates the Arbitration
                                             // Allowed values - "TDM", "ROUND_ROBIN",
                                             // "RD_PRI_REG", "RD_PRI_REG_STARVE_LIMIT"
                                             // "WRITE_PRIORITY", "WRITE_PRIORITY_REG"
   parameter C1_C_S_AXI_REG_EN0               = 20'h00000,
                                             // C_S_AXI_REG_EN0[00] = Reserved
                                             // C_S_AXI_REG_EN0[04] = AW CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[05] =  W CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[06] =  B CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[07] =  R CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN0[08] = AW CHANNEL UPSIZER REGISTER SLICE
                                             // C_S_AXI_REG_EN0[09] =  W CHANNEL UPSIZER REGISTER SLICE
                                             // C_S_AXI_REG_EN0[10] = AR CHANNEL UPSIZER REGISTER SLICE
                                             // C_S_AXI_REG_EN0[11] =  R CHANNEL UPSIZER REGISTER SLICE
   parameter C1_C_S_AXI_REG_EN1               = 20'h00000,
                                             // Instatiates register slices after the upsizer.
                                             // The type of register is specified for each channel
                                             // in a vector. 4 bits per channel are used.
                                             // C_S_AXI_REG_EN1[03:00] = AW CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[07:04] =  W CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[11:08] =  B CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[15:12] = AR CHANNEL REGISTER SLICE
                                             // C_S_AXI_REG_EN1[20:16] =  R CHANNEL REGISTER SLICE
                                             // Possible values for each channel are:
                                             //
                                             //   0 => BYPASS    = The channel is just wired through the
                                             //                    module.
                                             //   1 => FWD       = The master VALID and payload signals
                                             //                    are registrated.
                                             //   2 => REV       = The slave ready signal is registrated
                                             //   3 => FWD_REV   = Both FWD and REV
                                             //   4 => SLAVE_FWD = All slave side signals and master
                                             //                    VALID and payload are registrated.
                                             //   5 => SLAVE_RDY = All slave side signals and master
                                             //                    READY are registrated.
                                             //   6 => INPUTS    = Slave and Master side inputs are
                                             //                    registrated.
                                             //   7 => ADDRESS   = Optimized for address channel
   parameter C1_C_S_AXI_CTRL_ADDR_WIDTH       = 32,
                                             // Width of AXI-4-Lite address bus
   parameter C1_C_S_AXI_CTRL_DATA_WIDTH       = 32,
                                             // Width of AXI-4-Lite data buses
   parameter C1_C_S_AXI_BASEADDR              = 32'h0000_0000,
                                             // Base address of AXI4 Memory Mapped bus.
   parameter C1_C_ECC_ONOFF_RESET_VALUE       = 1,
                                             // Controls ECC on/off value at startup/reset
   parameter C1_C_ECC_CE_COUNTER_WIDTH        = 8,
                                             // The external memory to controller clock ratio.

   //***************************************************************************
   // Debug parameters
   //***************************************************************************
   parameter C1_DEBUG_PORT            = "OFF",
                                     // # = "ON" Enable debug signals/controls.
                                     //   = "OFF" Disable debug signals/controls.

   //***************************************************************************
   // Temparature monitor parameter
   //***************************************************************************
   parameter C1_TEMP_MON_CONTROL                          = "EXTERNAL",
                                     // # = "INTERNAL", "EXTERNAL"
      
   parameter RST_ACT_LOW           = 1
                                     // =1 for active low reset,
                                     // =0 for active high.
   )
  (

   // Inouts
   inout [C0_DQ_WIDTH-1:0]                         c0_ddr3_dq,
   inout [C0_DQS_WIDTH-1:0]                        c0_ddr3_dqs_n,
   inout [C0_DQS_WIDTH-1:0]                        c0_ddr3_dqs_p,

   // Outputs
   output [C0_ROW_WIDTH-1:0]                       c0_ddr3_addr,
   output [C0_BANK_WIDTH-1:0]                      c0_ddr3_ba,
   output                                       c0_ddr3_ras_n,
   output                                       c0_ddr3_cas_n,
   output                                       c0_ddr3_we_n,
   output                                       c0_ddr3_reset_n,
   output [C0_CK_WIDTH-1:0]                        c0_ddr3_ck_p,
   output [C0_CK_WIDTH-1:0]                        c0_ddr3_ck_n,
   output [C0_CKE_WIDTH-1:0]                       c0_ddr3_cke,
   output [C0_CS_WIDTH*C0_nCS_PER_RANK-1:0]           c0_ddr3_cs_n,
   output [C0_DM_WIDTH-1:0]                        c0_ddr3_dm,
   output [C0_ODT_WIDTH-1:0]                       c0_ddr3_odt,

   // Inputs
   // Single-ended system clock
   input                                        c0_sys_clk_i,
   // Single-ended iodelayctrl clk (reference clock)
   input                                        clk_ref_i,
   input  [11:0]                                device_temp_i,
                      // The 12 MSB bits of the temperature sensor transfer
                      // function need to be connected to this port. This port
                      // will be synchronized w.r.t. to fabric clock internally.
      
   // Inouts
   inout [C1_DQ_WIDTH-1:0]                         c1_ddr3_dq,
   inout [C1_DQS_WIDTH-1:0]                        c1_ddr3_dqs_n,
   inout [C1_DQS_WIDTH-1:0]                        c1_ddr3_dqs_p,

   // Outputs
   output [C1_ROW_WIDTH-1:0]                       c1_ddr3_addr,
   output [C1_BANK_WIDTH-1:0]                      c1_ddr3_ba,
   output                                       c1_ddr3_ras_n,
   output                                       c1_ddr3_cas_n,
   output                                       c1_ddr3_we_n,
   output                                       c1_ddr3_reset_n,
   output [C1_CK_WIDTH-1:0]                        c1_ddr3_ck_p,
   output [C1_CK_WIDTH-1:0]                        c1_ddr3_ck_n,
   output [C1_CKE_WIDTH-1:0]                       c1_ddr3_cke,
   output [C1_CS_WIDTH*C1_nCS_PER_RANK-1:0]           c1_ddr3_cs_n,
   output [C1_DM_WIDTH-1:0]                        c1_ddr3_dm,
   output [C1_ODT_WIDTH-1:0]                       c1_ddr3_odt,

   // Inputs
   // Single-ended system clock
   input                                        c1_sys_clk_i,
   // System reset - Default polarity of sys_rst pin is Active Low.
   // System reset polarity will change based on the option 
   // selected in GUI.
   input                                        sys_rst,
   
      // user interface signals
      output                                       c0_ui_clk,
      output                                       c0_ui_clk_sync_rst,
      
      output                                       c0_mmcm_locked,
      
      input                                        c0_aresetn,
   
      // Slave Interface Write Address Ports
      input  [C0_C_S_AXI_ID_WIDTH-1:0]                c0_s_axi_awid,
      input  [C0_C_S_AXI_ADDR_WIDTH-1:0]              c0_s_axi_awaddr,
      input  [7:0]                                 c0_s_axi_awlen,
      input  [2:0]                                 c0_s_axi_awsize,
      input  [1:0]                                 c0_s_axi_awburst,
      input  [0:0]                                 c0_s_axi_awlock,
      input  [3:0]                                 c0_s_axi_awcache,
      input  [2:0]                                 c0_s_axi_awprot,
      //input  [3:0]                                 c0_s_axi_awqos,
      input                                        c0_s_axi_awvalid,
      output                                       c0_s_axi_awready,
      // Slave Interface Write Data Ports
      input  [C0_C_S_AXI_DATA_WIDTH-1:0]              c0_s_axi_wdata,
      input  [C0_C_S_AXI_DATA_WIDTH/8-1:0]            c0_s_axi_wstrb,
      input                                        c0_s_axi_wlast,
      input                                        c0_s_axi_wvalid,
      output                                       c0_s_axi_wready,
      // Slave Interface Write Response Ports
      input                                        c0_s_axi_bready,
      output [C0_C_S_AXI_ID_WIDTH-1:0]                c0_s_axi_bid,
      output [1:0]                                 c0_s_axi_bresp,
      output                                       c0_s_axi_bvalid,
      // Slave Interface Read Address Ports
      input  [C0_C_S_AXI_ID_WIDTH-1:0]                c0_s_axi_arid,
      input  [C0_C_S_AXI_ADDR_WIDTH-1:0]              c0_s_axi_araddr,
      input  [7:0]                                 c0_s_axi_arlen,
      input  [2:0]                                 c0_s_axi_arsize,
      input  [1:0]                                 c0_s_axi_arburst,
      input  [0:0]                                 c0_s_axi_arlock,
      input  [3:0]                                 c0_s_axi_arcache,
      input  [2:0]                                 c0_s_axi_arprot,
      input                                        c0_s_axi_arvalid,
      output                                       c0_s_axi_arready,
      // Slave Interface Read Data Ports
      input                                        c0_s_axi_rready,
      output [C0_C_S_AXI_ID_WIDTH-1:0]                c0_s_axi_rid,
      output [C0_C_S_AXI_DATA_WIDTH-1:0]              c0_s_axi_rdata,
      output [1:0]                                 c0_s_axi_rresp,
      output                                       c0_s_axi_rlast,
      output                                       c0_s_axi_rvalid,
      output                                       c0_init_calib_complete,
      
            // user interface signals
      output                                       c1_ui_clk,
      output                                       c1_ui_clk_sync_rst,
         
      output                                       c1_mmcm_locked,
         
      input                                        c1_aresetn,
         
      
      // Slave Interface Write Address Ports
      input  [C0_C_S_AXI_ID_WIDTH-1:0]                c1_s_axi_awid,
      input  [C0_C_S_AXI_ADDR_WIDTH-1:0]              c1_s_axi_awaddr,
      input  [7:0]                                 c1_s_axi_awlen,
      input  [2:0]                                 c1_s_axi_awsize,
      input  [1:0]                                 c1_s_axi_awburst,
      input  [0:0]                                 c1_s_axi_awlock,
      input  [3:0]                                 c1_s_axi_awcache,
      input  [2:0]                                 c1_s_axi_awprot,
      //input  [3:0]                                 c1_s_axi_awqos,
      input                                        c1_s_axi_awvalid,
      output                                       c1_s_axi_awready,
      // Slave Interface Write Data Ports
      input  [C0_C_S_AXI_DATA_WIDTH-1:0]              c1_s_axi_wdata,
      input  [C0_C_S_AXI_DATA_WIDTH/8-1:0]            c1_s_axi_wstrb,
      input                                        c1_s_axi_wlast,
      input                                        c1_s_axi_wvalid,
      output                                       c1_s_axi_wready,
      // Slave Interface Write Response Ports
      input                                        c1_s_axi_bready,
      output [C0_C_S_AXI_ID_WIDTH-1:0]                c1_s_axi_bid,
      output [1:0]                                 c1_s_axi_bresp,
      output                                       c1_s_axi_bvalid,
      // Slave Interface Read Address Ports
      input  [C0_C_S_AXI_ID_WIDTH-1:0]                c1_s_axi_arid,
      input  [C0_C_S_AXI_ADDR_WIDTH-1:0]              c1_s_axi_araddr,
      input  [7:0]                                 c1_s_axi_arlen,
      input  [2:0]                                 c1_s_axi_arsize,
      input  [1:0]                                 c1_s_axi_arburst,
      input  [0:0]                                 c1_s_axi_arlock,
      input  [3:0]                                 c1_s_axi_arcache,
      input  [2:0]                                 c1_s_axi_arprot,
      input                                        c1_s_axi_arvalid,
      output                                       c1_s_axi_arready,
      // Slave Interface Read Data Ports
      input                                        c1_s_axi_rready,
      output [C0_C_S_AXI_ID_WIDTH-1:0]                c1_s_axi_rid,
      output [C0_C_S_AXI_DATA_WIDTH-1:0]              c1_s_axi_rdata,
      output [1:0]                                 c1_s_axi_rresp,
      output                                       c1_s_axi_rlast,
      output                                       c1_s_axi_rvalid,
      output                                       c1_init_calib_complete
   );

function integer clogb2 (input integer size);
    begin
      size = size - 1;
      for (clogb2=1; size>1; clogb2=clogb2+1)
        size = size >> 1;
    end
  endfunction // clogb2

  function integer STR_TO_INT;
    input [7:0] in;
    begin
      if(in == "8")
        STR_TO_INT = 8;
      else if(in == "4")
        STR_TO_INT = 4;
      else
        STR_TO_INT = 0;
    end
  endfunction


  localparam C0_CMD_PIPE_PLUS1        = "ON";
                                     // add pipeline stage between MC and PHY
  localparam C0_DATA_WIDTH            = 64;
  localparam C0_ECC_WIDTH = (C0_ECC == "OFF")?
                           0 : (C0_DATA_WIDTH <= 4)?
                            4 : (C0_DATA_WIDTH <= 10)?
                             5 : (C0_DATA_WIDTH <= 26)?
                              6 : (C0_DATA_WIDTH <= 57)?
                               7 : (C0_DATA_WIDTH <= 120)?
                                8 : (C0_DATA_WIDTH <= 247)?
                                 9 : 10;
  localparam C0_ECC_TEST              = "OFF";
  localparam C0_RANK_WIDTH = clogb2(C0_RANKS);
  localparam C0_DATA_BUF_OFFSET_WIDTH = 1;
  localparam C0_MC_ERR_ADDR_WIDTH = ((C0_CS_WIDTH == 1) ? 0 : C0_RANK_WIDTH)
                                 + C0_BANK_WIDTH + C0_ROW_WIDTH + C0_COL_WIDTH
                                 + C0_DATA_BUF_OFFSET_WIDTH;
  localparam C0_tPRDI                 = 1_000_000;
                                     // memory tPRDI paramter in pS.
  localparam C0_PAYLOAD_WIDTH         = (C0_ECC_TEST == "OFF") ? C0_DATA_WIDTH : C0_DQ_WIDTH;
  localparam C0_BURST_LENGTH          = STR_TO_INT(C0_BURST_MODE);
  localparam C0_APP_DATA_WIDTH        = 2 * C0_nCK_PER_CLK * C0_PAYLOAD_WIDTH;
  localparam C0_APP_MASK_WIDTH        = C0_APP_DATA_WIDTH / 8;
     
    //***************************************************************************
    // Traffic Gen related parameters (derived)
    //***************************************************************************
    localparam  C0_TG_ADDR_WIDTH = ((C0_CS_WIDTH == 1) ? 0 : C0_RANK_WIDTH)
                                   + C0_BANK_WIDTH + C0_ROW_WIDTH + C0_COL_WIDTH;
    localparam C0_MASK_SIZE             = C0_DATA_WIDTH/8;
    localparam C0_DBG_WR_STS_WIDTH      = 32;
    localparam C0_DBG_RD_STS_WIDTH      = 32;
        
    localparam C1_CMD_PIPE_PLUS1        = "ON";
                                       // add pipeline stage between MC and PHY
    localparam C1_DATA_WIDTH            = 64;
    localparam C1_ECC_WIDTH = (C1_ECC == "OFF")?
                             0 : (C1_DATA_WIDTH <= 4)?
                              4 : (C1_DATA_WIDTH <= 10)?
                               5 : (C1_DATA_WIDTH <= 26)?
                                6 : (C1_DATA_WIDTH <= 57)?
                                 7 : (C1_DATA_WIDTH <= 120)?
                                  8 : (C1_DATA_WIDTH <= 247)?
                                   9 : 10;
    localparam C1_ECC_TEST              = "OFF";
    localparam C1_RANK_WIDTH = clogb2(C1_RANKS);
    localparam C1_DATA_BUF_OFFSET_WIDTH = 1;
    localparam C1_MC_ERR_ADDR_WIDTH = ((C1_CS_WIDTH == 1) ? 0 : C1_RANK_WIDTH)
                                   + C1_BANK_WIDTH + C1_ROW_WIDTH + C1_COL_WIDTH
                                   + C1_DATA_BUF_OFFSET_WIDTH;
    localparam C1_tPRDI                 = 1_000_000;
                                       // memory tPRDI paramter in pS.
    localparam C1_PAYLOAD_WIDTH         = (C1_ECC_TEST == "OFF") ? C1_DATA_WIDTH : C1_DQ_WIDTH;
    localparam C1_BURST_LENGTH          = STR_TO_INT(C1_BURST_MODE);
    localparam C1_APP_DATA_WIDTH        = 2 * C1_nCK_PER_CLK * C1_PAYLOAD_WIDTH;
    localparam C1_APP_MASK_WIDTH        = C1_APP_DATA_WIDTH / 8;
  
    //***************************************************************************
    // Traffic Gen related parameters (derived)
    //***************************************************************************
    localparam  C1_TG_ADDR_WIDTH = ((C1_CS_WIDTH == 1) ? 0 : C1_RANK_WIDTH)
                                   + C1_BANK_WIDTH + C1_ROW_WIDTH + C1_COL_WIDTH;
    localparam C1_MASK_SIZE             = C1_DATA_WIDTH/8;
    localparam C1_DBG_WR_STS_WIDTH      = 32;
    localparam C1_DBG_RD_STS_WIDTH      = 32;    
// Start of User Design top instance
//***************************************************************************
// The User design is instantiated below. The memory interface ports are
// connected to the top-level and the application interface ports are
// connected to the traffic generator module. This provides a reference
// for connecting the memory controller to system.
//***************************************************************************

  mig_axi_mm_dual #
    (
     /****
    .C0_TCQ                              (C0_TCQ),
     .C0_ADDR_CMD_MODE                    (C0_ADDR_CMD_MODE),
     .C0_AL                               (C0_AL),
     .C0_PAYLOAD_WIDTH                    (C0_PAYLOAD_WIDTH),
     .C0_BANK_WIDTH                       (C0_BANK_WIDTH),
     .C0_BURST_MODE                       (C0_BURST_MODE),
     .C0_BURST_TYPE                       (C0_BURST_TYPE),
     .C0_CA_MIRROR                        (C0_CA_MIRROR),
     .C0_VDD_OP_VOLT                      (C0_VDD_OP_VOLT),
     .C0_CK_WIDTH                         (C0_CK_WIDTH),
     .C0_COL_WIDTH                        (C0_COL_WIDTH),
     .C0_CMD_PIPE_PLUS1                   (C0_CMD_PIPE_PLUS1),
     .C0_CS_WIDTH                         (C0_CS_WIDTH),
     .C0_nCS_PER_RANK                     (C0_nCS_PER_RANK),
     .C0_CKE_WIDTH                        (C0_CKE_WIDTH),
     .C0_DATA_WIDTH                       (C0_DATA_WIDTH),
     .C0_DATA_BUF_ADDR_WIDTH              (C0_DATA_BUF_ADDR_WIDTH),
     .C0_DQ_CNT_WIDTH                     (C0_DQ_CNT_WIDTH),
     .C0_DQ_PER_DM                        (C0_DQ_PER_DM),
     .C0_DQ_WIDTH                         (C0_DQ_WIDTH),
     .C0_DQS_CNT_WIDTH                    (C0_DQS_CNT_WIDTH),
     .C0_DQS_WIDTH                        (C0_DQS_WIDTH),
     .C0_DRAM_WIDTH                       (C0_DRAM_WIDTH),
     .C0_ECC                              (C0_ECC),
     .C0_ECC_WIDTH                        (C0_ECC_WIDTH),
     .C0_ECC_TEST                         (C0_ECC_TEST),
     .C0_MC_ERR_ADDR_WIDTH                (C0_MC_ERR_ADDR_WIDTH),
     .C0_nAL                              (C0_nAL),
     .C0_nBANK_MACHS                      (C0_nBANK_MACHS),
     .C0_CKE_ODT_AUX                      (C0_CKE_ODT_AUX),
     .C0_ORDERING                         (C0_ORDERING),
     .C0_OUTPUT_DRV                       (C0_OUTPUT_DRV),
     .C0_IBUF_LPWR_MODE                   (C0_IBUF_LPWR_MODE),
     .C0_DATA_IO_IDLE_PWRDWN              (C0_DATA_IO_IDLE_PWRDWN),
     .C0_BANK_TYPE                        (C0_BANK_TYPE),
     .C0_DATA_IO_PRIM_TYPE                (C0_DATA_IO_PRIM_TYPE),
     .C0_REG_CTRL                         (C0_REG_CTRL),
     .C0_RTT_NOM                          (C0_RTT_NOM),
     .C0_RTT_WR                           (C0_RTT_WR),
     .C0_CL                               (C0_CL),
     .C0_CWL                              (C0_CWL),
     .C0_tCKE                             (C0_tCKE),
     .C0_tFAW                             (C0_tFAW),
     .C0_tPRDI                            (C0_tPRDI),
     .C0_tRAS                             (C0_tRAS),
     .C0_tRCD                             (C0_tRCD),
     .C0_tREFI                            (C0_tREFI),
     .C0_tRFC                             (C0_tRFC),
     .C0_tRP                              (C0_tRP),
     .C0_tRRD                             (C0_tRRD),
     .C0_tRTP                             (C0_tRTP),
     .C0_tWTR                             (C0_tWTR),
     .C0_tZQI                             (C0_tZQI),
     .C0_tZQCS                            (C0_tZQCS),
     .C0_USER_REFRESH                     (C0_USER_REFRESH),
     .C0_WRLVL                            (C0_WRLVL),
     .C0_DEBUG_PORT                       (C0_DEBUG_PORT),
     .C0_RANKS                            (C0_RANKS),
     .C0_ODT_WIDTH                        (C0_ODT_WIDTH),
     .C0_ROW_WIDTH                        (C0_ROW_WIDTH),
     .C0_ADDR_WIDTH                       (C0_ADDR_WIDTH),
     .C0_SIM_BYPASS_INIT_CAL              (C0_SIM_BYPASS_INIT_CAL),
     .C0_SIMULATION                       (C0_SIMULATION),
     .C0_BYTE_LANES_B0                    (C0_BYTE_LANES_B0),
     .C0_BYTE_LANES_B1                    (C0_BYTE_LANES_B1),
     .C0_BYTE_LANES_B2                    (C0_BYTE_LANES_B2),
     .C0_BYTE_LANES_B3                    (C0_BYTE_LANES_B3),
     .C0_BYTE_LANES_B4                    (C0_BYTE_LANES_B4),
     .C0_DATA_CTL_B0                      (C0_DATA_CTL_B0),
     .C0_DATA_CTL_B1                      (C0_DATA_CTL_B1),
     .C0_DATA_CTL_B2                      (C0_DATA_CTL_B2),
     .C0_DATA_CTL_B3                      (C0_DATA_CTL_B3),
     .C0_DATA_CTL_B4                      (C0_DATA_CTL_B4),
     .C0_PHY_0_BITLANES                   (C0_PHY_0_BITLANES),
     .C0_PHY_1_BITLANES                   (C0_PHY_1_BITLANES),
     .C0_PHY_2_BITLANES                   (C0_PHY_2_BITLANES),
     .C0_CK_BYTE_MAP                      (C0_CK_BYTE_MAP),
     .C0_ADDR_MAP                         (C0_ADDR_MAP),
     .C0_BANK_MAP                         (C0_BANK_MAP),
     .C0_CAS_MAP                          (C0_CAS_MAP),
     .C0_CKE_ODT_BYTE_MAP                 (C0_CKE_ODT_BYTE_MAP),
     .C0_CKE_MAP                          (C0_CKE_MAP),
     .C0_ODT_MAP                          (C0_ODT_MAP),
     .C0_CS_MAP                           (C0_CS_MAP),
     .C0_PARITY_MAP                       (C0_PARITY_MAP),
     .C0_RAS_MAP                          (C0_RAS_MAP),
     .C0_WE_MAP                           (C0_WE_MAP),
     .C0_DQS_BYTE_MAP                     (C0_DQS_BYTE_MAP),
     .C0_DATA0_MAP                        (C0_DATA0_MAP),
     .C0_DATA1_MAP                        (C0_DATA1_MAP),
     .C0_DATA2_MAP                        (C0_DATA2_MAP),
     .C0_DATA3_MAP                        (C0_DATA3_MAP),
     .C0_DATA4_MAP                        (C0_DATA4_MAP),
     .C0_DATA5_MAP                        (C0_DATA5_MAP),
     .C0_DATA6_MAP                        (C0_DATA6_MAP),
     .C0_DATA7_MAP                        (C0_DATA7_MAP),
     .C0_DATA8_MAP                        (C0_DATA8_MAP),
     .C0_DATA9_MAP                        (C0_DATA9_MAP),
     .C0_DATA10_MAP                       (C0_DATA10_MAP),
     .C0_DATA11_MAP                       (C0_DATA11_MAP),
     .C0_DATA12_MAP                       (C0_DATA12_MAP),
     .C0_DATA13_MAP                       (C0_DATA13_MAP),
     .C0_DATA14_MAP                       (C0_DATA14_MAP),
     .C0_DATA15_MAP                       (C0_DATA15_MAP),
     .C0_DATA16_MAP                       (C0_DATA16_MAP),
     .C0_DATA17_MAP                       (C0_DATA17_MAP),
     .C0_MASK0_MAP                        (C0_MASK0_MAP),
     .C0_MASK1_MAP                        (C0_MASK1_MAP),
     .C0_CALIB_ROW_ADD                    (C0_CALIB_ROW_ADD),
     .C0_CALIB_COL_ADD                    (C0_CALIB_COL_ADD),
     .C0_CALIB_BA_ADD                     (C0_CALIB_BA_ADD),
     .C0_SLOT_0_CONFIG                    (C0_SLOT_0_CONFIG),
     .C0_SLOT_1_CONFIG                    (C0_SLOT_1_CONFIG),
      .C0_MEM_ADDR_ORDER                  (C0_MEM_ADDR_ORDER),
     .C0_USE_CS_PORT                      (C0_USE_CS_PORT),
     .C0_USE_DM_PORT                      (C0_USE_DM_PORT),
     .C0_USE_ODT_PORT                     (C0_USE_ODT_PORT),
     .C0_PHY_CONTROL_MASTER_BANK          (C0_PHY_CONTROL_MASTER_BANK),
     .C0_TEMP_MON_CONTROL                 (C0_TEMP_MON_CONTROL),
      
     
     .C0_DM_WIDTH                         (C0_DM_WIDTH),
     
     .C0_nCK_PER_CLK                      (C0_nCK_PER_CLK),
     .C0_tCK                              (C0_tCK),
     .C0_DIFF_TERM_SYSCLK                 (C0_DIFF_TERM_SYSCLK),
     .C0_CLKIN_PERIOD                     (C0_CLKIN_PERIOD),
     .C0_CLKFBOUT_MULT                    (C0_CLKFBOUT_MULT),
     .C0_DIVCLK_DIVIDE                    (C0_DIVCLK_DIVIDE),
     .C0_CLKOUT0_PHASE                    (C0_CLKOUT0_PHASE),
     .C0_CLKOUT0_DIVIDE                   (C0_CLKOUT0_DIVIDE),
     .C0_CLKOUT1_DIVIDE                   (C0_CLKOUT1_DIVIDE),
     .C0_CLKOUT2_DIVIDE                   (C0_CLKOUT2_DIVIDE),
     .C0_CLKOUT3_DIVIDE                   (C0_CLKOUT3_DIVIDE),
     
     .C0_UI_EXTRA_CLOCKS                 (C0_UI_EXTRA_CLOCKS),
     .C0_C_S_AXI_ID_WIDTH                 (C0_C_S_AXI_ID_WIDTH),
     .C0_C_S_AXI_ADDR_WIDTH               (C0_C_S_AXI_ADDR_WIDTH),
     .C0_C_S_AXI_DATA_WIDTH               (C0_C_S_AXI_DATA_WIDTH),
     .C0_C_MC_nCK_PER_CLK                 (C0_C_MC_nCK_PER_CLK),
     .C0_C_S_AXI_SUPPORTS_NARROW_BURST    (C0_C_S_AXI_SUPPORTS_NARROW_BURST),
     .C0_C_RD_WR_ARB_ALGORITHM            (C0_C_RD_WR_ARB_ALGORITHM),
     .C0_C_S_AXI_REG_EN0                  (C0_C_S_AXI_REG_EN0),
     .C0_C_S_AXI_REG_EN1                  (C0_C_S_AXI_REG_EN1),
     .C0_C_S_AXI_CTRL_ADDR_WIDTH          (C0_C_S_AXI_CTRL_ADDR_WIDTH),
     .C0_C_S_AXI_CTRL_DATA_WIDTH          (C0_C_S_AXI_CTRL_DATA_WIDTH),
     .C0_C_S_AXI_BASEADDR                 (C0_C_S_AXI_BASEADDR),
     .C0_C_ECC_ONOFF_RESET_VALUE          (C0_C_ECC_ONOFF_RESET_VALUE),
     .C0_C_ECC_CE_COUNTER_WIDTH           (C0_C_ECC_CE_COUNTER_WIDTH),
      
     
     .SYSCLK_TYPE                      (SYSCLK_TYPE),
     .REFCLK_TYPE                      (REFCLK_TYPE),
     .SYS_RST_PORT                     (SYS_RST_PORT),
     .REFCLK_FREQ                      (REFCLK_FREQ),
     .DIFF_TERM_REFCLK                 (DIFF_TERM_REFCLK),
     .IODELAY_GRP                      (IODELAY_GRP),
      
     .CAL_WIDTH                        (CAL_WIDTH),
     .STARVE_LIMIT                     (STARVE_LIMIT),
     .DRAM_TYPE                        (DRAM_TYPE),
      
      
     .C1_TCQ                              (C1_TCQ),
     .C1_ADDR_CMD_MODE                    (C1_ADDR_CMD_MODE),
     .C1_AL                               (C1_AL),
     .C1_PAYLOAD_WIDTH                    (C1_PAYLOAD_WIDTH),
     .C1_BANK_WIDTH                       (C1_BANK_WIDTH),
     .C1_BURST_MODE                       (C1_BURST_MODE),
     .C1_BURST_TYPE                       (C1_BURST_TYPE),
     .C1_CA_MIRROR                        (C1_CA_MIRROR),
     .C1_VDD_OP_VOLT                      (C1_VDD_OP_VOLT),
     .C1_CK_WIDTH                         (C1_CK_WIDTH),
     .C1_COL_WIDTH                        (C1_COL_WIDTH),
     .C1_CMD_PIPE_PLUS1                   (C1_CMD_PIPE_PLUS1),
     .C1_CS_WIDTH                         (C1_CS_WIDTH),
     .C1_nCS_PER_RANK                     (C1_nCS_PER_RANK),
     .C1_CKE_WIDTH                        (C1_CKE_WIDTH),
     .C1_DATA_WIDTH                       (C1_DATA_WIDTH),
     .C1_DATA_BUF_ADDR_WIDTH              (C1_DATA_BUF_ADDR_WIDTH),
     .C1_DQ_CNT_WIDTH                     (C1_DQ_CNT_WIDTH),
     .C1_DQ_PER_DM                        (C1_DQ_PER_DM),
     .C1_DQ_WIDTH                         (C1_DQ_WIDTH),
     .C1_DQS_CNT_WIDTH                    (C1_DQS_CNT_WIDTH),
     .C1_DQS_WIDTH                        (C1_DQS_WIDTH),
     .C1_DRAM_WIDTH                       (C1_DRAM_WIDTH),
     .C1_ECC                              (C1_ECC),
     .C1_ECC_WIDTH                        (C1_ECC_WIDTH),
     .C1_ECC_TEST                         (C1_ECC_TEST),
     .C1_MC_ERR_ADDR_WIDTH                (C1_MC_ERR_ADDR_WIDTH),
     .C1_nAL                              (C1_nAL),
     .C1_nBANK_MACHS                      (C1_nBANK_MACHS),
     .C1_CKE_ODT_AUX                      (C1_CKE_ODT_AUX),
     .C1_ORDERING                         (C1_ORDERING),
     .C1_OUTPUT_DRV                       (C1_OUTPUT_DRV),
     .C1_IBUF_LPWR_MODE                   (C1_IBUF_LPWR_MODE),
     .C1_DATA_IO_IDLE_PWRDWN              (C1_DATA_IO_IDLE_PWRDWN),
     .C1_BANK_TYPE                        (C1_BANK_TYPE),
     .C1_DATA_IO_PRIM_TYPE                (C1_DATA_IO_PRIM_TYPE),
     .C1_REG_CTRL                         (C1_REG_CTRL),
     .C1_RTT_NOM                          (C1_RTT_NOM),
     .C1_RTT_WR                           (C1_RTT_WR),
     .C1_CL                               (C1_CL),
     .C1_CWL                              (C1_CWL),
     .C1_tCKE                             (C1_tCKE),
     .C1_tFAW                             (C1_tFAW),
     .C1_tPRDI                            (C1_tPRDI),
     .C1_tRAS                             (C1_tRAS),
     .C1_tRCD                             (C1_tRCD),
     .C1_tREFI                            (C1_tREFI),
     .C1_tRFC                             (C1_tRFC),
     .C1_tRP                              (C1_tRP),
     .C1_tRRD                             (C1_tRRD),
     .C1_tRTP                             (C1_tRTP),
     .C1_tWTR                             (C1_tWTR),
     .C1_tZQI                             (C1_tZQI),
     .C1_tZQCS                            (C1_tZQCS),
     .C1_USER_REFRESH                     (C1_USER_REFRESH),
     .C1_WRLVL                            (C1_WRLVL),
     .C1_DEBUG_PORT                       (C1_DEBUG_PORT),
     .C1_RANKS                            (C1_RANKS),
     .C1_ODT_WIDTH                        (C1_ODT_WIDTH),
     .C1_ROW_WIDTH                        (C1_ROW_WIDTH),
     .C1_ADDR_WIDTH                       (C1_ADDR_WIDTH),
     .C1_SIM_BYPASS_INIT_CAL              (C1_SIM_BYPASS_INIT_CAL),
     .C1_SIMULATION                       (C1_SIMULATION),
     .C1_BYTE_LANES_B0                    (C1_BYTE_LANES_B0),
     .C1_BYTE_LANES_B1                    (C1_BYTE_LANES_B1),
     .C1_BYTE_LANES_B2                    (C1_BYTE_LANES_B2),
     .C1_BYTE_LANES_B3                    (C1_BYTE_LANES_B3),
     .C1_BYTE_LANES_B4                    (C1_BYTE_LANES_B4),
     .C1_DATA_CTL_B0                      (C1_DATA_CTL_B0),
     .C1_DATA_CTL_B1                      (C1_DATA_CTL_B1),
     .C1_DATA_CTL_B2                      (C1_DATA_CTL_B2),
     .C1_DATA_CTL_B3                      (C1_DATA_CTL_B3),
     .C1_DATA_CTL_B4                      (C1_DATA_CTL_B4),
     .C1_PHY_0_BITLANES                   (C1_PHY_0_BITLANES),
     .C1_PHY_1_BITLANES                   (C1_PHY_1_BITLANES),
     .C1_PHY_2_BITLANES                   (C1_PHY_2_BITLANES),
     .C1_CK_BYTE_MAP                      (C1_CK_BYTE_MAP),
     .C1_ADDR_MAP                         (C1_ADDR_MAP),
     .C1_BANK_MAP                         (C1_BANK_MAP),
     .C1_CAS_MAP                          (C1_CAS_MAP),
     .C1_CKE_ODT_BYTE_MAP                 (C1_CKE_ODT_BYTE_MAP),
     .C1_CKE_MAP                          (C1_CKE_MAP),
     .C1_ODT_MAP                          (C1_ODT_MAP),
     .C1_CS_MAP                           (C1_CS_MAP),
     .C1_PARITY_MAP                       (C1_PARITY_MAP),
     .C1_RAS_MAP                          (C1_RAS_MAP),
     .C1_WE_MAP                           (C1_WE_MAP),
     .C1_DQS_BYTE_MAP                     (C1_DQS_BYTE_MAP),
     .C1_DATA0_MAP                        (C1_DATA0_MAP),
     .C1_DATA1_MAP                        (C1_DATA1_MAP),
     .C1_DATA2_MAP                        (C1_DATA2_MAP),
     .C1_DATA3_MAP                        (C1_DATA3_MAP),
     .C1_DATA4_MAP                        (C1_DATA4_MAP),
     .C1_DATA5_MAP                        (C1_DATA5_MAP),
     .C1_DATA6_MAP                        (C1_DATA6_MAP),
     .C1_DATA7_MAP                        (C1_DATA7_MAP),
     .C1_DATA8_MAP                        (C1_DATA8_MAP),
     .C1_DATA9_MAP                        (C1_DATA9_MAP),
     .C1_DATA10_MAP                       (C1_DATA10_MAP),
     .C1_DATA11_MAP                       (C1_DATA11_MAP),
     .C1_DATA12_MAP                       (C1_DATA12_MAP),
     .C1_DATA13_MAP                       (C1_DATA13_MAP),
     .C1_DATA14_MAP                       (C1_DATA14_MAP),
     .C1_DATA15_MAP                       (C1_DATA15_MAP),
     .C1_DATA16_MAP                       (C1_DATA16_MAP),
     .C1_DATA17_MAP                       (C1_DATA17_MAP),
     .C1_MASK0_MAP                        (C1_MASK0_MAP),
     .C1_MASK1_MAP                        (C1_MASK1_MAP),
     .C1_CALIB_ROW_ADD                    (C1_CALIB_ROW_ADD),
     .C1_CALIB_COL_ADD                    (C1_CALIB_COL_ADD),
     .C1_CALIB_BA_ADD                     (C1_CALIB_BA_ADD),
     .C1_SLOT_0_CONFIG                    (C1_SLOT_0_CONFIG),
     .C1_SLOT_1_CONFIG                    (C1_SLOT_1_CONFIG),
     //.C1_MEM_ADDR_ORDER                   ("TG_TEST"),//(C1_MEM_ADDR_ORDER),
     .C1_USE_CS_PORT                      (C1_USE_CS_PORT),
     .C1_USE_DM_PORT                      (C1_USE_DM_PORT),
     .C1_USE_ODT_PORT                     (C1_USE_ODT_PORT),
     .C1_PHY_CONTROL_MASTER_BANK          (C1_PHY_CONTROL_MASTER_BANK),
     .C1_TEMP_MON_CONTROL                 (C1_TEMP_MON_CONTROL),
      
     
     .C1_DM_WIDTH                         (C1_DM_WIDTH),
     
     .C1_nCK_PER_CLK                      (C1_nCK_PER_CLK),
     .C1_tCK                              (C1_tCK),
     .C1_DIFF_TERM_SYSCLK                 (C1_DIFF_TERM_SYSCLK),
     .C1_CLKIN_PERIOD                     (C1_CLKIN_PERIOD),
     .C1_CLKFBOUT_MULT                    (C1_CLKFBOUT_MULT),
     .C1_DIVCLK_DIVIDE                    (C1_DIVCLK_DIVIDE),
     .C1_CLKOUT0_PHASE                    (C1_CLKOUT0_PHASE),
     .C1_CLKOUT0_DIVIDE                   (C1_CLKOUT0_DIVIDE),
     .C1_CLKOUT1_DIVIDE                   (C1_CLKOUT1_DIVIDE),
     .C1_CLKOUT2_DIVIDE                   (C1_CLKOUT2_DIVIDE),
     .C1_CLKOUT3_DIVIDE                   (C1_CLKOUT3_DIVIDE),
     
     .C1_UI_EXTRA_CLOCKS                 (C1_UI_EXTRA_CLOCKS),
     .C1_C_S_AXI_ID_WIDTH                 (C1_C_S_AXI_ID_WIDTH),
     .C1_C_S_AXI_ADDR_WIDTH               (C1_C_S_AXI_ADDR_WIDTH),
     .C1_C_S_AXI_DATA_WIDTH               (C1_C_S_AXI_DATA_WIDTH),
     .C1_C_MC_nCK_PER_CLK                 (C1_C_MC_nCK_PER_CLK),
     .C1_C_S_AXI_SUPPORTS_NARROW_BURST    (C1_C_S_AXI_SUPPORTS_NARROW_BURST),
     .C1_C_RD_WR_ARB_ALGORITHM            (C1_C_RD_WR_ARB_ALGORITHM),
     .C1_C_S_AXI_REG_EN0                  (C1_C_S_AXI_REG_EN0),
     .C1_C_S_AXI_REG_EN1                  (C1_C_S_AXI_REG_EN1),
     .C1_C_S_AXI_CTRL_ADDR_WIDTH          (C1_C_S_AXI_CTRL_ADDR_WIDTH),
     .C1_C_S_AXI_CTRL_DATA_WIDTH          (C1_C_S_AXI_CTRL_DATA_WIDTH),
     .C1_C_S_AXI_BASEADDR                 (C1_C_S_AXI_BASEADDR),
     .C1_C_ECC_ONOFF_RESET_VALUE          (C1_C_ECC_ONOFF_RESET_VALUE),
     .C1_C_ECC_CE_COUNTER_WIDTH           (C1_C_ECC_CE_COUNTER_WIDTH),
      
     
      
     .RST_ACT_LOW                      (RST_ACT_LOW)
     ****/
     )
    u_mig_axi_mm_dual
      (
       
       
// Memory interface ports
       .c0_ddr3_addr                      (c0_ddr3_addr),
       .c0_ddr3_ba                        (c0_ddr3_ba),
       .c0_ddr3_cas_n                     (c0_ddr3_cas_n),
       .c0_ddr3_ck_n                      (c0_ddr3_ck_n),
       .c0_ddr3_ck_p                      (c0_ddr3_ck_p),
       .c0_ddr3_cke                       (c0_ddr3_cke),
       .c0_ddr3_ras_n                     (c0_ddr3_ras_n),
       .c0_ddr3_reset_n                   (c0_ddr3_reset_n),
       .c0_ddr3_we_n                      (c0_ddr3_we_n),
       .c0_ddr3_dq                        (c0_ddr3_dq),
       .c0_ddr3_dqs_n                     (c0_ddr3_dqs_n),
       .c0_ddr3_dqs_p                     (c0_ddr3_dqs_p),
       .c0_init_calib_complete            (c0_init_calib_complete),
      
       .c0_ddr3_cs_n                      (c0_ddr3_cs_n),
       .c0_ddr3_dm                        (c0_ddr3_dm),
       .c0_ddr3_odt                       (c0_ddr3_odt),
// Application interface ports
       .c0_ui_clk                         (c0_ui_clk),
       .c0_ui_clk_sync_rst                (c0_ui_clk_sync_rst),

       .c0_mmcm_locked                    (c0_mmcm_locked),
       .c0_aresetn                        (c0_aresetn),
       .c0_app_sr_req                     (1'b0),
       .c0_app_ref_req                    (1'b0),
       .c0_app_zq_req                     (1'b0),
       .c0_app_sr_active                  (),
       .c0_app_ref_ack                    (),
       .c0_app_zq_ack                     (),

// Slave Interface Write Address Ports
       .c0_s_axi_awid                     (c0_s_axi_awid),
       .c0_s_axi_awaddr                   (c0_s_axi_awaddr),
       .c0_s_axi_awlen                    (c0_s_axi_awlen),
       .c0_s_axi_awsize                   (c0_s_axi_awsize),
       .c0_s_axi_awburst                  (c0_s_axi_awburst),
       .c0_s_axi_awlock                   (c0_s_axi_awlock),
       .c0_s_axi_awcache                  (c0_s_axi_awcache),
       .c0_s_axi_awprot                   (c0_s_axi_awprot),
       .c0_s_axi_awqos                    (4'h0),
       .c0_s_axi_awvalid                  (c0_s_axi_awvalid),
       .c0_s_axi_awready                  (c0_s_axi_awready),
// Slave Interface Write Data Ports
       .c0_s_axi_wdata                    (c0_s_axi_wdata),
       .c0_s_axi_wstrb                    (c0_s_axi_wstrb),
       .c0_s_axi_wlast                    (c0_s_axi_wlast),
       .c0_s_axi_wvalid                   (c0_s_axi_wvalid),
       .c0_s_axi_wready                   (c0_s_axi_wready),
// Slave Interface Write Response Ports
       .c0_s_axi_bid                      (c0_s_axi_bid),
       .c0_s_axi_bresp                    (c0_s_axi_bresp),
       .c0_s_axi_bvalid                   (c0_s_axi_bvalid),
       .c0_s_axi_bready                   (c0_s_axi_bready),
// Slave Interface Read Address Ports
       .c0_s_axi_arid                     (c0_s_axi_arid),
       .c0_s_axi_araddr                   (c0_s_axi_araddr),
       .c0_s_axi_arlen                    (c0_s_axi_arlen),
       .c0_s_axi_arsize                   (c0_s_axi_arsize),
       .c0_s_axi_arburst                  (c0_s_axi_arburst),
       .c0_s_axi_arlock                   (c0_s_axi_arlock),
       .c0_s_axi_arcache                  (c0_s_axi_arcache),
       .c0_s_axi_arprot                   (c0_s_axi_arprot),
       .c0_s_axi_arqos                    (4'h0),
       .c0_s_axi_arvalid                  (c0_s_axi_arvalid),
       .c0_s_axi_arready                  (c0_s_axi_arready),
// Slave Interface Read Data Ports
       .c0_s_axi_rid                      (c0_s_axi_rid),
       .c0_s_axi_rdata                    (c0_s_axi_rdata),
       .c0_s_axi_rresp                    (c0_s_axi_rresp),
       .c0_s_axi_rlast                    (c0_s_axi_rlast),
       .c0_s_axi_rvalid                   (c0_s_axi_rvalid),
       .c0_s_axi_rready                   (c0_s_axi_rready),

      
       
// System Clock Ports
       .c0_sys_clk_i                       (c0_sys_clk_i),
// Reference Clock Ports
       .clk_ref_i                      (clk_ref_i),
       //.device_temp_i                  (device_temp_i),
      
       
// Memory interface ports
       .c1_ddr3_addr                      (c1_ddr3_addr),
       .c1_ddr3_ba                        (c1_ddr3_ba),
       .c1_ddr3_cas_n                     (c1_ddr3_cas_n),
       .c1_ddr3_ck_n                      (c1_ddr3_ck_n),
       .c1_ddr3_ck_p                      (c1_ddr3_ck_p),
       .c1_ddr3_cke                       (c1_ddr3_cke),
       .c1_ddr3_ras_n                     (c1_ddr3_ras_n),
       .c1_ddr3_reset_n                   (c1_ddr3_reset_n),
       .c1_ddr3_we_n                      (c1_ddr3_we_n),
       .c1_ddr3_dq                        (c1_ddr3_dq),
       .c1_ddr3_dqs_n                     (c1_ddr3_dqs_n),
       .c1_ddr3_dqs_p                     (c1_ddr3_dqs_p),
       .c1_init_calib_complete            (c1_init_calib_complete),
      
       .c1_ddr3_cs_n                      (c1_ddr3_cs_n),
       .c1_ddr3_dm                        (c1_ddr3_dm),
       .c1_ddr3_odt                       (c1_ddr3_odt),
// Application interface ports
       .c1_ui_clk                         (c1_ui_clk),
       .c1_ui_clk_sync_rst                (c1_ui_clk_sync_rst),

       .c1_mmcm_locked                    (c1_mmcm_locked),
       .c1_aresetn                        (c1_aresetn),
       .c1_app_sr_req                     (1'b0),
       .c1_app_ref_req                    (1'b0),
       .c1_app_zq_req                     (1'b0),
       .c1_app_sr_active                  (),
       .c1_app_ref_ack                    (),
       .c1_app_zq_ack                     (),

// Slave Interface Write Address Ports
       .c1_s_axi_awid                     (c1_s_axi_awid),
       .c1_s_axi_awaddr                   (c1_s_axi_awaddr),
       .c1_s_axi_awlen                    (c1_s_axi_awlen),
       .c1_s_axi_awsize                   (c1_s_axi_awsize),
       .c1_s_axi_awburst                  (c1_s_axi_awburst),
       .c1_s_axi_awlock                   (c1_s_axi_awlock),
       .c1_s_axi_awcache                  (c1_s_axi_awcache),
       .c1_s_axi_awprot                   (c1_s_axi_awprot),
       .c1_s_axi_awqos                    (4'h0),
       .c1_s_axi_awvalid                  (c1_s_axi_awvalid),
       .c1_s_axi_awready                  (c1_s_axi_awready),
// Slave Interface Write Data Ports
       .c1_s_axi_wdata                    (c1_s_axi_wdata),
       .c1_s_axi_wstrb                    (c1_s_axi_wstrb),
       .c1_s_axi_wlast                    (c1_s_axi_wlast),
       .c1_s_axi_wvalid                   (c1_s_axi_wvalid),
       .c1_s_axi_wready                   (c1_s_axi_wready),
// Slave Interface Write Response Ports
       .c1_s_axi_bid                      (c1_s_axi_bid),
       .c1_s_axi_bresp                    (c1_s_axi_bresp),
       .c1_s_axi_bvalid                   (c1_s_axi_bvalid),
       .c1_s_axi_bready                   (c1_s_axi_bready),
// Slave Interface Read Address Ports
       .c1_s_axi_arid                     (c1_s_axi_arid),
       .c1_s_axi_araddr                   (c1_s_axi_araddr),
       .c1_s_axi_arlen                    (c1_s_axi_arlen),
       .c1_s_axi_arsize                   (c1_s_axi_arsize),
       .c1_s_axi_arburst                  (c1_s_axi_arburst),
       .c1_s_axi_arlock                   (c1_s_axi_arlock),
       .c1_s_axi_arcache                  (c1_s_axi_arcache),
       .c1_s_axi_arprot                   (c1_s_axi_arprot),
       .c1_s_axi_arqos                    (4'h0),
       .c1_s_axi_arvalid                  (c1_s_axi_arvalid),
       .c1_s_axi_arready                  (c1_s_axi_arready),
// Slave Interface Read Data Ports
       .c1_s_axi_rid                      (c1_s_axi_rid),
       .c1_s_axi_rdata                    (c1_s_axi_rdata),
       .c1_s_axi_rresp                    (c1_s_axi_rresp),
       .c1_s_axi_rlast                    (c1_s_axi_rlast),
       .c1_s_axi_rvalid                   (c1_s_axi_rvalid),
       .c1_s_axi_rready                   (c1_s_axi_rready),
     
// System Clock Ports
       .c1_sys_clk_i                       (c1_sys_clk_i),
      
       .sys_rst                        (sys_rst)
       );
// End of User Design top instance


   //*****************************************************************
   // Default values are assigned to the debug inputs
   //*****************************************************************
   assign c0_dbg_sel_pi_incdec       = 'b0;
   assign c0_dbg_sel_po_incdec       = 'b0;
   assign c0_dbg_pi_f_inc            = 'b0;
   assign c0_dbg_pi_f_dec            = 'b0;
   assign c0_dbg_po_f_inc            = 'b0;
   assign c0_dbg_po_f_dec            = 'b0;
   assign c0_dbg_po_f_stg23_sel      = 'b0;
   assign c0_po_win_tg_rst           = 'b0;
   assign c0_vio_tg_rst              = 'b0;
   //*****************************************************************
   // Default values are assigned to the debug inputs
   //*****************************************************************
   assign c1_dbg_sel_pi_incdec       = 'b0;
   assign c1_dbg_sel_po_incdec       = 'b0;
   assign c1_dbg_pi_f_inc            = 'b0;
   assign c1_dbg_pi_f_dec            = 'b0;
   assign c1_dbg_po_f_inc            = 'b0;
   assign c1_dbg_po_f_dec            = 'b0;
   assign c1_dbg_po_f_stg23_sel      = 'b0;
   assign c1_po_win_tg_rst           = 'b0;
   assign c1_vio_tg_rst              = 'b0;

endmodule
