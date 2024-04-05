`default_nettype none
`include "tests/top_tb_header.vh"
module test;

    localparam data_w = 20;
    localparam addr_w = 7;
    localparam num_tests = 2 ** addr_w;
    integer i;

    wire [data_w-1:0] d_out;
    reg [data_w-1:0] d_in = 0;
    reg w_en = 0;
    reg r_en = 0;
    reg [addr_w-1:0] r_addr = 0;
    reg [addr_w-1:0] w_addr = 0;


    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        // read the data
        for(i = 0; i < num_tests; i = i + 1) begin
            r_addr <= i;
            r_en <= 1'b1;
            # 2;
            `assert("read FILE data", d_out, i);
            r_en <= 1'b0;
            # 2;
        end
        // write the data
        for(i = 0; i < num_tests; i = i + 1) begin
            w_addr <= i;
            d_in <= i;
            w_en <= 1'b1;
            # 2;
            w_en <= 1'b0;
            # 2;
        end
        // read the data
        for(i = 0; i < num_tests; i = i + 1) begin
            r_addr <= i;
            r_en <= 1'b1;
            # 2;
            `assert("out data", d_out, i);
            r_en <= 1'b0;
            # 2;
        end
        // read the data while writing from the other end, check the read data is still good
        for(i = 0; i < num_tests; i = i + 2) begin
            w_addr <= i + 1;
            r_addr <= i;
            d_in <= num_tests - i;
            w_en <= 1'b1;
            r_en <= 1'b1;
            # 2;
            `assert("read while write data", d_out, i);
            r_en <= 1'b0;
            w_en <= 1'b0;
            # 2;
        end
        // read the newly written data
        for(i = 0; i < num_tests; i = i + 2) begin
            r_addr <= i + 1;
            r_en <= 1'b1;
            # 2;
            `assert("read new data", d_out, num_tests - i);
            r_en <= 1'b0;
            # 2;
        end
        $finish;
    end

    // clock
    reg clk = 0;
    always #1 clk = !clk;

    freq_bram #(.addr_w(addr_w), .data_w(data_w)) freq_bram_0(.w_clk(clk), .r_clk(clk), .w_en(w_en), .r_en(r_en), .d_in(d_in), .d_out(d_out), .r_addr(r_addr), .w_addr(w_addr));

endmodule
