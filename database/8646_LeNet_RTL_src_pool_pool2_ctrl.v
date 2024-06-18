// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : pool2_ctrl.v
//  Created On    : 2017-12-28 14:23:21
//  Last Modified : 2018-03-21 15:18:49
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
module pool2_ctrl(/*autoport*/
//output
			f4_raddr,
			f5_waddr,
			f5_wr_en,
			pool2_done,
			pool2_clr,
//input
			clk,
			rst_n,
			pool2_start);
	input 	clk;
	input 	rst_n;
	//Input Feature Read Addr
	output 	[6:0] 	f4_raddr;

	//Output Feature Write Addr and Write Enable
	output 	[4:0] 	f5_waddr;
	output 	f5_wr_en;

	//Control Signal
	input 	pool2_start;	
	output  pool2_done;
	output 	pool2_clr;

	localparam		IDLE = 3'b001;
	localparam   	RUN  = 3'b010;
	localparam      DONE = 3'b100;

	reg [2:0]  current_state,next_state;

	wire IDLE2RUN_start,RUN2DONE_start;
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			current_state <= IDLE;
		end
		else begin
			current_state <= next_state;
		end
	end

	always@* begin
		case(current_state)
		IDLE:begin
			if(IDLE2RUN_start)
				next_state = RUN;
			else begin
				next_state = IDLE;
			end
		end
		RUN: begin
			if(RUN2DONE_start)
				next_state = DONE;
			else begin
				next_state = RUN;
			end
		end
		DONE:begin
			next_state = IDLE;
		end
		default : next_state = IDLE;
		endcase
	end

	assign IDLE2RUN_start = current_state==IDLE && pool2_start==1'b1;
	assign RUN2DONE_start = current_state==RUN && end_cnt3;

//-------------------------------------
//-------cnt1:kernel column cnt-----------
//-------------------------------------
	reg cnt0;
	wire add_cnt0,end_cnt0;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt0 <= 0;
		end
		else if (add_cnt0) begin
			if(end_cnt0)
				cnt0 <= 1'b0;
			else begin
				cnt0 <= cnt0 + 1'b1;
			end
		end
	end

	assign add_cnt0 = current_state==RUN;
	assign end_cnt0 = add_cnt0 && cnt0 == 2-1;

//-------------------------------------
//-------cnt1:kernel row cnt-----------
//-------------------------------------
	reg cnt1;
	wire add_cnt1,end_cnt1;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt1 <= 0;
		end
		else if (add_cnt1) begin
			if(end_cnt1)
				cnt1 <= 0;
			else begin
				cnt1 <= cnt1 + 1'b1;
			end
		end
	end

	assign add_cnt1 = end_cnt0;
	assign end_cnt1 = add_cnt1 && cnt1 == 2-1;

//-------------------------------------
//-------cnt2:column address-----------
//-------------------------------------
	reg[2:0] cnt2;
	wire add_cnt2,end_cnt2;

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt2 <= 0;
		end
		else if (add_cnt2) begin
			if(end_cnt2)
				cnt2 <= 0;
			else begin
				cnt2 <= cnt2 + 1'b1;
			end
		end
	end

	assign add_cnt2 = end_cnt1;
	assign end_cnt2 = add_cnt2 && cnt2 == 5-1;




//-------------------------------------
//-------cnt3:row address-----------
//-------------------------------------

	reg[2:0] cnt3;
	wire add_cnt3,end_cnt3;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt3 <= 0;
		end
		else if (add_cnt3) begin
			if(end_cnt3)
				cnt3 <= 0;
			else begin
				cnt3 <= cnt3 + 1'b1;
			end
		end
	end

	assign add_cnt3 = end_cnt2;
	assign end_cnt3 = add_cnt3 && cnt3 == 5-1;


//---------------------------------------
//-----Address Generate------------------
//---------------------------------------
	//Read Address Gen, total 3 cycles delay
	reg [6:0]  f4_raddr_s1_1,f4_raddr_s1_2,f4_raddr_s2_1,f4_raddr_s2_2,f4_raddr_s3;        
	//f4_raddr = cnt2*2 + cnt3*2*10 + cnt0 + cnt1 * 10;
	always@(posedge clk)begin
		f4_raddr_s1_1 <= {cnt2[2:0],1'b0}+cnt0;
		f4_raddr_s1_2 <= {cnt3[2:0],1'b0}+cnt1;
		f4_raddr_s2_1 <=  f4_raddr_s1_1;
		f4_raddr_s2_2 <= {f4_raddr_s1_2[3:0],3'b0}+{f4_raddr_s1_2[3:0],1'b0};
		f4_raddr_s3   <= f4_raddr_s2_1 + f4_raddr_s2_2;

	end

	assign f4_raddr = f4_raddr_s3;



	//Write Address Gen
	wire[4:0] f5_waddr_temp;
	reg[4:0] f5_waddr_s1_1,f5_waddr_s1_2,f5_waddr_s2,f5_waddr_s3;
	//f5_waddr_temp = cnt2 + cnt3*5;
	always@(posedge clk)begin
		f5_waddr_s1_1 <= {cnt3[2:0],2'b0}+cnt3[2:0];
		f5_waddr_s1_2 <=  cnt2;
		f5_waddr_s2   <= f5_waddr_s1_2 + f5_waddr_s1_1;
		f5_waddr_s3   <= f5_waddr_s2;
  	end
  	assign f5_waddr_temp = f5_waddr_s3;

//--------------------------------------
//----Control Signal Gen
//--------------------------------------
	wire 	  pool2_clr_temp;
	wire      f5_wr_en_temp;
	wire      pool2_done_temp;

	assign f5_wr_en_temp = end_cnt1? 1'b1:1'b0;
	assign pool2_done_temp = current_state==DONE? 1'b1:1'b0;
	assign pool2_clr_temp = cnt0==0 && cnt1==0;


//-----------------------------------------
//--Registers Stage to Meet Correct Timing
//-----------------------------------------
//6 cycles delay for f5_wr_en_temp 
//3 for f5_waddr_temp
//6 for pool2_done_temp
//5 for pool2_clr_temp
	reg[7:0] f5_waddr_r1,f5_waddr_r2,f5_waddr_r3;
	reg f5_wr_en_r1,f5_wr_en_r2,f5_wr_en_r3,f5_wr_en_r4,f5_wr_en_r5,f5_wr_en_r6;
	reg pool2_done_r1,pool2_done_r2,pool2_done_r3,pool2_done_r4,pool2_done_r5,pool2_done_r6;
	reg pool2_clr_r1,pool2_clr_r2,pool2_clr_r3,pool2_clr_r4,pool2_clr_r5;
	always@(posedge clk )begin
		f5_wr_en_r1  <=  f5_wr_en_temp;
		f5_wr_en_r2  <=  f5_wr_en_r1;
		f5_wr_en_r3  <=  f5_wr_en_r2;
		f5_wr_en_r4  <=  f5_wr_en_r3;
		f5_wr_en_r5  <=  f5_wr_en_r4;
		f5_wr_en_r6  <=  f5_wr_en_r5;

		f5_waddr_r1  <=  f5_waddr_temp;
		f5_waddr_r2  <=  f5_waddr_r1;
		f5_waddr_r3  <=  f5_waddr_r2;	

	 	pool2_done_r1<=  pool2_done_temp;
	 	pool2_done_r2<=  pool2_done_r1;
	 	pool2_done_r3<=  pool2_done_r2;
	 	pool2_done_r4<=  pool2_done_r3;
	 	pool2_done_r5<=  pool2_done_r4;
	 	pool2_done_r6<=  pool2_done_r5;

	 	pool2_clr_r1 <= pool2_clr_temp;    //pool_clr should assert at arrival cycle of data, so here is 3 + 2  
	 	pool2_clr_r2 <= pool2_clr_r1;
	 	pool2_clr_r3 <= pool2_clr_r2;
	 	pool2_clr_r4 <= pool2_clr_r3;
	 	pool2_clr_r5 <= pool2_clr_r4;

	end


	assign pool2_clr = pool2_clr_r5;
	assign f5_waddr  = f5_waddr_r3;
	assign f5_wr_en  = f5_wr_en_r6;
	assign pool2_done= pool2_done_r6;
endmodule 