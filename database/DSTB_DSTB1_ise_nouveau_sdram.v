// This program was cloned from: https://github.com/dh219/DSTB
// License: GNU General Public License v2.0

`timescale 1ns / 1ps

/* DAVID'S ST BOOSTER v 1 (DSTB1) 				*/
/* Copyright 2022 D Henderson 						*/
/* Released under the terms of the GPLv2 	*/

module nouveau_sdram(
	input CLK,
	input CLK8,
	input RST_ASYNC,
	input AS_ASYNC,
	input UDS_ASYNC,
	input LDS_ASYNC,
	input RW_ASYNC,
	input [23:1] A,

	output [12:0] MA,
	output [1:0] BA,
	output [1:0] DQM,
	output RAS,
	output CAS,
	output RAMWE,

	output VALID,
	output WTERM
);

localparam [2:0] CMD_LOADMODE  = 3'b000;
localparam [2:0] CMD_REFRESH   = 3'b001;
localparam [2:0] CMD_PRECHARGE = 3'b010;
localparam [2:0] CMD_ACTIVE    = 3'b011;
localparam [2:0] CMD_WRITE     = 3'b100;
localparam [2:0] CMD_READ      = 3'b101;
localparam [2:0] CMD_NOP       = 3'b111;

parameter MODE = 13'b0000000100000;

reg [13:0] COUNTER;
reg READY;
reg [2:0] SETUP_CMD;
reg [2:0] CMD;
reg REFRESH;
reg [12:0] SETUP_MA;
reg [12:0] MAIN_MA;


reg RST = 1'b1;
reg AS = 1'b1;
reg UDS = 1'b1;
reg LDS = 1'b1;
reg RW = 1'b1;

// startup timing
// using 66MHZ clock
// 100us before PRECHARGE (6600 cycles)
wire PRECHARGE = 		COUNTER[13:3] == 11'd1024; // x1 precharge command
wire AUTO_REFRESH = 	COUNTER[13:3] == 11'd1030 || COUNTER == 11'd1036;
wire LOAD_MODE = 		COUNTER[13:3] == 11'd1042;

localparam [3:0] STATE_IDLE = 'd0;
localparam [3:0] STATE_READ = 'd1;
localparam [3:0] STATE_WRITE = 'd2;
localparam [3:0] STATE_CLOSE	= 'd3;
localparam [3:0] STATE_ACCESS_WAIT = 'd4;
localparam [3:0] STATE_REFRESH = 'd5;
localparam [3:0] STATE_REFRESH_NOP1 = 'd6;
localparam [3:0] STATE_REFRESH_NOP2 = 'd7;
localparam [3:0] STATE_REFRESH_NOP3 = 'd8;
localparam [3:0] STATE_REFRESH_NOP4 = 'd9;
localparam [3:0] STATE_REFRESH_NOP5 = 'd10;
localparam [3:0] STATE_REFRESH_NOP6 = 'd11;
localparam [3:0] STATE_REFRESH_NOP7 = 'd12;
localparam [3:0] STATE_REFRESH_NOP8 = 'd13;

localparam [3:0] STATE_READ_HOLD = 'd14;
localparam [3:0] STATE_WRITE_HOLD = 'd15;


reg [3:0] state=0;
reg [1:0] refresh_wait = 2'b00;
reg [1:0] BA_IN;
reg [1:0] DQM_IN;

FDCP refresh_ff( .D( 1'b0 ), .C( ~REFRESH ), .CLR(1'b0), .PRE( CMD == CMD_REFRESH ), .Q( refresh_req ) );

// indicate refresh needed and do initialisation
always @(negedge CLK or negedge RST)  begin

	if (RST == 1'b0) begin 
		COUNTER 	<= 'd0;
		READY		<= 'b1;
		REFRESH		<= 'b1;
		SETUP_CMD 		<= CMD_NOP; 
	end else begin 
		COUNTER <= COUNTER + 'd1;
		REFRESH <= (COUNTER[8:0] != 9'h0) | READY;
		SETUP_CMD 	<= CMD_NOP; 
	
		if (READY == 1'b1) begin
			if(PRECHARGE == 1'b1) begin
				$display("precharging all banks");
				SETUP_CMD			<= CMD_PRECHARGE;
				SETUP_MA[10] 	<= 1'b1;      // precharge all banks
			end
			if(AUTO_REFRESH == 1'b1) begin
				$display("issuing auto refresh command");
				SETUP_CMD			<= CMD_REFRESH;
			end
			if(LOAD_MODE == 1'b1) begin
				$display("loading mode register: %b", MODE);
				SETUP_CMD 		<= CMD_LOADMODE;
				SETUP_MA 		<= MODE;
			end
			// latch when the refresh period is complete
			// min 2 clock cycles after MODE
			READY <= COUNTER[13:3] != 11'd1048;
		end 
	end	
end

always @(negedge CLK)  begin
	RST <= RST_ASYNC;
	AS <= AS_ASYNC;
	UDS <= UDS_ASYNC;
	LDS <= LDS_ASYNC;
	RW <= RW_ASYNC;


	if( READY ) begin
		CMD <= SETUP_CMD;
		MAIN_MA <= SETUP_MA;
		BA_IN <= 2'b00;
		DQM_IN <= 2'b11;
	end
	else begin
		case(state)
			STATE_IDLE: begin
				if( ~refresh_req ) begin
					CMD <= CMD_NOP;
					state <= STATE_REFRESH_NOP1;
				end
				else if( ~AS ) begin  // is there a read or write request?
					CMD <= CMD_ACTIVE;  // if so activate
					state <= RW ? STATE_READ : STATE_WRITE_HOLD;
				end
				else begin
					CMD <= CMD_NOP;  // otherwise stay idle
					state <= STATE_IDLE;
				end
				MAIN_MA <= { 1'b0, A[22:11] };
			end
			STATE_READ: begin
				CMD <= CMD_READ;
				MAIN_MA <= { 2'b00, (UDS&LDS), 2'b00, A[10:3] }; // no auto-precharge
				state <= (UDS&LDS) ? STATE_IDLE : STATE_READ;
			end
			STATE_WRITE_HOLD: begin
				CMD <= CMD_NOP;
				if( ~(UDS&LDS) )
					state <= STATE_WRITE;
			end
			STATE_WRITE: begin
				CMD <= CMD_WRITE;
				MAIN_MA <= { 3'b001, 2'b00, A[10:3] }; // auto-precharge
				state <= STATE_ACCESS_WAIT;
			end
			STATE_ACCESS_WAIT: begin
				CMD <= CMD_NOP;
				state <= (UDS&LDS) ? STATE_IDLE : STATE_ACCESS_WAIT;
			end
			STATE_REFRESH_NOP1: begin
				CMD <= CMD_NOP;
				state <= STATE_REFRESH;
			end
			STATE_REFRESH: begin
				CMD <= CMD_REFRESH;
				MAIN_MA[10] 	<= 1'b1;      // precharge all banks
				refresh_wait <= 2'b11;
				state <= STATE_REFRESH_NOP2;
			end
			STATE_REFRESH_NOP2: begin
				CMD <= CMD_NOP;
				refresh_wait <= refresh_wait - 'd1;
				state <= refresh_wait ? STATE_REFRESH_NOP2 : STATE_IDLE;
			end
			default: begin
				CMD <= CMD_NOP;
				state <= STATE_IDLE;
			end		
		endcase

		DQM_IN <= { UDS, LDS };
		BA_IN <= A[2:1];
	end
end

localparam trl = 4;  // total read latency is the SDRAM CAS-latency (two) plus the SDRAM controller induced latency (two)
reg [trl-1:0] RdDataValidPipe;  
always @(negedge CLK) begin
	if( UDS&LDS )
		RdDataValidPipe <= 'd0;
	else
		RdDataValidPipe <= {RdDataValidPipe[trl-2:0], state == STATE_READ };
end
	
assign RdDataValid = RdDataValidPipe[trl-1];

assign DQM = DQM_IN;
assign BA = BA_IN;
assign MA = MAIN_MA;
assign RAS = CMD[2];
assign CAS = CMD[1];
assign RAMWE = CMD[0];


/* fix these next */

wire valid;
FDCP valid_latch( .D(1'b0), .C( 1'b0), .CLR( RdDataValid ), .PRE( AS ), .Q( valid ) );
assign VALID = READY | valid;

wire wterm;
FDCP wterm_latch( .D(1'b0), .C( 1'b0), .CLR(CMD == CMD_ACTIVE), .PRE( AS ), .Q( wterm ) );
assign WTERM = READY | wterm;

endmodule
