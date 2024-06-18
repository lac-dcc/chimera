// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0



module Single_Cycle_Top_Testbench();
    reg clk = 1'b1,rst;
    
    
    Single_Cycle_Top uut(
        .clk(clk),
        .rst(rst),
        .OUT()
        //.memoryinstr()
    );
    
    
    /*initial begin 
        $dumpfile("Single Cycle.vcd");
        $dumbvars(0);    
    end
    */

    //testing the load word instruction
    //   rs1, im(rd) =      im       rs1  f3   rd     op      hexa
    //lw x6, -4(x9)  = 11111111100  01001 010 00110 0000011 = FFC4A303 
        
    always
    begin

        clk = ~clk;
        #50;
    end

    initial
   begin
          rst = 1'b0;
          #100;
          rst = 1'b1;
          #2000;
          //  $finish; 
    end




endmodule









