// This program was cloned from: https://github.com/BHa2R00/lsrt
// License: BSD 2-Clause "Simplified" License

module sdm_tx (
	output empty, 
	input push, clear, 
	output xst, 
	output [1:0] nst, 
	output [1:0] cst, 
	input fclk, 
	input signed [3:0] wdata, 
	output tx, 
	input rstn, setn, clk 
);

wire [15:0] weights[0:15];
assign weights[08] = 16'b0000000000000000;
assign weights[09] = 16'b0000000000000001;
assign weights[10] = 16'b0000000100000001;
assign weights[11] = 16'b0000100000100001;
assign weights[12] = 16'b0001000100010001;
assign weights[13] = 16'b0010010001001001;
assign weights[14] = 16'b0100100101001001;
assign weights[15] = 16'b0100101010010101;
assign weights[00] = 16'b0101010101010101;
assign weights[01] = (~weights[15] <<1) | (~weights[15]>>15);
assign weights[02] = (~weights[14] <<1) | (~weights[14]>>15);
assign weights[03] = (~weights[13] <<1) | (~weights[13]>>15);
assign weights[04] = (~weights[12] <<1) | (~weights[12]>>15);
assign weights[05] = (~weights[11] <<1) | (~weights[11]>>15);
assign weights[06] = (~weights[10] <<1) | (~weights[10]>>15);
assign weights[07] = (~weights[09] <<1) | (~weights[09]>>15);

wire [15:0] weight = weights[$unsigned(wdata)];

lstx #(
	. BMSB ( 3 ), 
	. DMSB ( 15 ), 
	. CMSB ( 0 ) 
) u_lstx (
	.empty(empty), 
	.push(push), .clear(clear), 
	.xst(xst), 
	.nst(nst), 
	.cst(cst), 
	.uclk(), 
	.div(), 
	.fclk(fclk), .sel_fclk(1'b1), 
	.wdata(weight), 
	.tx(tx), 
	.rstn(rstn), .setn(setn), .clk(clk) 
);

endmodule


module sdm_rx (
	output full, 
	input pop, clear, 
	output xst, 
	output [1:0] nst, 
	output [1:0] cst, 
	input fclk, 
	output reg signed [3:0] rdata, 
	input rx, 
	input rstn, setn, clk 
);

localparam [1:0]
	st_cnt		= 2'b10, 
	st_pop		= 2'b11, 
	st_clear	= 2'b01, 
	st_idle		= 2'b00;

wire [15:0] rdata0;
wire fclk_x;
handshake_xor u_fclk(.x(fclk_x), .i(fclk), .rstn(rstn), .setn(setn), .clk(clk));

lsrx #(
	. BMSB ( 3 ), 
	. DMSB ( 15 ), 
	. CMSB ( 0 ) 
) u_lsrx (
	.full(full), 
	.pop(pop), .clear(clear), 
	.xst(xst), 
	.nst(nst), 
	.cst(cst), 
	.uclk(), 
	.div(), 
	.fclk(fclk), .sel_fclk(1'b1),
	.rdata(rdata0), 
	.rx(rx), 
	.rstn(rstn), .setn(setn), .clk(clk) 
);

always@(negedge rstn or posedge clk) begin
	if(!rstn) rdata = 0;
	else if(setn) begin
	if(fclk_x) begin
	rdata = -8;
	if(rdata0[00]) rdata = rdata + 1;
	if(rdata0[01]) rdata = rdata + 1;
	if(rdata0[02]) rdata = rdata + 1;
	if(rdata0[03]) rdata = rdata + 1;
	if(rdata0[04]) rdata = rdata + 1;
	if(rdata0[05]) rdata = rdata + 1;
	if(rdata0[06]) rdata = rdata + 1;
	if(rdata0[07]) rdata = rdata + 1;
	if(rdata0[08]) rdata = rdata + 1;
	if(rdata0[09]) rdata = rdata + 1;
	if(rdata0[10]) rdata = rdata + 1;
	if(rdata0[11]) rdata = rdata + 1;
	if(rdata0[12]) rdata = rdata + 1;
	if(rdata0[13]) rdata = rdata + 1;
	if(rdata0[14]) rdata = rdata + 1;
	if(rdata0[15]) rdata = rdata + 1;
	end
	end
end

endmodule
