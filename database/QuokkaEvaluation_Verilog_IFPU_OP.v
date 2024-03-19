// FPU integration
// Repository: https://github.com/dawsonjon/fpu.git
// Integration commit: 97a768293e9376aed6ee9003f41d68c7de71cf53

module work_IFPU_Op (
	Clock,
	Reset,
	Trigger,
	Completed,
	Lhs,
	Rhs,
	Op,
	Result
);

localparam AddOp = 0;
localparam SubOp = 1;
localparam MltOp = 2;
localparam DivOp = 3;

input wire Clock;
input wire Reset;
input wire Trigger;
output wire Completed;
input wire [32:1] Lhs;
input wire [32:1] Rhs;
input wire [8:1] Op;
output wire [32:1] Result;

// FSM
localparam Waiting = 2'b00;
localparam DispatchOp = 2'b01;
localparam CompleteOp = 2'b10;

reg [2:1] fsm = Waiting;

wire adder_trigger;
wire [32:1] adder_result;
wire adder_z_stb;
					
adder adder(
	.clk (Clock),
	.rst (Reset),

	.input_a (Lhs),
	.input_b (Rhs),
	.input_a_stb (adder_trigger),
	.input_b_stb (adder_trigger),
	.output_z (adder_result),
	.output_z_stb (adder_z_stb),
	.output_z_ack (1)
);

wire sub_trigger;
wire [32:1] sub_result;
wire sub_z_stb;
wire [32:1] negRhs = {!Rhs[32], Rhs[31:1]};
					
adder sub(
	.clk (Clock),
	.rst (Reset),

	.input_a (Lhs),
	.input_b (negRhs),
	.input_a_stb (sub_trigger),
	.input_b_stb (sub_trigger),
	.output_z (sub_result),
	.output_z_stb (sub_z_stb),
	.output_z_ack (1)
);	

wire mlt_trigger;
wire [32:1] mlt_result;
wire mlt_z_stb;
					
multiplier mlt(
	.clk (Clock),
	.rst (Reset),

	.input_a (Lhs),
	.input_b (Rhs),
	.input_a_stb (mlt_trigger),
	.input_b_stb (mlt_trigger),
	.output_z (mlt_result),
	.output_z_stb (mlt_z_stb),
	.output_z_ack (1)
);	

wire div_trigger;
wire [32:1] div_result;
wire div_z_stb;
					
divider div(
	.clk (Clock),
	.rst (Reset),

	.input_a (Lhs),
	.input_b (Rhs),
	.input_a_stb (div_trigger),
	.input_b_stb (div_trigger),
	.output_z (div_result),
	.output_z_stb (div_z_stb),
	.output_z_ack (1)
);	

wire OpCompleted = adder_z_stb | sub_z_stb | mlt_z_stb | div_z_stb;
	
always @ (posedge Clock)
begin
	if (Reset) 
		begin
			fsm <= Waiting;
		end
	else
		begin
			case (fsm)	
				Waiting:
					if (Trigger == 1)
						begin
							fsm <= DispatchOp;
						end
				DispatchOp:
					if (OpCompleted == 1 )
						begin
							fsm <= CompleteOp;
						end
				CompleteOp:
					fsm <= Waiting;
				default:
					fsm <= Waiting;
			endcase
		end
end

assign adder_trigger = fsm == DispatchOp && Op == AddOp;	
assign sub_trigger = fsm == DispatchOp && Op == SubOp;	
assign mlt_trigger = fsm == DispatchOp && Op == MltOp;	
assign div_trigger = fsm == DispatchOp && Op == DivOp;	
assign Completed = fsm == CompleteOp ? 1'b1 : 1'b0;		
	
assign Result = Op == AddOp ? adder_result : 
				Op == SubOp ? sub_result : 
				Op == MltOp ? mlt_result : 
				Op == DivOp ? div_result : 
				0;
endmodule