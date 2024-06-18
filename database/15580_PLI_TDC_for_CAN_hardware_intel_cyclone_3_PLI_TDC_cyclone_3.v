// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

module PLI_TDC_cyclone_3 (
	output [33:0] out_data,
	input CLK,
    input RST,
    input SW,
    input CAN_logic,
    output reg [6:0] HEX5,
    output reg [6:0] HEX4,
    output reg [6:0] HEX3,
    output reg [6:0] HEX2,
    output reg [6:0] HEX1,
    output reg [6:0] HEX0,
    output debug1,
    output debug2,

    input SCK,
    input SSEL,
    input MOSI,
    output MISO,

    output LEDR0,
    output LEDR1
);
wire [33:0] in_data;
reg [26:0] CAN_ID_and_coarse_time;
reg [6:0] fine_time;
wire WR;
wire RD;
reg FULL;
reg EMPTY;

spi spi(.CLK(CLK), .SCK(SCK), .SSEL(SSEL), .MOSI(MOSI), .MISO(MISO), .out_data(out_data), .read_request(RD), .read_error(EMPTY));
fifo fifo(.CLK(CLK), .nRST(RST), .D(in_data), .Q(out_data), .WR(WR), .RD(RD), .FULL(FULL), .EMPTY(EMPTY));
measure_time measure_time(.out_data(CAN_ID_and_coarse_time), .CLK(CLK), .SW(SW), .CAN_logic(CAN_logic), .HEX5(HEX5), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2), .HEX1(HEX1), .HEX0(HEX0), .debug1(debug1), .debug2(debug2), .write_request(WR));
tapped_delay_tdc tapped_delay_tdc(.fine_time(fine_time), .CLK(CLK), .CAN_logic(CAN_logic));

assign in_data = {CAN_ID_and_coarse_time[26:0], fine_time[6:0]};
assign LEDR0 = FULL;
assign LEDR1 = EMPTY;

endmodule
