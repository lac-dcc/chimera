// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// AM29C821
// Bus Driver 10 bits. Positive edge-triggered registeres with D-type flip-flops and 3-state
//
// Documentation: https://www.digikey.com/en/products/detail/rochester-electronics-llc/AM29C821-BLA/12095382



module AM29C821 (
    input wire [9:0] D,   // 10 Bit Data inputs
    input wire CK,        // Clock input (Latching on rising edge of CK)
    input wire OE_n,      // Output Enable (active low)
    output wire [9:0] Y   // Outputs
);

    reg [9:0] Y_Latch;  // Internal latch

   
    // Latch operation on rising edge of CK
    always @(posedge CK) begin
        Y_Latch <= D;  // Latch data on rising edge of CK
    end

    // Output control
    // When OC_n is low (active), outputs reflect the latched data
    // When OC_n is high, outputs are in high-impedance state
    assign Y = (OE_n == 1'b0) ? Y_Latch : 10'b0;

endmodule
