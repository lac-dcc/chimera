module altair(
	input clk,
	input reset,
	input rx,
	output tx
);
	reg ce = 0;
	reg intr = 0;	
	reg [7:0] idata;
	wire [15:0] addr;
	wire rd;
	wire wr_n;
	wire inta_n;
	wire [7:0] odata;
	wire inte_o;
	wire sync;

	// Memory is sync so need one more clock to write/read
	// This slows down CPU
	always @(posedge clk) begin
		ce <= !ce;
	end

	reg[7:0] sysctl;
	
	wire [7:0] rom_out;
	wire [7:0] ram_out;
	wire [7:0] rammain_out;
	wire [7:0] boot_out;
	wire [7:0] sio_out;
	

	wire boot;
	
	reg wr_ram;
	reg wr_rammain;
	reg wr_sio;
	
	reg rd_boot;
	reg rd_ram;
	reg rd_rammain;
	reg rd_rom;
	reg rd_sio;
	
	always @(*)
	begin
		rd_boot = 0;
		rd_ram = 0;
		rd_rammain = 0;
		rd_rom = 0;
		rd_sio = 0;
		idata = 8'hff;		
		casex ({boot,sysctl[6],addr[15:8]})
			// Turn-key BOOT
			{2'b10,8'bxxxxxxxx}: begin idata = boot_out; rd_boot = rd; end       // any address
			// MEM MAP
			{2'b00,8'b000xxxxx}: begin idata = rammain_out; rd_rammain = rd; end // 0x0000-0x1fff
			{2'b00,8'b11111011}: begin idata = ram_out; rd_ram = rd; end         // 0xfb00-0xfbff
			{2'b00,8'b11111101}: begin idata = rom_out; rd_rom = rd; end         // 0xfd00-0xfdff
			// I/O MAP - addr[15:8] == addr[7:0] for this section
			{2'b01,8'b000x000x}: begin idata = sio_out; rd_sio = rd; end         // 0x00-0x01 0x10-0x11 
		endcase
	end

	always @(*)
	begin
		wr_ram = 0;
		wr_sio = 0;
		wr_rammain = 0;

		casex ({sysctl[4],addr[15:8]})
			// MEM MAP
			{1'b0,8'b000xxxxx}: wr_rammain = ~wr_n; // 0x0000-0x1fff
			{1'b0,8'b11111011}: wr_ram     = ~wr_n; // 0xfb00-0xfbff
										  		    // 0xfd00-0xfdff read-only
			// I/O MAP - addr[15:8] == addr[7:0] for this section
			{1'b1,8'b000x000x}: wr_sio     = ~wr_n; // 0x00-0x01 0x10-0x11 
		endcase
	end
	
	always @(posedge clk)
	begin
		if (sync) sysctl <= odata;
	end
	
	i8080 cpu(.clk(clk),.ce(ce),.reset(reset),.intr(intr),.idata(idata),.addr(addr),.sync(sync),.rd(rd),.wr_n(wr_n),.inta_n(inta_n),.odata(odata),.inte_o(inte_o));
	
	jmp_boot boot_ff(.clk(clk),.reset(reset),.rd(rd_boot),.data_out(boot_out),.valid(boot));
	
	rom_memory #(.ADDR_WIDTH(8),.FILENAME("turnmon.bin.mem")) rom(.clk(clk),.addr(addr[7:0]),.rd(rd_rom),.data_out(rom_out));
	
	ram_memory #(.ADDR_WIDTH(8)) stack(.clk(clk),.addr(addr[7:0]),.data_in(odata),.rd(rd_ram),.we(wr_ram),.data_out(ram_out));
	
	ram_memory #(.ADDR_WIDTH(13),.FILENAME("basic4k32.bin.mem")) mainmem(.clk(clk),.addr(addr[12:0]),.data_in(odata),.rd(rd_rammain),.we(wr_rammain),.data_out(rammain_out));
	
	mc6850 sio(.clk(clk),.reset(reset),.addr(addr[0]),.data_in(odata),.rd(rd_sio),.we(wr_sio),.data_out(sio_out),.ce(ce),.rx(rx),.tx(tx));

endmodule
