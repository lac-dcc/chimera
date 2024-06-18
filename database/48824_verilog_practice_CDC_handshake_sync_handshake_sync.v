// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

//receive module clk_slow is 25MHz
//Asynchronous data send clk_fast of 100 MHz

module handshake_sync #(
	parameter PULSE_INIT = 1'b0	
	)(
	input rstf_n     ,  
	input rsts_n     ,
	input clk_fast   ,
	input din_en     ,
	input [7:0] din  ,  
	output reg ack_r ,
	input clk_slow   ,
	output reg dout_en   ,
	output wire [7:0] dout 
);
	reg			req_r ;
	reg	[7 : 0]	din_r ;
	reg	[7 : 0]	dout_r;

	/*-----------------------------------------------\
	 --        		 	fast clk         		 --
	\-----------------------------------------------*/
	// when pulse signal is detected in clk_fast domain
	// it is not urgent to low level    
	always @(posedge clk_fast or negedge rstf_n) begin
		if (rstf_n == 1'b0) begin
			req_r <= PULSE_INIT ;
		end
		else if (din_en) begin
			req_r <= ~req_r ;
		end
	end

	always @(posedge clk_fast) begin 
		if (din_en) begin
			din_r <= din ;
		end
	end

	/*-----------------------------------------------\
	 --        		 	 slow clk 			         --
	\-----------------------------------------------*/
	 
	 reg [2 : 0] req_syn_r ;
	 // pulse signal in sampled with clk_slow domain
	 always @(posedge clk_slow or negedge rsts_n) begin
	 	if (rsts_n == 1'b0) begin
	 		req_syn_r <= 3'b000 ;
	 	end
	 	else begin
	 		req_syn_r <= {req_r, req_syn_r[2:1]} ;
	 	end
	 end

	 wire dout_en_p ;
	 assign dout_en_p = ^req_syn_r[1:0] ;

	 always @(posedge clk_slow or negedge rsts_n) begin
	 	if (rsts_n == 1'b0) begin
	 		dout_en <= 1'b0 ;
	 	end
	 	else begin
	 		dout_en <= dout_en_p ;
	 	end
	 end

	 always @(posedge clk_slow)begin
	 	if (dout_en_p) begin
	 		dout_r <= din_r ;
	 	end
	 end

	 assign dout = dout_r ;

/*-----------------------------------------------\
 --         feedback for slow clk to fast clk          --
\-----------------------------------------------*/
    reg ack_r_p ;
    always @(posedge clk_slow or negedge rstf_n) begin
    	if (rstf_n == 1'b0) begin
    		ack_r_p <= 1'b0 ;
    	end
    	else if (dout_en_p) begin
    		ack_r_p <= ~ack_r_p ;
    	end
    end

    reg [2:0] ack_syn_r ;
    // Delayed best sampling of feedback signals

    always @(posedge clk_fast or negedge rstf_n) begin
    	if (rstf_n == 1'b0) begin
    		ack_syn_r <= 3'b000 ;
    	end
    	else begin
    		ack_syn_r <= {ack_r_p, ack_syn_r[2:1]} ;
    	end
    end

	always @(*) begin 
			ack_r = ^ack_syn_r[1:0] ;
		end	

endmodule