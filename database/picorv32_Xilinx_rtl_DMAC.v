// This program was cloned from: https://github.com/cjhonlyone/picorv32_Xilinx
// License: MIT License

`timescale 1 ns / 1 ps
module DMAC #
(
  parameter DMA_RX_INTERVAL = 32'd1249999
)(
	input clk, resetn,

	input             mem_valid,
	output reg        mem_ready,
	input      [31:0] mem_addr,
	input      [31:0] mem_wdata,
	input      [ 3:0] mem_wstrb,
	output reg [31:0] mem_rdata,

	output reg	      BUS_valid,
	input             BUS_ready,

	output reg        heap_valid,
	input             heap_ready,
	output reg [31:0] heap_addr,
	output reg [31:0] heap_wdata,
	output reg [ 3:0] heap_wstrb,
	input      [31:0] heap_rdata, 

    input      [31:0] rx_axis_tdata,
    input      [ 3:0] rx_axis_tkeep,
    input             rx_axis_tvalid,
    output reg        rx_axis_tready,
    input             rx_axis_tlast,
    input             rx_axis_tuser,

    output reg [31:0] tx_axis_tdata,
    output reg [ 3:0] tx_axis_tkeep,
    output reg        tx_axis_tvalid,
    input             tx_axis_tready,
    output reg        tx_axis_tlast,
    output reg        tx_axis_tuser,

    output reg        rx_DMA_int,
    output reg        tx_DMA_int
    
);

	reg [31:0] rx_BD_adr[7:0];
	reg [31:0] rx_BD_len[7:0];
	reg [31:0] tx_BD_adr[7:0];
	reg [31:0] tx_BD_len[7:0];

	reg [ 7:0] rx_BD_clr;
	reg [ 7:0] rx_BD_sta_r;
	reg [ 7:0] rx_BD_sta;

	reg [ 7:0] tx_BD_sta;

	wire          tx_sta_valid = |tx_BD_sta;
	reg 		  tx_sta_ready;

	reg ENABLE_DMA;

	reg mem_valid_reg;

	always @(posedge clk) begin
		if (!resetn) begin
			rx_BD_adr[0] <= 0;
			rx_BD_adr[1] <= 0;
			rx_BD_adr[2] <= 0;
			rx_BD_adr[3] <= 0;
			rx_BD_adr[4] <= 0;
			rx_BD_adr[5] <= 0;
			rx_BD_adr[6] <= 0;
			rx_BD_adr[7] <= 0;

			tx_BD_adr[0] <= 0;
			tx_BD_adr[1] <= 0;
			tx_BD_adr[2] <= 0;
			tx_BD_adr[3] <= 0;
			tx_BD_adr[4] <= 0;
			tx_BD_adr[5] <= 0;
			tx_BD_adr[6] <= 0;
			tx_BD_adr[7] <= 0;
			tx_BD_len[0] <= 0;
			tx_BD_len[1] <= 0;
			tx_BD_len[2] <= 0;
			tx_BD_len[3] <= 0;
			tx_BD_len[4] <= 0;
			tx_BD_len[5] <= 0;
			tx_BD_len[6] <= 0;
			tx_BD_len[7] <= 0;

			// read only 
			// rx_BD_sta_r

			rx_BD_clr <= 0;
			ENABLE_DMA <= 0;

			tx_BD_sta <= 8'd0;

			mem_ready <= 0;
			mem_rdata <= 0;
			mem_valid_reg <= 0;
		end else begin
			if ((mem_valid == 1) && (mem_valid_reg == 0))
				mem_ready <= 1;
			if (mem_ready)
				mem_ready <= 0;

			mem_valid_reg <= mem_valid;

			if ((mem_valid == 1) && (mem_valid_reg == 0)) begin
				// rx_BD_adr
				if (mem_addr[7:2] == 6'h10) begin
					mem_rdata <= rx_BD_adr[0];
					if (mem_wstrb==4'hF) rx_BD_adr[0] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h11) begin
					mem_rdata <= rx_BD_adr[1];
					if (mem_wstrb==4'hF) rx_BD_adr[1] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h12) begin
					mem_rdata <= rx_BD_adr[2];
					if (mem_wstrb==4'hF) rx_BD_adr[2] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h13) begin
					mem_rdata <= rx_BD_adr[3];
					if (mem_wstrb==4'hF) rx_BD_adr[3] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h14) begin
					mem_rdata <= rx_BD_adr[4];
					if (mem_wstrb==4'hF) rx_BD_adr[4] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h15) begin
					mem_rdata <= rx_BD_adr[5];
					if (mem_wstrb==4'hF) rx_BD_adr[5] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h16) begin
					mem_rdata <= rx_BD_adr[6];
					if (mem_wstrb==4'hF) rx_BD_adr[6] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h17) begin
					mem_rdata <= rx_BD_adr[7];
					if (mem_wstrb==4'hF) rx_BD_adr[7] <= mem_wdata;
				// rx_BD_len
				end
				if (mem_addr[7:2] == 6'h18) begin
					mem_rdata <= rx_BD_len[0];
					// if (mem_wstrb==4'hF) rx_BD_len[0] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h19) begin
					mem_rdata <= rx_BD_len[1];
					// if (mem_wstrb==4'hF) rx_BD_len[1] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h1A) begin
					mem_rdata <= rx_BD_len[2];
					// if (mem_wstrb==4'hF) rx_BD_len[2] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h1B) begin
					mem_rdata <= rx_BD_len[3];
					// if (mem_wstrb==4'hF) rx_BD_len[3] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h1C) begin
					mem_rdata <= rx_BD_len[4];
					// if (mem_wstrb==4'hF) rx_BD_len[4] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h1D) begin
					mem_rdata <= rx_BD_len[5];
					// if (mem_wstrb==4'hF) rx_BD_len[5] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h1E) begin
					mem_rdata <= rx_BD_len[6];
					// if (mem_wstrb==4'hF) rx_BD_len[6] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h1F) begin
					mem_rdata <= rx_BD_len[7];
					// if (mem_wstrb==4'hF) rx_BD_len[7] <= mem_wdata;

				// tx_BD_adr
				end
				if (mem_addr[7:2] == 6'h20) begin
					mem_rdata <= tx_BD_adr[0];
					if (mem_wstrb==4'hF) tx_BD_adr[0] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h21) begin
					mem_rdata <= tx_BD_adr[1];
					if (mem_wstrb==4'hF) tx_BD_adr[1] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h22) begin
					mem_rdata <= tx_BD_adr[2];
					if (mem_wstrb==4'hF) tx_BD_adr[2] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h23) begin
					mem_rdata <= tx_BD_adr[3];
					if (mem_wstrb==4'hF) tx_BD_adr[3] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h24) begin
					mem_rdata <= tx_BD_adr[4];
					if (mem_wstrb==4'hF) tx_BD_adr[4] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h25) begin
					mem_rdata <= tx_BD_adr[5];
					if (mem_wstrb==4'hF) tx_BD_adr[5] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h26) begin
					mem_rdata <= tx_BD_adr[6];
					if (mem_wstrb==4'hF) tx_BD_adr[6] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h27) begin
					mem_rdata <= tx_BD_adr[7];
					if (mem_wstrb==4'hF) tx_BD_adr[7] <= mem_wdata;
				// tx_BD_len
				end
				if (mem_addr[7:2] == 6'h28) begin
					mem_rdata <= tx_BD_len[0];
					if (mem_wstrb==4'hF) tx_BD_len[0] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h29) begin
					mem_rdata <= tx_BD_len[1];
					if (mem_wstrb==4'hF) tx_BD_len[1] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h2A) begin
					mem_rdata <= tx_BD_len[2];
					if (mem_wstrb==4'hF) tx_BD_len[2] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h2B) begin
					mem_rdata <= tx_BD_len[3];
					if (mem_wstrb==4'hF) tx_BD_len[3] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h2C) begin
					mem_rdata <= tx_BD_len[4];
					if (mem_wstrb==4'hF) tx_BD_len[4] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h2D) begin
					mem_rdata <= tx_BD_len[5];
					if (mem_wstrb==4'hF) tx_BD_len[5] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h2E) begin
					mem_rdata <= tx_BD_len[6];
					if (mem_wstrb==4'hF) tx_BD_len[6] <= mem_wdata;
				end
				if (mem_addr[7:2] == 6'h2F) begin
					mem_rdata <= tx_BD_len[7];
					if (mem_wstrb==4'hF) tx_BD_len[7] <= mem_wdata;
				end
				
				if (mem_addr[7:2] == 6'h30) begin
					mem_rdata <= {31'd0, ENABLE_DMA};
					if (mem_wstrb==4'hF) ENABLE_DMA <= mem_wdata[0];
				end
				if (mem_addr[7:2] == 6'h31) begin
					mem_rdata <= {24'd0, rx_BD_sta};
				end
				if (mem_addr[7:2] == 6'h32) begin
					mem_rdata <= {24'd0, rx_BD_clr};
					if (mem_wstrb==4'hF) rx_BD_clr <= mem_wdata[7:0];
				end
				if (mem_addr[7:2] == 6'h33) begin
					mem_rdata <= {24'd0, tx_BD_sta};
					if (mem_wstrb==4'hF) tx_BD_sta <= mem_wdata[7:0];
				end
			end
			if (|rx_BD_clr == 1)
				rx_BD_clr <= 0;

			if (tx_sta_ready)
				tx_BD_sta <= 0;
		end
	end

	reg    [ 2:0] rx_BD_idx;
	reg    [ 2:0] tx_BD_idx;
	reg    [31:0] BD_frame_len;

	reg    [ 2:0] keep2bytes;
	reg    [ 3:0] bytes2keep;
	reg    [ 3:0] addr2keep;
	reg    [ 2:0] addr2len;
	reg    [31:0] heap_addr_m;
	reg    [31:0] heap_rdata_wrap;

	reg rx_axis_tready_m,rx_axis_tready_m2,rx_axis_tready_m3;
	reg rx_axis_tlast_m,rx_axis_tlast_m2,rx_axis_tlast_m3;
	reg     [31:0] rx_axis_tdata_m,rx_axis_tdata_m2;
	reg     [ 3:0] rx_axis_tkeep_m;

    reg [31:0] tx_axis_tdata_m1;
    reg [ 3:0] tx_axis_tkeep_m1;
    reg        tx_axis_tvalid_m1;
    reg        tx_axis_tlast_m1;
    reg        tx_axis_tuser_m1;

    reg [31:0] tx_axis_tdata_m2;
    reg [ 3:0] tx_axis_tkeep_m2;
    reg        tx_axis_tvalid_m2;
    reg        tx_axis_tlast_m2;
    reg        tx_axis_tuser_m2;

    reg [31:0] tx_axis_tdata_m3;
    reg [ 3:0] tx_axis_tkeep_m3;
    reg        tx_axis_tvalid_m3;
    reg        tx_axis_tlast_m3;
    reg        tx_axis_tuser_m3;

    reg [31:0] rtx_axis_tdata;
    reg [ 3:0] rtx_axis_tkeep;
    reg        rtx_axis_tvalid;
    reg        rtx_axis_tlast;
    reg        rtx_axis_tuser;

    reg        rtx_axis_tvalid_m;

    wire       rtx_axis_tvalid_pedge = ((rtx_axis_tvalid_m == 0) && (rtx_axis_tvalid ==  1));

    reg [47:0] dst_mac;

    reg drop_frame;

	always @(*) begin
		case(rx_axis_tkeep_m)
		4'hf: keep2bytes = 3'd4;
		4'h7: keep2bytes = 3'd3;
		4'h3: keep2bytes = 3'd2;
		4'h1: keep2bytes = 3'd1;
		default: keep2bytes = 3'd0;
		endcase
	end

	always @(*) begin
		case(BD_frame_len[1:0])
		2'h3: bytes2keep = 4'h7;
		2'h2: bytes2keep = 4'h3;
		2'h1: bytes2keep = 4'h1;
		2'h0: bytes2keep = 4'hf;
		endcase
	end

	always @(*) begin
		case(heap_addr[1:0])
		2'h3: addr2keep = 4'd1;
		2'h2: addr2keep = 4'h3;
		2'h1: addr2keep = 4'h7;
		2'h0: addr2keep = 4'hf;
		endcase
	end

	always @(*) begin
		case(heap_addr[1:0])
		2'h3: addr2len = 3'd1;
		2'h2: addr2len = 3'h2;
		2'h1: addr2len = 3'h3;
		2'h0: addr2len = 3'h4;
		endcase
	end

	always @(*) begin
		case(heap_addr_m[1:0])
		2'h3: heap_rdata_wrap = {8'h00,8'h00,8'h00,heap_rdata[31:24]};
		2'h2: heap_rdata_wrap = {8'h00,8'h00,heap_rdata[31:16]};
		2'h1: heap_rdata_wrap = {8'h00,heap_rdata[31:8]};
		2'h0: heap_rdata_wrap = heap_rdata;
		endcase
	end

always @(posedge clk) begin
	if (!resetn) begin
		heap_addr_m <= 0;
	end else begin
		if (rtx_axis_tvalid_pedge)
			heap_addr_m <= heap_addr;
	end
end
// FSM

localparam [ 6:0]
    STATE_IDLE  = 7'b000_0001,
    STATE_WAIT  = 7'b000_0010,
    STATE_ABUS  = 7'b000_0100,
    STATE_WRITE = 7'b000_1000,
    STATE_READ  = 7'b001_0000,
    STATE_KEEP  = 7'b010_0000;
    // STATE_ALIGN  = 7'b100_0000;

    reg [ 6:0] DMArx_cur_state;
    reg [ 6:0] DMArx_nxt_state;

	always @(posedge clk) begin
	    if (!resetn)
	        DMArx_cur_state <= STATE_IDLE;
	    else
	        DMArx_cur_state <= DMArx_nxt_state;
	end

	always @* begin
		case (DMArx_cur_state)
			STATE_IDLE: begin
				DMArx_nxt_state = ENABLE_DMA ? STATE_WAIT : STATE_IDLE;
			end
			STATE_WAIT: begin
				DMArx_nxt_state = (((&rx_BD_sta_r==0)&&(rx_axis_tvalid==1)) | tx_sta_valid) ? STATE_ABUS : STATE_WAIT;
			end
			STATE_ABUS: begin
				DMArx_nxt_state = BUS_ready ? (tx_sta_valid ? STATE_READ : STATE_WRITE) : STATE_ABUS;
			end			
			STATE_WRITE: begin
				DMArx_nxt_state = rx_axis_tlast_m3 ? STATE_WAIT : STATE_WRITE;
			end
			STATE_READ: begin
				DMArx_nxt_state = rtx_axis_tlast ? STATE_KEEP : STATE_READ;
			end	
			STATE_KEEP: begin
				DMArx_nxt_state = tx_sta_ready ? STATE_WAIT : STATE_KEEP;
			end	
			// STATE_ALIGN: begin
			// 	DMArx_nxt_state = rtx_axis_tvalid ? STATE_READ : STATE_ALIGN;
			// end
			default:DMArx_nxt_state = STATE_IDLE;
		endcase
	end

	always @(posedge clk) begin
		if (!resetn) begin
			heap_valid <= 0;
			heap_addr <= 32'd0;
			heap_wdata <= 32'd0;
			heap_wstrb <= 4'h0;

			BUS_valid <= 0;
			BD_frame_len <= 0;

			rx_axis_tready <= 0;

			tx_sta_ready <= 0;

			rtx_axis_tdata <= 0;
			rtx_axis_tkeep <= 0;
			rtx_axis_tvalid <= 0;
			rtx_axis_tlast <= 0;
			rtx_axis_tuser <= 0;
		end else begin
			case (DMArx_nxt_state)
				STATE_IDLE: begin
					heap_valid <= 0;
					heap_addr <= 32'd0;
					heap_wdata <= 32'd0;
					heap_wstrb <= 4'h0;

					BUS_valid <= 0;
					BD_frame_len <= 0;

					rx_axis_tready <= 0;

					tx_sta_ready <= 0;

					rtx_axis_tdata <= 0;
					rtx_axis_tkeep <= 0;
					rtx_axis_tvalid <= 0;
					rtx_axis_tlast <= 0;
					rtx_axis_tuser <= 0;
				end
				STATE_WAIT: begin
					heap_valid <= 0;
					heap_addr <= 32'd0;
					heap_wdata <= 32'd0;
					heap_wstrb <= 4'h0;

					BUS_valid <= 0;
					BD_frame_len <= 0;

					rx_axis_tready <= 0;

					tx_sta_ready <= 0;

					rtx_axis_tdata <= 0;
					rtx_axis_tkeep <= 0;
					rtx_axis_tvalid <= 0;
					rtx_axis_tlast <= 0;
					rtx_axis_tuser <= 0;
				end
				STATE_ABUS: begin
					heap_valid <= 0;
					heap_addr <= tx_sta_valid ? tx_BD_adr[tx_BD_idx] : rx_BD_adr[rx_BD_idx];
					heap_wdata <= 32'd0;
					heap_wstrb <= 4'h0;

					BUS_valid <= 1;
					BD_frame_len <= tx_BD_len[tx_BD_idx];

					rx_axis_tready <= 0;

					tx_sta_ready <= 0;

					rtx_axis_tdata <= 0;
					rtx_axis_tkeep <= 0;
					rtx_axis_tvalid <= 0;
					rtx_axis_tlast <= 0;
					rtx_axis_tuser <= 0;
				end	
				STATE_WRITE: begin
					heap_valid <= 1;
					heap_addr <= rx_axis_tready_m3 ? (heap_addr + 4) : heap_addr;
					heap_wdata <= rx_axis_tdata_m2;
					heap_wstrb <= (rx_axis_tready_m && rx_axis_tready ) ? rx_axis_tkeep : 4'd0;

					BUS_valid <= 1;
					BD_frame_len <= rx_axis_tready_m ? (BD_frame_len + keep2bytes) : 0;

					rx_axis_tready <= rx_axis_tlast ? 0 : 1;

					tx_sta_ready <= 0;

					rtx_axis_tdata <= 0;
					rtx_axis_tkeep <= 0;
					rtx_axis_tvalid <= 0;
					rtx_axis_tlast <= 0;
					rtx_axis_tuser <= 0;
				end
				// STATE_ALIGN: begin
				// 	heap_valid <= 1;
				// 	heap_addr <= heap_addr + addr2len;
				// 	heap_wdata <= 32'd0;
				// 	heap_wstrb <= 4'h0;

				// 	BUS_valid <= 1;
				// 	BD_frame_len <= BD_frame_len - addr2len;

				// 	rx_axis_tready <= 0;

				// 	tx_sta_ready <= 0;

				// 	rtx_axis_tvalid <= 1;
				// 	rtx_axis_tdata <= 0;
				// 	rtx_axis_tkeep <= addr2keep;

				// 	rtx_axis_tlast <= 0;
				// 	rtx_axis_tuser <= 0;
				// end
				STATE_READ: begin
					heap_valid <= 1;
					heap_addr <= rtx_axis_tvalid ? rtx_axis_tvalid_pedge ? (heap_addr + addr2len) :
						(heap_addr + 4) : heap_addr;
					heap_wdata <= 32'd0;
					heap_wstrb <= 4'h0;

					BUS_valid <= 1;
					BD_frame_len <= rtx_axis_tvalid ? rtx_axis_tvalid_pedge ? (BD_frame_len - addr2len) :
						(BD_frame_len - 4) : BD_frame_len;

					rx_axis_tready <= 0;

					tx_sta_ready <= 0;

					rtx_axis_tvalid <= 1;
					rtx_axis_tdata <= 0;
					rtx_axis_tkeep <= !rtx_axis_tvalid ? addr2keep :
						(BD_frame_len < 32'd8) ? bytes2keep : 4'hf;

					rtx_axis_tlast <= (BD_frame_len <= 32'd8) ? 1 : 0;
					rtx_axis_tuser <= 0;
				end
				STATE_KEEP: begin
					heap_valid <= 1;
					heap_addr <= 32'd0;
					heap_wdata <= 32'd0;
					heap_wstrb <= 4'h0;

					BUS_valid <= 1;
					BD_frame_len <= 0;

					rx_axis_tready <= 0;

					tx_sta_ready <= rtx_axis_tvalid ? 0 : 1;

					rtx_axis_tdata <= 0;
					rtx_axis_tkeep <= 0;
					rtx_axis_tvalid <= 0;
					rtx_axis_tlast <= 0;
					rtx_axis_tuser <= 0;
				end

			endcase

		end
	end
	
	wire keep_frame;
	assign keep_frame = (dst_mac == 48'hff_ff_ff_ff_ff_ff) ? 1 :
						(dst_mac == 48'h00_0a_35_00_01_02) ? 1 : 0;

	always @(posedge clk) begin
		if (!resetn) begin
			// reset
			dst_mac <= 0;
			drop_frame <= 0;
		end else if (DMArx_nxt_state == STATE_WRITE) begin
			case(BD_frame_len[31:2])
			30'd0: begin
				dst_mac <= {rx_axis_tdata_m[7:0],rx_axis_tdata_m[15:8],
									rx_axis_tdata_m[23:16],rx_axis_tdata_m[31:24],16'd0};
				drop_frame <= 0;
			end
			30'd1: begin
				dst_mac <= {dst_mac[47:16], rx_axis_tdata_m[7:0],rx_axis_tdata_m[15:8]};
				drop_frame <= 0;
			end
			30'd2: begin
				if (keep_frame == 0)
					drop_frame <= 1;
			end
			default:;
			endcase
		end
	end

	always @(posedge clk) begin
		if (!resetn) begin
			// reset
			rx_axis_tready_m <= 0;
			rx_axis_tready_m2 <= 0;
			rx_axis_tready_m3 <= 0;
			rx_axis_tlast_m <= 0;
			rx_axis_tlast_m2 <= 0;
			rx_axis_tlast_m3 <= 0;

			rtx_axis_tvalid_m <= 0;

			rx_axis_tdata_m <= 0;
			rx_axis_tdata_m2 <= 0;

			rx_axis_tkeep_m <= 0;
		end else begin
			rx_axis_tready_m <= rx_axis_tready;
			rx_axis_tready_m2 <= rx_axis_tready_m;
			rx_axis_tready_m3 <= rx_axis_tready_m2;

			rx_axis_tlast_m <= rx_axis_tlast;
			rx_axis_tlast_m2 <= rx_axis_tlast_m;
			rx_axis_tlast_m3 <= rx_axis_tlast_m2;

			rtx_axis_tvalid_m <= rtx_axis_tvalid;

			rx_axis_tdata_m <= rx_axis_tdata;
			rx_axis_tdata_m2 <= rx_axis_tdata_m;

			rx_axis_tkeep_m <= rx_axis_tkeep;
		end
	end

	always @(posedge clk) begin
		tx_axis_tdata_m1 <= heap_rdata;
		tx_axis_tkeep_m1 <= rtx_axis_tkeep;
		tx_axis_tvalid_m1 <= rtx_axis_tvalid;
		tx_axis_tlast_m1 <= rtx_axis_tlast;
		tx_axis_tuser_m1 <= rtx_axis_tuser;

		tx_axis_tdata_m2 <= heap_rdata;
		tx_axis_tkeep_m2 <= tx_axis_tkeep_m1;
		tx_axis_tvalid_m2 <= tx_axis_tvalid_m1;
		tx_axis_tlast_m2 <= tx_axis_tlast_m1;
		tx_axis_tuser_m2 <= tx_axis_tuser_m1;

		tx_axis_tdata_m3 <= heap_rdata;
		tx_axis_tkeep_m3 <= tx_axis_tkeep_m2;
		tx_axis_tvalid_m3 <= tx_axis_tvalid_m2;
		tx_axis_tlast_m3 <= tx_axis_tlast_m2;
		tx_axis_tuser_m3 <= tx_axis_tuser_m2;

		tx_axis_tdata <= heap_ready ? heap_rdata_wrap : heap_rdata;
		tx_axis_tkeep <= tx_axis_tkeep_m3;
		tx_axis_tvalid <= tx_axis_tvalid_m3;
		tx_axis_tlast <= tx_axis_tlast_m3;
		tx_axis_tuser <= tx_axis_tuser_m3;
	end

	always @(posedge clk) begin
		if (!resetn) begin
			// reset
			rx_BD_len[0] <= 0;
			rx_BD_len[1] <= 0;
			rx_BD_len[2] <= 0;
			rx_BD_len[3] <= 0;
			rx_BD_len[4] <= 0;
			rx_BD_len[5] <= 0;
			rx_BD_len[6] <= 0;
			rx_BD_len[7] <= 0;

			rx_BD_idx <= 3'd0;
			rx_BD_sta_r <= 8'b0;
			rx_BD_sta <= 8'b0;

			tx_BD_idx <= 3'd0;
			
		end else begin
			tx_BD_idx <= 3'd0;

			if ({rx_axis_tready_m, rx_axis_tready} == 2'b01) begin
				rx_BD_sta_r[rx_BD_idx] <= 1'b1;
			end
				

			if ({rx_axis_tready_m2, rx_axis_tready_m} == 2'b10) begin
				if(drop_frame == 1) begin
					rx_BD_idx <= rx_BD_idx;
					rx_BD_len[rx_BD_idx] <= 0;
					rx_BD_sta_r[rx_BD_idx] <= 0;
				end else begin
					rx_BD_idx <= rx_BD_idx + 1;
					rx_BD_len[rx_BD_idx] <= BD_frame_len;
					rx_BD_sta[rx_BD_idx] <= 1;
				end
			end
				
			if (rx_BD_clr[0]) begin 
				rx_BD_sta[0] <= 0;rx_BD_sta_r[0] <= 0; 
				rx_BD_len[0] <= 0; 
			end
			if (rx_BD_clr[1]) begin 
				rx_BD_sta[1] <= 0;rx_BD_sta_r[1] <= 0; 
				rx_BD_len[1] <= 0; 
			end
			if (rx_BD_clr[2]) begin 
				rx_BD_sta[2] <= 0;rx_BD_sta_r[2] <= 0; 
				rx_BD_len[2] <= 0; 
			end
			if (rx_BD_clr[3]) begin 
				rx_BD_sta[3] <= 0;rx_BD_sta_r[3] <= 0; 
				rx_BD_len[3] <= 0; 
			end
			if (rx_BD_clr[4]) begin 
				rx_BD_sta[4] <= 0;rx_BD_sta_r[4] <= 0; 
				rx_BD_len[4] <= 0; 
			end
			if (rx_BD_clr[5]) begin 
				rx_BD_sta[5] <= 0;rx_BD_sta_r[5] <= 0; 
				rx_BD_len[5] <= 0; 
			end
			if (rx_BD_clr[6]) begin 
				rx_BD_sta[6] <= 0;rx_BD_sta_r[6] <= 0; 
				rx_BD_len[6] <= 0; 
			end
			if (rx_BD_clr[7]) begin 
				rx_BD_sta[7] <= 0;rx_BD_sta_r[7] <= 0; 
				rx_BD_len[7] <= 0; 
			end


		end
	end

	reg [31:0] us_cnt;
	always @(posedge clk) begin
		if (!resetn) begin
			// reset
			us_cnt <= 0;
			rx_DMA_int <= 0;
		end else begin
			if (ENABLE_DMA) begin
				if (us_cnt >= DMA_RX_INTERVAL) begin
					us_cnt <= 0;
					if (|rx_BD_sta)
						rx_DMA_int <= 1;
				end else 
					us_cnt <= us_cnt + 1;			
			end else begin
				us_cnt <= 0;
			end


			if (rx_DMA_int == 1)
				rx_DMA_int <= 0;
		end
	end

endmodule 

module mux_heap(
	input clk, resetn,

	output            mux_heap_valid,
	input             mux_heap_ready,
	output     [31:0] mux_heap_addr ,
	output     [31:0] mux_heap_wdata,
	output     [ 3:0] mux_heap_wstrb,
	input      [31:0] mux_heap_rdata,

	input    	      BUS_valid,
	output reg        BUS_ready,

	input             DMA_heap_valid,
	output            DMA_heap_ready,
	input      [31:0] DMA_heap_addr ,
	input      [31:0] DMA_heap_wdata,
	input      [ 3:0] DMA_heap_wstrb,
	output     [31:0] DMA_heap_rdata, 

	input             CPU_heap_valid,
	output            CPU_heap_ready,
	input      [31:0] CPU_heap_addr ,
	input      [31:0] CPU_heap_wdata,
	input      [ 3:0] CPU_heap_wstrb,
	output     [31:0] CPU_heap_rdata
);

	// reg BUS_valid_m1;
	always @(posedge clk) begin
		if (!resetn) begin
			// reset
			BUS_ready <= 0;
			// BUS_valid_m1 <= 0;
		end else begin
			// BUS_valid_m1 <= BUS_valid;
			if ((BUS_valid == 1) && (CPU_heap_valid == 0)) begin
				BUS_ready <= 1;
			end else if (BUS_valid == 0) begin
				BUS_ready <= 0;
			end
		end
	end

	assign mux_heap_valid = BUS_ready ? DMA_heap_valid : CPU_heap_valid;
	assign mux_heap_addr  = BUS_ready ? DMA_heap_addr  : CPU_heap_addr ;
	assign mux_heap_wdata = BUS_ready ? DMA_heap_wdata : CPU_heap_wdata;
	assign mux_heap_wstrb = BUS_ready ? DMA_heap_wstrb : CPU_heap_wstrb;

	assign DMA_heap_ready = BUS_ready ? mux_heap_ready : 0;
	assign CPU_heap_ready = BUS_ready ? 0 : mux_heap_ready;

	assign DMA_heap_rdata = BUS_ready ? mux_heap_rdata : 0;
	assign CPU_heap_rdata = BUS_ready ? 0 : mux_heap_rdata;

endmodule