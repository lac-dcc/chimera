// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_d_flip_flop;

    reg d, clk, reset;
    wire q;

    d_flip_flop d_ff_inst(
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk=0;
        forever #10 clk = ~clk;  
    end 
    
    initial begin 
        $monitor("Time=%0t, d=%b, clk=%b, reset=%b, q=%b,", $time, d, clk, reset, q);
        $dumpfile("waveform.vcd");
        $dumpvars(0);
        reset=1;
        d <= 0;
        #100;
        reset=0;
        d <= 1;
        #100;
        d <= 0;
        #100;
        d <= 1;
        $finish;
    end
endmodule 