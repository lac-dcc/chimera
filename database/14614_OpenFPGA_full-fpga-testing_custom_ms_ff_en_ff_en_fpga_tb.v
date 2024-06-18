// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module ff_en_tb();

    reg clock, rst;
    reg [9:0] d_in;
    reg d_en; 
    wire [9:0] d_out;

    wire rdy;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
        
        d_in = 10'b0;
        d_en = 1'b0;

        wait ( rdy == 1'b1 )
        #10
        begin
            d_in = 10'h3ff;
            d_en = 1'b1;
        end

        #20
        d_in = 10'h0;
        d_en = 1'b0;

        #20
        d_in = 10'h155;
        d_en = 1'b1;

        #20
        d_in = 10'h288;
        d_en = 1'b0;

        #20
        d_in = 10'h288;
        d_en = 1'b1;

        #20
        d_in = 10'h0;
        d_en = 1'b1;

        #40
        $display($time, " << Simulation Complete >>");
        $finish;
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, d_in = %h, d_en = %b, d_out = %h", 
                           clock,      rst,      d_in,      d_en,      d_out);
    end

    initial
    begin
        clock = 1'b1;
        rst = 1'b1;
        #20 rst = 1'b0;
    end

    always
    begin
        #10 clock = ~clock;
    end

    // ff_en DUT
    ff_en dut ( .d_in(d_in),
                     .d_out(d_out),
                     .d_en(d_en),
                     .clock(clock),
                     .rst(rst),
                     .rdy(rdy)
                   );

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module ff_en_tb();

    reg clock, rst;
    reg [9:0] d_in;
    reg d_en; 
    wire [9:0] d_out;

    wire rdy;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
        
        d_in = 10'b0;
        d_en = 1'b0;

        wait ( rdy == 1'b1 )
        #10
        begin
            d_in = 10'h3ff;
            d_en = 1'b1;
        end

        #20
        d_in = 10'h0;
        d_en = 1'b0;

        #20
        d_in = 10'h155;
        d_en = 1'b1;

        #20
        d_in = 10'h288;
        d_en = 1'b0;

        #20
        d_in = 10'h288;
        d_en = 1'b1;

        #20
        d_in = 10'h0;
        d_en = 1'b1;

        #40
        $display($time, " << Simulation Complete >>");
        $finish;
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, d_in = %h, d_en = %b, d_out = %h", 
                           clock,      rst,      d_in,      d_en,      d_out);
    end

    initial
    begin
        clock = 1'b1;
        rst = 1'b1;
        #20 rst = 1'b0;
    end

    always
    begin
        #10 clock = ~clock;
    end

    // ff_en DUT
    ff_en dut ( .d_in(d_in),
                     .d_out(d_out),
                     .d_en(d_en),
                     .clock(clock),
                     .rst(rst),
                     .rdy(rdy)
                   );

endmodule
