//==================================================================================================
//  Filename      : fc2_ctrl.v
//  Created On    : 2018-01-06 14:20:30
//  Last Modified : 2018-03-21 15:26:51
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module fc2_ctrl(/*autoport*/
//output
			f6_raddr,
			w6_raddr,
			f7_wr_en,
			fc2_done,
			fc2_clr,
//input
			clk,
			rst_n,
			fc2_start);
	input clk;
	input rst_n;

	//Input Weight and Feature Read Addr
	output [6:0]f6_raddr;
	output [6:0]w6_raddr;
	//Output Feature Write Enable
	output      f7_wr_en;
	//Control Signal
	input fc2_start;
	output fc2_done;
	output fc2_clr;

	localparam	IDLE=3'b001;
	localparam  RUN =3'b010;
	localparam  DONE=3'b100;
	reg[2:0] current_state;
	reg[2:0] next_state;

	reg[6:0] cnt0;

	wire add_cnt0,end_cnt0;
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

	assign IDLE2RUN_start = current_state==IDLE && fc2_start == 1'b1;
	assign RUN2DONE_start = current_state==RUN  && end_cnt0;

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
	assign end_cnt0 = add_cnt0 && cnt0 == 120-1;

	assign f6_raddr = cnt0;
	assign w6_raddr = cnt0;


	wire f7_wr_en_temp,fc2_clr_temp,fc2_done_temp;
	assign f7_wr_en_temp = end_cnt0;
	assign fc2_clr_temp = cnt0==0 ;
	assign fc2_done_temp = current_state==DONE;
	//add delay
	reg fc2_clr_temp_r1,fc2_clr_temp_r2;
	(* max_fanout = 50 *)reg fc2_clr_temp_r3;
	reg f7_wr_en_temp_r1,f7_wr_en_temp_r2,f7_wr_en_temp_r3,
			f7_wr_en_temp_r4,f7_wr_en_temp_r5,f7_wr_en_temp_r6;
	(* max_fanout = 50 *)reg f7_wr_en_temp_r7;
	reg fc2_done_temp_r1,fc2_done_temp_r2,fc2_done_temp_r3,
			fc2_done_temp_r4,fc2_done_temp_r5,fc2_done_temp_r6,fc2_done_temp_r7;
	//addr2data 2; mac 3;bias 1;relu 1;
	always@(posedge clk)begin

    	f7_wr_en_temp_r1 <= f7_wr_en_temp ;
    	f7_wr_en_temp_r2 <= f7_wr_en_temp_r1 ;
    	f7_wr_en_temp_r3 <= f7_wr_en_temp_r2 ;
    	f7_wr_en_temp_r4 <= f7_wr_en_temp_r3 ;
    	f7_wr_en_temp_r5 <= f7_wr_en_temp_r4 ;
    	f7_wr_en_temp_r6 <= f7_wr_en_temp_r5 ;
    	f7_wr_en_temp_r7 <= f7_wr_en_temp_r6 ;

   		fc2_done_temp_r1 <= fc2_done_temp;
    	fc2_done_temp_r2 <= fc2_done_temp_r1;
    	fc2_done_temp_r3 <= fc2_done_temp_r2;
    	fc2_done_temp_r4 <= fc2_done_temp_r3;
    	fc2_done_temp_r5 <= fc2_done_temp_r4;
    	fc2_done_temp_r6 <= fc2_done_temp_r5;
    	fc2_done_temp_r7 <= fc2_done_temp_r6;
//fc_clr should assert at 2nd cycle of mac,DSP include 1, so here is 2 + 2 -1
    	fc2_clr_temp_r1 <= fc2_clr_temp ;    
    	fc2_clr_temp_r2 <= fc2_clr_temp_r1 ;
    	fc2_clr_temp_r3 <= fc2_clr_temp_r2 ;

	end

	assign f7_wr_en = f7_wr_en_temp_r7;
	assign fc2_clr = fc2_clr_temp_r3;
	assign fc2_done = fc2_done_temp_r7;


endmodule 

