// This program was cloned from: https://github.com/mattvenn/tt06-analog-r2r-dac
// License: Apache License 2.0

`default_nettype none
module r2r_dac_control (
    input wire clk,                 // expect a 10M clock
    input wire n_rst,
    input wire ext_data,            // if this is high, then DAC data comes from ui_in[7:0]
    input wire [7:0] data,          // connect to ui_in[7:0]
    input wire load_divider,        // load value set on data to the clock divider
    output reg [7:0] r2r_out        // 8 bit out to the R2R DAC
    );

    reg rst;
    reg [7:0] divider;
    reg [15:0] counter;

    initial begin
        $dumpfile ("r2r_dac_control.vcd");
        $dumpvars (0, r2r_dac_control);
    end

    // reset handling
    always @(posedge clk or posedge n_rst) begin
        if(n_rst)
            rst <= 1'b0;
        else
            rst <= 1'b1;
    end

    // load divider
    always @(posedge clk) begin
        if(rst)
            divider <= 0;
        if(load_divider)
            divider <= data;
    end

    // counter and r2r output
    always @(posedge clk) begin
        if(rst) begin
            counter <= 0;
            r2r_out <= 0;
        end else if(ext_data)
            r2r_out <= data;
        else begin
        /* verilator lint_off WIDTHEXPAND */
            if(counter >= (divider << 8)) begin
        /* lint_on */
                counter <= 0;
                r2r_out <= r2r_out + 1;
            end else 
                counter <= counter + 1;
        end
    end

endmodule
