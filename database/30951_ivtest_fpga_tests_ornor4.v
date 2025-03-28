// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module ornor4(output wire O_OR, output wire O_NOR,
	      input wire I0, I1, I2, I3);

   assign O_OR  =  | {I0, I1, I2, I3};
   assign O_NOR = ~| {I0, I1, I2, I3};

endmodule // ornor4
