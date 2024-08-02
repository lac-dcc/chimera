// This program was cloned from: https://github.com/WangXuan95/FPGA-RMII-SMII
// License: GNU General Public License v3.0


//--------------------------------------------------------------------------------------------------------
// Module  : smii_phy_if
// Type    : synthesizable, IP's top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: MII (MAC side) to SMII (PHY side) converter, for 10M or 100M ethernet
//--------------------------------------------------------------------------------------------------------

module smii_phy_if #(
    parameter  RX_SYNC_DELAY = 1  // Considering the PCB delay, when phy_smii_sync propagates from FPGA to PHY, and phy_smii_rxd propagates from PHY back to FPGA, phy_smii_rxd may be one cycle later than phy_smii_sync in FPGA's view. 
                                  // To compensate for the PCB delay, you can set this parameter to 1 to add one cycle delay to phy_smii_sync during the phy_smii_rxd sampling to compensate for the PCB delay.
                                  // 0: no delay
                                  // 1: one cycle delay
) (
    // reset, active low
    input  wire       rstn_async,
    // status output (optional for user)
    output reg        mode_speed,        // 0:10M,  1:100M
    output reg        mode_duplex,       // 0:Half, 1:Full
    output reg        status_link,       // 0:Link down   1: Link up
    // MII interface connect to MAC
    output reg        mac_mii_crs,
    output wire       mac_mii_rxrst,     // optional reset signal to MAC
    output reg        mac_mii_rxc,
    output reg        mac_mii_rxdv,
    output wire       mac_mii_rxer,
    output reg  [3:0] mac_mii_rxd,
    output wire       mac_mii_txrst,     // optional reset signal to MAC
    output wire       mac_mii_txc,
    input  wire       mac_mii_txen,
    input  wire       mac_mii_txer,
    input  wire [3:0] mac_mii_txd,
    // SMII interface connect to  PHY
    input  wire       phy_smii_ref_clk,  // 125MHz required
    output reg        phy_smii_sync,
    input  wire       phy_smii_rxd,
    output reg        phy_smii_txd
);

initial {mode_speed, mode_duplex, status_link} = 0;
initial {mac_mii_crs, mac_mii_rxc, mac_mii_rxdv, mac_mii_rxd} = 0;
initial {phy_smii_sync, phy_smii_txd} = 0;

reg [3:0] tx_rst_r = 4'hf;
reg       smii_rxsync_p = 1'b0;
reg       smii_rxsync = 1'b0;
reg       smii_rxd = 1'b0;
reg [6:0] rx_cnt = 4'h0;
reg       rx_crs = 1'b0;
reg       rx_dv = 1'b0;
reg [6:0] rx_data = 7'h0;
reg       rx_data_msb = 1'b0;
reg       rx_dv_r = 1'b0;
reg [7:0] rx_data_r = 8'h0;
reg       mii_txc_r = 1'b0;
wire      mii_txc_negedge;
reg       tx_en_r = 1'b0;
reg       tx_even = 1'b0;
reg       tx_err = 1'b0;
reg [3:0] tx_nibble = 4'h0;
reg [9:0] tx_serial = 10'b1110111000;
reg [4:0] tx_cnt = 4'd1;
reg [4:0] tx_seg_cnt = 4'd1;
reg [9:0] tx_serial_r = 10'h0;
reg       smii_txsync = 1'b0;
reg       smii_txd = 1'b0;

// ----------------------------------------------------------------------------------------------------------------------
//  reset sync
// ----------------------------------------------------------------------------------------------------------------------
reg       rstn = 1'b0;
reg [7:0] rstn_shift = 0;
always @ (posedge phy_smii_ref_clk or negedge rstn_async)
    if(~rstn_async)
        {rstn, rstn_shift} <= 0;
    else
        {rstn, rstn_shift} <= {rstn_shift, 1'b1};

// ----------------------------------------------------------------------------------------------------------------------
//  SMII TX reset and RX reset generate to MAC
// ----------------------------------------------------------------------------------------------------------------------
assign mac_mii_rxrst = ~rstn;
assign mac_mii_txrst = tx_rst_r[0];
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        tx_rst_r <= 4'hf;
    end else begin
        if(phy_smii_sync) begin
            tx_rst_r <= {1'b0, tx_rst_r[3:1]};
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  SMII RX latch pre
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        smii_rxsync_p <= 1'b0;
    end else begin
        smii_rxsync_p <= phy_smii_sync;
    end

// ----------------------------------------------------------------------------------------------------------------------
//  SMII RX latch
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        smii_rxsync <= 1'b0;
        smii_rxd <= 1'b0;
    end else begin
        smii_rxsync <= (RX_SYNC_DELAY==0) ? phy_smii_sync : smii_rxsync_p;
        smii_rxd <= phy_smii_rxd;
    end

// ----------------------------------------------------------------------------------------------------------------------
//  SMII RX parse
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        rx_cnt <= 7'd0;
        rx_crs <= 1'b0;
        rx_dv <= 1'b0;
        rx_data <= 7'h0;
        rx_data_msb <= 1'b0;
        rx_dv_r <= 1'b0;
        rx_data_r <= 8'h0;
        mode_speed <= 1'b0;
        mode_duplex <= 1'b0;
        status_link <= 1'b0;
        mac_mii_crs <= 1'b0;
    end else begin
        if( rx_cnt == 7'd0 ) begin
            if(smii_rxsync) begin
                rx_cnt <= 7'd1;
                rx_crs <= smii_rxd;
            end
        end else if( rx_cnt == 7'd1 ) begin
            rx_cnt <= 7'd2;
            rx_dv <= smii_rxd;
        end else if( rx_cnt <  7'd9 ) begin
            rx_cnt <= rx_cnt + 7'd1;
            rx_data <= {smii_rxd, rx_data[6:1]};
        end else if( rx_cnt == 7'd9 ) begin
            if( rx_dv ) begin
                rx_cnt <= mode_speed ? 7'd0 : 7'd10;
                if(mode_speed) begin
                    rx_dv_r <= 1'b1;
                    rx_data_r <= {smii_rxd, rx_data};
                end
            end else begin
                rx_cnt <= rx_data[1] ? 7'd0 : 7'd10;
                if(rx_data[1]) begin
                    rx_dv_r <= 1'b0;
                    rx_data_r <= 8'h0;
                end
                mode_speed <= rx_data[1];
                mode_duplex <= rx_data[2];
                status_link <= rx_data[3];
            end
            rx_data_msb <= smii_rxd;
            mac_mii_crs <= rx_crs;
        end else if( rx_cnt < 7'd99 ) begin
            rx_cnt <= rx_cnt + 7'd1;
        end else begin
            rx_cnt <= 7'd0;
            rx_dv_r <= rx_dv;
            rx_data_r <= rx_dv ? {rx_data_msb, rx_data} : 8'h0;
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  MII RX generate
// ----------------------------------------------------------------------------------------------------------------------
assign mac_mii_rxer = 1'b0;
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        mac_mii_rxc <= 1'b0;
        mac_mii_rxdv <= 1'b0;
        mac_mii_rxd <= 4'h0;
    end else begin
        if( mode_speed ) begin
            mac_mii_rxc <= (rx_cnt==7'd3) || (rx_cnt==7'd4) || (rx_cnt==7'd8) || (rx_cnt==7'd9);
            if( rx_cnt == 7'd0 ) begin
                mac_mii_rxdv <= rx_dv_r;
                mac_mii_rxd <= rx_data_r[3:0];
            end else if( rx_cnt == 7'd5 ) begin
                mac_mii_rxd <= rx_data_r[7:4];
            end
        end else begin
            mac_mii_rxc <= (rx_cnt>=7'd25 && rx_cnt<=7'd49) || (rx_cnt>=7'd75);
            if( rx_cnt == 7'd0 ) begin
                mac_mii_rxdv <= rx_dv_r;
                mac_mii_rxd <= rx_data_r[3:0];
            end else if( rx_cnt == 7'd50 ) begin
                mac_mii_rxd <= rx_data_r[7:4];
            end
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  MII TX clock generate
// ----------------------------------------------------------------------------------------------------------------------
assign mac_mii_txc = mac_mii_rxc;

// ----------------------------------------------------------------------------------------------------------------------
//  MII TX clock negedge detect
// ----------------------------------------------------------------------------------------------------------------------
assign mii_txc_negedge = mii_txc_r & ~mac_mii_txc;
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn)
        mii_txc_r <= 1'b0;
    else
        mii_txc_r <= mac_mii_txc;

// ----------------------------------------------------------------------------------------------------------------------
//  MII TX parse
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        tx_en_r <= 1'b0;
        tx_even <= 1'b0;
        tx_err <= 1'b0;
        tx_nibble <= 4'h0;
        tx_serial <= 10'b1110111000;
    end else begin
        if(mii_txc_negedge) begin
            tx_en_r <= mac_mii_txen;
            if(tx_even & tx_en_r & mac_mii_txen) begin
                tx_even <= 1'b0;
                tx_serial <= {mac_mii_txd, tx_nibble, 1'b1, tx_err|mac_mii_txer};
            end else begin
                tx_even <= mac_mii_txen | ~tx_even;
                tx_err <= mac_mii_txer;
                tx_nibble <= mac_mii_txd;
                if(tx_even)
                    tx_serial <= 10'b1110111000;
            end
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  SMII TX count
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        tx_cnt <= 4'd1;
        tx_seg_cnt <= 4'd1;
        tx_serial_r <= 10'd0;
    end else begin
        if(tx_cnt<4'd9) begin
            tx_cnt <= tx_cnt + 4'd1;
        end else begin
            tx_cnt <= 4'd0;
            if( tx_seg_cnt < 4'd9 && ~mode_speed ) begin
                tx_seg_cnt <= tx_seg_cnt + 4'd1;
            end else begin
                tx_seg_cnt <= 4'd0;
                tx_serial_r <= tx_serial;
            end
        end
    end

// ----------------------------------------------------------------------------------------------------------------------
//  SMII TX generate and SYNC generate
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        smii_txsync <= 1'b0;
        smii_txd <= 1'b0;
    end else begin
        smii_txsync <= tx_cnt == 4'd0;
        smii_txd <= tx_serial_r[tx_cnt];
    end

// ----------------------------------------------------------------------------------------------------------------------
//  SMII TX output latch
// ----------------------------------------------------------------------------------------------------------------------
always @ (posedge phy_smii_ref_clk or negedge rstn)
    if(~rstn) begin
        phy_smii_sync <= 1'b0;
        phy_smii_txd <= 1'b0;
    end else begin
        phy_smii_sync <= smii_txsync;
        phy_smii_txd <= smii_txd;
    end

endmodule
