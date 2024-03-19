/*****************************************************************************************************/
/*   Hash computation module testbench        					       	             */
/*   Aishwarya Nagarajan, UW-Madison, ERCBench Researcher                    			     */
/*   Inputs: clk, rst, k,w,a_in,b_in,c_in,d_in,e_in,f_in,g_in,h-in (32bits)	                     */
/*   Outputs: a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out (32 bits)                     	     */
/*   File I/O is used in this module. We write the output to a file and use the diff command to      */
/*   determine if the output values are as expected.	                                             */
/*****************************************************************************************************/ 

module t_mainloop ();
   
   //declaring input and output regs and wires
   reg [31:0] k,w_ml,a_in,b_in,c_in,d_in,e_in,f_in,g_in,h_in;
   wire [31:0] a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out,s0,s1,t1,t2,ch,maj;
   reg clk, rst; 
   
   //creating clock 
   initial clk=1'b0;
   always @(clk) clk<= #5 ~clk;

   //creating integer file descriptor for the output file
   integer hashout; 
   
   //instatiating UUT
   main_loop M1 (clk, rst, k,w_ml,a_in,b_in,c_in,d_in,e_in,f_in,g_in,h_in, a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out); 
	
   //supplying test vectors
   initial begin

       rst = 1'b1;
       #10 rst = 1'b0;
       k = 32'hc67178f2;  
       w_ml = 32'h12b1edeb; 
       a_in = 32'hd39a2165; c_in = 32'hb85e2ce9; d_in = 32'hb6ae8fff; e_in = 32'hfb121210; f_in = 32'h948d25b6; g_in = 32'h961f4894; h_in = 32'hb21bad3d;  b_in= 32'h04d24d6c;
       hashout = $fopen("hashout.txt");
       $fstrobe(hashout,"%h %h %h %h %h %h %h %h",a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out);
              
   end

   //force end of simulation
   initial begin
       #30 $stop;
   end
   
 endmodule




