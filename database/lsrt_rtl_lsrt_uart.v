// This program was cloned from: https://github.com/BHa2R00/lsrt
// License: BSD 2-Clause "Simplified" License

module uart_tx #(
	parameter CMSB = 12 
)(
	output empty, 
	input push, clear, 
	output xst, 
	output [1:0] nst, 
	output [1:0] cst, 
	input [CMSB:0] div, 
	input fclk, 
	input [7:0] wdata, 
	output tx_clk, 
	output tx, 
	input rstn, setn, clk 
);

wire parity = ^wdata;

lstx #(
	. BMSB ( 3 ), 
	. DMSB ( 10 ), 
	. CMSB ( CMSB ) 
) u_lstx (
	.empty(empty), 
	.push(push), .clear(clear), 
	.xst(xst), 
	.nst(nst), 
	.cst(cst), 
	.uclk(tx_clk), 
	.div(div), 
	.fclk(fclk), .sel_fclk(1'b0), 
	.wdata({1'b1, parity, wdata, 1'b0}), 
	.tx(tx), 
	.rstn(rstn), .setn(setn), .clk(clk) 
);

endmodule


module uart_rx #(
	parameter CMSB = 12 
)(
	output full, 
	input clear, 
	output xst, 
	output [1:0] nst, 
	output [1:0] cst, 
	input [CMSB:0] div, 
	input fclk, 
	output rxerr, 
	output reg [7:0] rdata, 
	output rx_clk, 
	input rx, 
	input rstn, setn, clk 
);

reg pop;
reg [1:0] rx_d;
wire rx_10 = {rx_d, rx} == 3'b100;
wire [10:0] rdata0;
wire [7:0] nxt_rdata = rdata0[8:1];
wire parity = ^nxt_rdata;
assign rxerr = parity != rdata0[9];
reg [1:0] full_d;
wire full_01 = {full_d, full} == 3'b011;
wire rxend = rdata0[10];
wire rxstart = rdata0[0];

lsrx #(
	. BMSB ( 3 ), 
	. DMSB ( 10 ), 
	. CMSB ( CMSB ) 
) u_lsrx (
	.full(full), 
	.pop(pop), .clear(clear), 
	.xst(xst), 
	.nst(nst), 
	.cst(cst), 
	.uclk(rx_clk), 
	.div(div), 
	.fclk(fclk), .sel_fclk(1'b0), 
	.rdata(rdata0), 
	.rx(rx), 
	.rstn(rstn), .setn(setn), .clk(clk) 
);

always@(negedge rstn or posedge fclk) begin
	if(!rstn) rx_d <= 2'b00;
	else rx_d <= {rx_d[0], rx};
end

always@(negedge rstn or posedge fclk) begin
	if(!rstn) pop <= 1'b0;
	else if(full && rx_10) pop <= ~pop;
end

always@(negedge rstn or posedge fclk) begin
	if(!rstn) full_d <= 2'b00;
	else full_d <= {full_d[0], full};
end

always@(negedge rstn or posedge fclk) begin
	if(!rstn) rdata <= 8'd0;
	else if(full_01 && ~rxerr && rxend && ~rxstart) rdata <= nxt_rdata;
end

endmodule
