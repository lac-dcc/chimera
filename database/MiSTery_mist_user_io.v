module user_io( 
		input      clk_sys,
		input      SPI_CLK,
		input      SPI_SS_IO,
		output     reg SPI_MISO,
		input      SPI_MOSI,
		input [7:0] CORE_TYPE,

		// four extra joysticks
		output reg [15:0] joy0, joy1, joy2, joy3,
		// analogue pads
		output reg [15:0] joystick_analog_0,
		output reg [15:0] joystick_analog_1,

		// status from IO controller
		output reg [31:0] status,
		// RTC data from IO controller
		// sec, min, hour, date, month, year, day (BCD)
		output reg [63:0] rtc,

		// serial data from mfp to io controller
		output reg       serial_strobe_out,
		input            serial_data_out_available,
		input [7:0]      serial_data_out,
		// serial status from mfp to io controller
		input [63:0]     serial_status_out,

		// serial data from io controller to mfp
		output reg       serial_strobe_in,
		output reg [7:0] serial_data_in,
		// serial status from io controller to mfp
		output reg [7:0] serial_status_in,
		
		// parallel data from psg/ym to io controller
		output reg       parallel_strobe_out,
		input            parallel_data_out_available,
		input [7:0]      parallel_data_out,

		// midi data from acia to io controller
		output reg       midi_strobe_out,
		input            midi_data_out_available,
		input [7:0]      midi_data_out,

		// ethernet interface
		input [31:0]     eth_status,
		
		// sending mac address from io controller into core
		output reg       eth_mac_begin,
		output reg       eth_mac_strobe,
		output reg [7:0] eth_mac_byte,
		
		output reg       eth_tx_read_begin,
		output reg       eth_tx_read_strobe,
		input [7:0] 	  eth_tx_read_byte,
	
		output reg       eth_rx_write_begin,
		output reg       eth_rx_write_strobe,
		output reg [7:0] eth_rx_write_byte,

		// ps2 keyboard/mouse emulation
		output           ps2_kbd_clk,
		output reg       ps2_kbd_data,
		output           ps2_mouse_clk,
		output reg       ps2_mouse_data,

		// on-board buttons and dip switches
		output [1:0]     BUTTONS,
		output [1:0]     SWITCHES,
		output           scandoubler_disable,
		output           ypbpr,
		output           no_csync,

		// i2c bridge
		output reg       i2c_start,
		output reg       i2c_read,
		output reg [6:0] i2c_addr,
		output reg [7:0] i2c_subaddr,
		output reg [7:0] i2c_dout,
		input      [7:0] i2c_din,
		input            i2c_ack,
		input            i2c_end,
		input            hdmi_hiclk, // HDMI PCLK > 80 MHz

		// connection to sd card emulation
		input     [31:0] sd_lba,
		input      [1:0] sd_rd,
		input      [1:0] sd_wr,
		output reg       sd_ack,
		output reg       sd_ack_conf,
		input            sd_conf,
		input            sd_sdhc,
		output reg [7:0] sd_dout,     // valid on rising edge of sd_dout_strobe
		output reg       sd_dout_strobe,
		input      [7:0] sd_din,
		output reg       sd_din_strobe,
		output reg [8:0] sd_buff_addr,

		output reg [1:0] img_mounted, // rising edge if a new image is mounted
		output reg[31:0] img_size     // size of image in bytes
);

parameter PS2DIV = 100;

wire spi_sck = SPI_CLK;

reg [3:0] 			byte_cnt;
reg [6:0]         sbuf;
reg [7:0]         cmd;
reg [3:0] 	      bit_cnt;       // 0..15
reg [7:0] 	      but_sw;

// counter runs 0..7,8..15,8..15,8..15
wire [2:0] tx_bit = ~(bit_cnt[2:0]);
	
assign BUTTONS = but_sw[1:0];
assign SWITCHES = but_sw[3:2];
assign scandoubler_disable = but_sw[4];
assign ypbpr = but_sw[5];
assign no_csync = but_sw[6];

// ---------------- PS2 ---------------------
// 8 byte fifos to store ps2 bytes
localparam PS2_FIFO_BITS = 3;

reg ps2_clk;
always @(negedge clk_sys) begin
	integer cnt;
	cnt <= cnt + 1'd1;
	if(cnt == PS2DIV) begin
		ps2_clk <= ~ps2_clk;
		cnt <= 0;
	end
end

// keyboard
reg [7:0] ps2_kbd_fifo [(2**PS2_FIFO_BITS)-1:0];
reg [PS2_FIFO_BITS-1:0] ps2_kbd_wptr;
reg [PS2_FIFO_BITS-1:0] ps2_kbd_rptr;

// ps2 transmitter state machine
reg [3:0] ps2_kbd_tx_state;
reg [7:0] ps2_kbd_tx_byte;
reg ps2_kbd_parity;

assign ps2_kbd_clk = ps2_clk || (ps2_kbd_tx_state == 0);

// ps2 transmitter
// Takes a byte from the FIFO and sends it in a ps2 compliant serial format.
reg ps2_kbd_r_inc;
always@(posedge clk_sys) begin
	reg ps2_clkD;

	ps2_clkD <= ps2_clk;
	if (~ps2_clkD & ps2_clk) begin
		ps2_kbd_r_inc <= 1'b0;

		if(ps2_kbd_r_inc)
			ps2_kbd_rptr <= ps2_kbd_rptr + 1'd1;

		// transmitter is idle?
		if(ps2_kbd_tx_state == 0) begin
			// data in fifo present?
			if(ps2_kbd_wptr != ps2_kbd_rptr) begin
				// load tx register from fifo
				ps2_kbd_tx_byte <= ps2_kbd_fifo[ps2_kbd_rptr];
				ps2_kbd_r_inc <= 1'b1;

				// reset parity
				ps2_kbd_parity <= 1'b1;

				// start transmitter
				ps2_kbd_tx_state <= 4'd1;

				// put start bit on data line
				ps2_kbd_data <= 1'b0;			// start bit is 0
			end
		end else begin

			// transmission of 8 data bits
			if((ps2_kbd_tx_state >= 1)&&(ps2_kbd_tx_state < 9)) begin
				ps2_kbd_data <= ps2_kbd_tx_byte[0];			  // data bits
				ps2_kbd_tx_byte[6:0] <= ps2_kbd_tx_byte[7:1]; // shift down
				if(ps2_kbd_tx_byte[0]) 
					ps2_kbd_parity <= !ps2_kbd_parity;
			end

			// transmission of parity
			if(ps2_kbd_tx_state == 9)
				ps2_kbd_data <= ps2_kbd_parity;
			
			// transmission of stop bit
			if(ps2_kbd_tx_state == 10)
				ps2_kbd_data <= 1'b1;			// stop bit is 1

			// advance state machine
			if(ps2_kbd_tx_state < 11)
				ps2_kbd_tx_state <= ps2_kbd_tx_state + 4'd1;
			else	
				ps2_kbd_tx_state <= 4'd0;
		end
	end
end

// mouse
reg [7:0] ps2_mouse_fifo [(2**PS2_FIFO_BITS)-1:0];
reg [PS2_FIFO_BITS-1:0] ps2_mouse_wptr;
reg [PS2_FIFO_BITS-1:0] ps2_mouse_rptr;

// ps2 transmitter state machine
reg [3:0] ps2_mouse_tx_state;
reg [7:0] ps2_mouse_tx_byte;
reg ps2_mouse_parity;

assign ps2_mouse_clk = ps2_clk || (ps2_mouse_tx_state == 0);

// ps2 transmitter
// Takes a byte from the FIFO and sends it in a ps2 compliant serial format.
reg ps2_mouse_r_inc;
always@(posedge clk_sys) begin
	reg ps2_clkD;

	ps2_clkD <= ps2_clk;
	if (~ps2_clkD & ps2_clk) begin
		ps2_mouse_r_inc <= 1'b0;

		if(ps2_mouse_r_inc)
			ps2_mouse_rptr <= ps2_mouse_rptr + 1'd1;

		// transmitter is idle?
		if(ps2_mouse_tx_state == 0) begin
			// data in fifo present?
			if(ps2_mouse_wptr != ps2_mouse_rptr) begin
				// load tx register from fifo
				ps2_mouse_tx_byte <= ps2_mouse_fifo[ps2_mouse_rptr];
				ps2_mouse_r_inc <= 1'b1;

				// reset parity
				ps2_mouse_parity <= 1'b1;

				// start transmitter
				ps2_mouse_tx_state <= 4'd1;

				// put start bit on data line
				ps2_mouse_data <= 1'b0;			// start bit is 0
			end
		end else begin

			// transmission of 8 data bits
			if((ps2_mouse_tx_state >= 1)&&(ps2_mouse_tx_state < 9)) begin
				ps2_mouse_data <= ps2_mouse_tx_byte[0];			  // data bits
				ps2_mouse_tx_byte[6:0] <= ps2_mouse_tx_byte[7:1]; // shift down
				if(ps2_mouse_tx_byte[0]) 
					ps2_mouse_parity <= !ps2_mouse_parity;
			end

			// transmission of parity
			if(ps2_mouse_tx_state == 9)
				ps2_mouse_data <= ps2_mouse_parity;

			// transmission of stop bit
			if(ps2_mouse_tx_state == 10)
				ps2_mouse_data <= 1'b1;			// stop bit is 1

			// advance state machine
			if(ps2_mouse_tx_state < 11)
				ps2_mouse_tx_state <= ps2_mouse_tx_state + 4'd1;
			else	
				ps2_mouse_tx_state <= 4'd0;
		end
	end
end



// prepent "a5" to status to make sure io controller can detect that a core
// doesn't support the command
wire [63+8:0] serial_status_out_x = { 8'ha5, serial_status_out };

wire drive_sel = sd_rd[1] | sd_wr[1];

always@(negedge spi_sck) begin
	reg [31:0] sd_lba_r;
	reg  [7:0] drive_sel_r;
	reg  [7:0] sd_cmd;
	reg  [7:0] sd_din_r;

	sd_cmd <= { 4'h6, sd_conf, sd_sdhc, sd_wr[drive_sel], sd_rd[drive_sel] };
	if(&bit_cnt[2:0]) sd_din_r <= sd_din;

	if(bit_cnt <= 7)
		SPI_MISO <= CORE_TYPE[7-bit_cnt];
	else begin

			// serial mfp->io controller
			if(cmd == 8'h1b) begin
				if(!byte_cnt[0])
					SPI_MISO <= serial_data_out_available;
				else
					SPI_MISO <= serial_data_out[tx_bit];
			end
			
			// parallel psg/ym->io controller
			if(cmd == 6) begin
				if(!byte_cnt[0])
					SPI_MISO <= parallel_data_out_available;
				else
					SPI_MISO <= parallel_data_out[tx_bit];
			end
			
			// midi->io controller
			if(cmd == 8) begin
				if(!byte_cnt[0])
					SPI_MISO <= midi_data_out_available;
				else
					SPI_MISO <= midi_data_out[tx_bit];
			end
			
			// ethernet status
			if(cmd == 8'h0a)
				SPI_MISO <= eth_status[{~byte_cnt[1:0], tx_bit}];

			// read ethernet tx buffer
			if(cmd == 8'h0b)
				SPI_MISO <= eth_tx_read_byte[tx_bit];
				
			// serial status
			if(cmd == 8'h0d)
				SPI_MISO <= serial_status_out_x[{4'h8-byte_cnt, tx_bit}];

			// reading sd card status
			if(cmd == 8'h16) begin
				if(byte_cnt == 0) begin
					SPI_MISO <= sd_cmd[tx_bit];
					sd_lba_r <= sd_lba;
					drive_sel_r <= {7'b0, drive_sel};
				end
				else if(byte_cnt == 1) SPI_MISO <= drive_sel_r[tx_bit];
				else if(byte_cnt < 6) SPI_MISO <= sd_lba_r[{5-byte_cnt, tx_bit}];
			end

			// reading sd card write data
			if(cmd == 8'h18) SPI_MISO <= sd_din_r[tx_bit];

			if(cmd == 8'h31) begin
				if (byte_cnt == 0) SPI_MISO <= tx_bit == 0 ? i2c_end : tx_bit == 1 ? i2c_ack : tx_bit == 2 ? hdmi_hiclk : 1'b0;
				else SPI_MISO <= i2c_din[tx_bit];
			end

	end
end

// SPI receiver IO -> FPGA

reg       spi_receiver_strobe_r = 0;
reg       spi_transfer_end_r = 1;
reg [7:0] spi_byte_in;

always@(posedge spi_sck, posedge SPI_SS_IO) begin
	if(SPI_SS_IO == 1) begin
		bit_cnt <= 4'd0;
		byte_cnt <= 4'd0;

		// ethernet
		eth_tx_read_begin <= 1'b0;
		eth_tx_read_strobe <= 1'b0;

		spi_transfer_end_r <= 1;

	end else begin
		spi_transfer_end_r <= 0;

		// finished reading a byte, prepare to transfer to clk_sys
		if(bit_cnt == 4'd7 || bit_cnt == 4'd15) begin
			spi_byte_in <= { sbuf, SPI_MOSI};
			spi_receiver_strobe_r <= ~spi_receiver_strobe_r;
		end

		sbuf[6:1] <= sbuf[5:0];
		sbuf[0] <= SPI_MOSI;

		// count 0-7 8-15 8-15 8-15
		if(bit_cnt != 4'd15)
			bit_cnt <= bit_cnt + 4'd1;
		else begin
			bit_cnt <= 4'd8;
			byte_cnt <= byte_cnt + 4'd1;
		end

		// command byte finished
		if(bit_cnt == 7) begin
			cmd[7:1] <= sbuf; 
			cmd[0] <= SPI_MOSI;

			// just finished the mac command byte? -> set begin flag
			if( { sbuf, SPI_MOSI} == 8'h0b ) begin
				eth_tx_read_begin <= 1'b1;
				eth_tx_read_strobe <= 1'b1;
			end

		end

		if(bit_cnt == 9) begin
			eth_tx_read_strobe <= 1'b0;
		end

		// payload byte finished
		if(bit_cnt == 15) begin

			// give strobe after each eth byte read
			if(cmd == 8'h0b)
				eth_tx_read_strobe <= 1'b1;

			// serial_status from io controller
			if((cmd == 8'h0d) && (byte_cnt == 1))
				serial_status_in <= { sbuf, SPI_MOSI };

		end
	end
end

// Process bytes from SPI at the clk_sys domain
always @(posedge clk_sys) begin

	reg       spi_receiver_strobe;
	reg       spi_transfer_end;
	reg       spi_receiver_strobeD;
	reg       spi_transfer_endD;
	reg [7:0] acmd;
	reg [7:0] abyte_cnt;   // counts bytes

	reg [2:0] stick_idx;

	i2c_start <= 0;
	eth_mac_begin <= 0;
	eth_mac_strobe <= 0;
	eth_rx_write_strobe <= 0;
	serial_strobe_out <= 0;
	parallel_strobe_out <= 0;
	midi_strobe_out <= 0;
	serial_strobe_in <= 0;

	//synchronize between SPI and sys clock domains
	spi_receiver_strobeD <= spi_receiver_strobe_r;
	spi_receiver_strobe <= spi_receiver_strobeD;
	spi_transfer_endD	<= spi_transfer_end_r;
	spi_transfer_end	<= spi_transfer_endD;

	if (spi_transfer_end) begin
		abyte_cnt <= 8'd0;
		eth_rx_write_begin <= 0;
	end else if (spi_receiver_strobeD ^ spi_receiver_strobe) begin

		if(~&abyte_cnt) 
			abyte_cnt <= abyte_cnt + 8'd1;
		else
			abyte_cnt[0] <= ~abyte_cnt[0];

		if(abyte_cnt == 0) begin
			acmd <= spi_byte_in;
			if (spi_byte_in == 8'h09) eth_mac_begin <= 1;
			if (spi_byte_in == 8'h0c)	eth_rx_write_begin <= 1;
		end else begin
			case(acmd)
				// buttons and switches
				8'h01: but_sw <= spi_byte_in;
				8'h60: if (abyte_cnt < 5) joy0[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;
				8'h61: if (abyte_cnt < 5) joy1[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;
				8'h62: if (abyte_cnt < 5) joy2[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;
				8'h63: if (abyte_cnt < 5) joy3[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;
				8'h70: begin
					// store incoming ps2 mouse bytes 
					ps2_mouse_fifo[ps2_mouse_wptr] <= spi_byte_in;
					ps2_mouse_wptr <= ps2_mouse_wptr + 1'd1;
				end
				8'h05: begin
					// store incoming ps2 keyboard bytes 
					ps2_kbd_fifo[ps2_kbd_wptr] <= spi_byte_in;
					ps2_kbd_wptr <= ps2_kbd_wptr + 1'd1;
				end

				// send mac address byte to ethernet controller
				8'h09: begin
					eth_mac_byte <= spi_byte_in;
					eth_mac_strobe <= 1;
				end

				// give strobe after each eth byte written
				8'h0c: begin
					eth_rx_write_byte <= spi_byte_in;
					eth_rx_write_strobe <= 1;
				end

				// joystick analog
				8'h1a: begin
					// first byte is joystick index
					if(abyte_cnt == 1)
						stick_idx <= spi_byte_in[2:0];
					else if(abyte_cnt == 2) begin
						// second byte is x axis
						if(stick_idx == 0)
							joystick_analog_0[15:8] <= spi_byte_in;
						else if(stick_idx == 1)
							joystick_analog_1[15:8] <= spi_byte_in;
					end else if(abyte_cnt == 3) begin
						// third byte is y axis
						if(stick_idx == 0)
							joystick_analog_0[7:0] <= spi_byte_in;
						else if(stick_idx == 1)
							joystick_analog_1[7:0] <= spi_byte_in;
					end
				end

				8'h1b: if (!abyte_cnt[0]) serial_strobe_out <= 1;
				8'h06: if (!abyte_cnt[0])	parallel_strobe_out <= 1;
				8'h08: if (!abyte_cnt[0])	midi_strobe_out <= 1;

				8'h15: status <= spi_byte_in;

				// status, 32bit version
				8'h1e: if(abyte_cnt<5) status[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;

				8'h20: begin
					serial_data_in <= spi_byte_in; 
					serial_strobe_in <= 1;
				end

				// RTC
				8'h22: if(abyte_cnt<9) rtc[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;

				// I2C bridge
				8'h30: if(abyte_cnt == 1) {i2c_addr, i2c_read} <= spi_byte_in;
				       else if (abyte_cnt == 2) i2c_subaddr <= spi_byte_in;
				       else if (abyte_cnt == 3) begin i2c_dout <= spi_byte_in; i2c_start <= 1; end
			endcase
		end
	end
end

// Process SD-card related bytes from SPI at the clk_sys domain
always @(posedge clk_sys) begin

	reg       spi_receiver_strobe;
	reg       spi_transfer_end;
	reg       spi_receiver_strobeD;
	reg       spi_transfer_endD;
	reg [1:0] sd_wrD;
	reg [7:0] acmd;
	reg [4:0] abyte_cnt;   // counts bytes

	//synchronize between SPI and sd clock domains
	spi_receiver_strobeD <= spi_receiver_strobe_r;
	spi_receiver_strobe <= spi_receiver_strobeD;
	spi_transfer_endD	<= spi_transfer_end_r;
	spi_transfer_end	<= spi_transfer_endD;

    if(sd_dout_strobe) begin
        sd_dout_strobe<= 0;
        if(~&sd_buff_addr) sd_buff_addr <= sd_buff_addr + 1'b1;
    end

    sd_din_strobe<= 0;
    sd_wrD <= sd_wr;
    // fetch the first byte immediately after the write command seen
    if ((~sd_wrD[0] & sd_wr[0]) || (~sd_wrD[1] & sd_wr[1])) begin
        sd_buff_addr <= 0;
        sd_din_strobe <= 1;
    end

	img_mounted <= 0;

	if (spi_transfer_end) begin
		abyte_cnt <= 0;
		sd_ack <= 1'b0;
		sd_ack_conf <= 1'b0;
		sd_dout_strobe <= 1'b0;
		sd_din_strobe <= 1'b0;
		sd_buff_addr<= 0;
	end else if (spi_receiver_strobeD ^ spi_receiver_strobe) begin

		if(~&abyte_cnt) 
			abyte_cnt <= abyte_cnt + 8'd1;

		if(abyte_cnt == 0) begin
			acmd <= spi_byte_in;

			if((spi_byte_in == 8'h17) || (spi_byte_in == 8'h18))
				sd_ack <= 1'b1;

			if (spi_byte_in == 8'h18) begin
				sd_din_strobe <= 1'b1;
				sd_buff_addr <= sd_buff_addr + 1'b1;
			end

		end else begin
			case(acmd)

				// send sector IO -> FPGA
				8'h17: begin
					// flag that download begins
					sd_dout_strobe <= 1'b1;
					sd_dout <= spi_byte_in;
				end

				8'h18: begin
					sd_din_strobe <= 1'b1;
					if(~&sd_buff_addr) sd_buff_addr <= sd_buff_addr + 1'b1;
				end

				// send SD config IO -> FPGA
				8'h19: begin
					// flag that download begins
					sd_dout_strobe <= 1'b1;
					sd_ack_conf <= 1'b1;
					sd_dout <= spi_byte_in;
				end

				8'h1c: img_mounted[spi_byte_in[0]] <= 1;

				// send image info
				8'h1d: if(abyte_cnt<5) img_size[(abyte_cnt-1)<<3 +:8] <= spi_byte_in;
			endcase
		end
	end
end

endmodule
