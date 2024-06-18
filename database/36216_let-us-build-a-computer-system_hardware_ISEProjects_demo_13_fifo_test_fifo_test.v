// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module fifo_test(
			input clk,		          //50MHz时钟
			input rst_n	             //复位信号，低电平有效	
		);

//-----------------------------------------------------------
localparam      W_IDLE      = 1;
localparam      W_FIFO     = 2; 
localparam      R_IDLE      = 1;
localparam      R_FIFO     = 2; 

reg[2:0]  write_state;
reg[2:0]  next_write_state;
reg[2:0]  read_state;
reg[2:0]  next_read_state;

reg[15:0] w_data;	   //FIFO写数据
wire      wr_en;	   //FIFO写使能
wire      rd_en;	   //FIFO读使能
wire[15:0] r_data;	//FIFO读数据
wire       full;  	//FIFO满信号 
wire       empty;  	//FIFO空信号 
wire[8:0]  rd_data_count;  	
wire[8:0]  wr_data_count;  	

///产生FIFO写入的数据
always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		write_state <= W_IDLE;
	else
		write_state <= next_write_state;
end

always@(*)
begin
	case(write_state)
		W_IDLE:
			if(empty == 1'b1)               //FIFO空， 开始写FIFO
				next_write_state <= W_FIFO;
			else
				next_write_state <= W_IDLE;
		W_FIFO:
			if(full == 1'b1)                //FIFO满
				next_write_state <= W_IDLE;
			else
				next_write_state <= W_FIFO;
		default:
			next_write_state <= W_IDLE;
	endcase
end

assign wr_en = (next_write_state == W_FIFO) ? 1'b1 : 1'b0; 

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		w_data <= 16'd0;
	else
	   if (wr_en == 1'b1)
		    w_data <= w_data + 1'b1;
		else
          w_data <= 16'd0;		
end



///产生FIFO读的数据
always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		read_state <= R_IDLE;
	else
		read_state <= next_read_state;
end

always@(*)
begin
	case(read_state)
		R_IDLE:
			if(full == 1'b1)               //FIFO满, 开始读FIFO
				next_read_state <= R_FIFO;
			else
				next_read_state <= R_IDLE;
		R_FIFO:
			if(empty == 1'b1)              //FIFO满
				next_read_state <= R_IDLE;
			else
				next_read_state <= R_FIFO;
		default:
			next_read_state <= R_IDLE;
	endcase
end

assign rd_en = (next_read_state == R_FIFO) ? 1'b1 : 1'b0; 

//-----------------------------------------------------------
//实例化FIFO
fifo_ip fifo_ip_inst (
  .rst            (~rst_n       ),   // input rst
  .wr_clk         (clk          ),   // input wr_clk
  .rd_clk         (clk          ),   // input rd_clk
  .din            (w_data       ),   // input [15 : 0] din
  .wr_en          (wr_en        ),   // input wr_en
  .rd_en          (rd_en        ),   // input rd_en
  .dout           (r_data       ),   // output [15 : 0] dout
  .full           (full         ),   // output full
  .empty          (empty        ),   // output empty
  .rd_data_count  (rd_data_count),   // output [8 : 0] rd_data_count
  .wr_data_count  (wr_data_count)    // output [8 : 0] wr_data_count
);


wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
chipscope_icon icon_debug (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila ila_filter_debug (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk),          // IN
    .TRIG0(TRIG0)      // IN BUS [255:0]
);                                                     

assign  TRIG0[15:0]=w_data;  
assign  TRIG0[16]=wr_en;  	
assign  TRIG0[32:17]=r_data;  
assign  TRIG0[33]=rd_en; 
assign  TRIG0[34]=full;
assign  TRIG0[35]=empty;
assign  TRIG0[44:36]=rd_data_count;  	
assign  TRIG0[53:45]=wr_data_count; 

 	
endmodule


