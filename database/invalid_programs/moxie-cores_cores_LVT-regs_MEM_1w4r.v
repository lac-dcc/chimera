
`include "parameters.v"

module MEM_1w4r(
    input wire 	clock,
    input wire  we,
    input wire 	`MEM_ADDR write_addr,
    input wire 	`WORD write_data,

    input wire 	`MEM_ADDR read_addr_0,
    output wire `WORD read_data_0,
    input wire 	`MEM_ADDR read_addr_1,
    output wire `WORD read_data_1,
    input wire 	`MEM_ADDR read_addr_2,
    output wire `WORD read_data_2,
    input wire 	`MEM_ADDR read_addr_3,
    output wire `WORD read_data_3

);

  initial
    begin
       $dumpvars(1, MEM_1w1r_0);
       $dumpvars(1, MEM_1w1r_1);
       $dumpvars(1, MEM_1w1r_2);
       $dumpvars(1, MEM_1w1r_3);
    end

MEM_1w1r MEM_1w1r_0(
    .clock(clock),
    .we(we),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr(read_addr_0),
    .read_data(read_data_0)
);

MEM_1w1r MEM_1w1r_1(
    .clock(clock),
    .we(we),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr(read_addr_1),
    .read_data(read_data_1)
);

MEM_1w1r MEM_1w1r_2(
    .clock(clock),
    .we(we),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr(read_addr_2),
    .read_data(read_data_2)
);

MEM_1w1r MEM_1w1r_3(
    .clock(clock),
    .we(we),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr(read_addr_3),
    .read_data(read_data_3)
);


endmodule
