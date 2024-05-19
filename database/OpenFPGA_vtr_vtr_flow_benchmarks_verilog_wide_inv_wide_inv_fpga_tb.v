// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

`timescale 1ns/100ps

module wide_inv_tb();

    reg clock, rst;
    reg [31:0] d_in; 
    wire [31:0] d_out;
    wire rdy;

    initial
    begin
        $display($time, " << Starting the Simulation >>");
        
        d_in = 32'b0;

        wait( rdy == 1'b1 )
            begin
                d_in = 32'b0;
            end

        #20
        d_in = 32'hffffffff;

        #20
        d_in = 32'hffff0000;

        #20
        d_in = 32'h0000ffff;

        #20
        d_in = 32'h55555555;

        #20
        d_in = 32'haaaaaaaa;

        #20
        d_in = 32'h11111111;

        #20
        d_in = 32'h22222222;

        #20
        d_in = 32'h44444444;

        #20
        d_in = 32'h88888888;

        #20
        d_in = 32'h00000000;

        #20
        $display($time, " << Simulation Complete >>");
        $finish;
    end

    initial
    begin
        $monitor($time, ", clock = %b, rst = %b, d_in = %h, d_out = %h", 
                         clock,      rst,      d_in,      d_out);
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

    // wide_inv DUT
    wide_inv dut ( .d_in(d_in),
                     .d_out(d_out),
                     .clock(clock),
                     .rst(rst),
                     .rdy(rdy)
                   );

endmodule
