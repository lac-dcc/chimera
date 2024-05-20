// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module MAIN_DECODER
(
    input  wire [5:0]  dec_input,
    output reg         mem_t_reg,
    output reg         mem_write,
    output reg         branch_f,
    output reg         alu_src,
    output reg         reg_dest,
    output reg         reg_write,
    output reg         jump_f,
    output reg  [1:0]  alu_op
);

    always @(*) begin
        case(dec_input)

            //R-Type you can general operation depend on func of cu and stroe in reg file
            'b000000 : begin
                reg_write  = 'b1;
                reg_dest   = 'b1;
                alu_op     = 'b10;
                jump_f     = 'b0;
                mem_t_reg  = 'b0;
                mem_write  = 'b0;
                branch_f   = 'b0;
                alu_src    = 'b0;
            end

            //Load word from data memory to reg file
            'b100011 : begin
                reg_write = 'b1;
                alu_src   = 'b1;
                mem_t_reg = 'b1;
                mem_write = 'b0;
                branch_f  = 'b0;
                reg_dest  = 'b0;
                jump_f    = 'b0;
                alu_op    = 'b00;
            end

            //Store word in data memory
            'b101011 : begin
                alu_src   = 'b1;
                mem_write = 'b1;
                branch_f  = 'b0;
                reg_dest  = 'b0;
                jump_f    = 'b0;
                alu_op    = 'b00;
                reg_write = 'b0;
                mem_t_reg = 'b0;
            end

            //Branch if equal add pc to offset
            'b000100 : begin
                branch_f  = 'b1;
                alu_op    = 'b01;
                reg_dest  = 'b0;
                jump_f    = 'b0;
                reg_write = 'b0;
                mem_t_reg = 'b0;
                alu_src   = 'b0;
                mem_write = 'b0;
            end

            //Add immediate and put it direct in reg file
            'b001000 : begin
                reg_write = 'b1;
                alu_src   = 'b1;
                branch_f  = 'b0;
                alu_op    = 'b00;
                reg_dest  = 'b0;
                jump_f    = 'b0;
                mem_t_reg = 'b0;
                mem_write = 'b0;
            end

            //Jump we set the jump flag you add pc to offset
            'b000010 : begin
                jump_f    = 'b1;
                reg_write = 'b0;
                alu_src   = 'b0;
                branch_f  = 'b0;
                alu_op    = 'b00;
                reg_dest  = 'b0;
                mem_t_reg = 'b0;
                mem_write = 'b0;
            end

            //Default all flags are zeros
            default : begin
                mem_t_reg = 'b0;
                mem_write = 'b0;
                branch_f  = 'b0;
                alu_src   = 'b0;
                reg_dest  = 'b0;
                reg_write = 'b0;
                jump_f    = 'b0;
                alu_op    = 'b00; 
            end
            
        endcase
    end
    
endmodule

