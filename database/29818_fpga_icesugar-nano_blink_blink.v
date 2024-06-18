// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input       CLK,    // 12 MHz
    output      LED
);

    reg [23:0] counter;

    always @(posedge CLK) begin
        counter <= counter + 1;
    end

    assign LED = counter[23];

endmodule
