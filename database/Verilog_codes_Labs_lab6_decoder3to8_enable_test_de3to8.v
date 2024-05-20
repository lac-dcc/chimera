// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;
    reg en;
    reg in0, in1, in2;
    
    wire out0, out1, out2, out3, out4, out5, out6, out7;
    decoder_3to8 dut (
        .en(en),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .out4(out4),
        .out5(out5),
        .out6(out6),
        .out7(out7)
    );
    
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);
        $display("Testing 3:8 Decoder with Enable");
        $display("Inputs  | Outputs");    
        $monitor("%b %b %b %b | %b %b %b %b %b %b %b %b ",en,in2,in1,in0,out7,out6,out5,out4,out3,out2,out1,out0);

        en = 1;in0 = 0;in1 = 0;in2 = 0;
        #10;
        
        en = 1;in0 = 1;in1 = 0;in2 = 0;
        #10;
        
        en = 1;in0 = 1;in1 = 1;in2 = 1;
        #10;
        
        en = 0;in0 = 1;in1 = 1;in2 = 1;
        #10;
        $finish;
    end
endmodule