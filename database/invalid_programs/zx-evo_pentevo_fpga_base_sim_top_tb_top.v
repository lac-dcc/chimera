// simulate fpga top-level with external dram, rom, z80
// (c) 2010-2016 NedoPC

`include "tune.v"



//`define ZLOG 1



`define HALF_CLK_PERIOD (17.8)

`define ZCLK_DELAY      (9.5)

// toshibo
//`define Z80_DELAY_DOWN  (17.0)
//`define Z80_DELAY_UP    (22.0)

// z0840008
`define Z80_DELAY_DOWN   34
`define Z80_DELAY_UP     30

module tb;

	reg fclk;

	wire clkz_out,clkz_in;

	reg iorq_n,mreq_n,rd_n,wr_n; // has some delays relative to z*_n (below)
	reg m1_n,rfsh_n;             //

	wire res;                    //
	tri1 ziorq_n,zmreq_n,zrd_n,zwr_n,zm1_n,zrfsh_n; // connected to Z80

	tri1 int_n,wait_n,nmi_n;
	wire zint_n,zwait_n,znmi_n;

	wire [15:0] #((`Z80_DELAY_DOWN+`Z80_DELAY_UP)/2) za;
	wire [ 7:0] #((`Z80_DELAY_DOWN+`Z80_DELAY_UP)/2) zd;

	tri1 [ 7:0] zd_dut_to_z80;


	reg [15:0] reset_pc = 16'h0000;
	reg [15:0] reset_sp = 16'hFFFF;



	wire csrom, romoe_n, romwe_n;
	wire rompg0_n, dos_n;
	wire rompg2,rompg3,rompg4;

	wire [15:0] rd;
	wire [9:0] ra;
	wire rwe_n,rucas_n,rlcas_n,rras0_n,rras1_n;


	tri1 [15:0] ide_d;


	wire hsync,vsync;
	wire [1:0] red,grn,blu;



	// sdcard
	wire sdcs_n, sddo, sddi, sdclk;

	// avr
	wire spick, spidi, spido, spics_n;




	assign zwait_n = (wait_n==1'b0) ? 1'b0 : 1'b1;
	assign znmi_n = (nmi_n==1'b0) ? 1'b0 : 1'b1;
	assign zint_n = (int_n==1'b0) ? 1'b0 : 1'b1;






	initial
	begin

		fclk = 1'b0;

		forever #`HALF_CLK_PERIOD fclk = ~fclk;
	end


	assign #`ZCLK_DELAY clkz_in = ~clkz_out;







	top DUT( .fclk(fclk),
	         .clkz_out(clkz_out),
	         .clkz_in(clkz_in),

               // z80
	         .iorq_n(iorq_n),
	         .mreq_n(mreq_n),
	         .rd_n(rd_n),
	         .wr_n(wr_n),
	         .m1_n(m1_n),
	         .rfsh_n(rfsh_n),
	         .int_n(int_n),
	         .nmi_n(nmi_n),
	         .wait_n(wait_n),
	         .res(res),
	         //
	         .d(zd),
	         .a(za),

	         // ROM
	         .csrom(csrom),
	         .romoe_n(romoe_n),
	         .romwe_n(romwe_n),
	         .rompg0_n(rompg0_n),
	         .dos_n(dos_n),
		 .rompg2(rompg2),
		 .rompg3(rompg3),
 		 .rompg4(rompg4),

	         // DRAM
	         .rd(rd),
	         .ra(ra),
	         .rwe_n(rwe_n),
	         .rucas_n(rucas_n),
	         .rlcas_n(rlcas_n),
	         .rras0_n(rras0_n),
	         .rras1_n(rras1_n),

	         // ZX-bus
	         .iorqge1(1'b0),
	         .iorqge2(1'b0),

	         // IDE
	         .ide_d(ide_d),
	         .ide_rdy(1'b1),

	         // VG93
	         .step(1'b0),
	         .vg_sl(1'b0),
	         .vg_sr(1'b0),
	         .vg_tr43(1'b0),
	         .rdat_b_n(1'b1),
	         .vg_wf_de(1'b0),
	         .vg_drq(1'b1),
	         .vg_irq(1'b1),
	         .vg_wd(1'b0),

	         // SDcard SPI
	         .sddi(sddi),
	         .sddo(sddo),
	         .sdcs_n(sdcs_n),
	         .sdclk(sdclk),

	         // ATmega SPI
	         .spics_n(spics_n),
	         .spick(spick),
	         .spido(spido),
	         .spidi(spidi),

		 .vhsync(hsync),
		 .vvsync(vsync),
		 .vred(red),
		 .vgrn(grn),
		 .vblu(blu)

	       );




//	assign zd_dut_to_z80 = tb.DUT.ena_ram ? tb.DUT.dout_ram : ( tb.DUT.ena_ports ? tb.DUT.dout_ports : ( tb.DUT.drive_ff ? 8'hFF : 8'bZZZZZZZZ ) );
	assign zd_dut_to_z80 = tb.DUT.d_ena ? tb.DUT.d_pre_out : 8'bZZZZ_ZZZZ;




	wire zrst_n = ~res;

	T80a z80( .RESET_n(zrst_n),
	          .CLK_n(clkz_in),
	          .WAIT_n(zwait_n),
	          .INT_n(zint_n),
	          .NMI_n(znmi_n),
	          .M1_n(zm1_n),
	          .RFSH_n(zrfsh_n),
	          .MREQ_n(zmreq_n),
	          .IORQ_n(ziorq_n),
	          .RD_n(zrd_n),
	          .WR_n(zwr_n),
	          .BUSRQ_n(1'b1),
	          .A(za),
	          .D_I(zd_dut_to_z80),
	          .D_O(zd),
		  .ResetPC(reset_pc),
		  .ResetSP(reset_sp)
	        );

	// now make delayed versions of signals
	//
	reg  mreq_wr_n;
	wire iorq_wr_n, full_wr_n;
	//
	// first, assure there is no X's at the start
	//
	initial
	begin
		m1_n      = 1'b1;
		rfsh_n    = 1'b1;
		mreq_n    = 1'b1;
		iorq_n    = 1'b1;
		rd_n      = 1'b1;
		wr_n      = 1'b1;
		mreq_wr_n = 1'b1;
	end
	//
	always @(zm1_n)
		if( zm1_n )
			m1_n <= #`Z80_DELAY_UP zm1_n;
		else
			m1_n <= #`Z80_DELAY_DOWN zm1_n;
	//
	always @(zrfsh_n)
		if( zrfsh_n )
			rfsh_n <= #`Z80_DELAY_UP zrfsh_n;
		else
			rfsh_n <= #`Z80_DELAY_DOWN zrfsh_n;
	//
	always @(zmreq_n)
		if( zmreq_n )
			mreq_n <= #`Z80_DELAY_UP zmreq_n;
		else
			mreq_n <= #`Z80_DELAY_DOWN zmreq_n;
	//
	always @(ziorq_n)
		if( ziorq_n )
			iorq_n <= #`Z80_DELAY_UP ziorq_n;
		else
			iorq_n <= #`Z80_DELAY_DOWN ziorq_n;
	//
	always @(zrd_n)
		if( zrd_n )
			rd_n <= #`Z80_DELAY_UP zrd_n;
		else
			rd_n <= #`Z80_DELAY_DOWN zrd_n;
	//
	//
	// special handling for broken T80 WR_n
	//
	always @(negedge clkz_in)
		mreq_wr_n <= zwr_n;
	//
	assign iorq_wr_n = ziorq_n | (~zrd_n) | (~zm1_n);
	//
	assign full_wr_n = mreq_wr_n & iorq_wr_n;
	//
	// this way glitches won't affect state of wr_n
	always @(full_wr_n)
		if( !full_wr_n )
			#`Z80_DELAY_DOWN wr_n <= full_wr_n;
		else
			#`Z80_DELAY_UP wr_n <= full_wr_n;





	// ROM model
	rom romko(
	           .addr( {rompg4,rompg3,rompg2,dos_n, (~rompg0_n), za[13:0]} ),
	           .data(zd_dut_to_z80),
	           .ce_n( romoe_n | (~csrom) )
	         );

	// DRAM model
	drammem dramko1(
	                 .ma(ra),
	                 .d(rd),
	                 .ras_n(rras0_n),
	                 .ucas_n(rucas_n),
	                 .lcas_n(rlcas_n),
	                 .we_n(rwe_n)
	               );
	//
	drammem dramko2(
	                 .ma(ra),
	                 .d(rd),
	                 .ras_n(rras1_n),
	                 .ucas_n(rucas_n),
	                 .lcas_n(rlcas_n),
	                 .we_n(rwe_n)
	               );
	defparam dramko1._verbose_ = 0;
	defparam dramko2._verbose_ = 0;

	defparam dramko1._init_ = 0;
	defparam dramko2._init_ = 0;



`ifndef GATE

	// trace rom page
	wire rma14,rma15;

	assign rma14 = DUT.page[0][0];
	assign rma15 = DUT.page[0][1];


	always @(rma14 or rma15)
	begin
//		$display("at time %t us",$time/1000000);

//		case( {rma15, rma14} )

//		2'b00: $display("BASIC 48");
//		2'b01: $display("TR-DOS");
//		2'b10: $display("BASIC 128");
//		2'b11: $display("GLUKROM");
//		default: $display("unknown");

//		endcase

//		$display("");
	end


	// trace ram page
	wire [5:0] rpag;

	assign rpag=DUT.page[3][5:0];

	always @(rpag)
	begin
//		$display("at time %t us",$time/1000000);

//		$display("RAM page is %d",rpag);

//		$display("");
	end



	// key presses/nmi/whatsoever
	initial
	begin
		#1;
		tb.DUT.zkbdmus.kbd = 40'd0;
		tb.DUT.zkbdmus.kbd[36] = 1'b1;
		@(negedge int_n);
		@(negedge int_n);
		tb.DUT.zkbdmus.kbd[36] = 1'b0;
	end

`endif








`ifdef ZLOG
	reg [ 7:0] old_opcode;
	reg [15:0] old_opcode_addr;

	wire [7:0] zdd = zd_dut_to_z80;

	reg was_m1;

	always @(zm1_n)
	if( zm1_n )
		was_m1 <= 1'b0;
	else
		was_m1 = 1'b1;

	always @(posedge (zmreq_n | zrd_n | zm1_n | (~zrfsh_n)) )
	if( was_m1 )
	begin
		if( (zdd!==old_opcode) || (za!==old_opcode_addr) )
		begin
			if( tb.DUT.z80mem.romnram )
//				$display("Z80OPROM: addr %x, opcode %x, time %t",za,zdd,$time);
				$display("Z80OPROM: addr %x, opcode %x",za,zdd);
			else
//				$display("Z80OPRAM: addr %x, opcode %x, time %t",za,zdd,$time);
				$display("Z80OPRAM: addr %x, opcode %x",za,zdd);
		end

		old_opcode      = zdd;
		old_opcode_addr = za;
	end

	always @(posedge (zmreq_n | zrd_n | (~zm1_n) | (~zrfsh_n)) )
	if( !was_m1 )
	begin
		if( tb.DUT.z80mem.romnram )
//			$display("Z80RDROM: addr %x, rddata %x, time %t",za,zdd,$time);
			$display("Z80RDROM: addr %x, rddata %x",za,zdd);
		else
//			$display("Z80RDRAM: addr %x, rddata %x, time %t",za,zdd,$time);
			$display("Z80RDRAM: addr %x, rddata %x",za,zdd);
	end

	always @(posedge (zmreq_n | zwr_n | (~zm1_n) | (~zrfsh_n)) )
	begin
		if( tb.DUT.z80mem.romnram )
//			$display("Z80WRROM: addr %x, wrdata %x, time %t",za,zd,$time);
			$display("Z80WRROM: addr %x, wrdata %x",za,zd);
		else
//			$display("Z80WRRAM: addr %x, wrdata %x, time %t",za,zd,$time);
			$display("Z80WRRAM: addr %x, wrdata %x",za,zd);
	end
`endif




	// turbo
`ifdef C7MHZ
	initial
		force tb.DUT.zclock.turbo = 2'b01;
`else
	`ifdef C35MHZ

		initial
			force tb.DUT.zclock.turbo = 2'b00;

	`endif
`endif


	// raster type
`ifdef CCONTEND
	initial
		force tb.DUT.modes_raster = 2'b10;
`endif




`ifdef NMITEST2
 `define M48K

	initial
	begin
		int i,fd;
		logic [7:0] ldbyte;

		reset_pc=16'h8000;
		reset_sp=16'h8000;

		fd = $fopen("dimkanmi.bin","rb");
		if( !fd )
		begin
			$display("Can't open 'dimkanmi.bin'!");
			$stop;
		end

		i='h8000;

		begin : load_loop
			while(1)
			begin
				if( 1!=$fread(ldbyte,fd) ) disable load_loop;
				put_byte_48k(i,ldbyte);
				i=i+1;
			end
		end
		$fclose(fd);


		wait(res===1'b0);
		#(0.2);
		tb.DUT.zports.atm_turbo = 1'b1;
		tb.DUT.zports.peff7_int[4] = 1'b0;
		
		
		#(100000); // 100 us

		//force nmi_n = 1'b0;
		@(posedge fclk);
		force tb.DUT.imm_nmi = 1'b1;
		@(posedge fclk);
		release tb.DUT.imm_nmi;
	end
`endif



`ifdef NMITEST3
 `define M48K

	initial
	begin
		int i,fd;
		logic [7:0] ldbyte;

		reset_pc=16'h0068;
		reset_sp=16'h8000;


		#(0.1); // let M48K rom load execute

		fd = $fopen("dimkarom.bin","rb");
		if( !fd )
		begin
			$display("Can't open 'dimkarom.bin'!");
			$stop;
		end

		i='h0066;
		begin : load_loop
			while(1)
			begin
				if( 1!=$fread(ldbyte,fd) ) disable load_loop;
				tb.romko.zxevo_rom.mem[i]=ldbyte;
				i=i+1;
			end
		end
		$fclose(fd);


		wait(res===1'b0);
		#(0.2);
		tb.DUT.zports.atm_turbo = 1'b1;
		tb.DUT.zports.peff7_int[4] = 1'b0;
		
		
		#(1000000); // 1 ms

		//force nmi_n = 1'b0;
		@(posedge fclk);
		force tb.DUT.imm_nmi = 1'b1;
		@(posedge fclk);
		release tb.DUT.imm_nmi;
	end
`endif


	// port #FE monitor
	wire fe_write;
	assign fe_write = (za[7:0]==8'hFE) && !wr_n && !iorq_n;
	always @(negedge fe_write)
		$display("port #FE monitor: border is %d at %t",zd[2:0],$time());
	always @(negedge nmi_n)
		$display("nmi monitor: negative edge at %t",$time());	




	// start in 48k mode
`ifdef M48K
	initial
	begin : force_48k_mode

		int i;
		int fd;
	
		fd = $fopen("48.rom","rb");
		if( 16384!=$fread(tb.romko.zxevo_rom.mem,fd) )
		begin
			$display("Couldn't load 48k ROM!\n");
			$stop;
		end
		$fclose(fd);
		
		
		wait(res===1'b0);
		#(0.1);

		tb.DUT.zports.atm_turbo = 1'b0;
		tb.DUT.zports.atm_pen = 1'b0;
		tb.DUT.zports.atm_cpm_n = 1'b1;
		tb.DUT.zports.atm_pen2 = 1'b0;

		tb.DUT.zdos.dos = 1'b0;


		tb.DUT.instantiate_atm_pagers[0].atm_pager.pages[0] = 'd0;
		tb.DUT.instantiate_atm_pagers[1].atm_pager.pages[0] = 'd5;
		tb.DUT.instantiate_atm_pagers[2].atm_pager.pages[0] = 'd2;
		tb.DUT.instantiate_atm_pagers[3].atm_pager.pages[0] = 'd0;
		tb.DUT.instantiate_atm_pagers[0].atm_pager.pages[1] = 'd0;
		tb.DUT.instantiate_atm_pagers[1].atm_pager.pages[1] = 'd5;
		tb.DUT.instantiate_atm_pagers[2].atm_pager.pages[1] = 'd2;
		tb.DUT.instantiate_atm_pagers[3].atm_pager.pages[1] = 'd0;

		tb.DUT.instantiate_atm_pagers[0].atm_pager.ramnrom[0] = 'd0;
		tb.DUT.instantiate_atm_pagers[1].atm_pager.ramnrom[0] = 'd1;
		tb.DUT.instantiate_atm_pagers[2].atm_pager.ramnrom[0] = 'd1;
		tb.DUT.instantiate_atm_pagers[3].atm_pager.ramnrom[0] = 'd1;
		tb.DUT.instantiate_atm_pagers[0].atm_pager.ramnrom[1] = 'd0;
		tb.DUT.instantiate_atm_pagers[1].atm_pager.ramnrom[1] = 'd1;
		tb.DUT.instantiate_atm_pagers[2].atm_pager.ramnrom[1] = 'd1;
		tb.DUT.instantiate_atm_pagers[3].atm_pager.ramnrom[1] = 'd1;

		tb.DUT.zports.atm_scr_mode = 3'b011;
		
		tb.DUT.zports.peff7_int = 8'h14;
		tb.DUT.zports.p7ffd_int = 8'h30;



		for(i=0;i<512;i=i+1)
		begin : set_palette //                                            R                               G                              B
			tb.DUT.video_top.video_palframe.palette[i] = { (i[1]?{1'b1,i[3]}:2'b00), 1'b0, (i[2]?{1'b1,i[3]}:2'b00), 1'b0, (i[0]?{1'b1,i[3]}:2'b00) };
		end

	end
`endif


	// load and start some code after we've reached "1982 Sinclair research ltd"
`ifdef START_LOAD
	initial
	begin
		int i,fd;
		logic [7:0] ldbyte;

		wait( za==16'h15e0 && zmreq_n==1'b0 && zrd_n == 1'b0 );
		
		$display("loading and starting...");

		fd = $fopen(`START_NAME,"rb");
		for(i=`START_ADDR;i<`START_ADDR+`START_LEN;i=i+1)
		begin
			if( 1!=$fread(ldbyte,fd) )
			begin
				$display("can't read byte from input file!");
				$stop;
			end

			put_byte_48k(i,ldbyte);
		end
		$fclose(fd);

		$display("load ok!");

		reset_pc = 16'h9718;
		reset_sp = 16'h6000;
		@(posedge clkz_in);
		force tb.zrst_n = 1'b0;
		repeat(3) @(posedge clkz_in);
		release tb.zrst_n;
		@(posedge clkz_in);
		reset_pc = 16'h0000;
		reset_sp = 16'hFFFF;
	end
`endif













`ifndef NO_PIXER
	// picture out
	pixer pixer
	(
		.clk(fclk),

		.vsync(vsync),
		.hsync(hsync),
		.red(red),
		.grn(grn),
		.blu(blu)
	);
`endif


/*
	// time ticks
	always
	begin : timemark

		integer ms;

		ms = ($time/1000000);

//		$display("timemark %d ms",ms);

		#10000000.0; // 1 ms
	end
*/


	// init dram
`ifndef NMITEST2
	initial
	begin : init_dram
		integer i;
		
		integer page;
		integer offset;
		
		reg [7:0] trd [0:655359];

		integer fd;
		integer size;




		for(i=0;i<4*1024*1024;i=i+1)
		begin
			put_byte(i,(i%257));
		end

		// load TRD
		fd = $fopen("boot.trd","rb");
		size=$fread(trd,fd);

		if( size>655360 || size<=0 )
		begin
			$display("Couldn't load or wrong boot.trd!\n");
			$stop;
		end
		$fclose(fd);


		// copy TRD to RAM
		page = 32'h0F4;
		offset = 0;

		for(i=0;i<size;i=i+1)
		begin
			put_byte( .addr(page*16384+offset), .data(trd[i]) );

			offset = offset + 1;
			if( offset>=16384 )
			begin
				offset = 0;
				page = page - 1;
			end
		end
		

		$display("boot.trd loaded!\n");
	end
`endif





	// cmos simulation
	wire [7:0] cmos_addr;
	wire [7:0] cmos_read;
	wire [7:0] cmos_write;
	wire       cmos_rnw;
	wire       cmos_req;

	cmosemu cmosemu
	(
		.zclk(clkz_in),

		.cmos_req  (cmos_req  ),
		.cmos_addr (cmos_addr ),
		.cmos_rnw  (cmos_rnw  ),
		.cmos_read (cmos_read ),
		.cmos_write(cmos_write)
	);

	assign cmos_req   = tb.DUT.wait_start_gluclock;
	assign cmos_rnw   = tb.DUT.wait_rnw;
	assign cmos_addr  = tb.DUT.gluclock_addr;
	assign cmos_write = tb.DUT.wait_write;

	always @*
		force tb.DUT.wait_read = cmos_read;




`ifdef SPITEST
	// spitest printing module
	// does not hurt at any time (yet), so attached forever

	spitest_print spitest_print(
		.sdclk (sdclk ),
		.sddi  (sddi  ),
		.sddo  (sddo  ),
		.sdcs_n(sdcs_n)
	);

	// spitest AVR imitator

	spitest_avr spitest_avr(
		.spick  (spick  ),
		.spics_n(spics_n),
		.spido  (spido  ),
		.spidi  (spidi  )
	);
`else
	assign sddi = 1'b1;

	assign spics_n = 1'b1;
	assign spick   = 1'b0;
	assign spido   = 1'b1;
`endif





	// set up breakpoint
/*
	wire bpt = za===16'h3FEC && zmreq_n===1'b0 && zrd_n===1'b0 && zm1_n===1'b0;
	initial
	begin
		#(1_800_000_000);
		@(posedge fclk);
		forever
		begin
			@(posedge bpt);
			$display("Stop at breakpoint");
			$stop;
		end
	end
*/

	// log INI command
	wire [15:0] #(0.1) dza;
	wire [ 7:0] #(0.1) dzw;
	wire [ 7:0] #(0.1) dzr;

	typedef enum {FETCH,MRD,MWR,IORD,IOWR,IACK} cycle_t;

	cycle_t curr_cycle;
	cycle_t cycles[0:3];
	logic [15:0] addrs[0:3];
	logic [ 7:0] wdata[0:3];
	logic [ 7:0] rdata[0:3];

	wire is_fetch, is_mrd, is_mwr, is_iord, is_iowr, is_iack;

	wire is_any;




	assign dza = za;
	assign dzw = zd;
	assign dzr = zd_dut_to_z80;

	assign is_fetch = zm1_n===1'b0 && zmreq_n===1'b0 &&                   zrd_n===1'b0;
	assign is_mrd   = zm1_n===1'b1 && zmreq_n===1'b0 &&                   zrd_n===1'b0;
	assign is_mwr   =                 zmreq_n===1'b0 &&                                   zwr_n===1'b0;
	assign is_iord  =                                   ziorq_n===1'b0 && zrd_n===1'b0;
	assign is_iowr  =                                   ziorq_n===1'b0 &&                 zwr_n===1'b0;
	assign is_iack  = zm1_n===1'b0 &&                   ziorq_n===1'b0;

	assign is_any = is_fetch || is_mrd || is_mwr || is_iord || is_iowr || is_iack;

	
	always @(negedge is_any)
	begin : remember
		int i;

		for(i=1;i<4;i++)
		begin
			addrs [i]  <= addrs [i-1];
			cycles[i]  <= cycles[i-1];
			
			wdata [i]  <= wdata [i-1];
			rdata [i]  <= rdata [i-1];
		end

		addrs[0] <= dza;
		cycles[0] <= curr_cycle;
		
		wdata[0] <= dzw;
		rdata[0] <= dzr;
	end

	always @(posedge is_any)
	if(      is_fetch ) curr_cycle <= FETCH;
	else if( is_mrd )   curr_cycle <= MRD;
	else if( is_mwr )   curr_cycle <= MWR;
	else if( is_iord )  curr_cycle <= IORD;
	else if( is_iowr )  curr_cycle <= IOWR;
	else if( is_iack )  curr_cycle <= IACK;
	else
	begin
		$display("Spurious cycle detect!");
		$stop;
	end


	// actual break
	always @(negedge is_any)
	begin
		if( cycles[3]==FETCH && addrs[3][15:0 ]==16'h3FEC && rdata[3]==8'hED &&
		    cycles[2]==FETCH &&                              rdata[2]==8'hA2 &&
		    cycles[1]==IORD  &&
		    cycles[0]==MWR   && addrs[0][15:14]== 2'd0
		)
		begin
			$display("trd INI caught! port=%04x, wraddr=%04x, time=%t",addrs[1],addrs[0],$time());
		end
	end










	// timestamps
	always
	begin
		$display("Running for %t ms",$time()/1000000000.0);
		#1000000.0;
	end





	// generate nmi after 2s
	initial
	begin
		#2000000000.0;

		force DUT.set_nmi[0] = 1'b1;
		#1000000.0;
		release DUT.set_nmi[0];
	end










	task put_byte;

		input [21:0] addr;
		input [ 7:0] data;



		reg [19:0] arraddr;

		begin

			arraddr = { addr[21:12], addr[11:2] };

			case( addr[1:0] ) // chipsel, bytesel

			2'b00: tb.dramko1.array[arraddr][15:8] = data;
			2'b01: tb.dramko1.array[arraddr][ 7:0] = data;
			2'b10: tb.dramko2.array[arraddr][15:8] = data;
			2'b11: tb.dramko2.array[arraddr][ 7:0] = data;

			endcase
		end

	endtask

	task put_byte_48k
	(
		input [15:0] addr,
		input [ 7:0] data
	);

		case( addr[15:14] )
			2'b01: put_byte(addr-16'h4000 + 22'h14000,data);
			2'b10: put_byte(addr-16'h8000 + 22'h08000,data);
			2'b11: put_byte(addr-16'hc000 + 22'h00000,data);
		endcase
	endtask




endmodule


