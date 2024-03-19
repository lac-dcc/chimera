`timescale 1ns / 1ps
//
// SB MCA CPLD Version - Main Module
// Copyright (c) 2020 Eric Schlaepfer
// This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
// International License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.
//
module mcsb(
// MCA signals
    input cd_setup_l,
    output cd_sfdbk,
    input chreset,
	 input clk14,
    output cd_chrdy_l,
    output cd_ds16,
	 output chck_l,
	 input refresh,
    input adl_l,
    input cmd,
    input m_io,
    input s0_w_l,
    input s1_r_l,
    input [15:0] a,
    inout [7:0] d,
	 
// MCA bus DMA signals
    output preempt_l,
	 output burst_l,
	 inout [3:0] arb,
	 input arb_grant_l,
	 input tc_l,
	 
// Card side
    input dreq,
	 output dack_l,

// External buffer control
    output bufen_l,
    output bufdir,

// Card side IO
    output ior_l,
    output iow_l,
    output ym_cs_l,       // YM3812
	 output joy_cs_l,      // Joystick port 200h-208h
	 output cms1_6_cs_l,   // CMS chip 1
	 output cms7_12_cs_l,  // CMS chip 2
	 output dsp_rst_cs_l,  // DSP reset trigger
	 output dav_cs_l,      // Data Available port
	 output dsp_wr_cs_l,   // DSP write port
	 output dsp_rd_cs_l,   // DSP read port
    output latched_a0,    // Latched A0 for YM, CMS
	 input  cms_dtack_l,    // CMS chip DTACK

// IRQ selector
    input irq_in,
	 output irq_2,
	 output  irq_3,
	 output  irq_5,
	 output  irq_7,

// Miscellaneous
    output cden
    );

reg [3:0] addr_latched;
reg [7:0] pos_data_bus;

// POS REG102: Card enable signal in bit 0.
reg pos_reg0;

// POS REG103: Chooses IO and interrupt jumpers
// jddiippp where ppp is 1 to 6 = port 210 to 260
//          and ii is 0 to 3 = interrupt 2, 3, 5, 7
//          and dd is 0 to 3 = DMA 0, 1, 2 (not allowed), 3.
//          and j is the joystick enable bit.
reg [7:0] pos_reg1;

wire [2:0] sb_pos_io_bits;
wire [1:0] sb_pos_dma_bits;
wire [1:0] sb_pos_irq_bits;
wire partial_select;
wire sb_io_selected;
wire joy_io_selected;
wire sb_joy_enable;

wire pos_read, pos_write;
reg cd_setup, fm_sel_latched, sb_sel_latched, joy_sel_latched;
wire cd_sel;
reg write, read, m_io_latched;
wire cms_cs;
wire cms_wr;

reg dmacycle;
wire arb_en;
wire dreq_gated;
wire preempt;
wire [3:0] arb_out;
reg [3:0] card_arb;
wire [3:0] arb_match;
wire arb_won;

wire dma_selected;
reg dma_sel_latched;

reg [5:0] cms_wr_tmr;
wire cms_wr_tmr_expire;
wire cms_wr_mask;
wire cms_wait;

// Do not use channel check output
assign chck_l = 1'bZ;

// Do not use burst transfers
assign burst_l = 1'bZ;

// Only ever 8-bit transfers
assign cd_ds16 = 1'b0;


// 210, 220, 230, 240, 250, 260 are acceptable addresses.
// aka the values 1, 2, 3, 4, 5, 6 in this register
assign sb_pos_io_bits = pos_reg1[2:0];
assign sb_pos_dma_bits = pos_reg1[6:5];
assign sb_pos_irq_bits = pos_reg1[4:3];
assign sb_joy_enable = pos_reg1[7];

// IRQ data selector, since IRQ output depends on POS setting.
assign irq_2 = (irq_in & (sb_pos_irq_bits == 2'b00)) ? 1'b0 : 1'bZ;
assign irq_3 = (irq_in & (sb_pos_irq_bits == 2'b01)) ? 1'b0 : 1'bZ;
assign irq_5 = (irq_in & (sb_pos_irq_bits == 2'b10)) ? 1'b0 : 1'bZ;
assign irq_7 = (irq_in & (sb_pos_irq_bits == 2'b11)) ? 1'b0 : 1'bZ;

// Address selection
// Joystick: 200h to 207h: 0000 0010 0000 0xxx
// CMS1: 2x0h to 2x1h:     0000 0010 0aaa 000x 
// CMS2: 2x2h to 2x3h:     0000 0010 0aaa 001x
// DSP rst: 2x6h:          0000 0010 0aaa 011x
// DSP FM: 2x8-2x9h:       0000 0010 0aaa 100x
// DSP rd: 2xA:            0000 0010 0aaa 101x
// DSP wr: 2xC:            0000 0010 0aaa 110x
// DSP dav: 2xE:           0000 0010 0aaa 111x 
// FM: 388h to 389h        0000 0011 1000 100x

assign partial_select = ~m_io & cd_setup_l & cden;

assign sb_io_selected = (a[15:4] == {9'b000000100, sb_pos_io_bits}) & partial_select;
assign joy_io_selected = (a[15:3] == {13'b0000001000000}) &
                          partial_select & sb_joy_enable;
// DSP FM: 2x8-2x9h:       0000 0010 0aaa 100x
// Adlib FM: 388-389h:     0000 0011 1000 100x
assign fm_io_selected = ((a[15:1] == {15'b000000111000100}) |
                         (a[15:1] == {9'b000000100, sb_pos_io_bits, 3'b100}))
								 & partial_select;

// Card selected feedback
// Inverted externally. Not qualified by any clock.
// This does not assert during DMA.
assign cd_sfdbk = (sb_io_selected | joy_io_selected | fm_io_selected);

// Address, m/IO#, s0, s1 are latched on falling edge of ADL.
always @ (negedge adl_l or posedge chreset)
begin
    if (chreset) begin
        addr_latched <= 4'b0000;
		  fm_sel_latched <= 1'b0;
		  sb_sel_latched <= 1'b0;
		  joy_sel_latched <= 1'b0;
		  dma_sel_latched <= 1'b0;
        m_io_latched <= 1'b0;
        cd_setup <= 1'b0;
        write <= 1'b0;
        read <= 1'b0;
    end else begin
        addr_latched <= a[3:0];
		  fm_sel_latched <= fm_io_selected;
		  sb_sel_latched <= sb_io_selected;
		  joy_sel_latched <= joy_io_selected;
		  dma_sel_latched <= dma_selected;
        m_io_latched <= m_io;
        cd_setup <= ~cd_setup_l;
        write <= ~s0_w_l;
        read <= ~s1_r_l;
    end
end

// Counter based on 14.318MHz to generate
// the CMS chip write pulses
assign cms_wr_tmr_expire = cms_wr_tmr == 6'd34;
assign cms_wr_mask = (cms_wr_tmr == 6'd2) |
							(cms_wr_tmr == 6'd3) |
							(cms_wr_tmr == 6'd4);
always @ (posedge clk14 or posedge chreset)
begin
	if (chreset) begin
		cms_wr_tmr <= 6'b000000;
	end else begin
		if (~(write & cms_cs)) begin
			cms_wr_tmr <= 6'b000000;
		end else if (~cms_wr_tmr_expire) begin
			cms_wr_tmr <= cms_wr_tmr + 1;		
		end	
	end
end

assign cd_sel = (fm_sel_latched | sb_sel_latched | joy_sel_latched | dma_sel_latched);

// Deasserting cd_chrdy during read cycle will enable MCA synchronous extended
// cycle. This helps meet the YM3812 timing spec. It must use the *unlatched*
// address decode and status signal. Technically this should be a reg that is
// set by this state and cleared on the falling edge of cmd.
// I'm not sure this is necessary for I/O cycles, which always seem to be about
// 300ns.
// For the CMS chips, this creates an asynchronous extended bus cycle
// since those chips are slow and need lots of time.
assign cd_chrdy_l = (fm_io_selected & (~s1_r_l | ~s0_w_l) & cmd) |
                    (cms_cs & cms_wait);

// Hold chrdy low during write pulse, but then
// after the write pulse, set it equal to the CMS DTACK signal.
assign cms_wait = cms_wr_tmr_expire ? ~cms_dtack_l : 1'b1;

assign cms_cs = sb_sel_latched & ((addr_latched[3:1] == 3'b000) | (addr_latched[3:1] == 3'b001));

// Create the write pulse for the CMS chips
// It should start after CS (so it is qualified by ADL high)
// delayed by one 70ns cycle.
// It should end after a width of >100ns
// This is done by the CMS write timer.
assign cms_wr = write & adl_l & ~cms_wr_tmr_expire & cms_wr_mask;

// Control to external IO device
assign ior_l = ~(cd_sel & read);
assign iow_l = ~(cms_cs ? cms_wr : (cd_sel & write));
assign latched_a0 = addr_latched[0];

// Chip select signals
assign ym_cs_l = ~(fm_sel_latched & ~cmd);
assign joy_cs_l = ~(joy_sel_latched & ~cmd);
assign cms1_6_cs_l = ~(sb_sel_latched & (~cmd | ~adl_l) & (addr_latched[3:1] == 3'b000));   // CMS chip 1
assign cms7_12_cs_l = ~(sb_sel_latched & (~cmd | ~adl_l) & (addr_latched[3:1] == 3'b001));  // CMS chip 2
assign dsp_rst_cs_l = ~(sb_sel_latched & ~cmd & (addr_latched[3:1] == 3'b011));  // DSP reset trigger
assign dsp_rd_cs_l = ~(sb_sel_latched & ~cmd & (addr_latched[3:1] == 3'b101));   // DSP read port
assign dsp_wr_cs_l = ~(sb_sel_latched & ~cmd & (addr_latched[3:1] == 3'b110));   // DSP write port
assign dav_cs_l = ~(sb_sel_latched & ~cmd & (addr_latched[3:1] == 3'b111));      // Data Available port


// External level shift buffer control lines
assign bufdir = write;
assign bufen_l = ~(((cd_setup & ~m_io_latched) || cd_sel) & ~cmd);

// POS register operations
assign pos_read = cd_setup & read & ~m_io_latched & ~cmd;
assign pos_write = cd_setup & write & ~m_io_latched;
assign d = pos_read ? pos_data_bus : 8'bZ;

// MUX for POS read operations
always @ (addr_latched or pos_reg0 or pos_reg1) begin
    case (addr_latched[2:0])
        3'b000: pos_data_bus <= 8'h85;          // POS100 aka LSB ID
        3'b001: pos_data_bus <= 8'h50;          // POS101 aka MSB ID
        3'b010: pos_data_bus <= {7'b0000000, pos_reg0}; // POS102
        3'b011: pos_data_bus <= pos_reg1;               // POS103
        3'b100: pos_data_bus <= 8'h00;
        3'b101: pos_data_bus <= 8'h00;
        3'b110: pos_data_bus <= 8'h00;
        3'b111: pos_data_bus <= 8'h00;
    endcase
end

// Latch POS registers on rising edge of cmd
always @ (posedge cmd or posedge chreset) begin
    if (chreset) begin
        pos_reg0 <= 1'b0;
        pos_reg1 <= 8'h00;
    end else if (pos_write) begin
        case (addr_latched[2:0])
            3'b010: pos_reg0 <= d[0]; // Bit 0 of POS register 102
            3'b011: pos_reg1 <= d;    // POS register 103
        endcase
    end
end

// Bit 0 of POS102 is the card enable signal
assign cden = pos_reg0;

//
// DMA stuff (TODO: make this separate module?)
//

// Cannot request DMA during another IO transaction
assign dreq_gated = dreq & cden & ~(cd_sfdbk & ~cmd);

assign preempt = dreq_gated & ~dmacycle;

// preempt_l is open drain
assign preempt_l = preempt ? 1'b0 : 1'bZ;

// turn on arbitration if we are in arb cycle
// or if dma cycle is ongoing
assign arb_en = dmacycle; //(dreq_gated & arb_grant_l) | (dmacycle & ~arb_grant_l);

genvar i;
generate
for (i = 0; i < 4; i = i + 1) begin:m
	// arbitration outputs are open drain and only
	// active during arbitration cycle
	assign arb[i] = (~arb_en | arb_out[i]) ? 1'bZ : 1'b0;
	// check if output state matches our arb priority
	assign arb_match[i] = (~card_arb[i] | arb[i]);
end
endgenerate

always @ (sb_pos_dma_bits) begin
    case (sb_pos_dma_bits)
        3'b000: card_arb <= 4'b0000;
        3'b001: card_arb <= 4'b0001;
        3'b010: card_arb <= 4'b0011;
        3'b011: card_arb <= 4'b0011; // Reserved
    endcase
end

// If we are in arbitration cycle we requested, then
// we need to participate in it. We do this by putting
// out the MSB first.
assign arb_out[3] = card_arb[3];
// Only drive arb[2] if arb[3] matches, and so on
assign arb_out[2] = card_arb[2] | ~arb_match[3];
assign arb_out[1] = card_arb[1] | ~arb_match[2] | ~arb_match[3];
assign arb_out[0] = card_arb[0] | ~arb_match[1] | ~arb_match[2] | ~arb_match[3];

assign arb_won = dmacycle & arb_match[0] & arb_match[1] & arb_match[2] & arb_match[3];

// dack_l drives OR gates on the board that
// allow DMA to read/write the mailbox latches.
assign dack_l = ~(dma_sel_latched & ~cmd);

always @ (posedge arb_grant_l or posedge chreset) begin
	if (chreset) begin
		dmacycle <= 1'b0;
	end else begin
		// Is this a DMA cycle we requested?
		dmacycle <= dreq_gated;
	end
end

// The DMA channel acts almost like another chip select. 
assign dma_selected = dmacycle & ~m_io & arb_won & ~arb_grant_l;

endmodule
