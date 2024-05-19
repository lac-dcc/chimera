// This program was cloned from: https://github.com/DinoMax00/TJ-FPGA_MP3
// License: MIT License

//----------------- oled show module ----------------------
//------------------ author : Dino ------------------------
module oled(
	input CLK, 
	input RST,
	input [2: 0] current,
	output reg DIN, // input pin 
	output reg OLED_CLK, 
	output reg CS, // chip select
	output reg DC, // Data & CMD 
	output reg RES
);
	parameter DELAY_TIME = 25000;
	
	// DC parameter
	parameter CMD = 1'b0;
	parameter DATA = 1'b1;
	
	// init cmds
	reg [47:0] cmds [9:0];
	initial
		begin
			cmds[0]= {8'hAE, 8'hA0, 8'h76, 8'hA1, 8'h00, 8'hA2}; 
			cmds[1]= {8'h00, 8'hA4, 8'hA8, 8'h3F, 8'hAD, 8'h8E};  
			cmds[2]= {8'hB0, 8'h0B, 8'hB1, 8'h31, 8'hB3, 8'hF0};  
			cmds[3]= {8'h8A, 8'h64, 8'h8B, 8'h78, 8'h8C, 8'h64}; 
			cmds[4]= {8'hBB, 8'h3A, 8'hBE, 8'h3E, 8'h87, 8'h06};  
			cmds[5]= {8'h81, 8'h91, 8'h82, 8'h50, 8'h83, 8'h7D}; 
			cmds[6]= {8'h15, 8'h00, 8'h5F, 8'h75, 8'h00, 8'h3F};      
			cmds[7]= {8'hAF, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}; 
		end
 
	// base map 
	wire [1535:0] map;
	reg [5: 0] addr;
	blk_mem_gen_1 your_instance_name(.clka(CLK),.ena(1),.addra({current, addr}),.douta(map));
	
	// states
	parameter WRITE = 0;
	parameter PRE_WRITE = 1;
	parameter DELY = 3;
	parameter CMD_PRE = 4;
	parameter DATA_PRE = 5;
	
	// 2M clk 
	wire clk_div;
	Divider #(.Time(20)) CLKDIV(CLK, clk_div);
	
	// vars 
	reg [1535:0] temp;
	reg [15: 0] cmd_cnt;
	reg [7: 0] data_reg;
	reg [3: 0] state;
	reg [3: 0] state_pre;
	integer cnt = 0;
	integer write_cnt = 0;
	
	// state machine
	always @ (posedge clk_div) begin 
		if(!RST) begin 
			state <= CMD_PRE;
			cmd_cnt <= 0;
			CS <= 1'b1;
			RES <= 0;
		end
		else begin 
			RES <= 1;
			case(state)
				// prepare for cmd write, put cmds rows into temp 
				CMD_PRE: begin 
						if(cmd_cnt == 8) begin 
							cmd_cnt <= 0;
							addr <= 0;
							state <= DATA_PRE;
						end
						else begin 
							temp <= cmds[cmd_cnt];
							state <= PRE_WRITE;
							state_pre <= CMD_PRE;
							write_cnt <= 6;
							DC <= CMD;
						end
					end
				// prepare for data write 
				DATA_PRE: begin 
						if(cmd_cnt == 64) begin 
							cmd_cnt <= 0;
							state <= DATA_PRE;
						end
						else begin 
							temp <= map;
							state <= PRE_WRITE;
							state_pre <= DATA_PRE;
							write_cnt <= 192;
							DC <= DATA;
						end
					end
				// cut temp into several 8bits regs
				PRE_WRITE: begin 
						if(write_cnt == 0) begin 
							cmd_cnt <= cmd_cnt+1;
							addr <= addr+1;
							state <= state_pre;
						end
						else begin 
							data_reg[7: 0] <= (state_pre==CMD_PRE)? temp[47: 40]: temp[1535: 1528];
							temp <= (state_pre==CMD_PRE)? {temp[39: 0], temp[47: 40]}: {temp[1527: 0], temp[1535: 1528]};
							state <= WRITE;
							OLED_CLK <= 0;
							cnt <= 0;
						end
					end
				// shift 8bits into DIN port
				WRITE: begin 
						if(OLED_CLK) begin 
							if(cnt == 8) begin 
								CS <= 1;
								write_cnt <= write_cnt-1;
								state <= PRE_WRITE;
							end
							else begin 
								CS <= 0;
								DIN <= data_reg[7];
								cnt <= cnt+1;
								data_reg<={data_reg[6:0], data_reg[7]}; 
							end
						end
						OLED_CLK <= ~OLED_CLK;
					end
				default:;
			endcase
		end
	end 
endmodule
















