// This program was cloned from: https://github.com/aryanmahawar205/ModelSim-IntelFPGA
// License: GNU General Public License v3.0

//test bench modelling for Half Adder
//this file can be invoked for any of the modelling by typing out its module name indicated later in the code

module TB_halfAdder;
wire sum, carry; reg A, B;

//this is the line where the test bench will be invoked for a particular modelling
//in this case we invoke it for behavioural modelling
exp_df tb_ha(sum, carry, A, B);

initial
begin
A = 1'b0; B = 1'b0;
#50;
A = 1'b0; B = 1'b1;
#50;
A = 1'b1; B = 1'b0;
#50;
A = 1'b1; B = 1'b1;

end
endmodule