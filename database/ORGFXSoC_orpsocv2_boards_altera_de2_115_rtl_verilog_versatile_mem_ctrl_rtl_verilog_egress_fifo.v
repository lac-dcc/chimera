// async FIFO with multiple queues, multiple data
`define ORIGINAL_EGRESS_FIFO
`ifdef ORIGINAL_EGRESS_FIFO
module egress_fifo (
    d, fifo_full, write, write_enable, clk1, rst1,
    q, fifo_empty, read_adr, read_data, read_enable, clk2, rst2
);

parameter a_hi_size = 4;
parameter a_lo_size = 4;
parameter nr_of_queues = 16;
parameter data_width = 36;

input [data_width*nr_of_queues-1:0] d;
output [0:nr_of_queues-1] fifo_full;
input                     write;
input  [0:nr_of_queues-1] write_enable;
input clk1;
input rst1;

output reg [data_width-1:0] q;
output [0:nr_of_queues-1] fifo_empty;
input                     read_adr, read_data;
input  [0:nr_of_queues-1] read_enable;
input clk2;
input rst2;

wire [data_width-1:0] fifo_q;
   
wire [a_lo_size-1:0]  fifo_wadr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_wadr_gray[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_gray[0:nr_of_queues-1];
reg [a_lo_size-1:0] wadr;
reg [a_lo_size-1:0] radr;
reg [data_width-1:0] wdata;
wire [data_width-1:0] wdataa[0:nr_of_queues-1];

reg read_adr_reg;
reg [0:nr_of_queues-1] read_enable_reg;

genvar i;
integer j,k,l;

function [a_lo_size-1:0] onehot2bin;
input [0:nr_of_queues-1] a;
integer i;
begin
    onehot2bin = {a_lo_size{1'b0}};
    for (i=1;i<nr_of_queues;i=i+1) begin
        if (a[i])
            onehot2bin = i;
    end
end
endfunction

// a pipeline stage for address read gives higher clock frequency but adds one 
// clock latency for adr read
always @ (posedge clk2 or posedge rst2)
if (rst2)
    read_adr_reg <= 1'b0;
else
    read_adr_reg <= read_adr;
    
always @ (posedge clk2 or posedge rst2)
if (rst2)
    read_enable_reg <= {nr_of_queues{1'b0}};
else
    if (read_adr)
        read_enable_reg <= read_enable;
        

generate
    for (i=0;i<nr_of_queues;i=i+1) begin : fifo_adr
        
        gray_counter wadrcnt (
            .cke(write & write_enable[i]),
            .q(fifo_wadr_gray[i]),
            .q_bin(fifo_wadr_bin[i]),
            .rst(rst1),
            .clk(clk1));
        
        gray_counter radrcnt (
            .cke((read_adr_reg | read_data) & read_enable_reg[i]),
            .q(fifo_radr_gray[i]),
            .q_bin(fifo_radr_bin[i]),
            .rst(rst2),
            .clk(clk2));
        
	versatile_fifo_async_cmp
            #(.ADDR_WIDTH(a_lo_size))
            egresscmp ( 
                .wptr(fifo_wadr_gray[i]), 
		.rptr(fifo_radr_gray[i]), 
		.fifo_empty(fifo_empty[i]), 
		.fifo_full(fifo_full[i]), 
		.wclk(clk1), 
		.rclk(clk2), 
		.rst(rst1));
        
    end
endgenerate

// and-or mux write address
always @*
begin
    wadr = {a_lo_size{1'b0}};
    for (j=0;j<nr_of_queues;j=j+1) begin
        wadr = (fifo_wadr_bin[j] & {a_lo_size{write_enable[j]}}) | wadr;
    end
end

// and-or mux read address
always @*
begin
    radr = {a_lo_size{1'b0}};
    for (k=0;k<nr_of_queues;k=k+1) begin
        radr = (fifo_radr_bin[k] & {a_lo_size{read_enable_reg[k]}}) | radr;
    end
end

// and-or mux write data
generate
    for (i=0;i<nr_of_queues;i=i+1) begin : vector2array
        assign wdataa[i] = d[(nr_of_queues-i)*data_width-1:(nr_of_queues-1-i)*data_width];
    end
endgenerate

always @*
begin
    wdata = {data_width{1'b0}};
    for (l=0;l<nr_of_queues;l=l+1) begin
        wdata = (wdataa[l] & {data_width{write_enable[l]}}) | wdata;
    end
end


   
vfifo_dual_port_ram_dc_sw 
  # ( 
      .DATA_WIDTH(data_width), 
      .ADDR_WIDTH(a_hi_size+a_lo_size)
      )
    dpram (
    .d_a(wdata),
    .adr_a({onehot2bin(write_enable),wadr}), 
    .we_a(write),
    .clk_a(clk1),
    .q_b(fifo_q),
    .adr_b({onehot2bin(read_enable_reg),radr}),
    .clk_b(clk2) );

   // Added registering of FIFO output to break a timing path
   always@(posedge clk2)
     q <= fifo_q;
   

endmodule
`else // !`ifdef ORIGINAL_EGRESS_FIFO
module egress_fifo (
    d, fifo_full, write, write_enable, clk1, rst1,
    q, fifo_empty, read_adr, read_data, read_enable, clk2, rst2
);

parameter a_hi_size = 2;
parameter a_lo_size = 4;
parameter nr_of_queues = 16;
parameter data_width = 36;

input [data_width*nr_of_queues-1:0] d;
output [0:nr_of_queues-1] fifo_full;
input                     write;
input  [0:nr_of_queues-1] write_enable;
input clk1;
input rst1;

output reg [data_width-1:0] q;
output [0:nr_of_queues-1] fifo_empty;
input                     read_adr, read_data;
input  [0:nr_of_queues-1] read_enable;
input clk2;
input rst2;

wire [data_width-1:0] fifo_q;
   
wire [a_lo_size-1:0]  fifo_wadr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_wadr_gray[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_bin[0:nr_of_queues-1];
wire [a_lo_size-1:0]  fifo_radr_gray[0:nr_of_queues-1];
wire [a_lo_size-1:0] wadr;
wire [a_lo_size-1:0] radr;
wire [data_width-1:0] wdata;
wire [data_width-1:0] wdataa[0:nr_of_queues-1];

reg read_adr_reg;
reg [0:nr_of_queues-1] read_enable_reg;

genvar i;
integer j,k,l;

// a pipeline stage for address read gives higher clock frequency but adds one 
// clock latency for adr read
always @ (posedge clk2 or posedge rst2)
if (rst2)
    read_adr_reg <= 1'b0;
else
    read_adr_reg <= read_adr;
    
always @ (posedge clk2 or posedge rst2)
if (rst2)
    read_enable_reg <= {nr_of_queues{1'b0}};
else
    if (read_adr)
        read_enable_reg <= read_enable;
        
   // 0        
   gray_counter wadrcnt0
     (
      .cke(write & write_enable[0]),
      .q(fifo_wadr_gray[0]),
      .q_bin(fifo_wadr_bin[0]),
      .rst(rst1),
      .clk(clk1)
      );
   
   gray_counter radrcnt0
     (
      .cke((read_adr_reg | read_data) & read_enable_reg[0]),
      .q(fifo_radr_gray[0]),
      .q_bin(fifo_radr_bin[0]),
      .rst(rst2),
      .clk(clk2)
      );
   
   versatile_fifo_async_cmp
     #(
      .ADDR_WIDTH(a_lo_size)
      )
   egresscmp0
     ( 
       .wptr(fifo_wadr_gray[0]), 
       .rptr(fifo_radr_gray[0]), 
       .fifo_empty(fifo_empty[0]), 
       .fifo_full(fifo_full[0]), 
       .wclk(clk1), 
       .rclk(clk2), 
       .rst(rst1)
       );

   // 1
      gray_counter wadrcnt1
     (
      .cke(write & write_enable[1]),
      .q(fifo_wadr_gray[1]),
      .q_bin(fifo_wadr_bin[1]),
      .rst(rst1),
      .clk(clk1)
      );
   
   gray_counter radrcnt1
     (
      .cke((read_adr_reg | read_data) & read_enable_reg[1]),
      .q(fifo_radr_gray[1]),
      .q_bin(fifo_radr_bin[1]),
      .rst(rst2),
      .clk(clk2)
      );
   
   versatile_fifo_async_cmp
     #(
      .ADDR_WIDTH(a_lo_size)
      )
   egresscmp1
     ( 
       .wptr(fifo_wadr_gray[1]), 
       .rptr(fifo_radr_gray[1]), 
       .fifo_empty(fifo_empty[1]), 
       .fifo_full(fifo_full[1]), 
       .wclk(clk1), 
       .rclk(clk2), 
       .rst(rst1)
       );

   // 2
      gray_counter wadrcnt2
     (
      .cke(write & write_enable[2]),
      .q(fifo_wadr_gray[2]),
      .q_bin(fifo_wadr_bin[2]),
      .rst(rst1),
      .clk(clk1)
      );
   
   gray_counter radrcnt2
     (
      .cke((read_adr_reg | read_data) & read_enable_reg[2]),
      .q(fifo_radr_gray[2]),
      .q_bin(fifo_radr_bin[2]),
      .rst(rst2),
      .clk(clk2)
      );
   
   versatile_fifo_async_cmp
     #(
      .ADDR_WIDTH(a_lo_size)
      )
   egresscmp2
     ( 
       .wptr(fifo_wadr_gray[2]), 
       .rptr(fifo_radr_gray[2]), 
       .fifo_empty(fifo_empty[2]), 
       .fifo_full(fifo_full[2]), 
       .wclk(clk1), 
       .rclk(clk2), 
       .rst(rst1)
       );

   
   assign wadr = (fifo_wadr_bin[0] & {a_lo_size{write_enable[0]}}) |
		 (fifo_wadr_bin[1] & {a_lo_size{write_enable[1]}}) |
		 (fifo_wadr_bin[2] & {a_lo_size{write_enable[2]}});
   
   assign radr = (fifo_radr_bin[0] & {a_lo_size{read_enable_reg[0]}}) |
		 (fifo_radr_bin[1] & {a_lo_size{read_enable_reg[1]}}) |
		 (fifo_radr_bin[2] & {a_lo_size{read_enable_reg[2]}});
   
     
   assign wdataa[0] = d[108-1:72];
   assign wdataa[1] = d[72-1:36];
   assign wdataa[2] = d[36-1:0];
   
   assign wdata = ( d[108-1:72] & {data_width{write_enable[0]}}) |
		  ( d[72-1:36]  & {data_width{write_enable[1]}}) |
		  ( d[36-1:0]   & {data_width{write_enable[2]}});   

   wire [1:0] wadr_top;
   assign wadr_top = write_enable[1] ? 2'b01 :
		     write_enable[2] ? 2'b10 :
		     2'b00;
   wire [1:0] radr_top;
   assign radr_top = read_enable_reg[1] ? 2'b01 :
		     read_enable_reg[2] ? 2'b10 :
		     2'b00;
      
vfifo_dual_port_ram_dc_sw 
  # ( 
      .DATA_WIDTH(data_width), 
      .ADDR_WIDTH(2+a_lo_size)
      )
    dpram (
    .d_a(wdata),
    .adr_a({wadr_top,wadr}), 
    .we_a(write),
    .clk_a(clk1),
    .q_b(fifo_q),
    .adr_b({radr_top,radr}),
    .clk_b(clk2) );

   // Added registering of FIFO output to break a timing path
   always@(posedge clk2)
     q <= fifo_q;
   

endmodule
`endif // !`ifdef ORIGINAL_EGRESS_FIFO
