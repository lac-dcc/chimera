// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Module: eth_phy_10g_w_prbs31_tb                                       
// LCD - FCEFyN
////////////////////////////////////////////////////////////////////////////////

module eth_phy_10g_w_prbs31_tb;

// Clock and Reset Signals
reg rx_clk;
reg rx_rst;
reg tx_clk;
reg tx_rst;

// Signals for Communication between Modules
reg [63:0] xgmii_txd;    // XGMII Input Data
reg [7:0] xgmii_txc;     // XGMII Control Signals
wire tx_bad_block;       // Status Signal for Bad Blocks
wire [1:0] serdes_tx_hdr;   // Transmitter Output Header
wire [63:0] serdes_tx_data; // Transmitter Output Data
reg [1:0] serdes_rx_hdr;   // Receiver Output Header
reg [63:0] serdes_rx_data; // Receiver Output Data
wire [63:0] xgmii_rxd;    // XGMII Output Data
wire [7:0] xgmii_rxc;     // XGMII Output Control Signals
reg cfg_tx_prbs31_enable;   // Boolean to Enable PRBS31 for Transmitter
reg cfg_rx_prbs31_enable;   // Boolean to Enable PRBS31 for Receiver

//
reg assign_normal_hdr;    // Flag for Normal Header Assignment

// Instance of the Ethernet PHY 10G Module
eth_phy_10g #(
    .DATA_WIDTH(64),
    .CTRL_WIDTH(8),
    .HDR_WIDTH(2),
    .PRBS31_ENABLE(1)
) eth_phy_10g_inst (
    .rx_clk(rx_clk),
    .rx_rst(rx_rst),
    .tx_clk(tx_clk),
    .tx_rst(tx_rst),
    .xgmii_txd(xgmii_txd),
    .xgmii_txc(xgmii_txc),
    .xgmii_rxd(xgmii_rxd),
    .xgmii_rxc(xgmii_rxc),
    .serdes_tx_data(serdes_tx_data),
    .serdes_tx_hdr(serdes_tx_hdr),
    .serdes_rx_data(serdes_rx_data),
    .serdes_rx_hdr(serdes_rx_hdr),
    .serdes_rx_bitslip(),
    .serdes_rx_reset_req(),
    .tx_bad_block(tx_bad_block),
    .rx_error_count(rx_error_count),
    .rx_bad_block(rx_bad_block),
    .rx_sequence_error(rx_sequence_error),
    .rx_block_lock(rx_block_lock),
    .rx_high_ber(rx_high_ber),
    .rx_status(rx_status),
    .cfg_tx_prbs31_enable(cfg_tx_prbs31_enable),
    .cfg_rx_prbs31_enable(cfg_rx_prbs31_enable)
);

// Clock Generator every 10 units of time (ut)
always 
    fork
        #5 rx_clk = ~rx_clk; 
        #5 tx_clk = ~tx_clk;
    join 
    
// Update Signals on Positive Clock Edges
always @(posedge tx_clk) begin

    serdes_rx_data <= serdes_tx_data;
    if(assign_normal_hdr) begin
        serdes_rx_hdr <= serdes_tx_hdr;
    end else begin
        serdes_rx_hdr <= 2;
    end
    
end

// Initialize Parameters
initial begin

    // Signal Initialization
    
    // Configure PRBS31 Generation
    cfg_tx_prbs31_enable = 1'b0;
    cfg_rx_prbs31_enable = 1'b0;
        
    // Initially Configure Clock and Reset        
    rx_rst = 1;
    rx_clk = 0;
    tx_rst = 1;
    tx_clk = 0;

    // Deactivate Normal Header Assignment
    assign_normal_hdr = 0;
    
    // Set Reset to 0 after 10 units of time (ut)
    #10 
    rx_rst = 0;
    tx_rst = 0;
    
    // Initialization of XGMII Data
    xgmii_txd = 64'hxxxxxxxxxxxxxxxx; // Initialize all bits with no data
    
    // Initialization of XGMII Control Signals
    xgmii_txc = 8'hxx; // Assign xx bits
    
    // Enable PRBS31
    fork 
        #100  
        begin
            rx_rst = 1;
            #10 rx_rst = 0;
        end
        #100 cfg_tx_prbs31_enable = 1'b1;
        #100 cfg_rx_prbs31_enable = 1'b1;  
    join
    
    #1000
    assign_normal_hdr = 1;
end

// Finish Simulation
initial begin
    // Wait for Simulation to Finish
    #3000
    // Terminate Simulation
    $finish;
end

endmodule
