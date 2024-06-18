// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230419

`default_nettype none
module LCD #(
	parameter	CLOCK_HZ      = 10_000_000,
	parameter	CHANGE_COM_US = 10
)(
	input  wire       Clock,
	input  wire       Reset,
	input  wire [7:0] Digit3_i, // pgfedcba
	input  wire [7:0] Digit2_i,
	input  wire [7:0] Digit1_i,
	input  wire [7:0] Digit0_i,
	output wire [3:0] ComPWM_o,
	output wire [7:0] SegPWM_o
);
	
	// PWM generator to create 0, 1/3, 2/3 and 1 voltage levels
	wire [3:0] Voltage;
	LCD_PWM LCD_PWM_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Voltage0_o(Voltage[0]),
		.Voltage1_o(Voltage[1]),
		.Voltage2_o(Voltage[2]),
		.Voltage3_o(Voltage[3])
	);
	
	// Strobe for changing the state
	wire ChangeState;
	StrobeGenerator #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(CHANGE_COM_US)
	) StrobeGenerator0(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(1'b1),
		.Strobe_o(ChangeState)
	);
	
	// State machine
	reg [2:0] State /* synthesis syn_encoding = "sequential" */;
	localparam [2:0] COM_0H = 3'd0;
	localparam [2:0] COM_1H = 3'd1;
	localparam [2:0] COM_2H = 3'd2;
	localparam [2:0] COM_3H = 3'd3;
	localparam [2:0] COM_0L = 3'd4;
	localparam [2:0] COM_1L = 3'd5;
	localparam [2:0] COM_2L = 3'd6;
	localparam [2:0] COM_3L = 3'd7;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) 
			State <= 0;
		else if(ChangeState)
			State <= State + 1'b1;
	end
	
	reg [1:0] ComAnalog[0:3];
	reg [1:0] SegAnalog[0:7];
	
	// Part H
	// - Active COM: 3
	// - Inactive COM: 1
	// - Active SEG: 0
	// - Inactive SEG: 2
	// Part L
	// - Active COM: 0
	// - Inactive COM: 2
	// - Active SEG: 3
	// - Inactive SEG: 1

	always @(*) begin
		case(State)
			COM_0H: begin
				ComAnalog[0] = 2'd3;
				ComAnalog[1] = 2'd1;
				ComAnalog[2] = 2'd1;
				ComAnalog[3] = 2'd1;
				SegAnalog[0] = Digit0_i[7] ? 2'd0 : 2'd2;	// Colon
				SegAnalog[1] = Digit0_i[3] ? 2'd0 : 2'd2;	// Digit 0, segment D
				SegAnalog[2] = Digit1_i[7] ? 2'd0 : 2'd2;	// Digit 1, segment P
				SegAnalog[3] = Digit1_i[3] ? 2'd0 : 2'd2;	// Digit 1, segment D
				SegAnalog[4] = Digit2_i[7] ? 2'd0 : 2'd2;	// Digit 2, segment P
				SegAnalog[5] = Digit2_i[3] ? 2'd0 : 2'd2;	// Digit 2, segment D
				SegAnalog[6] = Digit3_i[7] ? 2'd0 : 2'd2;	// Digit 3, segment P
				SegAnalog[7] = Digit3_i[3] ? 2'd0 : 2'd2;	// Digit 3, segment D
			end
			
			COM_1H: begin
				ComAnalog[0] = 2'd1;
				ComAnalog[1] = 2'd3;
				ComAnalog[2] = 2'd1;
				ComAnalog[3] = 2'd1;
				SegAnalog[0] = Digit0_i[2] ? 2'd0 : 2'd2;	// Digit 0, segment C
				SegAnalog[1] = Digit0_i[4] ? 2'd0 : 2'd2;	// Digit 0, segment E
				SegAnalog[2] = Digit1_i[2] ? 2'd0 : 2'd2;	// Digit 1, segment C
				SegAnalog[3] = Digit1_i[4] ? 2'd0 : 2'd2;	// Digit 1, segment E
				SegAnalog[4] = Digit2_i[2] ? 2'd0 : 2'd2;	// Digit 2, segment C
				SegAnalog[5] = Digit2_i[4] ? 2'd0 : 2'd2;	// Digit 2, segment E
				SegAnalog[6] = Digit3_i[2] ? 2'd0 : 2'd2;	// Digit 3, segment C
				SegAnalog[7] = Digit3_i[4] ? 2'd0 : 2'd2;	// Digit 3, segment E
			end
			
			COM_2H: begin
				ComAnalog[0] = 2'd1;
				ComAnalog[1] = 2'd1;
				ComAnalog[2] = 2'd3;
				ComAnalog[3] = 2'd1;
				SegAnalog[0] = Digit0_i[1] ? 2'd0 : 2'd2;	// Digit 0, segment B
				SegAnalog[1] = Digit0_i[6] ? 2'd0 : 2'd2;	// Digit 0, segment G
				SegAnalog[2] = Digit1_i[1] ? 2'd0 : 2'd2;	// Digit 1, segment B
				SegAnalog[3] = Digit1_i[6] ? 2'd0 : 2'd2;	// Digit 1, segment G
				SegAnalog[4] = Digit2_i[1] ? 2'd0 : 2'd2;	// Digit 2, segment B
				SegAnalog[5] = Digit2_i[6] ? 2'd0 : 2'd2;	// Digit 2, segment G
				SegAnalog[6] = Digit3_i[1] ? 2'd0 : 2'd2;	// Digit 3, segment B
				SegAnalog[7] = Digit3_i[6] ? 2'd0 : 2'd2;	// Digit 3, segment G
			end
			
			COM_3H: begin
				ComAnalog[0] = 2'd1;
				ComAnalog[1] = 2'd1;
				ComAnalog[2] = 2'd1;
				ComAnalog[3] = 2'd3;
				SegAnalog[0] = Digit0_i[0] ? 2'd0 : 2'd2;	// Digit 0, segment A
				SegAnalog[1] = Digit0_i[5] ? 2'd0 : 2'd2;	// Digit 0, segment F
				SegAnalog[2] = Digit1_i[0] ? 2'd0 : 2'd2;	// Digit 1, segment A
				SegAnalog[3] = Digit1_i[5] ? 2'd0 : 2'd2;	// Digit 1, segment F
				SegAnalog[4] = Digit2_i[0] ? 2'd0 : 2'd2;	// Digit 2, segment A
				SegAnalog[5] = Digit2_i[5] ? 2'd0 : 2'd2;	// Digit 2, segment F
				SegAnalog[6] = Digit3_i[0] ? 2'd0 : 2'd2;	// Digit 3, segment A
				SegAnalog[7] = Digit3_i[5] ? 2'd0 : 2'd2;	// Digit 3, segment F
			end
			
			COM_0L: begin
				ComAnalog[0] = 2'd0;
				ComAnalog[1] = 2'd2;
				ComAnalog[2] = 2'd2;
				ComAnalog[3] = 2'd2;
				SegAnalog[0] = Digit0_i[7] ? 2'd3 : 2'd1;	// Colon
				SegAnalog[1] = Digit0_i[3] ? 2'd3 : 2'd1;	// Digit 0, segment D
				SegAnalog[2] = Digit1_i[7] ? 2'd3 : 2'd1;	// Digit 1, segment P
				SegAnalog[3] = Digit1_i[3] ? 2'd3 : 2'd1;	// Digit 1, segment D
				SegAnalog[4] = Digit2_i[7] ? 2'd3 : 2'd1;	// Digit 2, segment P
				SegAnalog[5] = Digit2_i[3] ? 2'd3 : 2'd1;	// Digit 2, segment D
				SegAnalog[6] = Digit3_i[7] ? 2'd3 : 2'd1;	// Digit 3, segment P
				SegAnalog[7] = Digit3_i[3] ? 2'd3 : 2'd1;	// Digit 3, segment D
			end
			
			COM_1L: begin
				ComAnalog[0] = 2'd2;
				ComAnalog[1] = 2'd0;
				ComAnalog[2] = 2'd2;
				ComAnalog[3] = 2'd2;
				SegAnalog[0] = Digit0_i[2] ? 2'd3 : 2'd1;	// Digit 0, segment C
				SegAnalog[1] = Digit0_i[4] ? 2'd3 : 2'd1;	// Digit 0, segment E
				SegAnalog[2] = Digit1_i[2] ? 2'd3 : 2'd1;	// Digit 1, segment C
				SegAnalog[3] = Digit1_i[4] ? 2'd3 : 2'd1;	// Digit 1, segment E
				SegAnalog[4] = Digit2_i[2] ? 2'd3 : 2'd1;	// Digit 2, segment C
				SegAnalog[5] = Digit2_i[4] ? 2'd3 : 2'd1;	// Digit 2, segment E
				SegAnalog[6] = Digit3_i[2] ? 2'd3 : 2'd1;	// Digit 3, segment C
				SegAnalog[7] = Digit3_i[4] ? 2'd3 : 2'd1;	// Digit 3, segment E
			end
			
			COM_2L: begin
				ComAnalog[0] = 2'd2;
				ComAnalog[1] = 2'd2;
				ComAnalog[2] = 2'd0;
				ComAnalog[3] = 2'd2;
				SegAnalog[0] = Digit0_i[1] ? 2'd3 : 2'd1;	// Digit 0, segment B
				SegAnalog[1] = Digit0_i[6] ? 2'd3 : 2'd1;	// Digit 0, segment G
				SegAnalog[2] = Digit1_i[1] ? 2'd3 : 2'd1;	// Digit 1, segment B
				SegAnalog[3] = Digit1_i[6] ? 2'd3 : 2'd1;	// Digit 1, segment G
				SegAnalog[4] = Digit2_i[1] ? 2'd3 : 2'd1;	// Digit 2, segment B
				SegAnalog[5] = Digit2_i[6] ? 2'd3 : 2'd1;	// Digit 2, segment G
				SegAnalog[6] = Digit3_i[1] ? 2'd3 : 2'd1;	// Digit 3, segment B
				SegAnalog[7] = Digit3_i[6] ? 2'd3 : 2'd1;	// Digit 3, segment G
			end
			
			COM_3L: begin
				ComAnalog[0] = 2'd2;
				ComAnalog[1] = 2'd2;
				ComAnalog[2] = 2'd2;
				ComAnalog[3] = 2'd0;
				SegAnalog[0] = Digit0_i[0] ? 2'd3 : 2'd1;	// Digit 0, segment A
				SegAnalog[1] = Digit0_i[5] ? 2'd3 : 2'd1;	// Digit 0, segment F
				SegAnalog[2] = Digit1_i[0] ? 2'd3 : 2'd1;	// Digit 1, segment A
				SegAnalog[3] = Digit1_i[5] ? 2'd3 : 2'd1;	// Digit 1, segment F
				SegAnalog[4] = Digit2_i[0] ? 2'd3 : 2'd1;	// Digit 2, segment A
				SegAnalog[5] = Digit2_i[5] ? 2'd3 : 2'd1;	// Digit 2, segment F
				SegAnalog[6] = Digit3_i[0] ? 2'd3 : 2'd1;	// Digit 3, segment A
				SegAnalog[7] = Digit3_i[5] ? 2'd3 : 2'd1;	// Digit 3, segment F
			end
			
			default: begin
				ComAnalog[0] = 2'dX;
				ComAnalog[1] = 2'dX;
				ComAnalog[2] = 2'dX;
				ComAnalog[3] = 2'dX;
				SegAnalog[0] = 2'dX;
				SegAnalog[1] = 2'dX;
				SegAnalog[2] = 2'dX;
				SegAnalog[3] = 2'dX;
				SegAnalog[4] = 2'dX;
				SegAnalog[5] = 2'dX;
				SegAnalog[6] = 2'dX;
				SegAnalog[7] = 2'dX;
			end
			
		endcase
	end
	
	// Assign outputs
	assign ComPWM_o[0] = Voltage[ComAnalog[0]];
	assign ComPWM_o[1] = Voltage[ComAnalog[1]];
	assign ComPWM_o[2] = Voltage[ComAnalog[2]];
	assign ComPWM_o[3] = Voltage[ComAnalog[3]];
	assign SegPWM_o[0] = Voltage[SegAnalog[0]];
	assign SegPWM_o[1] = Voltage[SegAnalog[1]];
	assign SegPWM_o[2] = Voltage[SegAnalog[2]];
	assign SegPWM_o[3] = Voltage[SegAnalog[3]];
	assign SegPWM_o[4] = Voltage[SegAnalog[4]];
	assign SegPWM_o[5] = Voltage[SegAnalog[5]];
	assign SegPWM_o[6] = Voltage[SegAnalog[6]];
	assign SegPWM_o[7] = Voltage[SegAnalog[7]];
	
endmodule
`default_nettype wire
