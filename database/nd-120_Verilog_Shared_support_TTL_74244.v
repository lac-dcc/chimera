// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// 74LS244 (NONE negated outputs)
// Octal Buffers and Line Drivers With 3-State Outputs
// Documentation: https://www.ti.com/lit/ds/symlink/sn74ls244.pdf
//                https://pdf1.alldatasheet.com/datasheet-pdf/view/51057/FAIRCHILD/74244.html

/*
This device is organized as two 4-bit buffers and drivers with separate output-enable (G) inputs. 
* When G is low, the device passes data from the A inputs to the Y outputs.
* When G is high, the outputs are in the high impedance state.
*/

module TTL_74244( 
               input wire [3:0] A1,   // Data inputs (1A1-1A4)  
               input wire G1_n,       // Output Enable for A1->Y1 (active low)
               output wire [3:0] Y1,  // Data outputs (1Y1-1Y4) <= (1A1-1A4)


               input wire [3:0] A2,   // Data inputs (2A1-2A4)
               input wire G2_n,       // Output Enable (active low)               
               output wire [3:0] Y2   // Data inputs  (2Y1-2Y4) <= (2A1-2A4)
);

assign Y1 = G1_n ? 4'b0 : A1; // If G1_n is high, output is high-impedance
assign Y2 = G2_n ? 4'b0 : A2; // If G2_n is high, output is high-impedance 



endmodule