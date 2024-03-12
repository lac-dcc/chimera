
//--------------------------------------------------------------------------------------------------------
// Module  : tb_rmii_phy_if
// Type    : simulation, top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: testbench for rmii_phy_if
//--------------------------------------------------------------------------------------------------------

`timescale 1ps/1ps

module tb_rmii_phy_if();

initial $dumpvars(0, tb_rmii_phy_if);

reg rstn=1'b0;
initial #25000 rstn=1'b1;

// PHY ref clock
reg phy_rmii_ref_clk=1'b1;
always  #10000 phy_rmii_ref_clk = ~phy_rmii_ref_clk;     // 50MHz

// MII signals (MAC side)
wire       mac_mii_crs;
wire       mac_mii_rxrst;
wire       mac_mii_rxc;
wire       mac_mii_rxdv;
wire       mac_mii_rxer;
wire [3:0] mac_mii_rxd;
wire       mac_mii_txrst;
wire       mac_mii_txc;
reg        mac_mii_txen = 0;
reg        mac_mii_txer = 0;
reg  [3:0] mac_mii_txd = 0;

// RMII signals (PHY side)
reg        phy_rmii_crsdv = 0;
reg  [1:0] phy_rmii_rxd = 0;
wire       phy_rmii_txen;
wire [1:0] phy_rmii_txd;

// MII to RMII converter
rmii_phy_if rmii_phy_if_i(
    .rstn_async       ( rstn             ),
    .mode_speed       ( 1'b1             ),  // 100M ethernet
    .mac_mii_crs      ( mac_mii_crs      ),
    .mac_mii_rxrst    ( mac_mii_rxrst    ),
    .mac_mii_rxc      ( mac_mii_rxc      ),
    .mac_mii_rxdv     ( mac_mii_rxdv     ),
    .mac_mii_rxer     ( mac_mii_rxer     ),
    .mac_mii_rxd      ( mac_mii_rxd      ),
    .mac_mii_txrst    ( mac_mii_txrst    ),
    .mac_mii_txc      ( mac_mii_txc      ),
    .mac_mii_txen     ( mac_mii_txen     ),
    .mac_mii_txer     ( mac_mii_txer     ),
    .mac_mii_txd      ( mac_mii_txd      ),
    .phy_rmii_ref_clk ( phy_rmii_ref_clk ),
    .phy_rmii_crsdv   ( phy_rmii_crsdv   ),
    .phy_rmii_rxer    ( 1'b0             ),
    .phy_rmii_rxd     ( phy_rmii_rxd     ),
    .phy_rmii_txen    ( phy_rmii_txen    ),
    .phy_rmii_txd     ( phy_rmii_txd     )
);

task rmii_phy_rx;
    input rxen;
    input [3:0] data;
begin
    while(~rstn) @(posedge phy_rmii_ref_clk);
    while(mac_mii_rxrst) @(posedge phy_rmii_ref_clk);
    phy_rmii_crsdv <= rxen;
    phy_rmii_rxd <= data[1:0];
    @(posedge phy_rmii_ref_clk);
    phy_rmii_crsdv <= rxen;
    phy_rmii_rxd <= data[3:2];
    @(posedge phy_rmii_ref_clk);
end
endtask

task mii_mac_tx;
    input txen;
    input txer;
    input [3:0] txd;
begin
    while(~rstn) @(posedge mac_mii_txc);
    while(mac_mii_txrst) @(posedge mac_mii_txc);
    mac_mii_txen <= txen;
    mac_mii_txer <= txer;
    mac_mii_txd <= txen ? txd : 0;
    @(posedge mac_mii_txc);
end
endtask

initial begin
    fork
        begin
            rmii_phy_rx(1'b0, 4'h0);
            rmii_phy_rx(1'b1, 4'h0);
            rmii_phy_rx(1'b1, 4'h0);
            rmii_phy_rx(1'b1, 4'h5);
            rmii_phy_rx(1'b1, 4'h5);
            rmii_phy_rx(1'b1, 4'h5);
            rmii_phy_rx(1'b1, 4'hD);
            rmii_phy_rx(1'b1, 4'h0);
            rmii_phy_rx(1'b1, 4'h1);
            rmii_phy_rx(1'b1, 4'h2);
            rmii_phy_rx(1'b1, 4'h3);
            rmii_phy_rx(1'b1, 4'h4);
            rmii_phy_rx(1'b1, 4'h5);
            rmii_phy_rx(1'b1, 4'h6);
            rmii_phy_rx(1'b1, 4'h7);
            rmii_phy_rx(1'b1, 4'h8);
            rmii_phy_rx(1'b1, 4'h9);
            rmii_phy_rx(1'b0, 4'h0);
        end
        begin
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b1, 1'b0, 4'h4);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b1, 1'b0, 4'h4);
            mii_mac_tx(1'b1, 1'b0, 4'h5);
            mii_mac_tx(1'b1, 1'b0, 4'h6);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b1, 1'b1, 4'h4);
            mii_mac_tx(1'b1, 1'b0, 4'h5);
            mii_mac_tx(1'b1, 1'b0, 4'h6);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b1, 4'h3);
            mii_mac_tx(1'b1, 1'b0, 4'h4);
            mii_mac_tx(1'b1, 1'b0, 4'h5);
            mii_mac_tx(1'b1, 1'b0, 4'h6);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b1, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b1, 1'b0, 4'h4);
            mii_mac_tx(1'b1, 1'b0, 4'h5);
            mii_mac_tx(1'b1, 1'b0, 4'h6);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
            mii_mac_tx(1'b1, 1'b0, 4'h1);
            mii_mac_tx(1'b1, 1'b0, 4'h2);
            mii_mac_tx(1'b1, 1'b0, 4'h3);
            mii_mac_tx(1'b1, 1'b0, 4'h4);
            mii_mac_tx(1'b1, 1'b0, 4'h5);
            mii_mac_tx(1'b1, 1'b0, 4'h6);
            mii_mac_tx(1'b1, 1'b0, 4'h7);
            mii_mac_tx(1'b1, 1'b0, 4'h8);
            mii_mac_tx(1'b1, 1'b0, 4'h9);
            mii_mac_tx(1'b1, 1'b0, 4'ha);
            mii_mac_tx(1'b0, 1'b0, 4'h0);
        end
    join
    repeat(100) @ (posedge phy_rmii_ref_clk);
    $stop;
end

endmodule
