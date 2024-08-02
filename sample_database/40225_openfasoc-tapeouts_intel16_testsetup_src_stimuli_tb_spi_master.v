// This program was cloned from: https://github.com/idea-fasoc/openfasoc-tapeouts
// License: Apache License 2.0

module tb;

    localparam CLK_PERIOD       = 100;

    reg     clk_i;
    reg     rst_i;
    reg     sw_start_i;
    reg     sw_fetch_i;
    wire    sw_start_o;
    wire    sw_fetch_o;
    wire    start;
    wire    done;
    wire    reset;
    wire    fetch0;
    wire    fetch1;
    wire    spi_sclk;
    wire    spi_sdo;
    wire    spi_cs;

    spi_master u_spi_master (
        .*
    );

    initial clk_i = 0;
    initial rst_i = 1;
    always #(CLK_PERIOD/2.0) clk_i = ~clk_i;

    initial begin
        sw_start_i = 0;
        sw_fetch_i = 0;
        
        @(negedge clk_i)
        rst_i = 0;
        sw_start_i  = 1;

        wait (done);
        #(CLK_PERIOD);

        @(negedge clk_i)
        sw_fetch_i  = 1;

        wait (fetch0 && fetch1)
        #(CLK_PERIOD);

        $display("%c[1;32m",27);
        $display("SUCCESS\n");
        $display("%c[0m",27);

	    $finish;
    end

endmodule