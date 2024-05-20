// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module accelerator_tb;
   parameter MAX_READ = 255;
   
   reg clk, rst;
   reg [31:0] x1, y1;
   reg [31:0] x2, y2;
   reg [31:0] m2;
   reg [31:0] ia_x1, ia_y1;

   //reg [31:0] m1_t [MAX_READ:0];
   reg [31:0] m2_t [0:MAX_READ];
   reg [31:0] x1_t [0:MAX_READ];
   reg [31:0] y1_t [0:MAX_READ];
   reg [31:0] x2_t [0:MAX_READ];
   reg [31:0] y2_t [0:MAX_READ];
   reg [31:0] ia_x1_t [0:MAX_READ];
   reg [31:0] ia_y1_t [0:MAX_READ];
   
   wire [31:0] oa_x1, oa_y1;
   integer     readfile;
   integer     writefile;
   
   integer     result;
   integer     count = 0;
   integer     in_count = -1;
   integer     display_count = 0;
   
   integer     delay = 18;
   integer     upcount = -1;  // when init val 0, doesnt output address 0, goes to 1 directly, why ??
   
   accelerator dut (
		    .i_clk   (clk),
		    .i_rst   (rst),
		    .i_b1_x  (x1),
		    .i_b1_y  (y1),
		    .i_b2_x  (x2),
		    .i_b2_y  (y2),
		    .i_m_b2  (m2),
		    .i_a_b1_x(ia_x1),
		    .i_a_b1_y(ia_y1),
		    .o_a_b1_x(oa_x1),
		    .o_a_b1_y(oa_y1)
		    );

   always
     begin
	clk <= 'b1;
	#5;
	clk <= 'b0;
	#5;
     end

   // always @(posedge clk or negedge rst)
   //   begin
   // 	if (rst <= 'b1)
   // 	  begin
   // 	     if (delay)
   // 	       begin
   // 		  delay = delay - 1;
   // 	       end
   // 	     else
   // 	       begin
   // 		  //if (in_count >= 17 && in_count < 17 + count)
   // 		    begin
   // 		       $fdisplay(writefile,"%b %b",oa_x1,oa_y1);
   // 		    end
   // 	       end
   // 	  end
   //   end

   integer i = 0;
   
   initial
     begin
	
	rst <= 'b1;
	
	for (i = 0 ; i <= 14; i = i + 1)
	  begin
	     $dumpvars(0,dut.r_mass_pipe_reg[i]);
	  end
	$dumpvars;
	ia_x1 <= 32'b00111100001000001101001010100000;  //32'b00111100001000001101000000010101
	ia_y1 <= 32'b00000000000000000000000000000000;

	#5 rst <=1'b0;
	#9 rst <=1'b1;
	
	readfile = $fopen("bin.txt","r");
	writefile = $fopen("acc_rtlout.txt","w");
	
	while (!$feof(readfile))
	  begin
	     result = $fscanf(readfile,"%b %b %b %b %b %b %b\n",m2_t[count],x1_t[count],y1_t[count],x2_t[count],y2_t[count],ia_x1_t[count],ia_y1_t[count]); //  
	     //#10;
	
	     count = count + 1;
	  end
	repeat (2)
	  begin
	     @(posedge clk)
	       begin
		  ;
	       end
	  end
	while (in_count - 18 <= count)
	  begin
	     @(posedge clk)
	       begin
		  if (count >= upcount)
		    begin
		       m2 <=  m2_t[upcount];
		       x1 <=  x1_t[upcount];
		       y1 <=  y1_t[upcount];
		       x2 <=  x2_t[upcount];
		       y2 <=  y2_t[upcount];
		       if (in_count >= 19 && in_count < 19 + count)
			 begin
			    $fdisplay(writefile,"%b %b",oa_x1,oa_y1);  //$fdisplay(writefile,"%b %b",oa_x1,oa_y1);
			 end
		       ia_x1 <= ia_x1_t[in_count-16];
		       ia_y1 <= ia_y1_t[in_count-16];
		       in_count <= in_count + 1;
		       if (upcount < count)
			 begin
			    upcount <= upcount + 1;
			 end
		    end
	       end // while (count >= upcount)
	     
	  end // while (in_count - 18 <= count)
		
	#1000;
	$finish;
	
     end

endmodule
