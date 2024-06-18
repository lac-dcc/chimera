// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License


module data_ld(clk,inx,iny,outx,outy,cout,start,coef_done,coef_finish,err_done,
			en_coef,en_err,finishd,con_state);
	input clk,start,coef_done,coef_finish,err_done;
	input [19:0] inx,iny;
	output cout,en_coef,en_err,finishd;
	output [3:0] con_state;
	output [19:0] outy,outx;
	wire rst,r_en,w_en,cnt_en,cnt_cout;
	wire [7:0] cnt_num;
	assign cout = cnt_cout;
 	dp_data_ld dp1(inx,iny,rst,r_en,w_en,r_en,w_en,outx,outy,
		cnt_en,rst,cnt_cout,clk,cnt_num);
	control_data_ld control1(start,cnt_cout,coef_done,coef_finish,err_done,
		en_coef,en_err,finishd,cnt_en,rst,w_en,r_en,clk,con_state);
endmodule
