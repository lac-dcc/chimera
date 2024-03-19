// ethernec.v
//
// Atari ST NE2000/ethernec implementation for the MiST board
// https://github.com/mist-devel/mist-board
//
// Copyright (c) 2014 Till Harbaum <till@harbaum.org>
//
// This source file is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

// TODO: 
// rename rx_begin/tx_begin to rx_enable/tx_enable
// cpu writing curr??
// min framelen check here (not in io controller)

module ethernec (
	// cpu register interface
	input            clk,
	input            rd,
	input            wr,
	input      [4:0] addr,
	input      [7:0] din,
	output reg [7:0] dout,

	// ethernet status word to be read by io controller
	output    [31:0] status,

	// interface to allow the io controller to read frames from the tx buffer
	input            tx_begin,   // rising edge before new tx byte stream is sent
	input            tx_strobe,  // rising edge before each tx byte
	output reg [7:0] tx_byte,    // byte from transmit buffer 

	// interface to allow the io controller to write frames to the tx buffer
	input            rx_begin,   // rising edge before new rx byte stream is sent
	input            rx_strobe,  // rising edge before each rx byte
	input      [7:0] rx_byte,    // byte to be written to rx buffer 

	// interface to allow mac address being set by io controller
	input            mac_begin,   // rising edge before new mac is sent
	input            mac_strobe,  // rising edge before each mac byte
	input      [7:0] mac_byte     // mac address byte
);

// some non-zero and non-all-ones bytes as status flags
localparam STATUS_IDLE       = 8'hfe;
localparam STATUS_TX_PENDING = 8'ha5;
localparam STATUS_TX_DONE    = 8'h12;

reg [7:0] statusCode;
assign status = { statusCode, 5'h00, tbcr == tx_w_cnt, isr[1:0], tbcr };

localparam RX_W_IDLE   = 2'b00;
localparam RX_W_MAC    = 2'b01;
localparam RX_W_DATA   = 2'b10;
localparam RX_W_HEADER = 2'b11;

reg [1:0] rx_w_state;

// ----- bus interface signals as wired up on the ethernec/netusbee ------
// sel[0] = 0xfa0000 -> normal read
// sel[1] = 0xfb0000 -> write through address bus
wire ne_read = rd;
wire ne_write = wr;

reg ne_readD, ne_writeD;
always @(posedge clk) begin
	ne_readD <= ne_read;
	ne_writeD <= ne_write;
end

wire ne_read_en = ~ne_read & ne_readD;
wire ne_write_en = ~ne_write & ne_writeD;

// ---------- ne2000 internal registers -------------
reg reset = 0;
reg [7:0]  cr;             // ne command register
reg [7:0]  isr;            // ne interrupt service register
reg [7:0]  imr;            // interrupt mask register
reg [7:0]  curr;           // current page register
reg [7:0]  bnry;           // boundary page
reg [7:0]  dcr;            
reg [7:0]  rcr;            // receiver control register
reg [7:0]  tcr;            // transmitter control register
reg [7:0]  tpsr;
reg [7:0]  pstart;         // rx buffer ring start page
reg [7:0]  pstop;          // rx buffer ring stop page
reg [7:0]  par [5:0];      // 6 byte mac address register
reg [7:0]  mar [7:0];      // 8 byte multicast hash register
reg [15:0] rbcr;           // receiver byte count register
reg [15:0] rsar;           // receiver address register
reg [15:0] tbcr;           // transmitter byte count register


wire [1:0] ps = cr[7:6];  // register page select

// ------------- rx/tx buffers ------------
localparam FRAMESIZE = 1536;

reg [7:0] rx_buffer [FRAMESIZE+3:0];   // 1 ethernet frame + 4 bytes header
reg [15:0] rx_r_cnt, rx_w_cnt;         // receive buffer byte counter

reg [7:0] tx_buffer [FRAMESIZE-1:0];   // 1 ethernet frame
reg [15:0] tx_w_cnt, tx_r_cnt;         // transmit buffer byte counter

// ------------- io controller read access to tx buffer ------------
always @(posedge clk) begin
	tx_byte <= tx_buffer[tx_r_cnt];

	if (tx_done)
		tx_r_cnt <= 0;
	else if (tx_strobe_r2 & ~tx_strobe_r3)
		tx_r_cnt <= tx_r_cnt + 1'd1;

end

reg tx_begin_r, tx_begin_r2, tx_begin_r3;
reg tx_strobe_r, tx_strobe_r2, tx_strobe_r3;
reg rx_begin_d;

always @(posedge clk) begin
	{tx_begin_r3, tx_begin_r2, tx_begin_r} <= {tx_begin_r2, tx_begin_r, tx_begin};
	{tx_strobe_r3, tx_strobe_r2, tx_strobe_r} <= {tx_strobe_r2, tx_strobe_r, tx_strobe};
	rx_begin_d <= rx_begin;
end
wire tx_done = tx_begin_r2 & !tx_begin_r3;

// ------------- set local mac address ------------

// mac address from io controller
reg [7:0] mac [5:0];
reg [2:0] mac_cnt;

always @(posedge clk) begin
	if (mac_begin)
		mac_cnt <= 0;
	else if (mac_strobe) begin
		if(mac_cnt < 6) begin
			mac[mac_cnt] <= mac_byte;
			mac_cnt <= mac_cnt + 3'd1;
		end
	end
end

// cpu register read
always @(*) begin
	dout = 8'd0;
	if(ne_read) begin            // $faxxxx
		// cr, dma and reset are always available
		if(addr == 5'h00)   dout = cr;

		// register page 0
		if(ps == 2'd0) begin
			if(addr == 5'h04) dout = 8'h23;   // tsr: tx ok
			if(addr == 5'h07) dout = isr;
		end
		
		// register page 1
		if(ps == 2'd1) begin
			if(addr == 5'h07) dout = curr;
		end

		// read dma register $10 - $17
		if(addr[4:3] == 2'b10)
			dout = rx_buffer[rx_r_cnt];

	end
end

reg resetD;

// delay internal reset signal
always @(posedge clk) resetD <= reset;

// generate an internal strobe signal to copy mac address and to setup header
wire int_strobe_en = ((rx_w_state == RX_W_MAC)||(rx_w_state == RX_W_HEADER)) ? 1'b1 : 1'b0;

// internal mac transfer is started at the begin of the reset, internal header
// transfer is started at the end of the data transmission
wire int_begin = (reset & !resetD) || header_begin;

// Several sources can write into the rx_buffer. The user_io SPI client receiving 
// data from the io controller or the ethernec core itself setting the mac address
// or adding the rx header 

wire rx_write_en = rx_strobe || int_strobe_en;
wire rx_write_begin = (!rx_begin_d & rx_begin) || int_begin;

reg rx_lastByte;

// the ne2000 page size is 256 bytes. thus the page counters are increased
// every 256 bytes when a data transfer is in progress. First page is used when
// the first byte is written to 0x0004
wire rx_new_page = (rx_w_state == RX_W_DATA) && ((rx_w_cnt[7:0] == 8'h00) || (rx_w_cnt == 14'h0004));
reg rx_new_pageD;
always @(posedge clk)
	rx_new_pageD <= rx_new_page;
	
// -------- dummy page counter ---------
reg [7:0] rx_page_cnt;
always @(posedge clk) begin
	if(rx_new_page && !rx_new_pageD)
		rx_page_cnt <= rx_page_cnt + 8'd1;
end

// state/counter handling on one edge
always @(posedge clk) begin
	if(rx_write_begin) begin
		if(rx_w_state == RX_W_MAC || rx_w_state == RX_W_HEADER) begin
			rx_w_cnt <= 16'd0;  // mac and header is written to begin of buffer
		end else  begin
			// payload starts at byte 4 (after ne2000 header)
			rx_w_cnt <= 16'd4;
		end
		
	end else if (rx_write_en) begin
		if(rx_w_state != RX_W_IDLE) begin
			// after reset the mac is written to the first 6 bytes of the rx buffer
			rx_w_cnt <= rx_w_cnt + 16'd1;
		end 
	end
end

reg [15:0] rx_len;  // number of bytes received from io controller

wire [7:0] header_byte = 
	(rx_w_cnt==0)?8'h01:
	(rx_w_cnt==1)?curr:
	(rx_w_cnt==2)?rx_len[7:0]:
	(rx_w_cnt==3)?rx_len[15:8]:
	8'h55;

always @(posedge clk) begin
	rx_lastByte <= 1'b0;

	if(((rx_w_state == RX_W_MAC) && (rx_w_cnt == 3'd6)) ||
		((rx_w_state == RX_W_HEADER) && (rx_w_cnt == 3'd4)))
		rx_lastByte <= !rx_write_begin;
end

// data transfer on other edge
always @(posedge clk) begin
	if (rx_write_en) begin
		case (rx_w_state)
			RX_W_MAC:    rx_buffer[rx_w_cnt] <= mac[rx_w_cnt];
			RX_W_DATA:   rx_buffer[rx_w_cnt] <= rx_byte;
			RX_W_HEADER: rx_buffer[rx_w_cnt] <= header_byte;
			default: ;
		endcase
	end
end

// register to delay receive counter increment by one cycle so this 
// does happen after the read cycle has finished
reg rx_inc;
reg tx_inc;

// generate flag indicating that a header transfer is about to begin
reg header_begin;
always @(posedge clk) begin
	header_begin <= 1'b0;

	if(rx_begin_d & !rx_begin)
		header_begin <= 1'b1;
end

// write counter - header size (4) = number of bytes written
always @(posedge clk)
	if (rx_begin_d & !rx_begin)
		rx_len <= rx_w_cnt - 16'd4;
		
// cpu write via read
always @(posedge clk) begin

	// rising edge of new page signal causes current page counter to advance
	// make sure counter stays within the limits of pstart/pstop
	if(rx_new_page && !rx_new_pageD) begin
		if(curr == (pstop-8'd1)) curr <= pstart;
		else              		 curr <= curr + 8'd1;
	end

	// last byte ends a mac or header transfer and causes the
	// receiver state machine to return to the idle state
	if(rx_lastByte) begin
		rx_w_state <= RX_W_IDLE;
		
		// trigger rx interrupt (PRX) at end of transfer
		if(rx_w_state == RX_W_HEADER) 
			isr[0] <= 1'b1;
	end

	// The rising edge of rx_begin indicates the start of a data transfer
	if(!rx_begin_d && rx_begin)
		rx_w_state <= RX_W_DATA;

	// The falling edge of rx_begin marks the end of a data transfer.
	// So we start setting up the pkt header after the end of the transfer
	if(rx_begin_d && !rx_begin) 
		rx_w_state <= RX_W_HEADER;

	// cpu has read a byte from the rx buffer -> increase rx buffer read pointer
	rx_inc <= 1'b0;
	if(rx_inc && (rx_r_cnt < FRAMESIZE))
		rx_r_cnt <= rx_r_cnt + 16'd1;

	// cpu has written a byte to the tx buffer -> increase tx buffer write pointer
	tx_inc <= 1'b0;
	if(tx_inc && (tx_w_cnt < FRAMESIZE))
		tx_w_cnt <= tx_w_cnt + 16'd1;

	// signal end of transmission if tx buffer has been read by
	// io controller
	if(tx_done) begin
		isr[1] <= 1'b1;  // PTX
		statusCode <= STATUS_TX_DONE;
	end
	
	// if cpu reads have internal side effects then ths is handled
	// here (and not in the "register read" block above)
	if(ne_read_en) begin
		// register page 0
		if(ps == 2'd0) begin
		end
		
		// register page 1
		if(ps == 2'd1) begin
		end

		// read dma register $10-$17
		if(addr[4:3] == 2'b10)
			rx_inc <= 1'b1;
		
		// read reset register $18-$1f
		if(addr[4:3] == 2'b11) begin
			reset <= 1'b1;      // read to reset register sets reset
			isr[7] <= 1'b1;     // set reset flag in isr
			
			statusCode <= STATUS_IDLE;
			rx_w_state <= RX_W_MAC;   // mac address copy
		end
	end

	if(ne_write_en) begin
		if(addr == 5'h00) begin	
			cr <= din;
			
			// writing the command register may actually start things ...

			// check for remote read
			if(din[5:3] == 3'd1) begin
				// this sets the receive counter, so data is being
				// read from the position specified in rsar of the buffer	
				rx_r_cnt <= { 8'h00, rsar[7:0] };		
			end

			// check for remote write
			if(din[5:3] == 3'd2) begin
				// this resets the transmit counter, so data is being
				// written to the beginning of the buffer	
				tx_w_cnt <= 16'h0000;
			end

			// check if TX bit was set
			if(din[2]) begin
				// tx buffer is now full and its contents need to be sent to
				// the io controller which in turn forwards it to its own nic

				// number of bytes to be transmitted is in tbcr, tx_w_cnt should
				// contain the same value since this is the number of write
				// cycles performed on the tx buffer
				statusCode <= STATUS_TX_PENDING;
				
				// once the io controller has sent the packet bit 2 in the isr
				// is being set. This will cause the ne2000 driver on atari side
				// to start filling the tx buffer again
			end
			
		end
			
		// register page 0
		if(ps == 2'd0) begin
			case (addr)
				5'h01: pstart <= din;
				5'h02: pstop <= din;
				5'h03: bnry <= din;
				5'h04: tpsr <= din;
				5'h05: tbcr[7:0] <= din;
				5'h06: tbcr[15:8] <= din;
				5'h07: isr <= isr & (~din);   // writing 1 clears bit
				5'h08: rsar[7:0] <= din;
				5'h09: rsar[15:8] <= din;
				5'h0a: rbcr[7:0] <= din;
				5'h0b: rbcr[15:8] <= din;
				5'h0c: rcr <= din;
				5'h0d: tcr <= din;
				5'h0e: dcr <= din;
				5'h0f: imr <= din;
				default: ;
			endcase
		end
		
		// register page 1
		if(ps == 2'd1) begin
			if((addr >= 5'h01) && (addr < 5'h07)) 
				par[addr-5'd1] <= din;
				
			if(addr == 5'h07) curr <= din;
			
			if((addr >= 5'h08) && (addr < 5'h10)) 
				mar[addr-5'd8] <= din;
		end

		// write to dma register $10-$17
		if(addr[4:3] == 2'b10) begin
			// prevent writing over end of buffer (whatever then happens ...)
			if(tx_w_cnt < FRAMESIZE) begin
				// store byte in buffer
				tx_buffer[tx_w_cnt] <= din;
			
				// increase byte counter
				tx_inc <= 1'b1;
			end
		end
		
		// reset register $18-$1f
		if(addr[4:3] == 2'b11)
			reset <= 1'b0; // write to reset register clears reset

	end
end

endmodule
