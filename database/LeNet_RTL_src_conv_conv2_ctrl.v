//==================================================================================================
//  Filename      : conv2_ctrl.v
//  Created On    : 2017-12-29 18:49:46
//  Last Modified : 2018-03-21 15:07:20
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Conv 2nd Layer Control Module.  Generate Read&Write Addr and Related Control 
//					Signals.
//
//==================================================================================================

module conv2_ctrl(/*autoport*/
//output
			w3_raddr,
			f3_raddr,
			f4_waddr,
			f4_wr_en,
			conv2_done,
			conv2_clr,
//input
			clk,
			rst_n,
			conv2_start);
	input  clk;
	input  rst_n;


	//Input Weight and Feature Read Addr
	output  [4:0] w3_raddr;
	output  [7:0] f3_raddr;

	//Output Feature Write Addr and Write Enable
	output  [6:0] f4_waddr;
	output        f4_wr_en;

	//Control Signal
	input         conv2_start;
	output        conv2_clr;
	output        conv2_done;

	localparam	IDLE=3'b001;
	localparam  RUN =3'b010;
	localparam  DONE=3'b100;
	reg[2:0] current_state;
	reg[2:0] next_state;

	reg[2:0] cnt0,cnt1;
	reg[3:0] cnt2,cnt3;
	wire add_cnt0,end_cnt0,add_cnt1,add_cnt2,end_cnt2,end_cnt1,add_cnt3,end_cnt3;

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

	assign IDLE2RUN_start = current_state==IDLE && conv2_start == 1'b1;
	assign RUN2DONE_start = current_state==RUN  && end_cnt3;

//cnt0 kernel column
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt0 <= 0;	
		end
		else if (add_cnt0) begin
			if(end_cnt0)
				cnt0 <= 0;
			else begin
				cnt0 <= cnt0 + 1'b1;
			end
		end
	end

	assign add_cnt0 = current_state==RUN;
	assign end_cnt0 = add_cnt0 && cnt0 == 5-1;	

//cnt1 kernel row
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
	assign end_cnt1 = add_cnt1 && cnt1 == 5-1;

//cnt2:Feature column
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
	assign end_cnt2 = add_cnt2 && cnt2 == 10-1;

//cnt3:Feature row
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
	assign end_cnt3 = add_cnt3 && cnt3 == 10-1;

//---------------------------------------
//-----Address Generate------------------
//---------------------------------------
	//Read Address Gen, total 3 cycles delay
	reg [7:0]  f3_raddr_s1_1,f3_raddr_s1_2,f3_raddr_s2_1,f3_raddr_s2_2,f3_raddr_s3;        
	reg [4:0]  w3_raddr_s1_1,w3_raddr_s1_2,w3_raddr_s2,w3_raddr_s3;
	//f3_raddr = cnt2+cnt3*14+cnt0+cnt1*14;
	//w3_raddr = cnt0+cnt1*5;
	always@(posedge clk)begin
		f3_raddr_s1_1 <= cnt2+cnt0;
		f3_raddr_s1_2 <= cnt3+cnt1;
		f3_raddr_s2_1 <= {f3_raddr_s1_2[3:0],1'b0} + f3_raddr_s1_1;
		f3_raddr_s2_2 <= {f3_raddr_s1_2[3:0],3'b0}+{f3_raddr_s1_2[3:0],2'b0};
		f3_raddr_s3   <= f3_raddr_s2_1 + f3_raddr_s2_2;

		w3_raddr_s1_1 <= cnt0+cnt1;
		w3_raddr_s1_2 <= {cnt1[2:0],2'b0};
		w3_raddr_s2   <= w3_raddr_s1_1+w3_raddr_s1_2;
		w3_raddr_s3   <= w3_raddr_s2; 
	end

	assign f3_raddr = f3_raddr_s3;
	assign w3_raddr = w3_raddr_s3;

	

	//Write Address Gen
	wire[6:0] f4_waddr_temp;
	reg[6:0] f4_waddr_s1_1,f4_waddr_s1_2,f4_waddr_s2,f4_waddr_s3;
	//wr_addr = cnt3 * 10 + cnt2;
	always@(posedge clk)begin
		f4_waddr_s1_1 <= {cnt3[3:0],3'b0}+{cnt3[3:0],1'b0};
		f4_waddr_s1_2 <= cnt2;
		f4_waddr_s2   <= f4_waddr_s1_2 + f4_waddr_s1_1;
		f4_waddr_s3   <= f4_waddr_s2;
  	end
  	assign f4_waddr_temp = f4_waddr_s3;

//--------------------------------------
//----Control Signal Gen----------------
//--------------------------------------
	wire 	  conv2_clr_temp;
	wire      f4_wr_en_temp;
	wire      conv2_done_temp;

	assign f4_wr_en_temp = end_cnt1? 1'b1:1'b0;
	assign conv2_done_temp = current_state==DONE? 1'b1:1'b0;
	assign conv2_clr_temp = cnt0==0 && cnt1==0;

//-----------------------------------------
//--Registers Stage to Meet Correct Timing-
//-----------------------------------------
//10 cycles for f4_waddr_temp,
//13 for f4_wr_en_temp,
//13 for conv2_done_temp,
//7 for conv2_clr_temp
	reg [6:0]   f4_waddr_reg[10:0];
	reg  		f4_wr_en_reg[13:0];
	reg  	    conv2_done_reg[13:0];
	reg  		conv2_clr_reg[6:0];
	always@*begin
		 f4_waddr_reg[0] = f4_waddr_temp;
		 f4_wr_en_reg[0] = f4_wr_en_temp;
		 conv2_clr_reg[0] = conv2_clr_temp;
		 conv2_done_reg[0] = conv2_done_temp;
	end
	generate
		genvar i,j,k;
		for (i = 0; i < 10; i = i + 1)
		begin:reg_gen1
		//addr2data delay 2
		//mult delay 3
		//channel adder delay 3
		//Bias delay 1
		//ReLU  delay 1
			always@(posedge clk)begin
				f4_waddr_reg[i+1] <= f4_waddr_reg[i];
			end
		end
		for (j = 0; j < 13; j = j + 1)
		begin:reg_gen2
		//f1_raddr delay 3
		//addr2data delay 2
		//mult delay 3
		//channel adder delay 3
		//Bias delay 1
		//ReLU  delay 1
			always@(posedge clk)begin
				f4_wr_en_reg[j+1] <= f4_wr_en_reg[j];
				conv2_done_reg[j+1] <= conv2_done_reg[j];
			end
		end
		for (k = 0; k < 6; k = k + 1)
		begin:reg_gen3
		//conv_clr should assert at 2nd cycle of mac, DSP include 1, so here is 3 + 2 + 2 - 1
			always@(posedge clk)begin
				conv2_clr_reg[k+1] <= conv2_clr_reg[k];
			end
		end		
	endgenerate
	
    //(* max_fanout = 50 *)reg conv2_clr_r6;

//output to external
	assign f4_waddr 	= f4_waddr_reg[10];
	assign f4_wr_en  = f4_wr_en_reg[13];
	assign conv2_done   = conv2_done_reg[13];
	assign conv2_clr    = conv2_clr_reg[6];
	
endmodule 

