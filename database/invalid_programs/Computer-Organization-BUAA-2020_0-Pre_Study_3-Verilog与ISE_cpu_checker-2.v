`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:24:07 10/01/2020 
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
`define S0 		0
`define S_time	1		// collet char to create time
`define S_pc	2
`define S_type	3
`define S_grf	4
`define S_addr	5
`define S_sp	6		// space 			got " ", waiting for " < "
`define S_ab	7		// angle bracket, got "<", waiting for " = "
`define S_eq	8
`define S_data	9
`define S_hash	10
`define S_done	11

module cpu_checker(
    input clk,
    input reset,
    input [7:0] char,
    input [15:0] freq,
    output [1:0] format_type,
    output [3:0] error_code
    );

reg [5:0]	state;
reg [5:0]	cnt;			// how many digits??
reg [3:0] 	err;
reg [0:0]	type;		// grf or addr
reg [15:0]	t;			// time
reg [31:0]	pc;
reg [6:0]	grf;
reg [31:0]	addr;
reg [31:0]	data;
reg [15:0]	half;
initial begin
	state = 0;
	cnt = 0;
	err = 0;
	t = 0;
	type = 0;
	pc = 0;
	grf = 0;
	addr = 0;
	data = 0;
end


always @(posedge clk) begin
	if(reset == 1) begin
		state = 0;
		cnt = 0;
		err = 0;
		t = 0;
		type = 0;
		pc = 0;
		grf = 0;
		addr = 0;
		data = 0;
	end
	else begin
		case(state)
		`S0: begin
				if(char == "^")
					state <= `S_time;
				else
					state <= 0;
		end
		`S_time: begin
				if(char <= "9" && char >= "0") begin		// 输入十进制数
					cnt <= cnt +1;
					t <= (t << 3)+ (t << 1) + (char - "0");
					if(cnt >= 4) begin		// 特判位数的"格式"
						state <= 0;
						cnt <= 0;
						t <= 0;
					end
				end
				else if(char == "@" && cnt > 0) begin		// 
					state <= `S_pc;
					cnt <= 0;
					if((t & ((freq >> 1) - 1)) != 0)	// 合法性检查
						err[0] <= 1; 
				end
				else begin		// 乱输入 
					state <= 0;
					cnt <=0;
					err <= 0;
					t <= 0;
				end
		end
		`S_pc: begin
					if((char>="0" && char <="9") || (char >= "a" && char <= "f")) begin	// 输入16进制数
						cnt <= cnt +1;
						if((char>="0") && (char <="9"))
							pc <= (pc<<4)+ char-"0";
						else
							pc <= (pc << 4) + char - "a" +10;
						if(cnt >= 8) begin
							state <= 0;
							cnt <= 0;
							pc <= 0;
							err <= 0;
						end
					end
					else if(char == ":" && cnt == 8) begin // 状态转移
						state <= `S_type;
						cnt <= 0;
						if(((pc & 3 )!= 0) || pc < 32'h00003000 || pc > 32'h00004fff)	//pc 不合法
							err[1] <= 1;
						pc <= 0;
					end
					else begin	//乱输入，都归0
						state <= 0;
						cnt <= 0;
						err <= 0;
						pc <= 0;
					end
		end
		`S_type: begin
						if(char == " ")//输入空格，状态不变
							state <= state;
						else if(char == "$") begin	// grf "$"
							state <= `S_grf;
							type <=0;
						end
						else if(char == 8'd42) begin	// addr "star"
							state <= `S_addr;
							type <= 1;
						end
						else begin					// 乱输入
							state <= 0;
							err <=0;
						end
		end
		`S_grf: begin	// 十进制数 $reg 十进制数至少有1位，且不允许超过4位。
						if(char >= "0" && char <="9") begin
							grf <= (grf << 3) + (grf << 1) + char - "0";
							cnt <= cnt +1;
							if(cnt >= 4) begin	// grf 格式错误，全部归零
								state <= 0;
								grf <= 0;
								cnt <= 0;
								err <= 0;
							end
						end
						else if(((char == " ") || (char == "<")) && (cnt > 0)) begin	//开始清算
							if((grf < 0) || (grf > 31))	// grf 不合法
								err <= err + 8;
							cnt <= 0;
							grf <= 0;
							if(char ==" ")
								state <= `S_sp;
							else
								state <= `S_ab;
						end
						else begin	// 乱输入
							state <= 0;
							cnt <= 0;
							grf <= 0;
							err <= 0;
						end
		end
		`S_addr: begin
						if((char>="0" && char <="9") || (char >= "a" && char <= "f")) begin	//输入十六进制数
							cnt <= cnt + 1;
							if((char>="0") && (char <="9"))
								addr <= (addr << 4) + char - "0";
							else
								addr <= (addr << 4) + char - "a"+ 10;
							if(cnt >= 8) begin // addr格式检查
								cnt <= 0;
								state <= 0;
								err <= 0;
								addr <= 0;
							end
						end
						else if(((char == " ") || (char == "<")) && cnt >0) begin
							if(!(((addr & 3) == 0) && (addr >= 0 && addr<= 32'h00002fff)))
								err <=err + 4;  
							cnt <=0;
							addr <= 0;
							if(char == " ")
								state <= `S_sp;
							else
								state <= `S_ab;
						end
						else begin	// 乱输入
							state <= 0;
							cnt <= 0;
							addr <= 0;
							err <= 0;
						end
		end
		`S_sp: begin
					if(char == " ")
						state <= `S_sp;
					else if(char == "<")
						state <= `S_ab;
					else
						state <= 0;
		end
		`S_ab: begin
					if(char == "=")
						state <= `S_eq;
					else
						state <= 0;
		end
		`S_eq: begin	// got " <= ", waiting for a num to activate data
					if(char == " ")
						state <= `S_eq;
					else if((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) begin	// 得到一个16进制数
						cnt <= 1;
						state <= `S_data;
					end
					else begin// 乱输入
						state <= 0;
						err <= 0;
					end
		end
		`S_data : begin
						if(((char >= "0") && (char <= "9")) || ((char >= "a") && (char <= "f"))) begin	//输入16进制数
							cnt <= cnt +1;
							if(cnt >= 8) begin	// data 格式检查
								state <= 0;
								data <= 0;
								cnt <= 0;
								err <= 0;
							end
						end
						else if(char == "#" && cnt == 8) begin	//输入 #
							state <= `S_done;
							data <= 0;
							cnt <= 0;
						end
						else begin	//乱输入
							state <= 0;
							data <= 0;
							cnt <= 0;
							err <= 0;
						end
		end
		`S_done: begin
						if(char == "^") begin
							state <= `S_time;
							cnt <= 0;
							err <= 0;
							t <= 0;
							type <= 0;
							pc <= 0;
							grf <= 0;
							addr <= 0;
							data <= 0;
						end
						else begin
							state <= 0;
							cnt <= 0;
							err <= 0;
							t <= 0;
							type <= 0;
							pc <= 0;
							grf <= 0;
							addr <= 0;
							data <= 0;
						end
		end
		default:
			state <= 0;
		endcase
	end
end
assign format_type = 	(state != `S_done)? 		2'b00:
								(type == 0)?				2'b01:
								(type == 1)?				2'b10:
																2'b00;
assign error_code = (state != `S_done)?	0: err;
endmodule
// assign