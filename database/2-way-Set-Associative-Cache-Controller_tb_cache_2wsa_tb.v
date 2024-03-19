`timescale 1ns / 100ps

/*
============================
Homework 4
2-way Set Associative Cache
ECE 585
============================
*/
// File Name:		cache_2wsa_tb.v
// Version:		0.5v 
//
// Author:		Prasad Pandit & Radhika Mandlekar
// Contact:		prasad@pdx.edu, radhika@pdx.edu
//
// Date created:	11/10/2015
// Date modified:	11/12/2015
//
// Text-editor used:	Gvim 7v4
// Simulator used:	Xilinx ISE 14v7
//
// Related filelist:	cache_2wsa.v (DUT 2-way set associative cache)
// 			
//
// Description:		This Testbench verifies basic functionality of
// 			a 2-way set associative cache module. 
// 			The cache can be used between a CPU and Main Memory or
// 			Secondary Cache. 
// 			The cache uses following policies:
// 			1. Module is configured to be used in Look-through
// 			Architecture
// 			2. Cache is designed with 'write-back' policy during CPU writes, so data
// 			if ditry then will be written to main memory during
// 			eviction else data in cache will be updated with setting
// 			dirty bit high.
// 			3. Cache uses write-allocate policy, For the Write miss, the block
// 			is loaded into cache hoping for subsequent writes to the same location, 
// 			which is now cached.
// 			4. The module implements LRU (Least Recently Used)
// 			policy for eviction of valid or dirty blocks. For
// 			2-way cache only one used bit is used and is updated
// 			in both TAG RAMs. (Though 2-bits are used, only one
// 			bit helps to decide least recently used block).
// 			(This feature needs to be optimized, and will help in
// 			reducing RAM size as well as speed of logic)
//
// 			The module inferres 4 Block RAM, two for cache data and
// 			two are TAG RAMs for 2-way cache.
//
// 			The TAG RAM stores tag data as well as Valid, Used and
// 			Dirty Bits.
//
// 			The Most significant bit is Valid bit in tag data
// 			block, next is used bit and third is dirty bit, and
// 			all other are TAG data bits.
// 			----------------------------------------------------------------------
// 			|Valid bit | Used bit | Dirty bit |          Tag Data
// 			----------------------------------------------------------------------
//
// 			All signal descriptions are given in code comments. Please check respective
// 			lines for understanding logic defined.
//
// 			States of Finite State Machine implemented for Cache
// 			Controller and its basic explanation:
//
// 			1. IDLE: This is a reset/default state of FSM. It waits for
// 			read or write command from CPU and when receives any,
// 			it latches the address and data (data only when write
// 			command is issued)
//
// 			2. READ: This is a decision state for read hit or miss
// 			in cache. If hit signal goes high then it selects the
// 			respective way to push data on CPU data bus and then
// 			jumps to IDLE state. It takes one clock cycle to complete
// 			the operation. LRU bits	are also updated in this state.
// 			During miss, depending on valid and dirty bit, it checks
// 			whether data needs to be updated in memory and jumps to 
// 			UPDATEMM state else goes to READMM state to read from Main Memory.
// 			CPU is stalled in this state when miss is detected.
// 			
// 			3. WRITE: This is decision state for write hit or miss
// 			in cache. If hit, it writes data byte at the
// 			respective hit location in cache and then updates the 
// 			valid and dirty bits, later it jumps to IDLE state. It
// 			consumes only one clock cycle for compleating the
// 			operation. For WRITE miss, depending on valid and
// 			dirty bits, if data is dirty and needs to be evicted,
// 			then it writes that data to main memory it goes to
// 			UPDATEMM state else to read the invalid line it jumps
// 			to READMM state.
// 			CPU is stalled in this state when miss is detected.
//
// 			4. READMM: This state drive the memory address bus
// 			using latched address from CPU. It checks if memory is
// 			ready to take requests. If yes, it enters a wait state
// 			WAITFORMM. The rd_mem signal is kept HIGH till the
// 			data is read from Main Memory.
//
// 			5. WAITFORMM: This state keeps check on ready_mem
// 			signal, and when it gets high, depending on the
// 			operation request from CPU i.e. read or write, it
// 			jumps to UPDATECACHE or READMM state.
//
// 			6. UPDATEMM: This state checks for LRU location and
// 			depending on USED bit value it decides to replace that
// 			specific location by assiging the address bus of main
// 			memory with that locations tag data and index, byte
// 			offset is kept 0 to update whole line i.e. 4 bytes in
// 			main memory. Then to write the data it moves to
// 			WAITFORMM and pushes the data on memory bus in next
// 			4 consucative clock cycles.
//
// 			7. UPDATECACHE: After waiting for memory to be ready
// 			with data, when FSM enters in this state it stores the
// 			read data on memory bus in a register and when done it
// 			updates the tag of location according to LRU policy as
// 			well as data at that specific index. To complete the
// 			operation it again goes to IDLE where CPU stall signal
// 			is made Low and then in next clock cycle CPU can fetch
// 			or update the data in Cache memory.
//
// Assumptions:		1. CPU is assumed to wait and keep address and data
// 			same while stalled.
// 			2. Main Memory module is not created and emulated
// 			without storing any data. But it is assumed that the
// 			memory gives out data in sequence when read is
// 			requested and reads data in sequence of 4 byte with
// 			1 byte each time during write request.
//
//
// NOTE:		Check Memory Editor of Simulator to cross check your
// 			data values as all RAMs in cache are loaded with
// 			respective data files.
// 			Many lines are kept uncommented to keep the code
// 			clean.
// 			Please contact the authors, if you need any specific
// 			information on your 'why like this?', 'what is this?'
// 			and ''How is this?' questions, you will get the
// 			response in a day or two. Do send the snapshot of
// 			section of code while contacting authors.
// 			
// 			Printing this file to PDF may create parsing
// 			error, do verify PDF with this file for correctness of code and
// 			indentation
// ******************************************************************************************************

module cache_2wsa_tb;

	// Inputs
	reg clock;
	reg reset_n;
	reg [15:0] addr_cpu;
	reg rd_cpu;
	reg wr_cpu;
	reg ready_mem;

	// Outputs
	wire [15:0] addr_mem;
	wire rd_mem;
	wire wr_mem;
	wire stall_cpu;

	// Bidirs
	wire [7:0] data_cpu;
	wire [7:0] data_mem;
	
	reg [7:0] dcpu;
	reg [7:0] wcpu;
	reg [7:0] dmem;
	reg [7:0] wmem;
	
	// Instantiate the Unit Under Test (UUT)
	cache_2wsa uut (
		.clock(clock), 
		.reset_n(reset_n), 
		.data_cpu(data_cpu), 
		.data_mem(data_mem), 
		.addr_cpu(addr_cpu), 
		.addr_mem(addr_mem), 
		.rd_cpu(rd_cpu), 
		.wr_cpu(wr_cpu), 
		.rd_mem(rd_mem), 
		.wr_mem(wr_mem), 
		.stall_cpu(stall_cpu), 
		.ready_mem(ready_mem)
	);

	assign data_cpu = wr_cpu? wcpu : 8'dZ;
	assign data_mem = !wr_mem? dmem : 8'dZ;

	//Clock generator block
	initial begin
	clock = 1'd0;
	forever
	#10 clock = ~clock;
	end
	
	task delay;
	begin
	@(negedge clock);
	end
	endtask		
		
	
	initial begin
		// Initialize Inputs
		reset_n = 0;
		addr_cpu = 0;
		rd_cpu = 0;
		wr_cpu = 0;
		ready_mem = 1;
		wcpu = 0;
		
		repeat(4)
		delay;
		
		reset_n = 1;
		
		delay;
		delay;
		// Simple Read from location
		rd_cpu = 1'd1;
		addr_cpu = 16'b0000_0000_1001_0011;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd0;
		delay;
		delay;
		// Simple Read to same location
		wr_cpu = 1'd1;
		wcpu = 8'h23;
		addr_cpu = 16'b0000_0000_1001_0011;
		delay;
		delay;
		wr_cpu = 1'd0;
		delay;
		delay;
		// Simple Read from same location to check updated data
		rd_cpu = 1'd1;
		addr_cpu = 16'b0000_0000_1001_0011;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd0;
		delay;
		
		// Simple Read Miss with dirty bit 0 policy check, reads data from Main Memory
		
		delay;
		rd_cpu = 1'd1;
		addr_cpu = 16'b1100_0000_1000_1011;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		@(posedge rd_mem);
		ready_mem = 0;
		repeat(4)
		delay;
		
		ready_mem = 1;
		
		delay;
		
		dmem = 8'h11;
		
		delay;
		
		dmem = 8'h22;
		
		delay;
		
		dmem = 8'h33;
		
		delay;
		
		dmem = 8'h44;
		
		delay;
		
		delay;
		
		delay;
		
		delay;
		
		rd_cpu = 1'd0;
		
		// Simple Read Miss Eviction Policy Test
		
		delay;
		rd_cpu = 1'd1;
		addr_cpu = 16'b1100_0001_0001_1010;
		dcpu = data_cpu;
		delay;
		rd_cpu = 1'd1;
		dcpu = data_cpu;
		@(posedge wr_mem);
		ready_mem = 0;
		repeat(4)
		delay;
		
		ready_mem = 1;
		
		@(posedge rd_mem);
		ready_mem = 0;
		repeat(4)
		delay;
		
		ready_mem = 1;
		
		delay;
		
		dmem = 8'hAA;
		
		delay;
		
		dmem = 8'hBB;
		
		delay;
		
		dmem = 8'hCC;
		
		delay;
		
		dmem = 8'hDD;
		
		delay;
		
		delay;
		
		delay;
		
		delay;
		
		rd_cpu = 1'd0;
		
		repeat(10)
		delay;
		
		
		// End of Simulation
		#100 $finish;

	end
      
endmodule

