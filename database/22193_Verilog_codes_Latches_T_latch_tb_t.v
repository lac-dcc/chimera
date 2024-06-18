// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_t_latch;
    reg t, reset;
    wire q;
    t_latch dut(.t(t),.reset(reset),.q(q));

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_t_latch);

        $monitor("Time=%0t, t=%b, reset=%b, q=%b", $time, t, reset, q);
        reset = 1'b1;
        #10 reset = 1'b0;
        #5 t = 1'b1; 
        #5 t = 1'b0;
        #5 t = 1'b1;
        #5 t = 1'b0;
        #5 t = 1'b1;
        #5 t = 1'b0;
        #5 $finish;
    end

endmodule
