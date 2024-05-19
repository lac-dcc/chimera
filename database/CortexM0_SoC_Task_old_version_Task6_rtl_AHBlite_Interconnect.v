// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_Interconnect(

    // CLK & RST
    input   wire    HCLK,
    input   wire    HRESETn,

    // CORE SIDE
    input   wire    [31:0]  HADDR,
    input   wire    [2:0]   HBURST,
    input   wire            HMASTLOCK,
    input   wire    [3:0]   HPROT,
    input   wire    [2:0]   HSIZE,
    input   wire    [1:0]   HTRANS,
    input   wire    [31:0]  HWDATA,
    input   wire            HWRITE,
    output  wire            HREADY,
    output  wire    [31:0]  HRDATA,
    output  wire            HRESP,

    // Peripheral 0
    output  wire            HSEL_P0,
    output  wire    [31:0]  HADDR_P0,
    output  wire    [2:0]   HBURST_P0,
    output  wire            HMASTLOCK_P0,
    output  wire    [3:0]   HPROT_P0,
    output  wire    [2:0]   HSIZE_P0,
    output  wire    [1:0]   HTRANS_P0,
    output  wire    [31:0]  HWDATA_P0,
    output  wire            HWRITE_P0,
    output  wire            HREADY_P0,
    input   wire            HREADYOUT_P0,
    input   wire    [31:0]  HRDATA_P0,
    input   wire            HRESP_P0,

    // Peripheral 1
    output  wire            HSEL_P1,
    output  wire    [31:0]  HADDR_P1,
    output  wire    [2:0]   HBURST_P1,
    output  wire            HMASTLOCK_P1,
    output  wire    [3:0]   HPROT_P1,
    output  wire    [2:0]   HSIZE_P1,
    output  wire    [1:0]   HTRANS_P1,
    output  wire    [31:0]  HWDATA_P1,
    output  wire            HWRITE_P1,
    output  wire            HREADY_P1,
    input   wire            HREADYOUT_P1,
    input   wire    [31:0]  HRDATA_P1,
    input   wire            HRESP_P1,

    // Peripheral 2
    output  wire            HSEL_P2,
    output  wire    [31:0]  HADDR_P2,
    output  wire    [2:0]   HBURST_P2,
    output  wire            HMASTLOCK_P2,
    output  wire    [3:0]   HPROT_P2,
    output  wire    [2:0]   HSIZE_P2,
    output  wire    [1:0]   HTRANS_P2,
    output  wire    [31:0]  HWDATA_P2,
    output  wire            HWRITE_P2,
    output  wire            HREADY_P2,
    input   wire            HREADYOUT_P2,
    input   wire    [31:0]  HRDATA_P2,
    input   wire            HRESP_P2,

    // Peripheral 3
    output  wire            HSEL_P3,
    output  wire    [31:0]  HADDR_P3,
    output  wire    [2:0]   HBURST_P3,
    output  wire            HMASTLOCK_P3,
    output  wire    [3:0]   HPROT_P3,
    output  wire    [2:0]   HSIZE_P3,
    output  wire    [1:0]   HTRANS_P3,
    output  wire    [31:0]  HWDATA_P3,
    output  wire            HWRITE_P3,
    output  wire            HREADY_P3,
    input   wire            HREADYOUT_P3,
    input   wire    [31:0]  HRDATA_P3,
    input   wire            HRESP_P3,

    // Peripheral 4
    output  wire            HSEL_P4,
    output  wire    [31:0]  HADDR_P4,
    output  wire    [2:0]   HBURST_P4,
    output  wire            HMASTLOCK_P4,
    output  wire    [3:0]   HPROT_P4,
    output  wire    [2:0]   HSIZE_P4,
    output  wire    [1:0]   HTRANS_P4,
    output  wire    [31:0]  HWDATA_P4,
    output  wire            HWRITE_P4,
    output  wire            HREADY_P4,
    input   wire            HREADYOUT_P4,
    input   wire    [31:0]  HRDATA_P4,
    input   wire            HRESP_P4

);

// Public signals--------------------------------
//-----------------------------------------------

// HADDR
assign  HADDR_P0    =   HADDR;
assign  HADDR_P1    =   HADDR;
assign  HADDR_P2    =   HADDR;
assign  HADDR_P3    =   HADDR;
assign  HADDR_P4    =   HADDR;

// HBURST
assign  HBURST_P0   =   HBURST;
assign  HBURST_P1   =   HBURST;
assign  HBURST_P2   =   HBURST;
assign  HBURST_P3   =   HBURST;
assign  HBURST_P4   =   HBURST;

// HMASTLOCK
assign HMASTLOCK_P0 =   HMASTLOCK;
assign HMASTLOCK_P1 =   HMASTLOCK;
assign HMASTLOCK_P2 =   HMASTLOCK;
assign HMASTLOCK_P3 =   HMASTLOCK;
assign HMASTLOCK_P4 =   HMASTLOCK;

// HPROT
assign HPROT_P0     =   HPROT;
assign HPROT_P1     =   HPROT;
assign HPROT_P2     =   HPROT;
assign HPROT_P3     =   HPROT;
assign HPROT_P4     =   HPROT;

// HSIZE
assign HSIZE_P0     =   HSIZE;
assign HSIZE_P1     =   HSIZE;
assign HSIZE_P2     =   HSIZE;
assign HSIZE_P3     =   HSIZE;
assign HSIZE_P4     =   HSIZE;

// HTRANS
assign HTRANS_P0     =   HTRANS;
assign HTRANS_P1     =   HTRANS;
assign HTRANS_P2     =   HTRANS;
assign HTRANS_P3     =   HTRANS;
assign HTRANS_P4     =   HTRANS;

// HWDATA
assign HWDATA_P0     =   HWDATA;
assign HWDATA_P1     =   HWDATA;
assign HWDATA_P2     =   HWDATA;
assign HWDATA_P3     =   HWDATA;
assign HWDATA_P4     =   HWDATA;

// HWRITE
assign HWRITE_P0     =   HWRITE;
assign HWRITE_P1     =   HWRITE;
assign HWRITE_P2     =   HWRITE;
assign HWRITE_P3     =   HWRITE;
assign HWRITE_P4     =   HWRITE;

// HREADY
assign HREADY_P0     =   HREADY;
assign HREADY_P1     =   HREADY;
assign HREADY_P2     =   HREADY;
assign HREADY_P3     =   HREADY;
assign HREADY_P4     =   HREADY;

// Decoder---------------------------------------
//-----------------------------------------------

AHBlite_Decoder Decoder(
    .HADDR      (HADDR),
    .P0_HSEL    (HSEL_P0),
    .P1_HSEL    (HSEL_P1),
    .P2_HSEL    (HSEL_P2),
    .P3_HSEL    (HSEL_P3),
    .P4_HSEL    (HSEL_P4)   
);

// Slave MUX-------------------------------------
//-----------------------------------------------
AHBlite_SlaveMUX SlaveMUX(

    // CLOCK & RST
    .HCLK           (HCLK),
    .HRESETn        (HRESETn),
    .HREADY         (HREADY),

    //P0
    .P0_HSEL        (HSEL_P0),
    .P0_HREADYOUT   (HREADYOUT_P0),
    .P0_HRESP       (HRESP_P0),
    .P0_HRDATA      (HRDATA_P0),

    //P1
    .P1_HSEL        (HSEL_P1),
    .P1_HREADYOUT   (HREADYOUT_P1),
    .P1_HRESP       (HRESP_P1),
    .P1_HRDATA      (HRDATA_P1),

    //P2
    .P2_HSEL        (HSEL_P2),
    .P2_HREADYOUT   (HREADYOUT_P2),
    .P2_HRESP       (HRESP_P2),
    .P2_HRDATA      (HRDATA_P2),

    //P3
    .P3_HSEL        (HSEL_P3),
    .P3_HREADYOUT   (HREADYOUT_P3),
    .P3_HRESP       (HRESP_P3),
    .P3_HRDATA      (HRDATA_P3),

    //P4
    .P4_HSEL        (HSEL_P4),
    .P4_HREADYOUT   (HREADYOUT_P4),
    .P4_HRESP       (HRESP_P4),
    .P4_HRDATA      (HRDATA_P4),

    .HREADYOUT      (HREADY),
    .HRESP          (HRESP),
    .HRDATA         (HRDATA)
);

endmodule