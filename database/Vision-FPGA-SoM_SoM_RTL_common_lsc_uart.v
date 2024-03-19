// UART

module lsc_uart(
input           ref_clk, //
input		clk,	// data interface
// data input
input	[7:0]	i_din,
input		i_valid,
output          o_empty,

// data output
output reg [7:0]o_dout,
output reg      o_valid,

// UART signals
input		i_rxd,
output reg	o_txd,

input           resetn
);

parameter [15:0] PERIOD = 16'd867; // 100MHz ref, 115200 baud --> 867
parameter BUFFER_SIZE = "512";
parameter ECP5_DEBUG = 1'b0;

// Tx side {{{

wire		fifo_we;
wire		fifo_rd;
wire	[7:0]	fifo_dout;
reg		fifo_empty;
reg	[11:0]	fifo_waddr;
reg	[11:0]	fifo_raddr;
reg	[11:0]	fifo_raddr_clk;
reg	[11:0]	fifo_raddr_lat;
reg		r_fifo_empty;
wire		fifo_full;
wire	[11:0]	fifo_waddr_p1;

reg	[15:0]	tx_period_cnt;
reg	[3:0]	tx_bit_cnt;	// 0: IDLE, 1: Start, 2~9: bit0~7, A:Stop
reg		tx_bit_tick;

wire	[11:0]	addr_mask;

assign addr_mask = (BUFFER_SIZE == "4K" ) ? 12'hfff :
                   (BUFFER_SIZE == "2K" ) ? 12'h7ff :
                   (BUFFER_SIZE == "1K" ) ? 12'h3ff : 12'h1ff;

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	tx_bit_cnt <= 4'b0;
    else if((tx_bit_cnt == 4'b0) && (fifo_empty == 1'b0))
	tx_bit_cnt <= 4'd1;
    else if((tx_bit_cnt == 4'hA) && tx_bit_tick)
	tx_bit_cnt <= 4'd0;
    else if((tx_bit_cnt != 4'b0) && tx_bit_tick)
	tx_bit_cnt <= tx_bit_cnt + 4'd1;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	tx_period_cnt <= 16'b0;
    else if(tx_bit_cnt == 4'b0)
	tx_period_cnt <= 16'b0;
    else if(tx_period_cnt == 16'b0)
	tx_period_cnt <= PERIOD;
    else
	tx_period_cnt <= tx_period_cnt - 16'd1;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	tx_bit_tick <= 1'b0;
    else if(tx_period_cnt == 16'd1)
	tx_bit_tick <= 1'b1;
    else
	tx_bit_tick <= 1'b0;
end

//assign fifo_rd = ((tx_bit_cnt == 4'hA) && (tx_period_cnt == 16'd1));
assign fifo_rd = ((tx_bit_cnt == 4'h9) && tx_bit_tick);

always @(posedge ref_clk or negedge resetn)
begin
    if(resetn == 1'b0)
	fifo_raddr <= 12'b0;
    else if(fifo_rd)
	fifo_raddr <= fifo_raddr + 12'd1;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	o_txd <= 1'b0;
    else case(tx_bit_cnt)
	4'd1: // start
	    o_txd <= 1'b0;
	4'd2:
	    o_txd <= fifo_dout[0];
	4'd3:
	    o_txd <= fifo_dout[1];
	4'd4:
	    o_txd <= fifo_dout[2];
	4'd5:
	    o_txd <= fifo_dout[3];
	4'd6:
	    o_txd <= fifo_dout[4];
	4'd7:
	    o_txd <= fifo_dout[5];
	4'd8:
	    o_txd <= fifo_dout[6];
	4'd9:
	    o_txd <= fifo_dout[7];
	default: // stop & idle
	    o_txd <= 1'b1;
    endcase
end

always @(posedge clk)
begin
    fifo_raddr_clk <= fifo_raddr;
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0)
	fifo_raddr_lat <= 12'd0;
    else if(fifo_raddr_lat != fifo_raddr_clk)
	fifo_raddr_lat <= fifo_raddr_clk;
end

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0)
	r_fifo_empty <= 1'b1;
    else 
	r_fifo_empty <= ((fifo_raddr_lat & addr_mask) == (fifo_waddr & addr_mask));
end

assign fifo_waddr_p1 = fifo_waddr + 12'd1;

assign fifo_we = ((!fifo_full) && i_valid);

always @(posedge clk or negedge resetn)
begin
    if(resetn == 1'b0)
	fifo_waddr <= 12'b0;
    else if(fifo_we)
	fifo_waddr <= fifo_waddr_p1;
end

always @(posedge ref_clk or negedge resetn)
begin
    if(resetn == 1'b0)
	fifo_empty <= 1'b1;
    else
	fifo_empty <= r_fifo_empty;
end

assign o_empty = r_fifo_empty;

assign fifo_full = ((fifo_raddr_lat & addr_mask) == (fifo_waddr_p1 & addr_mask));

generate if(ECP5_DEBUG == 1'b1)
begin: g_on_ecp5_debug
    // support 512 only
    dpram512x8 u_dpram512x8 (
	.WrAddress(fifo_waddr), 
	.RdAddress(fifo_raddr), 
	.Data     (i_din     ), 
	.WE       (fifo_we   ), 
	.RdClock  (ref_clk   ), 
	.RdClockEn(1'b1      ), 
	.Reset    (!resetn   ), 
	.WrClock  (clk       ), 
	.WrClockEn(1'b1      ), 
	.Q        (fifo_dout )
    );
end
else if(BUFFER_SIZE == "4K") 
begin // 4K byte ice40 radiant
    dpram4096x8 u_ram4096x8_0 (
	.wr_clk_i   (clk          ),
	.rd_clk_i   (ref_clk      ),
	.wr_clk_en_i(1'b1         ),
	.rd_en_i    (1'b1         ),
	.rd_clk_en_i(1'b1         ),
	.wr_en_i    (fifo_we      ),
	.wr_data_i  (i_din        ),
	.wr_addr_i  (fifo_waddr   ),
	.rd_addr_i  (fifo_raddr   ),
	.rd_data_o  (fifo_dout    )
    );
end
else if(BUFFER_SIZE == "2K") 
begin // 4K byte ice40 radiant
    dpram2048x8 u_ram2048x8_0 (
	.wr_clk_i   (clk          ),
	.rd_clk_i   (ref_clk      ),
	.wr_clk_en_i(1'b1         ),
	.rd_en_i    (1'b1         ),
	.rd_clk_en_i(1'b1         ),
	.wr_en_i    (fifo_we      ),
	.wr_data_i  (i_din        ),
	.wr_addr_i  (fifo_waddr[10:0]),
	.rd_addr_i  (fifo_raddr[10:0]),
	.rd_data_o  (fifo_dout    )
    );
end
else if(BUFFER_SIZE == "1K") 
begin // 4K byte ice40 radiant
    dpram1024x8 u_ram1024x8_0 (
	.wr_clk_i   (clk          ),
	.rd_clk_i   (ref_clk      ),
	.wr_clk_en_i(1'b1         ),
	.rd_en_i    (1'b1         ),
	.rd_clk_en_i(1'b1         ),
	.wr_en_i    (fifo_we      ),
	.wr_data_i  (i_din        ),
	.wr_addr_i  (fifo_waddr[9:0]),
	.rd_addr_i  (fifo_raddr[9:0]),
	.rd_data_o  (fifo_dout    )
    );
end
else begin // 512 byte ice40 radiant
    dpram512x8 u_ram512x8_0 (
	.wr_clk_i   (clk          ),
	.rd_clk_i   (ref_clk      ),
	.wr_clk_en_i(1'b1         ),
	.rd_en_i    (1'b1         ),
	.rd_clk_en_i(1'b1         ),
	.wr_en_i    (fifo_we      ),
	.wr_data_i  (i_din        ),
	.wr_addr_i  (fifo_waddr[8:0]),
	.rd_addr_i  (fifo_raddr[8:0]),
	.rd_data_o  (fifo_dout    )
    );
end
endgenerate

// Tx side }}}

// Rx side {{{

reg	[15:0]	rx_period_cnt;
reg	[3:0]	rx_bit_cnt;	// 0: IDLE, 1: Start, 2~9: bit0~7, A:Stop
reg		rx_bit_tick;
reg		rx_sample_tick;

reg	[1:0]	rxd_lat;
reg	[7:0]	rxd_shift;

reg		rx_valid_tg;
reg	[1:0]	rx_valid_tg_clk;

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rxd_lat <= 2'b0;
    else 
	rxd_lat <= {rxd_lat[0], i_rxd};
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rxd_shift <= 8'b0;
    else if(rx_sample_tick)
	rxd_shift <= {rxd_lat[0], rxd_shift[7:1]};
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rx_valid_tg <= 1'b0;
    else if(rx_sample_tick & (rx_bit_cnt == 4'hA))
	rx_valid_tg <= !rx_valid_tg;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	o_dout <= 8'b0;
    else if(rx_sample_tick & (rx_bit_cnt == 4'hA))
	o_dout <= rxd_shift;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rx_bit_cnt <= 4'b0;
    else if((rx_bit_cnt == 4'b0) && (rxd_lat == 2'b10))
	rx_bit_cnt <= 4'd1;
    else if((rx_bit_cnt == 4'hA) && rx_bit_tick)
	rx_bit_cnt <= 4'd0;
    else if((rx_bit_cnt != 4'b0) && rx_bit_tick)
	rx_bit_cnt <= rx_bit_cnt + 4'd1;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rx_period_cnt <= 16'b0;
    else if(rx_bit_cnt == 4'b0)
	rx_period_cnt <= 16'b0;
    else if(rx_period_cnt == 16'b0)
	rx_period_cnt <= PERIOD;
    else
	rx_period_cnt <= rx_period_cnt - 16'd1;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rx_bit_tick <= 1'b0;
    else if(rx_period_cnt == 16'd1)
	rx_bit_tick <= 1'b1;
    else
	rx_bit_tick <= 1'b0;
end

always @(posedge ref_clk)
begin
    if(resetn == 1'b0)
	rx_sample_tick <= 1'b0;
    else if(rx_period_cnt == {1'b0, PERIOD[15:1]})
	rx_sample_tick <= 1'b1;
    else
	rx_sample_tick <= 1'b0;
end

always @(posedge clk)
begin
    if(resetn == 1'b0)
	rx_valid_tg_clk <= 2'b0;
    else 
	rx_valid_tg_clk <= {rx_valid_tg_clk[0], rx_valid_tg};
end

always @(posedge clk)
begin
    if(resetn == 1'b0)
	o_valid <= 1'b0;
    else 
	o_valid <= (rx_valid_tg_clk[0] != rx_valid_tg_clk[1]);
end

// Rx side }}}

endmodule

// vim:foldmethod=marker:
//
