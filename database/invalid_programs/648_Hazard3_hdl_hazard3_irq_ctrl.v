// This program was cloned from: https://github.com/Wren6991/Hazard3
// License: Apache License 2.0

/*****************************************************************************\
|                        Copyright (C) 2022 Luke Wren                         |
|                     SPDX-License-Identifier: Apache-2.0                     |
\*****************************************************************************/

`default_nettype none

// Hazard3 interrupt controller. Support for up to 512 external interrupt
// lines, with up to 16 levels of preemption.

module hazard3_irq_ctrl #(
`include "hazard3_config.vh"
) (
	input  wire                clk,
	input  wire                clk_always_on,
	input  wire                rst_n,

	// CSR interface
	input  wire [11:0]         addr,
	input  wire [1:0]          wtype,
	input  wire                wen_m_mode,
	input  wire                ren_m_mode,
	input  wire [W_DATA-1:0]   wdata_raw,
	input  wire [W_DATA-1:0]   wdata,
	output reg  [W_DATA-1:0]   rdata,

	// Trap entry/exit signals for context update
	input  wire                trapreg_update_enter,
	input  wire                trapreg_update_exit,
	input  wire                trap_entry_is_eirq,

	// Interface for clearing and saving mie.mtie/msie via meicontext
	output wire                meicontext_clearts,
	input  wire                mie_mtie,
	input  wire                mie_msie,

	// External IRQ inputs:
	input  wire [NUM_IRQS-1:0] irq,

	// mip.meip:
	output wire                external_irq_pending
);

`include "hazard3_ops.vh"
`include "hazard3_csr_addr.vh"

localparam MAX_IRQS = 512;
localparam [3:0] IRQ_PRIORITY_MASK = ~(4'hf >> IRQ_PRIORITY_BITS);

// ----------------------------------------------------------------------------
// IRQ input flops

// Register external IRQ signals (mainly to avoid a through-path from IRQs to
// bus request signals). Always clocked, as it's used to generate a wakeup.
// Input registers can be removed on a per-IRQ basis, but this should be done
// with care as it does create a through-path from the IRQ to the bus.

wire [NUM_IRQS-1:0] irq_r;

genvar g;
generate
for (g = 0; g < NUM_IRQS; g = g + 1) begin: irq_reg_loop
	if (IRQ_INPUT_BYPASS[g]) begin: no_reg
		assign irq_r[g] = irq[g];
	end else begin: have_reg
		reg q;
		always @ (posedge clk_always_on or negedge rst_n) begin
			if (!rst_n) begin
				q <= 1'b0;
			end else begin
				q <= irq[g];
			end
		end
		assign irq_r[g] = q;
	end
end
endgenerate

// ----------------------------------------------------------------------------
// CSR write

// Assigned later:
wire [8:0]            meinext_irq;
wire                  meinext_noirq;
reg  [3:0]            eirq_highest_priority;

// Interrupt array registers:
reg  [NUM_IRQS-1:0]   meiea;
reg  [NUM_IRQS-1:0]   meifa;
reg  [4*NUM_IRQS-1:0] meipra;

// Padded vectors for CSR readout
wire [MAX_IRQS-1:0]   meiea_rdata  = {{MAX_IRQS-NUM_IRQS{1'b0}}, meiea};
wire [MAX_IRQS-1:0]   meifa_rdata  = {{MAX_IRQS-NUM_IRQS{1'b0}}, meifa};
wire [4*MAX_IRQS-1:0] meipra_rdata = {{4*(MAX_IRQS-NUM_IRQS){1'b0}}, meipra};

always @ (posedge clk or negedge rst_n) begin: update_irq_reg_arrays
	integer i;
	if (!rst_n) begin
		meiea <= {NUM_IRQS{1'b0}};
		meifa <= {NUM_IRQS{1'b0}};
		meipra <= {4*NUM_IRQS{1'b0}};
	end else begin
		for (i = 0; i < NUM_IRQS; i = i + 1) begin
			// CSR write update. Note raw wdata is used for array indexing --
			// necessary for correctness, and also avoid a loop with rdata.
			if (wen_m_mode && addr == MEIEA && wdata_raw[4:0] == i / 16) begin
				meiea[i]  <= wdata[16 + (i % 16)];
			end
			if (wen_m_mode && addr == MEIFA && wdata_raw[4:0] == i / 16) begin
				meifa[i]  <= wdata[16 + (i % 16)];
			end
			if (wen_m_mode && addr == MEIPRA && wdata_raw[6:0] == i / 4) begin
				meipra[4 * i +: 4] <= wdata[16 + 4 * (i % 4) +: 4] & IRQ_PRIORITY_MASK;
			end
			// Clear IRQ force when the corresponding IRQ is sampled from meinext
			// (so that an IRQ can be posted *once* without modifying the ISR source)
			if (meinext_irq == i && ren_m_mode && addr == MEINEXT && !meinext_noirq) begin
				meifa[meinext_irq] <= 1'b0;
			end
		end
	end
end

reg [3:0] meicontext_pppreempt;
reg [3:0] meicontext_ppreempt;
reg [4:0] meicontext_preempt;
reg       meicontext_noirq;
reg [8:0] meicontext_irq;
reg       meicontext_mreteirq;

wire [4:0] preempt_level_next = meinext_noirq ? 5'h10 : (
	(5'd1 << (4 - IRQ_PRIORITY_BITS)) + {1'b0, eirq_highest_priority}
);

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		meicontext_pppreempt <= 4'h0;
		meicontext_ppreempt <= 4'h0;
		meicontext_preempt <= 5'h0;
		meicontext_noirq <= 1'b1;
		meicontext_irq <= 9'h0;
		meicontext_mreteirq <= 1'b0;
	end else if (trapreg_update_enter) begin
		if (trap_entry_is_eirq) begin
			// Priority save. Note the MSB of preempt needn't be saved since,
			// when it is set, preemption is impossible, so we won't be here.
			meicontext_pppreempt <= meicontext_ppreempt & IRQ_PRIORITY_MASK;
			meicontext_ppreempt <= meicontext_preempt[3:0] & IRQ_PRIORITY_MASK;
			// Setting preempt isn't strictly necessary, since an updating read
			// of meinext ought to be performed before re-enabling IRQs via
			// mstatus.mie, but it seems the least surprising thing to do:
			meicontext_preempt <= preempt_level_next & {1'b1, IRQ_PRIORITY_MASK};
			meicontext_mreteirq <= 1'b1;
		end else begin
			meicontext_mreteirq <= 1'b0;
		end
	end else if (trapreg_update_exit) begin
		meicontext_mreteirq <= 1'b0;
		if (meicontext_mreteirq) begin
			// Priority restore
			meicontext_pppreempt <= 4'h0;
			meicontext_ppreempt <= meicontext_pppreempt & IRQ_PRIORITY_MASK;
			meicontext_preempt <= {1'b0, meicontext_ppreempt & IRQ_PRIORITY_MASK};
		end
	end else if (wen_m_mode && addr == MEICONTEXT) begin
		meicontext_pppreempt <= wdata[31:28] & IRQ_PRIORITY_MASK;
		meicontext_ppreempt <= wdata[27:24] & IRQ_PRIORITY_MASK;
		meicontext_preempt <= wdata[20:16] & {1'b1, IRQ_PRIORITY_MASK};
		meicontext_noirq <= wdata[15];
		meicontext_irq <= wdata[12:4];
		meicontext_mreteirq <= wdata[0];
	end else if (wen_m_mode && addr == MEINEXT && wdata[0]) begin
		// Interrupt has been sampled, with the update request set, so update
		// the context (including preemption level) appropriately.
		meicontext_preempt <= preempt_level_next & {1'b1, IRQ_PRIORITY_MASK};
		meicontext_noirq <= meinext_noirq;
		meicontext_irq <= meinext_irq;
	end
end

assign meicontext_clearts = wen_m_mode && wtype != CSR_WTYPE_C && addr == MEICONTEXT && wdata_raw[1];

// ----------------------------------------------------------------------------
// External interrupt logic

// Trap request is asserted when there is an interrupt at or above our current
// preemption level. meinext displays interrupts at or above our *previous*
// preemption level: this masking helps avoid re-taking IRQs in frames that you
// have preempted. 

wire [NUM_IRQS-1:0] meipa = irq_r | meifa;
wire [MAX_IRQS-1:0] meipa_rdata = {{MAX_IRQS-NUM_IRQS{1'b0}}, meipa};

reg [NUM_IRQS-1:0] eirq_active_above_preempt;
reg [NUM_IRQS-1:0] eirq_active_above_ppreempt;

always @ (*) begin: eirq_compare
	integer i;
	for (i = 0; i < NUM_IRQS; i = i + 1) begin
		eirq_active_above_preempt[i]  = meipa[i] && meiea[i] && {1'b0, meipra[i * 4 +: 4]} >= meicontext_preempt;
		eirq_active_above_ppreempt[i] = meipa[i] && meiea[i] &&        meipra[i * 4 +: 4]  >= meicontext_ppreempt;
	end
end

assign external_irq_pending =  |eirq_active_above_preempt;
assign meinext_noirq        = ~|eirq_active_above_ppreempt;

// Two things remaining to calculate:
//
// - What is the IRQ number of the highest-priority pending IRQ that is above
//   meicontext.ppreempt
// - What is the priority of that IRQ
//
// In the second case we can relax the calculation to ignore ppreempt, since it
// only needs to be valid if such an IRQ exists. Currently we choose to reuse
// the same priority selector (possibly longer critpath while saving area), but
// we could use a second priority selector that ignores ppreempt masking.

wire [NUM_IRQS-1:0] highest_eirq_onehot;
wire [8:0]          meinext_irq_unmasked;

hazard3_onehot_priority_dynamic #(
	.W_REQ                 (NUM_IRQS),
	.N_PRIORITIES          (16),
	.PRIORITY_HIGHEST_WINS (1),
	.TIEBREAK_HIGHEST_WINS (0)
) eirq_priority_u (
	.pri (meipra[4*NUM_IRQS-1:0] & {NUM_IRQS{IRQ_PRIORITY_MASK}}),
	.req (eirq_active_above_ppreempt),
	.gnt (highest_eirq_onehot)
);

always @ (*) begin: get_highest_eirq_priority
	integer i;
	eirq_highest_priority = 4'h0;
	for (i = 0; i < NUM_IRQS; i = i + 1) begin
		eirq_highest_priority = eirq_highest_priority | (
			meipra[4 * i +: 4] & {4{highest_eirq_onehot[i]}}
		);
	end
end

hazard3_onehot_encode #(
	.W_REQ (NUM_IRQS),
	.W_GNT (9)
) eirq_encode_u (
	.req (highest_eirq_onehot),
	.gnt (meinext_irq_unmasked)
);

assign meinext_irq = meinext_irq_unmasked & {9{!meinext_noirq}};

// ----------------------------------------------------------------------------
// CSR read

always @ (*) begin
	rdata = {W_DATA{1'b0}};
	case (addr)

	MEIEA: rdata = {
		meiea_rdata[wdata_raw[4:0] * 16 +: 16],
		16'h0
	};

	MEIPA: rdata = {
		meipa[wdata_raw[4:0] * 16 +: 16],
		16'h0
	};

	MEIFA: rdata = {
		meifa_rdata[wdata_raw[4:0] * 16 +: 16],
		16'h0
	};

	MEIPRA: rdata = {
		meipra_rdata[wdata_raw[6:0] * 16 +: 16],
		16'h0
	};

	MEINEXT: rdata = {
		meinext_noirq,
		20'h0,
		meinext_irq,
		2'h0
	};

	MEICONTEXT: rdata = {
		meicontext_pppreempt,
		meicontext_ppreempt,
		3'h0,
		meicontext_preempt,
		meicontext_noirq,
		2'h0,
		meicontext_irq,
		mie_mtie && meicontext_clearts,
		mie_msie && meicontext_clearts,
		1'b0,
		meicontext_mreteirq
	};

	default: rdata = {W_DATA{1'b0}};
	endcase
end

endmodule

`ifndef YOSYS
`default_nettype wire
`endif
