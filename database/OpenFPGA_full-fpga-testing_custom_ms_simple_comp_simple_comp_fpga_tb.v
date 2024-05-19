// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module simple_comp_tb();

    reg clock, rst;
    reg [15:0] a_in, b_in, c_in;
    wire [15:0] d_out;
    wire rdy;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
       
        a_in = 16'h0;
        b_in = 16'h0;
        c_in = 16'b0;

        wait ( rdy == 1'b1 )
        begin
            a_in = 16'h0;
            b_in = 16'h0;
            c_in = 16'h0;
        end

        #30
        a_in = 16'hfff;
        b_in = 16'hfff;
        c_in = 16'hfff;

        #20
        a_in = 16'h0;
        b_in = 16'h0;

        #20
        a_in = 16'h666;
        b_in = 16'h666;
        c_in = 16'h666;

        #100
        $display($time, " << Simulation Complete >>");
        $finish;
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, a_in = %h, b_in = %h, c_in = %h, d_out = %h",
                           clock,      rst,      a_in, b_in, c_in, d_out);
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

    // simple_comp DUT
    simple_comp dut ( .a_in(a_in),
                      .b_in(b_in),
                      .c_in(c_in),
                      .d_out(d_out),
                      .clock(clock),
                      .rst(rst),
                      .rdy(rdy)
                    );

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module simple_comp_tb();

    reg clock, rst;
    reg [15:0] a_in, b_in, c_in;
    wire [15:0] d_out;
    wire rdy;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
       
        a_in = 16'h0;
        b_in = 16'h0;
        c_in = 16'b0;

        wait ( rdy == 1'b1 )
        begin
            a_in = 16'h0;
            b_in = 16'h0;
            c_in = 16'h0;
        end

        #30
        a_in = 16'hfff;
        b_in = 16'hfff;
        c_in = 16'hfff;

        #20
        a_in = 16'h0;
        b_in = 16'h0;

        #20
        a_in = 16'h666;
        b_in = 16'h666;
        c_in = 16'h666;

        #100
        $display($time, " << Simulation Complete >>");
        $finish;
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, a_in = %h, b_in = %h, c_in = %h, d_out = %h",
                           clock,      rst,      a_in, b_in, c_in, d_out);
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

    // simple_comp DUT
    simple_comp dut ( .a_in(a_in),
                      .b_in(b_in),
                      .c_in(c_in),
                      .d_out(d_out),
                      .clock(clock),
                      .rst(rst),
                      .rdy(rdy)
                    );

endmodule
