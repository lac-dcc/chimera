// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input           CLK,
    output  [7:0]   LED
);

    reg [27:0] counter;

    // Increment counter on rising edge of clock
    always @(posedge CLK) begin
        counter <= counter + 1;
    end

    // Assign LED register to upper 8 bits of counter register
    assign LED = ~counter[27:19];

endmodule
