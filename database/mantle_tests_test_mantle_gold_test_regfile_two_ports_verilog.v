module my_regfile (
    input ASYNCRESET,
    input CLK,
    input [1:0] read_0_addr,
    output [3:0] read_0_data,
    input [1:0] read_1_addr,
    output [3:0] read_1_data,
    input [1:0] write_0_addr,
    input [3:0] write_0_data,
    input [1:0] write_1_addr,
    input [3:0] write_1_data
);

reg [3:0] data [3:0];
always @(posedge CLK) begin
    data[write_0_addr] <= write_0_data;
    data[write_1_addr] <= write_1_data;
end
assign read_0_data = write_1_addr == read_0_addr ? write_1_data : write_0_addr == read_0_addr ? write_0_data : data[read_0_addr];
assign read_1_data = write_1_addr == read_1_addr ? write_1_data : write_0_addr == read_1_addr ? write_0_data : data[read_1_addr];


endmodule

module test_regfile_two_ports_verilog (
    input [1:0] write_addr0,
    input [3:0] write_data0,
    input [1:0] write_addr1,
    input [3:0] write_data1,
    input [1:0] read_addr0,
    output [3:0] read_data0,
    input [1:0] read_addr1,
    output [3:0] read_data1,
    input CLK,
    input ASYNCRESET
);
wire [3:0] my_regfile_read_0_data;
wire [3:0] my_regfile_read_1_data;
my_regfile my_regfile (
    .ASYNCRESET(ASYNCRESET),
    .CLK(CLK),
    .read_0_addr(read_addr0),
    .read_0_data(my_regfile_read_0_data),
    .read_1_addr(read_addr1),
    .read_1_data(my_regfile_read_1_data),
    .write_0_addr(write_addr0),
    .write_0_data(write_data0),
    .write_1_addr(write_addr1),
    .write_1_data(write_data1)
);
assign read_data0 = my_regfile_read_0_data;
assign read_data1 = my_regfile_read_1_data;
endmodule

