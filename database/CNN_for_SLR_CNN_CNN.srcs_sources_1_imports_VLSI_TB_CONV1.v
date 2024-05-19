// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2018 00:15:13
// Design Name: 
// Module Name: TB_CONV1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TB_CONV1;
    reg clk;
    reg [7:0] R,G,B;
    reg reset;
    
    wire signed [21:0] y;
    wire [1:0] state;
    wire [6:0] count;
    
    CONV1 uut( .clk(clk), .reset(reset), .R(R), .G(G), .B(B), .y(y), .states(state), .count(count));
    
    always #5 clk = ~clk;
         
    integer image_R,image_G,image_B;
    integer output_File;
    integer filter_num = 0; //Filter Number (0 to 7)
         
     initial begin
         clk = 0;
         reset = 0;
         image_R=$fopen("image_R.txt","r");
         image_G=$fopen("image_G.txt","r");
         image_B=$fopen("image_B.txt","r");
         output_File=$fopen("convimage.txt","w");
         #400000;
         $finish;
     end
     
     always @ (posedge clk)
     begin
        $fwrite(output_File,"%d\n",y);
        if( (state == 1) && ( count < 64 ))
        begin
             $fscanf(image_R,"%d\n",R);
             $fscanf(image_G,"%d\n",G);
             $fscanf(image_B,"%d\n",B);
        end
         if($feof(image_R)&& $feof(image_G)&& $feof(image_B) && (filter_num != 7))
         begin
            $fclose(image_R);$fclose(image_G);$fclose(image_B);
            filter_num = filter_num + 1;
            image_R=$fopen("image_R.txt","r");
            image_G=$fopen("image_G.txt","r");
            image_B=$fopen("image_B.txt","r");
         end else if($feof(image_R)&& $feof(image_G)&& $feof(image_B) && (filter_num == 7))
         begin
            $fclose(image_R);$fclose(image_G);$fclose(image_B);
         end
         
     end
endmodule
