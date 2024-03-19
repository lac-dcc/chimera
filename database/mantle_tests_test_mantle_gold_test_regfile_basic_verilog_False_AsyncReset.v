module my_regfile (
    input ASYNCRESET,
    input CLK,
    input [1:0] read_0_addr,
    output [3:0] read_0_data,
    input [1:0] write_0_addr,
    input [3:0] write_0_data
);

reg [3:0] data [3:0];
always @(posedge CLK) begin
    data[write_0_addr] <= write_0_data;
end
assign read_0_data = data[read_0_addr];


endmodule

module test_regfile_basic_verilog_False_AsyncReset (
    input [1:0] write_addr,
    input [3:0] write_data,
    input [1:0] read_addr,
    output [3:0] read_data,
    input CLK,
    input ASYNCRESET
);
wire [3:0] my_regfile_read_0_data;
my_regfile my_regfile (
    .ASYNCRESET(ASYNCRESET),
    .CLK(CLK),
    .read_0_addr(read_addr),
    .read_0_data(my_regfile_read_0_data),
    .write_0_addr(write_addr),
    .write_0_data(write_data)
);
assign read_data = my_regfile_read_0_data;
endmodule

