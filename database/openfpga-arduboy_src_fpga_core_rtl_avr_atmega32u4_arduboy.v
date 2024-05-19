// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the MEGA/XMEGA ATMEGA32A4 implementation.
 * 
 * Copyright (C) 2020  Iulian Gheorghiu (morgoth@devboard.tech)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
`timescale 1ns / 1ps

`include "mega-def.v"

/* ATMEGA32U4 is a "MEGA_ENHANCED_128K" family */
/*`define CORE_TYPE				`MEGA_ENHANCED_128K
`define ROM_ADDR_WIDTH			15 // 14 = 16K Words / 32K Bytes; 15 = 32K Words / 64K Bytes; 16 = 64K Words / 128K Bytes Not supported yet.
`define BOOT_ADDR_WIDTH			10 // 1024 Words / 2048 Bytes, how big the first stage boot-loader ROM to be.
`define BUS_ADDR_DATA_LEN		16 // Max 64K Bytes.
`define RAM_TYPE				"SRAM"  // "BLOCK","SRAM"// If "SRAM" is choosen, will be a 32KB block of RAM.
`define RAM_ADDR_WIDTH			15 // 32KB, if you use "SRAM" this value need to be 15.
`define EEP_ADDR_WIDTH			10 // 1K Bytes.
`define RESERVED_RAM_FOR_IO		12'h100 // Lowest 256 Bytes of RAM addresses are reserved for IO's.

`define VECTOR_INT_TABLE_SIZE	43// 42 of original ATmega32U4 + NMI
`define WATCHDOG_CNT_WIDTH		0//27 // We do not use watchdog, is not a critical design and most of arduboy games does not use him.*/

/* TIMMERS PRESCALLERS MODULE */
module tim_013_prescaller (
	input rst,
	input clk,
	output clk8,
	output clk64,
	output clk256,
	output clk1024
);
reg [9:0]cnt;

always @(posedge clk)
begin
	if(rst)
		cnt <= 10'h000;
	else
		cnt <= cnt + 10'd1;
end

assign clk8 = cnt[2];
assign clk64 = cnt[5];
assign clk256 = cnt[7];
assign clk1024 = cnt[9];

endmodule
/* !TIMMERS PRESCALLERS MODULE */

module atmega32u4_arduboy # (
	parameter PLATFORM = "XILINX",
	parameter BOOT_ADDR = 0,
	parameter ARDU_FPGA_ICE40UP5K_GAME = "FALSE",

	parameter CORE_TYPE = `MEGA_ENHANCED_128K,
	parameter ROM_ADDR_WIDTH = 15, // 14 = 16K Words / 32K Bytes; 15 = 32K Words / 64K Bytes; 16 = 64K Words / 128K Bytes Not supported yet.
	parameter BOOT_ADDR_WIDTH = 10, // 1024 Words / 2048 Bytes, how big the first stage boot-loader ROM to be.
	parameter BUS_ADDR_DATA_LEN = 16, // Max 64K Bytes.
	parameter RAM_TYPE = "SRAM",  // "BLOCK","SRAM"// If "SRAM" is choosen, will be a 32KB block of RAM.
	parameter RAM_ADDR_WIDTH = 15, // 32KB, if you use "SRAM" this value need to be 15.
	parameter EEP_ADDR_WIDTH = 10, // 1K Bytes.
	parameter RESERVED_RAM_FOR_IO = 12'h100, // Lowest 256 Bytes of RAM addresses are reserved for IO's.
	parameter VECTOR_INT_TABLE_SIZE = 43,// 42 of original ATmega32U4 + NMI
	parameter WATCHDOG_CNT_WIDTH = 0,//27 // We do not use watchdog, is not a critical design and most of arduboy games does not use him.

	parameter REGS_REGISTERED = "FALSE",
	parameter ROM_PATH = "",
	parameter USE_PIO_B = "TRUE",
	parameter USE_PIO_C = "TRUE",
	parameter USE_PIO_D = "TRUE",
	parameter USE_PIO_E = "TRUE",
	parameter USE_PIO_F = "TRUE",
	parameter USE_PLL = "TRUE",
	parameter USE_PLL_HI_FREQ = "FALSE",
	parameter USE_TIMER_0 = "TRUE",
	parameter USE_REDUCED_TIM0 = "TRUE",
	parameter USE_TIMER_1 = "TRUE",
	parameter USE_REDUCED_TIM1 = "TRUE",
	parameter USE_TIMER_3 = "TRUE",
	parameter USE_REDUCED_TIM3 = "TRUE",
	parameter USE_TIMER_4 = "TRUE",
	parameter USE_SPI_1 = "TRUE",
	parameter USE_UART_1 = "TRUE",
	parameter USE_USB2UART = "FALSE",
	parameter UART_TX_ENABLED = "TRUE",
	parameter UART_RX_ENABLED = "TRUE",
	parameter USE_TWI_1 = "TRUE",
	parameter TWI_IP = "STANDARD", // "STANDARD", "CUSTOM", "HW"
	parameter USE_EEPROM = "TRUE",
	parameter USE_RNG_AS_ADC ="TRUE"
)(
	input core_rst,
	input dev_rst,
	input clk,
	input clk48m_i,
	input clk_pll,
	input nmi_sig,
	output nmi_ack,
	input sec_reg_rst,
	output sec_en,
    input [5:0] buttons,
    output [2:0] RGB,
    output Buzzer1, Buzzer2, OledDC, OledCS, OledRST, spi_scl, spi_mosi, uSD_CS, ADC_CS,
	output VS_RST, VS_xCS, VS_xDCS,
	input VS_DREQ,
	input spi_miso,
	input uSD_CD,
	output uart_tx,
	input uart_rx,
	inout twi_scl,
	inout twi_sda,

	inout usbp_io,
	inout usbn_io,

	output [15:0]pgm_addr,
	input [15:0]pgm_data,

/* For IO's that are not included in original ATmega32u4 device */
	output [7:0]io_addr,
	output [7:0]io_out,
	output io_write,
	input [7:0]io_in,
	output io_read,
	output io_sel,
	output io_rst,
	output nmi_rst
	);

wire core_clk = clk;
wire wdt_rst;
 
/* CORE WIRES */
wire [BUS_ADDR_DATA_LEN-1:0]data_addr;
wire [7:0]core_data_out;
wire data_write;
wire [7:0]core_data_in;
wire data_read;
wire ram_sel = |data_addr[BUS_ADDR_DATA_LEN-1:8];

/* Removed for Pocket
wire boot_ram_sel = &data_addr[BUS_ADDR_DATA_LEN-1:9];
wire app_ram_sel = ram_sel & ~boot_ram_sel;

wire boot_rom_select = &pgm_addr[ROM_ADDR_WIDTH - 1 : BOOT_ADDR_WIDTH];
*/

assign io_addr = data_addr[7:0];
assign io_out = core_data_out;
assign io_write = data_write & io_sel;
assign io_read = data_read & io_sel;
assign io_sel = ~ram_sel;

/* !CORE WIRES */


/* IO WIRES */
wire [7:0]pb_in;
wire [7:0]pc_in;
wire [7:0]pd_in;
wire [7:0]pe_in;
wire [7:0]pf_in;
wire [7:0]pb_out;
wire [7:0]pc_out;
wire [7:0]pd_out;
wire [7:0]pe_out;
wire [7:0]pf_out;
/* !IO WIRES */

/* IO PIN FUNCTION CHANGE REQUEST */
wire [7:0]piob_out_io_connect;
wire [7:0]pioc_out_io_connect;
wire [7:0]piod_out_io_connect;
wire [7:0]pioe_out_io_connect;
wire [7:0]piof_out_io_connect;
wire tim0_oca_io_connect;
wire tim0_ocb_io_connect;
wire tim1_oca_io_connect;
wire tim1_ocb_io_connect;
wire tim1_occ_io_connect;
wire tim3_oca_io_connect;
wire tim3_ocb_io_connect;
wire tim3_occ_io_connect;
wire tim4_ocap_io_connect;
wire tim4_ocan_io_connect;
wire tim4_ocbp_io_connect;
wire tim4_ocbn_io_connect;
wire tim4_occp_io_connect;
wire tim4_occn_io_connect;
wire tim4_ocdp_io_connect;
wire tim4_ocdn_io_connect;
wire uart_tx_io_connect;
wire spi_io_connect;
wire io_conn_slave;
/* !IO PIN FUNCTION CHANGE REQUEST */
wire pll_enabled;
/* IO ALTERNATIVE FUNCTION */
wire tim0_oca;
wire tim0_ocb;
wire tim1_oca;
wire tim1_ocb;
wire tim1_occ;
wire tim3_oca;
wire tim3_ocb;
wire tim3_occ;
wire tim4_oca;
wire tim4_ocb;
wire tim4_occ;
wire tim4_ocd;
//wire spi_scl;
//wire spi_miso;
//wire spi_mosi;
//wire uart_tx;
//wire uart_rx;
wire usb_ck_out;
wire tim_ck_out;
/* !IO ALTERNATIVE FUNCTION */


assign VS_xCS = pb_out[0];

assign pb_in[4] = buttons[5]; // BUTTON B

// RGB LED is common anode (ie. HIGH = OFF)
assign RGB[0] = pb_out[5];
assign RGB[2] = pb_out[6];
assign RGB[1] = pb_out[7];

assign Buzzer1 = tim4_ocan_io_connect ? ~tim4_oca : pc_out[6];
assign Buzzer2 = tim4_ocap_io_connect ? tim4_oca : pc_out[7];

assign VS_RST = pd_out[0];
assign pd_in[1] = uSD_CD;
assign uSD_CS = pd_out[2];
assign ADC_CS = pd_out[3];
assign OledDC = pd_out[4];
assign VS_xDCS = pd_out[5];
assign OledCS = pd_out[6];
assign OledRST = pd_out[7];

assign pe_in[6] = buttons[4]; // BUTTON A

assign pf_in[0] = VS_DREQ;

assign pf_in[4] = buttons[2]; // BUTTON DOWN
assign pf_in[5] = buttons[1]; // BUTTON LEFT
assign pf_in[6] = buttons[0]; // BUTTON RIGHT
assign pf_in[7] = buttons[3]; // BUTTON UP

/* Interrupt wires */
wire int_int0 = 0;
wire int_int1 = 0;
wire int_int2 = 0;
wire int_int3 = 0;
wire int_reserved0 = 0;
wire int_reserved1 = 0;
wire int_int6 = 0;
wire int_reserved3 = 0;
wire int_pcint0 = 0;
wire int_usb_general = 0;
wire int_usb_endpoint = 0;
wire int_wdt = 0;
wire int_reserved4 = 0;
wire int_reserved5 = 0;
wire int_reserved6 = 0;
wire int_timer1_capt = 0;
wire int_timer1_compa;
wire int_timer1_compb;
wire int_timer1_compc;
wire int_timer1_ovf;
wire int_timer0_compa;
wire int_timer0_compb;
wire int_timer0_ovf;
wire int_spi_stc;
wire int_usart1_rx;
wire int_usart1_udre;
wire int_usart1_tx;
wire int_analog_comp = 0;
wire int_adc = 0;
wire int_ee_ready;
wire int_timer3_capt = 0;
wire int_timer3_compa;
wire int_timer3_compb;
wire int_timer3_compc;
wire int_timer3_ovf;
wire int_twi;
wire int_spm_ready = 0;
wire int_timer4_compa;
wire int_timer4_compb;
wire int_timer4_compd;
wire int_timer4_ovf;
wire int_timer4_fpf = 0;
/* !Interrupt wires */

/* Interrupt reset wires */
wire int_int0_ack;
wire int_int1_ack;
wire int_int2_ack;
wire int_int3_ack;
wire int_reserved0_ack;
wire int_reserved1_ack;
wire int_int6_ack;
wire int_reserved3_ack;
wire int_pcint0_ack;
wire int_usb_general_ack;
wire int_usb_endpoint_ack;
wire int_wdt_ack;
wire int_reserved4_ack;
wire int_reserved5_ack;
wire int_reserved6_ack;
wire int_timer1_capt_ack;
wire int_timer1_compa_ack;
wire int_timer1_compb_ack;
wire int_timer1_compc_ack;
wire int_timer1_ovf_ack;
wire int_timer0_compa_ack;
wire int_timer0_compb_ack;
wire int_timer0_ovf_ack;
wire int_spi_stc_ack;
wire int_usart1_rx_ack;
wire int_usart1_udre_ack;
wire int_usart1_tx_ack;
wire int_analog_comp_ack;
wire int_adc_ack;
wire int_ee_ready_ack;
wire int_timer3_capt_ack;
wire int_timer3_compa_ack;
wire int_timer3_compb_ack;
wire int_timer3_compc_ack;
wire int_timer3_ovf_ack;
wire int_twi_ack;
wire int_spm_ready_ack;
wire int_timer4_compa_ack;
wire int_timer4_compb_ack;
wire int_timer4_compd_ack;
wire int_timer4_ovf_ack;
wire int_timer4_fpf_ack;
/* !Interrupt reset wires */

/* PORTB */
wire [7:0]dat_pb_d_out;
generate
if (USE_PIO_B == "TRUE")
begin: PORTB
atmega_pio # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.PORT_OUT_ADDR('h25),
	.DDR_ADDR('h24),
	.PIN_ADDR('h23),
	.PINMASK(8'b11110001),
	.PULLUP_MASK(8'b00000000),
	.PULLDN_MASK(8'b00000000),
	.INVERSE_MASK(8'b00000000),
	.OUT_ENABLED_MASK(8'b11101111),
	.INITIAL_OUTPUT_VALUE(8'b00001001),
	.INITIAL_DIR_VALUE(8'b00001001)
)pio_b(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_pb_d_out),

	.io_i(pb_in),
	.io_o(pb_out),
	.pio_out_io_connect_o(piob_out_io_connect)
	);
end
else
begin
assign dat_pb_d_out = 0;
end
endgenerate
/* !PORTB */

/* PORTC */
wire [7:0]dat_pc_d_out;
generate
if (USE_PIO_C == "TRUE")
begin: PORTC
atmega_pio # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.PORT_OUT_ADDR('h28),
	.DDR_ADDR('h27),
	.PIN_ADDR('h26),
	.PINMASK(8'b11000000),
	.PULLUP_MASK(8'b00000000),
	.PULLDN_MASK(8'b00000000),
	.INVERSE_MASK(8'b00000000),
	.OUT_ENABLED_MASK(8'b11000000),
	.INITIAL_OUTPUT_VALUE(8'b00000000),
	.INITIAL_DIR_VALUE(8'b00000000)
)pio_c(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_pc_d_out),

	.io_i(pc_in),
	.io_o(pc_out),
	.pio_out_io_connect_o(pioc_out_io_connect)
	);
end
else
begin
assign dat_pc_d_out = 0;
end
endgenerate
/* !PORTC */

/* PORTD */
wire [7:0]dat_pd_d_out;
generate
if (USE_PIO_D == "TRUE")
begin: PORTD
atmega_pio # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.PORT_OUT_ADDR('h2b),
	.DDR_ADDR('h2a),
	.PIN_ADDR('h29),
	.PINMASK(8'b11111111),
	.PULLUP_MASK(8'b00000000),
	.PULLDN_MASK(8'b00000000),
	.INVERSE_MASK(8'b00000000),
	.OUT_ENABLED_MASK(8'b11111101),
	.INITIAL_OUTPUT_VALUE(8'b01111100),
	.INITIAL_DIR_VALUE(8'b01100101)
)pio_d(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_pd_d_out),

	.io_i(pd_in),
	.io_o(pd_out),
	.pio_out_io_connect_o(piod_out_io_connect)
	);
end
else
begin
assign dat_pd_d_out = 0;
end
endgenerate
/* !PORTD */

/* PORTE */
wire [7:0]dat_pe_d_out;
generate
if (USE_PIO_E == "TRUE")
begin: PORTE
atmega_pio # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.PORT_OUT_ADDR('h2e),
	.DDR_ADDR('h2d),
	.PIN_ADDR('h2c),
	.PINMASK(8'b01000000),
	.PULLUP_MASK(8'b00000000),
	.PULLDN_MASK(8'b00000000),
	.INVERSE_MASK(8'b00000000),
	.OUT_ENABLED_MASK(8'b00000000),
	.INITIAL_OUTPUT_VALUE(8'b00000000),
	.INITIAL_DIR_VALUE(8'b00000000)
)pio_e(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_pe_d_out),

	.io_i(pe_in),
	.io_o(pe_out),
	.pio_out_io_connect_o(pioe_out_io_connect)
	);
end
else
begin
assign dat_pe_d_out = 0;
end
endgenerate
/* !PORTE */

/* PORTF */
wire [7:0]dat_pf_d_out;
generate
if (USE_PIO_F == "TRUE")
begin: PORTF
atmega_pio # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.PORT_OUT_ADDR('h31),
	.DDR_ADDR('h30),
	.PIN_ADDR('h2f),
	.PINMASK(8'b11110001),
	.PULLUP_MASK(8'b00000000),
	.PULLDN_MASK(8'b00000000),
	.INVERSE_MASK(8'b00000000),
	.OUT_ENABLED_MASK(8'b00000000),
	.INITIAL_OUTPUT_VALUE(8'b00000000),
	.INITIAL_DIR_VALUE(8'b00000000)
)pio_f(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_pf_d_out),

	.io_i(pf_in),
	.io_o(pf_out),
	.pio_out_io_connect_o(piof_out_io_connect)
	);
end
else
begin
assign dat_pf_d_out = 0;
end
endgenerate
/* !PORTF */

/* SPI */
wire [7:0]dat_spi_d_out;
generate
if (USE_SPI_1 == "TRUE")
begin: SPI1
atmega_spi_m # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.SPCR_ADDR('h4c),
	.SPSR_ADDR('h4d),
	.SPDR_ADDR('h4e),
	.DINAMIC_BAUDRATE("TRUE"),
	.BAUDRATE_CNT_LEN(8),
	.BAUDRATE_DIVIDER(0),
	.USE_TX("TRUE"),
	.USE_RX("TRUE")
)spi_1(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_spi_d_out),
	.int_o(int_spi_stc),
	.int_ack_i(int_spi_stc_ack),
	.io_connect_o(spi_io_connect),
	.io_conn_slave_o(io_conn_slave),

	.scl_o(spi_scl),
	.miso_i(spi_miso),
	.mosi_o(spi_mosi)
	);
end
else
begin
assign dat_spi_d_out = 0;
assign int_spi_stc = 1'b0;
assign spi_io_connect = 1'b0;
end
endgenerate
/* !SPI */
/* UART */
wire [7:0]dat_uart0_d_out;
generate
if (USE_UART_1 == "TRUE" && USE_USB2UART != "TRUE")
begin: UART1
atmega_uart # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.UDR_ADDR('hce),
	.UCSRA_ADDR('hc8),
	.UCSRB_ADDR('hc9),
	.UCSRC_ADDR('hca),
	.UBRRL_ADDR('hcc),
	.UBRRH_ADDR('hcd),
	.USE_TX(UART_TX_ENABLED),
	.USE_RX(UART_RX_ENABLED)
	)uart_1(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_uart0_d_out),
	
	.rxc_int_o(int_usart1_rx),
	.rxc_int_ack_i(int_usart1_rx_ack),
	.txc_int_o(int_usart1_tx),
	.txc_int_ack_i(int_usart1_tx_ack),
	.udre_int_o(int_usart1_udre),
	.udre_int_ack_i(int_usart1_udre_ack),

	.rx_i(uart_rx),
	.tx_o(uart_tx),
	.tx_connect_o(uart_tx_io_connect)
	);
end
else if (USE_UART_1 == "TRUE" && USE_USB2UART == "TRUE")
begin: USB2UART
atmega_usb2uart # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.UDR_ADDR('hce),
	.UCSRA_ADDR('hc8),
	.UCSRB_ADDR('hc9)
	)usb2uart_1(
	.rst_i(io_rst),
	.rst_usb_i(io_rst),
	.clk_i(core_clk),
	.clk48m_i(clk48m_i),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_uart0_d_out),
	
	.rxc_int_o(int_usart1_rx),
	.rxc_int_ack_i(int_usart1_rx_ack),
	.txc_int_o(int_usart1_tx),
	.txc_int_ack_i(int_usart1_tx_ack),
	.udre_int_o(int_usart1_udre),
	.udre_int_ack_i(int_usart1_udre_ack),

	.usbp_io(usbp_io),
	.usbn_io(usbn_io)
	);
end
else /* USE_UART_1 != "TRUE" */
begin
assign dat_uart0_d_out = 8'h0;
assign int_usart1_rx = 1'b0;
assign int_usart1_tx = 1'b0;
assign int_usart1_udre = 1'b0;
assign uart_tx_io_connect = 1'b0;
end
endgenerate
/* UART */

/* TWI*/
wire [7:0]dat_twi0_d_out;
generate
if (USE_TWI_1 == "TRUE")
begin: TWI1
if (TWI_IP == "STANDARD")
begin
atmega_twi #(
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.TWBR_ADDR('hb8),
	.TWSR_ADDR('hb9),
	.TWAR_ADDR('hba),
	.TWDR_ADDR('hbb),
	.TWCR_ADDR('hbc),
	.TWAMR_ADDR('hbd)
)twi_1(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_twi0_d_out),
	.int_o(int_twi),
	.int_ack_i(int_adc_ack),
	
	.scl_io(twi_scl),
	.sda_io(twi_sda)
    );
end // (TWI_IP != "STANDARD")
else if (TWI_IP == "CUSTOM")
begin  
twi_s #(
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.DINAMIC_BAUDRATE("TRUE"),
	.BAUDRATE_DIVIDER(0),
	.CTRLA_ADDR('hb8),
	.CTRLB_ADDR('hb9),
	.CTRLC_ADDR('hba),
	.STATUS_ADDR('hbb),
	.BAUD_ADDR('hbc),
	.DATA_ADDR('hbd)
)twi_(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_twi0_d_out),
	.int_o(int_twi),
	.int_ack_i(int_adc_ack),
	
	.scl_io(twi_scl),
	.sda_io(twi_sda)
    );
end // (TWI_IP != "CUSTOM")
end // (USE_TWI_1 != "TRUE")
else
begin
assign dat_twi0_d_out = 8'h0;
assign int_twi = 1'b0;
end
endgenerate
/* !TWI */
/* TIMER PRESCALLER */
wire clk8;
wire clk64;
wire clk256;
wire clk1024;
tim_013_prescaller tim_013_prescaller_inst(
	.rst(io_rst),
	.clk(core_clk),
	.clk8(clk8),
	.clk64(clk64),
	.clk256(clk256),
	.clk1024(clk1024)
);
/* !TIMER PRESCALLER */

/* TIMER 0 */
wire [7:0]dat_tim0_d_out;
generate
if (USE_TIMER_0 == "TRUE")
begin:TIMER0
atmega_tim_8bit # (
	.PLATFORM(PLATFORM),
	.USE_SIMPLE_COUNTER(USE_REDUCED_TIM0),
	.USE_OCRA("TRUE"),
	.USE_OCRA_OUT("FALSE"),
	.USE_OCRB("FALSE"),
	.USE_OCRB_OUT("FALSE"),
	.BUS_ADDR_DATA_LEN(8),
	.GTCCR_ADDR('h43),
	.TCCRA_ADDR('h44),
	.TCCRB_ADDR('h45),
	.TCNT_ADDR('h46),
	.OCRA_ADDR('h47),
	.OCRB_ADDR('h48),
	.TIMSK_ADDR('h6E),
	.TIFR_ADDR('h35),
	.INCREMENT_VALUE(1)
)tim_0(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.clk8_i(clk8),
	.clk64_i(clk64),
	.clk256_i(clk256),
	.clk1024_i(clk1024),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_tim0_d_out),
	
	.tov_int_o(int_timer0_ovf),
	.tov_int_ack_i(int_timer0_ovf_ack),
	.ocra_int_o(int_timer0_compa),
	.ocra_int_ack_i(int_timer0_compa_ack),
	.ocrb_int_o(int_timer0_compb),
	.ocrb_int_ack_i(int_timer0_compb_ack),
	
	.t_i(),
	.oca_o(tim0_oca),
	.ocb_o(tim0_ocb),
	.oca_io_connect_o(tim0_oca_io_connect),
	.ocb_io_connect_o(tim0_ocb_io_connect)
	);
end
else
begin
assign dat_tim0_d_out = 0;
assign int_timer0_ovf = 1'b0;
assign int_timer0_compa = 1'b0;
assign tim0_oca_io_connect = 1'b0;
assign tim0_ocb_io_connect = 1'b0;
end
endgenerate
/* !TIMER 0 */

/* TIMER 1 */
wire [7:0]dat_tim1_d_out;
generate
if (USE_TIMER_1 == "TRUE")
begin: TIMER1
atmega_tim_16bit # (
	.PLATFORM(PLATFORM),
	.USE_SIMPLE_COUNTER(USE_REDUCED_TIM1),
	.USE_OCRA_OUT("FALSE"),
	.USE_OCRB("TRUE"),
	.USE_OCRB_OUT("FALSE"),
	.USE_OCRC("TRUE"),
	.USE_OCRC_OUT("FALSE"),
	.USE_OCRD("FALSE"),
	.USE_OCRD_OUT("FALSE"),
	.BUS_ADDR_DATA_LEN(8),
	.GTCCR_ADDR('h43),
	.TCCRA_ADDR('h80),
	.TCCRB_ADDR('h81),
	.TCCRC_ADDR('h82),
	.TCNTL_ADDR('h84),
	.TCNTH_ADDR('h85),
	.ICRL_ADDR('h86),
	.ICRH_ADDR('h87),
	.OCRAL_ADDR('h88),
	.OCRAH_ADDR('h89),
	.OCRBL_ADDR('h8A),
	.OCRBH_ADDR('h8B),
	.OCRCL_ADDR('h8C),
	.OCRCH_ADDR('h8D),
	.TIMSK_ADDR('h6F),
	.TIFR_ADDR('h36),
	.INCREMENT_VALUE(1)
)tim_1(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.clk8_i(clk8),
	.clk64_i(clk64),
	.clk256_i(clk256),
	.clk1024_i(clk1024),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_tim1_d_out),
	
	.tov_int_o(int_timer1_ovf),
	.tov_int_ack_i(int_timer1_ovf_ack),
	.ocra_int_o(int_timer1_compa),
	.ocra_int_ack_i(int_timer1_compa_ack),
	.ocrb_int_o(int_timer1_compb),
	.ocrb_int_ack_i(int_timer1_compb_ack),
	.ocrc_int_o(int_timer1_compc),
	.ocrc_int_ack_i(int_timer1_compc_ack),
	.ocrd_int_o(),
	.ocrd_int_ack_i(),
	
	.t_i(),
	.oca_o(tim1_oca),
	.ocb_o(tim1_ocb),
	.occ_o(tim1_occ),
	.ocd_o(),
	.oca_io_connect_o(tim1_oca_io_connect),
	.ocb_io_connect_o(tim1_ocb_io_connect),
	.occ_io_connect_o(tim1_occ_io_connect),
	.ocd_io_connect_o()
	);
end
else
begin
assign dat_tim1_d_out = 0;
assign int_timer1_ovf = 0;
assign int_timer1_compa = 0;
assign int_timer1_compb = 0;
assign int_timer1_compc = 0;
end
endgenerate
/* !TIMER 1 */

/* TIMER 3 */
wire [7:0]dat_tim3_d_out;
generate
if (USE_TIMER_3 == "TRUE")
begin: TIMER3
atmega_tim_16bit # (
	.PLATFORM(PLATFORM),
	.USE_SIMPLE_COUNTER(USE_REDUCED_TIM3),
	.USE_OCRA_OUT("FALSE"),
	.USE_OCRB("FALSE"),
	.USE_OCRB_OUT("FALSE"),
	.USE_OCRC("FALSE"),
	.USE_OCRC_OUT("FALSE"),
	.USE_OCRD("FALSE"),
	.USE_OCRD_OUT("FALSE"),
	.BUS_ADDR_DATA_LEN(8),
	.GTCCR_ADDR('h43),
	.TCCRA_ADDR('h90),
	.TCCRB_ADDR('h91),
	.TCCRC_ADDR('h92),
	.TCNTL_ADDR('h94),
	.TCNTH_ADDR('h95),
	.ICRL_ADDR('h96),
	.ICRH_ADDR('h97),
	.OCRAL_ADDR('h98),
	.OCRAH_ADDR('h99),
	.OCRBL_ADDR('h9A),
	.OCRBH_ADDR('h9B),
	.OCRCL_ADDR('h9C),
	.OCRCH_ADDR('h9D),
	.TIMSK_ADDR('h71),
	.TIFR_ADDR('h38),
	.INCREMENT_VALUE(1)
)tim_3(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.clk8_i(clk8),
	.clk64_i(clk64),
	.clk256_i(clk256),
	.clk1024_i(clk1024),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_tim3_d_out),
	
	.tov_int_o(int_timer3_ovf),
	.tov_int_ack_i(int_timer3_ovf_ack),
	.ocra_int_o(int_timer3_compa),
	.ocra_int_ack_i(int_timer3_compa_ack),
	.ocrb_int_o(int_timer3_compb),
	.ocrb_int_ack_i(int_timer3_compb_ack),
	.ocrc_int_o(int_timer3_compc),
	.ocrc_int_ack_i(int_timer3_compc_ack),
	.ocrd_int_o(),
	.ocrd_int_ack_i(),
	
	.t_i(),
	.oca_o(tim3_oca),
	.ocb_o(tim3_ocb),
	.occ_o(tim3_occ),
	.ocd_o(),
	.oca_io_connect_o(tim3_oca_io_connect),
	.ocb_io_connect_o(tim3_ocb_io_connect),
	.occ_io_connect_o(tim3_occ_io_connect),
	.ocd_io_connect_o()
	);
end
else
begin
assign dat_tim3_d_out = 0;
assign int_timer3_ovf = 0;
assign int_timer3_compa = 0;
assign int_timer3_compb = 0;
assign int_timer3_compc = 0;
end
endgenerate
/* !TIMER 3 */

/* PLL */
wire [7:0]dat_pll_d_out;
generate
if(USE_PLL == "TRUE")
begin: PLL
atmega_pll # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.PLLCSR_ADDR('h49),
	.PLLFRQ_ADDR('h52),
	.USE_PLL(USE_PLL_HI_FREQ)
)pll(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.clk_pll_i(clk_pll),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_pll_d_out),
	
	.pll_enabled_o(pll_enabled),

	.usb_ck_o(usb_ck_out),
	.tim_ck_o(tim_ck_out)
	);
end
else
begin
	assign dat_pll_d_out = 0;
end
endgenerate
/* !PLL */

/* TIMER 4 */
wire [7:0]dat_tim4_d_out;
generate
if (USE_TIMER_4 == "TRUE")
begin: TIMER4
atmega_tim_10bit # (
	.PLATFORM(PLATFORM),
	.USE_OCRA("TRUE"),
	.USE_OCRB("FALSE"),
	.USE_OCRD("FALSE"),
	.BUS_ADDR_DATA_LEN(8),
	.TCCRA_ADDR('hc0),
	.TCCRB_ADDR('hc1),
	.TCCRC_ADDR('hc2),
	.TCCRD_ADDR('hc3),
	.TCCRE_ADDR('hc4),
	.TCNTL_ADDR('hbe),
	.TCH_ADDR('hbf),
	.OCRA_ADDR('hcf),
	.OCRB_ADDR('hd0),
	.OCRC_ADDR('hd1),
	.OCRD_ADDR('hd2),
	.TIMSK_ADDR('h72),
	.TIFR_ADDR('h39),
	.INCREMENT_VALUE(1)
)tim_4(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.clk_pll_i(tim_ck_out),
	.pll_enabled_i(pll_enabled),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_tim4_d_out),
	
	.tov_int_o(int_timer4_ovf),
	.tov_int_ack_i(int_timer4_ovf_ack),
	.ocra_int_o(int_timer4_compa),
	.ocra_int_ack_i(int_timer4_compa_ack),
	.ocrb_int_o(int_timer4_compb),
	.ocrb_int_ack_i(int_timer4_compb_ack),
	.ocrc_int_o(),
	.ocrc_int_ack_i(),
	.ocrd_int_o(int_timer4_compd),
	.ocrd_int_ack_i(int_timer4_compd_ack),
	
	.t_i(),
	.oca_o(tim4_oca),
	.ocb_o(tim4_ocb),
	.occ_o(tim4_occ),
	.ocd_o(tim4_ocd),
	.ocap_io_connect_o(tim4_ocap_io_connect),
	.ocan_io_connect_o(tim4_ocan_io_connect),
	.ocbp_io_connect_o(tim4_ocbp_io_connect),
	.ocbn_io_connect_o(tim4_ocbn_io_connect),
	.occp_io_connect_o(tim4_occp_io_connect),
	.occn_io_connect_o(tim4_occn_io_connect),
	.ocdp_io_connect_o(tim4_ocdp_io_connect),
	.ocdn_io_connect_o(tim4_ocdn_io_connect)
	);
end
else
begin
assign dat_tim4_d_out = 0;
assign int_timer4_ovf = 0;
assign int_timer4_compa = 0;
assign int_timer4_compb = 0;
assign int_timer4_compd = 0;
end
endgenerate
/* !TIMER 4 */

/* EEPROM */
wire [7:0]dat_eeprom_d_out;
wire eep_content_modifyed;
generate
if (USE_EEPROM == "TRUE")
begin: EEPROM
atmega_eep # (
	.PLATFORM(PLATFORM),
	.BUS_ADDR_DATA_LEN(8),
	.EEARH_ADDR('h42),
	.EEARL_ADDR('h41),
	.EEDR_ADDR('h40),
	.EECR_ADDR('h3F),
	.EEP_SIZE(1024)
)eep(
	.rst_i(io_rst),
	.clk_i(core_clk),
	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_eeprom_d_out),
	
	.int_o(int_ee_ready),
	.int_ack_i(int_ee_ready_ack),

	.ext_eep_addr_i(),
	.ext_eep_data_i(),
	.ext_eep_data_wr_i(),
	.ext_eep_data_o(),
	.ext_eep_data_rd_i(),
	.ext_eep_data_en_i(),

	.content_modifyed_o(eep_content_modifyed),
	.debug_o()
	);
end
else
begin
assign dat_eeprom_d_out = 0;
end
endgenerate
/* !EEPROM */

/* LFSR RNG as ADC */
wire [7:0]dat_adc_d_out;
generate
if(USE_RNG_AS_ADC == "TRUE")
begin: RNG_AS_ADC
atmega_rng_as_adc # (
	.PLATFORM("XILINX"),
	.BUS_ADDR_DATA_LEN(8),
	.RNG_BIT_NR(10),
	.ADCL_ADDR('h78),
	.ADCH_ADDR('h79),
	.ADCSRA_ADDR('h7A),
	.ADCSRB_ADDR('h7B),
	.ADMUX_ADDR('h7C)
)adc(
	.rst_i(io_rst),
	.clk_i(core_clk),

	.addr_i(io_addr),
	.wr_i(io_write),
	.rd_i(io_read),
	.bus_i(io_out),
	.bus_o(dat_adc_d_out)
    );
end
else
begin
assign dat_adc_d_out = 0;
end
endgenerate
/* !RNG as ADC */

/* Removed for Pocket
`define SEC_REG_ADDR	3'h0
`define F_CNT_L_ADDR	3'h3
`define F_CNT_H_ADDR	3'h4
`define F_DATA_L_ADDR	3'h5
`define F_DATA_H_ADDR	3'h6
`define BOOT_STAT_ADDR	3'h7

`define BOOT_STAT_FLASH_APP_NR		0
`define BOOT_STAT_EEP_EDITED		1
`define BOOT_STAT_NMI_INT_ENABLE	2
`define BOOT_STAT_APP_PGM_WR_EN		3
`define BOOT_STAT_IO_RST			4
`define BOOT_STAT_DEBUG_EN			7


//reg [7:0]SEC_REG;
//reg [7:0]SEC_REG0;
reg [7:0]F_CNT_L;
reg [7:0]F_CNT_H;
reg [7:0]F_DATA_L;
reg [7:0]F_DATA_H;
reg [7:0]BOOT_STAT;

reg [7:0]dat_boot_d_out;
reg pgm_wr_en;

always @ (posedge core_clk)
begin
	if(core_rst)
	begin
		//SEC_REG <= 8'h00;
		//SEC_REG0 <= 8'h00;
		F_CNT_L <= 8'h00;
		F_CNT_H <= 8'h00;
		F_DATA_L <= 8'h00;
		F_DATA_H <= 8'h00;
	end
	else
	begin
		/*if(io_rst | sec_reg_rst)
		begin
*/
// 			SEC_REG <= 8'h00;
// 			SEC_REG0 <= 8'h00;
/* Removed for Pocket
		end
		if(pgm_wr_en)
			{F_CNT_H, F_CNT_L} <= {F_CNT_H, F_CNT_L} + 16'h0001;
		pgm_wr_en <= 1'b0;
		if(eep_content_modifyed)
			BOOT_STAT[`BOOT_STAT_EEP_EDITED] <= 1'b1;
		if(io_write & (&io_addr[7:3]))
		begin
			case(data_addr[2:0])
				/*`SEC_REG_ADDR:
				begin
					SEC_REG0 <= SEC_REG;
					SEC_REG <= io_out;
				end
				`F_CNT_L_ADDR: F_CNT_L <= io_out;
				`F_CNT_H_ADDR: F_CNT_H <= io_out;
				`F_DATA_L_ADDR: F_DATA_L <= io_out;
				`F_DATA_H_ADDR: 
				begin
					F_DATA_H <= io_out;
					pgm_wr_en <= 1'b1;
				end
				`BOOT_STAT_ADDR: 
				begin
					//if(sec_en)
						BOOT_STAT <= io_out;
				end
			endcase
		end
	end
	if(dev_rst)
		BOOT_STAT <= 8'h00;
end

always @ *
begin
	dat_boot_d_out = 8'h00;
	if(io_read & (&io_addr[7:3]))
	begin
		case(io_addr[2:0])
			`BOOT_STAT_ADDR: dat_boot_d_out = BOOT_STAT;
		endcase
	end
end
*/

//assign sec_en = SEC_REG == ~SEC_REG0 & SEC_REG != 0 & SEC_REG != 8'hFF;
/* Removed for Pocket
assign io_rst = BOOT_STAT[`BOOT_STAT_IO_RST] | core_rst;
assign nmi_rst = ~BOOT_STAT[`BOOT_STAT_NMI_INT_ENABLE];
*/

assign io_rst = core_rst;


/* BOOT APP */
/* Removed for Pocket
reg boot_rom_select_del;

always @ (posedge core_clk) boot_rom_select_del <= boot_rom_select;
 
wire [15:0]pgm_data_boot;
mega_rom  #(
	.PLATFORM(PLATFORM),
	.ADDR_ROM_BUS_WIDTH(BOOT_ADDR_WIDTH),
	.ROM_PATH(ROM_PATH)
)rom(
	.clk(core_clk),
	.a(pgm_addr[BOOT_ADDR_WIDTH - 1:0]),
	.cs(boot_rom_select_del),
	.d(pgm_data_boot)
);
 
// ROM APP
wire[ROM_ADDR_WIDTH-1:0]rom_addr = BOOT_STAT[`BOOT_STAT_APP_PGM_WR_EN] ? {F_CNT_H[6:0], F_CNT_L}: pgm_addr[ROM_ADDR_WIDTH-1:0];
reg rom_cs_del;
always @ (posedge clk) rom_cs_del <= rom_addr[14];
wire [15:0]pgm_data_app;
wire [15:0]pgm_data_app1;
mega_ram  #(
	.PLATFORM(PLATFORM),
	.MEM_MODE("SRAM"), // "BLOCK","SRAM"
	.ADDR_BUS_WIDTH(ROM_ADDR_WIDTH == 15 ? 14: ROM_ADDR_WIDTH),
	.ADDR_RAM_DEPTH(2 ** (ROM_ADDR_WIDTH == 15 ? 14: ROM_ADDR_WIDTH)),
	.DATA_BUS_WIDTH(16),
	.RAM_PATH(ROM_PATH)
)rom_app(
	.clk(core_clk),
	.cs(BOOT_STAT[`BOOT_STAT_APP_PGM_WR_EN] | ~boot_rom_select_del),
	.re(ROM_ADDR_WIDTH == 14 ? ~boot_rom_select_del : ~rom_cs_del),
	.we(BOOT_STAT[`BOOT_STAT_APP_PGM_WR_EN] ? (pgm_wr_en & ~rom_addr[14]) : 1'b0),
	.a(rom_addr[13:0]),
	.d_in({F_DATA_H, F_DATA_L}),
	.d_out(pgm_data_app1)
);

wire [15:0]pgm_data_app2;
generate
if(ROM_ADDR_WIDTH == 15)
begin// 64KB of ROM/32KWords of ROM
mega_ram  #(
	.PLATFORM(PLATFORM),
	.MEM_MODE("SRAM"), // "BLOCK","SRAM"
	.ADDR_BUS_WIDTH(14),
	.ADDR_RAM_DEPTH(2 ** 14),
	.DATA_BUS_WIDTH(16),
	.RAM_PATH("")
)rom_app2(
	.clk(core_clk),
	.cs(BOOT_STAT[`BOOT_STAT_APP_PGM_WR_EN] | ~boot_rom_select_del),
	.re(rom_cs_del),
	.we(BOOT_STAT[`BOOT_STAT_APP_PGM_WR_EN] ? (pgm_wr_en & rom_addr[14]) : 1'b0),
	.a(rom_addr[13:0]),
	.d_in({F_DATA_H, F_DATA_L}),
	.d_out(pgm_data_app2)
);
assign pgm_data_app = pgm_data_app1 | pgm_data_app2;
end
else
begin
assign pgm_data_app = pgm_data_app1;
end
endgenerate
// !ROM APP
// !BOOT APP
assign pgm_data = (BOOT_STAT[`BOOT_STAT_APP_PGM_WR_EN] ? 16'h0 : pgm_data_app) | pgm_data_boot;

// BOOT RAM
wire [7:0]boot_ram_bus_out = 0;
mega_ram  #(
	.PLATFORM(PLATFORM),
	.MEM_MODE("BLOCK"),
	.ADDR_BUS_WIDTH(9),
	.ADDR_RAM_DEPTH('h200),
	.DATA_BUS_WIDTH(8),
	.RAM_PATH("")
)boot_ram(
	.clk(core_clk),
	.cs(boot_ram_sel),
	.re(data_read),
	.we(data_write),
	.a(data_addr[8:0]),
	.d_in(core_data_out),
	.d_out(boot_ram_bus_out)
);
// !APP RAM
*/

/* BOOT RAM */
wire [7:0]app_ram_bus_out;
// wire [RAM_ADDR_WIDTH-1:0]app_ram_addr = data_addr - RESERVED_RAM_FOR_IO;
mega_ram  #(
	.PLATFORM(PLATFORM),
	.MEM_MODE(RAM_TYPE),
	.ADDR_BUS_WIDTH(RAM_ADDR_WIDTH),
	// .ADDR_RAM_DEPTH(2 ** (ROM_ADDR_WIDTH == 15 ? 14: ROM_ADDR_WIDTH)),
	.DATA_BUS_WIDTH(8),
	.RAM_PATH("")
)app_ram(
	.clk(core_clk),
	.cs(ram_sel),
	.re(data_read),
	.we(data_write),
	.a(data_addr),
	.d_in(core_data_out),
	.d_out(app_ram_bus_out)
);
/* !APP RAM */

/* DATA BUS IN DEMULTIPLEXER */
io_bus_dmux #(
	.NR_OF_BUSSES_IN(16)
	)
	ram_bus_dmux_inst(
	.bus_in({
/* Removed for Pocket
	dat_boot_d_out,
	io_in, 
	boot_ram_bus_out,
	*/
	app_ram_bus_out,
	dat_pb_d_out,
	dat_pc_d_out,
	dat_pd_d_out,
	dat_pe_d_out,
	dat_pf_d_out,
	dat_spi_d_out,
	dat_tim0_d_out,
	dat_tim1_d_out,
	dat_tim3_d_out,
	dat_tim4_d_out,
	dat_pll_d_out,
	dat_eeprom_d_out,
	dat_uart0_d_out,
	dat_adc_d_out,
	dat_twi0_d_out
	}),
	.bus_out(core_data_in)
	);
/* !DATA BUS IN DEMULTIPLEXER */

/* ATMEGA CORE */
 
mega # (
	.PLATFORM(PLATFORM),
	.CORE_TYPE(CORE_TYPE),
	.BOOT_ADDR(BOOT_ADDR),
	.ROM_ADDR_WIDTH(16),
	.RAM_ADDR_WIDTH(BUS_ADDR_DATA_LEN),
	.WATCHDOG_CNT_WIDTH(WATCHDOG_CNT_WIDTH),/* If is 0 the watchdog is disabled */
	.VECTOR_INT_TABLE_SIZE(VECTOR_INT_TABLE_SIZE),/* If is 0 the interrupt module is disabled */
	.NMI_VECTOR(BOOT_ADDR + 16'h0001),
	.REGS_REGISTERED(REGS_REGISTERED)
	)atmega32u4_inst(
	.rst(core_rst),
	.sys_rst_out(wdt_rst),
	// Core clock.
	.clk(core_clk),
	// Watchdog clock input that can be different from the core clock.
	.clk_wdt(core_clk),
	// FLASH space data interface.
	.pgm_addr(pgm_addr),
	.pgm_data(pgm_data),
	// RAM space data interface.
	.data_addr(data_addr),
	.data_out(core_data_out),
	.data_write(data_write),
	.data_in(core_data_in),
	.data_read(data_read),
	// Interrupt lines from all IO's.
	.int_sig({
	int_timer4_fpf, int_timer4_ovf, int_timer4_compd, int_timer4_compb, int_timer4_compa,
	int_spm_ready,
	int_twi,
	int_timer3_ovf, int_timer3_compc, int_timer3_compb, int_timer3_compa, int_timer3_capt,
	int_ee_ready,
	int_adc,
	int_analog_comp,
	int_usart1_tx, int_usart1_udre, int_usart1_rx,
	int_spi_stc,
	int_timer0_ovf, int_timer0_compb, int_timer0_compa,
	int_timer1_ovf, int_timer1_compc, int_timer1_compb, int_timer1_compa, int_timer1_capt, 
	int_reserved6, int_reserved5, int_reserved4,
	int_wdt,
	int_usb_endpoint, int_usb_general,
	int_pcint0,
	int_reserved3,
	int_int6,
	int_reserved1, int_reserved0,
	int_int3, int_int2, int_int1, int_int0,
	nmi_sig}
	),
	// Interrupt reset lines going to all IO's.
	.int_ack({
	int_timer4_fpf_ack, int_timer4_ovf_ack, int_timer4_compd_ack, int_timer4_compb_ack, int_timer4_compa_ack,
	int_spm_ready_ack,
	int_twi_ack,
	int_timer3_ovf_ack, int_timer3_compc_ack, int_timer3_compb_ack, int_timer3_compa_ack, int_timer3_capt_ack,
	int_ee_ready_ack,
	int_adc_ack,
	int_analog_comp_ack,
	int_usart1_tx_ack, int_usart1_udre_ack, int_usart1_rx_ack,
	int_spi_stc_ack,
	int_timer0_ovf_ack, int_timer0_compb_ack, int_timer0_compa_ack,
	int_timer1_ovf_ack, int_timer1_compc_ack, int_timer1_compb_ack, int_timer1_compa_ack, int_timer1_capt_ack, 
	int_reserved6_ack, int_reserved5_ack, int_reserved4_ack,
	int_wdt_ack,
	int_usb_endpoint_ack, int_usb_general_ack,
	int_pcint0_ack,
	int_reserved3_ack,
	int_int6_ack,
	int_reserved1_ack, int_reserved0_ack,
	int_int3_ack, int_int2_ack, int_int1_ack, int_int0_ack,
	nmi_ack}
	)
);
/* !ATMEGA CORE */

endmodule
