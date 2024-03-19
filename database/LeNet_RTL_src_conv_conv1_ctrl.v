//==================================================================================================
//  Filename      : conv1_ctrl.v
//  Created On    : 2017-12-29 18:49:46
//  Last Modified : 2018-03-21 15:06:53
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Conv 1st Layer Control Module.  Generate Read&Write Addr and Related Control 
//					Signals.
//
//==================================================================================================

module conv1_ctrl(/*autoport*/
//output
			w1_raddr,
			f1_raddr,
			f2_waddr,
			f2_wr_en,
			conv1_done,
			conv1_clr,
//input
			clk,
			rst_n,
			conv1_start);
	input  clk;
	input  rst_n;


	//Input Weight and Feature Read Addr
	output  [4:0] w1_raddr;     
	output  [9:0] f1_raddr;

	//Output Feature Write Addr and Write Enable
	output  [9:0] f2_waddr;
	output        f2_wr_en;
	//Control Signal
	input         conv1_start;
	output        conv1_done;
	output        conv1_clr;

	localparam	IDLE=3'b001;
	localparam  RUN =3'b010;
	localparam  DONE=3'b100;
	reg[2:0] current_state;
	reg[2:0] next_state;

	reg[2:0] cnt0,cnt1;
	reg[4:0] cnt2,cnt3;
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

	assign IDLE2RUN_start = current_state==IDLE && conv1_start == 1'b1;
	assign RUN2DONE_start = current_state==RUN  && end_cnt3;

//cnt0:kernel column
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt0 <= 3'b0;	
		end
		else if (add_cnt0) begin
			if(end_cnt0)
				cnt0 <= 3'b0;
			else begin
				cnt0 <= cnt0 + 1'b1;
			end
		end
	end

	assign add_cnt0 = current_state==RUN;
	assign end_cnt0 = add_cnt0 && cnt0 == 5-1;	

//cnt1:kernel row
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt1 <= 3'b0;	
		end
		else if (add_cnt1) begin
			if(end_cnt1)
				cnt1 <= 3'b0;
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
			cnt2 <= 5'b0;	
		end
		else if (add_cnt2) begin
			if(end_cnt2)
				cnt2 <= 5'b0;
			else begin
				cnt2 <= cnt2 + 1'b1;
			end
		end
	end

	assign add_cnt2 = end_cnt1;
	assign end_cnt2 = add_cnt2 && cnt2 == 28-1;

//cnt3:Feature row
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			// reset
			cnt3 <= 5'b0;	
		end
		else if (add_cnt3) begin
			if(end_cnt3)
				cnt3 <= 5'b0;
			else begin
				cnt3 <= cnt3 + 1'b1;
			end
		end

	end

	assign add_cnt3 = end_cnt2;
	assign end_cnt3 = add_cnt3 && cnt3 == 28-1;

//---------------------------------------
//-----Address Generate------------------
//---------------------------------------
	//Read Address Gen, total 2 cycles delay
	reg [9:0]  f1_raddr_s1_1,f1_raddr_s1_2,f1_raddr_s2;        
	reg [4:0]  w1_raddr_s1_1,w1_raddr_s1_2,w1_raddr_s2;
	//f1_raddr = cnt2+cnt3*32+cnt0+cnt1*32;
	//w1_raddr = cnt0+cnt1*5;
	always@(posedge clk)begin
		f1_raddr_s1_1 <= cnt2+cnt0;
		f1_raddr_s1_2 <= {cnt3[4:0],5'b0}+{cnt1[2:0],5'b0};
		f1_raddr_s2   <= f1_raddr_s1_1 + f1_raddr_s1_2;
		w1_raddr_s1_1 <= cnt0+cnt1;
		w1_raddr_s1_2 <= {cnt1[2:0],2'b0};
		w1_raddr_s2   <= w1_raddr_s1_1+w1_raddr_s1_2; 
	end

	assign f1_raddr = f1_raddr_s2;
	assign w1_raddr = w1_raddr_s2;

	//Write Address Gen
	wire[9:0] f2_waddr_temp;
	reg[9:0] f2_waddr_s1_1,f2_waddr_s1_2,f2_waddr_s2;
	//wr_addr = cnt3 * 28 + cnt2;
	always@(posedge clk)begin
		f2_waddr_s1_1 <= {cnt3[4:0],4'b0}+{cnt3[4:0],3'b0};
		f2_waddr_s1_2 <= {cnt3[4:0],2'b0}+cnt2;
		f2_waddr_s2   <= f2_waddr_s1_2 + f2_waddr_s1_1;
  	end
  	assign f2_waddr_temp = f2_waddr_s2;


//--------------------------------------
//----Control Signal Gen----------------
//--------------------------------------
	wire 	  conv1_clr_temp;
	wire      f2_wr_en_temp;
	wire      conv1_done_temp;

	assign f2_wr_en_temp = end_cnt1? 1'b1:1'b0;
	assign conv1_done_temp = current_state==DONE? 1'b1:1'b0;
	assign conv1_clr_temp = cnt0==0 && cnt1==0;


//-----------------------------------------
//--Registers Stage to Meet Correct Timing-
//-----------------------------------------
//7 cycles for f2_waddr_temp;
//9 for f2_wr_en_temp;
//9 for conv1_done_temp;
//6 for conv1_clr_temp;
	reg [9:0]   f2_waddr_reg[7:0];
	reg  		f2_wr_en_reg[9:0];
	reg  	    conv1_done_reg[9:0];
	reg  		conv1_clr_reg[5:0];

	always@*begin
		 f2_waddr_reg[0] = f2_waddr_temp;
		 f2_wr_en_reg[0] = f2_wr_en_temp;
		 conv1_clr_reg[0] = conv1_clr_temp;
		 conv1_done_reg[0] = conv1_done_temp;
	end
	generate
		genvar i,j,k;
		for (i = 0; i < 7; i = i + 1)
		begin:reg_gen1
		//addr2data delay 2
		//mult delay 3
		//Bias delay 1
		//ReLU  delay 1
			always@(posedge clk)begin
				f2_waddr_reg[i+1] <= f2_waddr_reg[i];
			end
		end
		for (j = 0; j < 9; j = j + 1)
		begin:reg_gen2
		//f1_raddr delay 2
		//addr2data delay 2
		//mult delay 3
		//Bias delay 1
		//ReLU  delay 1
			always@(posedge clk)begin
				f2_wr_en_reg[j+1] <= f2_wr_en_reg[j];
				conv1_done_reg[j+1] <= conv1_done_reg[j];
			end
		end
		for (k = 0; k < 5; k = k + 1)
		begin:reg_gen3
		//conv_clr should assert at 2nd cycle of mac, DSP include 1, so here is 2 + 2 + 2 - 1
			always@(posedge clk)begin
				conv1_clr_reg[k+1] <= conv1_clr_reg[k];
			end
		end		
	endgenerate

//output to external
	assign f2_waddr 	= f2_waddr_reg[7];
	assign f2_wr_en  = f2_wr_en_reg[9];
	assign conv1_done   = conv1_done_reg[9];
	assign conv1_clr    = conv1_clr_reg[5];      

	
endmodule 

