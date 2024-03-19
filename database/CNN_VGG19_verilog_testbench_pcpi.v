`timescale 1 ns / 1 ps

`define FSDB_FILE    "testbench.fsdb"
`define CNN_SOURCE   "image/dog2.txt"
`define IMG_OFFSET   16384 //0x00010000
`define MEM_SIZE     3145728 //0x00C00000

`ifndef VERILATOR
module testbench ();
	reg clk = 1;
	reg resetn = 0;
	wire trap;

	always #5 clk = ~clk;

	initial begin
		repeat (100) @(posedge clk);
		resetn <= 1;
	end

	initial begin
		if ($test$plusargs("fsdb")) begin
			$fsdbDumpfile(`FSDB_FILE);
			$fsdbDumpvars(0, testbench);
		end
		//repeat (1000000000) @(posedge clk);
		//$display("TIMEOUT");
		//$finish;
	end

	wire trace_valid;
	wire [35:0] trace_data;
	integer trace_file;

	initial begin
		if ($test$plusargs("trace")) begin
			trace_file = $fopen("testbench.trace", "w");
			repeat (10) @(posedge clk);
			while (!trap) begin
				@(posedge clk);
				if (trace_valid)
					$fwrite(trace_file, "%x\n", trace_data);
			end
			$fclose(trace_file);
			$display("Finished writing testbench.trace.");
		end
	end
	
	integer cnn_in;
	integer i, j, cc;
	integer debug;                
	
	reg [31:0] cnn_data;
	
	initial begin
		$readmemh("firmware/firmware.hex", top.memory, 0, `IMG_OFFSET-1);
	
		if ($value$plusargs("debug=%d", debug)) begin
			$display(">> Debug level = %d", debug);
		end else begin
			debug = 0;
		end
		
		cnn_in = $fopen(`CNN_SOURCE, "rb");
        for (i = 0; i < 150528; i = i + 1) begin
            cc = $fscanf(cnn_in, "%d", cnn_data);
            top.memory[`IMG_OFFSET + i] = cnn_data;
        end
		$fclose(cnn_in);
	end
	
	picorv32_wrapper top (
		.clk(clk),
		.resetn(resetn),
		.trap(trap),
		.trace_valid(trace_valid),
		.trace_data(trace_data)
	);
endmodule
`endif

module picorv32_wrapper (
	input clk,
	input resetn,
	output trap,
	output trace_valid,
	output [35:0] trace_data
);
	reg tests_passed;
	wire [31:0] irq;
    wire [31:0] eoi;

	assign irq = 0;

	// set this to 0 for better timing but less performance/MHz
	parameter FAST_MEMORY = 1;

	reg mem_ready;
	wire mem_valid;
	wire mem_instr;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	reg [31:0] mem_rdata;
	wire mem_la_read;
	wire mem_la_write;
	wire [31:0] mem_la_addr;
	wire [31:0] mem_la_wdata;
	wire [3:0] mem_la_wstrb;
	
	wire pcpi_ready;
	wire pcpi_valid;
	wire [31:0] pcpi_insn;
	wire [31:0] pcpi_rs1;
	wire [31:0] pcpi_rs2;
	wire [31:0] pcpi_rd;
	wire pcpi_wr;
	wire pcpi_wait;
	wire pcpi_mem_valid;
	reg  pcpi_mem_ready;
	wire pcpi_mem_write;
	wire [31:0] pcpi_mem_addr;
	wire [31:0] pcpi_mem_out;
	reg  [31:0] pcpi_mem_rdata;
	wire [31:0] pcpi_mem_wdata;
	
	wire memory_valid;
	wire [31:0] memory_addr;
	wire [31:0] memory_wdata;
	wire memory_write;
	wire [3:0] memory_wstrb;

	picorv32 #(
`ifndef SYNTH_TEST
`ifdef SP_TEST
		.ENABLE_REGS_DUALPORT(0),
`endif
`ifdef COMPRESSED_ISA
		.COMPRESSED_ISA(1),
`endif
		.ENABLE_PCPI(1),
		.ENABLE_MUL(1),
		.ENABLE_DIV(1),
		.ENABLE_IRQ(1),
		.ENABLE_TRACE(1)
`endif) picorv32 (
		.clk         (clk         ),
		.resetn      (resetn      ),
		.trap        (trap        ),
		.mem_valid   (mem_valid   ),
		.mem_instr   (mem_instr   ),
		.mem_ready   (mem_ready   ),
		.mem_addr    (mem_addr    ),
		.mem_wdata   (mem_wdata   ),
		.mem_wstrb   (mem_wstrb   ),
		.mem_rdata   (mem_rdata   ),
		.mem_la_read (mem_la_read ),
		.mem_la_write(mem_la_write),
		.mem_la_addr (mem_la_addr ),
		.mem_la_wdata(mem_la_wdata),
		.mem_la_wstrb(mem_la_wstrb),
		.irq		 (irq	      ),
        .eoi         (eoi         ),
		.trace_valid (trace_valid ),
		.trace_data  (trace_data  ),
		.pcpi_valid  (pcpi_valid  ),
		.pcpi_insn   (pcpi_insn   ),
		.pcpi_rs1    (pcpi_rs1    ),
		.pcpi_rs2    (pcpi_rs2    ),
		.pcpi_wr     (pcpi_wr     ),
		.pcpi_rd     (pcpi_rd     ),
		.pcpi_wait   (pcpi_wait   ),
		.pcpi_ready  (pcpi_ready  )
	);

	CNN_PCPI cnn_pcpi (
		.clk       (clk            ),
		.resetn    (resetn         ),
		.pcpi_valid(pcpi_valid     ),
		.pcpi_insn (pcpi_insn      ),
		.pcpi_rs1  (pcpi_rs1       ),
		.pcpi_rs2  (pcpi_rs2       ),
		.pcpi_wr   (pcpi_wr        ),
		.pcpi_rd   (pcpi_rd        ),
		.pcpi_wait (pcpi_wait      ),
		.pcpi_ready(pcpi_ready     ),
		//memory interface
		.mem_ready (pcpi_mem_ready ),
		.mem_valid (pcpi_mem_valid ),
		.mem_write (pcpi_mem_write ),
		.mem_addr  (pcpi_mem_addr  ),
		.mem_wdata (pcpi_mem_out   ),
		.mem_rdata (pcpi_mem_rdata )
	);
	
	reg [31:0] memory [0: `MEM_SIZE-1];
	reg [31:0] m_read_data;
	reg m_read_en;

	assign memory_valid = mem_valid;
	assign memory_addr = FAST_MEMORY ? mem_la_addr : mem_addr;
	assign memory_wdata = FAST_MEMORY ? mem_la_wdata : mem_wdata;
	assign memory_write = mem_la_write;
	assign memory_wstrb = FAST_MEMORY ? mem_la_wstrb : mem_wstrb;

	//Port1: PCPI memory access
	always @(posedge clk) begin
		pcpi_mem_ready <= pcpi_mem_valid;
		pcpi_mem_rdata <= 0;
		if (pcpi_mem_valid && !pcpi_mem_write && (pcpi_mem_addr >> 2) < `MEM_SIZE) begin
			pcpi_mem_rdata <= memory[pcpi_mem_addr >> 2];
		end
		if (pcpi_mem_valid && |pcpi_mem_write && (pcpi_mem_addr >> 2) < `MEM_SIZE) begin
			memory[pcpi_mem_addr >> 2] <= pcpi_mem_wdata;
		end 
		
		if ((pcpi_mem_addr >> 2) > `MEM_SIZE) begin
			$display("PCPI OUT-OF-BOUNDS MEMORY ACCESS TO %08x", pcpi_mem_addr);
			$display("pcpi_mem_addr = %b", pcpi_mem_addr);
			$display("pcpi_mem_wdata = %b", pcpi_mem_wdata);
			$finish;
		end
	end
	
	// Port2: CPU memory access
	generate if (FAST_MEMORY) begin
		always @(posedge clk) begin
			mem_ready <= 1;
			mem_rdata <= memory[memory_addr >> 2];
			if (memory_write && (memory_addr >> 2) < `MEM_SIZE)begin
				if (memory_wstrb[0]) memory[memory_addr >> 2][ 7: 0] <= memory_wdata[ 7: 0];
				if (memory_wstrb[1]) memory[memory_addr >> 2][15: 8] <= memory_wdata[15: 8];
				if (memory_wstrb[2]) memory[memory_addr >> 2][23:16] <= memory_wdata[23:16];
				if (memory_wstrb[3]) memory[memory_addr >> 2][31:24] <= memory_wdata[31:24];
			end
			else if (memory_write && memory_addr == 32'h1000_0000) begin
				$write("%c", memory_wdata[7:0]);
				$fflush();
			end 
			else if (memory_write && memory_addr != 32'h1000_0000) begin
				if (memory_addr == 32'h2000_0000) begin
					if (memory_wdata == 123456789) tests_passed <= 1;
				end else begin
						$display("OUT-OF-BOUNDS MEMORY WRITE TO %08x", memory_addr);
						$finish;
				end
			end
		end
	end else begin
		always @(posedge clk) begin
			m_read_en <= 0;
			mem_ready <= memory_valid && !mem_ready && m_read_en;

			m_read_data <= memory[memory_addr >> 2];
			mem_rdata <= m_read_data;
			(* parallel_case *)
			case (1)
				memory_valid && !mem_ready && !memory_wstrb && (memory_addr >> 2) < `MEM_SIZE: begin
					m_read_en <= 1;
				end
				memory_valid && !mem_ready && |memory_wstrb && (memory_addr >> 2) < `MEM_SIZE: begin
					if (memory_wstrb[0]) memory[memory_addr >> 2][ 7: 0] <= memory_wdata[ 7: 0];
					if (memory_wstrb[1]) memory[memory_addr >> 2][15: 8] <= memory_wdata[15: 8];
					if (memory_wstrb[2]) memory[memory_addr >> 2][23:16] <= memory_wdata[23:16];
					if (memory_wstrb[3]) memory[memory_addr >> 2][31:24] <= memory_wdata[31:24];
					mem_ready <= 1;
				end
				memory_valid && !mem_ready && |memory_wstrb && memory_addr == 32'h1000_0000: begin
					mem_ready <= 1;
					$write("%c", memory_wdata[7:0]);
					$fflush();
				end
				memory_valid && !mem_ready && |memory_wstrb && memory_addr != 32'h1000_0000: begin
					mem_ready <= 1;
					if (memory_addr == 32'h2000_0000) begin
						if (memory_wdata == 123456789) tests_passed <= 1;
					end else begin
						$display("OUT-OF-BOUNDS MEMORY WRITE TO %08x", mem_addr);
						$finish;
					end
				end
			endcase
		end
	end endgenerate

	integer cycle_counter;
	
	always @(posedge clk) begin
		cycle_counter <= resetn ? cycle_counter + 1 : 0;
		if (resetn && trap) begin
`ifndef VERILATOR
			repeat (10) @(posedge clk);
`endif
			$display("TRAP after %1d clock cycles", cycle_counter);
			if (tests_passed) begin
				$display("ALL TESTS PASSED.");
				$finish;
			end else begin
				$display("ERROR!");
				if ($test$plusargs("noerror"))
					$finish;
				$stop;
			end
		end
	end
endmodule
