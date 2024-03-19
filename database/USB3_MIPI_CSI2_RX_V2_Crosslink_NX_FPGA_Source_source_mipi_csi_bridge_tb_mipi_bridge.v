`timescale 1ns/1ns

module tb_mipi_bridge();
	reg clk;
	reg reset;
	reg mipi_clk;
	wire clk_lpp; 
	wire clk_lpn;
	wire [3:0]data_lpp;
	wire [3:0]data_lpn;
	
	wire mipi_clk_n;
	wire [3:0]mipi_data_n;
	reg  clk_lpp_r; 
	reg clk_lpn_r;
	reg [3:0]data_lpp_r;
	reg [3:0]data_lpn_r;
	
	reg [3:0]mipi_data;
	
	wire pclk;
	wire [31:0]data;
	wire fsync;
	wire lsync;
wire reset_g;
GSR 
GSR_INST (
	.GSR_N(1'b1),
	.CLK(1'b0)
);
 

assign mipi_clk_n = !mipi_clk;
assign mipi_data_n = ~mipi_data;

mipi_bridge ins1(	.reset_in(reset),
					.mipi_clk_n_in(mipi_clk_n),
					.mipi_clk_p_in(mipi_clk),
					.mipi_data_p_in(mipi_data),
					.mipi_data_n_in(mipi_data_n),


					.pclk_o(pclk), 
					.data_o(data),
					.fsync_o(fsync),
					.lsync_o(lsync),
					.frame_sync_in(!clk_lpn_r),
					.line_sync_in(data_lpn_r[0])
					);
					
	
initial begin										//genrate 90 phase clock and slow sync clock
	clk = 1'b0;
end
always begin
	#6 clk =  ~clk;
end

task send_mipi_frame;
	 reg [15:0]i= 16'd0;
	 begin
		 clk_lpp_r = 0;
		 clk_lpn_r = 0;
		 #5
		 send_mipi_clock();		 
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();		 
		 send_mipi_clock();		 
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 for (i= 16'd0; i <16'd10 ; i = i +1'd1)
		 begin
		 send_line();
         send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 #20;
		 end
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 #5
		 clk_lpp_r = 1;
		 clk_lpn_r = 1;

	 end
endtask


task send_mipi_frame12;
	 reg [15:0]i= 16'd0;
	 begin
		 clk_lpp_r = 0;
		 clk_lpn_r = 0;
		 #5
		 send_mipi_clock();		 
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();		 
		 send_mipi_clock();		 
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 for (i= 16'd0; i <16'd10 ; i = i +1'd1)
		 begin
		 send_line12();
		 #20;
		 end
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 #5
		 clk_lpp_r = 1;
		 clk_lpn_r = 1;

	 end
endtask

task send_mipi_frame14;
	 reg [15:0]i= 16'd0;
	 begin
		 clk_lpp_r = 0;
		 clk_lpn_r = 0;
		 #5
		 send_mipi_clock();		 
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();		 
		 send_mipi_clock();		 
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 for (i= 16'd0; i <16'd10 ; i = i +1'd1)
		 begin
		 send_line14();
		 #20;
		 end
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 send_mipi_clock();
		 #5
		 clk_lpp_r = 1;
		 clk_lpn_r = 1;

	 end
endtask

task send_line14;
	reg[15:0]i = 16'b0;
	begin
	

		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpp_r = 4'b0;
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpn_r = 4'b0;
		send_mipi_byte(32'hB8B8B8B8);
		send_mipi_byte(32'h2D200D00);
		for (i= 16'b0; i < 16'd120 ; i = i+1)
		begin
			send_mipi_byte(32'h00FF55AA);
			send_mipi_byte(32'h00000000);
			send_mipi_byte(32'hFF55AA00);
			send_mipi_byte(32'h000000FF);
			send_mipi_byte(32'h55AA0000);
			send_mipi_byte(32'h0000FF55);
			send_mipi_byte(32'hAA000000);
		end
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpp_r = 4'b1111;
		data_lpn_r = 4'b1111;
		
	end
endtask

task send_line12;
	reg[15:0]i = 16'b0;
	begin
	

		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpp_r = 4'b0;
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpn_r = 4'b0;
		send_mipi_byte(32'hB8B8B8B8);
		send_mipi_byte(32'h2C400B00);
		for (i= 16'b0; i < 16'd120 ; i = i+1)
		begin
			send_mipi_byte(32'h00FF0055);
			send_mipi_byte(32'hAA0000FF);
			send_mipi_byte(32'h0055AA00);
			send_mipi_byte(32'h00FF0055);
			send_mipi_byte(32'hAA0000FF);
			send_mipi_byte(32'h0055AA00);
		end
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();		
		data_lpp_r = 4'b1111;
		data_lpn_r = 4'b1111;
		
	end
endtask

task send_line;
	reg[15:0]i = 16'b0;
	begin
	

		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpp_r = 4'b0;
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpn_r = 4'b0;
		send_mipi_byte(32'hB8B8B8B8);
		send_mipi_byte(32'h2B600900);
		for (i= 16'b0; i < 16'd120 ; i = i+1)
		begin
			send_mipi_byte(32'h00FF55AA); //MSB to lane 0 and LSB to lane 3
			send_mipi_byte(32'h0000FF55);
			send_mipi_byte(32'hAA0000FF);
			send_mipi_byte(32'h55AA0000);
			send_mipi_byte(32'hFF55AA00);
		end
		send_mipi_byte(32'h33333333);
		//send_mipi_clock();
		send_mipi_byte(32'h12345678);
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		send_mipi_clock();
		data_lpp_r = 4'b1111;
		data_lpn_r = 4'b1111;
		
	end
endtask

task send_mipi_byte;
	input [31:0]bytes;
	reg [7:0] i = 8'b0;
	begin
		for(i = 8'b0; i< 8'h8; i = i+2) begin
			#1;
			mipi_data = {bytes[i], bytes[8'd8 + i] ,bytes[8'd16 +i] , bytes[8'd24 + i]};
			#1;
			mipi_clk = 1'b1;
			#1;
			mipi_data = {bytes[i+1], bytes[8'd8 +i + 1] ,bytes[8'd16 + i +1] , bytes[8'd24 + i + 1]};
			#1;
			mipi_clk = 1'b0;
		end 
	end	
endtask

task send_mipi_clock;
	begin
		send_mipi_byte(32'h00000000);
	end
endtask

initial begin
	mipi_data = 0;
	mipi_clk = 0;
	data_lpp_r = 4'b1111;
	data_lpn_r = 4'b1111;
	 reset = 0;
	clk_lpp_r = 1;
	clk_lpn_r = 1;
	#20
	reset = 1; 
	#200
	send_mipi_frame();
	#200
	send_mipi_frame();
	#200
	send_mipi_frame14();

	#200
	send_mipi_frame12();
	$finish;
end

endmodule