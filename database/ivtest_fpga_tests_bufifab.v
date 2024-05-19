// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bufifab (output Out0, output Out1, input I, input E);

   bufif0 (Out0, I, E);
   bufif1 (Out1, I, E);

endmodule
