// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: halftop
// Github: https://github.com/halftop
// Email: yu.zh@live.com
// Description: 
// Dependencies: 
// Since: 2019-07-27 21:50:00
// LastEditors: halftop
// LastEditTime: 2019-07-27 21:50:00
// ********************************************************************
// Module Function:
module OV_CAM_Ctrl
#(
	parameter CLK_FREQUENCE	= 50_000_000,
	parameter SCL_CLOCK = 200_000     //scl总线时钟采用200kHz
)
(
	input					clk			,
	input					rst_n		,
	output					sccb_start	,
	input					sccb_done	,
	output	reg				all_done	,
	output		[7:0]		devaddr		,
	output		[7:0]		regaddr		,
	output		[7:0]		wrdata		,
	output	reg				nRESET		
);

localparam DELAY_TIME_30MS   = 30*CLK_FREQUENCE/1000000;

    reg         [15:0]  delay_cnt;
	reg 				start;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		delay_cnt <= 'd0;
	else if(delay_cnt == DELAY_TIME_30MS)
		delay_cnt <= delay_cnt;
	else
		delay_cnt <= delay_cnt + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		nRESET <= 1'b0;
	else if(delay_cnt >= DELAY_TIME_30MS/3)
		nRESET <= 1'b1;
	else
		nRESET <= nRESET;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		start <= 1'b0;
	else if (delay_cnt == DELAY_TIME_30MS - 1) 
		start <= 1'b1;
	else
		start <= 1'b0;
end

reg         [ 6:0]  rom_addr;
reg         [15:0]  rom_data;
wire        [15:0]  rom_data_n;

localparam ROM_CONFIG_SIZE = 125;
OV9650_Config config_rom(
	.address ( rom_addr ),
	.clock ( clk ),
	.q ( rom_data_n )
);
assign devaddr = 8'h60;

reg [3:0] cs_state;
reg [3:0] ns_state;

localparam	FSM_IDLE        = 4'b0001,
			FSM_START       = 4'b0010,
			FSM_WAIT_DONE   = 4'b0100,
			FSM_ALL_DONE    = 4'b1000;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		cs_state <= FSM_IDLE;
	else 
		cs_state <= ns_state;
end

always @(*) begin
	case (cs_state)
		FSM_IDLE        :	ns_state = start ? FSM_START : FSM_IDLE;
		FSM_START       :	ns_state = ~sccb_done ? FSM_WAIT_DONE : FSM_START;
		FSM_WAIT_DONE   :	if (sccb_done) begin
              					if (rom_addr == ROM_CONFIG_SIZE)
              					  ns_state = FSM_ALL_DONE;
              					else
              					  ns_state = FSM_START;
            				end else
              					ns_state = FSM_WAIT_DONE;
		FSM_ALL_DONE    :	ns_state = FSM_ALL_DONE;
		default			:	ns_state = FSM_IDLE;
	endcase
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        all_done <= 1'b0;
    else if (ns_state == FSM_ALL_DONE) 
        all_done <= 1'b1;
    else
        all_done <= 1'b0;
end

reg [1:0] sccb_done_reg;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		sccb_done_reg <= 2'd0;
	else 
		sccb_done_reg <= {sccb_done_reg[0],sccb_done};
end

wire sccb_done_nege = ~sccb_done_reg[0] & sccb_done_reg[1];

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		rom_addr <= 'd0;
	else if (sccb_done_nege) 
		rom_addr <= rom_addr + 1'b1;
	else
		rom_addr <= rom_addr;
end

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		rom_data <= 'd0;
	else if (sccb_done_nege) 
		rom_data <= rom_data_n;
	else
		rom_data <= rom_data;
end

assign sccb_start = cs_state == FSM_START;
assign regaddr = rom_data[15:8];
assign wrdata = rom_data[ 7:0];

endmodule