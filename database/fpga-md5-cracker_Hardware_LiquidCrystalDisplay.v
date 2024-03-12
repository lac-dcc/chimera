`define NibbleToBits(__nibble, __bit0, __bit1, __bit2, __bit3)	\
assign __bit0 = __nibble[0];									\
assign __bit1 = __nibble[1];									\
assign __bit2 = __nibble[2];									\
assign __bit3 = __nibble[3];									\

module LiquidCrystalDisplay(
	input clk,
	input wire [7:0] char,
	input wire writeChar,
	input wire home,
	output wire db4,
	output wire db5,
	output wire db6,
	output wire db7,
	output reg rs,
	output reg enable,
	output reg [7:0] testLeds = 0,
	output reg ready = 0);
	
	reg [3:0] nibble;
	`NibbleToBits(nibble, db4, db5, db6, db7)
	
	reg [7:0] state = 0;
	reg [7:0] commandState = 0;
	
	`define CreateDelay(__mhz, __ms, __name, __active, __done)	\
	reg __active = 0;											\
	wire __done;												\
	Delay #(.mhz(__mhz), .ms(__ms)) __name(						\
		.clk(clk),												\
		.active(__active),										\
		.done(__done));											\
		
	`CreateDelay(50, 130, powerDelay, powerDelayActive, powerDelayDone)	
	`CreateDelay(50, 10, wakeupDelay, wakeupDelayActive, wakeupDelayDone)
	`CreateDelay(50, 1, pulseDelay, pulseDelayActive, pulseDelayDone)
	
	`define START_STATE							00 
	`define COMMAND_STATE					02
	`define SEND_PULSE_STATE			03
	
	`define WAKEUP_STATE						00
	`define WAKEUP_SLEEP_STATE		01
	
	`define SET_4BIT_STATE						06
	
	`define SET_4BIT_2LINE_STATE1		07
	`define SET_4BIT_2LINE_STATE2		08
	
	`define SET_CURSOR_STATE1			09
	`define SET_CURSOR_STATE2			10
	
	`define DISPLAY_ON_STATE1			11
	`define DISPLAY_ON_STATE2			12
	
	`define ENTRY_MODE_STATE1			13
	`define ENTRY_MODE_STATE2			14
	
	`define HOME_STATE1							30
	`define HOME_STATE2							31
	
	`define READY_STATE							15
	
	`define SEND_CHARS_STATE1			20
	`define SEND_CHARS_STATE2			21
	
	`define SEND_PULSE state <= `SEND_PULSE_STATE
	
	reg [2:0] wakeupCount = 0;
	
	`define SendNibble(__state, __nibble, __nextState)	\
	__state:											\
		begin											\
			nibble <= __nibble;							\
			commandState <= __nextState;				\
			`SEND_PULSE;								\
		end												\
		
	always @(posedge clk)
		begin
			case (state)
				`START_STATE:
					begin
						ready <= 0;
						testLeds <= 'b0000001;
						powerDelayActive <= 1;
						if (powerDelayDone)
							begin
								state <= `COMMAND_STATE;
								powerDelayActive <= 0;
								rs <= 0;
								enable <= 0;
								testLeds <= 'b0000011;
							end
					end
				
				1:
					begin
						testLeds <= 'b00000111;
						state <= 2;
					end
				
				
				`COMMAND_STATE:
					begin
						
						case (commandState)
							`SendNibble(`WAKEUP_STATE, 'h3, `WAKEUP_SLEEP_STATE)
								
							`WAKEUP_SLEEP_STATE:
								begin
									commandState <= `WAKEUP_SLEEP_STATE;
									
									wakeupDelayActive <= 1;
									if (wakeupDelayDone)
										begin
											commandState <= wakeupCount != 2 ? `WAKEUP_STATE : `SET_4BIT_STATE;
											wakeupDelayActive <= 0;
											wakeupCount <= wakeupCount + 1;
										end
								end
								
							`SendNibble(`SET_4BIT_STATE, 'h2, `SET_4BIT_2LINE_STATE1)
							
							`SendNibble(`SET_4BIT_2LINE_STATE1, 'h2, `SET_4BIT_2LINE_STATE2)
							`SendNibble(`SET_4BIT_2LINE_STATE2, 'h8, `SET_CURSOR_STATE1)
							
							`SendNibble(`SET_CURSOR_STATE1, 'h1, `SET_CURSOR_STATE2)
							`SendNibble(`SET_CURSOR_STATE2, 'h0, `DISPLAY_ON_STATE1)
							
							`SendNibble(`DISPLAY_ON_STATE1, 'h0, `DISPLAY_ON_STATE2)
							`SendNibble(`DISPLAY_ON_STATE2, 'hc, `ENTRY_MODE_STATE1)
							
							`SendNibble(`ENTRY_MODE_STATE1, 'h0, `ENTRY_MODE_STATE2)
							`SendNibble(`ENTRY_MODE_STATE2, 'h6, `READY_STATE)
							
							`SendNibble(`HOME_STATE1, 'h0, `HOME_STATE2)
							`SendNibble(`HOME_STATE2, 'h2, `READY_STATE)
							
							`READY_STATE:
								begin
									rs <= 1;
									if (writeChar)
										begin
											ready <= 0;
											testLeds <= 'b11000000;
											commandState <= `SEND_CHARS_STATE1;
										end
									else if (home)
										begin
											rs <= 0;
											ready <= 0;
											testLeds <= 'b11100000;
											commandState <= `HOME_STATE1;
										end
									else
										begin
											ready <= 1;
											testLeds <= 'b11110000;
										end
								end
							
							`SEND_CHARS_STATE1:
								begin
									ready <= 0;
									rs <= 1;
									nibble <= char[7:4];
									commandState <= `SEND_CHARS_STATE2;
									`SEND_PULSE;
								end
								
							`SEND_CHARS_STATE2:
								begin
									nibble <= char[3:0];
									commandState <= `READY_STATE;
									testLeds <= 'b10101010;
									`SEND_PULSE;
								end
								
							200:
								testLeds <= 'b10101010;
						endcase
					end
				
				`SEND_PULSE_STATE:
					begin
						enable <= 1;
						testLeds <= 'b00011111;
						
						pulseDelayActive <= 1;
						if (pulseDelayDone)
							begin
								enable <= 0;
								state <= `COMMAND_STATE;
								pulseDelayActive <= 0;
							end
					end
			endcase
		end
	
endmodule
