// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module ALU_DECODER 
(
    input  wire  [1:0]  alu_op,
    input  wire  [5:0]  intsr,
    output reg   [2:0]  alu_ctrl
);

    always @(*) begin
        case (alu_op) 
            'b00 : begin
                alu_ctrl = 'b010;
            end
            'b01 : begin
                alu_ctrl = 'b100; 
            end

            'b10 : begin
                case (intsr) 
                    'b100000 : begin
                        alu_ctrl = 'b010;
                    end
                    'b100010 : begin
                        alu_ctrl = 'b100;
                    end
                    'b101010 : begin
                        alu_ctrl = 'b110;
                    end
                    'b011100 : begin
                        alu_ctrl = 'b101;
                    end
                    endcase
            end
            default : begin
                alu_ctrl = 'b010;
            end
        endcase
    end    

endmodule