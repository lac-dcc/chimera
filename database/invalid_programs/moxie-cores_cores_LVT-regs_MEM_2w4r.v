
`include "parameters.v"

module MEM_2w4r(
    input wire 	clock,

    input wire 	we0,
    input wire 	we1,
		
    input wire 	`MEM_ADDR write_addr_0,
    input wire 	`WORD write_data_0,
    input wire 	`MEM_ADDR write_addr_1,
    input wire 	`WORD write_data_1,

    input wire 	`MEM_ADDR read_addr_0,
    output wire `WORD read_data_0,
    input wire 	`MEM_ADDR read_addr_1,
    output wire `WORD read_data_1,
    input wire 	`MEM_ADDR read_addr_2,
    output wire `WORD read_data_2,
    input wire 	`MEM_ADDR read_addr_3,
    output wire `WORD read_data_3
);



wire `LVT_ENTRY read_0;
wire `LVT_ENTRY read_1;
wire `LVT_ENTRY read_2;
wire `LVT_ENTRY read_3;

LVT_2w4r LVT_2w4r(
    .clock(clock),

    .we0(we0),
    .write_addr_0(write_addr_0),
    .we1(we1),
    .write_addr_1(write_addr_1),

    .read_addr_0(read_addr_0),
    .read_0(read_0),
    .read_addr_1(read_addr_1),
    .read_1(read_1),
    .read_addr_2(read_addr_2),
    .read_2(read_2),
    .read_addr_3(read_addr_3),
    .read_3(read_3)
);



wire `WORD read_data_0_0;
wire `WORD read_data_1_0;
wire `WORD read_data_2_0;
wire `WORD read_data_3_0;

  initial
    begin
       $dumpvars(1, MEM_0);
       $dumpvars(1, MEM_1);
    end

MEM_1w4r MEM_0(
    .clock(clock),
    .we(we0),
    .write_addr(write_addr_0),
    .write_data(write_data_0),

    .read_addr_0(read_addr_0),
    .read_data_0(read_data_0_0),
    .read_addr_1(read_addr_1),
    .read_data_1(read_data_1_0),
    .read_addr_2(read_addr_2),
    .read_data_2(read_data_2_0),
    .read_addr_3(read_addr_3),
    .read_data_3(read_data_3_0)
);

wire `WORD read_data_0_1;
wire `WORD read_data_1_1;
wire `WORD read_data_2_1;
wire `WORD read_data_3_1;

MEM_1w4r MEM_1(
    .clock(clock),
    .we(we1),
    .write_addr(write_addr_1),
    .write_data(write_data_1),

    .read_addr_0(read_addr_0),
    .read_data_0(read_data_0_1),
    .read_addr_1(read_addr_1),
    .read_data_1(read_data_1_1),
    .read_addr_2(read_addr_2),
    .read_data_2(read_data_2_1),
    .read_addr_3(read_addr_3),
    .read_data_3(read_data_3_1)
);



MUX_WORD_2to1 read_data_MUX_0(
    .selector(read_0),

    .input_0(read_data_0_0),
    .input_1(read_data_0_1),

    .output_0(read_data_0)
);

MUX_WORD_2to1 read_data_MUX_1(
    .selector(read_1),

    .input_0(read_data_1_0),
    .input_1(read_data_1_1),

    .output_0(read_data_1)
);

MUX_WORD_2to1 read_data_MUX_2(
    .selector(read_2),

    .input_0(read_data_2_0),
    .input_1(read_data_2_1),

    .output_0(read_data_2)
);

MUX_WORD_2to1 read_data_MUX_3(
    .selector(read_3),

    .input_0(read_data_3_0),
    .input_1(read_data_3_1),

    .output_0(read_data_3)
);

endmodule
