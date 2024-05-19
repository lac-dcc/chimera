// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`define WFIFO_DEPTH_256 8'd2 //256*DEPTH
`define RFIFO_DEPTH_256 8'd2
//`define DBG_MODE

module spi_controller
#(
	parameter	SCLK_FREQ		= 6'd0,
	parameter	ADDR_WIDTH		= 24,
	parameter	NUM_OF_JPG		= 16,
	parameter	START_ADDR		= 'h40000,
	parameter	ADDR_OFFSET		= 'h40000
)
(
	input	i_arst,
	input	i_sysclk,
	// user button / VIO
	input	i_next,
	input	i_back,
	input	i_interrupt,
	// jfif parser
	input	i_flush,
	
`ifdef DBG_MODE
	output	o_cmd_en,
	output	[4:0]o_cmd,
	output	[ADDR_WIDTH-1:0]o_spi_addr,
	output	o_rd_valid,
	output	[7:0]o_rd_byte,
	output	o_rd_fifo_empty,
	output	o_busy,
	output	[4:0]o_fsm_status,
	output	[2:0]o_spi_status,
	output	o_next_pe,
	output	o_next_ne,
	output	o_back_pe,
	output	o_back_ne,
	output	o_interrupt_pe,
	output	o_interrupt_ne,
	output	[3:0]o_cnt,
	output	[7:0]o_device_id,
`endif
	
	input	i_miso,
	input	i_miso_1,
	output	o_nss,
	output	o_sclk,
	output	o_mosi,
	output	o_mosi_oe,
	
	input	i_ready,
	output	o_byte_en,
	output	[7:0]o_byte
);

function integer log2;
	input	integer	val;
	integer	i;
	begin
		log2 = 0;
		for (i=0; 2**i<val; i=i+1)
			log2 = i+1;
	end
endfunction

localparam	s_reset			= 3'b000;
localparam	s_read_id		= 3'b001;
localparam	s_idle			= 3'b010;
localparam	s_read			= 3'b011;
localparam	s_fifo_full		= 3'b100;
localparam	s_fifo_flush	= 3'b101;

localparam	c_nop		= 5'd0;
localparam	c_read_id	= 5'd3;
localparam	c_read		= 5'd2;
localparam	c_fast_read	= 5'd20;

wire	[ADDR_WIDTH-1:0]w_jpg_file_addr_map_0P[0:NUM_OF_JPG-1];

wire	w_busy;
wire	[7:0]w_rd_byte;
wire	w_rd_valid;
wire	[4:0]w_fsm_status;
wire	[7:0]w_device_id;

wire	w_rd_fifo_empty;

wire	w_next_pe_0P;
wire	w_next_ne_0P;
wire	w_back_pe_0P;
wire	w_back_ne_0P;
wire	w_interrupt_pe_0P;
wire	w_interrupt_ne_0P;

reg		[2:0]r_spi_status_1P;
reg		r_cmd_en_1P;
reg		[4:0]r_cmd_1P;
reg		r_re_1P;
reg		[ADDR_WIDTH-1:0]r_spi_addr_1P;
reg		[log2(NUM_OF_JPG)-1:0]r_cnt_1P;
reg		r_busy_1P;
reg		r_byte_en_1P;
reg		r_flush_1P;

reg		r_next_1P;
reg		r_back_1P;
reg		r_interrupt_1P;
reg		[log2(NUM_OF_JPG)-1:0]r_stack_1P;
reg		r_return_1P;

assign	w_jpg_file_addr_map_0P[0]	= START_ADDR;
//assign	w_jpg_file_addr_map_0P[0]	= 'h40000;
//assign	w_jpg_file_addr_map_0P[0]	= 'h0;
genvar i;
generate
	for (i=1; i<NUM_OF_JPG; i=i+1)
	begin
		assign	w_jpg_file_addr_map_0P[i]	= w_jpg_file_addr_map_0P[i-1]+ADDR_OFFSET;
//		assign	w_jpg_file_addr_map_0P[i]	= w_jpg_file_addr_map_0P[i-1]+'h40000;
//		assign	w_jpg_file_addr_map_0P[i]	= w_jpg_file_addr_map_0P[i-1]+'h00200;
	end
endgenerate

efx_spi_shifter
#(
	.SCLK_FREQ	(SCLK_FREQ),
	.ADDR_WIDTH	(ADDR_WIDTH)
 )
inst_efx_spi_shifter
(
	.nrst			(~i_arst),
	.clkin			(i_sysclk),
	.locked			(1'b1),
	.pll_rst		(),
	.spi_cmd_en		(r_cmd_en_1P),
	.spi_cmd		(r_cmd_1P),
	.spi_cmd_instr	({8{1'b0}}),
	.address		(r_spi_addr_1P),
	.data_in		({8{1'b0}}),
	.burst_data_wr	({8{1'b0}}),
	.byte_cnt		({9{1'b0}}),
	.w_burst_size	({8{1'b0}}),
	.r_burst_size	(8'd2),
	.rden			(r_re_1P),
	.data_out		(w_rd_byte),
	.busy			(w_busy),
	.data_valid		(w_rd_valid),
	
	.jedec_id_reg				(),
	.manufacturing_id_reg		(),
	.unique_id_reg				(),
	.device_id_reg				(w_device_id),
	.spi_flash_rd_status_reg0	(),
	.spi_flash_rd_status_reg1	(),
	.spi_flash_rd_status_reg2	(),
	
	.erase_en			(),
	.fsm_status			(w_fsm_status),
	.wfifo_rd			(),
	.page_program_done	(),
	
	.miso	(i_miso),
	.miso_1	(i_miso_1),
	.sclk	(o_sclk),
	.nss	(o_nss),
	.mosi	(o_mosi),
	.mosi_oe(o_mosi_oe)
);

dual_clock_fifo_wrapper
#(
	.DATA_WIDTH		(8),
	.ADDR_WIDTH		(9),
	.LATENCY		(1),
	.FIFO_MODE		("BYPASS"),
	.RAM_INIT_FILE	(""),
	.COMPATIBILITY	("E"),
	.OUTPUT_REG		("FALSE"),
	.CHECK_FULL		("FALSE"),
	.CHECK_EMPTY	("TRUE")
)
inst_dcfifo
(
	.i_arst		(i_arst),
	.i_wclk		(i_sysclk),
	.i_we		(w_rd_valid),
	.i_wdata	(w_rd_byte),
	.i_rclk		(i_sysclk),
	.i_re		((i_ready & r_byte_en_1P) | r_flush_1P) ,
	.o_full		(),
	.o_empty	(w_rd_fifo_empty),
	.o_rdata	(o_byte),
	
	.o_afull	(),
	.o_wcnt		(),
	.o_aempty	(),
	.o_rcnt		()
);

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_spi_status_1P	<= s_reset;
		r_cmd_en_1P		<= 1'b0;
		r_cmd_1P		<= c_nop;
		r_re_1P			<= 1'b0;
		r_spi_addr_1P	<= {ADDR_WIDTH{1'b0}};
		r_cnt_1P		<= {log2(NUM_OF_JPG){1'b0}};
		r_busy_1P		<= 1'b1;
		r_byte_en_1P	<= 1'b0;
		r_flush_1P		<= 1'b0;
		
		r_next_1P		<= 1'b0;
		r_back_1P		<= 1'b0;
		r_interrupt_1P	<= 1'b0;
	end
	else
	begin
		r_busy_1P		<= w_busy;
		r_next_1P		<= i_next;
		r_back_1P		<= i_back;
		r_interrupt_1P	<= i_interrupt;

		case (r_spi_status_1P)
			s_reset:
			begin
				if (~w_busy & r_busy_1P)
					r_spi_status_1P	<= s_read_id;
			end
			
			s_read_id:
			begin
				r_cmd_en_1P		<= 1'b1;
				r_cmd_1P		<= c_read_id;
				
				if (~w_busy & r_busy_1P)
				begin
					r_spi_status_1P	<= s_read;
					r_cmd_en_1P		<= 1'b0;
					r_cmd_1P		<= c_nop;
					r_spi_addr_1P	<= w_jpg_file_addr_map_0P[r_cnt_1P];
				end
			end
			
			s_idle:
			begin
				if (w_next_pe_0P)
					r_cnt_1P	<= r_cnt_1P+1'b1;
				else if (w_back_pe_0P)
					r_cnt_1P	<= r_cnt_1P-1'b1;
				else if (w_interrupt_pe_0P)
				begin
					if (r_return_1P)
					begin
						r_cnt_1P	<= r_stack_1P;
						r_return_1P	<= 1'b0;
					end
					else
					begin
						r_cnt_1P	<= NUM_OF_JPG-1'b1;
						r_stack_1P	<= r_cnt_1P;
						r_return_1P	<= 1'b1;
					end
				end
				
				if (i_flush)
				begin
					r_spi_status_1P	<= s_fifo_flush;
					r_flush_1P		<= 1'b1;
				end
				else if (w_next_ne_0P | w_back_ne_0P | w_interrupt_ne_0P)
				begin
					r_spi_status_1P	<= s_read;
					r_spi_addr_1P	<= w_jpg_file_addr_map_0P[r_cnt_1P];
				end
			end
			
			s_read:
			begin
				r_cmd_en_1P	<= 1'b1;
				r_cmd_1P	<= c_fast_read;
				r_re_1P		<= 1'b1;
				if (i_flush)
				begin
					r_spi_status_1P	<= s_fifo_flush;
					r_cmd_en_1P		<= 1'b0;
					r_cmd_1P		<= c_nop;
					r_re_1P			<= 1'b0;
					r_flush_1P		<= 1'b1;
				end
				else if (~w_busy & r_busy_1P)
				begin
					r_spi_status_1P	<= s_fifo_full;
					r_cmd_en_1P		<= 1'b0;
					r_cmd_1P		<= c_nop;
					r_re_1P			<= 1'b0;
					r_byte_en_1P	<= 1'b1;
				end
			end
			
			s_fifo_full:
			begin
				if (i_flush)
				begin
					r_spi_status_1P	<= s_fifo_flush;
					r_flush_1P		<= 1'b1;
				end
				else if (w_rd_fifo_empty)
				begin
					r_spi_status_1P	<= s_read;
					r_spi_addr_1P	<= r_spi_addr_1P+10'd512;
					r_byte_en_1P	<= 1'b0;
				end
			end
			
			s_fifo_flush:
			begin
				if (w_rd_fifo_empty)
				begin
					r_spi_status_1P	<= s_idle;
					r_flush_1P		<= 1'b0;
				end
			end
			
			default:
			begin
				r_spi_status_1P	<= s_read_id;
				r_cmd_en_1P		<= 1'b0;
				r_cmd_1P		<= c_nop;
				r_re_1P			<= 1'b0;
				r_spi_addr_1P	<= {ADDR_WIDTH{1'b0}};
				r_cnt_1P		<= {log2(NUM_OF_JPG){1'b0}};
				r_busy_1P		<= 1'b0;
				r_byte_en_1P	<= 1'b0;
				r_flush_1P		<= 1'b0;
				
				r_next_1P		<= 1'b0;
				r_back_1P		<= 1'b0;
				r_interrupt_1P	<= 1'b0;
			end
		endcase
	end
end

assign	w_next_pe_0P		= i_next & ~r_next_1P;
assign	w_next_ne_0P		= ~i_next & r_next_1P;
assign	w_back_pe_0P		= i_back & ~r_back_1P;
assign	w_back_ne_0P		= ~i_back & r_back_1P;
assign	w_interrupt_pe_0P	= i_interrupt & ~r_interrupt_1P;
assign	w_interrupt_ne_0P	= ~i_interrupt & r_interrupt_1P;
assign	o_byte_en			= ~w_rd_fifo_empty & r_byte_en_1P;

`ifdef DBG_MODE
assign	o_cmd_en		= r_cmd_en_1P;
assign	o_cmd			= r_cmd_1P;
assign	o_spi_addr		= r_spi_addr_1P;
assign	o_rd_valid		= w_rd_valid;
assign	o_rd_byte		= w_rd_byte;
assign	o_rd_fifo_empty	= w_rd_fifo_empty;
assign	o_busy			= w_busy;
assign	o_fsm_status	= w_fsm_status;
assign	o_spi_status	= r_spi_status_1P;
assign	o_next_pe		= w_next_pe_0P;
assign	o_next_ne		= w_next_ne_0P;
assign	o_back_pe		= w_back_pe_0P;
assign	o_back_ne		= w_back_ne_0P;
assign	o_interrupt_pe	= w_interrupt_pe_0P;
assign	o_interrupt_ne	= w_interrupt_ne_0P;
assign	o_cnt			= r_cnt_1P;
assign	o_device_id		= w_device_id;
`endif

endmodule
