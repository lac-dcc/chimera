// This program was cloned from: https://github.com/mattvenn/tt07-twin-tee-opamp-osc
// License: Apache License 2.0

`default_nettype none
module osc_counter (
    input wire n_rst,
    input wire clk,               // input from the oscillator
    output reg [7:0] count        // 8 bit out to the leds
    );

    reg rst;
    assign count = counter[19:12]; // top 8 bits of the counter
    // 20 bit counter, 6M oscillator should roll the top bit once every ~6 seconds
    reg [19:0] counter;

    initial begin
        $dumpfile ("osc_counter.vcd");
        $dumpvars (0, osc_counter);
    end

    // reset handling
    always @(posedge clk or posedge n_rst) begin
        if(n_rst)
            rst <= 1'b0;
        else
            rst <= 1'b1;
    end

    // counter
    always @(posedge clk) begin
        if(rst) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
