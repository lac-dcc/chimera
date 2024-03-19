module control_unit (
    input wire clk,                     // Clock input
    input wire rst,                     // Reset input
    input wire processor_enable,        // Processor enable signal
    input wire illegal_segment_execution, // Signal for illegal segment execution
    output reg processor_halted,        // Processor halted signal
    input wire [7:0] instruction,        // Input from the Instruction Register (IR)
    input wire ZF,                      // Zero Flag input, true when ACC is zero

    output reg PC_write_enable,         // Enables writing to the PC
    output reg [1:0] PC_mux_select,     // Selects the input for the PC multiplexer
                                        // 00: PC + 1 (FETCH cycle)
                                        // 01: ACC (JMP, JSR)
                                        // 10: PC + Immediate (BEQ_FWD, BNE_FWD, BRA_FWD)
                                        // 11: PC - Immediate (BEQ_BWD, BNE_BWD, BRA_BWD)

    output reg ACC_write_enable,        // Enables writing to the ACC
    output reg [1:0] ACC_mux_select,    // Selects the input for the ACC multiplexer
                                        // 00: ALU output
                                        // 01: Memory contents (LDA, LDAR)
                                        // 10: PC + 1 (JSR)
                                        // 11: CSR[RRR] (CSR)

    output reg IR_load_enable,          // Enables loading new instruction into IR from memory

    output wire [3:0] ALU_opcode,        // Control signal specifying the ALU operation
    output reg ALU_inputB_mux_select,   // Selects input B for the ALU multiplexer
                                        // 0: Memory contents (ADD, SUB, AND, OR, XOR)
                                        // 1: Immediate (ADDI)

    output reg Memory_write_enable,     // Enables writing to memory (STA)
    output reg [1:0] Memory_address_mux_select, // Selects input for memory address multiplexer
                                                 // 00: {Seg, IR[3:0]} (LDA, STA, ADD, SUB, AND, OR, XOR)
                                                 // 01: ACC (LDAR)
                                                 // 10: PC (Instruction fetching)

    output reg CSR_write_enable,        // Enables writing to CSR[RRR] (CSW)

    output reg SEG_write_enable,        // Enables writing to the Segment Register
    output reg [1:0] SEG_mux_select,    // Selects the input for the Segment Register multiplexer
                                        // 00: Immediate value (SETSEG)
                                        // 01: ACC value (SETSEG_ACC)

    // Scan chain signals
    input wire scan_enable,             // Scan chain enable signal
    input wire scan_in,                 // Scan chain input
    output wire scan_out                // Scan chain output
);

  // Define state constants
  localparam STATE_RESET = 3'b000;
  localparam STATE_FETCH = 3'b001;
  localparam STATE_EXECUTE = 3'b010;
  localparam STATE_HALT = 3'b100;

  // Instantiate shift register for state storage (one-hot encoding)
  reg [2:0] state_in;
  wire [2:0] state_out;
  // Instantiate shift register for new 'reserved' connection (one-bit)
  reg reserved_in = 1'b0;        // Permanently setting to 0
  wire reserved_scan_out;        // New wire to connect scan_out of reserved_register to scan_in of state_register
  shift_register #(
    .WIDTH(1)
  ) reserved_register (
    .clk(clk),
    .rst(rst),
    .enable(1'b0),             // Permanently setting enable to 0
    .data_in(reserved_in),
    .data_out(),               // Not used
    .scan_enable(scan_enable),
    .scan_in(scan_in),      // Taking top-level scan_in
    .scan_out(reserved_scan_out) // Connecting to new wire reserved_scan_out
  );

  // Then, connect this output to your existing state_register's scan_in:

  // Instantiate shift register for state storage (one-hot encoding)
  shift_register #(
    .WIDTH(3)
  ) state_register (
    .clk(clk),
    .rst(rst),
    .enable(processor_enable),
    .data_in(state_in),
    .data_out(state_out),
    .scan_enable(scan_enable),
    .scan_in(reserved_scan_out), // Now connected to new wire from reserved register's scan_out
    .scan_out(scan_out)     // Output connected to top-level scan_out
  );


always @(*) begin
  // Default state: stay in the current state
  state_in = state_out;

  // Default processor_halted: set to 0
  processor_halted = 0;

  // Only advance state and update processor_halted if processor_enable is asserted
  if (processor_enable) begin
    case (state_out)
      STATE_RESET: begin
        // Move to STATE_FETCH when reset input is low
        if (!rst) begin
          state_in = STATE_FETCH;
        end
      end

      STATE_FETCH: begin
        // If the processor is halted or illegal segment execution, stay in the HALT state
        if (instruction == 8'b11111111 || illegal_segment_execution) begin
          state_in = STATE_HALT;
        end
        // Otherwise, move to the EXECUTE state
        else begin
          state_in = STATE_EXECUTE;
        end
      end

      STATE_EXECUTE: begin
        // If the processor is halted or illegal segment execution, move to the HALT state
        if (instruction == 8'b11111111 || illegal_segment_execution) begin
          state_in = STATE_HALT;
        end
        // Otherwise, move back to the FETCH state
        else begin
          state_in = STATE_FETCH;
        end
      end

      STATE_HALT: begin
        // Stay in HALT state unless reset occurs
        if (rst) begin
          state_in = STATE_FETCH;
        end
        // Otherwise, maintain the HALT state and set processor_halted
        else begin
          processor_halted = 1;
        end
      end

      default: begin
        // Default behavior (should never be reached in this implementation)
        state_in = STATE_FETCH;
        processor_halted = 0;
      end
    endcase
  end
end

always @(*) begin
  // Default values
  ACC_write_enable = 1'b0;
  ACC_mux_select = 2'b00;

  // Check if the processor is enabled
  if (processor_enable) begin
    // Check if the current state is EXECUTE
    if (state_out == STATE_EXECUTE) begin
      // Handle instructions where ACC is written with ALU output
      case (instruction[7:4])
        4'b0010, // ADD
        4'b0011, // SUB
        4'b0100, // AND
        4'b0101, // OR
        4'b0110, // XOR
        4'b1000, // ADDI
        4'b1001: // LUI
        begin
          ACC_write_enable = 1'b1;
          ACC_mux_select = 2'b00; // ALU output
        end
        default: ; // Do nothing for other opcodes
      endcase
      
      // Handle instructions where ACC is written with memory contents
      case (instruction[7:4])
        4'b0000: // LDA
        begin
          ACC_write_enable = 1'b1;
          ACC_mux_select = 2'b01; // Memory contents
        end
        default: ; // Do nothing for other opcodes
      endcase

      // Control/Status Register Manipulation Instructions
      case (instruction[7:3])
        5'b10110: begin // CSR
          ACC_write_enable = 1'b1;
          ACC_mux_select = 2'b11; // CSR[RRR]
        end
        default: ; // Do nothing for other opcodes
      endcase

      // Fixed Control and Branching Instructions
      case (instruction[7:0])
        8'b11110001: begin // JSR
          ACC_write_enable = 1'b1;
          ACC_mux_select = 2'b10; // PC + 1
        end
        default: ; // Do nothing for other opcodes
      endcase

      // Data Manipulation Instructions
      case (instruction[7:0])
        8'b11110110, // SHL
        8'b11110111, // SHR
        8'b11111000, // ROL
        8'b11111001, // ROR
        8'b11111100, // DEC
        8'b11111101, // CLR
        8'b11111110: // INV
        begin
          ACC_write_enable = 1'b1;
          ACC_mux_select = 2'b00; // ALU output
        end
        8'b11111010: begin // LDAR
          ACC_write_enable = 1'b1;
          ACC_mux_select = 2'b01; // Memory contents
        end
        default: ; // Do nothing for other opcodes
      endcase
    end
  end
end



always @(*) begin
    // Default: IR_load_enable is 0 (disabled)
    IR_load_enable = 1'b0;

    if (processor_enable) begin
        // During FETCH cycle, set IR_load_enable to 1 (enabled)
        if (state_out == STATE_FETCH) begin
            IR_load_enable = 1'b1;
        end
    end
end

always @(*) begin
    // Default values
    Memory_write_enable = 1'b0;
    Memory_address_mux_select = 2'b00; // Default to IR[3:0]

    // Check if processor is enabled
    if (processor_enable) begin
        // Check if the current state is EXECUTE
        if (state_out == STATE_EXECUTE) begin
            case (instruction[7:4])
                4'b0001: begin // STA
                    Memory_write_enable = 1'b1;
                end
                default: ; // Do nothing for other opcodes
            endcase

            // Check if the current instruction is LDAR
            if (instruction == 8'b11111010) begin
                Memory_address_mux_select = 2'b01;
            end
        end
        // Instruction fetch cycle uses PC as memory address
        else if (state_out == STATE_FETCH) begin
            Memory_address_mux_select = 2'b10; 
        end
    end
end

always @(*) begin
  if (processor_enable) begin
    SEG_write_enable = 1'b0;
    SEG_mux_select = 2'b00;

    if (state_out == STATE_EXECUTE) begin
      // Immediate Data Manipulation Instructions
      if (instruction[7:4] == 4'b1010) begin // SETSEG
        SEG_write_enable = 1'b1;
        SEG_mux_select = 2'b00; // Immediate value
      end

      // Data Manipulation Instructions
      if (instruction[7:0] == 8'b11111011) begin // SETSEG_ACC
        SEG_write_enable = 1'b1;
        SEG_mux_select = 2'b01; // ACC[3:0]
      end
    end
  end else begin
    SEG_write_enable = 1'b0;
    SEG_mux_select = 2'b00;
  end
end

instruction_decoder decoder (
    .instruction(instruction),
    .alu_opcode(ALU_opcode)
);

always @(*) begin
  // Default values
  PC_write_enable = 1'b0;
  PC_mux_select = 2'b00;

  // Only emit signals if the control unit is enabled
  if (processor_enable) begin
    if (state_out == STATE_FETCH) begin
      // Increment the PC by 1 during FETCH
      PC_write_enable = 1'b1;
      PC_mux_select = 2'b00; // PC + 1
    end

    else if (state_out == STATE_EXECUTE) begin
      // Control Flow Instructions
      case (instruction[7:0])
        8'b11110000: begin // JMP
          PC_write_enable = 1'b1;
          PC_mux_select = 2'b01; // ACC
        end
        8'b11110001: begin // JSR
          PC_write_enable = 1'b1;
          PC_mux_select = 2'b01; // ACC
        end
        default: ; // Do nothing for other opcodes
      endcase
      
      case (instruction[7:4])
        4'b1100: begin // BEQ
          if (ZF) begin
            PC_write_enable = 1'b1;
            PC_mux_select = instruction[3] ? 2'b11 : 2'b10; // PC + Immediate if sign is 0, PC - Immediate if sign is 1
          end
        end
        4'b1101: begin // BNE
          if (!ZF) begin
            PC_write_enable = 1'b1;
            PC_mux_select = instruction[3] ? 2'b11 : 2'b10; // PC + Immediate if sign is 0, PC - Immediate if sign is 1
          end
        end
        4'b1110: begin // BRA
          PC_write_enable = 1'b1;
          PC_mux_select = instruction[3] ? 2'b11 : 2'b10; // PC + Immediate if sign is 0, PC - Immediate if sign is 1
        end
        default: ; // Do nothing for other opcodes
      endcase
    end
  end
end

always @(*) begin
  // Default value
  ALU_inputB_mux_select = 1'b0; // Memory contents by default

  // Only emit signals if the control unit is enabled
  if (processor_enable && state_out == STATE_EXECUTE) begin
    // ALU Instructions
    case (instruction[7:4])
      4'b1000: begin // ADDI
        ALU_inputB_mux_select = 1'b1; // Immediate value
      end
      4'b1001: begin // LUI
        ALU_inputB_mux_select = 1'b1; // Immediate value
      end
      default: ; // Do nothing for other opcodes
    endcase
  end
end

always @(*) begin
  // Default values
  CSR_write_enable = 1'b0;

  // Check if the processor is enabled
  if (processor_enable) begin
    // Check if the current state is EXECUTE
    if (state_out == STATE_EXECUTE) begin
      // CSR Manipulation Instructions
      case (instruction[7:3])
        5'b10111: begin // CSW
          CSR_write_enable = 1'b1;
        end
        default: ; // Do nothing for other opcodes
      endcase
    end
  end
end


endmodule

module instruction_decoder (
    input wire [7:0] instruction,
    output reg [3:0] alu_opcode
);

always @(*) begin
    case (instruction[7:4])
        4'b0000: alu_opcode = 4'b0000;    // LDA
        4'b0001: alu_opcode = 4'b0000;    // STA
        4'b0010: alu_opcode = 4'b0000;    // ADD
        4'b0011: alu_opcode = 4'b0001;    // SUB
        4'b0100: alu_opcode = 4'b0010;    // AND
        4'b0101: alu_opcode = 4'b0011;    // OR
        4'b0110: alu_opcode = 4'b0100;    // XOR
        4'b1000: alu_opcode = 4'b0000;    // ADDI
        4'b1001: alu_opcode = 4'b0101;    // LUI
        4'b1010: alu_opcode = 4'b0000;    // SETSEG
        4'b1011: alu_opcode = 4'b0000;    // CSR, CSW
        4'b1111: begin                    // Control and Data Manipulation Instructions
            case (instruction[3:0])
                4'b0110: alu_opcode = 4'b0110;    // SHL
                4'b0111: alu_opcode = 4'b0111;    // SHR
                4'b1000: alu_opcode = 4'b1000;    // ROL
                4'b1001: alu_opcode = 4'b1001;    // ROR
                4'b1100: alu_opcode = 4'b1010;    // DEC
                4'b1101: alu_opcode = 4'b1100;    // CLR
                4'b1110: alu_opcode = 4'b1011;    // INV
                default: alu_opcode = 4'b0000;
            endcase
        end
        default: alu_opcode = 4'b0000;
    endcase
end

endmodule
