`timescale 1ns / 1ps


module tb_top;
	parameter	SIMULATION = 1'b1;

	parameter	RATE       = 20;
	parameter	UART_RATE  = (1000000000 / 115200);

	
	initial begin
		$dumpfile("tb_top.vcd");
		$dumpvars(0, tb_top);
	end
	
	// reset
	reg		reset;
	initial begin
		#0			reset = 1'b1;
		#(RATE*10)	reset = 1'b0;
	end
	
	// clock
	reg		clk;
	initial begin
		clk    = 1'b1;
	end
	always #(RATE/2) begin
		clk = ~clk;
	end
		
	reg					uart_rx;

	parameter	DDR_WIRE_DELAY = 1.0;

	wire			#DDR_WIRE_DELAY		ddr_sdram_ck_p;
	wire			#DDR_WIRE_DELAY		ddr_sdram_ck_n;
	wire			#DDR_WIRE_DELAY		ddr_sdram_cke;
	wire			#DDR_WIRE_DELAY		ddr_sdram_cs;
	wire			#DDR_WIRE_DELAY		ddr_sdram_ras;
	wire			#DDR_WIRE_DELAY		ddr_sdram_cas;
	wire			#DDR_WIRE_DELAY		ddr_sdram_we;
	wire	[1:0]	#DDR_WIRE_DELAY		ddr_sdram_ba;
	wire	[12:0]	#DDR_WIRE_DELAY		ddr_sdram_a;
	wire	[15:0]	#DDR_WIRE_DELAY		ddr_sdram_dq;
	wire			#DDR_WIRE_DELAY		ddr_sdram_udm;
	wire			#DDR_WIRE_DELAY		ddr_sdram_ldm;
	wire			#DDR_WIRE_DELAY		ddr_sdram_udqs;
	wire			#DDR_WIRE_DELAY		ddr_sdram_ldqs;
	wire			#DDR_WIRE_DELAY		ddr_sdram_ck_fb;
	
	top
			#(
				.SIMULATION	(SIMULATION)
			)
		i_top
			(
				.in_clk				(clk),
				.in_reset			(reset),
				
				.uart0_tx			(),
				.uart0_rx			(uart_rx),
				.uart1_tx			(),
				.uart1_rx			(1'b1),

				.gpio_a				(),
				.gpio_b				(),
				
				.ddr_sdram_ck_p		(ddr_sdram_ck_p),
				.ddr_sdram_ck_n		(ddr_sdram_ck_n),
				.ddr_sdram_cke		(ddr_sdram_cke),
				.ddr_sdram_cs		(ddr_sdram_cs),
				.ddr_sdram_ras		(ddr_sdram_ras),
				.ddr_sdram_cas		(ddr_sdram_cas),
				.ddr_sdram_we		(ddr_sdram_we),
				.ddr_sdram_ba		(ddr_sdram_ba),
				.ddr_sdram_a		(ddr_sdram_a),
				.ddr_sdram_udm		(ddr_sdram_udm),
				.ddr_sdram_ldm		(ddr_sdram_ldm),
				.ddr_sdram_udqs		(ddr_sdram_udqs),
				.ddr_sdram_ldqs		(ddr_sdram_ldqs),
				.ddr_sdram_dq		(ddr_sdram_dq),
				.ddr_sdram_ck_fb	(ddr_sdram_ck_fb),
				
				.led				(),
				.sw					(4'b0010)
			);
	
	// DDR
	ddr
			#(
				.DEBUG			(0)
			)
		i_ddr
			(
				.Clk			(ddr_sdram_ck_p),
				.Clk_n			(ddr_sdram_ck_n),
				.Cke			(ddr_sdram_cke),
				.Cs_n			(ddr_sdram_cs),
				.Ras_n			(ddr_sdram_ras),
				.Cas_n			(ddr_sdram_cas),
				.We_n			(ddr_sdram_we),
				.Ba				(ddr_sdram_ba),
				.Addr			(ddr_sdram_a),
				.Dm				({ddr_sdram_udm, ddr_sdram_ldm}),
				.Dq				(ddr_sdram_dq),
				.Dqs			({ddr_sdram_udqs, ddr_sdram_ldqs})
			);

	

	// Interrupt monitor
	always @ ( posedge i_top.i_cpu_top.clk ) begin
	//	if ( i_top.i_cpu_top.interrupt_req ) begin
	//		$display("%t  interrupt_req",  $time);
	//	end
		if ( i_top.i_cpu_top.interrupt_ack ) begin
			$display("%t  interrupt_ack",  $time);
		end
	end


	
	initial begin
		$display("--- START ---");
		
		forever
			#(RATE*40000);
		
		
	#(RATE*40000);
			$display("break");
			dbg_break();
			dbg_reset();
			dbg_run();

	#(RATE*40000);
			$display("break");
			dbg_break();
			dbg_reset();
			dbg_run();
	#(RATE*40000);
			$display("break");
			dbg_break();
			dbg_reset();
			dbg_run();
	#(RATE*40000);
		$finish;


	#(RATE*1);
		sdram_load("hosv4a_sample_ram.hex");
		sdram_dump();

	#(RATE*100);
		$display("--- break ---");
		dbg_break();
		dbg_reset();

		$display("--- set bp ---");
		dbg_read_mem(32'h00000198, 4'b1111);
		dbg_write_mem(32'h00000198, 4'b1111, 32'h7000003f);
		$display("--- run ---");
		dbg_run();
	#(RATE*100);	
		
		$display("--- wait break ----");
		dbg_wait_break();
		
		$display("--- remove bp ---");
		dbg_write_mem(32'h00000198, 4'b1111, 32'h0c000213);
		
		$display("--- set_step ---");
		dbg_write_reg(4'h2, 4'b1111, 32'h0000015c);		// dbgaddr <= COP_DEBUG
		dbg_write_reg(4'h4, 4'b1111, 32'h01000000);		// dbg_reg <= 0
		
		$display("--- run ---");
		dbg_run();
		dbg_wait_break();

//		$display("--- set bp ---");
//		dbg_write_mem(32'h00000198, 4'b1111, 32'h7000003f);

		$display("--- run ---");
		dbg_run();
		dbg_wait_break();

		$display("--- run ---");
		dbg_run();
		dbg_wait_break();

		$display("--- run ---");
		dbg_run();
		dbg_wait_break();

		$display("--- run ---");
		dbg_run();
		dbg_wait_break();

		$display("--- run ---");
		dbg_run();
		dbg_wait_break();
		
		dbg_write_reg(4'h2, 4'b1111, 32'h0000015c);		// dbgaddr <= COP_DEBUG
		dbg_write_reg(4'h4, 4'b1111, 32'h00000000);		// dbg_reg <= 0
		dbg_run();
		
	#(RATE*2000);
//		$finish;
	end
	
	
	// write dbg uart
	task dbg_write_uart_rx_fifo;
	input	[7:0]	data;
	begin
		@(negedge i_top.i_uart_debugger.i_uart_core.uart_clk);
			force i_top.i_uart_debugger.i_uart_core.rx_fifo_wr_valid = 1'b1;
			force i_top.i_uart_debugger.i_uart_core.rx_fifo_wr_data  = data;
		@(negedge i_top.i_uart_debugger.i_uart_core.uart_clk);
			release i_top.i_uart_debugger.i_uart_core.rx_fifo_wr_valid;
			release i_top.i_uart_debugger.i_uart_core.rx_fifo_wr_data;
	end
	endtask
	
	// wait break
	task dbg_wait_break;
	begin
		if ( !i_top.i_cpu_top.i_cpu_core.dbg_enable ) begin
			@(posedge i_top.i_cpu_top.i_cpu_core.dbg_enable);
		end
	end
	endtask
	
	// write reg
	task dbg_write_reg;
	input	[3:0]		addr;
	input	[3:0]		sel;
	input	[31:0]		data;
	begin
		dbg_write_uart_rx_fifo(8'h02);			// write
		dbg_write_uart_rx_fifo({sel, addr});	// sel + addr
		dbg_write_uart_rx_fifo(data[31:24]);	// dat0
		dbg_write_uart_rx_fifo(data[23:16]);	// dat1
		dbg_write_uart_rx_fifo(data[15:8]);		// dat2
		dbg_write_uart_rx_fifo(data[7:0]);		// dat3
	end 
	endtask

	// read reg
	task dbg_read_reg;
	input	[3:0]		addr;
	input	[3:0]		sel;
	begin
		dbg_write_uart_rx_fifo(8'h03);					// read
		dbg_write_uart_rx_fifo({sel, addr});			// dbgctl
	end 
	endtask
	
	// break
	task dbg_break;
	begin
		dbg_write_reg(4'h0, 4'b1111, 32'h00000002);	
	end
	endtask
	
	// run
	task dbg_run;
	begin
		dbg_write_reg(4'h0, 4'b1111, 32'h00000000);
		#(RATE);
	end
	endtask
	
	// reset
	task dbg_reset;
	begin
		dbg_write_reg(4'h2, 4'b1111, 32'h0000015c);		// dbgaddr <= COP_DEBUG
		dbg_write_reg(4'h4, 4'b1111, 32'h00000000);		// dbg_reg <= 0

		dbg_write_reg(4'h2, 4'b1111, 32'h00000160);		// dbgaddr <= COP_DEPC
		dbg_write_reg(4'h4, 4'b1111, 32'h00000000);		// dbg_reg <= 0
	end
	endtask
	
	// write mem
	task dbg_write_mem;
	input	[31:0]		addr;
	input	[3:0]		sel;
	input	[31:0]		data;
	begin
		dbg_write_reg(4'h2, 4'b1111, addr);		// dbgaddr <= addr
		dbg_write_reg(4'h6, sel, data);			// dbus    <= data
	end
	endtask
	
	// read mem
	task dbg_read_mem;
	input	[31:0]		addr;
	input	[3:0]		sel;
	begin
		dbg_write_reg(4'h2, 4'b1111, addr);		// dbgaddr <= addr
		dbg_read_reg(4'h6, sel);				// dbus    <= data
	end
	endtask
	
	
	// sdram dump
	task sdram_dump;
	integer	fp;
	integer	i;
	begin
		fp = $fopen("sdram_dump.txt");
		for ( i = 0; i < i_ddr.mem_used; i = i + 1 ) begin
			$fdisplay(fp, "%h %h", i_ddr.addr_array[i], i_ddr.mem_array[i]);
		end
		$fclose(fp);
	end
	endtask

	// sdram load
	task sdram_load;
	input	[256:1]	filename;
	reg		[31:0]	data;
	integer	fp;
	integer	addr;
	begin
		fp = $fopen(filename, "r");
		addr = 0;
		while ( $fscanf(fp, "%h", data) == 1 ) begin
			i_ddr.addr_array[addr] = addr; i_ddr.mem_array[addr] = data[31:16]; addr = addr + 1;
			i_ddr.addr_array[addr] = addr; i_ddr.mem_array[addr] = data[15:0];  addr = addr + 1;
			i_ddr.mem_used = addr;
		end
		$fclose(fp);
	end
	endtask
	
	
	/*
	task dbg_restart;
	begin
		$display("--- NOP ---");
		write_dbg_uart_rx_fifo(8'h00);		// nop
	#(RATE*200);

		$display("\n\n--- STATUS ---");
		write_dbg_uart_rx_fifo(8'h01);		// status
	#(RATE*200);

		$display("\n\n--- DEBUG BREAK ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf0);		// dbgctl
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'h01);		// dat3
	#(RATE*200);

		$display("\n\n--- DEBUG BREAK READ  ---");
		write_dbg_uart_rx_fifo(8'h03);		// read
		write_dbg_uart_rx_fifo(8'hf0);		// dbgctl
	#(RATE*200);

		$display("\n\n--- MEM WRITE  ---");
		write_dbg_uart_rx_fifo(8'h04);		// read
		write_dbg_uart_rx_fifo(8'h03);		// size
		write_dbg_uart_rx_fifo(8'h00);		// adr0
		write_dbg_uart_rx_fifo(8'h00);		// adr1
		write_dbg_uart_rx_fifo(8'h00);		// adr2
		write_dbg_uart_rx_fifo(8'h00);		// adr3
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'h00);		// dat3
	#(RATE*200);

		$display("\n\n--- R8 READ  ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf2);		// dbgaddr
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'ha0);		// dat3
	#(RATE*200);
		write_dbg_uart_rx_fifo(8'h03);		// read
		write_dbg_uart_rx_fifo(8'hf4);		// reg_data
	#(RATE*200);

		$display("\n\n--- R9 READ  ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf2);		// dbgaddr
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'ha4);		// dat3
	#(RATE*200);
		write_dbg_uart_rx_fifo(8'h03);		// read
		write_dbg_uart_rx_fifo(8'hf4);		// reg_data
	#(RATE*200);

		$display("\n\n--- HI  ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf2);		// dbgaddr
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'h40);		// dat3
	#(RATE*200);
		write_dbg_uart_rx_fifo(8'h03);		// read
		write_dbg_uart_rx_fifo(8'hf4);		// reg_data
	#(RATE*200);


		$display("\n\n--- MEM READ ---");
		write_dbg_uart_rx_fifo(8'h05);		// mem read
		write_dbg_uart_rx_fifo(8'h10);		// size
		write_dbg_uart_rx_fifo(8'h01);		// adr0
		write_dbg_uart_rx_fifo(8'h00);		// adr1
		write_dbg_uart_rx_fifo(8'h00);		// adr2
		write_dbg_uart_rx_fifo(8'h00);		// adr3
	#(RATE*1000);



		$display("\n\n--- COP_DEPC SET ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf2);		// dbgaddr
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h01);		// dat2
		write_dbg_uart_rx_fifo(8'h60);		// dat3
	#(RATE*200);
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf4);		// reg_data
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'h00);		// dat3
	#(RATE*200);

		$display("\n\n--- COP_STATUS SET ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf2);		// dbgaddr
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h01);		// dat2
		write_dbg_uart_rx_fifo(8'h30);		// dat3
	#(RATE*200);
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf4);		// reg_data
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'h00);		// dat3
	#(RATE*200);


		$display("\n\n--- RESTART ---");
		write_dbg_uart_rx_fifo(8'h02);		// write
		write_dbg_uart_rx_fifo(8'hf0);		// dbgctl
		write_dbg_uart_rx_fifo(8'h00);		// dat0
		write_dbg_uart_rx_fifo(8'h00);		// dat1
		write_dbg_uart_rx_fifo(8'h00);		// dat2
		write_dbg_uart_rx_fifo(8'h00);		// dat3
	#(RATE*100);
	end
	endtask	
	*/

endmodule

