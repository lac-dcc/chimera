// This program was cloned from: https://github.com/olofk/wb_intercon
// License: ISC License

/* wb_upsizer. Part of wb_intercon
 *
 * ISC License
 *
 * Copyright (C) 2019  Olof Kindgren <olof.kindgren@gmail.com>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
module wb_upsizer
  #(parameter DW_IN = 0,
    parameter SCALE = 0,
    parameter AW    = 32)
   (input wire			      wb_clk_i,
    input wire			      wb_rst_i,
    input wire [AW-1:0]		      wbs_adr_i,

    input wire [DW_IN-1:0]	      wbs_dat_i,
    input wire [DW_IN/8-1:0]	      wbs_sel_i,
    input wire			      wbs_we_i,
    input wire			      wbs_cyc_i,
    input wire			      wbs_stb_i,
    input wire [2:0]		      wbs_cti_i,
    input wire [1:0]		      wbs_bte_i,
    output wire [DW_IN-1:0]	      wbs_dat_o,
    output wire			      wbs_ack_o,
    output wire			      wbs_err_o,
    output wire			      wbs_rty_o,
    //Master port
    output wire [AW-1:0]	      wbm_adr_o,
    output wire reg [DW_IN*SCALE-1:0] wbm_dat_o,
    output wire [DW_IN*SCALE/8-1:0]   wbm_sel_o,
    output wire			      wbm_we_o,
    output wire			      wbm_cyc_o,
    output wire			      wbm_stb_o,
    output wire [2:0]		      wbm_cti_o,
    output wire [1:0]		      wbm_bte_o,
    input wire [DW_IN*SCALE-1:0]      wbm_dat_i,
    input wire			      wbm_ack_i,
    input wire			      wbm_err_i,
    input wire			      wbm_rty_i);

`include "wb_common.v"

   localparam SELW = DW_IN/8; //sel width

   localparam DW_OUT = DW_IN*SCALE;
   localparam SW_OUT = SELW*SCALE;

   localparam BUFW = $clog2(DW_IN/8)-1; //Buffer width

   localparam ADR_LSB = BUFW+1; //Bit position of the LSB of the buffer address. Lower bits are used for index part

   localparam [1:0]
     S_IDLE  = 2'b00,
     S_READ  = 2'b01,
     S_WRITE = 2'b10;

   reg [1:0] 		      state;

   wire [AW-1:ADR_LSB] 	      adr_i;
   wire [BUFW-1:0] 	      idx_i;

   reg [AW-1:ADR_LSB] 	      radr;
   reg [DW_OUT-1:0] 	      rdat;
   reg 			      rdat_vld;

   wire [AW-1:0] next_adr = wb_next_adr(wbs_adr_i, wbs_cti_i, wbs_bte_i, DW_IN)>> ($clog2(SELW)+BUFW);

   wire 		      req = wbs_cyc_i & wbs_stb_i;
   wire 		      wr_req = req &  wbs_we_i;

   wire 		      last = wbs_cyc_i & (wbs_cti_i == 3'b000 | wbs_cti_i == 3'b111);
   wire 		      last_in_batch = (adr_i != next_adr) | last;
   wire 		      bufhit      = (adr_i    == radr) & rdat_vld;
   wire 		      next_bufhit = (next_adr == radr);

   reg [AW-1:0] 	      wr_adr;
   reg [DW_IN*SCALE/8-1:0]    wr_sel;
   reg 			      wr_we;
   reg 			      wr_cyc;
   reg 			      wr_stb;
   reg [2:0] 		      wr_cti;
   reg [1:0] 		      wr_bte;


   reg [DW_OUT-1:0] 	      wdat;
   reg [DW_OUT/8-1:0] 	      sel;
   reg 			      write_ack;
   reg 			      first_ack;

   assign {adr_i,idx_i} = wbs_adr_i>>$clog2(SELW);

   reg [AW-1:0]  next_radr;

   reg 		 wbm_stb_o_r;

   wire 	 rd_cyc = wbs_cyc_i & !(last & bufhit);

   assign wbs_dat_o = rdat_vld ?
		      rdat[idx_i*DW_IN+:DW_IN] :
		      wbm_dat_i[idx_i*DW_IN+:DW_IN];

   wire wr = (wr_req | wr_cyc);
   assign wbs_ack_o = wr ? write_ack : (wbm_ack_i | bufhit);

   wire [AW-1:0] rd_adr = (first_ack/*wbm_stb_o_r*/ ? next_adr : adr_i) << ($clog2(SELW) + BUFW);
   assign wbm_adr_o = wr ? wr_adr : rd_adr;
   assign wbm_sel_o = wr ? wr_sel : {SW_OUT{1'b1}};
   assign wbm_we_o  = wr ? wr_cyc : 1'b0;
   assign wbm_cyc_o = wr ? wr_cyc : rd_cyc;
   assign wbm_stb_o = wr ? wr_stb : rd_cyc;
   assign wbm_cti_o = wr ? wr_cti : 3'b111;
   assign wbm_bte_o = wr ? wr_bte : 2'b00;



   always @(posedge wb_clk_i) begin
      if (wbs_ack_o & !wr) begin
	 first_ack <= 1'b1;
	 if (last) first_ack <= 1'b0;
      end
      write_ack <= 1'b0;
      wbm_stb_o_r <= wbm_stb_o & ! wbm_we_o;
      if (wbm_cyc_o & wbm_ack_i & last) begin
	 rdat_vld <= 1'b0;
      end

      case (state)
	S_IDLE : begin
	   wr_cyc <= 1'b0;
	   wr_stb <= 1'b0;
	   wr_cti <= 3'b000;
	   wr_bte <= 2'b00;

	   if (req) begin
	      radr <= wbm_adr_o >> ($clog2(SELW)+BUFW);
	      wr_adr <= adr_i << ($clog2(SELW)+BUFW);
	      wr_cti <= wbs_cti_i;
	      wr_bte <= wbs_bte_i;

	      if (wbs_we_i) begin
		 wr_cyc <= 1'b1;
		 wr_stb <= last_in_batch;
		 wbm_dat_o[idx_i*DW_IN+:DW_IN] <= wbs_dat_i;
		 wr_sel[idx_i*SELW+:SELW] <= wbs_sel_i;

		 //FIXME
		 wbm_dat_o[(!idx_i)*DW_IN+:DW_IN] <= {DW_IN{1'b0}};
		 wr_sel[(!idx_i)*SELW+:SELW]   <= {SELW{1'b0}};

		 write_ack <= 1'b1 | (!last_in_batch) & !(last & wbs_ack_o);

		 state <= S_WRITE;
	      end else begin //Read request
		 if (wbs_cti_i == 3'b111)
		   rdat_vld <= 1'b0;
		 if (!next_bufhit | !first_ack/*!wbm_stb_o_r*/) begin
		    rdat_vld <= 1'b0;
		    state <= S_READ;
		 end
	      end
	   end
	end

	S_READ : begin
	   if (wbm_ack_i) begin
	      next_radr <= wb_next_adr(wbs_adr_i, wbs_cti_i, wbs_bte_i, DW_OUT)>> ($clog2(SELW)+BUFW);
	      //next_radr <= next_adr;
	      radr <= adr_i;
	      rdat <= wbm_dat_i;
	      rdat_vld <= !last;
	      state <= S_IDLE;
	      wbm_stb_o_r <= 1'b1;
	   end
	end

	S_WRITE : begin
	   //write_ack <= (!last_in_batch | wbm_ack_i) & !(last & wbs_ack_o);
	   if (!wr_stb | wbm_ack_i) begin
	      write_ack <= !last & (!last_in_batch | wbm_ack_i);
		 wr_adr <= adr_i << ($clog2(SELW)+BUFW);
		 wdat[idx_i*DW_IN+:DW_IN] <= wbs_dat_i;
		 sel[idx_i*SELW+:SELW] <= wbs_sel_i;
		 if (last_in_batch) begin
		    wbm_dat_o[idx_i*DW_IN+:DW_IN] <= wbs_dat_i;
		    wbm_dat_o[(!idx_i)*DW_IN+:DW_IN] <= wdat[(!idx_i)*DW_IN+:DW_IN];
		    wr_sel[idx_i*SELW+:SELW] <= wbs_sel_i;
		    wr_sel[(!idx_i)*SELW+:SELW] <= sel[(!idx_i)*SELW+:SELW];
		    sel <= 0;

		 end
		 wr_sel[idx_i*SELW+:SELW] <= wbs_sel_i;
		 wr_stb <= last_in_batch;
	      wr_cti <= wbs_cti_i;
		 wr_bte <= wbs_bte_i;
	   end
	   if ((wbm_cti_o == 3'b111) & wbm_ack_i) begin
	      write_ack <= 1'b0;

	      wr_adr <= 0;
	      wbm_dat_o <= 0;
	      wr_sel <= 0;

	      wr_stb <= 1'b0;
	      wr_cyc <= 1'b0;
	      state <= S_IDLE;
	   end
	end
	default : state <= S_IDLE;
      endcase

      if (wb_rst_i) begin
	state <= S_IDLE;
	 rdat_vld <= 1'b0;
	 first_ack <= 1'b0;

      end
   end

endmodule
