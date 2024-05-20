// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module accelerator_tb;
   reg i_clk, i_rst;
   reg [31:0] i_b1_x, i_b1_y;
   reg [31:0] i_b2_x, i_b2_y;
   reg [31:0] i_m_b2;
   reg [31:0] i_a_b1_x, i_a_b1_y;
	
   wire [31:0] o_a_b1_x, o_a_b1_y;
   integer     i = 0;
   
 //current computed acceleration for body 1 in x and y directions


       accelerator dut (
			.i_clk   (i_clk),
			.i_rst   (i_rst),
			.i_b1_x  (i_b1_x),
			.i_b1_y  (i_b1_y),
			.i_b2_x  (i_b2_x),
			.i_b2_y  (i_b2_y),
			.i_m_b2  (i_m_b2),
			.i_a_b1_x(i_a_b1_x),
			.i_a_b1_y(i_a_b1_y),
			.o_a_b1_x(o_a_b1_x),
			.o_a_b1_y(o_a_b1_y)
			);

always @(i_clk)
begin
	#5 i_clk <= ~i_clk;
end


   initial
     begin
	for (i = 0 ; i <= 14; i = i + 1)
	  begin
	     $dumpvars(0,dut.r_mass_pipe_reg[i]);
	  end
	$dumpvars;
	i_rst    <= 'b1;
	i_clk=1'b1;
	
	
	//              
	//i_b1_x   <= 32'h40E00000;
	//i_b1_y   <= 32'h40E00000;
	i_a_b1_x <= 32'b00111100001000001101001010100000;  //32'b00111100001000001101000000010101
	i_a_b1_y <= 32'b00000000000000000000000000000000;

	#5 i_rst=1'b0;
	#9 i_rst=1'b1;
//	@(posedge i_clk) ;
	
	@(posedge i_clk)
	  begin
	i_b1_x   <= 32'h40E00000;
	i_b1_y   <= 32'h40E00000;
	i_b2_x   <= 32'h3F800000;
	i_b2_y   <= 32'h3F800000;
	i_m_b2   <= 32'h3F800000;
	  end
	@(posedge i_clk) ;
	//#10;
	// i_b1_x   <= 32'h40E0BBBB;
	// i_b1_y   <= 32'h40E0CCCC;
	// i_b2_x   <= 32'h3F800000;
	// i_b2_y   <= 32'h3F800000;
	// i_m_b2   <= 32'h3F800000;
	
	// #10;
 
	i_b1_x   <= 32'hX;
	i_b1_y   <= 32'hX;
	i_b2_x   <= 32'hX;
	i_b2_y   <= 32'hX;
	i_m_b2   <= 32'hX;



	  // i_b2_x   <= 32'h40000000;
// 		 i_b2_y   <= 32'h40000000;
// 		 i_m_b2   <= 32'h40000000;
	
// #10 i_b2_x   <= 32'h40400000;
// 		 i_b2_y   <= 32'h40400000;
// 		 i_m_b2   <= 32'h40400000;	
		 

// 		 #10 i_b2_x   <= 32'h40800000;
// 		 i_b2_y   <= 32'h40800000;
// 		 i_m_b2   <= 32'h40800000;	
		 
// 		 #10 i_b2_x   <= 32'h40a00000;
// 		 i_b2_y   <= 32'h40a00000;
// 		 i_m_b2   <= 32'h40a00000;	
		 
// 		 #10 i_b2_x   <= 32'h40c00000;
// 		 i_b2_y   <= 32'h40c00000;
// 		 i_m_b2   <= 32'h40c00000;
	
		 
		 #1000 $finish;
	
	
     end

endmodule
