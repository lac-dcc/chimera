`timescale 1ns / 1ps


module TB_ShiftReg;
    reg clk;
    reg [7:0] x;
    
    wire [7:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16;
    
    ShiftReg uut(.clk(clk), .x(x), .o1(o1), .o2(o2), .o3(o3), .o4(o4), .o5(o5), .o6(o6), .o7(o7), .o8(o8),
         .o9(o9), .o10(o10), .o11(o11), .o12(o12), .o13(o13), .o14(o14), .o15(o15), .o16(o16));
     
     always #5 clk = ~clk;
     
     integer input_File;
         
     initial begin
         clk = 0;
         input_File=$fopen("image.txt","r");  
     end
     
     always @ (posedge clk)
     begin
 
         $fscanf(input_File,"%d\n",x);
         if($feof(input_File))
         begin
             $fclose(input_File);
             $finish;
         end
     end
       

endmodule
