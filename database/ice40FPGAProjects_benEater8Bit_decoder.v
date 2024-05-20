// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

module decoder (
    //INPUTS
    input wire [7:0] insn,
    input clk,
    input rst,

    //OUTPUTS
    output reg hlt,
    output reg mi,
    output reg ri,
    output reg ro,
    output reg io,
    output reg ii,
    output reg ai,
    output reg ao,
    output reg sumo,
    output reg sub,
    output reg bi,
    output reg oi,
    output reg ce, 
    output reg co,
    output reg j );

reg [2:0] microClk = 0;
wire [3:0] opcode = insn[7:4]; //grab the opcode

/* make a microcode clock that counts from
0 to 5 and then resets to know which microcode instruction
we're on */
always @(negedge clk or posedge rst) begin


    {hlt, mi, ri, ro, io, ii, ai, ao, sumo, sub, bi, oi, ce, co} = 1'b0;

    if(rst == 1'b1) begin
        microClk = 3'b000;
        mi = 1; co = 1;
    end else begin
        microClk = microClk + 1;
        case (microClk)
            3'b001: begin
                ro = 1; ii = 1; ce = 1;
            end
            3'b010: begin
                case (opcode)
                    4'b0001: begin
                        mi = 1; io = 1;
                    end
                    4'b0010: begin
                        mi = 1; io = 1;
                    end
                    4'b1110: begin
                        ao = 1; oi = 1;
                    end
                    4'b1111: begin
                        hlt = 1;
                    end
                endcase
            end
            3'b011: begin
                case (opcode)
                    4'b0001: begin
                        ro = 1; ai = 1;
                    end
                    4'b0010: begin
                        ro = 1; bi = 1;
                    end
                endcase
            end
            3'b100: begin
                case (opcode)
                    4'b0010: begin
                        ai = 1; sumo = 1;
                    end
                endcase
            end
            3'b101: begin
                microClk = 3'b000;
                mi = 1; co = 1;
            end
        endcase
    end   
end
endmodule