// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`include "axis_fifo_my.v"
`default_nettype none

module tb_axis_fifo_my;

parameter integer C_S_AXIS_TDATA_WIDTH	= 32;

reg clk;
reg rst_n;

reg read_want;
reg S_AXIS_TVALID;

reg [C_S_AXIS_TDATA_WIDTH-1:0] data_in;

wire [C_S_AXIS_TDATA_WIDTH-1:0] data_out;
wire S_AXIS_TREADY;
wire out_valid;

wire fifo_full;
wire fifo_empty;

axis_fifo_my #(.C_S_AXIS_TDATA_WIDTH(C_S_AXIS_TDATA_WIDTH)) u1 
(
    .data_out(data_out),
    .read_want(read_want),
    .out_valid(out_valid),
    .fifo_full(fifo_full),
    .fifo_empty(fifo_empty),
    // User ports ends
    // Do not modify the ports beyond this line

    // AXI4Stream sink: Clock
    .S_AXIS_ACLK(clk),
    // AXI4Stream sink: Reset
    .S_AXIS_ARESETN(rst_n),
    // Ready to accept data in
    .S_AXIS_TREADY(S_AXIS_TREADY),
    // Data in
    .S_AXIS_TDATA(data_in),
    // Byte qualifier
    .S_AXIS_TSTRB(4'd0),
    // Indicates boundary of last packet
    .S_AXIS_TLAST(1'd0),
    // Data is in valid
    .S_AXIS_TVALID(S_AXIS_TVALID)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD) clk=~clk;

initial begin
    $fsdbDumpfile("tb_wave_2.fsdb");
	$fsdbDumpvars(0);   
end

initial begin
    rst_n=1'd1;
    clk=1'd0;
    read_want=1'd0;
    S_AXIS_TVALID=1'd0;  
    data_in=32'd0;

    #10 rst_n=1'd0;
    #10 rst_n=1'd1;

    fifo_in(4);
    #40;
    fifo_in(3);
    #40;
    fifo_in(2);
    #40;
    fifo_in(1);
    #40;
    fifo_read;
    #40;
    fifo_read;
    #40;
    fifo_read;
    #40;
    fifo_read;
    #40;
    fifo_in(99); 
    #40;
    fifo_read_write(87);

    #5000000;
    $finish;
end

task fifo_in(input [31:0] data);begin    

    S_AXIS_TVALID=1'd1; 
    data_in = data;
    #20
  S_AXIS_TVALID=1'd0; 
//   $display("time=%3d read_date=0x%x ", $time,read_value);
end
endtask 

task fifo_read;begin
    read_want=1'd1;
    #20
    read_want=1'd0;
end
endtask

task fifo_read_write(input [31:0] data);begin
    S_AXIS_TVALID=1'd1; 
    data_in = data;
    read_want=1'd1;
    #20
    S_AXIS_TVALID=1'd0;
    read_want=1'd0;

end
endtask
endmodule
`default_nettype wire