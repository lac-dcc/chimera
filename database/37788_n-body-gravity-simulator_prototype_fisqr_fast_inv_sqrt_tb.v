// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

`timescale 1ns / 1ps

module fast_inv_sqrt_tb();

reg clk;
reg [26:0] data_in;
reg rst;


wire [26:0] data_out;


reg [5:0] input_count;

integer f1,f2,file_res,count = 0;

fast_inv_sqrt DUT(clk,rst,data_in,data_out);


initial
begin
	forever #5 clk = !clk;
end

//always @(posedge clk or negedge rst)
//begin
//	if(rst)
//		input_count <= input_count-'d1;
//end

   initial
     begin
        f1=$fopen("module_output.txt","w");
        f2=$fopen("float.txt","r");
        
        clk = 0;
        rst = 0;
        
        #2 rst = 1;
        
	      while(!$feof(f2))
	        begin
		         file_res = $fscanf(f2,"%b\n",data_in);
		         #10;
	        end
	      #40;
        
        if ($feof(f2))
          begin
	           $fclose(f2);
	           $finish;
          end
        //#2000 $finish ;
     end
   
   always @(posedge clk)
     begin
	      $fwrite(f1,"%b\n",data_out);
	      
     end

endmodule      
