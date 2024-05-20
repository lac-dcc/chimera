// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tbdecoder_3to8;

  reg in0, in1,in2;
  wire out0, out1, out2, out3,out4,out5,out6,out7;

  decoder_3to8 uut (
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
    $dumpfile("decoder.vcd");
    $dumpvars(1);
    $display("Testing 3:8 Decoder");
    $display("Inputs | Outputs");
    $monitor("%b %b %b | %b %b %b %b %b %b %b %b ",in2,in1,in0,out7,out6,out5,out4,out3,out2,out1,out0);

    in0 = 0; in1= 0; in2 = 0;
    #10
    
    in0 = 1; in1= 1; in2 = 1;
    #10
    
    in0 = 0; in1= 0; in2 = 1;
    #10    
    $finish;
  end

endmodule