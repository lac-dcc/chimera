`default_nettype none

module xgmiisync # (
	parameter Gap = 4'h0
) (
	input wire sys_rst,
	input wire xgmii_rx_clk,
	input wire [63:0] xgmii_rxd_i,
	input wire [7:0] xgmii_rxc_i,
	output reg [63:0] xgmii_rxd_o,
	output reg [7:0] xgmii_rxc_o
);

//-----------------------------------
// logic
//-----------------------------------
reg [63:0] rxd = 64'h00;
reg [7:0] rxc = 8'h00;
reg quad_shift = 1'b0;
always @(posedge xgmii_rx_clk) begin
	if (sys_rst) begin
		rxd <= 64'h00;
		rxc <= 8'h00;
		xgmii_rxd_o <= 64'h00;
		xgmii_rxc_o <= 8'h00;
		quad_shift <= 1'b0;
	end else begin
		rxc <= xgmii_rxc_i;
		rxd <= xgmii_rxd_i;
		if (xgmii_rxc_i[4] == 1'b1 && xgmii_rxd_i[39:32] == 8'hfb) begin
			quad_shift <= 1'b1;
		end else if (xgmii_rxc_i[0] == 1'b1 && xgmii_rxd_i[7:0] == 8'hfb)
			quad_shift <= 1'b0;
		if (quad_shift == 1'b0) begin
			xgmii_rxd_o <= rxd;
			xgmii_rxc_o <= rxc;
		end else begin
			xgmii_rxd_o <= {xgmii_rxd_i[31:0], rxd[63:32]};
			xgmii_rxc_o <= {xgmii_rxc_i[3:0], rxc[7:4]};
		end
	end
end

endmodule
`default_nettype wire
