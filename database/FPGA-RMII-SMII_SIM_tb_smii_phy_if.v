
//--------------------------------------------------------------------------------------------------------
// Module  : tb_smii_phy_if
// Type    : simulation, top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: testbench for smii_phy_if
//--------------------------------------------------------------------------------------------------------

`timescale 1ps/1ps

module tb_smii_phy_if();

initial $dumpvars(0, tb_smii_phy_if);

reg rstn=1'b0;
initial #25000 rstn=1'b1;

// PHY ref clock
reg phy_smii_ref_clk=1'b1;
always  #4000  phy_smii_ref_clk = ~phy_smii_ref_clk;     // 125MHz

// status
wire       mode_speed;        // 0:10M,  1:100M
wire       mode_duplex;       // 0:Half, 1:Full
wire       status_link;       // 0:Link down   1: Link up

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

// SMII signals (PHY side)
wire       phy_smii_sync;
reg        phy_smii_rxd = 0;
wire       phy_smii_txd;

// MII to SMII converter
smii_phy_if #(
    .RX_SYNC_DELAY    ( 0                )
) smii_phy_if_i(
    .rstn_async       ( rstn             ),
    .mode_speed       ( mode_speed       ),
    .mode_duplex      ( mode_duplex      ),
    .status_link      ( status_link      ),
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
    .phy_smii_ref_clk ( phy_smii_ref_clk ),
    .phy_smii_sync    ( phy_smii_sync    ),
    .phy_smii_rxd     ( phy_smii_rxd     ),
    .phy_smii_txd     ( phy_smii_txd     )
);

task smii_phy_rx;
    input [9:0] data;
    integer i;
begin
    while(~rstn) #1 ;
    while(~phy_smii_sync) #1 ;
    for(i=0; i<10; i++) begin
        phy_smii_rxd <= data[i];
        @(posedge phy_smii_ref_clk);
    end
end
endtask

task mii_mac_tx;
    input txen;
    input txer;
    input [3:0] txd;
begin
    while(~rstn) #1 ;
    while(mac_mii_txrst) #1 ;
    mac_mii_txen <= txen;
    mac_mii_txer <= txer;
    mac_mii_txd <= txen ? txd : 0;
    @(posedge mac_mii_txc);
end
endtask

integer i;

initial begin
    fork
        begin
            smii_phy_rx(10'b1000101000);
            smii_phy_rx(10'b0000000111);
            smii_phy_rx(10'b0000001011);
            smii_phy_rx(10'b0000001110);
            smii_phy_rx(10'b1000101000);
            smii_phy_rx(10'b0000010111);
            smii_phy_rx(10'b0000011011);
            smii_phy_rx(10'b0000011110);
            smii_phy_rx(10'b0000100010);
            smii_phy_rx(10'b1000101000);
            smii_phy_rx(10'b1000101000);
            smii_phy_rx(10'b0000000111);
            smii_phy_rx(10'b0000001011);
            smii_phy_rx(10'b0000001110);
            smii_phy_rx(10'b1000101000);
            for(i=0; i<10; i++) smii_phy_rx(10'b1000100000);
            for(i=0; i<10; i++) smii_phy_rx(10'b1000100000);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000000111);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000001011);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000001110);
            for(i=0; i<10; i++) smii_phy_rx(10'b1000100000);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000010111);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000011011);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000011111);
            for(i=0; i<10; i++) smii_phy_rx(10'b0000100011);
            smii_phy_rx(10'b0000000000);
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
    repeat(100) @ (posedge phy_smii_ref_clk);
    $stop;
end

endmodule
