`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:13 09/30/2020 
// Design Name: 
// Module Name:    cpu_checker 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define S0  5'b0000
`define S1  5'b0001
`define S2  5'b0010
`define S3  5'b0011
`define S4  5'b0100
`define S5  5'b0101
`define S6  5'b0110
`define S7  5'b0111
`define S8  5'b1000
`define S9  5'b1001
`define S10 5'b1010
`define S11 5'b1011
`define S12 5'b1100
`define S13 5'b1101
`define S14 5'b1110

module cpu_checker(
    input clk,
    input reset,
    input [7:0] char,
    output [2:0] format_type
    );
reg[5:0] status;
reg[2:0] ct_tm;//1~4个十进制数
reg[3:0] ct_pc;//8 hex
reg[2:0] ct_grf;//1~4个十进制数
reg[3:0] ct_addr;//8 hex
reg[3:0] ct_data;//8 hex
reg which;//寄存器写入 or 数据存储器写入

initial begin
	status = `S0;
	ct_tm = 0;// counter_time
	ct_pc=0;
	ct_grf = 0;
	ct_addr = 0;
	ct_data = 0;
	which = 0;
end

always @(posedge clk) begin
	if(reset == 1) begin
		status <= `S0;
		ct_tm <= 0;
	end		
	else begin
		case(status)

//<字符'^'><十进制数time><字符'@'><8位十六进制数pc>
//<字符':'><0个或若干空格>


//<字符'$'><十进制数grf>
//<字符'*'><8位十六进制数addr>


//<0个或若干空格>
//<字符'<'加'='><0个或若干空格><8位十六进制数data><字符'#'>

		`S0 : begin //match noting
					if(char == "^")
						status <= `S1;
					else
						status <= `S0;
				end	
		`S1 : begin //match "^"
					if ((char >= "0") && (char <= "9")) begin
						status <= `S2;
						ct_tm <= 1;
					end
					else 
						status <= `S0;
				end
		`S2 : begin //match 1~4 decimals
					if(char == "@") begin //输入 @
						if(ct_tm <= 4) begin
							status <= `S3;
							ct_tm <=0;
						end
						else begin
							status <= `S0;
							ct_tm <= 0;
						end
					end
					else if((char >= "0") && (char <= "9")) begin //输入十进制数字
								if(ct_tm <= 3)
									ct_tm <= ct_tm +1;
								else begin
									status <= `S0;
									ct_tm <= 0;
								end
							end
					else begin //乱输入 复位
						status <= `S0;
						ct_tm <=0;
					end
				end
		`S3 : begin //matched @ ,target to 8 hex
					if((((char >= "0")&&(char <= "9")) || ((char >= "a") && (char <= "f"))))//输入16进制数
						if(ct_pc==7) begin
							status <= `S4;
							ct_pc <= 0;
						end
						else if (ct_pc <7)
							ct_pc <= ct_pc + 1;
						else begin
							status <= `S0;
							ct_pc <= 0;
						end
					else begin
						status <= `S0;
						ct_pc <= 0;
					end
				end
		`S4 : begin//
					if(char == ":")
						status <= `S5;
					else
						status <= `S0;
				end
		`S5 : begin//matched : ,target to which
					if(char == " ")
						status <= `S5;
					else if(char == "$") begin
						status <= `S6;
						which <=0;
					end
					else if(char == "*") begin
						status <= `S7;
					end
					else
						status <= `S0;
				end
		`S6 : begin
					if((char >="0") && (char <= "9"))//如果输入数字
						if (ct_grf == 3) begin
							status <= `S8;
							ct_grf <= 0;
							which <= 0;
						end
						else if(ct_grf < 3)
							ct_grf <= ct_grf + 1;
						else begin
							status <= `S0;
							ct_grf <= 0;
						end
					else if (char == " ")//如果输入空格
						if (ct_grf != 0) begin//曾经输入过十进制数
							status <= `S8;
							which <= 0;
							ct_grf <= 0;
						end
						else begin //此前一个数字都未输入
							status <= `S0;
							which <=0;
							ct_tm <= 0;
							ct_pc <= 0;
							ct_grf <= 0;
							ct_addr <= 0;
							ct_data <= 0;
						end
					else if(char == "<")
						if((ct_grf <= 4) && (ct_grf >0)) begin
							status <= `S9;
							ct_grf <=0;
						end
						else begin
							status <= `S0;
							ct_grf <= 0;
						end
					else begin //输入非 数字 和 空格
						status <= `S0;
						ct_grf <= 0;
						which <=0;
						ct_tm <= 0;
						ct_pc <= 0;
						ct_grf <= 0;
						ct_addr <= 0;
						ct_data <= 0;
					end				
				end
		`S7 : begin
					if((((char >= "0")&&(char <= "9")) || ((char >= "a") && (char <= "f")))) begin//输入十六进制数
						if(ct_addr == 7) begin//原来有7个，直接跳转
							status <= `S8;
							which <= 1;
							ct_addr <= 0;
						end
						else if(ct_addr < 7)//原来不足7个
							ct_addr <= ct_addr + 1;
						else begin//超过7个
							status <= `S0;
							ct_addr <= 0;
							which <= 0;
						end
					end
					else begin //乱输入
						status <= `S0;
						ct_addr <= 0;
						which <= 0;
					end
				end
		`S8 : begin //matched 1~4 decimals or matched 8 hexs, target to "<"
					if(char == " ") begin
					end
					else if (char == "<")
						status <= `S9;
					else begin
						status <= `S0;
						which <=0;
					end
				end
		`S9 : begin 
					if(char == "=")
						status <= `S10;
					else begin
						status <= `S0;
						which <=0;
					end
				end
		`S10 : begin // target to 8 hex
					if(char == " ") begin//输入空格，状态保留
					end
					else if((((char >= "0")&&(char <= "9")) || ((char >= "a") && (char <= "f")))) begin//输入16进制数
						status <= `S11;
						ct_data <= 1;
					end
					else begin//乱输入数据
						status <= `S0;
						ct_data <= 0;
						which <=0;
					end
				end
		`S11 : begin // 已经得到了1位data
					if((((char >= "0")&&(char <= "9")) || ((char >= "a") && (char <= "f")))) begin//输入16进制数
						if(ct_data == 7) begin
							status <= `S12;
							ct_data <= 0;
						end
						else if(ct_data < 7) begin
							ct_data <= ct_data +1;
						end
						else begin
							status <= `S0;
							ct_data <= 0;
						end
					end
					else begin
						status <= `S0;
						ct_data <= 0;
						which <=0;
					end
				end
		`S12 : begin //
					if(char == "#")
						status <= `S13;//终于match整个序列
					else begin
						status <= 0;
						which <=0;
					end
				end
		`S13 : begin//matched 整个序列
					if(char == "^")//重新开始
						status <= `S1;
					else 
						status <= `S0;
					which <=0;
				end
				
		default begin
						status <= `S0;
						which <=0;
						ct_tm <= 0;
						ct_pc <= 0;
						ct_grf <= 0;
						ct_addr <= 0;
						ct_data <= 0;
					end	
		endcase
	end
end
assign format_type = (status != `S13)? 2'b00:
							(which == 0)? 	2'b01:
							(which == 1)?	2'b10:
												2'b00;
endmodule
