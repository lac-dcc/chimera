// This program was cloned from: https://github.com/defparam/PCI2Nano-PCB
// License: Creative Commons Attribution Share Alike 4.0 International

module pci2nano(
    //////////// CLOCK //////////
    input                       CLOCK_50,

    //////////// LED //////////
    output      reg     [7:0]   LED,

    //////////// KEY //////////
    input            [1:0]      KEY,

    //////////// SW //////////
    input            [3:0]      SW,

    //////////// SDRAM //////////
    output          [12:0]      DRAM_ADDR,
    output           [1:0]      DRAM_BA,
    output                      DRAM_CAS_N,
    output                      DRAM_CKE,
    output                      DRAM_CLK,
    output                      DRAM_CS_N,
    inout           [15:0]      DRAM_DQ,
    output           [1:0]      DRAM_DQM,
    output                      DRAM_RAS_N,
    output                      DRAM_WE_N,

    //////////// EPCS //////////
    output                      EPCS_ASDO,
    input                       EPCS_DATA0,
    output                      EPCS_DCLK,
    output                      EPCS_NCSO,

    //////////// EEPROM //////////
    output                      I2C_SCLK,
    inout                       I2C_SDAT,

    //////////// 2x13 GPIO Header //////////
    inout           [12:0]      GPIO_2,
    input            [2:0]      GPIO_2_IN,

    //////////// PCI ////////////
    inout           [31:0]      AD,
    inout            [3:0]      CBEn,
    input                       PCI_CLK, // 66 or 33 MHz
    input                       PCI_RSTn,
    inout                       REQn,
    input                       GNTn,
    output                      INTDn,
    output                      INTCn,
    output                      INTBn,
    output                      INTAn,
    inout                       IDSEL,
    inout                       IRDYn,
    inout                       DEVSELn,
    inout                       FRAMEn,
    inout                       LOCKn,
    inout                       TRDYn,
    inout                       PERRn,
    inout                       STOPn,
    inout                       SERRn,
    inout                       PAR,
    output                      M66EN
);



endmodule