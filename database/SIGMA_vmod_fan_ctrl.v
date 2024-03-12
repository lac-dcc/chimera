//##########################################################
// Generated Fowarding Adder Network Controller (FAN topology routing)
// Author: Eric Qin
// Contact: ecqin@gatech.edu
//##########################################################


module fan_ctrl # (
	parameter DATA_TYPE =  32 ,
	parameter NUM_PES =  32 ,
	parameter LOG2_PES =  5 ) (
	clk,
	rst,
	i_vn,
	i_stationary,
	i_data_valid,
	o_reduction_add,
	o_reduction_cmd,
	o_reduction_sel,
	o_reduction_valid
);
	input clk;
	input rst;
	input [NUM_PES*LOG2_PES-1: 0] i_vn; // different partial sum bit seperator
	input i_stationary; // if input data is for stationary or streaming
	input i_data_valid; // if input data is valid or not
	output reg [(NUM_PES-1)-1:0] o_reduction_add; // determine to add or not
	output reg [3*(NUM_PES-1)-1:0] o_reduction_cmd; // reduction command (for VN commands)
	output reg [19 : 0] o_reduction_sel; // select bits for FAN topology
	output reg o_reduction_valid; // if reduction output from FAN is valid or not

	// reduction cmd and sel control bits (not flopped for timing yet)
	reg [(NUM_PES-1)-1:0] r_reduction_add;
	reg [3*(NUM_PES-1)-1:0] r_reduction_cmd;
	reg [19 : 0] r_reduction_sel;


	// diagonal flops for timing fix across different levels in tree (add_en signal)
	reg [15 : 0] r_add_lvl_0;
	reg [15 : 0] r_add_lvl_1;
	reg [11 : 0] r_add_lvl_2;
	reg [7 : 0] r_add_lvl_3;
	reg [4 : 0] r_add_lvl_4;


	// diagonal flops for timing fix across different levels in tree (cmd signal)
	reg [47 : 0] r_cmd_lvl_0;
	reg [47 : 0] r_cmd_lvl_1;
	reg [35 : 0] r_cmd_lvl_2;
	reg [23 : 0] r_cmd_lvl_3;
	reg [14 : 0] r_cmd_lvl_4;


	// diagonal flops for timing fix across different levels in tree (sel signal)
	reg [23 : 0] r_sel_lvl_2;
	reg [31 : 0] r_sel_lvl_3;
	reg [19 : 0] r_sel_lvl_4;


	// timing alignment for i_vn delay and for output valid
	reg [2*NUM_PES*LOG2_PES-1:0] r_vn;
	reg [NUM_PES*LOG2_PES-1:0] w_vn;
	reg [4 : 0 ] r_valid;


	genvar i, x;;
	// add flip flops to delay i_vn
	generate
		for (i=0; i < 2; i=i+1) begin : vn_ff
			if (i == 0) begin: pass
				always @ (posedge clk) begin
					if (rst == 1'b1) begin
						r_vn[(i+1)*NUM_PES*LOG2_PES-1:i*NUM_PES*LOG2_PES] <= 'd0;
					end else begin
						r_vn[(i+1)*NUM_PES*LOG2_PES-1:i*NUM_PES*LOG2_PES] <= i_vn;
					end
				end
			end else begin: flop
				always @ (posedge clk) begin
					if (rst == 1'b1) begin
						r_vn[(i+1)*NUM_PES*LOG2_PES-1:i*NUM_PES*LOG2_PES] <= 'd0;
					end else begin
						r_vn[(i+1)*NUM_PES*LOG2_PES-1:i*NUM_PES*LOG2_PES] <= r_vn[i*NUM_PES*LOG2_PES-1:(i-1)*NUM_PES*LOG2_PES];
					end
				end
			end
		end
	endgenerate

	// assign last flop to w_vn
	always @(*) begin
		w_vn = r_vn[2*NUM_PES*LOG2_PES-1:1*NUM_PES*LOG2_PES];
	end


	// generating control bits for lvl: 0
	// Note: lvl 0 and 1 do not require sel bits
	generate
		for (x=0; x < 16; x=x+1) begin: adders_lvl_0
			if (x == 0) begin: l_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[0+x] = 'd0;
						r_reduction_cmd[3*0+3*x+:3] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[0+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[0+x] = 1'b0;
							end


							if (w_vn[(2*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+2)*LOG2_PES+:LOG2_PES] && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b101; // both vn done
							end else if (w_vn[(2*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+2)*LOG2_PES+:LOG2_PES] && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b000; // nothing
							end
						end else begin
							r_reduction_add[0+x] = 1'b0;
							r_reduction_cmd[3*0+3*x+:3] = 3'b000; // nothing
						end

					end
				end
			end else if (x == 15) begin: r_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[0+x] = 'd0;
						r_reduction_cmd[3*0+3*x+:3] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[0+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[0+x] = 1'b0;
							end


							if (w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+-1)*LOG2_PES+:LOG2_PES] && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b101; // both vn done
							end else if (w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+-1)*LOG2_PES+:LOG2_PES] && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b100; // right vn done
							end else begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[0+x] = 1'b0;
							r_reduction_cmd[3*0+3*x+:3] = 3'b000; // nothing
						end

					end
				end
			end else begin: normal
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[0+x] = 'd0;
						r_reduction_cmd[3*0+3*x+:3] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[0+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[0+x] = 1'b0;
							end


							if ((w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(2*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+2)*LOG2_PES+:LOG2_PES]) && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(2*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+2)*LOG2_PES+:LOG2_PES]) && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(2*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(2*x+2)*LOG2_PES+:LOG2_PES]) && w_vn[(2*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(2*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*0+3*x+:3] = 3'b001; // bypass
							end

						end else begin
							r_reduction_add[0+x] = 1'b0;
					r_reduction_cmd[3*0+3*x+:3] = 3'b000; // nothing
						end

					end
				end
			end
		end
	endgenerate

	// generating control bits for lvl: 1
	// Note: lvl 0 and 1 do not require sel bits
	generate
		for (x=0; x < 8; x=x+1) begin: adders_lvl_1
			if (x == 0) begin: l_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[16+x] = 'd0;
						r_reduction_cmd[3*16+3*x+:3] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[16+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[16+x] = 1'b0;
							end


							if ((w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+1)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+2)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(4*x+2)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+1)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b000; // nothing
							end
						end else begin
							r_reduction_add[16+x] = 1'b0;
							r_reduction_cmd[3*16+3*x+:3] = 3'b000; // nothing
						end

					end
				end
			end else if (x == 7) begin: r_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[16+x] = 'd0;
						r_reduction_cmd[3*16+3*x+:3] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[16+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[16+x] = 1'b0;
							end


							if ((w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+1)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+2)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+-1)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+1)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+-1)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b011; // left vn done
							end else if ((w_vn[(4*x+2)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b100; // right vn done
							end else begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[16+x] = 1'b0;
							r_reduction_cmd[3*16+3*x+:3] = 3'b000; // nothing
						end

					end
				end
			end else begin: normal
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[16+x] = 'd0;
						r_reduction_cmd[3*16+3*x+:3] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[16+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[16+x] = 1'b0;
							end


							if ((w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+1)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+2)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(4*x+2)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+3)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] == w_vn[(4*x+1)*LOG2_PES+:LOG2_PES]) && (w_vn[(4*x+0)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+-1)*LOG2_PES+:LOG2_PES]) && w_vn[(4*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(4*x+2)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*16+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[16+x] = 1'b0;
					r_reduction_cmd[3*16+3*x+:3] = 3'b000; // nothing
						end

					end
				end
			end
		end
	endgenerate

	// generating control bits for lvl: 2
	// Note: lvl 0 and 1 do not require sel bits
	generate
		for (x=0; x < 4; x=x+1) begin: adders_lvl_2
			if (x == 0) begin: l_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[24+x] = 'd0;
						r_reduction_cmd[3*24+3*x+:3] = 'd0;
						r_reduction_sel[(x*2)+0+:2] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+4)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[24+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[24+x] = 1'b0;
							end


							if ((w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+2)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+2)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+3)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+6)*LOG2_PES+:LOG2_PES])  && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+3)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+2)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+2)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+4)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b000; // nothing
							end
						end else begin
							r_reduction_add[24+x] = 1'b0;
							r_reduction_cmd[3*24+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*2)+0+:1] = 'd0;
							end else begin
								r_reduction_sel[(x*2)+0+:1] = 'd1;
							end
						end else begin
							r_reduction_sel[(x*2)+0+:2] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+4)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*2)+1+:1] = 'd1;
							end else begin
								r_reduction_sel[(x*2)+1+:1] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*2)+0+:2] = 'd0;
						end

					end
				end
			end else if (x == 3) begin: r_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[24+x] = 'd0;
						r_reduction_cmd[3*24+3*x+:3] = 'd0;
						r_reduction_sel[(x*2)+0+:2] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+4)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[24+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[24+x] = 1'b0;
							end


							if ((w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+2)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+2)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+3)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+2)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+2)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b011; // left vn done
							end else if ((w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+3)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b100; // right vn done
							end else begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[24+x] = 1'b0;
							r_reduction_cmd[3*24+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*2)+0+:1] = 'd0;
							end else begin
								r_reduction_sel[(x*2)+0+:1] = 'd1;
							end
						end else begin
							r_reduction_sel[(x*2)+0+:2] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+4)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*2)+1+:1] = 'd1;
							end else begin
								r_reduction_sel[(x*2)+1+:1] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*2)+0+:2] = 'd0;
						end

					end
				end
			end else begin: normal
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[24+x] = 'd0;
						r_reduction_cmd[3*24+3*x+:3] = 'd0;
						r_reduction_sel[(x*2)+0+:2] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+4)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[24+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[24+x] = 1'b0;
							end


							if ((w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+2)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+6)*LOG2_PES+:LOG2_PES])  && (w_vn[(8*x+2)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+3)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+6)*LOG2_PES+:LOG2_PES])  && (w_vn[(8*x+5)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+3)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+2)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+1)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(8*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(8*x+2)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*24+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[24+x] = 1'b0;
					r_reduction_cmd[3*24+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+1)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*2)+0+:1] = 'd0;
							end else begin
								r_reduction_sel[(x*2)+0+:1] = 'd1;
							end
						end else begin
							r_reduction_sel[(x*2)+0+:2] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(8*x+4)*LOG2_PES+:LOG2_PES] == w_vn[(8*x+6)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*2)+1+:1] = 'd1;
							end else begin
								r_reduction_sel[(x*2)+1+:1] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*2)+0+:2] = 'd0;
						end

					end
				end
			end
		end
	endgenerate

	// generating control bits for lvl: 3
	// Note: lvl 0 and 1 do not require sel bits
	generate
		for (x=0; x < 2; x=x+1) begin: adders_lvl_3
			if (x == 0) begin: l_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[28+x] = 'd0;
						r_reduction_cmd[3*28+3*x+:3] = 'd0;
						r_reduction_sel[(x*4)+8+:4] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+8)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[28+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[28+x] = 1'b0;
							end


							if ((w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+16)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+8)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+7)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+16)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+12)*LOG2_PES+:LOG2_PES])  && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+7)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+8)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b000; // nothing
							end
						end else begin
							r_reduction_add[28+x] = 1'b0;
							r_reduction_cmd[3*28+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+3)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+8+:2] = 'd0;
							end else if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+5)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+8+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+8+:2] = 'd2;
							end
						end else begin
							r_reduction_sel[(x*4)+8+:4] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+10+:2] = 'd2;
							end else if (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+10)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+10+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+10+:2] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*4)+8+:4] = 'd0;
						end

					end
				end
			end else if (x == 1) begin: r_edge_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[28+x] = 'd0;
						r_reduction_cmd[3*28+3*x+:3] = 'd0;
						r_reduction_sel[(x*4)+8+:4] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+8)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[28+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[28+x] = 1'b0;
							end


							if ((w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+8)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+7)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+4)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b011; // left vn done
							end else if ((w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+7)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b100; // right vn done
							end else begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[28+x] = 1'b0;
							r_reduction_cmd[3*28+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+3)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+8+:2] = 'd0;
							end else if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+5)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+8+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+8+:2] = 'd2;
							end
						end else begin
							r_reduction_sel[(x*4)+8+:4] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+10+:2] = 'd2;
							end else if (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+10)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+10+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+10+:2] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*4)+8+:4] = 'd0;
						end

					end
				end
			end else begin: normal
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[28+x] = 'd0;
						r_reduction_cmd[3*28+3*x+:3] = 'd0;
						r_reduction_sel[(x*4)+8+:4] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+8)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[28+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[28+x] = 1'b0;
							end


							if ((w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+16)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+12)*LOG2_PES+:LOG2_PES])  && (w_vn[(16*x+4)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+8)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+7)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+16)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+12)*LOG2_PES+:LOG2_PES])  && (w_vn[(16*x+11)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+7)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+4)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+3)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+-1)*LOG2_PES+:LOG2_PES]) && (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(16*x+4)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*28+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[28+x] = 1'b0;
					r_reduction_cmd[3*28+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+3)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+8+:2] = 'd0;
							end else if (w_vn[(16*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+5)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+8+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+8+:2] = 'd2;
							end
						end else begin
							r_reduction_sel[(x*4)+8+:4] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+12)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+10+:2] = 'd2;
							end else if (w_vn[(16*x+8)*LOG2_PES+:LOG2_PES] == w_vn[(16*x+10)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+10+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+10+:2] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*4)+8+:4] = 'd0;
						end

					end
				end
			end
		end
	endgenerate

	// generating control bits for lvl: 4
	generate
		for (x=0; x < 1; x=x+1) begin: adders_lvl_4
			if (x == 0) begin: middle_case
				always @ (*) begin
					if (rst == 1'b1) begin
						r_reduction_add[30+x] = 'd0;
						r_reduction_cmd[3*30+3*x+:3] = 'd0;
						r_reduction_sel[(x*4)+16+:4] = 'd0;
					end else begin
						// generate cmd logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(32*x+15)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+16)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_add[30+x] = 1'b1; // add enable
							end else begin
								r_reduction_add[30+x] = 1'b0;
							end


							if ((w_vn[(32*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+8)*LOG2_PES+:LOG2_PES]) && (w_vn[(32*x+23)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+24)*LOG2_PES+:LOG2_PES]) && (w_vn[(32*x+8)*LOG2_PES+:LOG2_PES] != w_vn[(32*x+16)*LOG2_PES+:LOG2_PES]) && (w_vn[(32*x+23)*LOG2_PES+:LOG2_PES] != w_vn[(32*x+15)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*30+3*x+:3] = 3'b101; // both vn done
							end else if ((w_vn[(32*x+23)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+24)*LOG2_PES+:LOG2_PES]) && (w_vn[(32*x+23)*LOG2_PES+:LOG2_PES] != w_vn[(32*x+15)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*30+3*x+:3] = 3'b100; // right vn done
							end else if ((w_vn[(32*x+7)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+8)*LOG2_PES+:LOG2_PES]) && (w_vn[(32*x+16)*LOG2_PES+:LOG2_PES] != w_vn[(32*x+8)*LOG2_PES+:LOG2_PES])) begin
								r_reduction_cmd[3*30+3*x+:3] = 3'b011; // left vn done
							end else begin
								r_reduction_cmd[3*30+3*x+:3] = 3'b000; // nothing
							end

						end else begin
							r_reduction_add[30+x] = 1'b0;
							r_reduction_cmd[3*30+3*x+:3] = 3'b000; // nothing
						end

						// generate left select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(32*x+15)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+7)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+16+:2] = 'd0;
							end else if (w_vn[(32*x+15)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+11)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+16+:2] = 'd1;
							end else if (w_vn[(32*x+15)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+13)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+16+:2] = 'd2;
							end else begin
								r_reduction_sel[(x*4)+16+:2] = 'd3;
							end
						end else begin
							r_reduction_sel[(x*4)+16+:4] = 'd0;
						end


						// generate right select logic
						if (r_valid[1] == 1'b1) begin
							if (w_vn[(32*x+16)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+24)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+18+:2] = 'd3;
							end else if (w_vn[(32*x+16)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+20)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+18+:2] = 'd2;
							end else if (w_vn[(32*x+16)*LOG2_PES+:LOG2_PES] == w_vn[(32*x+18)*LOG2_PES+:LOG2_PES]) begin
								r_reduction_sel[(x*4)+18+:2] = 'd1;
							end else begin
								r_reduction_sel[(x*4)+18+:2] = 'd0;
							end
						end else begin
							r_reduction_sel[(x*4)+16+:4] = 'd0;
						end

					end
				end
			end
		end
	endgenerate



	// generate diagonal flops for cmd and sel timing alignment
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_add_lvl_0 <= 'd0;
			r_add_lvl_1 <= 'd0;
			r_add_lvl_2 <= 'd0;
			r_add_lvl_3 <= 'd0;
			r_add_lvl_4 <= 'd0;


			r_cmd_lvl_0 <= 'd0;
			r_cmd_lvl_1 <= 'd0;
			r_cmd_lvl_2 <= 'd0;
			r_cmd_lvl_3 <= 'd0;
			r_cmd_lvl_4 <= 'd0;


			r_sel_lvl_2 <= 'd0;
			r_sel_lvl_3 <= 'd0;
			r_sel_lvl_4 <= 'd0;
		end else begin
			r_add_lvl_0[15:0] <= r_reduction_add[15:0];
			r_add_lvl_1[7:0] <= r_reduction_add[23:16];
			r_add_lvl_1[15:8] <= r_add_lvl_1[7:0];
			r_add_lvl_2[3:0] <= r_reduction_add[27:24];
			r_add_lvl_2[7:4] <= r_add_lvl_2[3:0];
			r_add_lvl_2[11:8] <= r_add_lvl_2[7:4];
			r_add_lvl_3[1:0] <= r_reduction_add[29:28];
			r_add_lvl_3[3:2] <= r_add_lvl_3[1:0];
			r_add_lvl_3[5:4] <= r_add_lvl_3[3:2];
			r_add_lvl_3[7:6] <= r_add_lvl_3[5:4];
			r_add_lvl_4[0:0] <= r_reduction_add[30:30];
			r_add_lvl_4[1:1] <= r_add_lvl_4[0:0];
			r_add_lvl_4[2:2] <= r_add_lvl_4[1:1];
			r_add_lvl_4[3:3] <= r_add_lvl_4[2:2];
			r_add_lvl_4[4:4] <= r_add_lvl_4[3:3];


			r_cmd_lvl_0[47:0] <= r_reduction_cmd[47:0];
			r_cmd_lvl_1[23:0] <= r_reduction_cmd[71:48];
			r_cmd_lvl_1[47:24] <= r_cmd_lvl_1[23:0];
			r_cmd_lvl_2[11:0] <= r_reduction_cmd[83:72];
			r_cmd_lvl_2[23:12] <= r_cmd_lvl_2[11:0];
			r_cmd_lvl_2[35:24] <= r_cmd_lvl_2[23:12];
			r_cmd_lvl_3[5:0] <= r_reduction_cmd[89:84];
			r_cmd_lvl_3[11:6] <= r_cmd_lvl_3[5:0];
			r_cmd_lvl_3[17:12] <= r_cmd_lvl_3[11:6];
			r_cmd_lvl_3[23:18] <= r_cmd_lvl_3[17:12];
			r_cmd_lvl_4[2:0] <= r_reduction_cmd[92:90];
			r_cmd_lvl_4[5:3] <= r_cmd_lvl_4[2:0];
			r_cmd_lvl_4[8:6] <= r_cmd_lvl_4[5:3];
			r_cmd_lvl_4[11:9] <= r_cmd_lvl_4[8:6];
			r_cmd_lvl_4[14:12] <= r_cmd_lvl_4[11:9];


			r_sel_lvl_2[7:0] <= r_reduction_sel[7:0];
			r_sel_lvl_2[15:8] <= r_sel_lvl_2[7:0];
			r_sel_lvl_2[23:16] <= r_sel_lvl_2[15:8];
			r_sel_lvl_3[7:0] <= r_reduction_sel[15:8];
			r_sel_lvl_3[15:8] <= r_sel_lvl_3[7:0];
			r_sel_lvl_3[23:16] <= r_sel_lvl_3[15:8];
			r_sel_lvl_3[31:24] <= r_sel_lvl_3[23:16];
			r_sel_lvl_4[3:0] <= r_reduction_sel[19:16];
			r_sel_lvl_4[7:4] <= r_sel_lvl_4[3:0];
			r_sel_lvl_4[11:8] <= r_sel_lvl_4[7:4];
			r_sel_lvl_4[15:12] <= r_sel_lvl_4[11:8];
			r_sel_lvl_4[19:16] <= r_sel_lvl_4[15:12];
		end
	end


	// Adjust output valid timing and logic
	always @ (posedge clk) begin
		if (i_stationary == 1'b0 && i_data_valid == 1'b1) begin
			r_valid[0] <= 1'b1;
		end else begin
			r_valid[0] <= 1'b0;
		end
	end

	generate
		for (i=0; i < 4; i=i+1) begin
			always @ (posedge clk) begin
				if (rst == 1'b1) begin
					r_valid[i+1] <= 1'b0;
				end else begin
					r_valid[i+1] <= r_valid[i];
				end
			end
		end
	endgenerate

	always @ (*) begin
		if (rst == 1'b1) begin
			o_reduction_valid <= 1'b0;
		end else begin
			o_reduction_valid <= r_valid[3];
		end
	end

	// assigning diagonally flopped cmd and sel
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			o_reduction_add <= 'd0;
			o_reduction_cmd <= 'd0;
			o_reduction_sel <= 'd0;
		end else begin
			o_reduction_add <= {r_add_lvl_4[4:4],r_add_lvl_3[7:6],r_add_lvl_2[11:8],r_add_lvl_1[15:8],r_add_lvl_0[15:0]};
			o_reduction_cmd <= {r_cmd_lvl_4[14:12],r_cmd_lvl_3[23:18],r_cmd_lvl_2[35:24],r_cmd_lvl_1[47:24],r_cmd_lvl_0[47:0]};
			o_reduction_sel <= {r_sel_lvl_4[19:16],r_sel_lvl_3[31:24],r_sel_lvl_2[23:16]};
		end
	end

endmodule
