// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_IF_ID_REG(
    input pcsrcD,
    input stallD,
    input clk,
    input[31:0] instr, pcplus4,
    output reg[31:0] instrD, pcplus4D);

    always@(posedge clk)begin
        if(pcsrcD==1'b1) begin
            instrD <= 0;
            pcplus4D <= 0;
        end 
        else begin
            case(stallD)
                1'bx: begin
                    instrD <= instr;
                    pcplus4D <= pcplus4;
                    if(instrD!=8'hx)
                        $display("Instruction %h is in ID stage", instrD);
                end
                1'b0: begin
                    instrD <= instr;
                    pcplus4D <= pcplus4;
                    if(instrD!=8'hx)
                        $display("Instruction %h is in ID stage", instrD);
                end
            endcase
        end
    end
endmodule