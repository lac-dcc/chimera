`default_nettype none
`include "tests/top_tb_header.vh"
module test;
    `include "tests/localparams.vh"


    integer i, j;

    reg [data_width-1:0] sample = 0;

    wire [data_width-1:0] d_out;
    reg [data_width-1:0] d_in = 0;
    reg w_en = 0;
    reg r_en = 0;


    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        for (i = 0 ; i < freq_bins ; i = i + 1) begin
            $dumpvars(1, top_0.freq_bram_0.ram[i]);
            $dumpvars(2, top_0.sdft_0.frequency_bins_real[i]);
            $dumpvars(3, top_0.sdft_0.frequency_bins_imag[i]);
        end

        while(top_0.read_cycles < freq_bins * 2) begin
            for (i = 0; i < 2; i = i + 1) begin
                for (j = 0; j < 3; j = j + 1) begin
                    sample <= sample_low;
                    wait(top_0.state == STATE_WAIT_START);
                    wait(top_0.state == STATE_PROCESS);
                end
                for (j = 0; j < 3; j = j + 1) begin
                    sample <= sample_high;
                    wait(top_0.state == STATE_WAIT_START);
                    wait(top_0.state == STATE_PROCESS);
                end
            end
        end
        $display("fft cycles: %d", top_0.sdft_0.cycles);

        $finish;
    end

    // clock
    reg clk = 0;
    always #1 clk = !clk;

    top top_0(.clk(clk), .adc(sample));

endmodule

