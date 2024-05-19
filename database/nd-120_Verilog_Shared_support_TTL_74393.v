// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// 74393
// Dual 4-Stage Binary Ripple Counter
// Implementing just one of the clocks. Instantiate two modules to get both
// Documentation: https://www.onsemi.com/pdf/datasheet/mc74hc393a-d.pdf

module TTL_74393 (
    input CLK_n,     // Clock input (Count on negative edge)
    input RESET,     // Asynchronous clear (active high) 

    output QA,
    output QB,
    output QC,
    output QD
);

reg [3:0] counter1 = 4'b0000;


// First 4-bit counter
always @(negedge CLK_n or posedge RESET) begin
    if (RESET)
        counter1 <= 4'b0000;
    else
        counter1 <= counter1 + 1;
end

assign QA = counter1[0];
assign QB = counter1[1];
assign QC = counter1[2];
assign QD = counter1[3];

endmodule
