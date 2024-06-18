// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

module immGen(instrD,immSelD,immD);
input [31:7] instrD;
input [2:0] immSelD;
output [31:0] immD;

wire [31:0] Uimm,Iimm,Jimm, Bimm,Simm,Limm;

assign Uimm={    instrD[31],   instrD[30:12], {12{1'b0}}};//U type immediate
assign Iimm={{21{instrD[31]}}, instrD[30:20]};//I type immediate
assign Simm={{21{instrD[31]}}, instrD[30:25],instrD[11:7]};//Stype immediate
assign Bimm={{20{instrD[31]}}, instrD[7], instrD[30:25],instrD[11:8],1'b0};//B type immediate
assign Jimm={ {12{instrD[31]}}, instrD[19:12], instrD[20], instrD[30:25],instrD[24:21], 1'b0 }; //jal
assign Limm={{21{instrD[31]}}, instrD[30:20]}; //L type
reg[31:0] imm;
always @(*) begin
    case(immSelD)
    3'o0 : imm <= Iimm;
    3'o1 : imm <= Uimm;
    3'o2 : imm <= Simm;
    3'o3 : imm <= Bimm;
    3'o4 : imm <= Jimm;
    3'o5 : imm <= Limm;
    default : imm <= 32'b0;
    endcase
end
assign immD = imm;

endmodule