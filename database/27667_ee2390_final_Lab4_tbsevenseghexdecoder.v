// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// tbsevenseghexdecoder.v
// Verilog test fixture for EE 2390 Lab #4
// To test just the seven segment decoder module.
`timescale 1ns / 1ps
module tbsevenseghexdecoder;
    reg [3:0] HexVal;
    wire [0:6] Seg;
    // Instantiate the Unit Under Test (UUT)
    sevenseghexdecoder uut (.Seg(Seg), .HexVal(HexVal));
    integer iHexVal;
    initial 
    begin
        $dumpfile("tbsevenseghexdecoder.vcd");
        $dumpvars(0,tbsevenseghexdecoder);
        $display("\tHexVal\t | Seg");
        $display("--------------------------");
        $monitor("\t%2h\t   %7b",HexVal,Seg);
        HexVal=0;
        for(iHexVal=1; iHexVal<16; iHexVal=iHexVal+1)
        begin
            #100 HexVal=iHexVal;
        end
        #100 $finish;
    end
endmodule

