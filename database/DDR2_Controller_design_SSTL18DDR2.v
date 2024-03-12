//----------------------------------
//  EE577b SSTL18 Simulation Model
//----------------------------------
module SSTL18DDR2 (PAD,Z,A,RI,TS);

   inout   PAD; // I/O PAD PIN
   output  Z;   // Recieved data from PAD if RI is high
   input   A;   // Data to PAD if TS is high 
   input   RI;  // Receiver Inhibit 
   input   TS;  // Driver Tristate Control

   bufif1 b1 (PAD,A,TS);
   and    a4 (Z,PAD,RI);

endmodule // SSTL18DDR2

