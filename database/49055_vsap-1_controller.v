// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

/*
Control signals:
	hlt: halt execution
	pc_inc: increment program counter
	pc_en: put value of the pc onto the bus
	mar_load: load address into memory address register
	mem_en: put value from memory into the bus
	ir_load: load value from bus into intruction register
	ir_en: put value in ir onto the bus
	a_load: load value from bus into A register
	a_en: put value in A onto the bus
	b_load: load value from bus into B register
	adder_sub: subtract value in B from A
	adder_en: put value in adder onto the bus
*/

module controller(
	input clk,
	input rst,
	input[3:0] opcode,

	output[11:0] out
);

	localparam HLT = 11;
	localparam PC_INC = 10;
	localparam PC_EN = 9;
	localparam MAR_LOAD = 8;
	localparam MEM_EN = 7;
	localparam IR_LOAD = 6;
	localparam IR_EN = 5;
	localparam A_LOAD = 4;
	localparam A_EN = 3;
	localparam B_LOAD = 2;
	localparam ADDER_SUB = 1;
	localparam ADDER_EN = 0;

	localparam OP_LDA = 4'b0000;
	localparam OP_ADD = 4'b0001;
	localparam OP_SUB = 4'b0010;
	localparam OP_HLT = 4'b1111;

	reg[2:0] stage;
	reg[11:0] ctrl_word;

	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			stage <= 0;
		end else 
		begin
			if (stage == 5)
			begin
				stage <= 0;
			end else
			begin
				stage <= stage + 1;
			end
		end
	end

	always @ (*)
	begin
		ctrl_word = 12'b0;

		case (stage)
			0:
				begin
					ctrl_word[PC_EN] = 1;
					ctrl_word[MAR_LOAD] = 1;
				end
			1:
				begin
					ctrl_word[PC_INC] = 1;
				end

			2: 
				begin
					ctrl_word[MEM_EN] = 1;
					ctrl_word[IR_LOAD] = 1;
				end

			3:
				begin
					case (opcode)
						OP_LDA: 
                            begin
                                ctrl_word[IR_EN] = 1;
                                ctrl_word[MAR_LOAD] = 1;
                            end

                        OP_ADD: 
                            begin
                                ctrl_word[IR_EN] = 1;
                                ctrl_word[MAR_LOAD] = 1;
                            end

                        OP_SUB: 
                            begin
                                ctrl_word[IR_EN] = 1;
                                ctrl_word[MAR_LOAD] = 1;
                            end

                        OP_HLT: 
                            begin
                                ctrl_word[HLT] = 1;
                            end
                    endcase
				end
            4: 
                begin
                    case (opcode)
                        OP_LDA: 
                            begin
                                ctrl_word[MEM_EN] = 1;
                                ctrl_word[A_LOAD] = 1;
                            end

                        OP_ADD: 
                            begin
                                ctrl_word[MEM_EN] = 1;
                                ctrl_word[B_LOAD] = 1;
                            end

                        OP_SUB: 
                            begin
                                ctrl_word[MEM_EN] = 1;
                                ctrl_word[B_LOAD] = 1;
                            end
                    endcase
                end

            5: 
                begin
                    case (opcode)
                        OP_ADD: 
                            begin
                                ctrl_word[ADDER_EN] = 1;
                                ctrl_word[A_LOAD] = 1;
                            end

                        OP_SUB:
                            begin
                                ctrl_word[ADDER_SUB] = 1;
                                ctrl_word[ADDER_EN] = 1;
                                ctrl_word[A_LOAD] = 1;
                            end
                    endcase
                end
        endcase
	end

    assign out = ctrl_word;

endmodule
