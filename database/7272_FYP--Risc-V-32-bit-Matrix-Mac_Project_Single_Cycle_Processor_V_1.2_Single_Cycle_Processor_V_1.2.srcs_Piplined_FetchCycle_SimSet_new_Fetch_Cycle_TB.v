// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0



module Fetch_Cycle_Testbench();
    
    //decalreing I/o's
    reg clk = 0,rst,PCSrcE, Branch;
    reg [31:0] PCTargetE;
    reg [31:0] ALU_Out,Offset;
    
    wire [31:0] InstrD, PCD, PCPlus4D;
    
    
    
    
    Fetch_Cycle dut(
            .clk(clk), 
            .rst(rst), 
            .Branch(Branch),
            .ALU_Out(ALU_Out), 
            .Offset(Offset),
            .PCSrcE(PCSrcE), 
            .PCTargetE(PCTargetE), 
            .InstrD(InstrD), 
            .PCD(PCD), 
            .PCPlus4D(PCPlus4D)
      );
  
    
    
    
    
    always begin
        clk = ~clk;
        #50;
    end
    
    //providing stimulus
    initial begin
        rst         <= 1'b0; //active at high
        #200;    
        rst         <= 1'b1;
        PCSrcE      <= 1'b0;
        PCTargetE   <= 32'h00000000;
        Branch      <= 1'b0;
        ALU_Out     <= 32'h00000000;
        Offset      <= 32'h00000000;
        #500;
        $finish;
    end
    
    
    

    /*initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end*/







endmodule