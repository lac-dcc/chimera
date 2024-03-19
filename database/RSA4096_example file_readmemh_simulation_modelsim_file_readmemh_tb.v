module file_readmemh_tb();
	reg clk;
	reg addr;
	wire [19:0] data2;
	
	reg [31:0] data [127:0];
	integer i;
	
	file_readmemh tb(
	   .clk(clk), .addr(addr), .data2(data2)
	);
	
initial $readmemh("n.txt", data);
/*read and display the values from the text file on screen*/ 
initial begin
        $display("ndata:");
        for (i=0; i < 4; i=i+1)
        $display("%d:%h",i,data[i]);
end     

	initial begin
		addr = 0;
		clk = 0;
		#6000  $stop;
	end
	
	always begin
	   #50 clk = ~clk;
	end

endmodule
	
	