// This program was cloned from: https://github.com/ochsnega/ECE289AdvancedBadge
// License: MIT License

module registerFile(
	input clk,
	input rst,
	input [31:0] w_data, // Data to write to a register
	input [4:0] w_add, // Address for above data
	input w_en, // Write enable
	input [4:0] rl_add, // Address for reading 'left' register of instruction.
	input [4:0] rr_add, // Address for reading 'right' register of instruction.
	output reg [31:0] rl_data, // Data at left register address.
	output reg [31:0] rr_data // Data at right register address
);

// Declare registers
reg [31:0] r0;
reg [31:0] r1;
reg [31:0] r2;
reg [31:0] r3;
reg [31:0] r4;
reg [31:0] r5;
reg [31:0] r6;
reg [31:0] r7;
reg [31:0] r8;
reg [31:0] r9;
reg [31:0] r10;
reg [31:0] r11;
reg [31:0] r12;
reg [31:0] r13;
reg [31:0] r14;
reg [31:0] r15;
reg [31:0] r16;
reg [31:0] r17;
reg [31:0] r18;
reg [31:0] r19;
reg [31:0] r20;
reg [31:0] r21;
reg [31:0] r22;
reg [31:0] r23;
reg [31:0] r24;
reg [31:0] r25;
reg [31:0] r26;
reg [31:0] r27;
reg [31:0] r28;
reg [31:0] r29;
reg [31:0] r30;
reg [31:0] r31;

// Read path
always@(posedge clk or negedge rst)
begin
	case (rl_add)
		5'd0: rl_data = r0;
		5'd1: rl_data = r1;
		5'd2: rl_data = r2;
		5'd3: rl_data = r3;
		5'd4: rl_data = r4;
		5'd5: rl_data = r5;
		5'd6: rl_data = r6;
		5'd7: rl_data = r7;
		5'd8: rl_data = r8;
		5'd9: rl_data = r9;
		5'd10: rl_data = r10;
		5'd11: rl_data = r11;
		5'd12: rl_data = r12;
		5'd13: rl_data = r13;
		5'd14: rl_data = r14;
		5'd15: rl_data = r15;
		5'd16: rl_data = r16;
		5'd17: rl_data = r17;
		5'd18: rl_data = r18;
		5'd19: rl_data = r19;
		5'd20: rl_data = r20;
		5'd21: rl_data = r21;
		5'd22: rl_data = r22;
		5'd23: rl_data = r23;
		5'd24: rl_data = r24;
		5'd25: rl_data = r25;
		5'd26: rl_data = r26;
		5'd27: rl_data = r27;
		5'd28: rl_data = r28;
		5'd29: rl_data = r29;
		5'd30: rl_data = r30;
		5'd31: rl_data = r31;
	endcase
	case (rr_add)
		5'd0: rr_data = r0;
		5'd1: rr_data = r1;
		5'd2: rr_data = r2;
		5'd3: rr_data = r3;
		5'd4: rr_data = r4;
		5'd5: rr_data = r5;
		5'd6: rr_data = r6;
		5'd7: rr_data = r7;
		5'd8: rr_data = r8;
		5'd9: rr_data = r9;
		5'd10: rr_data = r10;
		5'd11: rr_data = r11;
		5'd12: rr_data = r12;
		5'd13: rr_data = r13;
		5'd14: rr_data = r14;
		5'd15: rr_data = r15;
		5'd16: rr_data = r16;
		5'd17: rr_data = r17;
		5'd18: rr_data = r18;
		5'd19: rr_data = r19;
		5'd20: rr_data = r20;
		5'd21: rr_data = r21;
		5'd22: rr_data = r22;
		5'd23: rr_data = r23;
		5'd24: rr_data = r24;
		5'd25: rr_data = r25;
		5'd26: rr_data = r26;
		5'd27: rr_data = r27;
		5'd28: rr_data = r28;
		5'd29: rr_data = r29;
		5'd30: rr_data = r30;
		5'd31: rr_data = r31;
	endcase
end


always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
	begin
		r0 <= 32'b0;
		r1 <= 32'b0;
		r2 <= 32'b0;
		r3 <= 32'b0;
		r4 <= 32'b0;
		r5 <= 32'b0;
		r6 <= 32'b0;
		r7 <= 32'b0;
		r8 <= 32'b0;
		r9 <= 32'b0;
		r10 <= 32'b0;
		r11 <= 32'b0;
		r12 <= 32'b0;
		r13 <= 32'b0;
		r14 <= 32'b0;
		r15 <= 32'b0;
		r16 <= 32'b0;
		r17 <= 32'b0;
		r18 <= 32'b0;
		r19 <= 32'b0;
		r20 <= 32'b0;
		r21 <= 32'b0;
		r22 <= 32'b0;
		r23 <= 32'b0;
		r24 <= 32'b0;
		r25 <= 32'b0;
		r26 <= 32'b0;
		r27 <= 32'b0;
		r28 <= 32'b0;
		r29 <= 32'b0;
		r30 <= 32'b0;
		r31 <= 32'b0;
	end
	else
	begin
		if (w_en == 1'b1)
		begin
			case (w_add)
				5'd0: r0 <= 32'b0;
				5'd1: r1 <= w_data;
				5'd2: r2 <= w_data;
				5'd3: r3 <= w_data;
				5'd4: r4 <= w_data;
				5'd5: r5 <= w_data;
				5'd6: r6 <= w_data;
				5'd7: r7 <= w_data;
				5'd8: r8 <= w_data;
				5'd9: r9 <= w_data;
				5'd10: r10 <= w_data;
				5'd11: r11 <= w_data;
				5'd12: r12 <= w_data;
				5'd13: r13 <= w_data;
				5'd14: r14 <= w_data;
				5'd15: r15 <= w_data;
				5'd16: r16 <= w_data;
				5'd17: r17 <= w_data;
				5'd18: r18 <= w_data;
				5'd19: r19 <= w_data;
				5'd20: r20 <= w_data;
				5'd21: r21 <= w_data;
				5'd22: r22 <= w_data;
				5'd23: r23 <= w_data;
				5'd24: r24 <= w_data;
				5'd25: r25 <= w_data;
				5'd26: r26 <= w_data;
				5'd27: r27 <= w_data;
				5'd28: r28 <= w_data;
				5'd29: r29 <= w_data;
				5'd30: r30 <= w_data;
				5'd31: r31 <= w_data;
			endcase
		end
	end
end

endmodule 