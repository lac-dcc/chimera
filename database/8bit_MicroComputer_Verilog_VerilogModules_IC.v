`timescale 1ns/1ps
module IC(input clk, input enable, input [3:0] Instruction, output reg [14:0] ctrl_wrd);
wire CLK;
//reg [3:0] Instruction;
assign CLK = (~clk & enable);
reg [2:0] Inst_count;
reg reset_in;

initial begin
    Inst_count <= 3'b111;
    reset_in <= 1'b0;
end
always @ (posedge CLK)
    begin
        Inst_count <= reset_in ? 3'b000 : Inst_count+1;
        reset_in <= 1'b0;
        case(Inst_count)//HLT, MI, RI, RO, IO, II, AI, AO, SO, SU, BI, OI, CE, CO, J;
            3'b000: ctrl_wrd <= 15'b010000000000010;
            3'b001: ctrl_wrd <= 15'b000101000000100;
            3'b010: begin
                    case(Instruction)
                    4'b0001: ctrl_wrd <= 15'b010010000000000; // LDA
                    4'b0010: ctrl_wrd <= 15'b010010000000000; //ADD
                    4'b0011: ctrl_wrd <= 15'b010010000000000;  //SUBT
                    4'b1110: ctrl_wrd <= 15'b000000010001000; // OUT
                    4'b0100: ctrl_wrd <= 15'b000010000000001; // JMP
                    4'b1111: ctrl_wrd <= 15'b100000000000000; // HLT
                    default: ctrl_wrd <= 15'b000000000000000;
                    endcase 
                    end      
            3'b011: begin
                    case(Instruction)
                    4'b0001: ctrl_wrd <= 15'b000100100000000; // LDA
                    4'b0010: ctrl_wrd <= 15'b000100000010000; //ADD
                    4'b0011: ctrl_wrd <= 15'b000100000010000; //SUBT
                    4'b1110: ctrl_wrd <= 15'b000000000000000; // OUT
                    4'b0100: ctrl_wrd <= 15'b000000000000000; // JMP
                    4'b1111: ctrl_wrd <= 15'b000000000000000; // HLT
                    default: ctrl_wrd <= 15'b000000000000000;
                    endcase             
                    end
            3'b100: begin
                    case(Instruction)
                    4'b0001: ctrl_wrd <= 15'b000000000000000; // LDA done
                    4'b0010: ctrl_wrd <= 15'b000000101000000; //ADD
                    4'b0011: ctrl_wrd <= 15'b000000101100000; //SUBT
                    4'b1110: ctrl_wrd <= 15'b000000000000000; // OUT
                    4'b0100: ctrl_wrd <= 15'b000000000000000; // JMP
                    4'b1111: ctrl_wrd <= 15'b000000000000000; // HLT
                    default: ctrl_wrd <= 15'b000000000000000;
                    endcase 
                    reset_in <= 1'b1; // Have some doubt here..... Maybe this part can go wrong .....
                    end                  
            default: ctrl_wrd <= 15'b000000000000000;
        endcase                          
    end


endmodule