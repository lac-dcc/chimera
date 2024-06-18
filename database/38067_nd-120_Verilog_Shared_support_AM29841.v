// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// AM29841
// Bus Driver 10 bit (D-Latch) with 3-state output
// Documentation: https://www.alldatasheet.com/datasheet-pdf/pdf/107079/AMD/AM29841.html

module AM29841 (
    input wire [9:0] D,   // 10 Bit Data inputs
    input wire LE,         // Latch Enable
    input wire OE_n,      // Output Enable
    output wire [9:0] Y   // Outputs
);

    reg [9:0] Q_Latch;  // Internal latch

    // Latch the data as long as LE is high
    always @(*) begin
        if (LE) begin
            Q_Latch = D; // Transparent mode: Internal latch follows input   
        end
    end

    // Output control
    // When OC_n is low (active), outputs reflect the latched data
    // When OC_n is high, outputs are in high-impedance state (zero output = high-impedance state, will be "or'ed" on higher level module)
    assign Y = OE_n ?  10'b0 : Q_Latch;

endmodule
