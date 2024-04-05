// simulate together CPU, DRAM and VIDEO FETCH

`include "tune.v"

module tb_cdv;


	reg rst_n;
	reg clk;

	wire zclk,zclk_out;
	wire mreq_n,iorq_n,rd_n,wrbad_n,m1_n,rfsh_n;
	reg wr_n;
	tri [7:0] zdata;
	wire [15:0] zaddr;

	wire [7:0] ramout;
	wire ram_ena;

	wire [4:0] rompg;
	wire romoe_n,romwe_n,csrom;
	wire [7:0] romdata;


	wire cbeg,pre_cend,cend;

	wire cpu_req,cpu_rnw,cpu_wrbsel,cpu_strobe;
	wire [20:0] cpu_addr;
	wire [7:0] cpu_wrdata;
	wire [15:0] cpu_rddata;
	wire cpu_stall;
	wire [4:0] cpu_waitcyc;

	wire video_strobe,video_next;
	wire [15:0] video_data;
	wire [20:0] video_addr;

	wire go;
	wire [1:0] bw;


	wire [20:0] daddr;
	wire dreq,drnw,drrdy;
	wire [1:0] dbsel;
	wire [15:0] drddata;
	wire [15:0] dwrdata;


	wire [9:0] ra;
	tri [15:0] rd;
	wire rwe_n,rucas_n,rlcas_n,rras0_n,rras1_n;




	wire hsync,hblank,hpix,hsync_start,line_start;

	wire vblank,vsync,vpix,int_start;

	wire [5:0] pixel;


	initial
	begin
		clk = 1'b0;
		forever #17 clk = ~clk;
	end


	integer rst_count;
	initial
	begin
            rst_n <= 1'b0;

		for(rst_count=0;rst_count<=32;rst_count=rst_count+1) @(posedge clk);

		rst_n <= 1'b1;
	end




	// for simulation
	integer i;
	initial
	begin
		for(i=0;i<32768;i=i+1)
		begin
			chip0.array[i] = 16'd0;
			chip1.array[i] = 16'd0;
		end



		for(i=16'h000;i<16'h1b00;i=i+2)
		begin
//			zxmemwrite(5,i,i+16'h4000); // this particular thing is to check zx-mode addressing

			zxmemwrite(4,i,i);
			zxmemwrite(5,i,i+16'h4000);
			zxmemwrite(4,i+16'h2000,i+16'h2000);
			zxmemwrite(5,i+16'h2000,i+16'h6000);

		end



	end


	task zxmemwrite; // writes a word given zx page and page offset (must be even)

		input [2:0] page;
		input [13:0] offset;
		input [15:0] data;

		reg [14:0] wordaddr;
		begin
			wordaddr = { page[2:0], offset[13:2] };

			if( !offset[1] )
					chip0.array[wordaddr] = data;
			else
					chip1.array[wordaddr] = data;
		end

	endtask



	// route data to the Z80 bus

	assign zdata = ram_ena ? ramout : 8'hZZ;
	assign zdata = romdata;





	T80a z80( .RESET_n(/*rst_n*/1'b0),
	          .CLK_n(zclk),
	          .WAIT_n(1'b1),
	          .INT_n(1'b1),
	          .NMI_n(1'b1),
	          .M1_n(m1_n),
	          .RFSH_n(rfsh_n),
	          .MREQ_n(mreq_n),
	          .IORQ_n(iorq_n),
	          .RD_n(rd_n),
	          .WR_n(wrbad_n),
	          .BUSRQ_n(1'b1),
	          .A(zaddr),
	          .D(zdata) );

	//correct wr_n (valid only for MEMORY operations!)
	always @(negedge zclk)
		wr_n <= wrbad_n;



	zclock z80clock( .rst_n(rst_n),
	                 .fclk(clk),
	                 .zclk_out(zclk_out),
	                 .zclk(zclk),
	                 .turbo(2'b01),
	                 .pre_cend(pre_cend) );

	assign zclk = ~zclk_out; // inversion in the schematics!



	zmem z80memory( .rst_n(rst_n),
	                .fclk(clk),
	                .zpos(1'b1),
	                .zneg(1'b0),

	                .cend(cend),
	                .pre_cend(pre_cend),

	                .za(zaddr),
	                .zd_in(zdata),
	                .zd_out(ramout),
	                .zd_ena(ram_ena),

	                .m1_n(m1_n),
	                .rfsh_n(rfsh_n),
	                .mreq_n(mreq_n),
	                .iorq_n(iorq_n),
	                .rd_n(rd_n),
	                .wr_n(wr_n),

	                .win0_romnram(1'b1),
	                .win1_romnram(1'b0),
	                .win2_romnram(1'b0),
	                .win3_romnram(1'b0),

	                .win0_page(8'd0),
	                .win1_page(8'd1),
	                .win2_page(8'd2),
	                .win3_page(8'd3),

	                .dos(1'b0),

	                .rompg(rompg),
	                .romoe_n(romoe_n),
	                .romwe_n(romwe_n),
	                .csrom(csrom),


	                .cpu_req(cpu_req),
	                .cpu_rnw(cpu_rnw),
	                .cpu_wrbsel(cpu_wrbsel),
	                .cpu_strobe(cpu_strobe),

	                .cpu_addr(cpu_addr),
	                .cpu_wrdata(cpu_wrdata),
	                .cpu_rddata(cpu_rddata) );


	arbiter dramarb( .clk(clk),
	                 .rst_n(rst_n),

	                 .dram_addr(daddr),
	                 .dram_req(dreq),
	                 .dram_rnw(drnw),
	                 .dram_cbeg(cbeg),
	                 .dram_rrdy(drrdy),
	                 .dram_bsel(dbsel),
	                 .dram_rddata(drddata),
	                 .dram_wrdata(dwrdata),

	                 .cend(cend),
	                 .pre_cend(pre_cend),

	                 .go(go),
	                 .bw(bw),

	                 .video_addr(video_addr),
	                 .video_data(video_data),
	                 .video_strobe(video_strobe),
	                 .video_next(video_next),

	                 .cpu_waitcyc(cpu_waitcyc),
	                 .cpu_stall(cpu_stall),
	                 .cpu_req(cpu_req),
	                 .cpu_rnw(cpu_rnw),
	                 .cpu_addr(cpu_addr),
	                 .cpu_wrbsel(cpu_wrbsel),
	                 .cpu_wrdata(cpu_wrdata),
	                 .cpu_rddata(cpu_rddata),
	                 .cpu_strobe(cpu_strobe) );


	dram dramko( .clk(clk),
	             .rst_n(rst_n),

	             .addr(daddr),
	             .req(dreq),
	             .rnw(drnw),
	             .cbeg(cbeg),
	             .rrdy(drrdy),
	             .rddata(drddata),
	             .wrdata(dwrdata),
	             .bsel(dbsel),

	             .ra(ra),
	             .rd(rd),
	             .rwe_n(rwe_n),
	             .rucas_n(rucas_n),
	             .rlcas_n(rlcas_n),
	             .rras0_n(rras0_n),
	             .rras1_n(rras1_n) );



	drammem chip0( .ma(ra),
	               .d(rd),
	               .ras_n(rras0_n),
	               .ucas_n(rucas_n),
	               .lcas_n(rlcas_n),
	               .we_n(rwe_n) );

	drammem chip1( .ma(ra),
	               .d(rd),
	               .ras_n(rras1_n),
	               .ucas_n(rucas_n),
	               .lcas_n(rlcas_n),
	               .we_n(rwe_n) );

	defparam chip0._add_to_addr_=0;
	defparam chip1._add_to_addr_=1;

	defparam chip0._filter_out_=0;
	defparam chip1._filter_out_=0;



	rom romko( .addr( {rompg[1:0],zaddr[13:0]} ),
	           .data(romdata),
	           .ce_n( (~csrom)|romoe_n ) );




	synch horiz_sync( .clk(clk), .init(1'b0), .cend(cend), .pre_cend(pre_cend),
	                  .hsync(hsync), .hblank(hblank), .hpix(hpix), .hsync_start(hsync_start),
	                  .line_start(line_start) );


	syncv vert_sync( .clk(clk), .hsync_start(hsync_start), .line_start(line_start),
	                 .vblank(vblank), .vsync(vsync), .int_start(int_start),
	                 .vpix(vpix) );



	fetch fecher( .clk(clk), .cend(cend), .line_start(line_start), .vpix(vpix), .int_start(int_start),
	              .vmode(1'b1), .screen(1'b0), .video_addr(video_addr), .video_data(video_data), .video_strobe(video_strobe),
	              .video_next(video_next), .go(go), .bw(bw), .pixel(pixel) );




`ifdef FETCH_VERBOSE

	always
	begin
		@(posedge video_next);
		$write("video addr=$%h, ",video_addr); // address just before video_addr changes!
		@(posedge video_strobe); @(negedge clk);
		$write("data=$%h\n",video_data);
	end

	always
	begin
		@(negedge hsync)
			if( vpix )
				$display("new line");
	end



`endif




endmodule

