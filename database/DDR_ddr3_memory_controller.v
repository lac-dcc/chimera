// Credit : https://github.com/MartinGeisse/esdk2/blob/master/simsyn/orange-crab/src/mahdl/name/martingeisse/esdk/riscv/orange_crab/ddr3/RamController.mahdl


// Will simulate loopback transaction (write some data into RAM, then read those data back from RAM)
// with the verilog simulation model provided by Micron
// https://www.micron.com/products/dram/ddr3-sdram/part-catalog/mt41j128m16jt-125
// Later, formal verification will proceed with using Micron simulation model


`define SYNTHESIS 1
`define VIVADO 1  // for 7-series and above
`define HIGH_SPEED 1  // Minimum DDR3-1600 operating frequency >= 303MHz

`ifndef SYNTHESIS
	`define MICRON_SIM 1  // micron simulation model
	`define TESTBENCH 1  // for both micron simulation model and Xilinx ISIM simulator
`endif

`define USE_x16 1
`define USE_SERDES 1

// `define TDQS 1

//`define RAM_SIZE_1GB
`define RAM_SIZE_2GB
//`define RAM_SIZE_4GB

`ifndef FORMAL
	`ifdef HIGH_SPEED
		
		// for lattice ECP5 FPGA
		//`define LATTICE 1

		// for Xilinx Spartan-6 FPGA
		`define XILINX 1

		// for Altera MAX-10 FPGA
		//`define ALTERA 1
		
	`endif
`endif

//`ifndef XILINX
/* verilator lint_off VARHIDDEN */
localparam NUM_OF_DDR_STATES = 23;

// TIME_TZQINIT = 512
// See also 'COUNTER_INCREMENT_VALUE' on why some of the large timing variables are not used in this case
localparam MAX_WAIT_COUNT = 512;
/* verilator lint_on VARHIDDEN */
//`endif

// write data to RAM and then read them back from RAM
`define LOOPBACK 1
`ifdef LOOPBACK
	`ifndef FORMAL
		`ifndef MICRON_SIM	
			// data loopback requires internal logic analyzer (ILA) capability to check data integrity
			`define USE_ILA 1
		`endif
	`endif
`endif


// https://www.systemverilog.io/ddr4-basics
module ddr3_memory_controller
#(
	parameter NUM_OF_WRITE_DATA = 32,  // 32 pieces of data are to be written to DRAM
	parameter NUM_OF_READ_DATA = 32,  // 32 pieces of data are to be read from DRAM
	parameter DATA_BURST_LENGTH = 8,  // eight data transfers per burst activity, please modify MR0 setting if none other than BL8

	`ifdef USE_SERDES
		// why 8 ? because of FPGA development board is using external 50 MHz crystal
		// and the minimum operating frequency for Micron DDR3 memory is 303MHz
		parameter SERDES_RATIO = 8,
	`endif

	parameter PICO_TO_NANO_CONVERSION_FACTOR = 1000,  // 1ns = 1000ps

	`ifndef HIGH_SPEED
		parameter PERIOD_MARGIN = 10,  // 10ps margin
		parameter MAXIMUM_CK_PERIOD = 3300-PERIOD_MARGIN,  // 3300ps which is defined by Micron simulation model	
		parameter DIVIDE_RATIO = 4,  // master 'clk' signal is divided by 4 for DDR outgoing 'ck' signal, it is for 90 degree phase shift purpose.
		parameter DIVIDE_RATIO_HALVED = (DIVIDE_RATIO >> 1),
		
		// host clock period in ns
		// clock period of 'clk' = 0.8225ns , clock period of 'ck' = 3.3ns
		parameter CLK_PERIOD = $itor(MAXIMUM_CK_PERIOD/DIVIDE_RATIO)/$itor(PICO_TO_NANO_CONVERSION_FACTOR),
	`else
		parameter CLK_PERIOD = 20,  // 20ns, 50MHz
		parameter CLK_SERDES_PERIOD = 12,  // 12ns, 83.333MHz
	`endif
		
	`ifdef TESTBENCH		
		`ifndef MICRON_SIM
			parameter PERIOD_MARGIN = 10,  // 10ps margin
			parameter MAXIMUM_CK_PERIOD = 3300-PERIOD_MARGIN,  // 3300ps which is defined by Micron simulation model		
			parameter DIVIDE_RATIO = 4,  // master 'clk' signal is divided by 4 for DDR outgoing 'ck' signal, it is for 90 degree phase shift purpose.		
		`endif
	`endif
	
	`ifdef HIGH_SPEED
		parameter CK_PERIOD = 3,  // 333.333MHz from PLL, 1/333.333MHz = 3ns
	`else
		parameter CK_PERIOD = (CLK_PERIOD*DIVIDE_RATIO),
	`endif
		
	
	// for STATE_IDLE transition into STATE_REFRESH
	// tREFI = 65*tRFC calculated using info from Micron dataheet, so tREFI > 8 * tRFC
	// So it is entirely possible to do all 8 refresh commands inside one tREFI cycle 
	// since each refresh command will take tRFC cycle to finish
	// See also https://www.systemverilog.io/understanding-ddr4-timing-parameters#refresh
	/* verilator lint_off VARHIDDEN */
	parameter MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED = 8,  // 9 commands. one executed immediately, 8 more enqueued.
	/* verilator lint_on VARHIDDEN */
	
	`ifdef USE_x16
		parameter DQS_BITWIDTH = 2,
	
		`ifdef RAM_SIZE_1GB
			parameter ADDRESS_BITWIDTH = 13,
			
		`elsif RAM_SIZE_2GB
			parameter ADDRESS_BITWIDTH = 14,
			
		`elsif RAM_SIZE_4GB
			parameter ADDRESS_BITWIDTH = 15,
		`endif
	`else
		parameter DQS_BITWIDTH = 1,	
		
		`ifdef RAM_SIZE_1GB
			parameter ADDRESS_BITWIDTH = 14,
			
		`elsif RAM_SIZE_2GB
			parameter ADDRESS_BITWIDTH = 15,
			
		`elsif RAM_SIZE_4GB
			parameter ADDRESS_BITWIDTH = 16,
		`endif
	`endif
	
	parameter BANK_ADDRESS_BITWIDTH = 3,  //  8 banks, and $clog2(8) = 3
	
	`ifdef USE_x16
		parameter DQ_BITWIDTH = 16  // bitwidth for each piece of data
	`else
		parameter DQ_BITWIDTH = 8  // bitwidth for each piece of data
	`endif
)
(
	// these are FPGA internal signals
	input clk,
	input reset,
	input write_enable,  // write to DDR memory
	input read_enable,  // read from DDR memory
	input [BANK_ADDRESS_BITWIDTH+ADDRESS_BITWIDTH-1:0] i_user_data_address,  // the DDR memory address for which the user wants to write/read the data
	`ifdef USE_SERDES
		input [DQ_BITWIDTH*SERDES_RATIO-1:0] data_to_ram,  // data for which the user wants to write to DDR
		output [DQ_BITWIDTH*SERDES_RATIO-1:0] data_from_ram,  // the requested data from DDR RAM after read operation
	`else
		// TWO pieces of data bundled together due to double-data-rate requirement of DQ signal
		input  [(DQ_BITWIDTH << 1)-1:0] data_to_ram,  // data to be written to DDR RAM
		output [(DQ_BITWIDTH << 1)-1:0] data_from_ram,  // the requested data being read from DDR RAM read operation
	`endif
	
	input [$clog2(MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED):0] user_desired_extra_read_or_write_cycles,  // for the purpose of postponing refresh commands
	
	`ifndef HIGH_SPEED
		output clk_slow_posedge,  // for dq phase shifting purpose
		output clk180_slow_posedge,  // for dq phase shifting purpose
	`endif
	
	
	// these are to be fed into external DDR3 memory
	output [ADDRESS_BITWIDTH-1:0] address,
	output [BANK_ADDRESS_BITWIDTH-1:0] bank_address,
	
	`ifdef HIGH_SPEED
		output ck_obuf,  // CK
		output ck_n_obuf, // CK#		
	`else
		output ck,  // CK
		output ck_n, // CK#
	`endif

	`ifdef TESTBENCH
		output ck_90,
		output ck_270,
		
		output [DQ_BITWIDTH-1:0] dq_iobuf_enable,
		output ldqs_iobuf_enable,
		output udqs_iobuf_enable,
	`endif
	
	output reg data_read_is_ongoing,	
	
	`ifdef HIGH_SPEED
		output clk_serdes_data,  // 83.333MHz with 270 phase shift
		output clk_serdes,  // 83.333MHz with 45 phase shift
		output ck_180,  // 333.333MHz with 180 phase shift
		output reg locked_previous,
		output need_to_assert_reset,
	`endif
			
	output ck_en, // CKE
	output cs_n, // chip select signal
	output odt, // on-die termination
	output ras_n, // RAS#
	output cas_n, // CAS#
	output we_n, // WE#
	output reset_n,
	
	inout [DQ_BITWIDTH-1:0] dq, // Data input/output

	// for coordinating with the user application on when to start DRAM write and read operation
	output reg [$clog2(NUM_OF_DDR_STATES)-1:0] main_state,
	output reg [$clog2(MAX_WAIT_COUNT):0] wait_count,
	
// Xilinx ILA could not probe port IO of IOBUF primitive, but could probe rest of the ports (ports I, O, and T)
`ifdef USE_ILA
	output [DQ_BITWIDTH-1:0] dq_w,  // port I
	output [DQ_BITWIDTH-1:0] dq_r,  // port O

	output low_Priority_Refresh_Request,
	output high_Priority_Refresh_Request,

	// to propagate 'write_enable' and 'read_enable' signals during STATE_IDLE to STATE_WRITE and STATE_READ
	output reg write_is_enabled,
	output reg read_is_enabled,
	
	output reg [$clog2(MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED):0] refresh_Queue,
	
	`ifndef HIGH_SPEED
	output reg [($clog2(DIVIDE_RATIO_HALVED)-1):0] dqs_counter,
	`endif
	
	output dqs_rising_edge,
	output dqs_falling_edge,
`endif

`ifdef USE_x16
	output ldm,  // lower-byte data mask
	output udm, // upper-byte data mask
	inout ldqs, // lower byte data strobe
	inout ldqs_n,
	inout udqs, // upper byte data strobe
	inout udqs_n
`else
	inout [DQS_BITWIDTH-1:0] dqs, // Data strobe
	inout [DQS_BITWIDTH-1:0] dqs_n,
	
	// driven to high-Z if TDQS termination function is disabled 
	// according to TN-41-06: DDR3 Termination Data Strobe (TDQS)
	// Please as well look at TN-41-04: DDR3 Dynamic On-Die Termination Operation 
	`ifdef TDQS
	inout [DQS_BITWIDTH-1:0] tdqs, // Termination data strobe, but can act as data-mask (DM) when TDQS function is disabled
	`else
	output [DQS_BITWIDTH-1:0] tdqs,
	`endif
	inout [DQS_BITWIDTH-1:0] tdqs_n
`endif
);

// When writes are done on bus with a data-width > 8, you are doing a single write for multiple bytes and 
// then need to be able to indicate which bytes are valid and need to be updated in memory, 
// which bytes should be ignored. That's the purpose of DM.
// It is allowed to have DM always pulled low (some boards are wired like this) but will make you loose 
// the byte granularity on writes, your granularity is then on DRAM's burst words.
// DM is just here to have byte granularity on the write accesses 
// (ie you only want to update some bytes of the DRAM word)

`ifndef USE_x16
	`ifndef TDQS
	assign tdqs = 0;  // acts as DM
	`endif
`endif

/*
reg previous_clk_en;
always @(posedge clk) 
begin
	if(reset) previous_clk_en <= 0;
	
	previous_clk_en <= clk_en;
end
*/


// Commands truth table extracted from Micron specification document
/*
localparam MRS = (previous_clk_en) & (ck_en) & (~cs_n) & (~ras_n) & (~cas_n) & (~we_n);
localparam REF = (previous_clk_en) & (ck_en) & (~cs_n) & (~ras_n) & (~cas_n) & (we_n);
localparam PRE = (previous_clk_en) & (ck_en) & (~cs_n) & (~ras_n) & (cas_n) & (~we_n) & (~A10);
localparam PREA = (previous_clk_en) & (ck_en) & (~cs_n) & (~ras_n) & (cas_n) & (~we_n) & (A10);
localparam ACT = (previous_clk_en) & (ck_en) & (~cs_n) & (~ras_n) & (cas_n) & (we_n);
localparam WR = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (~we_n) & (~A10);
localparam WRS4 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (~we_n) & (~A12) & (~A10);
localparam WRS8 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (~we_n) & (A12) & (~A10);
localparam WRAP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (~we_n) & (A10);
localparam WRAPS4 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (~we_n) & (~A12) & (A10);
localparam WRAPS8 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (~we_n) & (A12) & (A10);
localparam RD = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (we_n) & (~A10);
localparam RDS4 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (we_n) & (~A12) & (~A10);
localparam RDS8 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (we_n) & (A12) & (~A10);
localparam RDAP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (we_n) & (A10);
localparam RDAPS4 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (we_n) & (~A12) & (A10);
localparam RDAPS8 = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (~cas_n) & (we_n) & (A12) & (A10);
localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
localparam DES = (previous_clk_en) & (ck_en) & (cs_n);
localparam PDE = (previous_clk_en) & (~ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
localparam PDX = (~previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
localparam ZQCL = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (~we_n) & (A10);
localparam ZQCS = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (~we_n) & (~A10);
*/


// for the purpose of calculating DDR timing parameters such as tXPR, tRFC, ...
//reg [$clog2(MAX_WAIT_COUNT):0] wait_count;

// to synchronize signal in clk_serdes domain to ck_180 domain
wire [$clog2(MAX_WAIT_COUNT):0] wait_count_ck_180;
wire [$clog2(NUM_OF_DDR_STATES)-1:0] main_state_ck_180;

//reg [$clog2(NUM_OF_DDR_STATES)-1:0] main_state;
reg [$clog2(NUM_OF_DDR_STATES)-1:0] previous_main_state;
reg [$clog2(NUM_OF_DDR_STATES)-1:0] previous_main_state_ck_180;


// for PLL lock issue
reg [$clog2(NUM_OF_DDR_STATES)-1:0] state_to_be_restored;


localparam STATE_RESET = 0;
localparam STATE_RESET_FINISH = 1;
localparam STATE_ZQ_CALIBRATION = 23;
localparam STATE_IDLE = 24;
localparam STATE_ACTIVATE = 5;
localparam STATE_WRITE = 6;
localparam STATE_WRITE_AP = 7;
localparam STATE_WRITE_DATA = 8;
localparam STATE_READ = 9;
localparam STATE_READ_AP = 10;
localparam STATE_READ_DATA = 3;  // smaller value to solve setup timing issue due to lesser comparison hardware
localparam STATE_PRECHARGE = 12;
localparam STATE_REFRESH = 13;
localparam STATE_WRITE_LEVELLING = 14;
localparam STATE_INIT_CLOCK_ENABLE = 15;
localparam STATE_INIT_MRS_2 = 16;
localparam STATE_INIT_MRS_3 = 17;
localparam STATE_INIT_MRS_1 = 18;
localparam STATE_INIT_MRS_0 = 19;
localparam STATE_WAIT_AFTER_MPR = 20;
localparam STATE_MRS3_TO_MRS1 = 21;
localparam STATE_PLL_LOCK_ISSUE = 22;
localparam STATE_READ_ACTUAL = 2;
localparam STATE_READ_AP_ACTUAL = 4;


// https://www.systemverilog.io/understanding-ddr4-timing-parameters
// TIME_INITIAL_CK_INACTIVE
localparam MAX_TIMING = (500000/CLK_SERDES_PERIOD);  // just for initial development stage, will refine the value later

// just to avoid https://github.com/YosysHQ/yosys/issues/2718
`ifndef XILINX
	localparam FIXED_POINT_BITWIDTH = $clog2(MAX_TIMING);
`else
	localparam FIXED_POINT_BITWIDTH = 18;
`endif


`ifdef FORMAL

	// just to make the cover() spends lesser time to complete
	localparam TIME_INITIAL_RESET_ACTIVE = 2;
	localparam TIME_INITIAL_CK_INACTIVE = 2;
	localparam TIME_TZQINIT = 2;
	localparam TIME_RL = 2;
	localparam TIME_WL = 2;
	localparam TIME_TBURST = 2;
	localparam TIME_TXPR = 2;
	localparam TIME_TMRD = 2;
	localparam TIME_TMOD = 2;
	localparam TIME_TRFC = 2;
	localparam TIME_TREFI = 2;
	localparam TIME_TDLLK = 2;

`else
	
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_INITIAL_RESET_ACTIVE = (200000/CLK_SERDES_PERIOD);  // 200us = 200000ns, After the power is stable, RESET# must be LOW for at least 200µs to begin the initialization process.
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_INITIAL_CK_INACTIVE = (500000/CLK_SERDES_PERIOD);  // 500us = 500000ns, After RESET# transitions HIGH, wait 500µs (minus one clock) with CKE LOW.

	`ifdef RAM_SIZE_1GB
		localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TRFC = (110/CLK_SERDES_PERIOD);  // minimum 110ns, Delay between the REFRESH command and the next valid command, except DES
		localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TXPR = ((10+110)/CLK_SERDES_PERIOD);  // https://i.imgur.com/SAqPZzT.png, min. (greater of(10ns+tRFC = 120ns, 5 clocks))

	`elsif RAM_SIZE_2GB
		localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TRFC = (160/CLK_SERDES_PERIOD);
		localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TXPR = ((10+160)/CLK_SERDES_PERIOD);  // https://i.imgur.com/SAqPZzT.png, min. (greater of(10ns+tRFC = 170ns, 5 clocks))

	`elsif RAM_SIZE_4GB
		localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TRFC = (260/CLK_SERDES_PERIOD);
		localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TXPR = ((10+260)/CLK_SERDES_PERIOD);  // https://i.imgur.com/SAqPZzT.png, min. (greater of(10ns+tRFC = 270ns, 5 clocks))
	`endif

	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TREFI = (7800/CLK_SERDES_PERIOD);  // 7.8?s = 7800ns, Maximum average periodic refresh
	
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TRAS = (35/CLK_SERDES_PERIOD);  // minimum 35ns, ACTIVATE-to-PRECHARGE command period
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TRP = (13.91/CLK_SERDES_PERIOD);  // minimum 13.91ns, Precharge time. The banks have to be precharged and idle for tRP before a REFRESH command can be applied
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TRCD = (13.91/CLK_SERDES_PERIOD);  // minimum 13.91ns, Time RAS-to-CAS delay, ACT to RD/WR
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TWR = (15/CLK_SERDES_PERIOD);  // Minimum 15ns, Write recovery time is the time interval between the end of a write data burst and the start of a precharge command.  It allows sense amplifiers to restore data to cells.
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TFAW = (50/CLK_SERDES_PERIOD);  // Minimum 50ns, Why Four Activate Window, not Five or Eight Activate Window ?  For limiting high current drain over the period of tFAW time interval
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TIS = (0.195/CLK_SERDES_PERIOD);  // Minimum 195ps, setup time
		
		
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TDLLK = (512*CK_PERIOD/CLK_SERDES_PERIOD);  // tDLLK = 512 clock cycles, DLL locking time
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TZQINIT = (512*CK_PERIOD/CLK_SERDES_PERIOD);  // tZQINIT = 512 clock cycles, ZQCL command calibration time for POWER-UP and RESET operation
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_RL = (5*CK_PERIOD/CLK_SERDES_PERIOD);  // if DLL is disable, only CL=6 is supported.  Since AL=0 for simplicity and RL=AL+CL , RL=5
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_WL = (5*CK_PERIOD/CLK_SERDES_PERIOD);  // if DLL is disable, only CWL=6 is supported.  Since AL=0 for simplicity and WL=AL+CWL , WL=5
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TBURST = ((DATA_BURST_LENGTH >> 1)*CK_PERIOD/CLK_SERDES_PERIOD);  // each read or write commands will work on 8 different pieces of consecutive data.  In other words, burst length is 8, and tburst = burst_length/2 with double data rate mechanism
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TMRD = (4*CK_PERIOD/CLK_SERDES_PERIOD);  // tMRD = 4 clock cycles, Time MRS to MRS command Delay
	localparam [FIXED_POINT_BITWIDTH-1:0] TIME_TMOD = (12*CK_PERIOD/CLK_SERDES_PERIOD);  // tMOD = 12 clock cycles, Time MRS to non-MRS command Delay

`endif

localparam TIME_TWTR = 4;  // Delay from start of internal WRITE transaction to internal READ command, MIN = greater of 4CK or 7.5ns;

localparam TIME_TDAL = TIME_TWR + TIME_TRP;  // Auto precharge write recovery + precharge time
localparam TIME_TRPRE = 1;  // this is for read pre-amble. It is the time between when the data strobe goes from non-valid (HIGH) to valid (LOW, initial drive level).
localparam TIME_TRPST = 1;  // this is for read post-amble. It is the time from when the last valid data strobe to when the strobe goes to HIGH, non-drive level.
localparam TIME_TWPRE = 1;  // this is for write pre-amble. It is the time between when the data strobe goes from non-valid (HIGH) to valid (LOW, initial drive level).
localparam TIME_TWPST = 1;  // this is for write post-amble. It is the time from when the last valid data strobe to when the strobe goes to HIGH, non-drive level.
localparam TIME_TMPRR = 1;  // this is for MPR System Read Calibration.  It is the time between MULTIPURPOSE REGISTER READ burst end until mode register set for multipurpose register exit

localparam TIME_WRITE_COMMAND_TO_DQS_VALID = TIME_WL-TIME_TWPRE;  // time between write command and valid DQS
localparam TIME_TCCD = (4*CK_PERIOD/CLK_SERDES_PERIOD);  // CAS#-to-CAS# command delay, applicable for consecutive DRAM write or read operations

localparam ADDRESS_FOR_MODE_REGISTER_0 = 0;
localparam ADDRESS_FOR_MODE_REGISTER_1 = 1;
localparam ADDRESS_FOR_MODE_REGISTER_2 = 2;
localparam ADDRESS_FOR_MODE_REGISTER_3 = 3;


// Mode register 0 (MR0) settings
localparam MR0 = 2'b00;  // Mode register set 0
localparam PRECHARGE_PD = 1'b1;  // DLL on
localparam WRITE_RECOVERY = 3'b010;   // WR = 6 , WR (cycles) = roundup (tWR [ns]/tCK [ns])
localparam DLL_RESET = 1'b1;
localparam CAS_LATENCY_46 = 3'b001;
localparam CAS_LATENCY_2 = 1'b0;
localparam CAS_LATENCY = {CAS_LATENCY_46, CAS_LATENCY_2};  // CL = 5
localparam READ_BURST_TYPE = 1'b0;  // sequential burst
localparam BURST_LENGTH = 2'b0;  // Fixed BL8
							
// Mode register 1 (MR1) settings
localparam MR1 = 2'b01;  // Mode register set 1
localparam Q_OFF = 1'b0;  // Output enabled
localparam TDQS = 1'b0;  // TDQS disabled (x8 configuration only)
localparam RTT_9 = 1'b0;
localparam RTT_6 = 1'b0;
localparam RTT_2 = 1'b0;
localparam RTT = {RTT_9, RTT_6, RTT_2};  // on-die termination resistance value
localparam WL = 1'b0;  // Write levelling disabled
localparam ODS_5 = 1'b0;
localparam ODS_2 = 1'b1;
localparam ODS = {ODS_5, ODS_2};  // Output drive strength set at 34 ohm
localparam AL = 2'b0;  // Additive latency disabled
localparam DLL_EN = 1'b0;  // DLL is enabled

// Mode register 3 (MR3) settings
localparam MPR_EN = 1'b1;  // enables or disables Dataflow from MPR, in most cases it is a must to enable
localparam MPR_READ_FUNCTION = 2'b0;  // Predefined data pattern for READ synchronization
localparam MPR_BITWIDTH_COMBINED = 3;  // the three least-significant-bits of MR3

localparam A10 = 10;  // address bit for auto-precharge option
localparam A12 = 12;  // address bit for burst-chop option

localparam HIGH_REFRESH_QUEUE_THRESHOLD = 4;


reg MPR_ENABLE, MPR_Read_had_finished;  // for use within MR3 finite state machine


`ifndef USE_ILA
	wire [DQ_BITWIDTH-1:0] dq_w;  // the output data stream is NOT serialized
`endif

`ifndef USE_ILA
	wire [DQ_BITWIDTH-1:0] dq_r;  // the input data stream is NOT serialized
`endif

// incoming signals from RAM
`ifdef USE_x16
	wire ldqs_r;
	wire ldqs_n_r;
	wire udqs_r;
	wire udqs_n_r;
`else
	wire dqs_r;
	wire dqs_n_r;
`endif

// outgoing signals to RAM
`ifdef USE_x16
	wire ldqs_w;
	wire ldqs_n_w;
	wire udqs_w;
	wire udqs_n_w;	
`else
	wire dqs_w;
	wire dqs_n_w;
`endif
	
`ifndef HIGH_SPEED

	// Purposes of Clock divider:
	// 1. for developing correct logic first before making the DDR memory controller works in higher frequency,
	// 2. to perform 90 degree phase shift on DQ signal with relative to DQS signal during data writing stage
	// 3. to perform 180 degree phase shift (DDR mechanism of both DQS and DQ signals need to work on 
	//	  both posedge and negedge clk) for the next consecutive data

	// See https://i.imgur.com/dnDwZul.png or 
	// https://www.markimicrowave.com/blog/top-7-ways-to-create-a-quadrature-90-phase-shift/
	// See https://i.imgur.com/ZnBuofE.png or
	// https://patentimages.storage.googleapis.com/0e/94/46/6fdcafc946e940/US5297181.pdf#page=3
	// Will use digital PLL or https://stackoverflow.com/a/50172237/8776167 in later stage of the project

	// See https://www.edaplayground.com/x/gXC for waveform simulation of the clock divider
	reg clk_slow;

	reg [($clog2(DIVIDE_RATIO_HALVED)-1):0] counter;

	reg counter_reset;

	always @(posedge clk)
	begin
		if(reset) counter_reset <= 1;

	`ifndef XILINX	
		else counter_reset <= (counter == DIVIDE_RATIO_HALVED[0 +: $clog2(DIVIDE_RATIO_HALVED)] - 1'b1);
	`else
		else counter_reset <= (counter == DIVIDE_RATIO_HALVED[0 +: 1] - 1'b1);
	`endif
	end

	always @(posedge clk)
	begin
		if(reset) counter <= 0;
		
		else if(counter_reset) counter <= 1;
		
		else counter <= counter + 1;
	end

	always @(posedge clk)
	begin
		if(reset) clk_slow <= 1;
		
		else if(counter_reset)
		  	clk_slow <= ~clk_slow;
	end

	assign ck = clk_slow;
	assign ck_n = ~clk_slow;

	wire clk90_slow_is_at_high = (~clk_slow && counter_reset) || (clk_slow && ~counter_reset);
	wire clk90_slow_is_at_low = (clk_slow && counter_reset) || (~clk_slow && ~counter_reset);
	wire clk90_slow_posedge = (clk_slow && counter_reset);
	assign clk_slow_posedge = (clk_slow && ~counter_reset);
	wire clk_slow_negedge = (~clk_slow && ~counter_reset);
	wire clk180_slow = ~clk_slow;  // simply inversion of the clk_slow signal will give 180 degree phase shift
	assign clk180_slow_posedge = clk_slow_negedge;

	`ifdef USE_x16
		assign ldqs_w = clk_slow;
		assign ldqs_n_w = ~clk_slow;
		assign udqs_w = clk_slow;
		assign udqs_n_w = ~clk_slow;		
	`else
		assign dqs_w = clk_slow;
		assign dqs_n_w = ~clk_slow;
	`endif

`else

	// wire clk_serdes_data;
	// wire clk_serdes;
	wire ck, ck_out;
	
	`ifndef TESTBENCH
		wire ck_90;
		wire ck_270;
	`endif
	
	wire ck_180_out;
	wire locked;

	// for dynamic phase shift
	reg psen;
	wire psdone;
	wire ck_dynamic_90, ck_dynamic_270;
	wire locked_dynamic;
		
	`ifdef XILINX							

		// For Artix-7, see https://www.reddit.com/r/FPGA/comments/u8kno6/place_30574_poor_placement_for_routing_between_an/
		
		pll_ddr pll_static_clocks
		(	// Clock in ports
			.clk(clk),  // IN 50MHz(Spartan-6 board), 100MHz(Artix-7 board)
			
			// Clock out ports
			
			// SERDES_RATIO = 8, but 2 separate serdes are used due to double-data-rate restriction
			// So, 333.333MHz divided by (SERDES_RATIO >> 1) equals 83.333MHz
			.clk_serdes_data(clk_serdes_data),  // OUT 83.333MHz, 270 phase shift, for DRAM data
			.clk_serdes(clk_serdes),  // OUT 83.333MHz, 45 phase shift, for DRAM command
			
			.ck(ck),  // OUT 333.333MHz, 0 phase shift
			.ck_90(ck_90),  // OUT 333.333MHz, 90 phase shift, for dq phase shifting purpose
			.ck_180(ck_180),  // OUT 333.333MHz, 180 phase shift
			.ck_270(ck_270),  // OUT 333.333MHz, 270 phase shift, for dq phase shifting purpose
			
			// Status and control signals
			.reset(reset),  // IN
			.locked(locked)  // OUT
		);
		
		localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_DOMAIN = 4;
		
		// to synchronize signal in ck_180 domain to ck domain
		reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_DOMAIN-1:0] data_read_is_ongoing_ck;
		
		reg data_read_is_ongoing_previous;
		always @(posedge ck)
			data_read_is_ongoing_previous <= data_read_is_ongoing_ck;
		
		reg psdone_previous;
		always @(posedge ck) psdone_previous <= psdone;
		
		always @(posedge ck)
		begin
			// triggers the first phase shift enable request only during the start of read operation
			if(~data_read_is_ongoing_previous && data_read_is_ongoing_ck) psen <= 1;
			
			// Phase shifting is like changing PLL settings, so need to wait for new PLL lock in order to avoid
			// Warning : Please wait for PSDONE signal before adjusting the Phase Shift
			// asserts psen signal only when psdone is asserted low after asserted high previously			
			else if(psdone_previous && ~psdone) psen <= psdone;
			
			// assert PSEN for one PSCLK cycle only and then wait for PSDONE to assert before performing
			// another phase shift operation. Asserting PSEN for more than one PSCLK cycle can cause the DCM 
			// to phase shift in an unpredictable manner.
			else psen <= 0;
		end

		localparam PLL_STATUS_BITWIDTH = 3;
		
		`ifndef VIVADO
		wire [PLL_STATUS_BITWIDTH-1:0] pll_read_status;
		wire input_clk_stopped;
		wire clk_valid;
		`endif

		// dynamic phase shift for incoming DQ bits		
		pll_tuneable pll_read
		(	// Clock in ports
			.clk(clk),  // IN 50MHz
			
			// Clock out ports
			.ck_dynamic_90(ck_dynamic_90),  // OUT 333.333MHz, 90 phase shift, incoming DQ bit is not phase shifted
			.ck_dynamic_270(ck_dynamic_270),  // OUT 333.333MHz, 270 phase shift
								
			// Dynamic phase shift ports
			.psclk(udqs_r),  // IN
			.psen(psen),  // IN
			.psincdec(1'b1),     // IN
			.psdone(psdone),       // OUT
			
			// Status and control signals
			.reset(reset),  // IN
			
			`ifdef VIVADO
			.locked_dynamic(locked_dynamic)  // OUT
			
			`else
			.locked_dynamic(locked_dynamic),  // OUT
			.status(pll_read_status),  // OUT
			.input_clk_stopped(input_clk_stopped),  // OUT
			.clk_valid(clk_valid)  // OUT
			`endif
		);


		// There is need for OBUF because if otherwise, the output of ODDR2_ck_out would be connected to 
		// FPGA fabric which is not allowed

		OBUF #(
			.DRIVE(12),  // Specify the output drive strength
			.IOSTANDARD("LVCMOS25"),  // Specify the output I/O standard
			.SLEW("SLOW")  // Specify the output slew rate
		)
		OBUF_ck (
			.O(ck_obuf),  // Buffer output (connect directly to FPGA I/O pad)
			.I(ck_out)   // Buffer input
		);

		OBUF #(
			.DRIVE(12),  // Specify the output drive strength
			.IOSTANDARD("LVCMOS25"),  // Specify the output I/O standard
			.SLEW("SLOW")  // Specify the output slew rate
		)
		OBUF_ck_n (
			.O(ck_n_obuf),  // Buffer output (connect directly to FPGA I/O pad)
			.I(ck_180_out)   // Buffer input
		);
				

		// ODDR2: Input Double Data Rate Output Register with Set, Reset and Clock Enable.
		// Spartan-6
		// Xilinx HDL Libraries Guide, version 14.7

		// As for why 'ck' and 'ck_180' signals are implemented using ODDR2 primitive,
		// see https://forums.xilinx.com/t5/Other-FPGA-Architecture/Place-1198-Error-Route-cause-and-possible-solution/m-p/408489/highlight/true#M34528
		
		ODDR2 #(
			.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
			.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
		)
		ODDR2_ck_out(
			.Q(ck_out),  // 1-bit DDR output data
			.C0(ck),  // 1-bit clock input
			.C1(ck),  // 1-bit clock input
			.CE(1'b1),  // 1-bit clock enable input
			.D0(1'b1),    // 1-bit DDR data input (associated with C0)
			.D1(1'b0),    // 1-bit DDR data input (associated with C1)			
			.R(1'b0),    // 1-bit reset input
			.S(1'b0)     // 1-bit set input
		);

		ODDR2 #(
			.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
			.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
		)
		ODDR2_ck_180_out(
			.Q(ck_180_out),  // 1-bit DDR output data
			.C0(ck_180),  // 1-bit clock input
			.C1(ck_180),  // 1-bit clock input
			.CE(1'b1),  // 1-bit clock enable input
			.D0(1'b1),    // 1-bit DDR data input (associated with C0)
			.D1(1'b0),    // 1-bit DDR data input (associated with C1)			
			.R(1'b0),    // 1-bit reset input
			.S(1'b0)     // 1-bit set input
		);
		
		
		// DQS signals are of double-data-rate signals
		
		`ifdef USE_x16
		
			ODDR2 #(
				.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
				.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
				.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
			)
			ODDR2_ldqs_w(
				.Q(ldqs_w),  // 1-bit DDR output data
				.C0(ck),  // 1-bit clock input
				.C1(ck_180),  // 1-bit clock input
				.CE(1'b1),  // 1-bit clock enable input
				.D0(1'b1),    // 1-bit DDR data input (associated with C0)
				.D1(1'b0),    // 1-bit DDR data input (associated with C1)			
				.R(1'b0),    // 1-bit reset input
				.S(1'b0)     // 1-bit set input
			);

			ODDR2 #(
				.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
				.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
				.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
			)
			ODDR2_udqs_w(
				.Q(udqs_w),  // 1-bit DDR output data
				.C0(ck),  // 1-bit clock input
				.C1(ck_180),  // 1-bit clock input
				.CE(1'b1),  // 1-bit clock enable input
				.D0(1'b1),    // 1-bit DDR data input (associated with C0)
				.D1(1'b0),    // 1-bit DDR data input (associated with C1)			
				.R(1'b0),    // 1-bit reset input
				.S(1'b0)     // 1-bit set input
			);
			
			ODDR2 #(
				.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
				.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
				.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
			)
			ODDR2_ldqs_n_w(
				.Q(ldqs_n_w),  // 1-bit DDR output data
				.C0(ck),  // 1-bit clock input
				.C1(ck_180),  // 1-bit clock input
				.CE(1'b1),  // 1-bit clock enable input
				.D0(1'b0),    // 1-bit DDR data input (associated with C0)
				.D1(1'b1),    // 1-bit DDR data input (associated with C1)			
				.R(1'b0),    // 1-bit reset input
				.S(1'b0)     // 1-bit set input
			);

			ODDR2 #(
				.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
				.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
				.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
			)
			ODDR2_udqs_n_w(
				.Q(udqs_n_w),  // 1-bit DDR output data
				.C0(ck),  // 1-bit clock input
				.C1(ck_180),  // 1-bit clock input
				.CE(1'b1),  // 1-bit clock enable input
				.D0(1'b0),    // 1-bit DDR data input (associated with C0)
				.D1(1'b1),    // 1-bit DDR data input (associated with C1)			
				.R(1'b0),    // 1-bit reset input
				.S(1'b0)     // 1-bit set input
			);

		`else
		
			ODDR2 #(
				.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
				.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
				.SRTYPE("SYNC")  // Specifies "SYNC" or "ASYNC" set/reset
			)
			ODDR2_dqs_w(
				.Q(dqs_w),  // 1-bit DDR output data
				.C0(ck),  // 1-bit clock input
				.C1(ck_180),  // 1-bit clock input
				.CE(1'b1),  // 1-bit clock enable input
				.D0(1'b1),    // 1-bit DDR data input (associated with C0)
				.D1(1'b0),    // 1-bit DDR data input (associated with C1)			
				.R(1'b0),    // 1-bit reset input
				.S(1'b0)     // 1-bit set input
			);
			
			ODDR2 #(
				.DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
				.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
				.SRTYPE("SYNC")  // Specifies "SYNC" or "ASYNC" set/reset
			)
			ODDR2_dqs_n_w(
				.Q(dqs_n_w),  // 1-bit DDR output data
				.C0(ck),  // 1-bit clock input
				.C1(ck_180),  // 1-bit clock input
				.CE(1'b1),  // 1-bit clock enable input
				.D0(1'b1),    // 1-bit DDR data input (associated with C0)
				.D1(1'b0),    // 1-bit DDR data input (associated with C1)			
				.R(1'b0),    // 1-bit reset input
				.S(1'b0)     // 1-bit set input
			);		
		
		`endif
		
	`elsif ALTERA

		pll_ddr pll_static_clocks
		(	// Clock in ports
			.inclk0(clk),  // IN 50MHz
			
			// Clock out ports
			//.clk_pll(clk_pll),  // OUT 83.333MHz, 45 phase shift, for solving STA issues
			
			// SERDES_RATIO = 8, but 2 separate serdes are used due to double-data-rate restriction
			// So, 333.333MHz divided by (SERDES_RATIO >> 1) equals 83.333MHz
			.c4(clk_serdes),  // OUT 83.333MHz, 45 phase shift, for SERDES use
			
			.c0(ck),  // OUT 333.333MHz, 0 phase shift
			.c1(ck_90),  // OUT 333.333MHz, 90 phase shift, for dq phase shifting purpose
			.c2(ck_180),  // OUT 333.333MHz, 180 phase shift
			.c3(ck_270),  // OUT 333.333MHz, 270 phase shift, for dq phase shifting purpose
			
			// Status and control signals
			.areset(reset),  // IN
			.locked(locked)  // OUT
		);
	
		// dynamic phase shift for incoming DQ bits	
		pll_tuneable 
		(
			.areset(reset),  // IN
			.inclk0(clk),  // IN 50 MHz
			.pfdena(1'b1),  // IN
			.phasecounterselect(udqs_r),  // IN
			.phasestep(psen),  // IN
			.phaseupdown(1'b1),  // IN
			.scanclk(clk),  // IN
			.c0(ck_dynamic_90),  // OUT 333.333MHz, 90 phase shift, incoming DQ bit is not phase shifted
			.c1(ck_dynamic_270),  // OUT 333.333MHz, 270 phase shift
			.locked(locked_dynamic),  // OUT
			.phasedone(psdone)  // OUT
		);
	
	`endif
`endif


// See https://www.micron.com/-/media/client/global/documents/products/technical-note/dram/tn4605.pdf#page=7
// for an overview on DQS Preamble and Postamble bits

`ifndef HIGH_SPEED
	wire [(DQ_BITWIDTH >> 1)-1:0] ldq_w;
	wire [(DQ_BITWIDTH >> 1)-1:0] udq_w;

	reg dqs_is_at_high_previously;
	reg dqs_is_at_low_previously;

	`ifndef USE_ILA
		`ifdef USE_x16
			wire dqs_is_at_high = (ldqs_r & ~ldqs_n_r) || (udqs_r & ~udqs_n_r);
			wire dqs_is_at_low = (~ldqs_r & ldqs_n_r) || (~udqs_r & udqs_n_r);
		`else
			wire dqs_is_at_high = (dqs & ~dqs_n);
			wire dqs_is_at_low = (~dqs & dqs_n);
		`endif
		
		wire dqs_rising_edge = (dqs_is_at_low_previously && dqs_is_at_high);
		wire dqs_falling_edge = (dqs_is_at_high_previously && dqs_is_at_low);
	`else
		`ifdef USE_x16
			assign dqs_is_at_high = (ldqs_r & ~ldqs_n_r) || (udqs_r & ~udqs_n_r);
			assign dqs_is_at_low = (~ldqs_r & ldqs_n_r) || (~udqs_r & udqs_n_r);
		`else
			assign dqs_is_at_high = (dqs & ~dqs_n);
			assign dqs_is_at_low = (~dqs & dqs_n);
		`endif
		
		assign dqs_rising_edge = (dqs_is_at_low_previously && dqs_is_at_high);
		assign dqs_falling_edge = (dqs_is_at_high_previously && dqs_is_at_low);
	`endif
	

	always @(posedge clk) dqs_is_at_high_previously <= dqs_is_at_high;
	always @(posedge clk) dqs_is_at_low_previously <= dqs_is_at_low;


	// For WRITE, we have to phase-shift DQS by 90 degrees and output the phase-shifted DQS to RAM		  

	// phase-shifts the incoming dqs and dqs_n signals by 90 degrees
	// with reference to outgoing 'ck' DDR signal
	// the reason is to sample at the middle of incoming `dq` signal
	`ifndef USE_ILA
		reg [($clog2(DIVIDE_RATIO_HALVED)-1):0] dqs_counter;
	`endif

	always @(posedge clk)
	begin
		if(reset) dqs_counter <= 0;
		
		else begin
			// Due to PCB trace layout and high-speed DDR signal transmission,
			// there is no alignment to any generic clock signal that we can depend upon,
			// especially when data is coming back from the SDRAM chip.
			// Thus, we could only depend upon incoming `DQS` signal to sample 'DQ' signal
			if(dqs_rising_edge | dqs_falling_edge) dqs_counter <= 1;
			
			else if(dqs_counter > 0) 
				dqs_counter <= dqs_counter + 1;
		end
	end

	`ifndef XILINX
	wire dqs_phase_shifted = (dqs_counter == DIVIDE_RATIO_HALVED[0 +: $clog2(DIVIDE_RATIO_HALVED)]);
	`else
	wire dqs_phase_shifted = (dqs_counter == DIVIDE_RATIO_HALVED[0 +: 2]);
	`endif
	wire dqs_n_phase_shifted = ~dqs_phase_shifted;

	always @(posedge clk)
	begin
		if(reset) data_from_ram <= 0;

		// 'dq_r' is sampled at its middle (thanks to 90 degree phase shift on dqs)
		else if(dqs_phase_shifted & ~dqs_n_phase_shifted)
		begin
			`ifdef XILINX
				data_from_ram <= dq_r;
				
			`elsif LATTICE
				data_from_ram <= dq_r;
							
			`else  // Micron DDR3 simulation model
				data_from_ram <= dq;
			`endif		
		end
	end


	`ifdef USE_x16
		wire [(DQ_BITWIDTH >> 1)-1:0] ldq;
		wire [(DQ_BITWIDTH >> 1)-1:0] udq;
		assign ldq_w = data_to_ram[0 +: (DQ_BITWIDTH >> 1)];
		assign udq_w = data_to_ram[(DQ_BITWIDTH >> 1) +: (DQ_BITWIDTH >> 1)];
		assign dq_w = {udq_w, ldq_w};
	`else
		assign dq_w = data_to_ram;  // input data stream of 'data_to_ram' is NOT serialized
	`endif

`else
	
	// bitslip and IODELAY phase shift delay calibration
	// https://www.xilinx.com/support/documentation/application_notes/xapp1208-bitslip-logic.pdf#page=4
	// https://www.xilinx.com/support/documentation/sw_manuals/xilinx14_7/spartan6_hdl.pdf#page=130
	// https://www.xilinx.com/support/documentation/white_papers/wp249.pdf#page=5
	// https://www.xilinx.com/support/documentation/ip_documentation/ultrascale_memory_ip/v1_4/pg150-ultrascale-memory-ip.pdf#page=361
	// https://blog.elphel.com/2014/06/ddr3-memory-interface-on-xilinx-zynq-soc-free-software-compatible/
	// Will use Micron built-in features (Write leveling, MPR_Read_function) to facilitate skew calibration
	
	// See https://www.edaboard.com/threads/phase-detection-mechanism.398492/ for an
	// understanding on how the dynamic(real-time) phase calibration mechanism works
	/*
	phase_detector #(.D(DQ_BITWIDTH)) 			// Set the number of inputs
	pd_state_machine (
		.use_phase_detector 	(use_phase_detector),
		.busy			(busy_data),
		.valid 			(valid_data),	
		.inc_dec 		(incdec_data),	
		.reset 			(reset),	
		.gclk 			(gclk),		
		.debug_in		(debug_in),		
		.cal_master		(cal_data_master),
		.cal_slave 		(cal_data_slave),	
		.rst_out 		(rst_data),
		.ce 			(ce_data),
		.inc			(inc_data),
		.debug			(debug)
	);
	*/
	
/* PLL dynamic phase shift is used in lieu of IODELAY2 primitive
	// for phase shift alignment between READ DQS strobe and 'ck' signal
	wire delayed_dqs_r;
	
	// See https://www.xilinx.com/support/documentation/user_guides/ug381.pdf#page=73
	// Once BUSY is Low, the new delay value is operational.
	wire idelay_is_busy;
	reg idelay_is_busy_previously;
	
	always @(posedge clk_serdes) idelay_is_busy_previously <= idelay_is_busy;
	
	
	reg idelay_inc_dqs_r;
	reg idelay_counter_enable;
	
	// IODELAY2 primitive requires some initial hardware startup or warmup time
	localparam IODELAY_STARTUP_BITWIDTH = 12;  
	reg [IODELAY_STARTUP_BITWIDTH-1:0] iodelay_startup_counter;
	
	always @(posedge clk_serdes)
	begin
		if(reset) iodelay_startup_counter <= 0;
		
		else iodelay_startup_counter <= iodelay_startup_counter + 1;
	end
	
	// xilinx demo example only needs iodelay_startup_counter[IODELAY_STARTUP_BITWIDTH-1]
	// See https://github.com/promach/DDR/blob/main/phase_detector.v#L135-L137
	// It is only static calibration as of now,
	// will implement dynamic (real-time) phase calibration as project progresses
	wire idelay_cal_dqs_r = &iodelay_startup_counter;  // Wait for IODELAY to be available
			
	
	IODELAY2 #(
		.DATA_RATE      	("DDR"), 		// <SDR>, DDR
		.IDELAY_VALUE  		(0), 			// {0 ... 255}
		.IDELAY2_VALUE 		(0), 			// {0 ... 255}
		.IDELAY_MODE  		("NORMAL" ), 		// NORMAL, PCI
		.ODELAY_VALUE  		(0), 			// {0 ... 255}
		.IDELAY_TYPE   		("VARIABLE_FROM_ZERO"),// "DEFAULT", "DIFF_PHASE_DETECTOR", "FIXED", "VARIABLE_FROM_HALF_MAX", "VARIABLE_FROM_ZERO"
		.COUNTER_WRAPAROUND 	("WRAPAROUND" ), 	// <STAY_AT_LIMIT>, WRAPAROUND
		.DELAY_SRC     		("IDATAIN" ), 		// "IO", "IDATAIN", "ODATAIN"
		.SERDES_MODE   		("NONE") 		// <NONE>, MASTER, SLAVE
	)
	iodelay_dqs_r (
		.IDATAIN  		(dqs_r), 	// data from primary IOB
		.TOUT     		(), 			// tri-state signal to IOB
		.DOUT     		(), 			// output data to IOB
		.T        		(1'b1), 		// tri-state control from OLOGIC/OSERDES2
		.ODATAIN  		(1'b0), 		// data from OLOGIC/OSERDES2
		.DATAOUT  		(),  			// Delayed Data output, can only route to a register in ILOGIC
		.DATAOUT2 		(delayed_dqs_r),  // Delayed Data output, can route to fabric
		.IOCLK0   		(ck_90), 		// High speed clock for calibration
		.IOCLK1   		(ck_270), 		// High speed clock for calibration
		.CLK      		(clk), 		// Fabric clock (GCLK) for control signals
		.CAL      		(idelay_cal_dqs_r),	// Calibrate control signal
		.INC      		(idelay_inc_dqs_r), 		// Increment counter
		.CE       		(idelay_counter_enable), 		// Enable counter increment/decrement
		.RST      		(idelay_is_busy_previously & (~idelay_is_busy)),		// Reset delay line
		.BUSY      		(idelay_is_busy)	// output signal indicating sync circuit has finished / calibration has finished
	);
*/

	// RAM -> IOBUF (for inout) -> IDELAY (DQS Centering) -> IDDR2 (input DDR buffer) -> ISERDES		
	// OSERDES -> ODDR2 (output DDR buffer) -> ODELAY (DQS Centering) -> IOBUF (for inout) -> RAM
	
	//assign dqs_r = (udqs_r | ldqs_r);	
	assign dqs_r = udqs_r;  // iodelay input must come directly from IO pad, no FPGA fabric in between


	// See https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3678799/#msg3678799
	localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DYNAMIC_90_DOMAIN= 3;
	localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DOMAIN = 3;
	localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_180_DOMAIN = 3;
	localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN = 3;

	reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DOMAIN-1:0] need_to_assert_reset_ck;
	reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN-1:0] need_to_assert_reset_ck_270;
	reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DYNAMIC_90_DOMAIN-1:0] need_to_assert_reset_ck_dynamic_90;
	
	// combines the interleaving 'dq_r_q0', 'dq_r_q1' DDR signals into a single SDR signal
	reg [DQ_BITWIDTH-1:0] dq_r_q0;
	wire [DQ_BITWIDTH-1:0] dq_r_q1;

	wire [DQ_BITWIDTH-1:0] dq_r_q0_reg;  // afifo for Double-Data-Rate data is off by 1 clock cycle
	always @(posedge ck_270) dq_r_q0 <= dq_r_q0_reg;

	// for synchronizing multi-bits signals from ck_dynamic_90 domain to ck_270 domain
	wire afifo_dq_r_q0_is_empty;
	wire afifo_dq_r_q0_is_full;

	reg [DQ_BITWIDTH-1:0] dq_r_q0_ck_dynamic_90;

	async_fifo 
	#(
		.WIDTH(DQ_BITWIDTH),
		.NUM_ENTRIES(),
		.TO_SIMPLIFY_FULL_LOGIC(1),
		.TO_SIMPLIFY_EMPTY_LOGIC(1)
	) 
	afifo_dq_r_q0
	(
		.write_reset(reset),
		.read_reset(reset),

		// Read.
		.read_clk(ck_270),
		.read_en(1'b1),
		.read_data(dq_r_q0_reg),
		.empty(afifo_dq_r_q0_is_empty),

		// Write
		.write_clk(ck_dynamic_90),
		.write_en(1'b1),
		.full(afifo_dq_r_q0_is_full),
		.write_data(dq_r_q0_ck_dynamic_90)
	);	
	
	// for synchronizing multi-bits signals from ck_dynamic_90 domain to ck_270 domain
	wire afifo_dq_r_q1_is_empty;
	wire afifo_dq_r_q1_is_full;

	reg [DQ_BITWIDTH-1:0] dq_r_q1_ck_dynamic_90;

	async_fifo 
	#(
		.WIDTH(DQ_BITWIDTH),
		.NUM_ENTRIES(),
		.TO_SIMPLIFY_FULL_LOGIC(1),
		.TO_SIMPLIFY_EMPTY_LOGIC(1)
	) 
	afifo_dq_r_q1
	(
		.write_reset(reset),
		.read_reset(reset),

		// Read.
		.read_clk(ck_270),
		.read_en(1'b1),
		.read_data(dq_r_q1),
		.empty(afifo_dq_r_q1_is_empty),

		// Write
		.write_clk(ck_dynamic_270),
		.write_en(1'b1),
		.full(afifo_dq_r_q1_is_full),
		.write_data(dq_r_q1_ck_dynamic_90)
	);
	
				
	`ifdef USE_SERDES
	
		// splits 'dq_w_oserdes' SDR signal into two ('dq_w_d0', 'dq_w_d1') SDR signals for ODDR2
		// Check the explanation below for the need of two separate OSERDES
		reg [DQ_BITWIDTH-1:0] dq_w_d0;
		reg [DQ_BITWIDTH-1:0] dq_w_d1;	
		reg [DQ_BITWIDTH-1:0] dq_w_d0_reg;
		reg [DQ_BITWIDTH-1:0] dq_w_d1_reg;
		reg [DQ_BITWIDTH-1:0] dq_w_d0_reg_reg;
		reg [DQ_BITWIDTH-1:0] dq_w_d1_reg_reg;				
		wire [DQ_BITWIDTH-1:0] dq_w_oserdes_0;  // associated with dqs_w
		wire [DQ_BITWIDTH-1:0] dq_w_oserdes_1;  // associated with dq_n_w
		
		always @(posedge ck_270) dq_w_d0_reg <= dq_w_oserdes_0;  // for C0, D0 of ODDR2 primitive
		always @(posedge ck_270) dq_w_d1_reg <= dq_w_oserdes_1;  // for C1, D1 of ODDR2 primitive
		
		// for DQ signal starting position on AL alignment for DRAM write operation
		// See https://www.edaboard.com/threads/additive-latency-for-dram-read-and-write-commands.400678/
		always @(posedge ck_270) dq_w_d0_reg_reg <= dq_w_d0_reg;
		always @(posedge ck_270) dq_w_d1_reg_reg <= dq_w_d1_reg;
		always @(posedge ck_270) dq_w_d0 <= dq_w_d0_reg_reg;
		always @(posedge ck_270) dq_w_d1 <= dq_w_d1_reg_reg;

		// always @(*) dq_w_d0 <= dq_w_oserdes_0;
		// always @(*) dq_w_d1 <= dq_w_oserdes_1;		
	
		// why need IOSERDES primitives ?
		// because you want a memory transaction rate much higher than the main clock frequency 
		// but you don't want to require a very high main clock frequency
		
		// send a write of 8w bits to the memory controller, 
		// which is similar to bundling multiple transactions into one wider one,
		// and the memory controller issues 8 writes of w bits to the memory, 
		// where w is the data width of your memory interface. (w == DQ_BITWIDTH)
		// This literally means SERDES_RATIO=8 
		// localparam SERDES_RATIO = 8;

		localparam EVEN_RATIO = 2;

		//reg [DQ_BITWIDTH-1:0] dq_r_iserdes;
		
		// The following way of combining dq_r_q0 and dq_r_q1 back into a single signal will not work
		// for high DDR3 RAM frequency.  Besides, never use clock-related signal for combinational logic
		// See the rationale for having two separate deserializer module to handle this instead
		//always @(dq_r_q0, dq_r_q1, delayed_dqs_r)
		//	dq_r_iserdes <= (delayed_dqs_r) ?  dq_r_q0: dq_r_q1;
		

		// if you want to build your own serdeses feeding from IDDR, you cannot clump dq_r_q0 and dq_r_q1 back
		// into a single signal and feed this signal to your single serdes. 
		// You will need to build two separate serdeses - one for dq_r_q0, and another one for dq_r_q1.

		wire [(DQ_BITWIDTH*(SERDES_RATIO >> 1))-1:0] data_out_iserdes_0;
		wire [(DQ_BITWIDTH*(SERDES_RATIO >> 1))-1:0] data_out_iserdes_1;

		reg [DQ_BITWIDTH*SERDES_RATIO-1:0] data_from_ram_clk_serdes_data;

		
		genvar data_index_iserdes;
		generate
			for(data_index_iserdes = 0; data_index_iserdes < (DQ_BITWIDTH*SERDES_RATIO); 
				data_index_iserdes = data_index_iserdes + DQ_BITWIDTH)
			begin: data_from_ram_combine_loop
				
				// the use of $rtoi and $floor functions are to limit the bit range of 'data_index_iserdes'
				// since 'data_out_iserdes_0' and 'data_out_iserdes_1' are half the size of 
				// 'data_from_ram_clk_serdes_data'
				
				always @(*)
				begin				
					if(((data_index_iserdes/DQ_BITWIDTH) % EVEN_RATIO) == 0)
					begin
						data_from_ram_clk_serdes_data[data_index_iserdes +: DQ_BITWIDTH] <=
						data_out_iserdes_0[DQ_BITWIDTH * 
										   $rtoi($floor(data_index_iserdes/(DQ_BITWIDTH << 1))) 
										   +: DQ_BITWIDTH];
					end
				
					else begin
						data_from_ram_clk_serdes_data[data_index_iserdes +: DQ_BITWIDTH] <=
						data_out_iserdes_1[DQ_BITWIDTH * 
										   $rtoi($floor(data_index_iserdes/(DQ_BITWIDTH << 1))) 
										   +: DQ_BITWIDTH];
					end
				end
			end
		endgenerate
		

		deserializer #(.D(DQ_BITWIDTH), .S(SERDES_RATIO >> 1), .INITIAL_S(1))
		dq_iserdes_0
		(
			.reset(need_to_assert_reset_ck_270[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN-1]),		
		
			// fast clock domain
			.high_speed_clock(ck_270),
			.data_in(dq_r_q0),
			
			// slow clock domain
			.data_out(data_out_iserdes_0)
		);

		deserializer #(.D(DQ_BITWIDTH), .S(SERDES_RATIO >> 1), .INITIAL_S(1))
		dq_iserdes_1
		(
			.reset(need_to_assert_reset_ck_270[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN-1]),		
		
			// fast clock domain
			.high_speed_clock(ck_270),
			.data_in(dq_r_q1),
			
			// slow clock domain
			.data_out(data_out_iserdes_1)
		);
		

		// There is need to use two separate OSERDES because ODDR2 expects its D0 and D1 inputs to be
		// presented to it at a DDR clock rate of 303MHz (D0 at posedge of 303MHz, D1 at negedge of 303MHz),
		// where 303MHz is the minimum DDR3 RAM working frequency.
		// However, one single SDR OSERDES alone could not fulfill this data rate requirement of ODDR2

		// For example, a 8:1 DDR OSERDES which takes 8 inputs D0,D1,D2,D3,D4,D5,D6,D7 and output them serially
		
		// The values supplied by D0,D2,D4,D6 are clocked out on the rising edge
		// The values supplied by D1,D3,D5,D7 are clocked out on the falling edge

		// You can then create two 4:1 SDR OSERDES modules.

		// One of the 2 modules will take D0,D2,D4,D6 inputs and output them serially. 
		// You route its output to the D0 pin of the ODDR.

		// The other will output D1,D3,D5,D7 serially. You route its output to the D1 pin of the ODDR.

		// But this is only if you write your own OSERDES.

		// The vendor-specific hardware OSERDES will have built-in DDR mode. 
		// Even if you put it in SDR mode, it cannot be routed to ODDR because ODDR and OSERDES are two
		// incarnations of the same OLOGIC block.
		
		reg [(DQ_BITWIDTH*(SERDES_RATIO >> 1))-1:0] data_in_oserdes_0;
		reg [(DQ_BITWIDTH*(SERDES_RATIO >> 1))-1:0] data_in_oserdes_1;

		genvar data_index_oserdes;
		generate
			for(data_index_oserdes = 0; data_index_oserdes < (DQ_BITWIDTH*SERDES_RATIO); 
				data_index_oserdes = data_index_oserdes + DQ_BITWIDTH)
			begin: data_to_ram_split_loop

				// the use of $rtoi and $floor functions are to limit the bit range of 'data_index_oserdes'
				// since 'data_in_oserdes_0' and 'data_in_oserdes_1' are half the size of 'data_to_ram'
					
				always @(*)
				begin				
					if(((data_index_oserdes/DQ_BITWIDTH) % EVEN_RATIO) == 0)
					begin
						data_in_oserdes_0[DQ_BITWIDTH * 
										  $rtoi($floor(data_index_oserdes/(DQ_BITWIDTH << 1))) 
										  +: DQ_BITWIDTH] <= 
						data_to_ram[data_index_oserdes +: DQ_BITWIDTH];
					end
				
					else begin
						data_in_oserdes_1[DQ_BITWIDTH * 
										  $rtoi($floor(data_index_oserdes/(DQ_BITWIDTH << 1))) 
										  +: DQ_BITWIDTH] <= 
						data_to_ram[data_index_oserdes +: DQ_BITWIDTH];
					end
				end
			end
		endgenerate

		
		serializer #(.D(DQ_BITWIDTH), .S(SERDES_RATIO >> 1), .INITIAL_S(0))
		dq_oserdes_0
		(
			.reset(need_to_assert_reset_ck_270[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN-1]),
			
			// slow clock domain
			.data_in(data_in_oserdes_0),
			
			// fast clock domain
			.high_speed_clock(ck_270),
			.data_out(dq_w_oserdes_0)
		);

		serializer #(.D(DQ_BITWIDTH), .S(SERDES_RATIO >> 1), .INITIAL_S(0))
		dq_oserdes_1
		(
			.reset(need_to_assert_reset_ck_270[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN-1]),
		
			// slow clock domain
			.data_in(data_in_oserdes_1),
			
			// fast clock domain
			.high_speed_clock(ck_270),
			.data_out(dq_w_oserdes_1)
		);
		
	
		// The following Xilinx-specific IOSERDES primitives are not used due to placement blockage restrictions
		// See https://forums.xilinx.com/t5/Implementation/Xilinx-ISE-implementation-stage-issues/m-p/1255587/highlight/true#M30717
		// or https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3592301/#msg3592301

		// DDR Data Reception Using Two BUFIO2s
		// See Figure 6 of https://www.xilinx.com/support/documentation/application_notes/xapp1064.pdf#page=5
		/*
		wire rxioclkp;
		wire rxioclkn;
		wire rx_serdesstrobe;
		
		wire gclk_iserdes;
		wire clkin_p_iserdes = (udqs_r | ldqs_r);
		wire clkin_n_iserdes = (udqs_n_r | ldqs_n_r);
		
		serdes_1_to_n_clk_ddr_s8_diff #(.S(SERDES_RATIO))
		dqs_iserdes
		(
			.clkin_p(clkin_p_iserdes),
			.clkin_n(clkin_n_iserdes),
			.rxioclkp(rxioclkp),
			.rxioclkn(rxioclkn),
			.rx_serdesstrobe(rx_serdesstrobe),
			.rx_bufg_x1(gclk_iserdes)
		);
		
		serdes_1_to_n_data_ddr_s8_diff #(.D(DQ_BITWIDTH), .S(SERDES_RATIO))
		dq_iserdes
		(
			.use_phase_detector(1'b1),
			.datain_p(dq_r),
			.datain_n(),
			.rxioclkp(rxioclkp),
			.rxioclkn(rxioclkn),
			.rxserdesstrobe(rx_serdesstrobe),
			.reset(reset),
			.gclk(gclk_iserdes),
			.bitslip(1'b1),
			.debug_in(2'b00),
			.data_out(data_from_ram),
			.debug(debug_dq_serdes)
		);

		// DDR Data Transmission Using Two BUFIO2s
		// See Figure 18 of https://www.xilinx.com/support/documentation/application_notes/xapp1064.pdf#page=17

		wire txioclkp;
		wire txioclkn;
		wire txserdesstrobe;
		
		wire gclk_oserdes;

		clock_generator_ddr_s8_diff #(.S(SERDES_RATIO))
		dqs_oserdes
		(
			.clkin_p(clk),
			.clkin_n(),
			.ioclkap(txioclkp),
			.ioclkan(txioclkn),
			.serdesstrobea(txserdesstrobe),
			.ioclkbp(),
			.ioclkbn(),
			.serdesstrobeb(),
			.gclk(gclk_oserdes)
		);
		
		serdes_n_to_1_ddr_s8_diff #(.D(DQ_BITWIDTH), .S(SERDES_RATIO))
		dq_oserdes
		(
			.txioclkp(txioclkp),
			.txioclkn(txioclkn),
			.txserdesstrobe(txserdesstrobe),
			.reset(reset),
			.gclk(gclk_oserdes),
			.datain(data_to_ram),
			.dataout_p(dq_w),
			.dataout_n()
		);
		*/

		// to synchronize signal in clk_serdes_data domain to ck domain
		reg [DQ_BITWIDTH*SERDES_RATIO-1:0] data_from_ram_ck;

	`else
		wire [DQ_BITWIDTH-1:0] dq_w_d0 = data_to_ram[0 +: DQ_BITWIDTH];
		wire [DQ_BITWIDTH-1:0] dq_w_d1 = data_to_ram[DQ_BITWIDTH +: DQ_BITWIDTH];	
		
		// to synchronize signal in clk_serdes_data domain to ck domain
		reg [(DQ_BITWIDTH << 1)-1:0] data_from_ram_ck;

		wire [(DQ_BITWIDTH << 1)-1:0] data_from_ram_clk_serdes_data = 
					{dq_r_q1, dq_r_q0};	
				
	`endif

assign data_from_ram = data_from_ram_clk_serdes_data;
	 		

// wire data_read_is_ongoing = ((wait_count > TIME_RL-TIME_TRPRE) && 
//							 ((main_state == STATE_READ) || (main_state == STATE_READ_AP))) || 
//					  		 (main_state == STATE_READ_DATA);

// for pipelining in order to feed valid non-X incoming DQ bits into deserializer module
localparam NUM_OF_READ_PIPELINE_REGISTER_ADDED = 15;  // for 'dq_iobuf_en' and 'dqs_iobuf_en'

wire data_write_is_ongoing = ((wait_count > TIME_WRITE_COMMAND_TO_DQS_VALID) && 
		    				  ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP))) || 
							  (main_state == STATE_WRITE_DATA);

`endif


`ifdef LATTICE

	// look for BB primitive in this lattice document :
	// http://www.latticesemi.com/-/media/LatticeSemi/Documents/UserManuals/EI/FPGALibrariesReferenceGuide33.ashx?document_id=50790

	// we cannot have tristate signal inside the logic of an ECP5. tristates only work at the I/O boundary.
	// So, need to split up the read/write signals and have logic to handle these as two separate paths 
	// that meet at the I/O boundary at the BB primitive.

	`ifndef USE_x16

		TRELLIS_IO BB_dqs (
			.B(dqs),
			.I(dqs_w),
			.T(data_read_is_ongoing),
			.O(dqs_r)
		);

		TRELLIS_IO BB_dqs_n (
			.B(dqs_n),
			.I(dqs_n_w),
			.T(data_read_is_ongoing),
			.O(dqs_n_r)
		);

	`else  // DQS strobes, the following IOBUF instantiations just use all available x16 bandwidth

		TRELLIS_IO BB_ldqs (
			.B(ldqs),
			.I(ldqs_w),
			.T(data_read_is_ongoing),
			.O(ldqs_r)
		);

		TRELLIS_IO BB_ldqs_n (
			.B(ldqs_n),
			.I(ldqs_n_w),
			.T(data_read_is_ongoing),
			.O(ldqs_n_r)
		);

		TRELLIS_IO BB_udqs (
			.B(udqs),
			.I(udqs_w),
			.T(data_read_is_ongoing),
			.O(udqs_r)
		);

		TRELLIS_IO BB_udqs_n (
			.B(udqs_n),
			.I(udqs_n_w),
			.T(data_read_is_ongoing),
			.O(udqs_n_r)
		);
	`endif

	generate
	genvar dq_index;  // to indicate the bit position of DQ signal

	for(dq_index = 0; dq_index < DQ_BITWIDTH; dq_index = dq_index + 1)
	begin : dq_tristate_io

		TRELLIS_IO BB_dq (
			.B(dq[dq_index]),
			.I(dq_w[dq_index]),
			.T(data_read_is_ongoing),
			.O(dq_r[dq_index])
		);
	end

	endgenerate

`endif

`ifdef ALTERA

	// https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/hb/max-10/archives/ug-m10-gpio-15.1.pdf#page=47

	// we cannot have tristate signal inside the logic of FPGA. tristates only work at the I/O boundary.
	// So, need to split up the read/write signals and have logic to handle these as two separate paths 
	// that meet at the I/O boundary at the GPIO primitive.

	`ifndef USE_x16

		IOBUF BB_dqs (
			.inclock(ck_dynamic_90),
			.outclock(ck_90),
			.pad_io(dqs),
			.pad_io_b(dqs_n),
			.oe(data_read_is_ongoing),
			.dout(2'b10),  // {dqs_w, dqs_n_w}
			.din({dqs_r_1, dqs_r_0})
		);

	`else  // DQS strobes, the following IOBUF instantiations just use all available x16 bandwidth

		IOBUF BB_ldqs (
			.inclock(ck_dynamic_90),
			.outclock(ck_90),
			.pad_io(ldqs),
			.pad_io_b(ldqs_n),
			.oe(data_read_is_ongoing),
			.dout(2'b10),  // {ldqs_w, ldqs_n_w}
			.din({ldqs_r_1, ldqs_r_0})
		);

		IOBUF BB_udqs (
			.inclock(ck_dynamic_90),
			.outclock(ck_90),
			.pad_io(udqs),
			.pad_io_b(udqs_n),
			.oe(data_read_is_ongoing),
			.dout(2'b10),  // {udqs_w, udqs_n_w}
			.din({udqs_r_1, udqs_r_0})
		);
		
	`endif

	generate
	genvar dq_index;  // to indicate the bit position of DQ signal

	for(dq_index = 0; dq_index < (DQ_BITWIDTH >> 1); dq_index = dq_index + 1)
	begin : dq_tristate_io

		IOBUF_DQ BB_dq (
			.inclock(ck_dynamic_90),
			.outclock(ck),
			.pad_io(dq[dq_index]),
			//.pad_io_b(),  // DQ signal is not differential type
			.oe(data_read_is_ongoing),
			.dout({dq_w_1[dq_index], dq_w_0[dq_index]}),
			.din({dq_r_1[dq_index], dq_r_0[dq_index]})			
		);
	end

	endgenerate

`endif


// https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3668329/#msg3668329
localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_90_DOMAIN = 3;

// to synchronize signal in ck_180 domain to ck_90 domain
reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_90_DOMAIN-1:0] data_read_is_ongoing_90;

genvar ff_ck_180_ck_90;

generate
	for(ff_ck_180_ck_90 = 0; 
	    ff_ck_180_ck_90 < NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_90_DOMAIN;
	    ff_ck_180_ck_90 = ff_ck_180_ck_90 + 1)
	begin: ck_180_to_ck_90
	
		always @(posedge ck_90)
		begin
			if(reset) data_read_is_ongoing_90[ff_ck_180_ck_90] <= 0;
			
			else begin
				if(ff_ck_180_ck_90 == 0) data_read_is_ongoing_90[ff_ck_180_ck_90] <= data_read_is_ongoing;
				
				else data_read_is_ongoing_90[ff_ck_180_ck_90] <= data_read_is_ongoing_90[ff_ck_180_ck_90-1];
			end
		end
	end		
endgenerate
		

`ifdef XILINX

	`ifndef TESTBENCH
		wire ldqs_iobuf_enable, udqs_iobuf_enable;
	`endif
	
	wire ldqs_n_iobuf_enable, udqs_n_iobuf_enable;
	
	`ifndef TESTBENCH
	wire [DQ_BITWIDTH-1:0] dq_iobuf_enable;
	`endif
	
	//wire [DQ_BITWIDTH-1:0] delayed_dq_r;
	//wire [DQ_BITWIDTH-1:0] delayed_dq_w;
	

	// https://www.xilinx.com/support/documentation/sw_manuals/xilinx14_7/spartan6_hdl.pdf#page=126

	`ifndef USE_x16

		IOBUF IO_dqs (
			.IO(dqs),
			.I(dqs_w),
			.T(data_read_is_ongoing),
			.O(dqs_r)
		);

		IOBUF IO_dqs_n (
			.IO(dqs_n),
			.I(dqs_n_w),
			.T(data_read_is_ongoing),
			.O(dqs_n_r)
		);

	`else  // DQS strobes, the following IOBUF instantiations just use all available x16 bandwidth
		
		IOBUF IO_ldqs (
			.IO(ldqs),
			.I(ldqs_w),
			.T(ldqs_iobuf_enable),
			.O(ldqs_r)
		);

		IOBUF IO_ldqs_n (
			.IO(ldqs_n),
			.I(ldqs_n_w),
			.T(ldqs_n_iobuf_enable),
			.O(ldqs_n_r)
		);

		IOBUF IO_udqs (
			.IO(udqs),
			.I(udqs_w),
			.T(udqs_iobuf_enable),
			.O(udqs_r)
		);

		IOBUF IO_udqs_n (
			.IO(udqs_n),
			.I(udqs_n_w),
			.T(udqs_n_iobuf_enable),
			.O(udqs_n_r)
		);


		// localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_DOMAIN = 4;
		
		// to synchronize signal in ck_180 domain to ck domain
		// reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_DOMAIN-1:0] data_read_is_ongoing_ck;
		
		genvar ff_ck_180_ck;
		
		generate
			for(ff_ck_180_ck = 0; ff_ck_180_ck < NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_DOMAIN;
			    ff_ck_180_ck = ff_ck_180_ck + 1)
			begin: ck_180_to_ck
			
				always @(posedge ck)
				begin
					if(reset) data_read_is_ongoing_ck[ff_ck_180_ck] <= 0;
					
					else begin
						if(ff_ck_180_ck == 0) 
						// for tRPRE , needed for the incoming read preamble bits
						// dqs tri-state buffer enable signal is connected to 'data_read_is_ongoing_ck'
						data_read_is_ongoing_ck[ff_ck_180_ck] <= data_read_is_ongoing;
						
						else data_read_is_ongoing_ck[ff_ck_180_ck] <= data_read_is_ongoing_ck[ff_ck_180_ck-1];
					end
				end
			end		
		endgenerate

		reg [NUM_OF_READ_PIPELINE_REGISTER_ADDED-1:0] dqs_iobuf_en;
		
		genvar ff_dqs_iobuf_en;
		
		generate
			for(ff_dqs_iobuf_en = 0; 
			    ff_dqs_iobuf_en < NUM_OF_READ_PIPELINE_REGISTER_ADDED;
			    ff_dqs_iobuf_en = ff_dqs_iobuf_en + 1)
			begin: dqs_iobuf_en_pipeline
			
				always @(posedge ck)
				begin
					if(reset) dqs_iobuf_en[ff_dqs_iobuf_en] <= 0;
					
					else begin
						if(ff_dqs_iobuf_en == 0) 
							dqs_iobuf_en[ff_dqs_iobuf_en] <=
		data_read_is_ongoing_ck[NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_DOMAIN-1];
						
						else dqs_iobuf_en[ff_dqs_iobuf_en] <= dqs_iobuf_en[ff_dqs_iobuf_en-1];
					end
				end
			end		
		endgenerate

		
		localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_270_DOMAIN = 3;
		
		// to synchronize signal in ck_180 domain to ck_270 domain
		reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_270_DOMAIN-1:0] data_read_is_ongoing_270;
		
		genvar ff_ck_180_ck_270;
		
		generate
			for(ff_ck_180_ck_270 = 0; 
			    ff_ck_180_ck_270 < NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_270_DOMAIN;
			    ff_ck_180_ck_270 = ff_ck_180_ck_270 + 1)
			begin: ck_to_ck_270
			
				always @(posedge ck_270)
				begin
					if(reset) data_read_is_ongoing_270[ff_ck_180_ck_270] <= 0;
					
					else begin
						if(ff_ck_180_ck_270 == 0) data_read_is_ongoing_270[ff_ck_180_ck_270] <= data_read_is_ongoing;
						
						else data_read_is_ongoing_270[ff_ck_180_ck_270] <= data_read_is_ongoing_270[ff_ck_180_ck_270-1];
					end
				end
			end		
		endgenerate


		reg [NUM_OF_READ_PIPELINE_REGISTER_ADDED:0] dq_iobuf_en;
		
		genvar ff_dq_iobuf_en;
		
		generate
			for(ff_dq_iobuf_en = 0; 
			    ff_dq_iobuf_en <= NUM_OF_READ_PIPELINE_REGISTER_ADDED;
			    ff_dq_iobuf_en = ff_dq_iobuf_en + 1)
			begin: dq_iobuf_en_pipeline
			
				always @(posedge ck_270)
				begin
					if(reset) dq_iobuf_en[ff_dq_iobuf_en] <= 0;
					
					else begin
						if(ff_dq_iobuf_en == 0) 
							dq_iobuf_en[ff_dq_iobuf_en] <=
		data_read_is_ongoing_270[NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_270_DOMAIN-1];
						
						else dq_iobuf_en[ff_dq_iobuf_en] <= dq_iobuf_en[ff_dq_iobuf_en-1];
					end
				end
			end		
		endgenerate
		
		
        // see https://www.xilinx.com/support/documentation/user_guides/ug381.pdf#page=61
        // 'data_read_is_ongoing' signal is not of double-data-rate signals,
        // but it is connected to T port of IOBUF where its I port is fed in with double-data-rate DQS signals,
        // thus the purpose of having the following ODDR2 primitives
                
        ODDR2 #(
            .DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
            .INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
            .SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
        )
        ODDR2_ldqs_iobuf_en(
            .Q(ldqs_iobuf_enable),  // 1-bit DDR output data
            .C0(ck),  // 1-bit clock input
            .C1(ck_180),  // 1-bit clock input
            .CE(1'b1),  // 1-bit clock enable input
            .D0(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C0)
            .D1(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C1)			
            .R(1'b0),    // 1-bit reset input
            .S(1'b0)     // 1-bit set input
        );	

        ODDR2 #(
            .DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
            .INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
            .SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
        )
        ODDR2_ldqs_n_iobuf_en(
            .Q(ldqs_n_iobuf_enable),  // 1-bit DDR output data
            .C0(ck),  // 1-bit clock input
            .C1(ck_180),  // 1-bit clock input
            .CE(1'b1),  // 1-bit clock enable input
            .D0(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C0)
            .D1(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C1)			
            .R(1'b0),    // 1-bit reset input
            .S(1'b0)     // 1-bit set input
        );
        
        ODDR2 #(
            .DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
            .INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
            .SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
        )
        ODDR2_udqs_iobuf_en(
            .Q(udqs_iobuf_enable),  // 1-bit DDR output data
            .C0(ck),  // 1-bit clock input
            .C1(ck_180),  // 1-bit clock input
            .CE(1'b1),  // 1-bit clock enable input
            .D0(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C0)
            .D1(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C1)			
            .R(1'b0),    // 1-bit reset input
            .S(1'b0)     // 1-bit set input
        );	

        ODDR2 #(
            .DDR_ALIGNMENT("C0"),  // Sets output alignment to "NONE", "C0" or "C1"
            .INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
            .SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
        )
        ODDR2_udqs_n_iobuf_en(
            .Q(udqs_n_iobuf_enable),  // 1-bit DDR output data
            .C0(ck),  // 1-bit clock input
            .C1(ck_180),  // 1-bit clock input
            .CE(1'b1),  // 1-bit clock enable input
            .D0(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C0)
            .D1(dqs_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED-1]),    // 1-bit DDR data input (associated with C1)			
            .R(1'b0),    // 1-bit reset input
            .S(1'b0)     // 1-bit set input
        );
				
	`endif
		

	generate
	genvar dq_index;  // to indicate the bit position of DQ signal

	for(dq_index = 0; dq_index < DQ_BITWIDTH; dq_index = dq_index + 1)
	begin : dq_io

		// RAM -> IOBUF (for inout) -> IDELAY (DQS Centering) -> IDDR2 (input DDR buffer) -> ISERDES		
		// OSERDES -> ODDR2 (output DDR buffer) -> ODELAY (DQS Centering) -> IOBUF (for inout) -> RAM

		IOBUF IO_dq (
			.IO(dq[dq_index]),
			.I(dq_w[dq_index]),  // already phase-shifted by 90 degrees
			.T(dq_iobuf_enable[dq_index]),
			.O(dq_r[dq_index])  // not phase-shifted by 90 degrees yet
		);


		// As for why 'dq_iobuf_enable' signal is implemented using ODDR2 primitive,
		// see https://www.xilinx.com/support/documentation/user_guides/ug381.pdf#page=61

		// ODDR2: Input Double Data Rate Output Register with Set, Reset and Clock Enable.
		// Spartan-6
		// Xilinx HDL Libraries Guide, version 14.7

		ODDR2 #(
			.DDR_ALIGNMENT("C1"),  // Sets output alignment to "NONE", "C0" or "C1"
			.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
		)
		ODDR2_dq_iobuf_en(
			.Q(dq_iobuf_enable[dq_index]),  // 1-bit DDR output data
			.C0(ck_90),  // 1-bit clock input
			.C1(ck_270),  // 1-bit clock input
			.CE(1'b1),  // 1-bit clock enable input
			.D0(dq_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED]),    // 1-bit DDR data input (associated with C0)
			.D1(dq_iobuf_en[NUM_OF_READ_PIPELINE_REGISTER_ADDED]),    // 1-bit DDR data input (associated with C1)			
			.R(reset),    // 1-bit reset input
			.S(1'b0)     // 1-bit set input
		);	
		// End of ODDR2_inst instantiation
		
		
		// IODDR2 primitives are needed because the 'dq' signals are of double-data-rate
		// https://www.xilinx.com/support/documentation/sw_manuals/xilinx14_7/spartan6_hdl.pdf#page=123
		
		// IDDR2: Input Double Data Rate Input Register with Set, Reset and Clock Enable.
		// Spartan-6
		// Xilinx HDL Libraries Guide, version 14.7
/*
		IDDR2 #(
			.DDR_ALIGNMENT("NONE"),  // Sets output alignment to "NONE", "C0" or "C1"
			.INIT_Q0(1'b0),  // Sets initial state of the Q0 output to 1'b0 or 1'b1
			.INIT_Q1(1'b0),  // Sets initial state of the Q1 output to 1'b0 or 1'b1
			.SRTYPE("SYNC")  // Specifies "SYNC" or "ASYNC" set/reset
		)
		IDDR2_dq_r(
			.Q0(dq_r_q0[dq_index]),  // 1-bit output captured with C0 clock
			.Q1(dq_r_q1[dq_index]),  // 1-bit output captured with C1 clock
			.C0(ck_dynamic_90),  // 1-bit clock input
			.C1(ck_dynamic_270),  // 1-bit clock input
			.CE(1'b1),  // 1-bit clock enable input
			.D(dq_r[dq_index]),    // 1-bit DDR data input
			.R(reset),    // 1-bit reset input
			.S(1'b0)     // 1-bit set input
		);
		// End of IDDR2_inst instantiation	
*/

		// https://www.xilinx.com/support/documentation/user_guides/ug381.pdf#page=51
		// IDDR2 is re-coded in verilog fabric due to same clock restriction of IODDR which leads to routing issue
		// the use of ck_dynamic_90 instead of ck_dynamic is due to the reason:
		// for DQ centering, incoming DQ bits have 0 phase shift with respect to incoming DQS strobe
		always @(posedge ck_dynamic_90)
		begin
			if(reset) dq_r_q0_ck_dynamic_90[dq_index] <= 0;
			
			else dq_r_q0_ck_dynamic_90[dq_index] <= dq_r[dq_index];
		end
		
		always @(negedge ck_dynamic_90)  // always @(posedge ck_dynamic_270)
		begin
			if(reset) dq_r_q1_ck_dynamic_90[dq_index] <= 0;
			
			else dq_r_q1_ck_dynamic_90[dq_index] <= dq_r[dq_index];
		end

		// ODDR2: Input Double Data Rate Output Register with Set, Reset and Clock Enable.
		// Spartan-6
		// Xilinx HDL Libraries Guide, version 14.7

		ODDR2 #(
			.DDR_ALIGNMENT("C1"),  // Sets output alignment to "NONE", "C0" or "C1"
			.INIT(1'b0),  // Sets initial state of the Q output to 1'b0 or 1'b1
			.SRTYPE("ASYNC")  // Specifies "SYNC" or "ASYNC" set/reset
		)
		ODDR2_dq_w(
			.Q(dq_w[dq_index]),  // 1-bit DDR output data
			.C0(ck_90),  // 1-bit clock input
			.C1(ck_270),  // 1-bit clock input
			.CE(1'b1),  // 1-bit clock enable input
			.D0(dq_w_d0[dq_index]),    // 1-bit DDR data input (associated with C0)
			.D1(dq_w_d1[dq_index]),    // 1-bit DDR data input (associated with C1)
			.R(reset),    // 1-bit reset input
			.S(1'b0)     // 1-bit set input
		);
		// End of ODDR2_inst instantiation
		
		
		// IODELAY2 primitive is not used due to some internal hardware issues as described in
		// https://www.xilinx.com/support/answers/38408.html
/*
		// See https://www.xilinx.com/support/documentation/user_guides/ug381.pdf#page=51
		// xilinx specs says "Only possible when the two BUFGs are common for both input and output" or similar
		// This means that the input and output clocks must be the same
		// Or, the read sampling clock and the write transmitter clock must be the same (denoted as ck)
		// In other words, while you read the MPR_Read_function test calibration pattern from DDR3 chip, 
		// you shift DQS to be in phase with the clock and maintain it that way. 
		// You know how big is the shift, so you know how much you need to shift DQ to move it to the point
		// where the sampling clock will be centred in the DQ bit.
		// Note: "VARIABLE_FROM_HALF_MAX" is used to emulate 90 degrees phase shift.
				
		IODELAY2 #(
			.DATA_RATE      	("DDR"), 		// <SDR>, DDR
			.IDELAY_VALUE  		(0), 			// {0 ... 255}
			.IDELAY2_VALUE 		(0), 			// {0 ... 255}
			.IDELAY_MODE  		("NORMAL" ), 		// NORMAL, PCI
			.ODELAY_VALUE  		(0), 			// {0 ... 255}
			.IDELAY_TYPE   		("VARIABLE_FROM_HALF_MAX"),// "DEFAULT", "DIFF_PHASE_DETECTOR", "FIXED", "VARIABLE_FROM_HALF_MAX", "VARIABLE_FROM_ZERO"
			.COUNTER_WRAPAROUND 	("WRAPAROUND" ), 	// <STAY_AT_LIMIT>, WRAPAROUND
			.DELAY_SRC     		("IDATAIN" ), 		// "IO", "IDATAIN", "ODATAIN"
			.SERDES_MODE   		("NONE") 		// <NONE>, MASTER, SLAVE
		)
		iodelay_dq_r (
			.IDATAIN  		(dq_r[dq_index]), 	// data from primary IOB
			.TOUT     		(), 			// tri-state signal to IOB
			.DOUT     		(), 			// output data to IOB
			.T        		(1'b1), 		// tri-state control from OLOGIC/OSERDES2
			.ODATAIN  		(1'b0), 		// data from OLOGIC/OSERDES2
			.DATAOUT  		(delayed_dq_r[dq_index]), 		// Output data 1 to ILOGIC/ISERDES2
			.DATAOUT2 		(),	 		// Output data 2 to ILOGIC/ISERDES2
			.IOCLK0   		(ck_90), 		// High speed clock for calibration
			.IOCLK1   		(ck_270), 		// High speed clock for calibration
			.CLK      		(clk), 		// Fabric clock (GCLK) for control signals
			
			// Note that my read clock is parallel for all DQ bits as well as the DQS.  
			// I do not have any individual tuning skew adjustments on any of the DQ pins.  
			// Everything is sampled and transmitted in parallel.
			// In other words, the parallel DQ bits group is assumed to be length-matched
			// So, all DQ bits will experience the exact same delay value (similar CAL, INC signals)
			// See https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3601621/#msg3601621
			// Might need to change this calibration decision in later part of project for further improvement
			.CAL      		(idelay_cal_dqs_r),	// Calibrate control signal
			.INC      		(idelay_inc_dqs_r), 		// Increment counter
			
			.CE       		(idelay_counter_enable), 		// Enable counter increment/decrement
			.RST      		(idelay_is_busy_previously & (~idelay_is_busy)),		// Reset delay line
			.BUSY      		()	// output signal indicating sync circuit has finished / calibration has finished
		);
*/

		/*
		The following ODELAY for dq_w is not used.
		Reason: The output of ODDR2 primitive needs to connect to the I port of IOBUF primitive 
				by bypassing ODELAY in order to avoid ERROR:PACK 2530 error from ISE tool
		
		// Initially the RAM controller uses ck_90 to drive DQ bits directly to IOBUF without using ODELAY.
		// However, there is some underlying xilinx spartan-6 hardware limitations where this is not possible.
		// The output from ODDR2 primitive can only be routed to ILOGIC, IODELAY, and IOB

		// the IODELAY2 primitives for DQ bits could not be shared between read and write operations
		// because if they are to be shared, they would be some combinational logic to select between 
		// read and write operations which is not helpful at all for read operations.
		// Note that for read pipeline, IDELAY is used before ISERDES, which means any extra logic for input of
		// IDELAY will slow things down significantly until the read operations might fail to calibrate delay

		IODELAY2 #(
			.DATA_RATE      	("DDR"), 		// <SDR>, DDR
			.IDELAY_VALUE  		(0), 			// {0 ... 255}
			.IDELAY2_VALUE 		(0), 			// {0 ... 255}
			.IDELAY_MODE  		("NORMAL" ), 		// NORMAL, PCI
			.ODELAY_VALUE  		(0), 			// {0 ... 255}
			.IDELAY_TYPE   		("VARIABLE_FROM_HALF_MAX"),// "DEFAULT", "DIFF_PHASE_DETECTOR", "FIXED", "VARIABLE_FROM_HALF_MAX", "VARIABLE_FROM_ZERO"
			.COUNTER_WRAPAROUND 	("WRAPAROUND" ), 	// <STAY_AT_LIMIT>, WRAPAROUND
			.DELAY_SRC     		("IDATAIN" ), 		// "IO", "IDATAIN", "ODATAIN"
			.SERDES_MODE   		("NONE") 		// <NONE>, MASTER, SLAVE
		)
		iodelay_dq_w (
			.IDATAIN  		(dq_w[dq_index]), 	// data from primary IOB
			.TOUT     		(), 			// tri-state signal to IOB
			.DOUT     		(), 			// output data to IOB
			.T        		(1'b1), 		// tri-state control from OLOGIC/OSERDES2
			.ODATAIN  		(1'b0), 		// data from OLOGIC/OSERDES2
			.DATAOUT  		(delayed_dq_w[dq_index]), 		// Output data 1 to ILOGIC/ISERDES2
			.DATAOUT2 		(),	 		// Output data 2 to ILOGIC/ISERDES2
			.IOCLK0   		(ck), 		// High speed clock for calibration
			.IOCLK1   		(ck_180), 		// High speed clock for calibration
			.CLK      		(clk), 		// Fabric clock (GCLK) for control signals
			
			// Note that my read clock is parallel for all DQ bits as well as the DQS.  
			// I do not have any individual tuning skew adjustments on any of the DQ pins.  
			// Everything is sampled and transmitted in parallel.
			// In other words, the parallel DQ bits group is assumed to be length-matched
			// So, all DQ bits will experience the exact same delay value (similar CAL, INC signals)
			// See https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3601621/#msg3601621
			// Might need to change this calibration decision in later part of project for further improvement
			.CAL      		(idelay_cal_dqs_r),	// Calibrate control signal
			.INC      		(idelay_inc_dqs_r), 		// Increment counter
			
			.CE       		(idelay_counter_enable), 		// Enable counter increment/decrement
			.RST      		(idelay_is_busy_previously & (~idelay_is_busy)),		// Reset delay line
			.BUSY      		()	// output signal indicating sync circuit has finished / calibration has finished
		);
		*/						
	end

	endgenerate
		
`endif


`ifndef HIGH_SPEED
	`ifndef USE_x16
	
	assign dqs = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				  (main_state == STATE_WRITE_DATA)) ? 
					dqs_w : {DQS_BITWIDTH{1'bz}};  // dqs value of 1'bz is for input

	// assign dqs_r = dqs;  // only for formal modelling of tri-state logic

	assign dqs_n = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
					(main_state == STATE_WRITE_DATA)) ? 
					dqs_n_w : {DQS_BITWIDTH{1'bz}};  // dqs value of 1'bz is for input

	// assign dqs_n_r = dqs_n;  // only for formal modelling of tri-state logic

	assign dq = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				 (main_state == STATE_WRITE_DATA)) ? 
					dq_w : {DQ_BITWIDTH{1'bz}};  // dq value of 1'bz is for input

	// assign dq_r = dq;  // only for formal modelling of tri-state logic
	
	`else
	
	assign ldqs = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				   (main_state == STATE_WRITE_DATA)) ? 
					ldqs_w : {(DQS_BITWIDTH >> 1){1'bz}};  // dqs value of 1'bz is for input

	// assign ldqs_r = ldqs;  // only for formal modelling of tri-state logic

	assign ldqs_n = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
					 (main_state == STATE_WRITE_DATA)) ? 
					ldqs_n_w : {(DQS_BITWIDTH >> 1){1'bz}};  // dqs value of 1'bz is for input

	// assign ldqs_n_r = ldqs_n;  // only for formal modelling of tri-state logic

	assign ldq = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				  (main_state == STATE_WRITE_DATA)) ? 
					ldq_w : {(DQ_BITWIDTH >> 1){1'bz}};  // dq value of 1'bz is for input

	// assign ldq_r = ldq;  // only for formal modelling of tri-state logic	


	assign udqs = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				   (main_state == STATE_WRITE_DATA)) ? 
	 				udqs_w : {(DQS_BITWIDTH >> 1){1'bz}};  // dqs value of 1'bz is for input

	// assign udqs_r = udqs;  // only for formal modelling of tri-state logic

	assign udqs_n = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
					 (main_state == STATE_WRITE_DATA)) ? 
					udqs_n_w : {(DQS_BITWIDTH >> 1){1'bz}};  // dqs value of 1'bz is for input

	// assign udqs_n_r = udqs_n;  // only for formal modelling of tri-state logic

	assign udq = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				  (main_state == STATE_WRITE_DATA)) ? 
	 				udq_w : {(DQ_BITWIDTH >> 1){1'bz}};  // dq value of 1'bz is for input

	// assign udq_r = udq;  // only for formal modelling of tri-state logic
	
	
	assign dq = {udq, ldq};
	assign dqs = {udqs, ldqs};
	assign dqs_n = {udqs_n, ldqs_n};		
	`endif
`endif


`ifdef FORMAL

	initial assume(reset);
/*	
	reg reset_extended;
	
	always @(posedge clk_serdes)
	begin
		if(reset) reset_extended <= 1;
		
		else reset_extended <= reset;
	end
	
	always @(posedge clk_serdes)  // reset extender
	begin
		if(($past(reset) == 1) && (reset_extended) && (!$past(reset_extended))) assume(reset);
	end
*/

	assign dqs = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				  (main_state == STATE_WRITE_DATA)) ? 
					dqs_w : {DQS_BITWIDTH{1'bz}};  // dqs value of 1'bz is for input

	assign dqs_r = dqs;  // only for formal modelling of tri-state logic

	assign dqs_n = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
					(main_state == STATE_WRITE_DATA)) ? 
					dqs_n_w : {DQS_BITWIDTH{1'bz}};  // dqs value of 1'bz is for input

	assign dqs_n_r = dqs_n;  // only for formal modelling of tri-state logic

	assign dq = ((main_state == STATE_WRITE) || (main_state == STATE_WRITE_AP) || 
				 (main_state == STATE_WRITE_DATA)) ? 
					dq_w : {DQ_BITWIDTH{1'bz}};  // dq value of 1'bz is for input

	assign dq_r = dq;  // only for formal modelling of tri-state logic


	reg first_clock_had_passed;
	initial first_clock_had_passed = 0;
	
	always @(posedge clk_serdes)
	begin
		if(reset) first_clock_had_passed <= 0;
		
		else first_clock_had_passed <= 1;
	end

	always @(posedge clk_serdes)
	begin
		if(first_clock_had_passed)
		begin
			// cover(main_state == STATE_RESET_FINISH);
			// cover(main_state == STATE_INIT_CLOCK_ENABLE);
			// cover(main_state == STATE_INIT_MRS_2);
			// cover(main_state == STATE_INIT_MRS_3);
			// cover(main_state == STATE_ZQ_CALIBRATION);
			cover(main_state == STATE_READ_DATA);  // to obtain a RAM read transaction waveform
			cover(main_state == STATE_WRITE_DATA);  // to obtain a RAM write transaction waveform
		end
	end

	always @(posedge clk_serdes)
	begin
		if(data_write_is_ongoing)
		begin
			assert(dqs == dqs_w);
		end
		
		else assert(dqs == dqs_r);
	end

	always @(posedge clk_serdes)
	begin
		if(data_write_is_ongoing)
		begin
			assert(dqs_n == dqs_n_w);
		end
		
		else assert(dqs_n == dqs_n_r);
	end

	always @(posedge clk_serdes)
	begin
		if(data_write_is_ongoing)
		begin
			assert(dq == dq_w);
		end
		
		else assert(dq == dq_r);
	end
	
`endif


`ifndef USE_ILA
	reg [$clog2(MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED):0] refresh_Queue;
`endif


// It is not a must that all 8 postponed REF-commands have to be executed inside a single tREFI
`ifdef USE_ILA
	assign low_Priority_Refresh_Request = (refresh_Queue != MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED);
	assign high_Priority_Refresh_Request = (refresh_Queue >= HIGH_REFRESH_QUEUE_THRESHOLD);
`else
	wire low_Priority_Refresh_Request = (refresh_Queue != MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED);
	wire high_Priority_Refresh_Request = (refresh_Queue >= HIGH_REFRESH_QUEUE_THRESHOLD);
`endif

`ifndef USE_ILA
	// to propagate 'write_enable' and 'read_enable' signals during STATE_IDLE to STATE_WRITE and STATE_READ
	reg write_is_enabled;
	reg read_is_enabled;
`endif

`ifdef USE_x16
	// no data masking
 	assign ldm = 0;
	assign udm = 0;
`endif


reg [$clog2(MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED*TIME_TREFI)-1:0] postponed_refresh_timing_count;
reg [$clog2(TIME_TREFI)-1:0] refresh_timing_count;

wire extra_read_or_write_cycles_had_passed  // to allow burst read or write operations to proceed first
		= (postponed_refresh_timing_count == 
`ifndef XILINX
				user_desired_extra_read_or_write_cycles*TIME_TREFI[0 +: $clog2(TIME_TREFI)]);  // for verilator warning
`else
				user_desired_extra_read_or_write_cycles*TIME_TREFI[0 +: 9]);
`endif

wire it_is_time_to_do_refresh_now  // tREFI is the "average" interval between REFRESH commands
`ifndef XILINX
		= (refresh_timing_count == TIME_TREFI[0 +: $clog2(TIME_TREFI)]);  // for verilator warning
`else
		= (refresh_timing_count == TIME_TREFI[0 +: 9]);
`endif

/* PLL dynamic phase shift is used in lieu of IODELAY2 primitive
`ifdef HIGH_SPEED
	// for phase-shifting incoming read DQS strobe with respect to 'ck' signal
	localparam JITTER_MARGIN_FOR_DQS_SAMPLING = 2;
	reg dqs_delay_sampling_margin;
	reg previous_delayed_dqs_r;
`endif
*/

`ifdef HIGH_SPEED
reg need_to_assert_reset_clk;

always @(posedge clk)  // 'clk_serdes' or 'ck' is only turned on after clk is turned on
begin
	if(reset) need_to_assert_reset_clk <= 1;
	
	else if(locked_previous) need_to_assert_reset_clk <= 0;
end

	`ifdef USE_SERDES
		always @(posedge clk_serdes) locked_previous <= locked;
	`else
		always @(posedge ck) locked_previous <= locked;
	`endif


// localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DOMAIN = 3;

// to synchronize signal in clk domain to ck domain
// reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DOMAIN-1:0] need_to_assert_reset_ck;

genvar ff_clk_ck;

generate
	for(ff_clk_ck = 0; ff_clk_ck < NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DOMAIN;
	    ff_clk_ck = ff_clk_ck + 1)
	begin: clk_to_ck
	
		always @(posedge ck)
		begin
			if(reset) need_to_assert_reset_ck[ff_clk_ck] <= 0;
			
			else begin
				if(ff_clk_ck == 0)
					need_to_assert_reset_ck[ff_clk_ck] <= need_to_assert_reset_clk;
				
				else need_to_assert_reset_ck[ff_clk_ck] <=
					 need_to_assert_reset_ck[ff_clk_ck-1];
			end
		end
	end		
endgenerate


// localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN = 3;

// to synchronize signal in clk domain to ck_270 domain
// reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN-1:0] need_to_assert_reset_ck_270;

genvar ff_clk_ck_270;

generate
	for(ff_clk_ck_270 = 0; 
		ff_clk_ck_270 < NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_270_DOMAIN;
	    ff_clk_ck_270 = ff_clk_ck_270 + 1)
	begin: clk_to_ck_270
	
		always @(posedge ck_270)
		begin
			if(reset) need_to_assert_reset_ck_270[ff_clk_ck_270] <= 0;
			
			else begin
				if(ff_clk_ck_270 == 0)
					need_to_assert_reset_ck_270[ff_clk_ck_270] <= need_to_assert_reset_clk;
				
				else need_to_assert_reset_ck_270[ff_clk_ck_270] <=
					 need_to_assert_reset_ck_270[ff_clk_ck_270-1];
			end
		end
	end		
endgenerate


// localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DYNAMIC_90_DOMAIN = 3;

// to synchronize signal in clk domain to ck_dynamic_90 domain
// reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DYNAMIC_90_DOMAIN-1:0] need_to_assert_reset_ck_dynamic_90;

genvar ff_clk_ck_dynamic_90;

generate
	for(ff_clk_ck_dynamic_90 = 0; ff_clk_ck_dynamic_90 < NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DYNAMIC_90_DOMAIN;
	    ff_clk_ck_dynamic_90 = ff_clk_ck_dynamic_90 + 1)
	begin: clk_to_ck_dynamic_90
	
		always @(posedge ck_dynamic_90)
		begin
			if(reset) need_to_assert_reset_ck_dynamic_90[ff_clk_ck_dynamic_90] <= 0;
			
			else begin
				if(ff_clk_ck_dynamic_90 == 0)
					need_to_assert_reset_ck_dynamic_90[ff_clk_ck_dynamic_90] <= need_to_assert_reset_clk;
				
				else need_to_assert_reset_ck_dynamic_90[ff_clk_ck_dynamic_90] <=
					 need_to_assert_reset_ck_dynamic_90[ff_clk_ck_dynamic_90-1];
			end
		end
	end		
endgenerate

assign need_to_assert_reset = 
need_to_assert_reset_ck_dynamic_90[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_DOMAIN_TO_CK_DYNAMIC_90_DOMAIN-1];


// to solve STA setup timing violation due to 'wait_count'
localparam [FIXED_POINT_BITWIDTH-1:0] COUNTER_INCREMENT_VALUE = 512;
reg [$clog2(COUNTER_INCREMENT_VALUE):0] counter_state;
reg [$clog2(MAX_TIMING/COUNTER_INCREMENT_VALUE):0] num_of_increment_done;


// See https://www.eevblog.com/forum/fpga/brianhg_ddr3_controller-open-source-ddr3-controller/msg3805064/#msg3805064
// for an explanation of using half-rate on the commands generation, 
// but still achieving full-rate DRAM commands transaction with the usage of 
// either (an OSERDES with a serialization factor of 2) or (2 words ck/2 in, ck out FIFO),
// and command enqueue/dequeue signal which take into account of the number of ck cycles had passed.
// This is to get around the STA setup timing violation issues related to commands generation block.

// to generate a signal that only enqueues the 333.333MHz FIFO with 83.333MHz input ONCE
// 333.333MHz (ck_180) and 83.333MHz (clk_serdes) have the same 180 phase shift and are generated from same PLL
// hence eliminates the need for asynchronous FIFO and its complicated CDC issue

reg enqueue_dram_command_bits;
reg previous_enqueue_dram_command_bits;

always @(posedge ck_180) 
	previous_enqueue_dram_command_bits <= enqueue_dram_command_bits;


wire fifo_command_is_empty;


// https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3668329/#msg3668329
localparam NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_SERDES_DOMAIN_TO_CK_180_DOMAIN = 3;

// to synchronize signal in clk_serdes domain to ck_180 domain
reg [NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_SERDES_DOMAIN_TO_CK_180_DOMAIN-1:0] enqueue_dram_command_bits_ck_180;

genvar ff_clk_serdes_ck_180;

generate
	for(ff_clk_serdes_ck_180 = 0; 
	    ff_clk_serdes_ck_180 < NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_SERDES_DOMAIN_TO_CK_180_DOMAIN;
	    ff_clk_serdes_ck_180 = ff_clk_serdes_ck_180 + 1)
	begin: clk_serdes_to_ck_180
	
		always @(posedge ck_180)
		begin
			if(reset) 
			begin
				enqueue_dram_command_bits_ck_180[ff_clk_serdes_ck_180] <= 0;
			end
			
			else begin
				if(ff_clk_serdes_ck_180 == 0) 
				begin
					enqueue_dram_command_bits_ck_180[ff_clk_serdes_ck_180] <= enqueue_dram_command_bits;
				end
				
				else begin
					enqueue_dram_command_bits_ck_180[ff_clk_serdes_ck_180] <=
				 		enqueue_dram_command_bits_ck_180[ff_clk_serdes_ck_180-1];					 		
				 end
			end
		end
	end		
endgenerate


parameter NUM_OF_DRAM_COMMAND_BITS = 7;

// prepends the DDR command signals with "r_" so as to 
// differentiate between the stored FIFO signals and actual signals sent to DRAM
reg r_ck_en, r_cs_n, r_ras_n, r_cas_n, r_we_n, r_reset_n, r_odt;
reg [ADDRESS_BITWIDTH-1:0] r_address;
reg [BANK_ADDRESS_BITWIDTH-1:0] r_bank_address;

// {ck_en, cs_n, ras_n, cas_n, we_n, reset_n, odt, address, bank_address}
reg [NUM_OF_DRAM_COMMAND_BITS-1:0] dram_command_bits_to_be_sent_to_dram; 
reg [NUM_OF_DRAM_COMMAND_BITS-1:0] dram_command_bits_sent_to_dram;  // data alignment due to write AL latency

reg [ADDRESS_BITWIDTH-1:0] dram_address_bits_to_be_sent_to_dram; 
reg [ADDRESS_BITWIDTH-1:0] dram_address_bits_sent_to_dram;  // data alignment due to write AL latency

reg [BANK_ADDRESS_BITWIDTH-1:0] dram_bank_address_bits_to_be_sent_to_dram; 
reg [BANK_ADDRESS_BITWIDTH-1:0] dram_bank_address_bits_sent_to_dram;  // data alignment due to write AL latency

					
wire [NUM_OF_DRAM_COMMAND_BITS-1:0] fifo_command_dequeue_value;					

wire [NUM_OF_DRAM_COMMAND_BITS-1:0] NOP_DRAM_COMMAND_BITS = 
    // keeps the values of 'r_ck_en' and 'r_reset_n' since they are at logic '0' during DRAM initialization
		  	 			{r_ck_en, 1'b0, 1'b1, 1'b1, 1'b1, r_reset_n, 1'b0};


wire [NUM_OF_DRAM_COMMAND_BITS-1:0] dram_command_bits_clk_serdes = 
						{r_ck_en, r_cs_n, r_ras_n, r_cas_n, r_we_n, r_reset_n, r_odt};
					
wire [NUM_OF_DRAM_COMMAND_BITS-1:0] dram_command_bits_ck_180;
wire [ADDRESS_BITWIDTH-1:0] dram_address_bits_ck_180;
wire [BANK_ADDRESS_BITWIDTH-1:0] dram_bank_address_bits_ck_180;


// for synchronizing multi-bits signals from clk_serdes domain to ck_180 domain
wire afifo_main_state_is_empty;
wire afifo_main_state_is_full;
wire afifo_dram_command_bits_is_empty;
wire afifo_dram_command_bits_is_full;
wire afifo_dram_address_bits_is_empty;
wire afifo_dram_address_bits_is_full;
wire afifo_dram_bank_address_bits_is_empty;
wire afifo_dram_bank_address_bits_is_full;

parameter CLOCK_FACTOR_BETWEEN_CLK_SERDES_AND_CK = CLK_SERDES_PERIOD/CK_PERIOD;
//parameter num_of_afifo_main_state_entries = 1 << $clog2(CLOCK_FACTOR_BETWEEN_CLK_SERDES_AND_CK);

async_fifo 
#(
	.WIDTH($clog2(NUM_OF_DDR_STATES)),
	.NUM_ENTRIES(),
	.TO_SIMPLIFY_FULL_LOGIC(1),
	.TO_SIMPLIFY_EMPTY_LOGIC(0)
) 
afifo_main_state
(
	.write_reset(reset),
    .read_reset(reset),

    // Read.
    .read_clk(ck_180),
    .read_en(1'b1),
    .read_data(main_state_ck_180),
    .empty(afifo_main_state_is_empty),

    // Write
    .write_clk(clk_serdes),
    .write_en(1'b1),
    .full(afifo_main_state_is_full),
    .write_data(main_state)
);

async_fifo 
#(
	.WIDTH(NUM_OF_DRAM_COMMAND_BITS),
	.NUM_ENTRIES(),
	.TO_SIMPLIFY_FULL_LOGIC(1),
	.TO_SIMPLIFY_EMPTY_LOGIC(0)
) 
afifo_dram_command_bits
(
	.write_reset(reset),
    .read_reset(reset),

    // Read.
    .read_clk(ck_180),
    .read_en(1'b1),
    .read_data(dram_command_bits_ck_180),
    .empty(afifo_dram_command_bits_is_empty),

    // Write
    .write_clk(clk_serdes),
    .write_en(1'b1),
    .full(afifo_dram_command_bits_is_full),
    .write_data(dram_command_bits_clk_serdes)
);

async_fifo 
#(
	.WIDTH(ADDRESS_BITWIDTH),
	.NUM_ENTRIES(),
	.TO_SIMPLIFY_FULL_LOGIC(1),
	.TO_SIMPLIFY_EMPTY_LOGIC(0)
) 
afifo_dram_address_bits
(
	.write_reset(reset),
    .read_reset(reset),

    // Read.
    .read_clk(ck_180),
    .read_en(1'b1),
    .read_data(dram_address_bits_ck_180),
    .empty(afifo_dram_address_bits_is_empty),

    // Write
    .write_clk(clk_serdes),
    .write_en(1'b1),
    .full(afifo_dram_address_bits_is_full),
    .write_data(r_address)
);

async_fifo 
#(
	.WIDTH(BANK_ADDRESS_BITWIDTH),
	.NUM_ENTRIES(),
	.TO_SIMPLIFY_FULL_LOGIC(1),
	.TO_SIMPLIFY_EMPTY_LOGIC(0)
) 
afifo_dram_bank_address_bits
(
	.write_reset(reset),
    .read_reset(reset),

    // Read.
    .read_clk(ck_180),
    .read_en(1'b1),
    .read_data(dram_bank_address_bits_ck_180),
    .empty(afifo_dram_bank_address_bits_is_empty),

    // Write
    .write_clk(clk_serdes),
    .write_en(1'b1),
    .full(afifo_dram_bank_address_bits_is_full),
    .write_data(r_bank_address)
);

async_fifo 
#(
	.WIDTH($clog2(MAX_WAIT_COUNT)+1),
	.NUM_ENTRIES(),
	.TO_SIMPLIFY_FULL_LOGIC(1),
	.TO_SIMPLIFY_EMPTY_LOGIC(0)
) 
afifo_wait_count
(
	.write_reset(reset),
    .read_reset(reset),

    // Read.
    .read_clk(ck_180),
    .read_en(1'b1),
    .read_data(wait_count_ck_180),
    .empty(afifo_wait_count_is_empty),

    // Write
    .write_clk(clk_serdes),
    .write_en(1'b1),
    .full(afifo_wait_count_is_full),
    .write_data(wait_count)
);

reg is_STATE_READ_AP;

always @(posedge ck_180) is_STATE_READ_AP <= (main_state == STATE_READ_AP);

reg about_to_issue_rdap_command;
						
always @(posedge ck_180)
begin
	about_to_issue_rdap_command <= 
						(wait_count_ck_180 == (NUM_OF_READ_PIPELINE_REGISTER_ADDED + 
						NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_90_DOMAIN-1));
end
	   	  
reg issue_actual_rdap_command_now, previous_issue_actual_rdap_command_now;

always @(posedge ck_180)
	issue_actual_rdap_command_now <= (is_STATE_READ_AP && about_to_issue_rdap_command);
 		   	  
always @(posedge ck_180)
	previous_issue_actual_rdap_command_now <= issue_actual_rdap_command_now;

reg after_new_command_is_issued;
reg main_state_remains_the_same;
reg no_need_to_issue_rdap_command;

reg previous_enqueue_dram_command_bits_ck_180;

always @(posedge ck_180)
	previous_enqueue_dram_command_bits_ck_180 <=
	 	enqueue_dram_command_bits_ck_180[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_SERDES_DOMAIN_TO_CK_180_DOMAIN-1];

always @(posedge ck_180)
	main_state_remains_the_same <=
	 	//(enqueue_dram_command_bits_ck_180[NUM_OF_FF_SYNCHRONIZERS_FOR_CLK_SERDES_DOMAIN_TO_CK_180_DOMAIN-1] &&
	 	// ~previous_enqueue_dram_command_bits_ck_180);  // not used due to post P&R STA setup timing violation
		(previous_main_state_ck_180 == main_state_ck_180);
	
always @(posedge ck_180)  // rdap command needs to be issued only ONCE
	no_need_to_issue_rdap_command <= (issue_actual_rdap_command_now == previous_issue_actual_rdap_command_now);
	
always @(posedge ck_180)
	after_new_command_is_issued <= (main_state_remains_the_same);// && (no_need_to_issue_rdap_command);

always @(posedge ck_180)					
begin
	if(after_new_command_is_issued)
	begin
		dram_command_bits_to_be_sent_to_dram <= NOP_DRAM_COMMAND_BITS;  // sends NOP command to DRAM
		dram_address_bits_to_be_sent_to_dram <= 0;  // don't care in NOP
		dram_bank_address_bits_to_be_sent_to_dram <= 0;  // don't care in NOP
		
		//else dram_command_bits_to_be_sent_to_dram <= fifo_command_dequeue_value;  // keep the DRAM command unchanged 
	end
				
	else begin
		dram_command_bits_to_be_sent_to_dram <= dram_command_bits_ck_180;  // new DRAM command
		dram_address_bits_to_be_sent_to_dram <= dram_address_bits_ck_180;  // new DRAM address
		dram_bank_address_bits_to_be_sent_to_dram <= dram_bank_address_bits_ck_180;  // new DRAM bank address
	end
end

// data alignment due to write AL latency
always @(posedge ck_180)  dram_command_bits_sent_to_dram <= dram_command_bits_to_be_sent_to_dram;
always @(posedge ck_180)  dram_address_bits_sent_to_dram <= dram_address_bits_to_be_sent_to_dram;
always @(posedge ck_180)  dram_bank_address_bits_sent_to_dram <= dram_bank_address_bits_to_be_sent_to_dram;

assign {ck_en, cs_n, ras_n, cas_n, we_n, reset_n, odt, address, bank_address} = 
		{dram_command_bits_sent_to_dram, dram_address_bits_sent_to_dram, dram_bank_address_bits_sent_to_dram};
									
									
// the purpose of using FIFO instead of just a register is 
// to allow stuffing multiple user request commands where permitted in between command execution inside DRAM
// One example would be where other banks may be activated while a write command was just sent 
// and a write burst is taking place.
sync_fifo
#(
	.WIDTH(NUM_OF_DRAM_COMMAND_BITS),
	.SIZE(4),
	.ALMOST_FULL_THRESHOLD(1)
	//.ALMOST_EMPTY_THRESHOLD(1)
)
fifo_command
(
    .clk(ck_180),  // 333.333MHz
    .reset(reset),
    .full(),
    .almost_full(),
    
    // such that 83.333MHz signal is only sampled once, assuming no immediate consecutive DRAM commands
    .enqueue_en(~previous_enqueue_dram_command_bits & enqueue_dram_command_bits),
    
    .enqueue_value(dram_command_bits),
    .empty(fifo_command_is_empty),
    //.almost_empty(),
    
    // it is always dequeued to satisfy DRAM manufacturer timing, 
    // but need to change for tRRD (ACTIVATE command when write burst is still ongoing) later
    .dequeue_en(1'b1),
    .dequeue_value(fifo_command_dequeue_value)
);


always @(posedge ck_180)
begin
	if(reset) previous_main_state_ck_180 <= STATE_RESET;
	
	else previous_main_state_ck_180 <= main_state_ck_180;
end
		
`endif

reg [$clog2(NUM_OF_WRITE_DATA/DATA_BURST_LENGTH):0] num_of_data_write_burst_had_finished;
reg [$clog2(NUM_OF_READ_DATA/DATA_BURST_LENGTH):0] num_of_data_read_burst_had_finished;


`ifdef HIGH_SPEED
always @(posedge clk_serdes)  // 83.333MHz
`else
always @(posedge clk)
`endif
begin
	if(reset)
	begin
		main_state <= STATE_RESET;
		previous_main_state <= STATE_RESET;

		enqueue_dram_command_bits <= 1;
		
		r_ck_en <= 0;
		
		// low-level signals (except reset_n) are asserted high initially
		r_cs_n <= 1;			
		r_ras_n <= 1;
		r_cas_n <= 1;
		r_we_n <= 1;
		
		// 200 us is required before RST_N goes inactive.
		// CKE must be maintained inactive for 10 ns before RST_N goes inactive.
		r_reset_n <= 0;

		r_odt <= 0;
		
		r_address <= 0;
		r_bank_address <= 0;
		wait_count <= 0;
		counter_state <= 0;
		num_of_increment_done <= 0;
		refresh_Queue <= 0;
		postponed_refresh_timing_count <= 0;
		refresh_timing_count <= 0;
		MPR_ENABLE <= 0;
		MPR_Read_had_finished <= 0;
		
		write_is_enabled <= 0;
		read_is_enabled <= 0;
		
		num_of_data_write_burst_had_finished <= 0;
		num_of_data_read_burst_had_finished <= 0;

		data_read_is_ongoing <= 0;
		
		/* PLL dynamic phase shift is used in lieu of IODELAY2 primitive
		`ifdef HIGH_SPEED
			// such that the first phase delay calibration iteration does not abort
			dqs_delay_sampling_margin <= JITTER_MARGIN_FOR_DQS_SAMPLING;
			
			idelay_inc_dqs_r <= 0;
			idelay_counter_enable <= 0;
		`endif
		*/
	end

`ifdef HIGH_SPEED
	else
`else
	// DDR signals are 90 degrees phase-shifted in advance
	// with reference to outgoing 'clk' (clk_slow) signal to DDR RAM
	// such that all outgoing DDR signals are sampled in the middle of during posedge(ck)
	// For more info, see the initialization sequence : https://i.imgur.com/JClPQ6G.png
	
	// since clocked always block only updates the new data at the next clock cycle, 
	// clk90_slow_posedge is used instead of clk180_slow_posedge to produce a new data 
	// that is 180 degree phase-shifted, for which the data will be sampled in the middle by 'clk_slow' ('clk')
	// Since DIVIDE_RATIO=4, so in half clock period for fast 'ck' signal, there are 2 slow 'clk' cycles
	// Therefore, clk90_slow_posedge is 1 'clk' cycle in advance/early with comparison to clk180_slow_posedge
	// The purpose of doing so is to have larger setup and hold timing margin for positive edge of clk_slow,
	// while still obeying DDR3 datasheet specifications
	else if(clk90_slow_posedge)  // generates new data at 180 degrees before positive edge of clk_slow
`endif
	begin
	
		if(write_enable) write_is_enabled <= 1;
		if(read_enable) read_is_enabled <= 1;		

		data_read_is_ongoing <= 0;
	
		wait_count <= wait_count + 1;
		previous_main_state <= main_state;

		/* PLL dynamic phase shift is used in lieu of IODELAY2 primitive
		`ifdef HIGH_SPEED
			previous_delayed_dqs_r <= delayed_dqs_r;
		`endif
		*/
		
		if(extra_read_or_write_cycles_had_passed) postponed_refresh_timing_count <= 0;
			
		else postponed_refresh_timing_count <= postponed_refresh_timing_count + 1;

		if(it_is_time_to_do_refresh_now) refresh_timing_count <= 0;
			
		else refresh_timing_count <= refresh_timing_count + 1;


		if(~locked)  // PLL outputs are not locked to desired frequencies
		begin	
			main_state <= STATE_PLL_LOCK_ISSUE;  // PLL debug state
		end
	

		// defaults the command signals high & only pulse low for the 1 clock when need to issue a command.
		r_cs_n <= 1;			
		r_ras_n <= 1;
		r_cas_n <= 1;
		r_we_n <= 1;
		
		enqueue_dram_command_bits <= 0;
								
		// https://i.imgur.com/VUdYasX.png
		// See https://www.systemverilog.io/ddr4-initialization-and-calibration
		case(main_state)
		
			// reset active, wait for 200us, reset inactive, wait for 500us, CKE=1, 
			// then, wait for tXPR = 10ns + tRFC = 10ns + 110ns (tRFC of 1GB memory = 110ns), 
			// Then the MRS commands begin.
			
			STATE_RESET :  // https://i.imgur.com/ePuqhsY.png
			begin
				r_ck_en <= 0;
			
				//if(wait_count[$clog2(TIME_INITIAL_RESET_ACTIVE):0] > TIME_INITIAL_RESET_ACTIVE-1)
				if(num_of_increment_done[$clog2(TIME_INITIAL_RESET_ACTIVE/COUNTER_INCREMENT_VALUE):0] >
					(TIME_INITIAL_RESET_ACTIVE/COUNTER_INCREMENT_VALUE))
				begin
					r_reset_n <= 1;  // reset inactive
					main_state <= STATE_RESET_FINISH;
					wait_count <= 0;
					counter_state <= 0;
					num_of_increment_done <= 0;
					
					enqueue_dram_command_bits <= 1;
				end
				
				else begin
					r_reset_n <= 0;  // reset active
					main_state <= STATE_RESET;
					
					enqueue_dram_command_bits <= 0;
				end
				
				// The following code is trying to solve the setup timing violation brought by
				// large comparison hardware for signal with long bitwidth such as 'wait_count'
				// In other words, the following code is doing increment for the 'wait_count' signal
				// in multiple consecutive stages
				if(counter_state == COUNTER_INCREMENT_VALUE)
				begin
					counter_state <= 1;
					num_of_increment_done <= num_of_increment_done + 1;
				end
				
				else begin
					counter_state <= counter_state + 1;
				end
			end
			
			STATE_RESET_FINISH :
			begin
				// ODT must be driven LOW at least tIS prior to CKE being registered HIGH.
				// For tIS, see https://i.imgur.com/kiJI0pY.png or 
				// the section "Command and Address Setup, Hold, and Derating" inside
				// https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/dram/ddr3/2gb_ddr3_sdram.pdf#page=99
				// as well as the JESD79-3F DDR3 SDRAM Standard which adds further derating which means
				// another 25 ps to account for the earlier reference point
				
				r_odt <= 0;  // tIs = 195ps (170ps+25ps) , this does not affect anything at low speed testing mode
				
				//if(wait_count > TIME_INITIAL_CK_INACTIVE-1)
				if(num_of_increment_done[$clog2(TIME_INITIAL_CK_INACTIVE/COUNTER_INCREMENT_VALUE):0] > 
					(TIME_INITIAL_CK_INACTIVE/COUNTER_INCREMENT_VALUE))
				begin
					r_ck_en <= 1;  // CK active
					main_state <= STATE_INIT_CLOCK_ENABLE;
					wait_count <= 0;
					counter_state <= 0;
					num_of_increment_done <= 0;		

					// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
					r_cs_n <= 0;
					r_ras_n <= 1;
					r_cas_n <= 1;
					r_we_n <= 1;	
					
					enqueue_dram_command_bits <= 1;									
				end
						
				else begin
					main_state <= STATE_RESET_FINISH;
					
					enqueue_dram_command_bits <= 0;
				end		
				
				// The following code is trying to solve the setup timing violation brought by
				// large comparison hardware for signal with long bitwidth such as 'wait_count'
				// In other words, the following code is doing increment for the 'wait_count' signal
				// in multiple consecutive stages
				if(counter_state == COUNTER_INCREMENT_VALUE)
				begin
					counter_state <= 1;
					num_of_increment_done <= num_of_increment_done + 1;
				end
				
				else begin
					counter_state <= counter_state + 1;
				end					
			end
			
			STATE_INIT_CLOCK_ENABLE :
			begin
				r_ck_en <= 1;  // CK active

				// The clock must be present and valid for at least 10ns (and a minimum of five clocks)			
				if(wait_count > TIME_TXPR-1)
				begin
					// prepare necessary parameters for next state
					main_state <= STATE_INIT_MRS_2;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_2;
			        r_address <= 0;  // CWL=5; ASR disabled; SRT=normal; dynamic ODT disabled					
					
					wait_count <= 0;
					
					// no more NOP command in next 'ck' cycle, transition to MR2 command
					r_cs_n <= 0;
					r_ras_n <= 0;
					r_cas_n <= 0;
					r_we_n <= 0;
					
					enqueue_dram_command_bits <= 1;					
				end
				
				else begin
					main_state <= STATE_INIT_CLOCK_ENABLE;
					
					enqueue_dram_command_bits <= 0;
				end				
			end
			
			STATE_INIT_MRS_2 :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating MRS command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	

		        // CWL=5; ASR disabled; SRT=normal; dynamic ODT disabled
		        r_address <= 0;
		                    			
				if(wait_count > TIME_TMRD-1)
				begin
					// prepare necessary parameters for MR3 state				
					main_state <= STATE_INIT_MRS_3;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_3;
					
					// MPR Read function enabled
					r_address <= {{(ADDRESS_BITWIDTH-MPR_BITWIDTH_COMBINED){1'b0}}, 
								MPR_ENABLE, MPR_READ_FUNCTION};					
					
					wait_count <= 0;
					
					// no more NOP command in next 'ck' cycle, transition to MR3 command
					r_cs_n <= 0;
					r_ras_n <= 0;
					r_cas_n <= 0;
					r_we_n <= 0;	
					
					enqueue_dram_command_bits <= 1;					
				end
				
				else begin
					main_state <= STATE_INIT_MRS_2;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_2;
					
					enqueue_dram_command_bits <= 0;
				end		
			end

			STATE_MRS3_TO_MRS1 :
			begin				
				if(wait_count > TIME_TMRD-1) begin
					// prepare necessary parameters for next MRS				
					main_state <= STATE_INIT_MRS_1;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_1;
					
					wait_count <= 0;
					
                    // no more NOP command in next 'ck' cycle, transition to MR1 command
                    r_cs_n <= 0;
                    r_ras_n <= 0;
                    r_cas_n <= 0;
                    r_we_n <= 0;
                    
                    enqueue_dram_command_bits <= 1;
				
					`ifdef USE_x16
					
						`ifdef RAM_SIZE_1GB
						r_address <= {Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
							
						`elsif RAM_SIZE_2GB
						r_address <= {1'b0, Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
							
						`elsif RAM_SIZE_4GB
						r_address <= {2'b0, Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
						`endif
					`else
						
						`ifdef RAM_SIZE_1GB
						r_address <= {1'b0, Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
							
						`elsif RAM_SIZE_2GB
						r_address <= {2'b0, Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
							
						`elsif RAM_SIZE_4GB
						r_address <= {MR1[0], 2'b0, Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
						`endif
					`endif		
				end
				
				else begin
					main_state <= STATE_MRS3_TO_MRS1;
					
					enqueue_dram_command_bits <= 0;
				end					
			end

			STATE_WAIT_AFTER_MPR :
			begin
				// NOP command in next 'ck' cycle, transition to IDLE command
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;
			
				if(wait_count[$clog2(TIME_TMOD):0] > TIME_TMOD-1) begin
					main_state <= STATE_IDLE;							
					wait_count <= 0;
					
					MPR_Read_had_finished <= 1;
					
					enqueue_dram_command_bits <= 1;
				end
				
				else begin
					main_state <= STATE_WAIT_AFTER_MPR;
					
					enqueue_dram_command_bits <= 0;
				end					
			end

			STATE_INIT_MRS_3 :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating MRS command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	
				

				if(MPR_ENABLE == 0)
				begin
				
					// finished MPR System Read Calibration, just returned from STATE_READ_DATA
					if((previous_main_state == STATE_READ_DATA) || MPR_Read_had_finished)
					begin
						MPR_Read_had_finished <= 1;
					
						main_state <= STATE_WAIT_AFTER_MPR;						
					end
					
					// must fully initialize the DDR3 chip, right past the ZQCL before we can read the MPR.
					// See Figure 48 on the DDR RAM initialization sequence
					// See https://www.eevblog.com/forum/fpga/ddr3-initialization-sequence-issue/msg3599352/#msg3599352
					else begin
						main_state <= STATE_MRS3_TO_MRS1;			
					end
					
					enqueue_dram_command_bits <= 0;
				end
				
				// Issues READ command at tMOD after MRS command is issued
				// See Figure 59 or https://i.imgur.com/K1qrMME.png 
				else if(wait_count > TIME_TMOD-1) begin
					// MPR System READ calibration is a must for all Micron DDR RAM, 
					// still issue NOP command in next 'ck' cycle due to some FF synchronizer chain delay
					// but transition to RDAP state first
					r_ck_en <= 1;
					r_cs_n <= 0;			
					r_ras_n <= 1;
					r_cas_n <= 1;
					r_we_n <= 1;

					enqueue_dram_command_bits <= 1;
											
					main_state <= STATE_READ_AP;
					r_address <= 0;  // required by spec, see Figure 59 or https://i.imgur.com/K1qrMME.png

					/*
					• A[1:0] must be set to 00 as the burst order is fixed per nibble.
					• A2 selects the burst order: BL8, A2 is set to 0, and the burst order is fixed to 0, 1, 2, 3, 4, 5, 6, 7.
					• A[9:3] are "Don't Care."
					• A10 is "Don't Care."
					• A11 is "Don't Care."
					• A12: Selects burst chop mode on-the-fly, if enabled within MR0.
					• A13 is a "Don't Care"
					• BA[2:0] are "Don't Care."
					*/
					
					wait_count <= 0;
				end	
				
				else begin
					main_state <= STATE_INIT_MRS_3;
					
					enqueue_dram_command_bits <= 0;
				end						
			end
			
			STATE_INIT_MRS_1 :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating MRS command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	

				// enable DLL; 34ohm output driver; no additive latency (AL); write leveling disabled;
		        // termination resistors disabled; TDQS disabled; output enabled
		        // Note: Write leveling : See https://i.imgur.com/mKY1Sra.png
		        // Note: AL can be used somehow to save a few cycles when you ACTIVATE multiple banks
		        //       interleaved, but since this is really high-end optimisation, 
		        //       it is set to value of 0 for now.
		        // 		 See https://blog.csdn.net/xingqingly/article/details/48997879 and
		        //       https://application-notes.digchip.com/024/24-19971.pdf for more context on AL
		        //r_address <= {1'b0, MR1, 2'b0, Q_OFF, TDQS, 1'b0, RTT_9, 1'b0, WL, RTT_6, ODS_5, AL, RTT_2, ODS_2, DLL_EN};
		                    			
				if(wait_count > TIME_TMRD-1)
				begin
					// prepare necessary parameters for next state				
					main_state <= STATE_INIT_MRS_0;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_0;

					`ifdef USE_x16
					
						`ifdef RAM_SIZE_1GB
						r_address <= {PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
									READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
							
						`elsif RAM_SIZE_2GB
						r_address <= {1'b0, PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
									READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
							
						`elsif RAM_SIZE_4GB
						r_address <= {2'b0, PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
									READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
						`endif
					`else
						
						`ifdef RAM_SIZE_1GB
						r_address <= {1'b0, PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
									READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
							
						`elsif RAM_SIZE_2GB
						r_address <= {2'b0, PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
									READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
							
						`elsif RAM_SIZE_4GB
						r_address <= {MR0[0], 2'b0, PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
									READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
						`endif
					`endif
							
					wait_count <= 0;
					
					// no more NOP command in next 'ck' cycle, transition to MR0 command
					r_cs_n <= 0;
					r_ras_n <= 0;
					r_cas_n <= 0;
					r_we_n <= 0;	
					
					enqueue_dram_command_bits <= 1;					
				end
				
				else begin
					main_state <= STATE_INIT_MRS_1;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_1;
					
					enqueue_dram_command_bits <= 0;
				end	
			end

			STATE_INIT_MRS_0 :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating MRS command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	

		        // fixed burst length 8; sequential burst; CL=5; DLL reset yes
		        // write recovery=5; precharge PD: DLL on
		        
		        // write recovery: WR(cycles) = roundup ( tWR (ns)/ tCK (ns) )
		        // tWR sets the number of clock cycles between the completion of a valid write operation and
		        // before an active bank can be precharged
		        
		        // DLL reset: see https://www.issi.com/WW/pdf/EN-I002-Clock%20Consideration_QUAD&DDR2.pdf
		        // when initialising the RAM for the first time, the memory controller's clock outputs are
		        // usually disabled, so the RAM is "running" at 0 Hz (it's not running)
		        // after enabling the clock outputs, the DLL in the RAM needs to "lock" to the clock signal. 
		        // A DLL reset "unlocks" the DLL, so that it can lock again to the current clock speed.
		        // If you enable "DLL reset" in MR0, then you must wait for tDLLK before using any functions 
		        // that require the DLL (read commands or ODT synchronous operations)
		        // The DLL is used to generate DQS.  For read commands, the DRAM drives DQ and DQS pins, and 
		        // uses the DLL to maintain a 90 degrees phase shift between DQ and DQS
		        // tDLLK (512) cycles of clock input are required to lock the DLL.
		        
		        // CL=5 is not supported with the DLL disabled according to the Micron spec.
		        // The Micron spec says something about DQSCK "starting earlier" with the DLL off and 
		        // this seems to mean that we actually have CL=4 when CL=5 is configured.  
		        // See https://i.imgur.com/iuS45ld.png where tDQSCK starts AL + CL - 1 cycles 
		        // after the READ command. 

				//r_address <= {1'b0, MR0, 2'b0, PRECHARGE_PD, WRITE_RECOVERY, DLL_RESET, 1'b0, CAS_LATENCY_46, 
				//			READ_BURST_TYPE, CAS_LATENCY_2, BURST_LENGTH};
				
				if(wait_count > TIME_TMOD-1)
				begin
					main_state <= STATE_ZQ_CALIBRATION;
					wait_count <= 0;
					
					// no more NOP command in next 'ck' cycle, transition to ZQCL command
					r_cs_n <= 0;
					r_ras_n <= 1;
					r_cas_n <= 1;
					r_we_n <= 0;	
					r_address[A10] <= 1;	
					
					enqueue_dram_command_bits <= 1;				
				end
				
				else begin
					main_state <= STATE_INIT_MRS_0;
					r_bank_address <= ADDRESS_FOR_MODE_REGISTER_0;
					
					enqueue_dram_command_bits <= 0;
				end				
			end
			
			STATE_ZQ_CALIBRATION :  // https://i.imgur.com/n4VU0MF.png
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ZQCL command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	
	
				if(wait_count > TIME_TZQINIT-1)
				begin
					MPR_ENABLE <= MPR_EN;  // turns on MPR System Read Calibration
					
					if(MPR_EN) main_state <= STATE_PRECHARGE;
						
					else main_state <= STATE_IDLE;
					
					wait_count <= 0;
					
					enqueue_dram_command_bits <= 1;
				end
				
				else begin
					main_state <= STATE_ZQ_CALIBRATION;
					
					enqueue_dram_command_bits <= 0;
				end					
			end
			
			STATE_IDLE :
			begin
				// for simplicity, idle state coding will only transit to STATE_ACTIVATE and STATE_REFRESH
				// will implement state transition to STATE_WRITE_LEVELLING and STATE_SELF_REFRESH later
			
				// Rationale behind the priority encoder logic coding below:
				// We can queue (or postpone) up to maximum 8 REFRESH commands inside the RAM. 
				// If 8 are queued, there's a high priority request. 
				// If 4-7 are queued, there's a low-priority request.
				// If 0-3 are queued, no more are needed (both request signals are false).
				// So READ/WRITE normally go first and refreshes are done while no READ/WRITE are pending, 
				// unless there is a danger that the queue underflows, 
				// in which case it becomes a high-priority request and READ/WRITE have to wait.  
				// So, in summary, it is to overcome the performance penalty due to refresh lockout at the 
				// higher densities
				
				if((refresh_Queue == 0) && 
				   (user_desired_extra_read_or_write_cycles <= MAX_NUM_OF_REFRESH_COMMANDS_POSTPONED))
				begin
					refresh_Queue <= user_desired_extra_read_or_write_cycles;
				end	


				if (high_Priority_Refresh_Request)
		        begin
					// need to do PRECHARGE before REFRESH, see tRP

					r_ck_en <= 1;
					r_cs_n <= 0;			
					r_ras_n <= 0;
					r_cas_n <= 1;
					r_we_n <= 0;
					r_address[A10] <= 0;
		            main_state <= STATE_PRECHARGE;
		            
		            enqueue_dram_command_bits <= 1;
		            
		            wait_count <= 0;
		        end
		        
		        else if (write_is_enabled | read_is_enabled)
		        begin
		        	r_ck_en <= 1;
		        	r_cs_n <= 0;
		        	r_ras_n <= 0;
		        	r_cas_n <= 1;
		        	r_we_n <= 1;
		        	
		        	r_bank_address <= i_user_data_address[ADDRESS_BITWIDTH +: BANK_ADDRESS_BITWIDTH];
		        		
		            main_state <= STATE_ACTIVATE;
		            
		            enqueue_dram_command_bits <= 1;
		            
		            wait_count <= 0;
		        end
		        
		        else if (low_Priority_Refresh_Request)
		        begin
					// need to do PRECHARGE before REFRESH, see tRP

					r_ck_en <= 1;
					r_cs_n <= 0;			
					r_ras_n <= 0;
					r_cas_n <= 1;
					r_we_n <= 0;
					r_address[A10] <= 0;
		            main_state <= STATE_PRECHARGE;
		            
		            enqueue_dram_command_bits <= 1;
		            
		            wait_count <= 0;
				end

				else begin
					main_state <= STATE_IDLE;
					
					enqueue_dram_command_bits <= 0;
				end					
			end
			
			STATE_ACTIVATE :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	
				
				// need to make sure that 'i_user_data_address' remains unchanged for at least tRRD
				// because according to the definition of tRAS and tRC, it is legal within the same bank, 
				// to issue either ACTIVATE or REFRESH when bank is idle, and PRECHARGE when a row is open
				// So, we have to keep track of what state each bank is in and which row is currently active
				
				// will implement multiple consecutive ACT commands (TIME_RRD) in later stage of project
				// However, tRRD mentioned "Time ACT to ACT, different banks, no PRE between" ?
				
				r_bank_address <= i_user_data_address[ADDRESS_BITWIDTH +: BANK_ADDRESS_BITWIDTH];
				
				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b1,  // use auto-precharge, but it is don't care in this state
								i_user_data_address[A10-1:0]
							};

												
				// auto-precharge (AP) is easier for now. In the end it will be manually precharging 
				// (since many read/write commands may use the same row) but for now, simple is better	
						
				if(wait_count > TIME_TRCD-1)
				begin
					if(write_is_enabled)  // write operation has higher priority during loopback test
					begin					
						// no more NOP command in next 'ck' cycle, transition to WRAP command
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 0;
						r_we_n <= 0;
						
						`ifdef LOOPBACK
							// for data loopback, auto-precharge will close the bank, 
							// which means read operation could not proceeed without reopening the bank
							main_state <= STATE_WRITE;
							
							r_address <= 	// column address
									   	{
									   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
									   		
									   		1'b1,  // A12 : no burst-chop
											i_user_data_address[A10+1], 
											1'b0,  // A10 : no auto-precharge
											i_user_data_address[A10-1:0]
										};							
						`else
							main_state <= STATE_WRITE_AP;
							
							r_address <= 	// column address
									   	{
									   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
									   		
									   		1'b1,  // A12 : no burst-chop
											i_user_data_address[A10+1], 
											1'b1,  // A10 : use auto-precharge
											i_user_data_address[A10-1:0]
										};							
						`endif
						
						wait_count <= 0;
						
						enqueue_dram_command_bits <= 1;
					end
						
					else if(read_is_enabled) 
					begin
						// still issue NOP command in next 'ck' cycle due to some FF synchronizer chain delay
						// but transition to RDAP state first
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 1;
						r_we_n <= 1;
						
						main_state <= STATE_READ_AP;
						
						wait_count <= 0;
						
						enqueue_dram_command_bits <= 1;
					end
					
					else begin
						main_state <= STATE_ACTIVATE;
						
						enqueue_dram_command_bits <= 0;
					end						
				end
				
				else begin
					main_state <= STATE_ACTIVATE;
					
					enqueue_dram_command_bits <= 0;
				end				
			end
						
			STATE_WRITE :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;

				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b0,  // A10 : no auto-precharge
								i_user_data_address[A10-1:0]
							};	
				
				if(wait_count >= TIME_TCCD-1)
				begin
					main_state <= STATE_WRITE_DATA;
					wait_count <= 0;
					
					// minus 1 to avoid one extra data write burst operation					
					if(num_of_data_write_burst_had_finished == (NUM_OF_WRITE_DATA/DATA_BURST_LENGTH)-1)
					begin
						// finished all intended data write bursts
						write_is_enabled <= 0;
						
						// do not reset the following value here to zero to avoid restarting data write bursts
						//num_of_data_write_burst_had_finished <= 0;
					end
					
					else begin
						// continues data write bursts			
						//write_is_enabled <= 1;
						num_of_data_write_burst_had_finished <= num_of_data_write_burst_had_finished + 1;
										
						// issues WR command again
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 0;
						r_we_n <= 0;							
                    end					
				end
				
				else begin
					main_state <= STATE_WRITE;
				end							
			end
						
			STATE_WRITE_AP :
			begin
				// https://www.systemverilog.io/understanding-ddr4-timing-parameters#write
			
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	

				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b1,  // A10 : use auto-precharge
								i_user_data_address[A10-1:0]
							};				
													
				if(wait_count >= TIME_TCCD-1)
				begin
					main_state <= STATE_WRITE_DATA;
					wait_count <= 0;
					
					// minus 1 to avoid one extra data write burst operation					
					if(num_of_data_write_burst_had_finished == (NUM_OF_WRITE_DATA/DATA_BURST_LENGTH)-1)
					begin
						// finished all intended data write bursts
						write_is_enabled <= 0;
						
						// do not reset the following value here to zero to avoid restarting data write bursts
						//num_of_data_write_burst_had_finished <= 0;
					end
					
					else begin
						// continues data write bursts			
						//write_is_enabled <= 1;
						num_of_data_write_burst_had_finished <= num_of_data_write_burst_had_finished + 1;
										
						// issues WR command again
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 0;
						r_we_n <= 0;						
                    end					
				end
				
				else begin
					main_state <= STATE_WRITE_AP;
				end		
			end
			
			STATE_WRITE_DATA :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;				

				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								
								`ifdef LOOPBACK
									1'b0,  // A10 : no auto-precharge
								`else
									1'b1,  // A10 : use auto-precharge
								`endif
								
								i_user_data_address[A10-1:0]
							};	

				enqueue_dram_command_bits <= 0;
							
				if(wait_count > (TIME_TBURST+TIME_TDAL)-1)
				begin
					`ifdef LOOPBACK
						// still issue NOP command in next 'ck' cycle due to some FF synchronizer chain delay
						// but transition to RD state first
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 1;
						r_we_n <= 1;
						
						main_state <= STATE_READ;						
						wait_count <= 0;				
					`else
						main_state <= STATE_IDLE;
						wait_count <= 0;
					`endif
					
					write_is_enabled <= 0;
					num_of_data_write_burst_had_finished <= 0;
				end

				else if(wait_count >= TIME_TBURST-1)  // just finished a single data write burst
				begin
					// minus 1 to avoid one extra data write burst operation					
					if(num_of_data_write_burst_had_finished == (NUM_OF_WRITE_DATA/DATA_BURST_LENGTH)-1)
					begin
						// finished all intended data write bursts
						main_state <= STATE_WRITE_DATA;
						write_is_enabled <= 0;
						
						// do not reset the following value here to zero to avoid restarting data write bursts
						//num_of_data_write_burst_had_finished <= 0;
					end
					
					else begin
						// continues data write bursts			
						//write_is_enabled <= 1;
						wait_count <= 0;
						num_of_data_write_burst_had_finished <= num_of_data_write_burst_had_finished + 1;
						
						`ifdef LOOPBACK
							main_state <= STATE_WRITE;
						`else
							main_state <= STATE_WRITE_AP;
						`endif
										
						// issues WR command again
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 0;
						r_we_n <= 0;						
					end
				end			
			end
						
			STATE_READ :
			begin
				r_ck_en <= 1;
				
				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;					
				
				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b0,  // A10 : no auto-precharge
								i_user_data_address[A10-1:0]
							};			

                write_is_enabled <= 0;
			
				if(wait_count ==  
						(NUM_OF_READ_PIPELINE_REGISTER_ADDED+
						 NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_90_DOMAIN)-1)
				begin							
					main_state <= STATE_READ_ACTUAL;

					// for tRPRE , needed for the incoming read preamble bits
					data_read_is_ongoing <= 1;
				end	
				
				else begin									
					main_state <= STATE_READ;
					
					enqueue_dram_command_bits <= 0;
				end							
			end
					
			STATE_READ_ACTUAL :
			begin
				r_ck_en <= 1;

                // localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
                // only a single, non-repeating ACT command is executed, and followed by NOP commands
                r_cs_n <= 0;
                r_ras_n <= 1;
                r_cas_n <= 1;
                r_we_n <= 1;
									
				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b0,  // A10 : no auto-precharge
								i_user_data_address[A10-1:0]
							};
				
				write_is_enabled <= 0;
								
				if(wait_count >= TIME_TCCD-1)
				begin
					main_state <= STATE_READ_DATA;
					wait_count <= 0;
				
					if(num_of_data_read_burst_had_finished == 
						(NUM_OF_READ_DATA/DATA_BURST_LENGTH))
					begin
						// finished all intended data read bursts
						read_is_enabled <= 0;
						
						// do not reset the following value here to zero to avoid restarting data read bursts
						//num_of_data_read_burst_had_finished <= 0;
					end
					
					else begin
						// continues data read bursts			
						//read_is_enabled <= 1;
						num_of_data_read_burst_had_finished <= num_of_data_read_burst_had_finished + 1;
						
						data_read_is_ongoing <= 1;
										
						// issues RD command again
						r_ck_en <= 1;
						r_cs_n <= 0;			
						r_ras_n <= 1;
						r_cas_n <= 0;
						r_we_n <= 1;						
                    end					
				end
				
				else begin
					main_state <= STATE_READ_ACTUAL;
				end																	
			end

			STATE_READ_AP :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	
								
				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b1,  // A10 : use auto-precharge
								i_user_data_address[A10-1:0]
							};			

                write_is_enabled <= 0;

				if(wait_count ==  
						(NUM_OF_READ_PIPELINE_REGISTER_ADDED+
						 NUM_OF_FF_SYNCHRONIZERS_FOR_CK_180_DOMAIN_TO_CK_90_DOMAIN)-1)
				begin							
					main_state <= STATE_READ_AP_ACTUAL;
					
					// for tRPRE , needed for the incoming read preamble bits
					data_read_is_ongoing <= 1;
				end
				
				else begin									
					main_state <= STATE_READ_AP;
					
					enqueue_dram_command_bits <= 0;
				end							
			end
					
			STATE_READ_AP_ACTUAL :
			begin
				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	
				
				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								1'b1,  // A10 : use auto-precharge
								i_user_data_address[A10-1:0]
							};

                write_is_enabled <= 0;
				
				if(wait_count >= (TIME_RL-TIME_TRPRE))
				begin
					// issues RD command again
					r_ck_en <= 1;
					r_cs_n <= 0;			
					r_ras_n <= 1;
					r_cas_n <= 0;
					r_we_n <= 1;					
									
					main_state <= STATE_READ_DATA;
					wait_count <= 0;

					data_read_is_ongoing <= 1;
					
					enqueue_dram_command_bits <= 1;
				end
								
				else begin								
					main_state <= STATE_READ_AP_ACTUAL;
					
					enqueue_dram_command_bits <= 0;
				end						
			end

			STATE_READ_DATA :
			begin
				// See https://patents.google.com/patent/US7911857B1/en for pre-amble detection circuit
				// For read, we get the unshifted DQS from the RAM and have to phase-shift it ourselves before 
				// using it as a clock strobe signal to sample (or capture) DQ signal
			
				enqueue_dram_command_bits <= 0;

                write_is_enabled <= 0;
                
				r_address <= 	// column address
						   	{
						   		i_user_data_address[(A12+1) +: (ADDRESS_BITWIDTH-A12-1)],
						   		
						   		1'b1,  // A12 : no burst-chop
								i_user_data_address[A10+1], 
								
								`ifdef LOOPBACK
									1'b0,  // A10 : no auto-precharge
								`else
									1'b1,  // A10 : use auto-precharge
								`endif
								
								i_user_data_address[A10-1:0]
							};	                
			
				if(wait_count > (TIME_TBURST + TIME_TRPST + TIME_TMPRR)-1)
				begin
					if(~MPR_Read_had_finished)  // MPR System Read Calibration is not done previously
					begin
						main_state <= STATE_INIT_MRS_3;
						
						// MPR_ENABLE is already set to ZERO in the next-IF block
						// MPR Read function disabled					
						r_address <= {{(ADDRESS_BITWIDTH-MPR_BITWIDTH_COMBINED){1'b0}}, 
									MPR_ENABLE, MPR_READ_FUNCTION};	
															
						// no more NOP command in next 'ck' cycle, transition to MR3 command
						r_cs_n <= 0;
						r_ras_n <= 0;
						r_cas_n <= 0;
						r_we_n <= 0;				
						
						wait_count <= 0;	
						
						enqueue_dram_command_bits <= 1;	
					end		
				end

				else if(wait_count > (TIME_TBURST + TIME_TRPST)-1)
				begin
					if(MPR_Read_had_finished)
					begin
						main_state <= STATE_IDLE;
						wait_count <= 0;
						
						read_is_enabled <= 0;
						num_of_data_read_burst_had_finished <= 0;	
					end
					
					else main_state <= STATE_READ_DATA;			
				end
								
				else if(wait_count >= TIME_TBURST-1) // just finished a single data read burst
				begin						
					if(num_of_data_read_burst_had_finished == 
						(NUM_OF_READ_DATA/DATA_BURST_LENGTH))
					begin
						// finished all intended data write bursts
						main_state <= STATE_READ_DATA;
						read_is_enabled <= 0;
						
						// do not reset the following value here to zero to avoid restarting data read bursts
						//num_of_data_read_burst_had_finished <= 0;
					end
					
					else begin

						MPR_ENABLE <= 1'b0;  // prepares to turn off MPR System Read Calibration mode after READ_DATA command finished	
					
						if(MPR_Read_had_finished)  // MPR System Read Calibration is already done previously
						begin					
							// continues data read bursts			
							//read_is_enabled <= 1;
							wait_count <= 0;
							num_of_data_read_burst_had_finished <= num_of_data_read_burst_had_finished + 1;
							
							`ifdef LOOPBACK
								main_state <= STATE_READ_ACTUAL;
							`else
								main_state <= STATE_READ_AP_ACTUAL;
							`endif

							data_read_is_ongoing <= 1;
											
							// issues RD command again
							r_ck_en <= 1;
							r_cs_n <= 0;			
							r_ras_n <= 1;
							r_cas_n <= 0;
							r_we_n <= 1;	
						end
						
						else begin
							main_state <= STATE_READ_DATA;
							
							// NOP command in next 'ck' cycle
							r_cs_n <= 0;
							r_ras_n <= 1;
							r_cas_n <= 1;
							r_we_n <= 1;								
						end
					end
				end
				
				`ifdef HIGH_SPEED
				else begin
					main_state <= STATE_READ_DATA;

                    // no change in DRAM command
                    r_ck_en <= r_ck_en;
                    r_cs_n <= r_cs_n;			
                    r_ras_n <= r_ras_n;
                    r_cas_n <= r_cas_n;
                    r_we_n <= r_we_n;	

					/*
					Your DQS IO logic is clocked by a clock. You need to align DQS to this clock. 
					If you sample DQS with the rising edge of the clock, you can get different responses:

					1. If you get always '0' which means that the clock rising edge already happened, 
					   but DQS rising edge didn't. DQS needs to be moved earlier by decreasing DQS delay.

					2. If you get always '1' which means that the clock rising edge happens after DQS edge. 
					   Therefore, DQS's delay must be increased.

					3. If you're somewhere in the middle (in the jitter zone) then DQS and clock are aligned.

					Of course, you don't need DQS data, you only need DQ data. Therefore you adjust DQ delays
					the same as DQS - every time you increase DQS delay, you also increase DQ delay as well.
					Every time you decrease DQS delay you decrease DQ delay. This way, if DQS shifts, you shift
					the DQ sampling point to follow DQS.
					*/
										
					/* PLL dynamic phase shift is used in lieu of IODELAY2 primitive
					if(MPR_ENABLE)
					begin
						// samples the delayed version of dqs_r for continous feedback to IDELAY2 primitive
						if(~delayed_dqs_r & ~previous_delayed_dqs_r)
						begin
							idelay_inc_dqs_r <= 0;  // 1st case : decrements delay value
							dqs_delay_sampling_margin <= dqs_delay_sampling_margin - 1;
						end
							
						else if(delayed_dqs_r & previous_delayed_dqs_r)
						begin
							idelay_inc_dqs_r <= 1;  // 2nd case : increments delay value
							dqs_delay_sampling_margin <= dqs_delay_sampling_margin + 1;
						end
						
						// see 3rd case
						if(dqs_delay_sampling_margin < JITTER_MARGIN_FOR_DQS_SAMPLING)
							idelay_counter_enable <= 0;  // disables delay feedback process, calibration is done
							
						else idelay_counter_enable <= 1;  // enables delay feedback process						
					end*/
				end
				`endif
			end
						
			STATE_PRECHARGE :
			begin
				// need to do PRECHARGE before REFRESH, see tRP

				r_ck_en <= 1;
				r_cs_n <= 0;			
				r_ras_n <= 0;
				r_cas_n <= 1;
				r_we_n <= 0;
				r_address[A10] <= 1;  // precharge ALL banks
				
				if(wait_count > TIME_TRP-1)
				begin
					if(MPR_ENABLE)  // MPR System Read Calibration has higher priority
					begin
						// prepare necessary parameters for next state				
						main_state <= STATE_INIT_MRS_3;
						r_bank_address <= ADDRESS_FOR_MODE_REGISTER_3;
						
						// MPR Read function enabled
						r_address <= {{(ADDRESS_BITWIDTH-MPR_BITWIDTH_COMBINED){1'b0}}, 
									MPR_ENABLE, MPR_READ_FUNCTION};					
						
						wait_count <= 0;
						
						// no more NOP command in next 'ck' cycle, transition to MR3 command
						r_cs_n <= 0;
						r_ras_n <= 0;
						r_cas_n <= 0;
						r_we_n <= 0;	
						
						enqueue_dram_command_bits <= 1;				
					end
					
					else begin					
						main_state <= STATE_REFRESH;
						wait_count <= 0;
						
						// no more NOP command in next 'ck' cycle, transition to REF command
						r_ck_en <= 1;
						r_cs_n <= 0;
						r_ras_n <= 0;
						r_cas_n <= 0;
						r_we_n <= 1;
						
						enqueue_dram_command_bits <= 1;
					end
				end
				
				else begin
					main_state <= STATE_PRECHARGE;
					
					enqueue_dram_command_bits <= 0;
				end				
			end
						
			STATE_REFRESH :
			begin
				// https://www.systemverilog.io/understanding-ddr4-timing-parameters#refresh
				
				// As for why the maximum absolute interval between any REFRESH command and the next REFRESH
				// command is nine times the maximum average interval refresh rate (9x tREFI), we are allowed 
				// to deviate from sending refresh to a DRAM chip by up to 9x the nominal period in a chain of 
				// up to 8 refresh commands that are queued to the chip to ensure the data held doesn't decay.
				// So we can send a spree of refresh commands, then wait some time (9x the nominal period) 
				// then send another spree because that works out to about the nominal period and the refresh
				// scheduler in the DRAM will do the rest
				
				// the max active -> precharge delay (tRAS) is also 9*tREFI, as we need to be precharged to 
				// issue a refresh, so if we leave the precharge command any later, the max refresh constraints 
				// would not be obeyed anymore

				r_ck_en <= 1;

				// localparam NOP = (previous_clk_en) & (ck_en) & (~cs_n) & (ras_n) & (cas_n) & (we_n);
				// only a single, non-repeating ACT command is executed, and followed by NOP commands
				r_cs_n <= 0;
				r_ras_n <= 1;
				r_cas_n <= 1;
				r_we_n <= 1;	

				enqueue_dram_command_bits <= 0;

				if(refresh_Queue > 0)
					refresh_Queue <= refresh_Queue - 1;  // a countdown trigger for precharge/refresh operation
				
				if(wait_count > TIME_TRFC-1)
				begin			
					main_state <= STATE_IDLE;
					wait_count <= 0;
				end
				
				else begin
					main_state <= STATE_REFRESH;
				end
			end
						
			STATE_WRITE_LEVELLING :
			begin
			
			end

			STATE_PLL_LOCK_ISSUE :
			begin
				if(previous_main_state != STATE_PLL_LOCK_ISSUE)  // just encountered PLL issue
					state_to_be_restored <= previous_main_state;  // for restoring state before entering PLL debug state					
			
				else if(locked)  // PLL outputs are now properly locked to their desired frequencies
					main_state <= state_to_be_restored;  // continues at where the FSM is previously paused
			end
			
			default : main_state <= STATE_IDLE;
			
		endcase
	end
end

endmodule

