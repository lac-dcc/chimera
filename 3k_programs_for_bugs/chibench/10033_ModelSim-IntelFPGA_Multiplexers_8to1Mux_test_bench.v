// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//Test Bench for 8:1 Mux

module TB_8_to_1();
wire Y; reg [7:0]I; reg S2, S1, S0;

//triggering the Test Bench for Structural Modelling
mux_8_to_1_str trigger_structuralModelling(Y, I, S2, S1, S0);

initial
begin

//set sample inputs for I
I = 8'b10011100;

//passing inputs for select lines
S2 = 1'b0; S1 = 1'b0; S0 = 1'b0;
#200;
S2 = 1'b0; S1 = 1'b0; S0 = 1'b1;
#200;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b0;
#200;
S2 = 1'b0; S1 = 1'b1; S0 = 1'b1;
#200;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b0;
#200;
S2 = 1'b1; S1 = 1'b0; S0 = 1'b1;
#200;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b0;
#200;
S2 = 1'b1; S1 = 1'b1; S0 = 1'b1;
end
endmodule