// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

module dp_data_ld(inx,iny,rst_m,r_enx,w_enx,r_eny,w_eny,outx,outy,
	cnt_en,rst_cnt,cnt_cout,clk,num_cnt);
	input [19:0] inx,iny;
	input rst_m,r_enx,w_enx,r_eny,w_eny,cnt_en,rst_cnt,clk;
	output [19:0] outx,outy;
	output cnt_cout;
	output [7:0] num_cnt;
	wire [7:0] addr;
	assign num_cnt = addr;
	ModuloCounter #(8,150) count1(clk,rst_cnt,cnt_en,addr,cnt_cout);
	Memory #(20,150,8) reg_x(inx,addr,clk,rst_m,r_enx,w_enx,outx),
		reg_y(iny,addr,clk,rst_m,r_eny,w_eny,outy);


endmodule