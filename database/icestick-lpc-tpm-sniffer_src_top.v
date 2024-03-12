/*
 * iCEstick LPC TPM Sniffer (top.v)
 * 
 * LPC TPM Sniffer
 * 
 * based on Alexander Couzens' LPC Sniffer
 * with TPM-specific modifications by Denis Andzakovic
 * 
 * slightly modified end refactored by Matthias Deeg, SySS GmbH
 * 
 */

module top(
	input wire clk,
	input wire [3:0] lpc_ad,                // LPC address
	input wire lpc_clk,                     // LPC clock
	input wire lpc_frame,                   // LPC frame
	input wire lpc_reset,                   // LPC reset
	input wire fscts,                       // fast serial clear-to-send
	input wire fsdo,                        // fast serial data out
	output wire fsdi,                       // fast serial data in
	output wire fsclk,                      // fast serial clock
	output wire lpc_clk_led,                // LPC clock LED
	output wire lpc_frame_led,              // LPC frame LED
	output wire lpc_reset_led,              // LPC reset LED
	output wire valid_lpc_output_led,       // LPC valid output LED
	output wire overflow_led                // overflow LED
);

    // PLL
	wire sys_clk;                           // system clock
	wire pll_locked;                        // PLL locked

    // power on reset
    wire reset;                             // reset

    // LPC
	wire [3:0] lpc_ad;                      // LPC address
	wire [3:0] dec_cyctype_dir;             // LPC cycle type/direction
	wire [15:0] dec_addr;                   // LPC address
	wire [7:0] dec_data;                    // LPC data
	wire dec_sync_timeout;

    // buffer domain
	wire [31:0] lpc_data;
	wire [31:0] write_data;
	wire lpc_data_enable;

    // ring buffer
	wire read_clk_enable;
	wire write_clk_enable;
	wire empty;
	wire overflow;

    // memory to serial
	wire [31:0] read_data;

    // UART transmitter
	wire uart_ready;
	wire [7:0] uart_data;
	wire uart_clk_enable;
	wire uart_clk;

    // trigger LED
	wire trigger_port;
	wire no_lpc_reset;

    // combinatorial logic
    assign lpc_data[31:16] = dec_addr;
	assign lpc_data[15:8] = dec_data;
	assign lpc_data[7:5] = 0;
	assign lpc_data[4] = dec_sync_timeout;
	assign lpc_data[3:0] = dec_cyctype_dir;
	assign fsclk = sys_clk;
	assign trigger_port = dec_cyctype_dir == 4'b0100;
	assign lpc_clk_led = 0;
	assign lpc_frame_led = 0;
	assign lpc_reset_led = 1;
	assign no_lpc_reset = 1;
	assign overflow_led = overflow;

    // PLL
	pll pll(.clock_in(clk),
		.clock_out(sys_clk),
		.locked(pll_locked)
    );

    // power on reset
	power_on_reset por(
		.clk(sys_clk),
		.pll_locked(pll_locked),
		.reset(reset)
    );

    // LPC decoder
	lpc lpc(
		.reset(reset),
		.lpc_clk(lpc_clk),
		.lpc_ad(lpc_ad),
		.lpc_frame(lpc_frame),
		.lpc_reset(no_lpc_reset),
		.out_cyctype_dir(dec_cyctype_dir),
		.out_addr(dec_addr),
		.out_data(dec_data),
		.out_sync_timeout(dec_sync_timeout),
		.out_clk_enable(lpc_data_enable)
    );

    // buffer domain
	bufferdomain #(.AW(32))
		bufferdomain(
			.clk(sys_clk),
			.reset(reset),
			.input_data(lpc_data),
			.input_enable(lpc_data_enable),
			.output_data(write_data),
			.output_enable(write_clk_enable)
        );

    // ring buffer
	ringbuffer #(.AW(10), .DW(32))
		ringbuffer(
			.clk(sys_clk),
			.reset(reset),
			.write_clk_enable(write_clk_enable),
			.read_clk_enable(read_clk_enable),
			.read_data(read_data),
			.write_data(write_data),
			.empty(empty),
			.overflow(overflow)
        );

    // mem2serial
	mem2serial mem_serial(
		.clk(sys_clk),
		.reset(reset),
		.read_empty(empty),
		.read_clk_enable(read_clk_enable),
		.read_data(read_data),
		.uart_clk_enable(uart_clk_enable),
		.uart_ready(uart_ready),
		.uart_data(uart_data)
    );

    // FTDI fast serial
	ftdi fast_serial(
		.clk(sys_clk),
		.reset(reset),
		.read_data(uart_data),
		.read_clk_enable(uart_clk_enable),
		.ready(uart_ready),
		.fsdi(fsdi),
		.fscts(fscts)
    );

    // trigger LED
	trigger_led trigger_led(
		.clk(sys_clk),
		.reset(reset),
		.trigger(trigger_port),
		.led(valid_lpc_output_led)
    );

endmodule
