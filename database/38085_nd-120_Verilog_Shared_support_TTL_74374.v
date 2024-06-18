// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// 74LS374
// Octal Transparent EDGE-TRIGGERED FLIP-FLOPS with 3-state outputs
// Documentation: https://www.ti.com/lit/ds/symlink/sn54ls373-sp.pdf

module TTL_74374 (
    input wire [7:0] D,   // Data inputs
    input wire CK,        // Clock input (Latching on rising edge of CK)
    input wire OE_n,      // Output Enable (active low)
    output wire [7:0] Q   // Outputs
);
    reg [7:0] Q_reg;  // Internal register
   
    // Latch operation on rising edge of CK
    always @(posedge CK) begin
        Q_reg <= D;  // Latch data on rising edge of CK
    end

    // Output control
    // When OC_n is low (active), outputs reflect the latched data
    // When OC_n is high, outputs are in high-impedance state
    assign Q = OE_n ? 8'b0 : Q_reg;
    

endmodule
