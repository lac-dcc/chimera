// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

/*
MOUSE is connected to keyboard pins k5 through k1
have MSEINT for mouse interrupt and RDMSEL

follow MSEDP for placement.
MSEDP      EQU VAR2+018EH ;(8) 018E-0195
BUTSTAT    EQU VAR2+018FH ;MOUSE BUTTON STATUS

...
MOUSV      EQU VAR2+0FCH ;(2)
...
INTS3:     LD HL,(MOUSV)
           DEC H
           LD A,H
           INC H
           JR NZ,INTS4       ;IF JR NOT TAKEN, A=FF

           IN A,(KEYPORT)
           LD HL,MSEDP
           LD B,8            ;READ MOUSE 9 TIMES TO CANCEL IT

MSDML:     LD A,0FFH
           IN A,(KEYPORT)
           LD (HL),A
           INC HL
           DJNZ MSDML        ;ALWAYS Z HERE
...
           schematic reads
           8x read 4-bit value
           1 xf
           2 buttons
           3 high 4b y
           4 middle 4b y
           5 low 4b y
           6 high 4b x
           7 middle 4b x
           8 low 4b x

           rdmsel - every time it clocks in a different value from above
           
ps2 interface is
					3 bytes:
					yoverflow:1 xoverflow:1 ysignbit:1 xsignbit:1 always1:1 middlebtn:1 rightbtn:1 leftbtn:1
					x movement
					y movement

					values get skewed by 1 when a key is pressed because reading a port causes a read from port
					fffe, which skews the ps2 mouse driver.  when not pressed - last port seems to be fffe.
					
					*/

module ps2_mouse(
	input wire clk,
	inout wire clkps2,
	inout wire dataps2,
	output reg[3:0] mdata,
	input wire rdmsel,
	input wire rstn);
// 	,output wire[3:0] tp);
	
	wire kbint;
	wire[7:0] scancode;
	reg enable_mouse = 1'b0;
	wire ps2busy;

		localparam RESETTIME_CLOCKS = 9'd362;


	ps2_port puerto_del_raton(
		.clk(clk),
		.enable_rcv(~ps2busy),
		.kb_or_mouse(1'b1),
		.ps2clk_ext(clkps2),
		.ps2data_ext(dataps2),
		.kb_interrupt(kbint),
		.scancode(scancode),
		.released(),
		.extended()
	);

	ps2_host_to_kb escritura_a_raton(
		.clk(clk),
		.ps2clk_ext(clkps2),
		.ps2data_ext(dataps2),
		.data(8'hf4),
		.dataload(enable_mouse),
		.ps2busy(ps2busy),
		.ps2error()
	);

	reg[2:0] btn_state = 3'b000;
	reg[8:0] xmove;
	reg[8:0] ymove;
	reg[3:0] smstate = 4'd8;
	
	reg prev_rdmsel = 1'b0;
	wire rx_reset;
	reg prev_rx_reset = 1'b0;
	reg[7:0] prev_scancode = 8'd0;
	
	reg new_msg_a = 1'b0;
	reg new_msg_b = 1'b0;
	wire new_msg = new_msg_a ^ new_msg_b;
	
	reg[9:0] counter = 10'd0;
	
	always @(posedge clk) begin
		prev_rx_reset <= rx_reset;
		if (!prev_rx_reset && rx_reset) begin
			enable_mouse <= 1'b1;
		end else if (ps2busy) begin
			enable_mouse <= 1'b0;
		end
		
		prev_rdmsel <= rdmsel;
		if (!prev_rdmsel && rdmsel) begin
			counter <= 10'd0;
			if (smstate < 4'd9) smstate <= smstate + 4'd1;
			case (smstate)
				4'd2:	mdata <= ~{1'b0, btn_state[2:0]};
				4'd3:	mdata <= new_msg ? {3'b000, ymove[8]} : 4'h0;
				4'd4:	mdata <= new_msg ? ymove[7:4] : 4'h0;
				4'd5:	mdata <= new_msg ? ymove[3:0] : 4'h0;
				4'd6:	mdata <= new_msg ? {3'b000, xmove[8]} : 4'h0;
				4'd7:	mdata <= new_msg ? xmove[7:4] : 4'h0;
				4'd8:	begin mdata <= new_msg ? xmove[3:0] : 4'h0; new_msg_a <= new_msg_b; end
				default: mdata <= 4'hf;
			endcase
		end else begin
			if (counter < RESETTIME_CLOCKS) counter <= counter + 1;
			if (counter == RESETTIME_CLOCKS) smstate <= 4'd0; 
		end
	end

	localparam RESET = 0;
	localparam ENABLE = 1;
	localparam RXMSG0 = 2;
	localparam RXMSG1 = 3;
	localparam RXMSG2 = 4;
	reg[2:0] state = RXMSG0;
	assign rx_reset = state == ENABLE;
	always @(negedge kbint) begin
		case (state)
			RESET: begin
				if (scancode[7:0] == 8'h00) begin
					state <= ENABLE;
				end
			end
			ENABLE, RXMSG0: begin
				if (scancode[7:0] == 8'haa) state <= RESET;
				else if (scancode[7:0] != 8'hfc && scancode[3] == 1'b1) begin
					btn_state[2:0] <= scancode[2:0];
					ymove[8] <= scancode[5];
					xmove[8] <= scancode[4];
					state <= RXMSG1;
				end
			end
			RXMSG1: begin
				if (scancode[7:0] == 8'haa) state <= RESET;
				else begin
					xmove[7:0] <= scancode[7:0];
					state <= RXMSG2;
				end
			end
			RXMSG2: begin
				if (scancode[7:0] == 8'haa) state <= RESET;
				else begin
					ymove[7:0] <= scancode[7:0];
					state <= RXMSG0;
					if (!new_msg) new_msg_b <= ~new_msg_b;
				end
			end
			default: if (scancode[7:0] == 8'haa) state <= RESET;
		endcase
	end
// 	assign tp[3:0] = {state[1:0], clkps2, dataps2};
endmodule

