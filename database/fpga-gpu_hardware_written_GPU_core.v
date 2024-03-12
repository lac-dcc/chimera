
module gpu_core (
	//GPU clk domain
	input gpu_clk,
	input gpu_rst,

	//clk domain
	input clk,
	input rst,
	
	//avalon slave for control
	input [7:0]slave_address,
	input slave_read_en,
	input slave_write_en,
	output [31:0]slave_read_data,
	output slave_wait_request,
	input [31:0]slave_write_data,
	
	//avalon master for accessing SDRAM
	output [31:0]master_address, 
	output master_write,
	output [31:0]master_write_data,
	input master_wait_request
);
	
	//performance metrics
	reg [31:0]ticks;
	reg [31:0]raster_ticks;
	reg [31:0]writer_ticks;
	reg [31:0]cb_empty_ticks;

	wire [31:0]read_ticks;
	wire [31:0]read_raster_ticks;
	wire [31:0]read_writer_ticks;
	wire [31:0]read_cb_empty_ticks;
	shift_reg #(
		.WIDTH(32),
		.DEPTH(2)
	) tick_sync (
		.clk(clk),
		.rst(rst),
		.clk_en(1'b1),
		.in(ticks),
		.out(read_ticks)
	);
	shift_reg #(
		.WIDTH(32),
		.DEPTH(2)
	) raster_tick_sync (
		.clk(clk),
		.rst(rst),
		.clk_en(1'b1),
		.in(raster_ticks),
		.out(read_raster_ticks)
	);
	shift_reg #(
		.WIDTH(32),
		.DEPTH(2)
	) writer_tick_sync (
		.clk(clk),
		.rst(rst),
		.clk_en(1'b1),
		.in(writer_ticks),
		.out(read_writer_ticks)
	);
	shift_reg #(
		.WIDTH(32),
		.DEPTH(2)
	) cb_empty_tick_sync (
		.clk(clk),
		.rst(rst),
		.clk_en(1'b1),
		.in(cb_empty_ticks),
		.out(read_cb_empty_ticks)
	);

	
	//buffer commands from the CPU
	reg stall_cmd;
	wire cb_empty;
	wire cb_rdreq = !(cb_empty || stall_cmd);
	wire cb_full;
	wire [7:0]cb_usedw;
	wire [39:0]cb_readdata;
	
	wire [40:0]cmd_out;
	wire [17:0]cmd_float;

	wire [7:0]cmd_addr = cmd_out[39:32];
	wire [31:0]cmd_data = cmd_out[31:0];
	wire cmd_valid = cmd_out[40];

	reg start_write;
	reg set_clear;
	reg reset_ticks;
	reg buffers_swapped;

	reg clear;
	reg [31:0]addr;
	reg [15:0]stride;
		
	wire raster_busy;
	reg tile_start;
	wire [3:0]tile_wren;
	wire [15:0]tile_out;
	wire [7:0]tile_ram_addr;

	wire reading_from_tile;
	wire flushed_to_bus;
	wire [8:0]writer_ram_addr;
	wire [31:0]ram_data_out;


	//read requests
	reg [31:0]read_reg;
	assign slave_read_data = read_reg;
	always @ (*) begin
		case(slave_address)
			4'd0 : read_reg = cb_usedw;
			4'd1 : read_reg = read_ticks;
			4'd2 : read_reg = read_raster_ticks;
			4'd3 : read_reg = read_writer_ticks;
			4'd4 : read_reg = read_cb_empty_ticks;
			default: read_reg = 32'd0;
		endcase
	end


	assign slave_wait_request = slave_write_en & cb_full;
	command_buffer cb0(
		.aclr		(rst),
		.data		({slave_address, slave_write_data}),
		.rdclk	(gpu_clk),
		.rdreq	(cb_rdreq),
		.wrclk	(clk),
		.wrreq	(slave_write_en & !slave_wait_request),
		.q			(cb_readdata),
		.rdempty	(cb_empty),
		.wrfull	(cb_full),
		.wrusedw (cb_usedw)
	);
	
	//remember if the data is valid or not
	reg read_valid;
	always @ (posedge gpu_clk or posedge gpu_rst) begin
		if(gpu_rst) begin
			read_valid <= 0;
		end else begin
			read_valid <= stall_cmd ? read_valid : cb_rdreq;
		end
	end
	
	//delay cmds to lineup with float conversion
	shift_reg #(
		.WIDTH(41),
		.DEPTH(2)
	) cmd_delay (
		.clk(gpu_clk),
		.rst(gpu_rst),
		.clk_en(!stall_cmd),
		.in({read_valid, cb_readdata}),
		.out(cmd_out)
	);

	//convert incoming single precision floats to GPU sized 18 bits
	f32_f18 fpConv (
		.clk(gpu_clk),
		.en(!stall_cmd),
		.areset(gpu_rst),
		.a(cb_readdata[31:0]),
		.q(cmd_float)
	);
		
	//asert cb_rdreq if the command can be completed this cycle
	always @ (*) begin
		tile_start = 0;
		start_write = 0;
		set_clear = 0;
		reset_ticks = 0;
		stall_cmd = 0;
		
		if(cmd_addr[7:0] == 8'b0 && cmd_valid) begin
			case(cmd_data[3:0])
				//start tile raster
				0: begin
					if(!raster_busy) begin
						tile_start = 1;
					end else begin
						stall_cmd = 1;
					end
				end
				//start tile write to fifo
				2: begin
					if(!reading_from_tile && !raster_busy) begin
						start_write = 1;
						set_clear = 1;
					end else begin
						stall_cmd = 1;
					end
				end
				//wait for fifo to finish writing to RAM
				4: begin
					stall_cmd = !flushed_to_bus;
				end
				//reset the GPU state
				5: begin
					set_clear = 1;
					reset_ticks = 1;
				end
				default: ;//do nothing
			endcase
		end
	end
	
	//process command buffer
	always @ (posedge gpu_clk or posedge gpu_rst) begin
		if (gpu_rst) begin
			clear <= 0;
			addr <= 0;
			stride <= 0;
			buffers_swapped <= 0;
		end else begin
			if(reset_ticks) begin
				ticks <= 0;
				raster_ticks <= 0;
				writer_ticks <= 0;
				cb_empty_ticks <= 0;
			end else begin
				ticks <= ticks + 1;
				raster_ticks <= raster_ticks + raster_busy;
				writer_ticks <= writer_ticks + reading_from_tile;
				cb_empty_ticks <= cb_empty_ticks + !cmd_valid;
			end

			if(start_write) begin
				buffers_swapped <= !buffers_swapped;
			end
			if(set_clear) begin
				clear <= 1;
			end else if(tile_start) begin
				clear <= 0;
			end
			if(cmd_addr[7:4] == 4'd0 && cmd_valid) begin
				case(cmd_addr[3:0])
					4'd1: addr <= cmd_data;
					4'd2: stride <= cmd_data[15:0];
				endcase
			end
		end
	end
				
	raster_controller r0(
		.clk	(gpu_clk),
		.rst	(gpu_rst),

		//CPU writeable registers	
		.reg_addr	(cmd_addr[3:0]),
		.reg_data	(cmd_data),
		.reg_float	(cmd_float),
		.reg_wren	(cmd_addr[7:4] == 4'd1 && cmd_valid),
	
		//control signals
		.start	(tile_start),
		.busy		(raster_busy),
		.clear	(clear),
	
		//output
		.addr	(tile_ram_addr),
		.wren	(tile_wren),
		.data	(tile_out)
	);

	
	byte_enabled_dual_port_ram #(
		.RADDR_WIDTH(10),
		.WADDR_WIDTH(9),
		.BYTE_WIDTH(16),
		.BYTES(4)
	) tile_ram (
		.clk(gpu_clk),
		.waddr({buffers_swapped, tile_ram_addr}),
		.raddr({~buffers_swapped, writer_ram_addr}),
		.be(tile_wren),
		.wdata({4{tile_out}}), 
		.we(tile_wren[0] | tile_wren[1] | tile_wren[2] | tile_wren[3]),
		.q(ram_data_out)
	);
	
	
	tile_writer d0(
		.gpu_clk			(gpu_clk),
		.gpu_rst			(gpu_rst),
		.stride_in		(stride),
		.addr_in			(addr),
		.start			(start_write),
		.reading 		(reading_from_tile),
		.flushed			(flushed_to_bus),

		.ram_addr_out	(writer_ram_addr),
		.ram_data		(ram_data_out),
	
		//avalon master for writing
		.clk				(clk),
		.rst				(rst),
		.master_address		(master_address),
		.master_write			(master_write),
		.master_write_data	(master_write_data),
		.master_wait_request	(master_wait_request)
	);


	
endmodule

