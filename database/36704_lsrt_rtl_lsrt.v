// This program was cloned from: https://github.com/BHa2R00/lsrt
// License: BSD 2-Clause "Simplified" License

module lstx #(
	parameter BMSB = 3, 
	parameter DMSB = 9, 
	parameter CMSB = 12 
)(
	output empty, 
	input push, clear, 
	output xst, 
	output reg [1:0] nst, 
	output [1:0] cst, 
	output uclk, 
	input [CMSB:0] div, 
	input fclk, sel_fclk, 
	input signed [DMSB:0] wdata, 
	output tx, 
	input rstn, setn, clk 
);

localparam [1:0]
	st_cnt		= 2'b10, 
	st_push		= 2'b11, 
	st_clear	= 2'b01, 
	st_idle		= 2'b00; 

reg [CMSB:0] cnt;
reg uclk_r;
assign uclk = sel_fclk ? fclk : uclk_r;
reg [DMSB:0] data;
wire [DMSB:0] nxt_data = {data[DMSB], data[DMSB:1]};
assign tx = data[0];
reg [BMSB:0] bth;
wire end_bth = bth == {(BMSB+1){1'b0}};
assign empty = (cst == st_idle);

wire push_x, clear_x, fclk_x, uclk_x;
handshake_xor u_push(.x(push_x), .i(push), .rstn(rstn), .setn(setn), .clk(clk));
handshake_xor u_clear(.x(clear_x), .i(clear), .rstn(rstn), .setn(setn), .clk(clk));
handshake_xor u_fclk(.x(fclk_x), .i(fclk), .rstn(rstn), .setn(setn), .clk(clk));
handshake_xor u_uclk(.x(uclk_x), .i(uclk), .rstn(rstn), .setn(setn), .clk(clk));

always@(negedge rstn or posedge clk) begin
	if(~rstn) begin
		cnt <= {(CMSB+1){1'b0}};
		uclk_r <= 1'b0;
	end
	else if(setn) begin
		case(nst)
			st_push: cnt <= div;
			st_cnt: begin
				if(fclk_x) begin
					if(cnt == {(CMSB+1){1'b0}}) begin
						cnt <= div;
						uclk_r <= ~uclk_r;
					end
					else cnt <= cnt - 1;
				end
			end
			default: begin
				cnt <= cnt;
				uclk_r <= uclk_r;
			end
		endcase
	end
end

always@(negedge rstn or posedge clk) begin
	if(!rstn) data <= {(DMSB+1){1'b0}};
	else if(setn) begin
		case(nst)
			st_push: data <= wdata;
			st_cnt: begin
				if(uclk_x) data <= nxt_data;
			end
			default: data <= data;
		endcase
	end
end

always@(negedge rstn or posedge clk) begin
	if(!rstn) bth <= {(BMSB+1){1'b0}};
	else if(setn) begin
		case(nst)
			st_push: bth <= DMSB;
			st_cnt: begin
				if(uclk_x) bth <= bth - 1;
			end
			default: bth <= bth;
		endcase
	end
end

state_xor #(
	.STMSB ( 1), 
	.ST0   ( st_idle) 
) u_cst(
	.xst(xst), 
	.cst(cst), 
	.nst(nst), 
	.rstn(rstn), .setn(setn), .clk(clk) 
);

always@(*) begin
	case(cst)
		st_idle: nst = clear_x ? st_clear : push_x ? st_push : cst;
		st_clear: nst = st_idle;
		st_push: nst = st_cnt;
		st_cnt: nst = (uclk_x && end_bth) ? st_idle : cst;
		default: nst = st_idle;
	endcase
end

endmodule


module lsrx #(
	parameter BMSB = 3, 
	parameter DMSB = 9, 
	parameter CMSB = 12 
)(
	output full, 
	input pop, clear, 
	output xst, 
	output reg [1:0] nst, 
	output [1:0] cst, 
	output uclk, 
	input [CMSB:0] div, 
	input fclk, sel_fclk, 
	output reg signed [DMSB:0] rdata, 
	input rx, 
	input rstn, setn, clk 
);

localparam [1:0]
	st_cnt		= 2'b10, 
	st_pop		= 2'b11, 
	st_clear	= 2'b01, 
	st_idle		= 2'b00;

reg [CMSB:0] cnt;
reg uclk_r;
assign uclk = sel_fclk ? fclk : uclk_r;
reg [DMSB:0] data;
wire [DMSB:0] nxt_data = {rx, data[DMSB:1]};
reg [BMSB:0] bth;
wire end_bth = bth == {(BMSB+1){1'b0}};
assign full = (cst == st_idle);

wire pop_x, clear_x, fclk_x, uclk_x;
handshake_xor u_pop(.x(pop_x), .i(pop), .rstn(rstn), .setn(setn), .clk(clk));
handshake_xor u_clear(.x(clear_x), .i(clear), .rstn(rstn), .setn(setn), .clk(clk));
handshake_xor u_fclk(.x(fclk_x), .i(fclk), .rstn(rstn), .setn(setn), .clk(clk));
handshake_xor u_uclk(.x(uclk_x), .i(uclk), .rstn(rstn), .setn(setn), .clk(clk));

always@(negedge rstn or posedge clk) begin
	if(~rstn) begin
		cnt <= {(CMSB+1){1'b0}};
		uclk_r <= 1'b0;
	end
	else if(setn) begin
		case(nst)
			st_pop: cnt <= {(CMSB+1){1'b0}};
			st_cnt: begin
				if(fclk_x) begin
					if(cnt == {(CMSB+1){1'b0}}) begin
						cnt <= div;
						uclk_r <= ~uclk_r;
					end
					else cnt <= cnt - 1;
				end
			end
			default: begin
				cnt <= cnt;
				uclk_r <= uclk_r;
			end
		endcase
	end
end

always@(negedge rstn or posedge clk) begin
	if(!rstn) begin
		data <= {(DMSB+1){1'b0}};
		rdata <= {(DMSB+1){1'b0}};
	end
	else if(setn) begin
		case(nst)
			st_idle: rdata <= nxt_data;
			st_cnt: begin
				if(uclk_x) data <= nxt_data;
			end
			default: begin
				data <= data;
				rdata <= rdata;
			end
		endcase
	end
end

always@(negedge rstn or posedge clk) begin
	if(!rstn) bth <= {(BMSB+1){1'b0}};
	else if(setn) begin
		case(nst)
			st_pop: bth <= DMSB;
			st_cnt: begin
				if(uclk_x) bth <= bth - 1;
			end
			default: bth <= bth;
		endcase
	end
end

state_xor #(
	.STMSB ( 1), 
	.ST0   ( st_idle) 
) u_cst(
	.xst(xst), 
	.cst(cst), 
	.nst(nst), 
	.rstn(rstn), .setn(setn), .clk(clk) 
);

always@(*) begin
	case(cst)
		st_idle: nst = clear_x ? st_clear : pop_x ? st_pop : cst;
		st_clear: nst = st_idle;
		st_pop: nst = st_cnt;
		st_cnt: nst = (uclk_x && end_bth) ? st_idle : cst;
		default: nst = st_idle;
	endcase
end

endmodule
