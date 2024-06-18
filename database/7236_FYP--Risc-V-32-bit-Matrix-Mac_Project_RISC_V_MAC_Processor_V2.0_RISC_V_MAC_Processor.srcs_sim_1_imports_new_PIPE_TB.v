// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0


module Pipelined_Top_Testbench();
   
   reg clk=0, rst;
   reg button = 0;
    Pipeline_top uut(
        .clk_100mhz(clk), 
        .rst(rst), 
        .clk_light_display(), 
        .button(button),
        .anode(), 
        .SSD()
    );
       always #5 clk = ~clk;
       always #1 button = ~button;
           
       initial begin
           rst <= 1'b0;
           #20;
           rst <= 1'b1;
           #2250                                                                       
           $finish;    
       end

endmodule