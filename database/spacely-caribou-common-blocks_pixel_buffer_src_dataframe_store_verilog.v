// This program was cloned from: https://github.com/SpacelyProject/spacely-caribou-common-blocks
// License: Apache License 2.0

module store_dataframe_verilog # (

    parameter C_S_AXI_DATA_WIDTH = 32,  // AXI Data Bus Width
    parameter C_S_AXI_ADDR_WIDTH = 11,  // AXI Address Bus Width
    parameter FPGA_REGISTER_N    = 11

)(
    
    // SIGNALS FROM LPGBT
    input wire [233:0]                          uplinkUserData_i,
    input wire                                  uplinkrdy_i,
    input wire                                  clk40_i,
    input wire                                  uplinkFEC_i,

    //////////////////////////////
	//    AXI BUS SIGNALS       //
	//////////////////////////////

    // Global Signals
    input wire                                  S_AXI_ACLK,
    input wire                                  S_AXI_ARESETN,

    // Write Address Channel
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]       S_AXI_AWADDR,   // Write Address
    input wire [2 : 0]                          S_AXI_AWPROT,   // Write Protection
    input wire                                  S_AXI_AWVALID,  // Write Address Valid
    output wire                                 S_AXI_AWREADY,  // Write Address Channel Ready

    // Write Data Channel
    input wire [C_S_AXI_DATA_WIDTH-1 : 0]       S_AXI_WDATA,    // Write Data
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0]   S_AXI_WSTRB,    // Write Strobe
    input wire                                  S_AXI_WVALID,   // Write Data Valid
    output wire                                 S_AXI_WREADY,   // Write Data Channel Ready

    // Write Response Channel
    output wire [1 : 0]                         S_AXI_BRESP,    // Write Response
    output wire                                 S_AXI_BVALID,   // Write Response Valid
    input wire                                  S_AXI_BREADY,   // Write Response Channel Ready

    // Read Address Channel
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]       S_AXI_ARADDR,   // Read Address
    input wire [2 : 0]                          S_AXI_ARPROT,   // Read Protection
    input wire                                  S_AXI_ARVALID,  // Read Address Valid
    output wire                                 S_AXI_ARREADY,  // Read Address Channel Ready

    // Read Data Channel
    output wire [C_S_AXI_DATA_WIDTH-1 : 0]      S_AXI_RDATA,    // Ready Data
    output wire [1 : 0]                         S_AXI_RRESP,    // Read Response
    output wire                                 S_AXI_RVALID,   // Read Data Valid
    input wire                                  S_AXI_RREADY    // Read Data Channel Ready
    
    );

    store_dataframe # (

        .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),   // AXI Data Bus Width
        .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH),   // AXI Address Bus Width
        .FPGA_REGISTER_N    (FPGA_REGISTER_N)       // 

    ) STDF0 (
    
        .uplinkUserData_i   (uplinkUserData_i),
        .uplinkrdy_i        (uplinkrdy_i),
        .clk40_i            (clk40_i),
        .uplinkFEC_i        (uplinkFEC_i),
        .S_AXI_ACLK         (S_AXI_ACLK),
        .S_AXI_ARESETN      (S_AXI_ARESETN),
        .S_AXI_AWADDR       (S_AXI_AWADDR),   
        .S_AXI_AWPROT       (S_AXI_AWPROT),   
        .S_AXI_AWVALID      (S_AXI_AWVALID),
        .S_AXI_AWREADY      (S_AXI_AWREADY),
        .S_AXI_WDATA        (S_AXI_WDATA),    
        .S_AXI_WSTRB        (S_AXI_WSTRB),    
        .S_AXI_WVALID       (S_AXI_WVALID),
        .S_AXI_WREADY       (S_AXI_WREADY),
        .S_AXI_BRESP        (S_AXI_BRESP),    
        .S_AXI_BVALID       (S_AXI_BVALID),
        .S_AXI_BREADY       (S_AXI_BREADY),
        .S_AXI_ARADDR       (S_AXI_ARADDR),   
        .S_AXI_ARPROT       (S_AXI_ARPROT),   
        .S_AXI_ARVALID      (S_AXI_ARVALID), 
        .S_AXI_ARREADY      (S_AXI_ARREADY),
        .S_AXI_RDATA        (S_AXI_RDATA),    
        .S_AXI_RRESP        (S_AXI_RRESP),    
        .S_AXI_RVALID       (S_AXI_RVALID),
        .S_AXI_RREADY       (S_AXI_RREADY)
    
    );

endmodule