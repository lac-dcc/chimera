// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module control(
    
    /* Current instruction encoding */
    input wire [31:0]instr,

    /* ALU result */
    input wire [31:0]alu_result,

    /* Immediate field type encoded in instruction */
    output reg [1:0]imm_type,
    
    /* Register file Write Enable */
    output reg rf_we,

    /* ALU immediate source operand flag */
    output reg alu_imm,
    
    /* ALU operation codes */
    output reg [2:0]alu_funct3,
    output reg [6:0]alu_funct7,

    /* Write to memory enable signal */
    output reg mem_we,

    /* Access width for memory control unit */
    output wire [1:0]mem_access_width,

    /* Halt, stop processor (ebreak opcode actually) */
    output reg halt,

    /* Current instruction is branch and it is taken */
    output reg branch_taken,

    /* Current instruction is jump */
    output reg jump,

    /* Current instruction is jump register */
    output reg jump_reg
);

/* Extract fields from instruction code */
wire [6:0]opcode = instr[6:0];

/* Access width for store instructions */
assign mem_access_width = instr[13:12];

initial begin
    halt = 1'b0;
end

wire [2:0]funct3 = instr[14:12];

always @(instr) begin
    
    rf_we        = 1'b0;
    mem_we       = 1'b0;

    jump         = 1'b0;
    jump_reg     = 1'b0;
    branch_taken = 1'b0;
    
    imm_type   = 2'h0;    
    alu_funct3 = instr[14:12];
    alu_funct7 = instr[31:25];

    case (opcode)

        /* I-type */
        7'b0010011: begin
            rf_we   = 1'b1;
            imm_type   = 2'h0;
            alu_imm = 1'b1;
        end

        /* R-type */
        7'b0110011: begin
            rf_we   = 1'b1;
            alu_imm = 1'b0;
        end

        /* S-type */
        7'b0100011: begin
            imm_type = 2'h1;
            alu_imm  = 1'b1;
            mem_we   = 1'b1;
            alu_funct3 = 3'b0; // ADDI to ALU
            alu_funct7 = 7'b0;
        end

        /* B-type */
        7'b1100011: begin
            imm_type = 2'h2;
            alu_imm = 1'b0;
            alu_funct3 = 3'b100; // XOR to ALU
            
            case (funct3)
                3'b000: branch_taken = (alu_result == 0);
                3'b001: branch_taken = (alu_result != 0);
                
                /* Unknown instruction, halt */
                default: halt = 1'b1;
            endcase

        end

        /* J-type */

        7'b1101111: begin // JAL
            imm_type = 3'h3;
            rf_we   = 1'b1;
            alu_imm = 1'b0;
            jump    = 1'b1;
        end

        7'b1100111: begin // JALR
            imm_type = 3'h3; 
            rf_we    = 1'b1;
            alu_imm  = 1'b0;
            jump_reg = 1'b1;
        end

        /* ebreak */
        7'b1110011: begin
            halt = 1'b1;
        end

        /* Unknown instruction */
        default: ;

    endcase
end

endmodule
