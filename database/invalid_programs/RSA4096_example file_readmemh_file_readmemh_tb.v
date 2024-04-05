module file_readmemh_tb();
	reg clk;
	reg addr;
	wire [19:0] data2;
	
	initial begin
		addr = 0;
		clk = 0;
		#6000  $stop;
	end
	
	always begin
	   #50 t_reg_clk = ~t_reg_clk;
	end

endmodule
	
	