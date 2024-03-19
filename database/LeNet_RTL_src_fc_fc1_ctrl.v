//==================================================================================================
//  Filename      : fc1_ctrl.v
//  Created On    : 2018-01-06 13:21:03
//  Last Modified : 2018-03-21 15:23:58
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : FC 1st Layer Control Module.
//
//
//==================================================================================================
module fc1_ctrl(/*autoport*/
//output
			f5_raddr,
			f5_sel,
			w5_raddr,
			f6_wr_en,
			fc1_done,
			fc1_clr,
//input
			clk,
			rst_n,
			fc1_start);
	input 		clk;
	input 		rst_n;

	//Input Weight and Feature Read Addr
	output [4:0]f5_raddr;
	output [3:0]f5_sel;
	output [8:0]w5_raddr;
	//Output Feature Write Enable
	output      f6_wr_en;
	//Control Signal
	input 		fc1_start;
	output 		fc1_done;
	output 		fc1_clr;
	localparam	IDLE=3'b001;
	localparam  RUN =3'b010;
	localparam  DONE=3'b100;
	reg[2:0] current_state;
	reg[2:0] next_state;

	reg[4:0] cnt0;
	reg[3:0] cnt1;

	wire add_cnt0,end_cnt0,add_cnt1,end_cnt1;
	wire IDLE2RUN_start,RUN2DONE_start;

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			current_state <= IDLE;
		else
			current_state <= next_state;
	end

	always@(*) begin
		case(current_state)
			IDLE:begin
				if(IDLE2RUN_start)
					next_state = RUN;
				else
					next_state = IDLE;
			end
			RUN:begin
				if(RUN2DONE_start)
					next_state = DONE;
				else begin
					next_state = current_state;
				end
			end
			DONE:begin
				next_state = IDLE;
			end
			default: next_state = IDLE;	
		endcase
	end

	assign IDLE2RUN_start = current_state==IDLE && fc1_start == 1'b1;
	assign RUN2DONE_start = current_state==RUN  && end_cnt1;


	always @(posedge clk or negedge  rst_n) begin
		if (!rst_n) begin
			// reset
			cnt0 <= 0;
		end
		else if (add_cnt0) begin
			if(end_cnt0)begin
				cnt0 <= 0;
			end
			else begin
				cnt0 <= cnt0 + 1'b1;
			end
		end
	end

	assign add_cnt0 = current_state==RUN;
	assign end_cnt0 = add_cnt0 && cnt0 == 25-1;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt1 <= 0;
		end
		else if (add_cnt1) begin
			if(end_cnt1)begin
				cnt1 <= 0;
			end
			else begin
				cnt1 <= cnt1 + 1'b1;
			end
		end
	end

	assign add_cnt1 = end_cnt0;
	assign end_cnt1 = add_cnt1 && cnt1 == 16-1;


//Address Generate
	reg	[4:0]  f5_raddr_s1;
	reg	[3:0]  f5_sel_s1;
	reg	[8:0]  w5_raddr_s1_1,w5_raddr_s1_2,w5_raddr_s2;
	//assign f5_raddr = cnt0;
	//assign f5_sel   = cnt1;
	//assign w5_raddr = cnt0 + cnt1*25;
	always@(posedge clk)begin
		f5_raddr_s1 <= cnt0;
		f5_sel_s1   <= cnt1;

		w5_raddr_s1_1	<= cnt0 + cnt1;
		w5_raddr_s1_2   <= {cnt1[3:0],4'b0}+{cnt1[3:0],3'b0};
		w5_raddr_s2     <= w5_raddr_s1_1+w5_raddr_s1_2;
	end

	assign f5_raddr = f5_raddr_s1;
	assign w5_raddr = w5_raddr_s2;
	assign f5_sel   = f5_sel_s1;

//Control Signal Generate
	wire f6_wr_en_temp,fc1_clr_temp,fc1_done_temp;
	assign f6_wr_en_temp = end_cnt1;
	assign fc1_clr_temp = cnt0==0 && cnt1 ==0;
	assign fc1_done_temp = current_state==DONE;
	//add delay
	reg 	fc1_clr_temp_r1,fc1_clr_temp_r2,fc1_clr_temp_r3,fc1_clr_temp_r4;
	(* max_fanout = 50 *)reg fc1_clr_temp_r5;
	reg 	f6_wr_en_temp_r1,f6_wr_en_temp_r2,f6_wr_en_temp_r3,
			f6_wr_en_temp_r4,f6_wr_en_temp_r5,f6_wr_en_temp_r6,f6_wr_en_temp_r7,
			f6_wr_en_temp_r8;
	(* max_fanout = 50 *)reg f6_wr_en_temp_r9;
	reg 	fc1_done_temp_r1,fc1_done_temp_r2,fc1_done_temp_r3,
			fc1_done_temp_r4,fc1_done_temp_r5,fc1_done_temp_r6,fc1_done_temp_r7,
			fc1_done_temp_r8,fc1_done_temp_r9;
//2 + 2 addr2data   3 mac    1 bias 1relu 
	always@(posedge clk)begin

    	f6_wr_en_temp_r1 <= f6_wr_en_temp ;
    	f6_wr_en_temp_r2 <= f6_wr_en_temp_r1 ;
    	f6_wr_en_temp_r3 <= f6_wr_en_temp_r2 ;
    	f6_wr_en_temp_r4 <= f6_wr_en_temp_r3 ;
    	f6_wr_en_temp_r5 <= f6_wr_en_temp_r4 ;
    	f6_wr_en_temp_r6 <= f6_wr_en_temp_r5 ;
    	f6_wr_en_temp_r7 <= f6_wr_en_temp_r6 ;
    	f6_wr_en_temp_r8 <= f6_wr_en_temp_r7 ;
    	f6_wr_en_temp_r9 <= f6_wr_en_temp_r8 ;


   		fc1_done_temp_r1 <= fc1_done_temp;
    	fc1_done_temp_r2 <= fc1_done_temp_r1;
    	fc1_done_temp_r3 <= fc1_done_temp_r2;
    	fc1_done_temp_r4 <= fc1_done_temp_r3;
    	fc1_done_temp_r5 <= fc1_done_temp_r4;
    	fc1_done_temp_r6 <= fc1_done_temp_r5;
    	fc1_done_temp_r7 <= fc1_done_temp_r6;
    	fc1_done_temp_r8 <= fc1_done_temp_r7;
    	fc1_done_temp_r9 <= fc1_done_temp_r8;

		//fc_clr should assert at 2nd cycle of mac,DSP include 1, so here is 2 + 2 + 2 -1
    	fc1_clr_temp_r1 <= fc1_clr_temp ;      
    	fc1_clr_temp_r2 <= fc1_clr_temp_r1 ;
    	fc1_clr_temp_r3 <= fc1_clr_temp_r2 ;
    	fc1_clr_temp_r4 <= fc1_clr_temp_r3 ;
    	fc1_clr_temp_r5 <= fc1_clr_temp_r4 ;

	end

	assign f6_wr_en = f6_wr_en_temp_r9;
	assign fc1_clr = fc1_clr_temp_r5;
	assign fc1_done = fc1_done_temp_r9;
endmodule 

