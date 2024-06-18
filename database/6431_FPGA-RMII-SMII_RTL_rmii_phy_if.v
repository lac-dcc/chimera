// This program was cloned from: https://github.com/WangXuan95/FPGA-RMII-SMII
// License: GNU General Public License v3.0


//--------------------------------------------------------------------------------------------------------
// Module  : rmii_phy_if
// Type    : synthesizable, IP's top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: MII (MAC side) to RMII (PHY side) converter, for 10M or 100M ethernet
//--------------------------------------------------------------------------------------------------------

module rmii_phy_if (
    // reset, active low
    input  wire       rstn_async,
    // speed mode: 0:10M, 1:100M, must be correctly specified
    input  wire       mode_speed,
    // MII interface connect to MAC
    output reg        mac_mii_crs,
    output wire       mac_mii_rxrst,     // optional reset signal to MAC
    output reg        mac_mii_rxc,
    output reg        mac_mii_rxdv,
    output reg        mac_mii_rxer,
    output reg  [3:0] mac_mii_rxd,
    output wire       mac_mii_txrst,     // optional reset signal to MAC
    output reg        mac_mii_txc,
    input  wire       mac_mii_txen,
    input  wire       mac_mii_txer,
    input  wire [3:0] mac_mii_txd,
    // RMII interface connect to PHY
    input  wire       phy_rmii_ref_clk,  // 50MHz required
    input  wire       phy_rmii_crsdv,
    input  wire       phy_rmii_rxer,     // rxer is optional for RMII
    input  wire [1:0] phy_rmii_rxd,
    output reg        phy_rmii_txen,
    output reg  [1:0] phy_rmii_txd
);

initial {mac_mii_crs, mac_mii_rxc, mac_mii_rxdv, mac_mii_rxer, mac_mii_rxd, mac_mii_txc} = 0;
initial {phy_rmii_txen, phy_rmii_txd} = 0;

reg       mode_speed_r = 1'b0;
reg       action = 1'b0;
reg [3:0] cnt_action = 4'h0;
reg       rmii_crsdv_r = 1'b0;
reg       rmii_rxer_r = 1'b0;
reg [1:0] rmii_rxd_r = 2'h0;
reg       rmii_rxer_rr = 1'b0;
reg [1:0] rmii_rxd_rr = 2'h0;
reg       rx_busy = 1'b0;
reg       rx_crs = 1'b0;
reg       rx_ena = 1'b0;
reg       rx_err = 1'b0;
reg [3:0] rx_data = 4'h0;
reg       rx_ena_r = 1'b0;
reg       rx_err_r = 1'b0;
reg [3:0] rx_data_r = 4'h0;
reg       rmii_txen = 1'b0;
reg [1:0] rmii_txd = 2'h0;
reg [1:0] rmii_txd_r = 2'h0;
reg [3:0] tx_rst_r = 4'hf;
reg [3:0] rx_rst_r = 4'hf;

// ----------------------------------------------------------------------------------------------------------------------
//  reset sync
// ----------------------------------------------------------------------------------------------------------------------
reg       rstn = 1'b0;
reg [7:0] rstn_shift = 0;
always @ (posedge phy_rmii_ref_clk or negedge rstn_async)
    if(~rstn_async) begin
        {rstn, rstn_shift} <= 0;
        mode_speed_r <= 1'b0;
    end else begin
        if(mode_speed_r^mode_speed) begin
            {rstn, rstn_shift} <= 0;
        end else begin
            {rstn, rstn_shift} <= {rstn_shift, 1'b1};
        end
        mode_speed_r <= mode_speed;
    end

// ----------------------------------------------------------------------------------------------------------------------
//  action generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        action <= 1'b0;
        cnt_action <= 4'h0;
    end else begin
        action <= (cnt_action==4'h0);
        cnt_action <= (cnt_action<4'h9 && ~mode_speed_r) ? cnt_action+4'h1 : 4'h0;
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII RX raw signal latch 1
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        rmii_crsdv_r <= 1'b0;
        rmii_rxer_r <= 1'b0;
        rmii_rxd_r <= 2'h0;
    end else begin
        rmii_crsdv_r <= phy_rmii_crsdv;
        rmii_rxer_r <= phy_rmii_rxer;
        rmii_rxd_r <= phy_rmii_rxd;
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII RX raw signal latch 2
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        rmii_rxer_rr <= 1'b0;
        rmii_rxd_rr <= 2'h0;
    end else begin
        if(action) begin
            rmii_rxer_rr <= rmii_rxer_r;
            rmii_rxd_rr <= rmii_rxd_r;
        end
    end 

// ----------------------------------------------------------------------------------------------------------------------
//  RMII RX signal parsing
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        rx_busy <= 1'b0;
        rx_crs <= 1'b0;
        rx_ena <= 1'b0;
        rx_err <= 1'b0;
        rx_data <= 4'h0;
    end else begin
        if(action) begin
            if(rx_busy) begin
                if(rx_ena) begin
                    rx_crs <= rmii_crsdv_r;
                    rx_ena <= 1'b0;
                    rx_err <= 1'b0;
                    rx_data <= 4'h0;
                end else if(rmii_crsdv_r) begin
                    rx_ena <= 1'b1;
                    rx_err <= rmii_rxer_r | rmii_rxer_rr;
                    rx_data <= {rmii_rxd_r, rmii_rxd_rr};
                end else begin
                    rx_busy <= 1'b0;
                    rx_ena <= 1'b0;
                    rx_err <= 1'b0;
                    rx_data <= 4'h0;
                end
            end else begin
                if(rmii_crsdv_r) begin
                    if(rmii_rxd_rr==2'h0 || rmii_rxd_r==2'h0) begin
                        rx_crs <= (rmii_rxd_rr==2'h0);
                        rx_ena <= 1'b0;
                        rx_err <= 1'b0;
                        rx_data <= 4'h0;
                    end else begin
                        rx_busy <= 1'b1;
                        rx_ena <= 1'b1;
                        rx_err <= rmii_rxer_r | rmii_rxer_rr | rmii_rxd_rr==2'b10;
                        rx_data <= {rmii_rxd_r, rmii_rxd_rr};
                    end
                end else begin
                    rx_crs <= 1'b0;
                    rx_ena <= 1'b0;
                    rx_err <= 1'b0;
                    rx_data <= 4'h0;
                end
            end
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  MII CRS signal generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        mac_mii_crs <= 1'b0;
    end else begin
        if(action) begin
            mac_mii_crs <= rx_crs;
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII RX parsed data latch
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        rx_ena_r <= 1'b0;
        rx_err_r <= 1'b0;
        rx_data_r <= 4'h0;
    end else begin
        if(action) begin
            rx_ena_r <= rx_ena;
            rx_err_r <= rx_err;
            rx_data_r <= rx_data;
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  MII RX reset generate to MAC
// ----------------------------------------------------------------------------------------------------------------------
assign mac_mii_rxrst = rx_rst_r[0];
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        rx_rst_r <= 4'hf;
    end else begin
        if(action) begin
            rx_rst_r <= {1'b0, rx_rst_r[3:1]};
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  MII RX clock generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        mac_mii_rxc <= 1'b0;
    end else begin
        if(action) begin
            mac_mii_rxc <= ~mac_mii_rxc;
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  MII RX signal generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        mac_mii_rxdv <= 1'b0;
        mac_mii_rxer <= 1'b0;
        mac_mii_rxd  <= 4'h0;
    end else begin
        if(action) begin
            if(mac_mii_rxc) begin
                if(rx_ena) begin
                    mac_mii_rxdv <= 1'b1;
                    mac_mii_rxer <= rx_err;
                    mac_mii_rxd  <= rx_data;
                end else if(rx_ena_r) begin
                    mac_mii_rxdv <= 1'b1;
                    mac_mii_rxer <= rx_err_r;
                    mac_mii_rxd  <= rx_data_r;
                end else begin
                    mac_mii_rxdv <= 1'b0;
                    mac_mii_rxer <= 1'b0;
                    mac_mii_rxd  <= 4'h0;
                end
            end
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII TX reset generate to MAC
// ----------------------------------------------------------------------------------------------------------------------
assign mac_mii_txrst = tx_rst_r[0];
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        tx_rst_r <= 4'hf;
    end else begin
        if(action) begin
            tx_rst_r <= {1'b0, tx_rst_r[3:1]};
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII TX clock generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        mac_mii_txc   <= 1'b0;
    end else begin
        if(action) begin
            mac_mii_txc <= ~mac_mii_txc;
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII TX signal generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        rmii_txen <= 1'b0;
        {rmii_txd_r,rmii_txd} <= 4'h0;
    end else begin
        if(action) begin
            if(~mac_mii_txc) begin
                rmii_txd <= rmii_txd_r;
            end else if(mac_mii_txen) begin
                rmii_txen <= 1'b1;
                {rmii_txd_r,rmii_txd} <= mac_mii_txer ? 4'b1010 : mac_mii_txd;
            end else begin
                rmii_txen <= 1'b0;
                {rmii_txd_r,rmii_txd} <= 4'h0;
            end
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  RMII TX signal output buffer
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_rmii_ref_clk or negedge rstn)
    if(~rstn) begin
        phy_rmii_txen <= 1'b0;
        phy_rmii_txd <= 2'h0;
    end else begin
        phy_rmii_txen <= rmii_txen;
        phy_rmii_txd <= rmii_txd;
    end

endmodule
