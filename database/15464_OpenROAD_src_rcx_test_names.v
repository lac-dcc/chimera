// This program was cloned from: https://github.com/The-OpenROAD-Project/OpenROAD
// License: BSD 3-Clause "New" or "Revised" License

module top();
   wire mid;
   
  INV_X1 \disolved_top/leaf (.ZN(mid));
  block b(.i(mid));
  
endmodule

module block(input i);

  INV_X1 \disolved_block/leaf (.A(i));
  
endmodule
