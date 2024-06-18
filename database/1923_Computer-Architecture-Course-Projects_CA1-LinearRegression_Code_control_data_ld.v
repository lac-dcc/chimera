// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define idle 4'b0000
`define init 4'b0001
`define read 4'b0010
`define s_cf 4'b0011
`define w_cf 4'b0100
`define read_cf 4'b0101
`define wait_cf 4'b0110
`define cnt_cf 4'b0111
`define ls_cnt_cf 4'b1000
`define cf_dn 4'b1001
`define s_err 4'b1010
`define w_err 4'b1011
`define read_err 4'b1100
`define wait_err 4'b1101
`define cnt_err 4'b1110
`define finished 4'b1111
module control_data_ld(start,cout,coef_done,coef_finsh,err_done,
		en_coef,en_err,finishd,cnt_en,rst,w_en,r_en,clk,con_state);
	input start,cout,coef_done,coef_finsh,err_done,clk;
	output [3:0] con_state;
	output reg en_coef,en_err,cnt_en,rst,w_en,r_en,finishd;
	reg [3:0] ps = `idle, ns;
	assign con_state = ps;
	always@(ps,start,cout,coef_done,coef_finsh,err_done)
	begin
		ns = `idle;
		{en_coef,en_err,cnt_en,rst,w_en,r_en,finishd} = 8'b0;
		
		case(ps)
			`idle: ns = start ? `init : `idle; 
			`init: begin ns = start ? `init : `read; rst = 1'b1; end
			`read: begin ns = cout ? `s_cf : `read;cnt_en = 1'b1;w_en = 1'b1; end 
			`s_cf: begin ns = `w_cf;  en_coef= 1'b1; end
			`w_cf: ns = `read_cf;  
			`read_cf: begin ns = `wait_cf; r_en = 1'b1; end
			`wait_cf: begin ns = coef_done ? (cout ? `ls_cnt_cf : `cnt_cf): `wait_cf;r_en = 1'b1;end 
			`cnt_cf: begin ns = `read_cf; cnt_en = 1'b1; end	
			`ls_cnt_cf: begin ns = `cf_dn; cnt_en = 1'b1; end 
			`cf_dn: ns = coef_finsh?`s_err:4'b1001;
			`s_err: begin ns = `w_err;en_err = 1'b1; end 
			`w_err: begin ns = `read_err; end
			`read_err:begin ns = `wait_err; r_en = 1'b1; end 
			`wait_err: begin ns = err_done ? (cout ? `finished : `cnt_err): `wait_err;r_en = 1'b1; end
			`cnt_err: begin ns = `read_err;cnt_en = 1'b1; end 
			`finished: begin ns = `idle; finishd= 1'b1; end			
		endcase

	end
	always@(posedge clk)
		ps <= ns;


endmodule
