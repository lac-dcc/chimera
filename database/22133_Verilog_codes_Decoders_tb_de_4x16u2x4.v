// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tbdecoder_4to16;

  reg in0, in1,in2,in3;
  wire out0, out1, out2, out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;

  decoder_4to16 uut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3),

    .out4(out4),
    .out5(out5),
    .out6(out6),
    .out7(out7),

    .out8(out8),
    .out9(out9),
    .out10(out10),
    .out11(out11),

    .out12(out12),
    .out13(out13),
    .out14(out14),
    .out15(out15)
  );

  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(1);
    $display("Testing 4:16 Decoder");
    $display("Inputs | Outputs");
    $monitor("%b %b %b %b | %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",in3,in2,in1,in0,out15,out14,out13,out12,out11,out10,out9,out8,out7,out6,out5,out4,out3,out2,out1,out0);

    in0 = 0; in1= 0; in2 = 0; in3 = 0;
    #10
    
    in0 = 1; in1= 1; in2 = 1; in3 = 1;
    #10
    
    in0 = 0; in1= 0; in2 = 0; in3 = 1;
    #10    

    $finish;
  end

endmodule