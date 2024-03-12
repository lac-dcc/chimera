// 832 CPU MCU for the Analogue Pocket
// Copyright � 2022 by Murray Aickin(mazamars312)

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Big thanks to Alastair M. Robinson as it was his fantastic 832 CPU that allowed me to build this. I do want
//
// This runs a Mister interface and other interfaces can be built for this for other projects :-)

module substitute_mcu_apf_mister(
	input                  	clk_mpu,
	input 					  	clk_sys,
	input                  	reset_n,
	output reg             	reset_out,
		
	input 	     		     	clk_74a,
	input [31:0]  		     	bridge_addr,
	input 	     		     	bridge_rd,
	output [31:0]  	     	mpu_ram_bridge_rd_data,
	output reg [31:0]  	  	mpu_reg_bridge_rd_data,
	input 	     		     	bridge_wr,
	input  [31:0]   	     	bridge_wr_data,
		 

    input 	     	        	dataslot_update,
    input 	     	[15:0]  	dataslot_update_id,
    input 	     	[31:0]  	dataslot_update_size,

	output reg             	target_dataslot_read,       // rising edge triggered
	output reg             	target_dataslot_write,

	input                  	target_dataslot_ack,        // asserted upon command start until completion
	input                  	target_dataslot_done,       // asserted upon command finish until next command is issued    
	input        [2:0]     	target_dataslot_err,        // contains result of command execution. zero is OK

	output reg   [15:0]    	target_dataslot_id,         // parameters for each of the read/reload/write commands
	output reg   [31:0]    	target_dataslot_slotoffset,
	output reg   [31:0]    	target_dataslot_bridgeaddr,
	output reg   [31:0]    	target_dataslot_length,

	output       [9:0]     	datatable_addr,
	output              		datatable_wren,
	output              		datatable_rden,
	output    	 [31:0]    	datatable_data,
	input      	 [31:0]    	datatable_q,
	
	output  [21:16] 			cram_a,
	inout   [ 15:0] 			cram_dq,
	input           			cram_wait,
	output          			cram_clk,
	output          			cram_adv_n,
	output          			cram_cre,
	output          			cram_ce0_n,
	output          			cram_ce1_n,
	output          			cram_oe_n,
	output          			cram_we_n,
	output          			cram_ub_n,
	output          			cram_lb_n,
	
	// UART
	output                 	txd,
	input                  	rxd,
	
	input    	[31:0]  		cont1_key,
	input    	[31:0]  		cont2_key,
	input    	[31:0]  		cont3_key,
	input    	[31:0]  		cont4_key,
	input    	[31:0]  		cont1_joy,
	input    	[31:0]  		cont2_joy,
	input    	[31:0]  		cont3_joy,
	input    	[31:0]  		cont4_joy,
	input    	[15:0]  		cont1_trig,
	input    	[15:0]  		cont2_trig,
	input    	[15:0]  		cont3_trig,
	input    	[15:0]  		cont4_trig,
	
	//Mister HPS Bus via the 32bit bus
	output 	     	   	  	IO_UIO,
	output 	     	   	  	IO_OSD,
	output    		   	  	IO_FPGA,
	output    		   	  	IO_STROBE,
	input 	     		     	IO_WAIT,
	input  [15:0] 		     	IO_DIN,
	output reg [15:0] 	  	IO_DOUT,
	input 					  	IO_WIDE, // 1 = 16bit, 0 = 8bit;
	output reg [31:0]			CORE_OUTPUT,
	input	 [31:0]				CORE_INPUT
	
    );


// some timing for the UART and timer cores
reg [31:0] uart_divisor;

// CPU Wires
wire [31:0] dBus_cmd_payload_address;
wire [31:0] dBus_cmd_payload_data, from_rom;
wire [3:0]  cpu_bytesel;
reg  [31:0] dBus_rsp_data;
reg         dBus_rsp_ready;
wire        rom_wr;

// UART

reg  [7:0]  ser_txdata; 
wire [7:0]  ser_txdata_wire;
wire [7:0]  ser_rxdata;
reg         ser_txgo;
wire        ser_txgo_wire;

wire 			fifo_full;
wire			fifo_empty;

// We need to see what is happening right? this is sent via the UART on the Cart port
uart_fifo uart_fifo_tx (
	.aclr		(~reset_n),
	.clock	(clk_mpu),
	.data		(ser_txdata),
	.rdreq	(ser_txgo_wire),
	.wrreq	(ser_txgo),
	.empty	(fifo_empty),
	.full		(fifo_full),
	.q			(ser_txdata_wire)
);

assign ser_txgo_wire = ~fifo_empty && ser_txready_wire;

simple_uart simple_uart (
.clk        (clk_mpu),
.reset      (reset_n),
.txdata     (ser_txdata_wire),
.txready    (ser_txready_wire),
.txgo       (ser_txgo_wire),
.rxdata     (ser_rxdata),
.rxint      (ser_rxint),
.txint      (open),
.clock_divisor (uart_divisor),
.rxd        (rxd),
.txd        (txd));
    
// Ram controller that is duel ported so one side is on the APF bus and is addressable
reg	littlenden;  
wire [31:0] 		iBus_cmd_payload_pc;
wire [31:0] 		iBus_rsp_payload_inst;
wire iBus_cmd_ready, iBus_cmd_valid;
reg					interupt_mask;
wire 					dBus_ram_ready;
wire 					dBus_cmd_ready;

controller_rom 
#(.top_address(16'h8000), // This sets the location on the APF bus to watch out for
  .address_size (5'd14) //Address lines for the memory array
)
controller_rom(
	.clk					(clk_mpu),
	.reset_n				(reset_n),
	// Instruction Side
	.iBus_cmd_payload_pc		(iBus_cmd_payload_pc),
	.iBus_cmd_valid			(iBus_cmd_valid),
	.iBus_cmd_ready			(iBus_cmd_ready),
	.iBus_rsp_valid			(iBus_rsp_valid),
	.iBus_rsp_payload_inst	(iBus_rsp_payload_inst),
	// Data Side
	.data_addr			(dBus_cmd_payload_address),
	.data_d				(dBus_cmd_payload_data),
	.data_q				(from_rom),
	.data_we				(mem_la_write),
	.dBus_cmd_valid	(dBus_cmd_valid),
	.data_bytesel		(dBus_cmd_payload_size),
	// APF Side
	.little_enden		(littlenden),
	.clk_74a				(clk_74a),
	.bridge_addr		(bridge_addr),
	.bridge_rd			(bridge_rd),
	.bridge_rd_data	(mpu_ram_bridge_rd_data),
	.bridge_wr			(bridge_wr),
	.bridge_wr_data	(bridge_wr_data)
);




// The CPU VexRisc

wire 			cpu_req;
wire 			mem_la_read, mem_la_write; 
wire 			dBus_cmd_valid;
wire [1:0] 	dBus_cmd_payload_size;
wire 			dBus_cmd_payload_wr;
reg 			ibus_ready;
reg 			ibus_valid;
reg			externalInterrupt;
reg			interupt_output_1_reg;

assign mem_la_read 	= dBus_cmd_valid && ~dBus_cmd_payload_wr;
assign mem_la_write	= dBus_cmd_valid &&  dBus_cmd_payload_wr;

// Imem Controller





// CPU Core
	
   VexRiscv cpu(
		.clk								(clk_mpu), 
		.reset							(~reset_n),
		.iBus_cmd_valid				(iBus_cmd_valid),
		.iBus_cmd_ready				(iBus_cmd_ready),
		.iBus_cmd_payload_pc			(iBus_cmd_payload_pc),
		.iBus_rsp_valid				(iBus_rsp_valid),
		.iBus_rsp_payload_error		(1'b0),
		.iBus_rsp_payload_inst		(iBus_rsp_payload_inst),
		.timerInterrupt				(interupt_output_1_reg && interupt_mask),
		.externalInterrupt			(externalInterrupt),
		.softwareInterrupt			(1'b0),
		.dBus_cmd_valid				(dBus_cmd_valid),
		.dBus_cmd_ready				(1'b1),
		.dBus_cmd_payload_wr			(dBus_cmd_payload_wr),
		.dBus_cmd_payload_address	(dBus_cmd_payload_address),
		.dBus_cmd_payload_data		(dBus_cmd_payload_data),
		.dBus_cmd_payload_size		(dBus_cmd_payload_size),
		.dBus_rsp_ready				(|{dBus_rsp_ready}),
		.dBus_rsp_error				(1'b0),
		.dBus_rsp_data					(dBus_rsp_data)
		);
    
// Timer for the cpu to make sure things are in time

wire [31:0] millisecond_counter_1;
wire [31:0] millisecond_counter_2;
wire [31:0] millisecond_counter_real_1;
wire [31:0] millisecond_counter_real_2;
reg 		  	millisecond_counter_reset_1;
reg 		  	millisecond_counter_reset_2;
reg [31:0] 	sysclk_frequency;
reg [31:0]	interupt_counter_1;
wire			interupt_output_1;

timer_core timer_1_core(
	.clk_sys								(clk_mpu),
	.millisecond_counter_reset		(millisecond_counter_reset_1),
	.millisecond_counter				(millisecond_counter_1),
	.millisecond_real					(millisecond_counter_real_1),
	.sysclk_frequency					(sysclk_frequency),
	.interupt_counter					(interupt_counter_1),
	.interupt_output					(interupt_output_1)
);

timer_core timer_2_core(
	.clk_sys								(clk_mpu),
	.millisecond_counter_reset		(millisecond_counter_reset_2),
	.millisecond_counter				(millisecond_counter_2),
	.millisecond_real					(millisecond_counter_real_2),
	.sysclk_frequency					(sysclk_frequency)
);

// Interupt core for the data slot updates
reg dataslot_update_ack;
wire dataslot_update_true;

switching_latch dataslot_update_latch (
	.clk       (clk_mpu),        // the system clock
	.int_clk   (clk_74a),    // the interupt clock domain
	.reset_n   (reset_n),
	.trigger   (dataslot_update),
	.ack       (dataslot_update_ack),
	.out       (dataslot_update_true)
);

wire [15:0] dataslot_update_id_latched;

clock_reg_latch #(.data_size(16) ) dataslot_update_id_latch(
	.write_clk             (clk_74a),        // the APF clock
	.read_clk              (clk_mpu),        // the system clock
	.reset_n               (reset_n),
	.write_trigger         (dataslot_update),
	.write_data_in         (dataslot_update_id),
	.read_data_out         (dataslot_update_id_latched)
);

wire [31:0] dataslot_update_size_latched;

clock_reg_latch #(.data_size(32) ) dataslot_update_size_latch(
	.write_clk             (clk_74a),        // the APF clock
	.read_clk              (clk_mpu),        // the system clock
	.reset_n               (reset_n),
	.write_trigger         (dataslot_update),
	.write_data_in         (dataslot_update_size),
	.read_data_out         (dataslot_update_size_latched)
);
    
// external access to the CPU or cores for other cool stuff
reg [31:0]  ext_data_out;
reg         ext_data_en;
reg         ser_rxrecv;

reg        	io_clk;
reg        	io_ss0;
reg        	io_ss1;
reg        	io_ss2;

// Dataslot ram access

assign datatable_addr = dBus_cmd_payload_address[11:2];
assign datatable_wren = dBus_cmd_payload_address[31:12] == 'hffff0 && mem_la_write;
assign datatable_rden = dBus_cmd_payload_address[31:12] == 'hffff0 && mem_la_read;
assign datatable_data = dBus_cmd_payload_data;

/*

	This code is for the status system for the MPU fof the interactions
	
	8 regs so the interact.json or <instance.json> can communicate directly to the MPU for settings and setup

*/

// regs on the 74mh clock before MPU reg
reg [31:0] mpu_reg_0 = 0;
reg [31:0] mpu_reg_1 = 0;
reg [31:0] mpu_reg_2 = 0;
reg [31:0] mpu_reg_3 = 0;
reg [31:0] mpu_reg_4 = 0;
reg [31:0] mpu_reg_5 = 0;
reg [31:0] mpu_reg_6 = 0;
reg [31:0] mpu_reg_7 = 0;


// Read for the APF bus
reg [31:0] mpu_reg_bridge_rd_data_reg;

// Write side of the regs
always @(posedge clk_74a) begin
	if (bridge_wr && bridge_addr[31:8] == 24'hf00000) begin
		case (bridge_addr[7:0])
			8'h00 : begin
				mpu_reg_0 <= bridge_wr_data;
			end
			8'h04 : begin
				mpu_reg_1 <= bridge_wr_data;
			end
			8'h08 : begin
				mpu_reg_2 <= bridge_wr_data;
			end
			8'h0C : begin
				mpu_reg_3 <= bridge_wr_data;
			end
			8'h10 : begin
				mpu_reg_4 <= bridge_wr_data;
			end
			8'h14 : begin
				mpu_reg_5 <= bridge_wr_data;
			end
			8'h18 : begin
				mpu_reg_6 <= bridge_wr_data;
			end
			8'h1C : begin
				mpu_reg_7 <= bridge_wr_data;
			end
		endcase
	end
	else if (mem_la_write && dBus_cmd_payload_address[31:8] == 24'hFFFFFF ) begin
		case (dBus_cmd_payload_address[7:0])
			8'h00 : begin
				mpu_reg_0 <= dBus_cmd_payload_data;
			end
			8'h04 : begin
				mpu_reg_1 <= dBus_cmd_payload_data;
			end
			8'h08 : begin
				mpu_reg_2 <= dBus_cmd_payload_data;
			end
			8'h0C : begin
				mpu_reg_3 <= dBus_cmd_payload_data;
			end
			8'h10 : begin
				mpu_reg_4 <= dBus_cmd_payload_data;
			end
			8'h14 : begin
				mpu_reg_5 <= dBus_cmd_payload_data;
			end
			8'h18 : begin
				mpu_reg_6 <= dBus_cmd_payload_data;
			end
			8'h1C : begin
				mpu_reg_7 <= dBus_cmd_payload_data;
			end
		endcase
	end
end


// read side of the regs

always @(posedge clk_74a) begin
	if (bridge_rd) begin
		case (bridge_addr[7:0])
			8'h00 : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_0;
			end
			8'h04 : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_1;
			end
			8'h08 : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_2;
			end
			8'h0C : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_3;
			end
			8'h10 : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_4;
			end
			8'h14 : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_5;
			end
			8'h18 : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_6;
			end
			8'h1C : begin
				mpu_reg_bridge_rd_data_reg <= mpu_reg_7;
			end
		endcase
	end
	mpu_reg_bridge_rd_data <= mpu_reg_bridge_rd_data_reg;
end


/***********************************************************
	Memory map for the 832 CPU 
	
	32'h0000_0000 - 32'h0000_3FFF - Program Ram for the CPU - The program is in here and starts at address 0000_0000. 
									This is also mapped at address 32'8000_0000 on the APF Bus so data can be up/downloaded 
									from the APF PIC32. Mostly used for the target dataslot bridge address location.
	
	32'hFFFF_0000 - 32'hFFFF_0FFF - Data slot ram from APF Core (R/W)
	
	// Target Interface to APF
	32'hFFFF_FF80 - target_dataslot_id (R/W) 15 bit - For which asset to read 
	32'hFFFF_FF84 - target_dataslot_bridgeaddr (R/W) 32 bit - Where in ram to place this this data (Buffer and program) (The MPU Ram starts at 32'h8000_0000 to 32'h8000_3FFF )
	32'hFFFF_FF88 - target_dataslot_length (R/W) 32 bit - How much buffer to pull
	32'hFFFF_FF8c - target_dataslot_slotoffset (R/W) 32 bit 
	32'hFFFF_FF90 - target_dataslot Controls (R) Respoce from the APF Core once the reg is written to 
					{Bit 4 - target_dataslot_ack, 
					 Bit 3 - target_dataslot_done, 
					 Bit [2:0] target_dataslot_err[2:0]} 
	32'hFFFF_FF90 - target_dataslot Controls (W)
					{Bit 1 - target_dataslot_write - Send a Write signal to the APF ( the target id, Bridgeaddr, length and offset need to be written to first)
					 Bit 0 - target_dataslot_read - Send a read signal to the APF ( the target id, Bridgeaddr, length and offset need to be written to first)
	
	32'hFFFF_FFA4 - Bit 0 Reset_out - Used for reseting the core if required (R/W)
	
	// Interupts and dataslot updates 
	
	32'hFFFF_FFB0 - Interrupt core - Bit 0 = Dataslot updated by APF (R) Read clears the interupt to the CPU
	
	32'hFFFF_FFB4 - dataslot_update_id ID = Dataslot updated by APF (R) 15 bit 
	32'hFFFF_FFB8 - dataslot_update_size ID = Dataslot updated by APF (R) 32 bit
	
	// UART core 
	32'hFFFF_FFC0 - UART access - ser_rxrecv,ser_txready,ser_rxdata 
		bit [7:0] data received, 
		Bit8 - Transmit ready, 
		Bit9 - Data received (cleared once read) (R)
	32'hFFFF_FFC0 - UART access 
		ser_txdata [7:0] data to send (W)
	
	32'hFFFF_FFC8 - Timer - millisecond_counter (R) 32 bit
	
	The SPI/Mister EXT interface 
	32'hFFFF_FFD0 - This is setup for the SPI interface (R)
					Bit [15:0] 	- IO_DIN Data from core 
					Bit [16]	- IO_WIDE 1 = 16bit, 0 = 8 bit
					Bit [17]	- io_ack - Data has been ack from core (Both read and writes)

	32'hFFFF_FFD0 - This is setup for the SPI interface (W)
					Bit [15:0] 	- IO_DIN Data from core 
					Bit [17]	- io_clk - This is send as a clock from the CPU when data is send or received - Also part of the strobe signal 
					Bit [18]	- io_ss0
					Bit [19]	- io_ss1
					Bit [20]	- io_ss2
	
	assign IO_FPGA     = ~io_ss1 & io_ss0; - This is for the CPU to send commands to the FPGA
	assign IO_UIO      = ~io_ss1 & io_ss2; - This is used for a Broardcast on the bus (Floopy drives use this access)
	


***********************************************************/

reg [31:0] gp_out;
reg dataslot_data_access;
reg target_dataslot_done_reg;
reg externalInterrupt_enabled;
reg timerenabled;
reg psram_data_access;

always @(posedge clk_mpu) begin
	dBus_rsp_ready <= 0;
	ser_txgo <= 0;
	dataslot_update_ack <= 'b0;
	psram_data_access <= 0;
	target_dataslot_write <= 'b0;
	target_dataslot_read <= 'b0;
	target_dataslot_done_reg <= target_dataslot_done;
	if (target_dataslot_done && ~target_dataslot_done_reg && externalInterrupt_enabled) externalInterrupt <= 1'b1;
	else  externalInterrupt <= 1'b0;
	if (timerenabled) interupt_output_1_reg <= interupt_output_1;
	else  interupt_output_1_reg <= 0;
	millisecond_counter_reset_1 <= 1'b0;
	millisecond_counter_reset_2 <= 1'b0;
	// UART Received signal
	if (ser_rxint) ser_rxrecv <= 1;

	if (dBus_cmd_valid)begin
		if (dBus_cmd_payload_address[31:12] == 'hffff0) begin
			dBus_rsp_ready <= 1;
			psram_data_access <= 0;
			dataslot_data_access <= 1;
			ext_data_en <= 0;
		end
		else if (dBus_cmd_payload_address[31:24] == 'h10) begin
			psram_data_access <= 1;
			dataslot_data_access <= 0;
			ext_data_en <= 0;
		end
		else if (dBus_cmd_payload_address[31:8] == 'hFFFFFF) begin
			dBus_rsp_ready <= 1;
			psram_data_access <= 0;
			dataslot_data_access <= 0;
			ext_data_en <= 1;
			if (~dBus_cmd_payload_wr) begin
				casez (dBus_cmd_payload_address[7:0])

					// Interaction Access
					'h00 : begin // mpu_reg_0 read
					ext_data_out <= mpu_reg_0;
					end
					'h04 : begin // mpu_reg_1 read
					ext_data_out <= mpu_reg_1;
					end
					'h08 : begin // mpu_reg_2 read
					ext_data_out <= mpu_reg_2;
					end
					'h0C : begin // mpu_reg_3 read
					ext_data_out <= mpu_reg_3;
					end
					'h10 : begin // mpu_reg_4 read
					ext_data_out <= mpu_reg_4;
					end
					'h14 : begin // mpu_reg_5 read
					ext_data_out <= mpu_reg_5;
					end
					'h18 : begin // mpu_reg_6 read
					ext_data_out <= mpu_reg_6;
					end
					'h1C : begin // mpu_reg_7 read
					ext_data_out <= mpu_reg_7;
					end

					// Controller inputs

					'h20 : begin // cont1_key read
					ext_data_out <= cont1_key;
					end
					'h24 : begin // cont2_key read
					ext_data_out <= cont2_key;
					end
					'h28 : begin // cont3_key read
					ext_data_out <= cont3_key;
					end
					'h2C : begin // cont4_key read
					ext_data_out <= cont4_key;
					end
					'h30 : begin // cont1_joy read
					ext_data_out <= cont1_joy;
					end
					'h34 : begin // cont2_joy read
					ext_data_out <= cont2_joy;
					end
					'h38 : begin // cont3_joy read
					ext_data_out <= cont3_joy;
					end
					'h3C : begin // cont4_joy read
					ext_data_out <= cont4_joy;
					end
					'h40 : begin // cont1_joy read
					ext_data_out <= cont1_trig;
					end
					'h44 : begin // cont2_joy read
					ext_data_out <= cont2_trig;
					end
					'h48 : begin // cont3_joy read
					ext_data_out <= cont3_trig;
					end
					'h4C : begin // cont4_joy read
					ext_data_out <= cont4_trig;
					end

					// Core input and outputs
					'h50 : begin // target_dataslot_id read
					ext_data_out <= CORE_INPUT;
					end
					// Core input and outputs
					'h54 : begin // target_dataslot_id read
					ext_data_out <= CORE_OUTPUT;
					end
					
					// Target Dataslot inputs
					'h80 : begin // target_dataslot_id read
					ext_data_out <= target_dataslot_id;
					end
					'h84 : begin // target_dataslot_bridgeaddr read
					ext_data_out <= target_dataslot_bridgeaddr;
					end
					'h88 : begin // target_dataslot_length read
					ext_data_out <= target_dataslot_length;
					end
					'h8C : begin // target_dataslot_slotoffset read
					ext_data_out <= target_dataslot_slotoffset;
					end
					'h90 : begin // target_dataslot_slotoffset read
					ext_data_out <= {target_dataslot_ack, target_dataslot_done, target_dataslot_err[2:0]};
					externalInterrupt <= 0;
					end
					// UART Data rate
					'h94 : begin // uart_divisor set
					ext_data_out <= uart_divisor;
					end
					// System Clock rate
					'h98 : begin // System clock set
					ext_data_out <= sysclk_frequency;
					end
					
					// Core reset from the MPU if required
					'hA4 : begin // The reset the core function incase the system wants to make sure it is in sync
					ext_data_out[0] <= reset_out;
					end
					// Dataslot ram access
					'hB0 : begin // dataslot update
					ext_data_out <= dataslot_update_true;
					if (dataslot_update_true) dataslot_update_ack <= 1;
					end
					'hB4 : begin // dataslot_update_id ID
					ext_data_out <= dataslot_update_id_latched;
					end
					'hB8 : begin // dataslot_update_size ID
					ext_data_out <= dataslot_update_size_latched;
					end
					// UART access
					'hC0 : begin
					ext_data_out <= {ser_rxrecv,fifo_full,ser_rxdata};
					if (ser_rxrecv) ser_rxrecv<= 0;
					end
					// Timer_1
					'hC4 : begin 
					ext_data_out <= millisecond_counter_1;
					end
					// Timer_1 interupt
					'hc8 : begin // System clock set
					ext_data_out <= interupt_counter_1;
					end
					// Timer_2
					'hCc : begin 
					ext_data_out <= millisecond_counter_2;
					end
					// HPS Interface
					'hD0 : begin // This is GPO setup for the HPS interface
					ext_data_out <= {io_ss2, io_ss1,io_ss0,io_clk,1'b0,IO_DOUT[15:0]};
					end
					'hD4 : begin // This is GPI setup for the HPS interface
					ext_data_out <= {io_ack, IO_WIDE, IO_DIN};
					end
					'hf0 : begin // This is GPI setup for the HPS interface
					ext_data_out <= littlenden;
					end
					'hf4 : begin // This is GPI setup for the HPS interface
					ext_data_out <= {interupt_output_1, interupt_output_1_reg, timerenabled};
					end
					'hf8 : begin // This is GPI setup for the HPS interface
					ext_data_out <= millisecond_counter_real_1;
					end
					'hfC : begin // This is GPI setup for the HPS interface
					ext_data_out <= millisecond_counter_real_2;
					end
					default : ext_data_out <= 0;
				endcase
			end
			else begin
				casez (dBus_cmd_payload_address[7:0])
					// Core input and outputs
					'h54 : begin // target_dataslot_id read
					CORE_OUTPUT <= dBus_cmd_payload_data;
					end
					// Target interface to APF
					'h80 : begin // target_dataslot_id read
					target_dataslot_id <= dBus_cmd_payload_data;
					end
					'h84 : begin // target_dataslot_bridgeaddr read
					target_dataslot_bridgeaddr <= dBus_cmd_payload_data;
					end
					'h88 : begin // target_dataslot_length read
					target_dataslot_length <= dBus_cmd_payload_data;
					end
					'h8C : begin // target_dataslot_slotoffset read
					target_dataslot_slotoffset <= dBus_cmd_payload_data;
					end
					'h90 : begin // target_dataslot_slotoffset read
					{externalInterrupt_enabled, target_dataslot_write, target_dataslot_read} <= dBus_cmd_payload_data;
					end
					// uart_divisor set
					'h94 : begin 
					uart_divisor <= dBus_cmd_payload_data;
					end
					// System clock set
					'h98 : begin 
					sysclk_frequency <= dBus_cmd_payload_data;
					end
					// The reset the core function incase the system wants to make sure it is in sync
					'hA4 : begin 
					reset_out <= dBus_cmd_payload_data[0];
					end
					// UART Data
					'hC0 : begin 
					ser_txdata <= dBus_cmd_payload_data[7:0];
					ser_txgo <= 1;
					end
					// Timer_1 and disabled interrupt flag
					'hC4 : begin 
					millisecond_counter_reset_1 <= dBus_cmd_payload_data[0];
					timerenabled <= 0;
					end
					// Timer_1  and enabled interrupt flag
					'hc8 : begin // System clock set
					interupt_counter_1 <= dBus_cmd_payload_data;
					timerenabled <= 1;
					end
					// Timer_2
					'hCC : begin 
					millisecond_counter_reset_2 <= dBus_cmd_payload_data[0];
					end
					// This is setup for the HPS interface
					'hD0 : begin 
					gp_out[31:0] <= dBus_cmd_payload_data;
					end
					// This will change the Enden of the BRAM between the AFP and the BRAM for the CPU if required
					'hf0 : begin 
					littlenden <= dBus_cmd_payload_data[0];
					end
					'hf4 : begin 
					interupt_mask <= dBus_cmd_payload_data[0];
					end
				endcase
			end
		end
		else begin 
			dataslot_data_access <= 0;
			ext_data_en <= 0;
			dBus_rsp_ready <= 1;
		end
	end
end
 

always @* begin
	casez({ext_data_en, dataslot_data_access})
		'b1z		: dBus_rsp_data <= ext_data_out;
		'b01		: dBus_rsp_data <= datatable_q;
		default 	: dBus_rsp_data <= from_rom;
	endcase
end

// Here is the Wait system for the MPU to the HPS bus

assign IO_OSD      =  io_ss1;
assign IO_FPGA     = ~io_ss1 & io_ss0;
assign IO_UIO      = ~io_ss1 & io_ss2;
reg  io_ack;
reg  rack;
assign IO_STROBE = ~rack & io_clk;
always @(posedge clk_sys) begin
	if(~(IO_WAIT) | IO_STROBE) begin
		rack <= io_clk;
		io_ack <= rack;
	end
end

//assign io_clk = gp_out[17];
//assign io_ss0 = gp_out[18];
//assign io_ss1 = gp_out[19];
//assign io_ss2 = gp_out[20];

reg [31:0] gp_outr;
reg [31:0] gp_outd;
always @(posedge clk_sys) begin
	reg [31:0] gp_outd;
	gp_outr <= gp_outd;
	gp_outd <= gp_out;
	io_clk = gp_outr[17];
	io_ss0 = gp_outr[18];
	io_ss1 = gp_outr[19];
	io_ss2 = gp_outr[20];
	IO_DOUT <= gp_outr[15:0];
end
    
endmodule


// This is a switching reg over two clock domains

module switching_latch (
	input          clk,        // the system clock
	input          int_clk,    // the interupt clock domain
	input          reset_n,
	input          trigger,
	input          ack,
	output reg     out
);

reg ack_clk_1; // Doing a 3 stage sync between the clock domains - Fuck I hate these.......
// But this "should" help with different clocks on both sides.
reg interupt_int_clk_1;
always @(posedge int_clk or negedge reset_n) begin
    if (~reset_n) begin
        interupt_int_clk_1 <= 'b0;
    end
    else begin
			if (trigger) interupt_int_clk_1 <= 1'b1;
			else if (out) interupt_int_clk_1 <= 1'b0;
    end
end

always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        out <= 'b0;
    end
    else begin
		  if (interupt_int_clk_1) out <= 1'b1;
        else if (ack) out <= 1'b0;
    end
end

endmodule

// This is a reg over two clock domains

module clock_reg_latch #(parameter data_size=32 )(
	input                          write_clk,        // the APF clock
	input                          read_clk,        // the system clock
	input                          reset_n,
	input                          write_trigger,
	input [data_size-1:0]          write_data_in,
	output reg [data_size-1:0]     read_data_out
);

reg [data_size-1:0] write_reg_triggered;

always @(posedge write_clk or negedge reset_n) begin
    if (~reset_n) begin
        write_reg_triggered <= 'b0;
    end
    else begin
        if (write_trigger) write_reg_triggered <= write_data_in;
    end
end

reg [data_size-1:0] read_data_clocked_1, read_data_clocked_2;

always @(posedge read_clk or negedge reset_n) begin
    if (~reset_n) begin
        read_data_clocked_1 <= 'b0;
        read_data_clocked_2 <= 'b0;
        read_data_out <= 'b0;
    end
    else begin
        read_data_clocked_1 <= write_reg_triggered;
        read_data_clocked_2 <= read_data_clocked_1;
        read_data_out <= read_data_clocked_2;
    end
end

endmodule

module timer_core(
	input 				clk_sys,
	input 				millisecond_counter_reset,
	output reg [31:0] millisecond_counter,
	output reg [31:0] millisecond_tick,
	output reg [31:0] millisecond_real,
	input 	  [31:0] sysclk_frequency,
	input 	  [31:0] interupt_counter,
	output reg 			interupt_output
);

// Timer for the cpu to make sure things are in time


reg        timer_tick;

always @(posedge clk_sys or posedge millisecond_counter_reset) begin
    if (millisecond_counter_reset) begin
		millisecond_tick <= 'd0;
		millisecond_counter <= 'd0;
		interupt_output	<= 'd0;
		millisecond_real	<= 'd0;
	 end
	 else begin
		 millisecond_tick <= millisecond_tick + 1;
		 millisecond_real <= millisecond_real + 1;
		 if (millisecond_tick == sysclk_frequency) begin
			  if (millisecond_counter >= interupt_counter) begin
					interupt_output <= |{interupt_counter};
			  end
			  millisecond_counter <= millisecond_counter + 1;
			  millisecond_tick <= 'h00000;
		 end
	 end
end

endmodule
