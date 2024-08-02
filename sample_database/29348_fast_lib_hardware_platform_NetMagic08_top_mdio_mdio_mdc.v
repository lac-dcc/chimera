// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//=========================================================================
//written by zq/lxj
//外部MDIO接口所属器件型号：VSC8224
`timescale 1 ps / 1 ps
module mdio_mdc(
 input reset,
 input clk,
//-----------------------------------mdio 接口---------------------------------
 output  mdc,//输出给外部芯片的时钟
 inout  mdio,
 //--------------用户给出的操作指令组---------------------
 input req_enb,//使能信号，类似于片选信号
 input [1:0] req_op,   //本次请求的操作模式 2'b10为读，2'b01有效为写
 input [4:0] phy_addr,//phy芯片选择
 input [4:0] reg_addr,//phy芯片中的寄存器选择
 input [15:0] data_phy,
 //--------------给用户的当前忙闲信号---------------------
 output work_flag,//1:正在工作状态   0：处于闲置状态
//-----------------------------------
 output reg [15:0] data_sta,
 output sta_enb
);


wire turn_z_flag;//器件时序图中标注的在读请求操作中，当处于Turn around状态下应该为高阻态
assign turn_z_flag = ((state==TA_STATE)&&(op_flag == 1'b0));

wire z_flag;//mdio的控制信号，该信号有效时，mdio输出高阻态（即不驱动）,可参考器件手册中的时序图
//根据时序图，总共有3种情况下应该给外部器件MDIO接口输出高阻z
//1.在IDLE状态时一直处于高阻态
//2.在器件时序图中标注的在读请求操作中，当处于Turn around状态下的发送第一个bit应该为高阻态
//3.当处于读请求操作时（这个时候MDIO应该是外部器件的输出通道，因此本逻辑应该将其置为高阻，以防冲突）
assign z_flag = ( (!work_flag)   ||   turn_z_flag   ||   rd_data_flag  ) ? 1'b1 : 1'b0;
//---------------MDIO信号处理部分---------------------------
assign mdc = clk;
assign mdio = (z_flag) ? 1'bz : mdio_out;  
wire mdio_in; 
assign mdio_in = mdio;

//==========================================
reg [2:0]  state;
reg [4:0]  count_bit;

parameter 	IDLE_STATE=3'd0,
			PRE_STATE=3'd1,
			ST_STATE=3'd2,
			OP_STATE=3'd3,
			PHYAD_STATE=3'd4,
			REGAD_STATE=3'd5,
			TA_STATE=3'd6,
			DATA_STATE=3'd7;			

//------------------状态机跳转部分----------------------
wire state_jump_flag;//状态机跳转条件，由于条件仅两条，因此放在外面写

wire req_coming_flag;//IDLE状态时，在req_enb信号有效时跳转
wire count_over_flag;//其他状态时在计步器count_bit为0时跳转

assign req_coming_flag = (state == IDLE_STATE) && (req_enb == 1);
assign count_over_flag = (state != IDLE_STATE) && (count_bit==0);
assign state_jump_flag = req_coming_flag || count_over_flag;

always @(posedge clk or negedge reset) begin
	if(!reset) begin
		count_bit<=0;
		state<=IDLE_STATE;
	end
	else begin	
		if(count_bit!= 5'd0) begin//必须放在下个if语句之前，以防count_bit <= count_bit；语句将下个count_bit赋值语句覆盖，从而始终为0
			count_bit <= count_bit-5'd1;
		end
		else begin
			count_bit <= count_bit;
		end
		
		if(state_jump_flag == 1'b1) begin
			case(state)
				IDLE_STATE: begin 
					count_bit<=5'd7;
					state<=PRE_STATE;
				end
				PRE_STATE: begin
					count_bit<=5'd1;
					state<=ST_STATE;
				end
				ST_STATE: begin
					count_bit<=5'd1;
					state<=OP_STATE;
				end
				OP_STATE: begin
					count_bit<=5'd4;
					state<=PHYAD_STATE;
				end
				PHYAD_STATE: begin
					count_bit<=5'd4;
					state<=REGAD_STATE;
				end
				REGAD_STATE: begin
					count_bit<=5'd1;
					state<=TA_STATE;
				end
				TA_STATE: begin
					count_bit<=5'd15;
					state<=DATA_STATE;
				end
				DATA_STATE: begin
					count_bit<=5'd0;
					state<=IDLE_STATE;
				end
				default: begin
					count_bit<=5'd0;
					state<=IDLE_STATE;
				end
			endcase
		end
		else begin
			state <= state;
		end
	end
end

//---------------寄存一拍后模块正式使用的操作指令组--------------------
//preamble| start of frame  | Option|  PHY addr  | REG addr | Turn around |  Data 
// 8bit	  |    2bit			|  2bit |   5bit	 |   5bit   |    2bit     |  16bit 
//preamble 并不是必须的，如果有要求可以删去（文档中有描述）

//------------------将用户输入的操作指令寄存一拍，以便对指令进行解析------------------------	
reg [39:0] shift_reg;
reg op_flag;//寄存op模式，以便后续处理的判断，0：read   1：wr
wire mdio_out;//每次输出shift_reg寄存器在左移中被移出的最高位
assign mdio_out = shift_reg[39];

assign work_flag = (state != IDLE_STATE);

always @(posedge clk or negedge reset) begin
	if(!reset) begin
		op_flag <= 1'b0;
		shift_reg <= 40'b0;
	end
 	else begin
		if(req_coming_flag == 1'b1) begin //用户指令到达,即IDLE状态时，在req_enb信号有效，存储用户发送的指令
			op_flag <= req_op[0];
			shift_reg <= {8'hff,2'b01,req_op,phy_addr,reg_addr,2'b10,data_phy};
		end
		else if(work_flag) begin//处于非IDLE_STATE的工作状态，开始移位工作模式
			op_flag <= op_flag;
			shift_reg <= {shift_reg[38:0],1'b0};
		end
		else begin//处于IDLE_STATE,但是req_enb并没有来
			op_flag <= 1'b0;
			shift_reg <= 40'b0;
		end
	end
 		
end

//--------------------------------------------------------读操作时读出的数据以及数据指示信号----------------------------------------------------
wire rd_data_flag;//正在读数据阶段
reg rd_data_flag_r;

assign rd_data_flag = (state==DATA_STATE) && (op_flag== 1'b0);

always @(posedge clk or negedge reset) begin
	if(!reset) begin
		rd_data_flag_r <= 1'b0;
	end
	else begin
		rd_data_flag_r <= rd_data_flag;
	end
end

assign sta_enb = (~rd_data_flag) & rd_data_flag_r;

always @(posedge clk or negedge reset) begin
	if(!reset) begin
		data_sta<=16'd0;
	end
	else begin
		if(rd_data_flag == 1'b1) begin//正在读数据阶段
			data_sta<={data_sta[14:0],mdio_in};
		end
		else begin
			data_sta<=data_sta;
		end
	end
end

endmodule


		

 
 
 