// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

// ref https://github.com/freecores/round_robin_arbiter

module rr_mask (
	input				clk,    // Clock
	input				rst_n,  // Asynchronous reset active low
	input	[3:0]		req ,

	output reg	[3:0]	grant
);
	reg		[3 : 0]		rotate_ptr  ;
	wire	[3 : 0]		mask_req 	;
	reg		[3 : 0]		mask_grant  ;
	wire	[3 : 0]		grant_comb  ;
	wire				no_mask_req ;
	reg		[3 : 0]		nomask_grant;

	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			rotate_ptr <= 4'b1111 ;
		end
		else begin
			case (1'b1)
				grant[0]: rotate_ptr <= 4'b1110;
				grant[1]: rotate_ptr <= 4'b1100;
				grant[2]: rotate_ptr <= 4'b1000;
				grant[3]: rotate_ptr <= 4'b1111;
			endcase
		end
	end

	assign mask_req = req & rotate_ptr ;

	always @(*) begin
		mask_grant = 4'b0000;
		if (mask_req[0]) mask_grant[0] = 1'b1 ;
		else if (mask_req[1]) mask_grant[1] = 1'b1 ;
		else if (mask_req[2]) mask_grant[2] = 1'b1 ;
		else if (mask_req[3]) mask_grant[3] = 1'b1 ; 
	end

	always @(*) begin
		nomask_grant = 4'b0000;
		if (req[0]) nomask_grant[0] = 1'b1 ;
		else if (req[1]) nomask_grant[1] = 1'b1 ;
		else if (req[2]) nomask_grant[2] = 1'b1 ;
		else if (req[3]) nomask_grant[3] = 1'b1 ; 
	end

	assign no_mask_req = ~|mask_req[3:0] ;
	assign grant_comb[3:0] = (nomask_grant[3:0] & {4{no_mask_req}}) | mask_grant ;

	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			grant <= 4'b0000 ;
		end
		else begin
			grant <= grant_comb & ~grant ;
		end
	end

endmodule