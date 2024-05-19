// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

/* ---------------------------------------------------------------------------
*
* Confidential:  This file and all files delivered herewith are Micron Confidential Information.
*
*    File Name:  nand_die_model.V
*        Model:  BUS Functional
* Dependencies:  nand_parameters.vh
*
*        Email:  modelsupport@micron.com
*      Company:  Micron Technology, Inc.
*  Part Number:  MT29F
*
*  Description:  Micron NAND Verilog Model
*
*   Limitation:
*
*         Note:  This model does not model bit errors on read or write.
                 This model is a superset of all supported Micron NAND devices.
                 The model is configured for a particular device's parameters 
                 and features by the required include file, nand_parameters.vh.
*
*   Disclaimer:  THESE DESIGNS ARE PROVIDED "AS IS" WITH NO WARRANTY
*                WHATSOEVER AND MICRON SPECIFICALLY DISCLAIMS ANY
*                IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
*                A PARTICULAR PURPOSE, OR AGAINST INFRINGEMENT.
*
*                Copyright © 2006-2012 Micron Semiconductor Products, Inc.
*                All rights reserved
*
* Rev  Author          Date        Changes
* ---  --------------- ----------  -------------------------------
* 3.0      smk          10/13/2006  - Update of all previous NAND models. (2.x and below)
*                                     First release of new model capable of 
*                                     supporting all NAND products
* 3.1      smk          11/01/2006  - Added support for get/set features commands.
* 3.2      smk          11/28/2006  - Added ONFI read parameters support.
* 3.3      smk          01/09/2007  - Improved error handling
* 3.4      smk          01/18/2007  - Fixed page read problem when readmemh is
*                                     used to preload the flash array.
*                                     Fixed read behavior when Ce_n transitions
*                                     before Re_n
* 3.5      smk          06/13/2007  - Improved ONFI parameters page support  
* 4.0      smk          08/14/2007  - Fixed typo in clear_data_register task
*                                   - Fixed max block addressing issue
*                                   - Fixed IO tristate issue when Ce_n transitions under
*                                     certail conditions
*                                   - Disabled Erase during OTP mode
*                                   - Added Sync High-Speed NAND (ONFI 2.0) support
* 4.1      smk          11/7/2007   - Fixed problem where model did not exit read_unique_id mode. 
* 4.11     smk          11/16/2007  - Fixed read problem after change column addr following a 
*									  return to read mode after read status (78h-00h-05h-E0h) 
* 4.12     smk          01/16/2008  - Fixed 00h issue following multi-die-status read after
*                                     a non-multiplane operation on multi-plane devices with 
*									  multiple dies per CE
*						01/16/2008  - Fixed column addressing issue 
* 4.20     smk          02/12/2008  - Fixed CACHE READ LAST causing false error on
*                                   - block boundary crossing.
*                                   - Fixed missing Data and Dqs on last data byte read
* 4.21     smk          02/29/2008  - Fixed various ONFI 2.0 High-Speed NAND timing checks
* 4.22     smk          04/18/2008  - Fixed bad Io value when Re_n and Rb_n transition too
*                                     closely together
*                                   - Fixed tCAD issues
*							        - Fixed false tCSS timing violations during status read
* 4.30     smk          05/12/2008  - Added ONFI OTP lock_by_page support for certain devices
*                                   - Added boot block support for certain devices
*                                   - More tCAD fixes for high-speed nand devices
* 4.40     jmk          06/18/2008  - Fixed reset for ONFI features register 1
* 4.43     jjc          07/26/2008  - modified die_select to fix status_read cmd issued to ce2# device
* 4.50     jjc          08/18/2008  - qualified sync mode ale_del and cle_del to write operations fixes
*                                     read status 70h col_counter issue.  
*                                   - Added latch column address disable for erase block commands
*                                   - Commented clear_queued_planes from 00h read page commands
*                                   - Added logic to clear_queued_planes following read completion commands
*                                   - Added Copyback2 command qualifier to Cache Mode Command 11h for queuing
* 4.60    jjc           08/26/2008  - Added support for DAO part, including removal of cache register
*                                     dependency on program page with bypass_cache.  Added programmable MLC/SLC
*                                     and Bits Per Cell logic, common col counter fn, feature registers.
* 4.61    jjc           09/10/08    - added check for read following cache ready, array busy on program page
*                                   - Added sync to async mode for Reset command FFh.  
*                                   - Modified sync output data task with precomputed values to speed sims.  
*                                   - Added Program Page Cache Last Page timing support. 
* 4.62    jjc           09/16/08    - CMD 00h modified to reflect the switch from status mode to read mode,
*                                     rather than a guaranteed read operation.  
*                                     Read operation is signaled with address cycles.
* 4.62_col jjc          09/30/08    - Removed column loops, initializing of whole mem array in assoc array mode.
*                                   - Moved initializing mem array to write and erase tasks increasing performance.
* 4.63    jjc           10/15/08    - BPC_MAX, data reg, data reg out fixes for syntax issues related to vcs sims.
* 4.64   jjc            10/28/08    - Updated Feature Address for Drive Strength Output with M51H part
* 4.90   jjc            10/16/08    - Generated pre-computed values to improve performance.
*                                   - nand_mode[0] set onfi features and page sizing updates.
*                                   - sub_col_cnt divide fix.
* 5.00   jjc            11/05/08    - OTP fixes for addressing overflow limits and initialization. Added support for otp array in nand mode[0].
*                                   - Fixed Feature Address support for Drive Strength Output, between 80h and 10h addresses.
*                                   - Added Boot Block Lock Support.  Removed dependence of COL BITS from col counter.  
*                                   - Fixed type casting issues. Updated onfi features.  
*                                   - Fixed Random data read command issue following mult status read.  
*                                   - Allow set features to complete with WP# active.  
*                                   - Fixed error with Read Parameter Page cmd EC in nand_mode[0].
* 5.10   jjc            11/11/08    - Fixed Multi-die issue with Read ID Command.  
*                                   - Fixed memory_write and memory read tasks to handle DQ_BITS to page transfers to mem_array.  
* 5.20   jjc            12/10/08    - Added Multi-plane and Multi-Lun support.
*                                   - Fixed Race condition on clear_queued_planes.  
*                                   - Fix: clear sub col cnt during read cache sequ and read cache last ops
*                                   - Fix: disable ready during cache op, waiting for prev. cache to complete.
* 5.21   jjc            12/18/08    - Fix: Read Status prior to Read Command, needed to clear queued planes 
*                                           for MP/TP, added saw_cmnd_00h_stat logic.
* 5.22  jjc             1/14/09     - Fix: Blck Limit Exceeded error, remove = number of blocks, only greater than.  
* 5.30   jjc            1/5/09      - Added multiplane qualifiers for MP vs 2P.  Updated column counter for async data.  
*                                   - Moved copy_datareg_to_cachereg into load reg cache mode task.  
*                                   - Removed col valid from 3Ah cmd, 00h cmd should have set.  
* 6.00  jjc             1/30/09     - Multi-Lun back to back reads and erase blocks to different dies: 
*                                     removed task timing issues, allows die-select and cmd ident.  
*                                   - Modified column address logic for multi-lun operations, including change read column/write column ops and
*                                     die-select updates.
*                                   - Modified async read data output to support MLC data outputs.  
*                                   - Added Multi-plane with cache support.  
*                                   - Modified Mulitple plane access to two-plane device plane addresses to return to plane 0 with cmd completion.  
*                                   - Updated support for variable number of otp program partial cmds independent of non-otp program partial cmds.  
* 6.10  jjc             2/16/09     - Added clear ONFI Read signal in Read ID cmd.  Read ID (90h) following Read Parameter Page (ECh), did not
*                                     clear ONFI Read signal, thus Read ID did not load data into the data output.  
*                                   - Added CE Setup check in sync mode.  Sync Mode Reset updates.  
*                                   - LUN support updates.  Modified erase block to be block based not row based.
* 6.20  jjc             2/24/09     - Fixed Read ID (90 hex) command following Read Unique ID (ED hex) cmd, clr do rd unique flag.  
*                                   - Added RB_reset_n to avoid Rb_n_int collisions during erase block interrupted by reset cmd.  
*                                   - Added check for read mode 00 hex and nand mode [0]
* 7.00  jjc             3/5/09      - Added support for Read Cache Sequential Block Boundary crossing and LUN crossing check.  
*                                   - Fix: ONFI Read Parameter Page command returning data on all DQ in x16 mode, now only lower 8 DQ.  
*                                   - Fix: bpc vector size in fn_inc_col_counter.
* 7.10  jjc             3/9/09      - Added tCS check for sync mode.  
* 7.20  jjc             3/31/09     - Fix: Reset command busy generated an error for multi-lun parts.  
                                    - Removed unused erase_block task, added support for vendor sync data output.
                                    - Fixed Lock timing issue at initial power-up, no WP# with Lock Tight, and no new boundary address during lock-tight.
                                    - Added ECC Timing Set Features support.  
                                    - Modified Power-up timings.  
* 7.21  jjc             4/10/09     - Added support for bypass cache in async data input logic
* 7.20_soma jjc         4/21/09      
* 7.21_rel ew          	6/19/09     - Fix: Waiting enough time after 15h program cache command can now end program cache sequence
                                    - Fix: Corrected status register during second address input of multiplane program cache
                                    - Fix: Corrected BPC parameter settings in MLC chips
                                    - Fix: Fixed Legacy Read UID operation, updated unofficial Unique ID value, and added random read for legacy unique ID				    
                                    - Fix: 80h/A0h OTP Pgm also resets cache registers
                                    - Added ONFI 2.2 Reset LUN FAh command
                                    - Fix: In Sync mode, allow tCS to span multiple clk cycles and start tCAD accordingly
                                    - Fix: In Sync mode, changed tCS checking b/c even though tCS fails on first clk edge, it will meet tCS on next clk edge
                                    - Fix: In Sync mode, model now treats the units of tCKWR as number of clock cycles instead of ns
                                    - Fix: In Sync mode, fixed serial_read task in tb.v to not violate ALE/CLE tCALS during data output after tWHR/tCCS
* 7.22 ew          	9/3/09      - Fix: Corrected tm_rb_n_r/f times to use internal busy instead of global p_rb signal
                                    - Fix: Fixed address counter issue for multi-luns sharing same p_ce by adding new signal addr_cnt_en
                                    - Added new status_cmnd internal signal
                                    - Fix: Fixed status output when host is continually reading status in async mode by holding p_re low
                                    - Added option to turnoff timing error messages if user gives `define MDL_NO_TIME_ERRMSG
* 7.23 ew          	9/21/09     - Fix: Corrected bug where polling status during tDBSY of a muliplane read command would reset the selected planes
                                    - Correctly prints entire byte for DEBUG[2] messages during async data output
                                    - Added CMD_MP_OUTPUT option to dictate which plane outputs first after a multiplane read operation
                                    - Fix: Fixed read UID after 78h sts command to properly output data
* 7.24 ew          	11/6/09     - Fix: Page addr correctly increments if you do sts, 00h_read_data_mode, read_data, 31h
                                    - Fix: During read cache, after 31h, you can read status even if the chip is still fetching the first data
                                    - Fix: Rb_n pin and status register bit 6 now matches during read cache operations
                                    - Fix: 05h command will now interrupt detection of 00h-5addr-confirm cmd in multidie situations
                                    - Fix: Enhanced status register definitions during illegal otp program operations
                                    - Fix: Enabled random read during ONFI read param page and ONFI read UID 
                                    - Fix: Corrected false tCS timing errors in sync mode
                                    - Testbench: Added status polling option to wait_ready task via `define STS_POLL
                                    - nand_model.v: added T4B4C2D2 4 die configuration (class M)
* 7.25 ew          	7/19/10     - Fix: Status outputs E0h status if you wait a long enough time after 31h read cache command (after 31h, status now transitions 80h->C0h->E0h)
                                    - Fix: During Cache read, if the time between 3Fh and array_load_done was less than tWB_delay, then model never returned to ready status
                                    - Removed MultiPlane Address Checking (LUN address bits must match) in classifications with no LUN bits (b/c #LUN per CE = 1)
                                    - Added flag (force_sts_fail) to force the program or erase operation to fail and output E1h status
                                    - De-Asserting the chip (bringing CE# low) will force the chip to no longer drive the DQS pin
                                    - Fix: Updated @ pos/negedge IoX_enable events to allow for a 0.5ns error, in case of real-type precision issues
                                    - Added ONFI 2.2 Program Clear Set feature option
                                    - nand_model.v: added T4B2C2D2 4 die configuration (class X)
                                    - Fix: Col addr during 85h "pgm pause" is correctly updated for newly selected die
                                    - Fix: With WP enabled, Program operation after read operation incorrectly occurred
                                    - Removed "Dqs may not transition during command or address latch" check as it is no longer valid
                                    - Fix: Model will correctly release DQ bus (after tCHZ) when host disables CE at same time that Model drives data on DQ
* 7.26 ew          	 8/2/10     - Fix: Single Plane Read Page Cache Random 00h-31h can cross plane boundary
                                    - Fix: Read Page Cache Last 3Fh no longer initiates a new read operation to the array (no longer schedules array_load_done)
* 7.26_rel ew          11/17/10     - Fix: Pgm Clear now clears only the selected plane of the selected die
                                    - Fix: Pgm Clear incorrectly cleared the cache reg in middle of multiplane pgm commands
                                    - Fix: Pgm Clear incorrectly cleared the cache reg after receiving 85h-5addr change row address
                                    - Fix: If host interrupted a program cmd's data input with a read command, the 85h cmd did not resume the data input
                                    - Fix: updated tRR check to take into account die_select
                                    - Fix: tm_cle_clk and tm_ale_clk was incorrectly updated even though the chip was disabled, causing invalid tCCS violations
                                    - nand_model.v: exclude reset operations from the "70h prohibited during Multi-LUN ops" check
                                    - Added JEDEC RdID, Rd Parameter Page, Multiplane Pgm for applicable parts
                                    - Fix: Issuing reset during OTP mode will now exit the chip back into normal operation mode
* 7.27 ew, rv            2/7/11     - Fix: Giving Reset during Erase operation did not disable scheduled event where RB# returns ready after tBERS time
                                    - Changed erase operation to use go_busy task instead of scheduled events 
* 7.28 ew               9/19/11     - Added tWB and tWRCK check; fixed sync interface tRHW check
                                    - Fix: 05h read during Small Data Move now works
                                    - tb.v: Updated tasks to wait for tWB in all modes and to wait tRHW in sync mode
                                    - Fix: Copyaback Program 85h-5addr will now clear previously queued planes
                                    - Fix: Multidie Status Read 78h following Reset LUN FAh will not exectute another reset lun operation
                                    - Fix: Data was not outputted following interleaved read and erase operation
                                    - Fix: Interleaved commands on die0 would not de-select die0 during the interleaved die1 cmd (b/c go_busy task)
                                    - tCCS check following 85h change row/column address now works
* 7.29 ew               6/30/12     - Fix: Reading multiple status bytes in edo mode yielded xx after first byte
				    - Testbench: switching async timing mode will correctly update tb clock period
                                    - Fix: Pre-load or pre-read data calls to LUN1 mem_array selected the wrong block locations
                                    - Fix: Set feature bits for input/output warmup cycles were switched
                                    - Fix: Issuing die1 78h-00h, die0 78h-31h did not auto-increment row addr on die0
                                    - Fix: Data following multiplane copyback read will follow CMD_MP_OUTPUT option
                                    - Fix: There were false tCCS errors during 78h multi-lun status read issued to a different lun
                                    - Fix: Reset during program cache froze model by executing next program cache after reset had finished
                                    - Added new simple checker for new command received during LUN busy
                                    - Fix: Get feature following read unique ID actually returned unique ID data
* 7.30 ew                8/7/12     - Added previous owner's (jjc) sv updates for dynamic memory solution



--------------------------------------------------------------------------- */
`timescale 1ns / 1ps

module nand_die_model (Io, Cle, Ale, Ce_n_i, Clk_We_n, Wr_Re_n, Wp_n, Rb_n, Pre, Lock, Dqs, ML_rdy, Rb_lun_n, PID, ENi, ENo, Dqs_c, Re_c);

`include "nand_defines.vh"
`include "nand_parameters.vh"

//-----------------------------------------------------------------
// DEBUG options
//-----------------------------------------------------------------
// DEBUG[0] = debug
// DEBUG[1] = multi die debug
// DEBUG[2] = data debug
// DEBUG[3] = command debug
// DEBUG[4] = queued planes debug
// parameter DEBUG = 5'b11110;
parameter DEBUG = 5'b00000;
// set this parameter to match the inverse of the timescale "a / b" ratio
// This parameter is used to make small adjustments to timing checks that
//  have rounding problems that arise from large numbers and time resolution
//  For example: 1ns / 1ps,   TS_RES_ADJUST = 0.001
//  example 2:   1ps / 1ps,    TS_RES_ADJUST = 1
parameter TS_RES_ADJUST = 0.001;

//----------------------------------
//Model limit parmaeters
//----------------------------------
parameter MAX_BLOCKS =  (1 << BLCK_BITS) -1;
parameter MAX_COL    =   (1 << COL_BITS) -1;
parameter MAX_ROWS   =   (1 << ROW_BITS) -1;
parameter NUM_ONFI_PARAMS =             768; //# of required ONFI parameter bytes (including redundancies) 
parameter PRELOAD_SIZE    =               0; // Redefine this param during instantiation if defining INIT_MEM to preload mem_array via readmemh

//----------------------------------
//Supported command set parameters
//----------------------------------
parameter CMD_BASIC     =   4'h0;
parameter CMD_NEW       =   4'h1;
parameter CMD_ID2       =   4'h2;
parameter CMD_UNIQUE    =   4'h3;
parameter CMD_OTP       =   4'h4;
parameter CMD_2PLANE    =   4'h5;
parameter CMD_ONFI      =   4'h6;
parameter CMD_LOCK      =   4'h7;
parameter CMD_DRVSTR    =   4'h8;
parameter CMD_FEATURES  =   4'h9;
parameter CMD_ONFIOTP   =   4'hA;
parameter CMD_PAGELOCK  =   4'hB;
parameter CMD_BOOTLOCK  =   4'hD;
parameter CMD_MP        =   4'hE;
// Multi-die device indentifier
parameter CMD_MPRDWC    =   4'hF;
parameter CMD_ECC       =   4'h0;
parameter CMD_RESETLUN  =   4'h1;
parameter CMD_MP_OUTPUT =   4'h2; // if FEATURE_SET2[CMD_MP_OUTPUT] is 0, then plane0 data is output first; 1 means we output data from the plane associated with the ending 00h-5addr-30h sequence
parameter CMD_PGM_CLR	=   4'h3;
parameter CMD_JEDEC	=   4'h4;
parameter CMD_ONFI3	=   4'h5;
parameter CMD_DUMMY	=   4'h6;
//----------------------------------
parameter mds = 3'b000;

//------------------------------------
// Ports declaration and assignment
//------------------------------------
inout [DQ_BITS - 1 : 0] Io;
input                   Cle;
input                   Ale;
input                   Ce_n_i;
input                   Clk_We_n;  // Clk active high, We_n active low.
input                   Wr_Re_n;   // Wr_n active low, Re_n active low.  
input                   Re_c;      // Complementary of Wr_Re_n.  
input                   Wp_n;
output                  Rb_n;
input                   Pre;
input                   Lock;
inout 				    Dqs;
inout 				    Dqs_c;
output                  ML_rdy;  // multi-LUN checks 
output                  Rb_lun_n;  // multi-LUN checks 
input [ 2 : 0]          PID;
input                   ENi;
output                  ENo;

reg ENo;

//Since this model supports both async and sync parts, we'll re-assign the sync input pins
// to make the coding of the model consistent for both

    wire bypass_cache =1'b0;
    reg  sync_mode;
    reg  sync_enh_mode;

    wire    Clk         = Clk_We_n;
    wire    Wr_n        = Wr_Re_n ;
    wire    Wr_n_int    = Wr_Re_n && sync_mode;

wire                     We_n   = Clk_We_n;
wire                     Re_n   = Wr_Re_n ;

wire                     Rb_n;
reg  [DQ_BITS - 1 : 0]   Io_buf; //also Dq in sync mode
wire [DQ_BITS - 1 : 0]   Io_wire; 
wire 					 Dqs_wire;
reg						 Dqs_buf;
reg                      Rb_n_int;
reg                      Rb_reset_n;

//----------------------------------------
// Data storage and addressing variables
//----------------------------------------
`ifdef PACK
reg [(BPC_MAX*DQ_BITS) - 1 : 0] data_reg_packed0[0 : NUM_COL - 1]; //data register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] data_reg_packed1[0 : NUM_COL - 1]; //data register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] data_reg_packed2[0 : NUM_COL - 1]; //data register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] data_reg_packed3[0 : NUM_COL - 1]; //data register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] cache_reg_packed0[0 : NUM_COL - 1]; //cache register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] cache_reg_packed1[0 : NUM_COL - 1]; //cache register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] cache_reg_packed2[0 : NUM_COL - 1]; //cache register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] cache_reg_packed3[0 : NUM_COL - 1]; //cache register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] mem_array_packed [0 : NUM_ROW - 1] [0 : NUM_COL - 1]; //Main flash memory array
`endif 
reg [PAGE_SIZE - 1 : 0]         data_reg[0:NUM_PLANES -1]; //data register for each plane
reg [PAGE_SIZE - 1 : 0]         cache_reg[0:NUM_PLANES -1]; //cache register for each plane
reg [PAGE_SIZE - 1 : 0]         bit_mask; //cache register for each plane
reg [(BPC_MAX*DQ_BITS) - 1 : 0] data_out_reg; //data register for each plane
`ifdef MODEL_SV
typedef reg [0 : PAGE_BITS - 1] PackedOTPArrayType;
reg [PAGE_SIZE - 1 : 0]         OTP_array [PackedOTPArrayType];
typedef reg [0 : ROW_BITS-LUN_BITS - 1] PackedAssociativeArrayType;
reg [PAGE_SIZE - 1 : 0]         mem_array [PackedAssociativeArrayType]; //Main flash memory array
`else
reg [PAGE_SIZE - 1 : 0]         OTP_array [0 : OTP_ADDR_MAX - 1];
reg [PAGE_SIZE - 1 : 0]         mem_array [0 : NUM_ROW - 1]; //Main flash memory array
reg [ROW_BITS -1 :0]            memory_addr [0 : NUM_ROW - 1];
`endif
reg [DQ_BITS - 1 : 0]           rd_uid_id2_array [0 : MAX_COL]; //Special array for Read_ID_2 and Read_Unique
integer                         memory_index; // page based
integer                         memory_used;
reg [DQ_BITS - 1 : 0]           datain_reg[0:NUM_PLANES -1][7:0]; //data register for each plane
reg [2 : 0]                     datain_index;
reg [DQ_BITS - 1 : 0]           data;
reg [DQ_BITS - 1 : 0]           status_register; //nand device status
reg [DQ_BITS - 1 : 0]           status_register1;
`ifdef JEDEC_ARRAY_DEFINED
`else
				// dummy reg for backwards compatibility (older models will not have this reg declared in their nand_parameters.vh)
				// if it is already declared in nand_parameters.vh, then JEDEC_ARRAY_DEFINED should be `defined in that file
reg				jedec_params_array_unpacked; 
`endif
reg                             abort_en     = 1'b0;
reg [1:0]                       clr_fail_bit = 0; 
reg [1:0]                       fail_bit     = 0; 
reg [7 : 0]                     DriveStrength;
reg [COL_BITS -1 : 0]           col_addr; //decoded column address
reg [COL_BITS -1 : 0]           temp_col_addr;  // captures column address to be used when address phases complete with decoded die select 
reg [COL_BITS -1 : 0]           col_addr_dup;  // replaces column address during 85h cmds with row address phases.  
reg [31          : 0]           new_addr;
reg [ROW_BITS -1 : 0]           row_addr [0:NUM_PLANES -1]; //decoded row address
reg [ROW_BITS -1 : 0]           row_addr_last[0:NUM_PLANES -1];
reg [ROW_BITS -1 : 0]           copyback2_addr;
reg [COL_BITS -1 : 0]           multiplane_col_addr; //2plane decoded column address
reg [BLCK_BITS-1 : 0]           erase_block_addr;
reg [ROW_BITS -1 : 0]           otp_prog_addr;
reg                             array_prog_2plane;
reg [7:0]                       id_reg_addr;
reg [ROW_BITS -1 : 0]           cmnd_35h_row_addr;
`ifdef MODEL_SV
reg [3 : 0]                     pp_counter [PackedAssociativeArrayType]; //support for # of partial page programming checks
typedef reg [0 : BLCK_BITS]     PackedSeqPageArrayType;
reg [PAGE_BITS-1 : 0]           seq_page [PackedSeqPageArrayType]; //allows checks for prohibited random page programming
`else
reg [3 : 0]                     pp_counter [0 : NUM_ROW -1]; //support for # of partial page programming checks
reg [ROW_BITS -1 : 0]           pp_addr [0 : NUM_ROW -1];
reg [ROW_BITS -1 : 0]           pp_index;
reg [ROW_BITS -1 : 0]           pp_used;
reg [PAGE_BITS-1 : 0]           seq_page [0 : MAX_BLOCKS]; //allows checks for prohibited random page programming
`endif
reg [3 : 0]                     otp_counter [0 : OTP_ADDR_MAX-1]; //support for # of OTP partial page programming checks
reg                             OTP_page_locked [ 0 : OTP_ADDR_MAX]; // supports the OTP page by lock feature (not supported in all OTP devices)
reg [ROW_BITS -1 : 0]           UnlockAddrLower;
reg [ROW_BITS -1 : 0]           UnlockAddrUpper;
reg [3:0]                       BootBlockLocked; //some devices have blocks 0,1,2,3 as lockable 'boot' blocks
reg IoX;
reg IoX_enable; // only used during async data output

reg dqs_en = 0;                 //used in sync mode for devices that support it
reg drive_dqs = 0;              //indicate when model needs to start driving DQS; only used in sync conventional
reg release_dqs = 0;            //indicate when model should release DQS; only used in sync conventional
reg first_dqs = 0;              //used in HS timing checks
reg first_clk = 1;              //used in HS timing checks
reg new_clk   = 1;              //used in HS timing checks
wire [PAGE_BITS -1 : 0]		page_address = new_addr[PAGE_BITS-1:0];
wire [BLCK_BITS -1 : 0]		block_addr   = new_addr[(BLCK_BITS-1+PAGE_BITS):PAGE_BITS];
reg  [1:0]			LA;
reg				id_cmd_lun; // selects LUN to return target data on id commands, related to LUNs per target 
reg addr_cnt_en = 1;		// do we increment address counter (usually enabled, it is disabled for special cases)
reg [2:0]			temp_mem_exist;

reg   load_cache_en;
reg   load_cache_en_r;
reg   ld_reg_en;
//reg   ld_page_addr_good; // replaced by temp_mem_exist
integer ldthisPlane;
//integer ld_mem_mp_index; //local multi-plane memory index, replaced by directly using memory_index
reg [ROW_BITS -1 : 0] ld_load_row_addr; //multi-plane plane decoded row address
reg   corrupt_reg;	// Corrupt the data/cache register if we are doing a read operation illegally

reg [ROW_BITS -1 : 0] eb_lock_addr;
integer eb_thisPlane;
reg   [PAGE_BITS - 1 : 0] eb_page;
reg eb_unlocked_erase;
reg eb_boot_fail;
integer e;
integer eb_delay;

reg erase_blk_en  ;
reg erase_blk_en_r;
reg erase_blk_pls ;
integer erase_data;

//-----------------------------------------------
// Command decode, control, and state variables
//-----------------------------------------------
wire            Ce_n    ;  
reg             cmnd_70h;  // status mode 70h or 78h, else read mode
reg             cmnd_78h;  // status mode 70h or 78h, else read mode
wire		status_cmnd;	// any status command given
reg             cmnd_85h;  // random data input/ change write column indicator, used to capture col addr
reg             multiplane_op_rd;
reg             multiplane_op_wr;
reg             multiplane_op_erase;
reg             cache_op;
reg             saw_cmnd_65h;
reg             saw_cmnd_00h;  // flag to tell us if we saw 00h command that switches us back into read mode; flag is turned off when address cycle is detected
reg             saw_cmnd_00h_stat; 
reg             saw_cmnd_60h;
reg             saw_cmnd_60h_clear; 
reg             stat_to_rd_mode_c0h;
reg             do_read_id_2;
reg             do_read_unique;
reg             OTP_mode;
reg             OTP_pagelock;
reg             OTP_write;
reg             OTP_read;
reg             OTP_locked;
reg             ONFI_read_param;
reg             JEDEC_read_param; // we are reading JEDEC param if both ONFI_read_param and JEDEC_read_param are high
reg             disable_md_stat;
reg             ALLOWLOCKCOMMAND;
reg             LOCKTIGHT;
reg             LOCK_DEVICE;
reg             LockInvert;
reg             lock_por = 1'b0;
reg             edo_mode;
reg [2:0]       thisDieNumber;
reg             PowerUp_Complete;
reg             InitReset_Complete;
reg             ResetComplete;
reg             Rb_flush_n; // only used in BA
reg             Rb_abort_n; // only used in BA
reg             die_select;
reg [7:0]       lastCmd;
reg [NUM_PLANES >> 2:0] active_plane;
reg [NUM_PLANES >> 2:0] cache_rd_active_plane; // used to designate which plane should be outputting data in read cache
reg queued_plane [0: NUM_PLANES-1];
reg queued_plane_cache [0: NUM_PLANES-1]; // used to designate which planes are selected during rd cache so that plane will copy its data_reg to cache_reg
wire plane0;
wire plane1;
assign plane0 = queued_plane[0];
assign plane1 = queued_plane[1];
reg             rd_pg_cache_seqtl;
reg             multiplane_op_rd_cache;
integer         plane_addr;
reg             array_prog_done;
reg             otp_prog_done;
reg             array_load_done;
reg             cache_prog_last;
reg             col_valid;
reg             row_valid;
reg             cache_valid;
reg             rd_out;
reg             copyback =1'b0;
reg             copyback2;
reg             queued_copyback2;
reg             queued_load;
reg             erase_done;
reg             we_adl_active;
reg             saw_posedge_dqs;
reg             sync_output_active;
reg             dqs_enable;
reg             wait_for_cen;
reg             queue_status_output;
reg             check_idle;
wire            address_enable;
wire            command_enable;
wire            datain_sync;
wire            datain_async;
wire            data_out_enable_async;
wire            dqs_out_enable;
reg		datain_sync_enh;
reg		data_out_enable_sync_enh;
reg             col_addr_dis;
reg             MLC_SLC;
reg             reset_cmd;
reg             disable_ready_n;  // sequential cache read will continue busy even if previous read completes.  
reg             poss_rd_mode_err;
reg             force_sts_fail; // force pgm/ers operation to fail, thereby returning E1h status
reg             LUN_pgm_clear;
reg             saw_cmnd_81h_jedec; // only used in error messages

reg timezero;
reg clr_que_en_rd;
reg clr_que_en_wr;
reg ml_prohibit_cmd;
reg ml_rdy;
reg tWB_check_en;

reg   [0:0]                nand_mode  = 0;
reg             boot_block_lock_mode =1'b0;

//----------------------------------------
// Counters
//----------------------------------------
reg [COL_CNT_BITS -1 : 0]   col_counter;
reg [2           : 0]   sub_col_cnt;
reg [1           : 0]   sub_col_cnt_init;
integer                 addr_start;
integer                 addr_stop;
integer                 pl_cnt;
integer                 i;
reg [ROW_BITS -1 : 0]   j;
reg [COL_BITS -1 : 0]   k;
reg [3:0]               ROW_BYTES;
reg [3:0]               COL_BYTES;
reg [3:0]               ADDR_BYTES;

//----------------------------------------
// Timing checks
//----------------------------------------
realtime    tm_we_n_r;      //We_n rise timestamp
realtime    tm_we_n_r_ale;  //used in tCCS calculation
realtime    tm_we_n_f;      //We_n fall timestamp
realtime    tm_re_n_r;      //Re_n rise timestamp
realtime    tm_re_n_f;      //Re_n fall timestamp
realtime    tm_ce_n_r;      //Ce_n rise timestamp
realtime    tm_ce_n_f;      //Ce_n fall timestamp
realtime    tm_ale_r;       //Ale rise timestamp
realtime    tm_ale_f;       //Ale fall timestamp
realtime    tm_cle_r;       //Cle rise timestamp
realtime    tm_cle_f;       //Cle fall timestamp
realtime    tm_io_ztodata;  //high-z to data transition timestamp
realtime    tm_io_datatoz;  //data to high-z transition timestamp
realtime    tm_rb_n_r;      //Rb_n rise timestamp
realtime    tm_rb_n_f;      //Rb_n fall timestamp
realtime    tm_wp_n;        //Wp_n transition timestamp
realtime    tm_we_ale_r;    //Used in tADL timing violation calculation
realtime    tm_we_data_r;
realtime    tprog_done;     //array program done timestamp
realtime    tload_done;     //array load done timestamp
realtime    t_readtox;
realtime    t_readtoz;
time        UnlockTightTimeLow; 
time        UnlockTightTimeHigh; 
real        tWB_delay;
initial tWB_delay = tWB_max;      // will be assigned to either async or sync mode tWB value
integer ld_delay;

realtime    tm_cad_r	=   0;       //HS only : tCAD last clk edge
realtime    tm_clk_r	=   0;       //HS only : clk rise timestamp
realtime    tm_clk_f	=   0;       //HS only : clk fall timestamp
realtime    tm_dqs_r	=   0;       //HS only : dqs rise timestamp
realtime    tm_dqs_f	=   0;       //HS only : dqs fall timestamp
realtime    tm_wr_n_r	=   0;       //HS only : Wr_n rise timestamp
realtime    tm_wr_n_f	=   0;       //HS only : Wr_n fall timestamp
realtime    tm_wr_start =   0;       //HS only : first clock during data input
realtime    tm_wr_end	=   0;       //HS only : last clock edge during a write
realtime    tm_cle_clk  =   0;       //HS only : last command clock
realtime    tm_ale_clk  =   0;       //HS only : last address clock
realtime    tm_wr_n_clk =   0;       //HS only : last wr_n clock
realtime    tm_dq	=   0;       //HS only : dq transition time
real	    tCK_sync	=   0;       //HS only : calculate clock period

//Continuous Assignments
assign Io = Io_wire;
assign Dqs = Dqs_wire;  //sync mode only
assign Dqs_wire = (dqs_en) ? Dqs_buf : 1'bz;   //sync mode only
assign Io_wire = rd_out ? Io_buf : IoX ? {DQ_BITS{1'bx}} : {DQ_BITS{1'bz}};
assign Rb_n     = (Rb_n_int & Rb_flush_n & Rb_abort_n & Rb_reset_n)? 1'bz : 1'b0; // open-drain active low : HIGH = 1'bz, LOW = 1'b0
assign Rb_lun_n = (Rb_n_int & Rb_flush_n & Rb_abort_n & Rb_reset_n)? 1'b1 : 1'b0;
assign status_cmnd = cmnd_70h | (cmnd_78h & row_valid);

//----------------------------------------
// Error codes and reporting
//----------------------------------------
parameter   ERR_MAX_REPORTED =  -1; // >0 = report errors up to ERR_MAX_REPORTED, <0 = report all errors
parameter   ERR_MAX =           -1;  // >0 = stop the simulation after ERR_MAX has been reached, <0 = never stop the simulation
parameter   ERR_CODES =         10; // track up to 10 different error codes
parameter   MSGLENGTH =        256;
reg  [8*MSGLENGTH:1]           msg;
integer     ERR_MAX_INT =  ERR_MAX;
wire [ERR_CODES : 1]       EXP_ERR;
assign EXP_ERR = {ERR_CODES {1'b0}}; // the model expects no errors.  Can only be changed for debug by 'force' statement in testbench.
// Enumerated error codes (0 = unused)
parameter   ERR_MISC   =  1;
parameter   ERR_CMD    =  2;
parameter   ERR_STATUS =  3;
parameter   ERR_CACHE  =  4;
parameter   ERR_ADDR   =  5;  //seq page, 2plane, page read cache mode, internal data move addressing restrictions
parameter   ERR_MEM    =  6;
parameter   ERR_LOCK   =  7;
parameter   ERR_OTP    =  8;
parameter   ERR_TIM    =  9; //timing errors
parameter   ERR_NPP    = 10;

integer     errcount [1:ERR_CODES];
integer     warnings;
integer     errors;
integer     failures;
reg [8*12-1:0] err_strings [1:ERR_CODES];
initial begin : INIT_ERRORS
    integer i;
    warnings = 0;
    errors = 0;
    failures = 0;
    for (i=1; i<=ERR_CODES; i=i+1) begin
        errcount[i] = 0;
    end
    err_strings[ERR_MISC    ] =         "MISC";
    err_strings[ERR_CMD     ] =          "CMD";
    err_strings[ERR_STATUS  ] =       "STATUS";
    err_strings[ERR_CACHE   ] =        "CACHE";
    err_strings[ERR_ADDR    ] =         "ADDR";
    err_strings[ERR_MEM     ] =          "MEM";
    err_strings[ERR_LOCK    ] =         "LOCK";
    err_strings[ERR_NPP     ] = "Partial Page";
    err_strings[ERR_TIM     ] =       "Timing";
end 

//----------------------------------------
// Initialization
//----------------------------------------
initial begin
    PowerUp_Complete    =   1'b0;
    InitReset_Complete  =   1'b0;
    ResetComplete       =   1'b0;
    timezero            =   1'b0;
    timezero           <=#1 1'b1;
    copyback2           =   1'b0;
    Rb_flush_n          =   1'b1;
    Rb_abort_n          =   1'b1;
    Rb_reset_n          =   1'b1;
    cache_prog_last     =   1'b0;
    `ifdef SO
     sync_mode          =   1'b1;
    `else
    sync_mode           =   1'b0;
    `endif             
    sync_enh_mode       =   1'b0;
    datain_sync_enh	=   1'b0;
    data_out_enable_sync_enh = 1'b0;
    clr_que_en_rd       =   1'b0;
    clr_que_en_wr       =   1'b0;
    ml_prohibit_cmd     =   1'b0;
    ml_rdy              =   1'b1;
    tWB_check_en        =   1'b0;
    array_load_done     =   1'b0;
    array_prog_done     =   1'b0;
    active_plane        =      0;
    cache_rd_active_plane =    0;
    Rb_n_int            =   1'b1;
    tprog_done          =      0;
    tload_done          =      0;
    t_readtox           =      0;
    t_readtoz           =      0;
    edo_mode            =      0;
    col_valid           =   1'b0;
    col_addr            =      0;
    temp_col_addr       =      0;
    row_valid           =   1'b0;
    wait_for_cen        =   1'b0;
    queue_status_output =   1'b0;
    col_addr_dis        =   1'b0;
    datain_index        =      0;
    reset_cmd           =   1'b0;
    for (i=0;i<NUM_PLANES;i=i+1) begin
        row_addr[i] = 0;
    end
    clear_queued_planes;
    rd_pg_cache_seqtl   =   1'b0;
    multiplane_op_rd_cache = 1'b0;
    queued_copyback2    =   1'b0;
    queued_load         =   1'b0;
    cache_valid         =   1'b0;
    multiplane_op_erase =   1'b0;
    multiplane_op_rd    =   1'b0;
    multiplane_op_wr    =   1'b0;
    cache_op            =   1'b0;
    erase_done          =   1'b1;
    saw_cmnd_00h        =   1'b0;
    saw_cmnd_00h_stat   =   1'b0;
    saw_cmnd_65h        =   1'b0;
    stat_to_rd_mode_c0h =   1'b0;
    do_read_id_2        =   1'b0;
    do_read_unique      =   1'b0;
    addr_start          =      0;
    addr_stop           =      0;
    sync_output_active  =   1'b0;
    dqs_enable          =   1'b0;
    LockInvert          =      1;
    OTP_mode            =      0;
    OTP_pagelock        = FEATURE_SET[CMD_PAGELOCK];
    OTP_locked          =   1'b0;
    OTP_write           =   1'b0;
    OTP_read            =   1'b0;
    ONFI_read_param     =   1'b0;
    JEDEC_read_param    =   1'b0;
    rd_out              =   1'b0;
    pl_cnt              =      0;
    check_idle          =      0;
    UnlockAddrLower     = {ROW_BITS{1'b0}};
    UnlockAddrUpper     = {ROW_BITS{1'b1}};
    BootBlockLocked     =   4'h0;
    Io_buf             <= {DQ_BITS{1'bz}};
    Dqs_buf             =   1'bz;
    IoX_enable          =   1'b0;
    IoX                 =   1'b0;
    corrupt_reg 	=   1'b0;
    sub_col_cnt_init    =      0;
    sub_col_cnt         =      0;
    MLC_SLC             =   1'b0;
    disable_ready_n     =   1'b1;
    load_cache_en       =   1'b0;
    load_cache_en_r     =   1'b0;
    ld_reg_en           =   1'b0;
    cmnd_85h            =   1'b0;

    erase_blk_en        =   1'b0;
    erase_blk_en_r      =   1'b0;
    erase_blk_pls       =   1'b0;
    eb_delay            = (tLBSY_max - tWB_delay);
    poss_rd_mode_err    =   1'b0;
    force_sts_fail	=   1'b0;
    erase_data		=   {DQ_BITS{1'b1}};
    LUN_pgm_clear	=   1'b0;
    saw_cmnd_81h_jedec	=   1'b0;
`ifdef JEDEC_ARRAY_DEFINED
`else
    jedec_params_array_unpacked = 0;
`endif

    //Time output format
    $timeformat (-9, 3, " ns", 1);
    $sformat(msg, "Device is Powering Up ...");
    INFO(msg);
              
    if((NUM_DIE/NUM_CE) == 2) begin
      //  if((mds ==3'h0) | (mds ==3'h2) | (mds ==3'h4) | (mds ==3'h6)) id_cmd_lun = 1'b1;  // each target has 2 LUNs, and one LUN returns id data (avoids collisions)
        id_cmd_lun = 1'b1;
    end else 
        id_cmd_lun = 1'b1;  // each target has 1 LUN, the LUN returns target data

    //Determine how many address cycles we need
    if (ROW_BITS > 16) ROW_BYTES = 3;
    else if (ROW_BITS > 8) ROW_BYTES = 2;
    else ROW_BYTES = 1;
    if (COL_BITS > 16) COL_BYTES = 3;
    else if (COL_BITS > 8) COL_BYTES = 2;
    else COL_BYTES = 1;
    ADDR_BYTES = ROW_BYTES + COL_BYTES;

    // Initialize memory array to erased data
    // also initialize partial page counters to all 00s
`ifdef MODEL_SV
`else
    `ifdef FullMem
    for (j = 0; j <= NUM_ROW - 1; j = j + 1) begin
	pp_counter[j] = {4{1'b0}};
	mem_array [j] = {PAGE_SIZE{erase_data[0]}};
    end
    `endif
    for (j=0; j<= MAX_BLOCKS ; j=j+1) begin
        seq_page[j] = {PAGE_BITS{1'b0}};
    end
    `ifdef FullMem
    `else
    memory_used = 0;
    pp_used = 0;
    `endif
`endif
    for (j=0; j< OTP_ADDR_MAX; j=j+1) begin
        otp_counter[j] = 3'b000;
    end

    // initialize the OTP page locking tracker (for devices that support OTP lock by page)
    for (j=0;j < OTP_ADDR_MAX; j=j+1) begin
        OTP_page_locked[j] = 0;
    end
    
    init_onfi_params; // initialize read-only ONFI parameters, defined in ONFI spec

    //In multiple die configurations, we need a way to individually identify each device
    thisDieNumber = mds;
    if(mds%2==0) die_select = 1'b1;
    `ifdef INIT_MEM
    /*
    `ifdef x16
       $readmemh ("data.16.init", mem_array);
       $readmemh ("read_unq.16.init", rd_uid_id2_array);
       $readmemh ("otp.16.init", OTP_array);
    `else
       $readmemh ("data.8.init", mem_array);
       $readmemh ("read_unq.8.init", rd_uid_id2_array);
       $readmemh ("otp.8.init", OTP_array);
    `endif
    `ifdef FullMem
    `else
       //to use associative arrays with readmemh, we need to 
       //predefine the amount of data preloaded
       for (memory_used=0; memory_used<PRELOAD_SIZE; memory_used=memory_used+1) begin
           memory_addr[memory_used] = memory_used;
       end
    `endif
    */
    `else
`ifdef MODEL_SV
`else
        for (j=0; j < OTP_ADDR_MAX; j=j+1) begin
            OTP_array [j] = {PAGE_SIZE{erase_data[0]}};
        end
`endif
        //Set manufacturer's ID to 128'h05060708_090A0B0C_0D0E0F10_11121314 until defined
`ifdef x16
       for (k =0; k < 256 ; k=k+16) begin
            for (j=0;j<8;j=j+1) begin
                rd_uid_id2_array [k+j] = 16'h0506+(16'h0202*j);
                   rd_uid_id2_array [k+j+8] = 16'hFAF9-(16'h0202*j);
            end
        end
           for (k = 256; k < MAX_COL; k = k + 1) begin
            rd_uid_id2_array [k] = {DQ_BITS{1'b0}};
           end
`else	   
        for (k =0; k < 512 ; k=k+32) begin
            for (j=0;j<16;j=j+1) begin
                rd_uid_id2_array [k+j] = 8'h05+j;
                   rd_uid_id2_array [k+j+16] = 8'hFA-j;
            end
        end
           for (k = 512; k < MAX_COL; k = k + 1) begin
            rd_uid_id2_array [k] = {DQ_BITS{1'b0}};
           end
`endif
   `endif

    status_register1      = 0;
`ifdef x16
    status_register [15:8] = 8'h00;  // DEFAULT
`endif
    // rdy/ardy per LUN, fail_bit per plane ???
    status_register [6:0] = 7'b1100000;  // DEFAULT:  IO ready, Array ready, 0 0 0, FAIL/PASS(prev), FAIL/PASS(current)
    if (Wp_n == 1'b1) begin
        status_register [7] = 1'b1;
    end else begin
        status_register [7] = 1'b0;
    end
    for (pl_cnt=0;pl_cnt<NUM_PLANES;pl_cnt=pl_cnt+1) begin
        clear_cache_register(pl_cnt);
        clear_data_register(pl_cnt);
    end

    `ifdef PRE
        //Need this 1 so power up completes before any timing or data checks 
        #1;
        // this preloads the 1st page into the data register
        if (Pre) begin
            $sformat(msg,"Starting Power-On Preload ...");
            INFO(msg);
            Rb_n_int <= 0;
            status_register [6:5] = 2'b00;
            temp_mem_exist = memory_addr_exists({ROW_BITS{1'b0}});
            if(temp_mem_exist =5 | temp_mem_exist =3)
                cache_reg[active_plane] = mem_array[0];
            else if (temp_mem_exist=4 | temp_mem_exist=0)
                cache_reg[active_plane] = {PAGE_SIZE{erase_data[0]}};
            else if (temp_mem_exist =1)
                cache_reg[active_plane] = mem_array[memory_index];
            go_busy(tRPRE_max-1);
            status_register [6:5] = 2'b11;
            $sformat(msg,"PO_read complete");
            INFO(msg);
        end
    `endif
    col_counter = 0;
    Rb_n_int <= 1;
/*
    if (Lock === 1) begin
        ALLOWLOCKCOMMAND   = 1;   // Lock commands valid if Lock active on power-up
    end else begin
        ALLOWLOCKCOMMAND   = 0;   // Lock commands valid if Lock active on power-up
    end
*/
    lock_por   <= #1 1'b1;
    LOCKTIGHT = 1'b0;
    LOCK_DEVICE = 1'b0;
    DriveStrength = 8'h00;
    PowerUp_Complete <= #tVCC_delay   1'b1;
    Rb_n_int         <= #tVCC_delay   1'b0;
end   

always @(posedge PowerUp_Complete) begin
    $sformat(msg,"PowerUp Complete."); INFO(msg);
    Rb_n_int         <= #tRB_PU_max   1'b1;  //tVCC_delay + tRB_PU_max.  
end

always @(posedge lock_por) begin
    if (Lock) begin
        ALLOWLOCKCOMMAND   = 1;   // Lock commands valid if Lock active on power-up
    end else begin
        ALLOWLOCKCOMMAND   = 0;   // Lock commands valid if Lock active on power-up
    end
end 

//---------------------------------------------------
// TASKS
//---------------------------------------------------

//---------------------------------------------------
// TASK: INFO("msg")
//---------------------------------------------------
task INFO;
   input [MSGLENGTH*8:1] msg;
begin
  $display("%m at time %t: %0s", $time, msg);
end
endtask

//---------------------------------------------------
// TASK: WARN("msg")
//---------------------------------------------------
task WARN;
   input [MSGLENGTH*8:1] msg;
begin
  $display("%m at time %t: %0s", $time, msg);
  warnings = warnings + 1;
end
endtask

//---------------------------------------------------
// TASK: ERROR(errcode, "msg")
//---------------------------------------------------
task ERROR;
   input [7:0] errcode;
   input [MSGLENGTH*8:1] msg;
begin

    errcount[errcode] = errcount[errcode] + 1;
    errors = errors + 1;

    if ((errcount[errcode] <= ERR_MAX_REPORTED) || (ERR_MAX_REPORTED < 0))
        if ((EXP_ERR[errcode] === 1) && ((errcount[errcode] <= ERR_MAX_INT) || (ERR_MAX_INT < 0))) begin
            $display("Caught expected violation at time %t: %0s", $time, msg);        
        end else begin
            `ifdef MDL_NO_TIME_ERRMSG
	    if (errcode !== ERR_TIM) // do not print timing errors
            `elsif MDL_START_TIME_ERRMSG
	    if (errcode !== ERR_TIM || $time > `MDL_START_TIME_ERRMSG) // do print timing errors during specified time at beginning of simulation
            `endif
            $display("%m at time %t: %0s", $realtime, msg);
        end
    if (errcount[errcode] == ERR_MAX_REPORTED) begin
        $sformat(msg, "Reporting for %s has been disabled because ERR_MAX_REPORTED has been reached.", err_strings[errcode]);
        INFO(msg);
    end

    //overall model maximum error limit
    if ((errcount[errcode] > ERR_MAX_INT) && (ERR_MAX_INT >= 0)) begin
        STOP;
    end
end
endtask

//---------------------------------------------------
// TASK: FAIL("msg")
//---------------------------------------------------
task FAIL;
   input [MSGLENGTH*8:1] msg;
begin
   $display("%m at time %t: %0s", $time, msg);
   failures = failures + 1;
   STOP;
end
endtask

//---------------------------------------------------
// TASK: Stop()
//---------------------------------------------------
task STOP;
begin
  $display("%m at time %t: %d warnings, %d errors, %d failures", $time, warnings, errors, failures);
  $stop(0);
end
endtask

//---------------------------------------------------
// TASK: memory_write (block, page, col, data)
// This task is used to preload data into the memory, OTP, and Special arrays.
//---------------------------------------------------
    task memory_write;
        input  [BLCK_BITS-1:0] block;
        input  [PAGE_BITS-1:0]  page;
        input  [COL_BITS -1:0]   col;
        input  [1:0]   memory_select;
        input  [DQ_BITS-1:0]    data;
        reg    [ROW_BITS-1:0]   addr;
        reg    [ROW_BITS-1:0]  page_addr;
        reg    [PAGE_SIZE-1:0] ld_mask;
        begin
            // chop off the lowest address bits
            addr = {block, page, col}; // incorrect, but won't fix b/c no more FullMem
            page_addr = {thisDieNumber[0], block, page}; // lun1 addr must include lun bit for mem_array[memory_index] access
            ld_mask = ({DQ_BITS{1'b1}} << (col * BPC_MAX * DQ_BITS)); // shifting left zero-fills
            case (memory_select)
                0:  begin
`ifdef MODEL_SV
                    mem_array[addr]       = (mem_array[addr] & ~ld_mask) | (data<<(col  * BPC_MAX* DQ_BITS));
`else
                `ifdef FullMem
                    mem_array[addr]       = (mem_array[addr] & ~ld_mask) | (data<<(col  * BPC_MAX* DQ_BITS));
                `else
                    if (memory_addr_exists(page_addr)) begin
                        memory_addr[memory_index] = page_addr;
                        mem_array[memory_index] = (mem_array[memory_index] & ~ld_mask) | (data<<(col * BPC_MAX * DQ_BITS));
                    end else if (memory_used > NUM_ROW ) begin
                        $sformat (msg, "Memory overflow.  Write to Address %h with Data %h will be lost.\nYou must increase the NUM_ROW parameter or define FullMem.", addr, data);
                        FAIL(msg);
                    end else begin
                        pp_counter[memory_used]  = {4{1'b0}}; //initialize partial page counter
                        memory_addr[memory_used] = page_addr;
                        mem_array[memory_used] = ({PAGE_SIZE{1'b1}} &  ~ld_mask) | (data<<(col * BPC_MAX * DQ_BITS));
                        memory_used  = memory_used  + 1'b1;  
                        memory_index = memory_index + 1'b1;
                    end
                `endif
`endif
                end
                1:    OTP_array[page]       = (get_OTP_array(page) & ~ld_mask) | (data<<(col * BPC_MAX * DQ_BITS));
                2:    rd_uid_id2_array[col]    = data;
            endcase
        end
    endtask

//---------------------------------------------------
// TASK: memory_read (block, page, col, data)
// This task is used to read data from the memory, OTP, and Special arrays.
//---------------------------------------------------
    task memory_read;
        input  [BLCK_BITS-1:0] block;
        input  [PAGE_BITS-1:0]  page;
        input  [COL_BITS-1:0]    col;
        output [DQ_BITS-1:0]    data;
        reg    [ROW_BITS-1:0]   page_addr;
        begin
            page_addr = {thisDieNumber[0], block, page}; // lun1 addr must include lun bit for mem_array[memory_index] access
            temp_mem_exist = memory_addr_exists(page_addr);
            if (temp_mem_exist == 5 | temp_mem_exist == 3) 
                data = mem_array[page_addr] >> (col * BPC_MAX * DQ_BITS);
            else if (temp_mem_exist == 4)
                data = {DQ_BITS{1'b1}};
            else if (temp_mem_exist == 1)
                data = mem_array[memory_index] >> (col * BPC_MAX * DQ_BITS);
            else if (temp_mem_exist == 0 | temp_mem_exist ==2)
                data = {DQ_BITS{1'b1}};
//            $display("Memory index %0d memory address (%0h) data=%0h", memory_index,  memory_addr[memory_index], data);
        end
    endtask

//-----------------------------------------------------------------
// TASK : corrupt_page (tsk_row_addr)
// Corrupt a page of memory.
// Called during reset of a program operation.
//-----------------------------------------------------------------
task corrupt_page;
    input [ROW_BITS -1: 0] tsk_row_addr;
    integer i;
begin
    if (DEBUG[0]) begin $sformat(msg, "Corrupting addr=%0h due to reset", tsk_row_addr); INFO(msg); end
`ifdef MODEL_SV
	mem_array [tsk_row_addr] = {PAGE_SIZE{1'bx}};
`else
    `ifdef FullMem
	mem_array [tsk_row_addr] = {PAGE_SIZE{1'bx}};
    `else
	//if used memory address in associative array has same row addr as corrupt task, corrupt with x's
	for (i=0; i< memory_used; i=i+1) begin
	    if (memory_addr[i] === tsk_row_addr) begin
                    mem_array[i] =  {PAGE_SIZE{1'bx}};
            end
        end
    `endif
`endif
end
endtask

//-----------------------------------------------------------------
// TASK : corrupt_block (tsk_block_addr)
// Corrupt a block of memory.
// Called during reset of an erase operation.
//-----------------------------------------------------------------
task corrupt_block;
    input [BLCK_BITS -1: 0] tsk_block_addr;
    reg [COL_BITS -1 : 0] col;
    reg [PAGE_BITS -1 : 0] page;
    integer i;
begin
    if (DEBUG[0]) begin $sformat(msg, "Corrupting block addr=%0h due to reset", tsk_block_addr); INFO(msg); end
`ifdef MODEL_SV   
        page = 0;
        repeat (NUM_PAGE) begin
            mem_array [{tsk_block_addr, page}] = {PAGE_SIZE{1'bx}};
            page = page +1;
        end
`else
    `ifdef FullMem
        page = 0;
        repeat (NUM_PAGE) begin
                mem_array [{tsk_block_addr, page}] = {PAGE_SIZE{1'bx}};
            page = page +1;
        end
    `else
        //if used memory address in associative array has same block addr as corrupt task, corrupt with x's
        for (i=0; i< memory_used; i=i+1) begin
            //check to see if existing used address location matches block being corrupted
            if (memory_addr[i][(ROW_BITS-LUN_BITS) -1 : (PAGE_BITS)] === tsk_block_addr) begin
                    mem_array[i] = {PAGE_SIZE{1'bx}};
            end
        end
    `endif
`endif
end
endtask

//-----------------------------------------------------------------
// TASK : corrupt_otp_page (tsk_row_addr)
// Corrupt a page of OTP memory.
// Called during reset of an OTP program operation.
//-----------------------------------------------------------------
task corrupt_otp_page;
    input [PAGE_BITS -1: 0] tsk_row_addr;
begin
    if (DEBUG[0]) begin $sformat(msg, "Corrupting OTP addr=%0h due to reset", tsk_row_addr); INFO(msg); end
    OTP_array [tsk_row_addr] = {PAGE_SIZE{1'bx}};
end
endtask

//-----------------------------------------------------------------
// TASK : clear_data_register (plane)
// Completely clears a data register for the input plane to all FF's.
//-----------------------------------------------------------------
task clear_data_register;
    input [1:0] plane;
begin
    data_reg[plane] = {PAGE_SIZE {erase_data[0]}}; 
end
endtask

//-----------------------------------------------------------------
// TASK : clear_cache_register (plane)
// Completely clears a cache register for the input plane to all FF's.
//-----------------------------------------------------------------
task clear_cache_register;
    input [1:0] plane;
begin
    cache_reg[plane] = {PAGE_SIZE{erase_data[0]}};
end
endtask

//-----------------------------------------------------------------
// TASK : clear_plane_register
// Completely clears cache or data register for all planes to all FF's.
// Used during 80h command to clear all registers
//-----------------------------------------------------------------
task clear_plane_register;
    input [1:0] plane;
begin
    if (bypass_cache)
	clear_data_register(plane);
    else
	clear_cache_register(plane);
    clear_queued_planes;
end
endtask

//-----------------------------------------------------------------
// TASK : copy_queued_planes
//  Simple copy queued planes to use during cache operations following 00-30h, 00-31h (used in cache_mode)
//-----------------------------------------------------------------
task copy_queued_planes;
    integer temp_delay;
    integer num_plane;
begin
    temp_delay = tWB_delay;
    for (num_plane = 0; num_plane < NUM_PLANES; num_plane = num_plane +1) begin
	if (queued_plane_cache[num_plane]) begin
	    cache_rd_active_plane = num_plane; // store this value so that the correct plane will output data during cache read
	end
        queued_plane_cache[num_plane] <= #temp_delay queued_plane[num_plane]; // delay this to allow the data_reg to be correctly copied to cache_reg during rd cache
    end
    multiplane_op_rd_cache = multiplane_op_rd;
end
endtask

//-----------------------------------------------------------------
// TASK : copy_cachereg_to_datareg( multiplane )
//  Simple copy of cache_reg to the data_reg (used in cache_mode)
//-----------------------------------------------------------------
task copy_cachereg_to_datareg;
    integer num_plane;
begin
    for (num_plane = 0; num_plane < NUM_PLANES; num_plane = num_plane +1) begin
        if (queued_plane[num_plane]) begin //if the plane is queued for the next multi-plane op
            data_reg[num_plane] = cache_reg[num_plane];
            `ifdef PACK
            for (i = 0; i <= NUM_COL - 1; i = i + 1) begin
                case (num_plane)
                    0 : data_reg_packed0[i] = cache_reg_packed0[i];
                    1 : data_reg_packed1[i] = cache_reg_packed1[i];
                    2 : data_reg_packed2[i] = cache_reg_packed2[i];
                    3 : data_reg_packed3[i] = cache_reg_packed3[i];
                endcase
            end
            `endif
        end
    end
end
endtask

//-----------------------------------------------------------------
// TASK : load_reg_cache_mode
// Loads cache register from data register.  
//-----------------------------------------------------------------
task load_reg_cache_mode;
    integer temp_delay;
    integer num_plane;
begin
//    #tWB_delay;
    temp_delay = tWB_delay;
    tWB_check_en = 1'b1;
    Rb_n_int <= #temp_delay 1'b0;
    disable_ready_n <= #temp_delay 1'b0;
    status_register [6:5] <= #temp_delay 2'b00;

    //-----------------------------------------------------------------
    // copy_datareg_to_cachereg( multiplane ) Simple copy of data_reg to the cache_reg (used in cache_mode)
    //-----------------------------------------------------------------
    for (num_plane = 0; num_plane < NUM_PLANES; num_plane = num_plane +1) begin
    	// in rd_pg_cache_seqtl mode, you never cross plane boundaries, and queued_plane_cache is assigned to the correct plane(s) during the initial 00h-30h
    	// in rd_pg_cache random mode, queued_plane_cache is assigned to the correct plane(s) tWB time after 00h-31h cmd
        if (queued_plane_cache[num_plane]) begin //if the plane is queued for the next multi-plane op
            cache_reg[num_plane] <= #temp_delay data_reg[num_plane];
            `ifdef PACK
            for (i = 0; i <= NUM_COL - 1; i = i + 1) begin
                case (num_plane)
                    0 : cache_reg_packed0[i] <= #temp_delay data_reg_packed0[i] ;
                    1 : cache_reg_packed1[i] <= #temp_delay data_reg_packed1[i] ;
                    2 : cache_reg_packed2[i] <= #temp_delay data_reg_packed2[i] ;
                    3 : cache_reg_packed3[i] <= #temp_delay data_reg_packed3[i] ;
                endcase
            end
            `endif
        end
    end

    // have to wait if previous data reg load is not done (cached reads)
    // if the remaining time for the array loading is less than tWB_delay, then wait tDCBSYR1_max b/c
    // this task schedules Rb_n_int to go busy after tWB_delay, so RB# incorrectly goes busy after array loading is done
    // So, we got false status transition C0h->E0h->80h.  Now, we get C0h->E0h glitch->80h->E0h.
    if (~array_load_done && (tload_done - $realtime > tWB_delay)) begin
        queued_load = 1;
	go_busy (tload_done - $realtime);
        wait(array_load_done);
    end else begin
    	go_busy(tDCBSYR1_max+temp_delay);
    end
    // 00h-Addr1-30h-31h(Addr2).  When 31h is given, we return to ready when data from Addr1 is transferred to the data register and then we start Addr2 read
    // So when we reach this point, Addr1 data has just been transferred to data reg and we are about to start Addr2 read
    Rb_n_int <= 1'b1; // Device Ready
    disable_ready_n = 1'b1;
    status_register[6] <= 1'b1; // non-blocking statement here to prevent race condition with finish_array_load task
    if (lastCmd == 8'h3F)   status_register [5] = 1'b1;
    queued_load = 0;
    //if page read cache mode, need to load next page to data_reg
    if (lastCmd === 8'h31) begin
        //will load page from mem, but not drive Rb_n busy (since cache mode)
        if (DEBUG[0]) begin $sformat(msg, "Loading next page for cache read addr=%0h", row_addr[active_plane]); INFO(msg); end
    end
end
endtask

//-----------------------------------------------------------------
// TASK : load_cache_register (multiplane, cache_mode)
// Loads cache register from memory array.  
//-----------------------------------------------------------------
task load_cache_register;
    input multiplane;
    input cache_mode;
    integer thisPlane;
    reg [ROW_BITS -1 : 0] load_row_addr; //multi-plane plane decoded row address
    //reg page_addr_good; // replaced by temp_mem_exist
    //integer mem_mp_index; //local multi-plane memory index, replaced by directly using memory_index
    integer delay;
    integer temp_delay;

begin
    // Delay For RB# (tWB)
    temp_delay = 0;

    //for cache reads, first transfer data_reg->cache_reg    
    if (cache_mode) begin
        load_reg_cache_mode;
        if (lastCmd !== 8'h3F) begin
            status_register [5] = 1'b0;
	    array_load_done <= #(temp_delay+1) 1'b0; // set it low after 1ns so that we can see the pulse during read cache
	end
    end else begin
//        #tWB_delay
        temp_delay = tWB_delay;
	tWB_check_en = 1'b1;
        Rb_n_int <= #temp_delay 1'b0;
        status_register[6:5] <= #temp_delay 2'b00;
    	array_load_done <= #temp_delay 1'b0;
    end

    if (multiplane) begin
    end else begin
        //internal data move only allowed within the same plane
        if (lastCmd === 8'h35) cmnd_35h_row_addr = row_addr[active_plane];
    end

    //check that any queued read addresses meet the multi-plane addressing requirements
    check_plane_addresses;

    //-----------------------------------------------------------------------------
    // Read From Memory Array
    //-----------------------------------------------------------------------------

    for (thisPlane =0; thisPlane < NUM_PLANES; thisPlane=thisPlane+1) begin : plane_loop
        if (OTP_read && (thisPlane == 0)) begin : otp_read
            cache_reg[active_plane] <= #temp_delay get_OTP_array(row_addr[active_plane][PAGE_BITS-1:0]);
	    
            if (row_addr[active_plane] >= OTP_ADDR_MAX) begin
                $sformat(msg, "Error: OTP Read Address overflow.  Block must be 0 and page < OTP_ADDR_MAX.  Block=%0h Page=%0h  OTP_ADDR_MAX=%0h", row_addr[active_plane][ROW_BITS-1:PAGE_BITS], row_addr[active_plane][PAGE_BITS-1:0], OTP_ADDR_MAX); ERROR(ERR_OTP, msg); 
            end 
        end else if (ONFI_read_param && (thisPlane == 0)) begin : onfi_read_param
            if(~nand_mode[0])   cache_reg[0] <= #temp_delay (JEDEC_read_param ? jedec_params_array_unpacked : onfi_params_array_unpacked);
        end else begin //regular_read
            // cant do any loading if already in special read_id_2 or read_unique states
            // only way out is reset or power down/up
            if (~do_read_id_2 && ~do_read_unique && queued_plane[thisPlane]) begin : no_id_2
                //if this plane is queued for loading
                    //set up the address to load
                if (NUM_PLANES > 1) begin
                    load_row_addr = {row_addr[thisPlane][ROW_BITS-1:(PAGE_BITS+(NUM_PLANES >> 2)+1)], //upper row address bits
                               thisPlane[(NUM_PLANES >> 2) : 0], //plane address bits
                               row_addr[active_plane][PAGE_BITS-1:0]};  //page address bits defined by last address plane
                end else begin
                    load_row_addr = {row_addr[thisPlane][ROW_BITS-1:PAGE_BITS], //upper row address bits
                               row_addr[active_plane][PAGE_BITS-1:0]};  //page address bits defined by last address plane
                end
                //now check to see if the address already exists
                temp_mem_exist = memory_addr_exists(load_row_addr);
                if (cache_mode) begin
                    if (temp_mem_exist ==5 | temp_mem_exist ==3) begin
                        data_reg[thisPlane] <= #temp_delay (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[load_row_addr]);
                    end else if (temp_mem_exist ==1) begin 
                            data_reg[thisPlane] <= #temp_delay (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[memory_index]);
                    end else if (temp_mem_exist ==4 | temp_mem_exist ==0) begin
                            data_reg[thisPlane] <= #temp_delay (corrupt_reg ? {PAGE_SIZE{1'bx}} : {PAGE_SIZE{erase_data[0]}});
                        end
			active_plane <= #temp_delay cache_rd_active_plane; // when RB# returns ready during cache mode, set active_plane to the plane that should output data. In MP case, this assign will be overwritten later during 31h/3Fh cmd detection
                end else begin
                    if (temp_mem_exist ==5 | temp_mem_exist ==3) begin
                        cache_reg[thisPlane] <= #temp_delay (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[load_row_addr]);
                    end else if (temp_mem_exist ==1) begin
                            cache_reg[thisPlane] <= #temp_delay (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[memory_index]);
                    end else if (temp_mem_exist ==4 | temp_mem_exist ==0) begin
                            cache_reg[thisPlane] <= #temp_delay (corrupt_reg ? {PAGE_SIZE{1'bx}} : {PAGE_SIZE{erase_data[0]}});
                    end
                    `ifdef MODEL_SV
                    `elsif FullMem
                    `else
                    if (DEBUG[2]) begin $sformat(msg, "Read %0h data from memory block=%0h, page=%0h)", cache_reg[thisPlane],  memory_addr[memory_index][(ROW_BITS -1) : (PAGE_BITS)], memory_addr[memory_index][(PAGE_BITS -1) : 0]); INFO(msg); end
                    `endif
                end
		corrupt_reg = 0; // reset for next plane loop
            end else begin
                //else we are in do_read_id_2 or do_read_unique and will be reading out of the special array
                // need to go busy like normal page read
            end // no_id_2
        end // : regular_read
    end //plane_loop
    // -------------------------------------------------------------------------
    // device op delay
    // -------------------------------------------------------------------------
    OTP_read = #temp_delay 1'b0;
        delay = tR_max + temp_delay;
    if (~cache_mode) begin
        if (~copyback2) begin
            copy_cachereg_to_datareg;  //if not in cache mode, cache_reg and data_reg are tied together
        end
        //ONFI parts start tR_max after tWB delay, older parts start tR_max immediately on posedge We_n
    end
    tload_done = ($realtime + delay);
    if (lastCmd !== 8'h3F) begin // schedule array_load_done for current read operation, exception is 3Fh b/c it does not initiate a read operation to the array
	array_load_done <= #(delay) 1'b1;
    end
    if (copyback2) begin
        go_busy((tR_max+temp_delay));
        program_page_from_datareg(multiplane); 
    end
end
endtask

// replaces load_cache_register
always @(*)
begin
    // tWB_check_en enabled inside 30h cmd blk
    ld_reg_en <= #tWB_delay ((load_cache_en & ~load_cache_en_r) | (~load_cache_en & load_cache_en_r));
    load_cache_en_r <= #1 load_cache_en;
end 

always @(posedge ld_reg_en)
begin
    if(~cache_op) begin
        Rb_n_int <= 1'b0;
        status_register[6:5] = 2'b00;
        array_load_done = 1'b0;
        
        if (multiplane_op_rd) begin
        end else begin
            //internal data move only allowed within the same plane
            if (lastCmd === 8'h35) cmnd_35h_row_addr = row_addr[active_plane];
        end

        //check that any queued read addresses meet the multi-plane addressing requirements
        check_plane_addresses;

        //-----------------------------------------------------------------------------
        // Read From Memory Array
        //-----------------------------------------------------------------------------

        for (ldthisPlane =0; ldthisPlane < NUM_PLANES; ldthisPlane=ldthisPlane+1) begin : plane_loop
            if (OTP_read && (ldthisPlane == 0)) begin : otp_read
                cache_reg[active_plane] = get_OTP_array(row_addr[active_plane][PAGE_BITS-1:0]);
                if (row_addr[active_plane] >= OTP_ADDR_MAX) begin
                    $sformat(msg, "Error: OTP Read Address overflow.  Block must be 0 and page < OTP_ADDR_MAX.  Block=%0h Page=%0h  OTP_ADDR_MAX=%0h", row_addr[active_plane][ROW_BITS-1:PAGE_BITS], row_addr[active_plane][PAGE_BITS-1:0], OTP_ADDR_MAX); ERROR(ERR_OTP, msg); 
                end 
            end else if (ONFI_read_param && (ldthisPlane == 0)) begin : onfi_read_param
                if(~nand_mode[0])   cache_reg[0] = (JEDEC_read_param ? jedec_params_array_unpacked : onfi_params_array_unpacked);
            end else begin //regular_read
                // cant do any loading if already in special read_id_2 or read_unique states
                // only way out is reset or power down/up
                if (~do_read_id_2 && ~do_read_unique && queued_plane[ldthisPlane]) begin : no_id_2
                    //if this plane is queued for loading
                        //set up the address to load


                if (NUM_PLANES > 1) begin
                    ld_load_row_addr = {row_addr[ldthisPlane][ROW_BITS-1:(PAGE_BITS+(NUM_PLANES >> 2)+1)], //upper row address bits
                               ldthisPlane[(NUM_PLANES >> 2) : 0], //plane address bits
                               row_addr[active_plane][PAGE_BITS-1:0]};  //page address bits defined by last address plane
                end else begin
                    ld_load_row_addr = {row_addr[ldthisPlane][ROW_BITS-1:PAGE_BITS], //upper row address bits
                               row_addr[active_plane][PAGE_BITS-1:0]};  //page address bits defined by last address plane
                end
                    //now check to see if the address already exists
                   temp_mem_exist = memory_addr_exists(ld_load_row_addr);
                    if (cache_op) begin
                        if (temp_mem_exist == 5 | temp_mem_exist == 3) begin
                            data_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[ld_load_row_addr]);
                        end else if (temp_mem_exist == 1) begin 
                            data_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[memory_index]);
                        end else if (temp_mem_exist == 4 | temp_mem_exist == 0) begin
                                data_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : {PAGE_SIZE{erase_data[0]}});
                        end 
                        `ifdef MODEL_SV
                        `elsif MemFull
                        `else
                        if (DEBUG[2]) begin $sformat(msg, "Transferring Read data from array block=%0h, page=%0h to data_reg=%d)", memory_addr[memory_index][(ROW_BITS -1) : (PAGE_BITS)], memory_addr[memory_index][(PAGE_BITS -1) : 0], ldthisPlane); INFO(msg); end
                        `endif
                    end else begin
                        if (temp_mem_exist == 5) begin
                            cache_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[ld_load_row_addr]);
                        end else if (temp_mem_exist == 3) begin
                            cache_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array [ld_load_row_addr]);
                        end else if (temp_mem_exist == 1) begin 
                            cache_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : mem_array[memory_index]);
                        end else if (temp_mem_exist == 4 | temp_mem_exist == 0) begin
                                cache_reg[ldthisPlane] = (corrupt_reg ? {PAGE_SIZE{1'bx}} : {PAGE_SIZE{erase_data[0]}});
                        end
                        `ifdef MODEL_SV
                        `elsif MemFull
                        `else
                        if (DEBUG[2]) begin $sformat(msg, "Read %0h data from memory block=%0h, page=%0h)", cache_reg[ldthisPlane],  memory_addr[memory_index][(ROW_BITS -1) : (PAGE_BITS)], memory_addr[memory_index][(PAGE_BITS -1) : 0]); INFO(msg); end
                        `endif
                    end
		    corrupt_reg = 0; // reset for next plane loop
                end else begin
                    //else we are in do_read_id_2 or do_read_unique and will be reading out of the special array
                    // need to go busy like normal page read
                end // no_id_2
            end // : regular_read
        end

        // -------------------------------------------------------------------------
        // device op delay
        // -------------------------------------------------------------------------
        OTP_read = 1'b0;
        ld_delay = tR_max;
        if (~cache_op) begin
            if (~copyback2) begin
                copy_cachereg_to_datareg;  //if not in cache mode, cache_reg and data_reg are tied together
            end
            //ONFI parts start tR_max after tWB delay, older parts start tR_max immediately on posedge We_n

        end
        tload_done = ($realtime + ld_delay);
        array_load_done <= #(ld_delay) 1'b1;
        if (copyback2) begin
            go_busy(ld_delay);
            program_page_from_datareg(multiplane_op_rd); 
        end

        // from 30h cmd begin 
        if (multiplane_op_rd & ~FEATURE_SET2[CMD_MP_OUTPUT] & NUM_PLANES==2) begin
            active_plane <= #(ld_delay) 0;
        end

        multiplane_op_rd    <= #(ld_delay) 1'b0;
        multiplane_op_wr    <= #(ld_delay) 1'b0;
        multiplane_op_erase <= #(ld_delay) 1'b0;
        cache_valid         <= #(ld_delay) 1'b0;
        // from 30h cmd end

    end 
end 

//-----------------------------------------------------------------
// TASK : sync_output_data
// Drives drive output data on Dq in sync mode
//-----------------------------------------------------------------
//--- data -> tri-state transition
//sync mode output transition from DQ data->X->Z
task sync_output_data;
    input [DQ_BITS -1 : 0] dataOut;
begin
    if (sync_mode && (Clk || (~Clk && saw_posedge_dqs))) begin
        `ifdef mtdef
        //data becomes valid
        rd_out <= #(tACmaxDQSQmaxsync) 1'b1;
        Io_buf <= #(tACmaxDQSQmaxsync) dataOut;
        `else
        //data transitions from undriven to known value
        Io_buf <= #(tAC_sync_max) {DQ_BITS{1'bx}};
        IoX    <= #(tAC_sync_max) 1'b1;
        //data becomes valid
        rd_out <= #(tACmaxDQSQmaxsync) 1'b1;
        Io_buf <= #(tACmaxDQSQmaxsync) dataOut;
        `endif         
        
        `ifdef mtdef
        rd_out <= #(tACmaxDQSQmaxDVWminsync) 1'b0;
        `else
        //data goes back to X as we transition to the next value
        Io_buf <= #(tACmaxDQSQmaxDVWminsync) {DQ_BITS{1'bx}};
        rd_out <= #(tACmaxDQSQmaxDVWminsync) 1'b0;
        t_readtox = ($realtime + tACmaxQHminsync);
        // IoX_enable <= #(t_readtox) 1'b1; // only used during async data output
        `endif         
    end
end
endtask

//-----------------------------------------------------------------
// TASK : output_status 
// Drives status_register onto IO bus
//-----------------------------------------------------------------
task output_status;
begin
    if (((sync_mode && ~Wr_n) || sync_enh_mode) && ~Ce_n && die_select && status_cmnd) begin
        if (cmnd_78h && disable_md_stat) begin
            $sformat(msg, "MULTI-DIE STATUS READ (78h) IS PROHIBITED DURING AND AFTER POWER-UP RESET, OTP OPERATIONS, READ PARAMETERS, READ ID, READ UNIQUE ID, and GET/SET FEATURES.");
            INFO(msg);
        end else begin
            if(nand_mode[0])
                sync_output_data(status_register1);
            else 
                sync_output_data(status_register);
        end        
    end else
    //cmd 70h only works on the last selected die
    if (~sync_mode && ~sync_enh_mode && ~Re_n && ~Ce_n && We_n && die_select && status_cmnd) begin
        if (cmnd_78h && disable_md_stat) begin
            $sformat(msg, "MULTI-DIE STATUS READ (78h) IS PROHIBITED DURING AND AFTER POWER-UP RESET, OTP OPERATIONS, READ PARAMETERS, READ ID, READ UNIQUE ID, and GET/SET FEATURES.");
            INFO(msg);
        end else begin
            // determine whether CE access time or RE access time dominates
            // then queue the status register for output on IO after the appropriate delay
            if (tCEA_max - tREA_max < $realtime - tm_ce_n_f) begin
                queue_status_output <= #tREA_max 1'b1;
            end else begin
                queue_status_output <= #(tm_ce_n_f + tCEA_max - $realtime) 1'b1;
            end
        end
    end
end
endtask

// when we see this trigger go high, it's time to output status
always @(posedge queue_status_output) begin
    //cancel the output if we've already gone inactive and tRHOH is met (Io is being driven X's). Nvm, we must consider edo mode
    //if (~(Re_n && IoX_enable)) begin
        if(nand_mode[0])
            Io_buf <= status_register1;
        else
            Io_buf <= status_register;
        rd_out <= 1'b1;
    //end
    queue_status_output <= #1 0;
end

// when status register changes in the middle of an operation and we are continually reading status (by holding p_re low), update the new status value
// only need this update in async mode b/c in sync mode, we are constantly updating IO output at every clk edge
always @(status_register) begin
    #1; // wait for 1 time unit b/c Rb_reset_n is assigned non-blocking (<=), but status_register is assigned blocking (=)
    if (~sync_mode && ~sync_enh_mode && ~Re_n && ~Ce_n && We_n && die_select && status_cmnd) begin
    	Io_buf <= status_register;
    end
end

// ----------------------------------------------------------
// Multi-LUN Ready logic.
// Reset, ID, and Config commands prohibit Multi-LUN operations while Array is busy.  
// ----------------------------------------------------------
always @(Clk_We_n) begin
    if(Clk_We_n & command_enable) begin 
        case (Io[7:0])
        8'h90, 8'hEC, 8'hED, 8'hEE, 8'hEF, 8'hFA, 8'hFC, 8'hFF:
            ml_prohibit_cmd = 1'b1;
        default :
            ml_prohibit_cmd = 1'b0;
        endcase
    end 
    
    if(ml_prohibit_cmd & ~status_register[5])  
        ml_rdy = 1'b0;
    else if (status_register[5])  
        ml_rdy =1'b1;
end 
assign ML_rdy = ml_rdy;


//-----------------------------------------------------------------
// replaces erase_block task
//-----------------------------------------------------------------
always @(*)
begin
    // tWB_check_en enabled inside D0h cmd blk
    erase_blk_pls <= #tWB_delay ((erase_blk_en & ~erase_blk_en_r) | (~erase_blk_en & erase_blk_en_r));
    erase_blk_en_r <= #1 erase_blk_en;
end 

//-----------------------------------------------------------------
// Erases a block of data in the memory array (clears to FF's) after tWB_delay
//-----------------------------------------------------------------
always @(posedge erase_blk_pls)
begin
//    #tWB_delay; // Delay For RB# (tWB)
    erase_done = 1'b0;
    eb_boot_fail = 1'b0;
    Rb_n_int <= 1'b0;   // Go busy
    status_register [6 : 5] = 2'b00;

    //check that any queued erase blocks meet the multi-plane addressing requirements
    check_plane_addresses;

    //first see if device was locked on powerup
    eb_unlocked_erase =  ~ALLOWLOCKCOMMAND;
    //now see if any of the to-be-programmed address violate the current LockBlock constraints (for devices that support this)
    for (eb_thisPlane=0; eb_thisPlane < NUM_PLANES; eb_thisPlane=eb_thisPlane+1) begin
        eb_lock_addr = row_addr[eb_thisPlane];        
        if (LockInvert) begin
            eb_unlocked_erase = eb_unlocked_erase || (queued_plane[eb_thisPlane] && ((eb_lock_addr < UnlockAddrLower) || (eb_lock_addr > UnlockAddrUpper)));
        end else begin
            eb_unlocked_erase = eb_unlocked_erase || (queued_plane[eb_thisPlane] && ((eb_lock_addr >= UnlockAddrLower) || (eb_lock_addr <= UnlockAddrUpper)));
        end
    end

    // SMK : Erase now needs to check to see if address is same as a locked boot block
    for (eb_thisPlane=0; eb_thisPlane < NUM_PLANES; eb_thisPlane=eb_thisPlane+1) begin
        if (eb_unlocked_erase && queued_plane[eb_thisPlane])
            // boot blocks only need two address bits for blocks 0,1,2,3
            eb_unlocked_erase = ~BootBlockLocked[row_addr[eb_thisPlane][PAGE_BITS+1:PAGE_BITS]];
            eb_boot_fail = 1'b1;
    end

    //now proceed if address is unlocked and valid
    if (eb_unlocked_erase) begin : unlocked_erase_block
        eb_page = 0;
        for (eb_thisPlane=0; eb_thisPlane < NUM_PLANES; eb_thisPlane=eb_thisPlane+1) begin : plane_loop
            if (queued_plane[eb_thisPlane]) begin //only proceed if this plane is queued to be erase
                erase_block_addr = row_addr[eb_thisPlane][BLCK_BITS+PAGE_BITS-1:PAGE_BITS];
                if (1) begin $sformat(msg, "ERASE: interleave/plane=%h, Block=%h", eb_thisPlane, erase_block_addr); INFO(msg);  end
                //Main reset implementation block
            `ifdef MODEL_SV
                repeat (NUM_PAGE) begin : page_loop
                    temp_mem_exist = memory_addr_exists({erase_block_addr,eb_page});
				    if(temp_mem_exist ==5) begin 
    				    //if (mem_array.exists ( {erase_block_addr,eb_page}) ) mem_array.delete ({erase_block_addr,eb_page});
                        //if (pp_counter.exists( {erase_block_addr,eb_page}) ) pp_counter.delete({erase_block_addr,eb_page});
				        erase_exec({erase_block_addr,eb_page});
                    end
                    eb_page = (eb_page + 1'b1)%NUM_PAGE; // reset to 0 after last page for next plane
                end // page_loop
                //if (seq_page.exists( erase_block_addr) ) seq_page.delete(erase_block_addr); 
                seq_page_erase(erase_block_addr);
            `else
              `ifdef FullMem
                  repeat (NUM_PAGE) begin : page_loop
			          erase_exec({erase_block_addr,eb_page});
                      eb_page = (eb_page + 1'b1)%NUM_PAGE; // reset to 0 after last page for next plane
                  end // page_loop
                  seq_page[erase_block_addr] = {PAGE_BITS{1'b0}}; //reset sequential page counter for this block
              `else
                //use associative array erase block here
                for (e=0; e<memory_used; e=e+1) begin : mem_loop
                    //check to see if existing used address location matches block being erased
                    if (memory_addr[e][BLCK_BITS+PAGE_BITS-1:PAGE_BITS] === erase_block_addr) begin
                        mem_array[e] = {PAGE_SIZE{erase_data[0]}};
                        pp_counter[e] = {4{1'b0}};
                        seq_page[erase_block_addr] = {PAGE_BITS{1'b0}};
                    end
                end // mem_loop
              `endif
            `endif
            end //if (queued_plane)
        end // plane_loop
        
        // Delay for RB# (tBERS)
	go_busy(tBERS_min);
        Rb_n_int <= 1'b1;   // not busy anymore
        status_register [6 : 5] <= 2'b11;
        erase_done <= 1'b1;
	if (force_sts_fail) status_register[0] <= 1'b1;
//        output_status;
        // from d0h cmd begin
        multiplane_op_erase <= 1'b0;
        multiplane_op_rd    <= 1'b0;
        multiplane_op_wr    <= 1'b0;
        cache_op            <= 1'b0;
        // from d0h cmd end
    end else begin //eb_unlocked_erase
        // else block was locked and cannot be erased
        if (eb_boot_fail) begin
            $sformat (msg, "Not Erasing Block %0h. Boot Block is Locked.", new_addr[ROW_BITS-1:PAGE_BITS]);
        end else begin
            $sformat (msg, "Not Erasing Block %0h UnlockAddrLowr=%0h UnlockAddrUpr=%0h", new_addr[ROW_BITS-1:PAGE_BITS], UnlockAddrLower, UnlockAddrUpper);
        end
        INFO(msg);
        //  Delay for RB# (tBERS)
        status_register [7] = 1'b0;
//        go_busy(delay);
        Rb_n_int <= #eb_delay 1'b1;   // not busy anymore
        status_register [6:5] <= #eb_delay 2'b11;
        erase_done <= #eb_delay 1'b1;
        if (LOCK_DEVICE) begin
            status_register [7] <= #eb_delay 1'b0;
        end else begin
            status_register [7] <= #eb_delay 1'b1;
        end
        // from d0h cmd begin
        multiplane_op_erase <= #eb_delay 1'b0;
        multiplane_op_rd    <= #eb_delay 1'b0;
        multiplane_op_wr    <= #eb_delay 1'b0;
        cache_op            <= #eb_delay 1'b0;
        // from d0h cmd end
    end // unlocked_erase_block
end

//-----------------------------------------------------------------
// TASK : inc_otpc (row_addr_tsk)
// Increments and checks OTP partial page counter for devices that
// support partial page programming.
//-----------------------------------------------------------------
task inc_otpc;        
    input [ROW_BITS - 1 : 0] row_addr_tsk; //OTP row address to check in partial page counter
begin
    //All nand devices with OTP support have an OTP partial page programming limit of OTP_NPP
    if (otp_counter[row_addr_tsk] < OTP_NPP) begin
        otp_counter[row_addr_tsk] = otp_counter[row_addr_tsk] + 1;
        if (DEBUG[0]) begin $sformat(msg, "OTP  partial page programming : Page=%0h  Count=%d  Limit=%1d", row_addr_tsk, otp_counter[row_addr_tsk], OTP_NPP); INFO(msg); end
    end else begin
        otp_counter[row_addr_tsk] = otp_counter[row_addr_tsk] + 1;
        $sformat(msg, "OTP partial page programming limit reached.  Page=%0h  Count=%d  Limit=%1d", row_addr_tsk, otp_counter[row_addr_tsk], OTP_NPP);
        ERROR(ERR_OTP, msg);
    end
end
endtask

//-----------------------------------------------------------------
// TASK : inc_pp (row_addr_tsk)
// Increments and check partial page counter for devices that
// support partial page programming.
//-----------------------------------------------------------------
task inc_pp;
    input [ROW_BITS -1: 0] row_addr_tsk; //row address to check in partial page counter
    reg [ROW_BITS -1: 0] index;
begin
`ifdef MODEL_SV
    index = row_addr_tsk;
`else
  `ifdef FullMem
    index = row_addr_tsk;
  `else
    if (!pp_addr_exists(row_addr_tsk)) begin
           pp_used = pp_used + 1;
    end
    pp_addr[pp_index] = row_addr_tsk;
    index = pp_index;
  `endif            
`endif
    if (DEBUG[2]) begin $sformat(msg, "Partial page counter:  Block=%0h, Page=%0h  Count=%d  Limit=%1d", row_addr_tsk[ROW_BITS-1:PAGE_BITS], row_addr_tsk[PAGE_BITS-1:0], pp_counter[index] +1, NPP); INFO(msg); end
    if (pp_counter[index] < NPP) begin
        pp_counter[index] = pp_counter[index] + 1;
    end else begin
        $sformat(msg, "Partial page programming limit reached.  Block=%0h Page=%0h Limit=%1d", row_addr_tsk[ROW_BITS-1:PAGE_BITS], row_addr_tsk[PAGE_BITS-1:0], NPP);
        ERROR(ERR_NPP, msg);
    end
end
endtask

//-----------------------------------------------------------------
// TASK : check_block (row_addr_tsk)
// Checks block for illegal random page programming
//-----------------------------------------------------------------
task check_block;
    input [ROW_BITS -1: 0] row_addr_tsk;
    reg [BLCK_BITS -1: 0] blck_addr_tsk;
    reg [PAGE_BITS -1: 0] page_tsk;
begin
    blck_addr_tsk = row_addr_tsk[ROW_BITS -1 : PAGE_BITS];
    page_tsk = row_addr_tsk[PAGE_BITS -1 : 0];
    if (page_tsk == get_seq_page(blck_addr_tsk)) begin 
        // don't need to do anything here, programming to same page already in seq_page block checker
    end    else if (page_tsk == (get_seq_page(blck_addr_tsk) +1)) begin
           // increment page in sequential page checker for this block
        seq_page[blck_addr_tsk] = get_seq_page(blck_addr_tsk) +1;
        if (DEBUG[2]) begin $sformat (msg, "Programming to  Block=%0h  Page=%0h", blck_addr_tsk, page_tsk); INFO(msg); end
    end else begin
        $sformat(msg, "Random page programming within a block is prohibited! Block=%0h, Page=%0h, last page=%0h", blck_addr_tsk, page_tsk, get_seq_page(blck_addr_tsk));
        ERROR(ERR_ADDR, msg);
    end
end
endtask


//-----------------------------------------------------------------
// TASK : program_page (multiplane, cache_op)
// Programs a page of data from cache register 
// to data register.
//-----------------------------------------------------------------
task program_page;
    input multiplane;
    input prog_cache_op;
    integer thisPlane;

begin
    if (DEBUG[0]) begin $sformat(msg, "START CACHE ARRAY PROGRAMMING, multiplane=%d, prog_cache_op=%d", multiplane, prog_cache_op); INFO(msg); end
    // Delay For RB# (tWB)
    tWB_check_en = 1'b1;
    go_busy(tWB_delay);
    Rb_n_int <= 1'b0;
    status_register [6 : 5] = 2'b00;
    
    queued_copyback2 = 1; //useful when 8'h10 ends a copyback2 cache program to let
                                  //the model know not to drive status bits and Rb_n as ready
                                  //until the last copyback program is executed
    
    //copy cache regs to data regs for planes that will be programmed
    if (~bypass_cache)  copy_cachereg_to_datareg;
    row_valid = 1'b0;

    // if cache prog, last program may still be active
    // need to wait for it to finish
    if (~array_prog_done) go_busy (tprog_done - $realtime);
       //wait for array programming to finish (in case array_prog_done doesn't go
       // high unti end of current timestep)
    wait(array_prog_done);
    queued_copyback2 <= 0;
    
    if (prog_cache_op === 1 && lastCmd != 8'hFF && lastCmd != 8'hFA && lastCmd != 8'hFC) begin
        // this is for cache mode program ops
        // now wait for delay to transfer cache_reg -> data_reg
        go_busy(tCBSY_min);    
        if (lastCmd === 8'h10) begin
            prog_cache_op = 1'b0;
        end else begin
            Rb_n_int <= 1'b1;
            //only cache bit in status register changes here
            status_register [6] = 1'b1;
        end
    end
    //if this is  a copyback op, no program executes here.
    // If this is the last program page in a copyback cache operation, we'll
    if (~copyback2 && lastCmd != 8'hFF && lastCmd != 8'hFA && lastCmd != 8'hFC) begin
        program_page_from_datareg(multiplane); 
    end
    
    copyback2 = 0;
end
endtask

//-----------------------------------------------------------------
// TASK : program_page_from_datareg (multiplane, cache_mode)
// Programs a page of data from data register 
// to flash memory array.
//-----------------------------------------------------------------
task program_page_from_datareg;
    input multiplane;
    integer thisPlane;
    reg [ROW_BITS -1 : 0] array_prog_addr;
    reg [ROW_BITS -1 : 0] lock_addr;
    reg otp_prog_fail;
    integer page_count, otp_count;
    //reg page_addr_good; // replaced by temp_mem_exist
    reg unlocked_write;
    integer mem_mp_index;  //local 2plane memory index for associative addressing
    integer delay;

begin
    unlocked_write = 0;
    if (DEBUG[0]) begin $sformat (msg, "PROGRAM PAGE FROM DATAREG, multiplane=%d, cache_op=%d", multiplane, cache_op); INFO(msg); end
    array_prog_done = 1'b0;
    array_prog_2plane = 1'b0;
    status_register[5] = 1'b0;

    if (multiplane) begin
    end    else begin
        if (FEATURE_SET[CMD_2PLANE]) begin
            if (row_addr[active_plane][PAGE_BITS] != cmnd_35h_row_addr[PAGE_BITS]) begin
                $sformat(msg, "Invalid operation.  Internal Data Move is only allowed within the same plane.  Addr from=%0h  Addr to=%0h", cmnd_35h_row_addr, row_addr[active_plane]);
                ERROR(ERR_ADDR, msg);
            end
        end
    end

    //check that any queued program addresses meet the multi-plane addressing requirements
    check_plane_addresses;

    //first see if device was locked on powerup
    unlocked_write =  ~ALLOWLOCKCOMMAND;
    //now see if any of the to-be-programmed address violate the current LockBlock constraints (for devices that support this)
    for (thisPlane=0; thisPlane < NUM_PLANES; thisPlane=thisPlane+1) begin
        lock_addr = row_addr[thisPlane];        
        if (LockInvert) begin
            unlocked_write = unlocked_write || (queued_plane[thisPlane] && ((lock_addr < UnlockAddrLower) || (lock_addr > UnlockAddrUpper)));
        end else begin
            unlocked_write = unlocked_write || (queued_plane[thisPlane] && ((lock_addr >= UnlockAddrLower) && (lock_addr <= UnlockAddrUpper)));
        end
    end

    // ----------------------------------------------------------------------------------------------------
    // SMK : put boot block check here (for devices that support this)
    // ----------------------------------------------------------------------------------------------------
        //only stay unlocked if this is an unlocked boot block (no need to do this check during regular OTP mode)
    if (~OTP_write) begin
        for (thisPlane=0; thisPlane < NUM_PLANES; thisPlane=thisPlane+1) begin
            if (unlocked_write && queued_plane[thisPlane])
                // boot blocks only need two address bits for blocks 0,1,2,3
                unlocked_write = ~BootBlockLocked[row_addr[thisPlane][PAGE_BITS+1:PAGE_BITS]];
        end
    end

    // ----------------------------------------------------------------------------------------------------

    //now proceed if address is unlocked and valid
    if (unlocked_write) begin : unlocked_write_command

        page_count = 1'b0;
        otp_count = 1'b0;
        otp_prog_fail = 0;
        // Write to Memory Array
                
        for (thisPlane = 0; thisPlane < NUM_PLANES; thisPlane = thisPlane + 1) begin : plane_loop
            if (OTP_write && (thisPlane == 0)) begin : otp_page_write
                otp_prog_addr = row_addr[active_plane];
                if((|otp_prog_addr[ROW_BITS-1:PAGE_BITS]) | (otp_prog_addr[PAGE_BITS-1:0] >= OTP_ADDR_MAX)) begin : OTP_prog_overflow
                    $sformat(msg, "Error: OTP Program Address Overflow, block addr not equal 0 or page address >= %0h:  block addr =%0h  page addr =%0h",OTP_ADDR_MAX, (otp_prog_addr[ROW_BITS-1:PAGE_BITS]), otp_prog_addr[PAGE_BITS-1:0]);
                    ERROR(ERR_OTP, msg);
                end
                // if the whole OTP is locked or this page is locked (when OTP lock_by_page is enabled), the operation fails
                if (OTP_locked || OTP_page_locked[otp_prog_addr]) begin : OTP_locked_block
                    $sformat(msg, "OTP Program FAILED - OTP Protected!  Aborting program operation ...");
                    ERROR(ERR_OTP, msg);
                    status_register [7 : 5] = 3'b011;
                    otp_prog_fail = 1;
                    
    // ----------------------------------------------------------------------------------------------------
    // SMK : put all M58A ONFI OTP PAGE LOCK stuff BELOW this line
    // ----------------------------------------------------------------------------------------------------
                // SMK : OTP_page_locked is new addition to memory elements.  Use during OTP lock_by_page enabled ops
                // SMK : BootBlockLocked [3:0] is new addition to memory elements.  Use during Boot block lock
                     
                // Here we check for the ONFI specific OTP Lock command/address sequence
                //  page byte = enabled OTP lock        (lock by page disabled)
                //            = OTP page lock address   (lock by page enabled, EFh-90h-03h-00h-00h-00h)  
                //            = Boot lock block address (lock by page enabled, EFh-90h-04h-00h-00h-00h)  
                end else if (((otp_prog_addr[(PAGE_BITS-1):0] == 1) || (onfi_features[8'h90][1:0] == 3))
                                && (col_addr == 0) && FEATURE_SET[CMD_ONFIOTP]) begin
                    // new OTP with FEATURES access uses page 1 and col addr 0 to protect the OTP
                    case (onfi_features[8'h90][1:0])
                    //bit 0 = OTP; bit 1 = PROTECT
                    1: begin
                            if (~FEATURE_SET[CMD_PAGELOCK]) begin
                                if (data_reg[active_plane][7:0] == 0) begin
                                    if (otp_prog_addr[7:0] == 1) begin
					$sformat(msg,"OTP will now be PROTECTED"); INFO(msg);
					if (DEBUG[2]) begin
					    $sformat(msg,"OTP protect : Found address 0x00,0x00,0x01,0x00,0x00 with 0x00 data."); INFO(msg);
					end
					OTP_locked = 1'b1;
                                    end
                                end else begin
                                    $sformat(msg, "Illegal OTP protect command : First byte of data after 0x00,0x00,0x01,0x00,0x00 OTP address must be 0x00.");
                                    ERROR(ERR_OTP, msg);
				end    
                            end else begin
                                $sformat(msg, "OTP protect command must be done in OTP Protect mode; Address 90h of Set features should be set to 0x03.");
                                ERROR(ERR_OTP, msg);
			    end
                       end
                        
                    3: begin
                            // EFH-90h-03h... is the only way to execute an OTP lock by page operation
                            if (FEATURE_SET[CMD_PAGELOCK]) begin
                                if ((col_counter == 1) & (data_reg[active_plane][7:0] == 0)) begin
				    if (otp_prog_addr[7:0] <= 1) begin // this is an OTP lock entire page operation
                                   	$sformat(msg,"OTP will now be PROTECTED"); INFO(msg);
                                   	OTP_locked = 1'b1;
				    end else begin
                                    	// this is an OTP lock by page operation
                                    	OTP_page_locked[otp_prog_addr[7:0]] = 1'b1;
                                    	$sformat(msg,"OTP mode with PROTECT bit is now set on page %0h", otp_prog_addr[7:0]);
                                    	INFO(msg);
				    end	
                                end else begin
                                    $sformat(msg, "Illegal OTP protect command : Only one data byte allowed during OTP protect command sequence and that byte must be 0x00.");
                                    ERROR(ERR_OTP, msg);
                                end
                            end else begin
                                $sformat(msg, "Illegal OTP operation : This device is not configured to support OTP lock by page.");
                                ERROR(ERR_OTP, msg);
                            end
                       end
                    endcase
                    
    // ----------------------------------------------------------------------------------------------------
    // SMK : put all M58A ONFI OTP PAGE LOCK stuff ABOVE this line
    // ----------------------------------------------------------------------------------------------------
                    
                end else if ((otp_prog_addr[(PAGE_BITS -1):0] < 8'h02) || (otp_prog_addr[(PAGE_BITS -1):0] >= OTP_ADDR_MAX)) begin
                       $sformat(msg, "OTP Program FAILED - OTP page address out of bound! Page address = %0h", otp_prog_addr[(PAGE_BITS-1):0]);
                       ERROR(ERR_OTP, msg);
                       otp_prog_fail = 1;
                end else begin
                    if(OTP_NPP == 1) begin
                        // only program if OTP data is still FF's
                        if (&get_OTP_array(otp_prog_addr[PAGE_BITS-1:0])) begin
                            otp_prog_done = 1'b0;
                            OTP_array [otp_prog_addr[PAGE_BITS-1:0]] = data_reg[active_plane];
                            if (otp_count == 0) inc_otpc(otp_prog_addr);
                            otp_count = 1'b1;
                            if (DEBUG[2]) begin $sformat(msg, "OTP Program from Data Register = %0h", data_reg[active_plane]); INFO(msg); end
                        end else begin
                            // if OTP data is not FF's, report error if data reg is trying to program new values
                            if (~(&data_reg[active_plane])) begin
                                   $sformat(msg, "OTP program attempted to write to previously programmed address = %0h.  Cannot overwrite.", otp_prog_addr);
                                   ERROR(ERR_OTP, msg);
                            end
                        end
                    end else begin
                        otp_prog_done = 1'b0;
                        OTP_array [otp_prog_addr[PAGE_BITS-1:0]] = data_reg[active_plane] & get_OTP_array (otp_prog_addr[PAGE_BITS-1:0]);
                        if (otp_count == 0) inc_otpc(otp_prog_addr);
                        otp_count = 1'b1;
                        if (DEBUG[2]) begin $sformat(msg, "OTP Program from Data Register = %0h", data_reg[active_plane]); INFO(msg); end
                    end 
                end //OTP_locked_block
            end else if (boot_block_lock_mode) begin
                if (col_counter == 1) begin
                    if(row_addr[active_plane][ROW_BITS-1:PAGE_BITS] >= NUM_BOOT_BLOCKS) begin 
                        $sformat(msg,"WARNING: Boot block %0h can not be locked. Block %0h is the boot block lock upper limit", row_addr[active_plane][ROW_BITS-1:PAGE_BITS], (NUM_BOOT_BLOCKS-1)); WARN(msg);
                    end else begin 
                        // boot block is part of NAND Flash array, not OTP array.  Once boot block is locked, can not be unlocked.  
                        BootBlockLocked[row_addr[active_plane][PAGE_BITS+BOOT_BLOCK_BITS-1:PAGE_BITS]] = 1'b1;
                        $sformat(msg,"Boot block %0h will now be locked", row_addr[active_plane][ROW_BITS-1:PAGE_BITS]); INFO(msg);
                    end 
                end else begin
                    $sformat(msg, "Illegal command: Only one data byte allowed during boot block locking command sequence.");  ERROR(ERR_CMD, msg);
                end
            end else begin //page_write
                //set up the address to load
                if (queued_plane[thisPlane]) begin : queued_plane_section //only proceed if this plane is queued to program
                    if (NUM_PLANES > 1) begin
                        if (copyback2) begin
                            array_prog_addr = {copyback2_addr[ROW_BITS-1:(PAGE_BITS+(NUM_PLANES >> 2) +1)], //upper row address bits
                                  thisPlane[(NUM_PLANES >> 2) : 0], //plane address bits
                                  copyback2_addr[PAGE_BITS-1:0]};  //page address bits defined by last address plane
                        end else begin
                            array_prog_addr = {row_addr[thisPlane][ROW_BITS-1:(PAGE_BITS+(NUM_PLANES >> 2) +1)], //upper row address bits
                                  thisPlane[(NUM_PLANES >> 2) : 0], //plane address bits
                                  row_addr[active_plane][PAGE_BITS-1:0]};  //page address bits defined by last address plane
                        end
                    end else begin
                        if (copyback2) begin
                            array_prog_addr = {copyback2_addr[ROW_BITS-1:PAGE_BITS], //upper row address bits
                                  copyback2_addr[PAGE_BITS-1:0]};  //page address bits defined by last address plane
                        end else begin
                            array_prog_addr = {row_addr[thisPlane][ROW_BITS-1:PAGE_BITS], //upper row address bits
                                  row_addr[active_plane][PAGE_BITS-1:0]};  //page address bits defined by last address plane
                        end
                    end

                    temp_mem_exist = memory_addr_exists(array_prog_addr);
                    if (temp_mem_exist == 5)
                        mem_mp_index = array_prog_addr;
                    else if (temp_mem_exist == 4) begin
                        pp_counter[array_prog_addr]  = {4{1'b0}}; //initialize partial page counter
                        mem_array [array_prog_addr]  = {PAGE_SIZE{erase_data[0]}}; // initialize array row data
                        `ifdef PACK
                        for (i = 0; i <= NUM_COL - 1; i = i + 1) begin
                            mem_array_packed [array_prog_addr][i]  = {(DQ_BITS*BPC_MAX){erase_data[0]}}; // initialize array row data
                        end 
                        `endif 
                        mem_mp_index = array_prog_addr;
                    end else if (temp_mem_exist == 1)
                        mem_mp_index = memory_index;
                    else if(temp_mem_exist ==0) begin
                        `ifdef MODEL_SV
                        `elsif FullMem
                        `else
                        pp_counter[memory_index]  = {4{1'b0}}; //initialize partial page counter
                        memory_addr[memory_index] = array_prog_addr;
                        mem_array [memory_index]  = {PAGE_SIZE{erase_data[0]}}; // initialize array row data
                        `ifdef PACK
                        for (i = 0; i <= NUM_COL - 1; i = i + 1) begin
                            mem_array_packed [memory_index][i]  = {(DQ_BITS*BPC_MAX){erase_data[0]}}; // initialize array row data
                        end 
                        `endif 
                        memory_used  = memory_used + 1'b1;
                        mem_mp_index = memory_index;
                        memory_index = memory_index + 1'b1;
                        `endif
                    end

                        if (DEBUG[2]) begin $sformat(msg, "Programmed %0h to memory location (%0h, %0h)", data_reg[active_plane],  array_prog_addr[(ROW_BITS -1) : (PAGE_BITS)], array_prog_addr[(PAGE_BITS -1) : 0]); INFO(msg); end
                        //program the array
                    `ifdef MODEL_SV
                        mem_array[array_prog_addr] =  data_reg[thisPlane] & mem_array [array_prog_addr];
                        `ifdef PACK
                        for (i = 0; i <= NUM_COL - 1; i = i + 1) begin
                            case (thisPlane)
                            0 : mem_array_packed[mem_mp_index][i] = data_reg_packed0[i] & mem_array_packed [mem_mp_index][i];
                            1 : mem_array_packed[mem_mp_index][i] = data_reg_packed1[i] & mem_array_packed [mem_mp_index][i];
                            2 : mem_array_packed[mem_mp_index][i] = data_reg_packed2[i] & mem_array_packed [mem_mp_index][i];
                            3 : mem_array_packed[mem_mp_index][i] = data_reg_packed3[i] & mem_array_packed [mem_mp_index][i];
                            endcase
                        end
                        `endif 
                    `else
                        `ifdef FullMem
                        mem_array [array_prog_addr] = data_reg[thisPlane] & mem_array [array_prog_addr];
                        `else
                        if (memory_used > NUM_ROW) begin
                            $sformat (msg, "Memory overflow.  Write to Address %h with Data %h will be lost.\nYou must increase the NUM_ROW parameter or define FullMem.", {array_prog_addr,i}, data_reg[thisPlane[0]][i]);
                            FAIL(msg);
                        end else begin
                            mem_array[mem_mp_index] =  data_reg[thisPlane] & mem_array [mem_mp_index];
                            `ifdef PACK
                            for (i = 0; i <= NUM_COL - 1; i = i + 1) begin
                                case (thisPlane)
                                0 : mem_array_packed[mem_mp_index][i] = data_reg_packed0[i] & mem_array_packed [mem_mp_index][i];
                                1 : mem_array_packed[mem_mp_index][i] = data_reg_packed1[i] & mem_array_packed [mem_mp_index][i];
                                2 : mem_array_packed[mem_mp_index][i] = data_reg_packed2[i] & mem_array_packed [mem_mp_index][i];
                                3 : mem_array_packed[mem_mp_index][i] = data_reg_packed3[i] & mem_array_packed [mem_mp_index][i];
                                endcase
                            end
                            `endif 
                        end
                        `endif
                    `endif
                    inc_pp(array_prog_addr);
                    check_block(array_prog_addr);
                end // queued_plane_section
            end //page_write
        end //plane_loop
                   
        OTP_write = 1'b0;
        // Set Delay for RB# (tPROG)
        case (lastCmd) 
            8'h10 : begin
                if (otp_prog_fail) delay = tOBSY_max;
                else if(cache_prog_last) delay = tLPROG_cache_typ;
                else delay = tPROG_typ;
            end
            8'h15 : delay = tPROG_typ;
            8'h11 : delay = tDBSY_min;
            8'hA0 : delay = tOBSY_max;
        endcase 
        tprog_done = ($realtime + delay);
        array_prog_done <= #(delay) 1'b1;
        otp_prog_done   <= #(delay) 1'b1;
	if (force_sts_fail)
	    status_register[0] <= #(delay) 1'b1;
	if (otp_prog_fail)
	    status_register[7] <= #(delay) 1'b0;

    end else begin
        // else if block is locked
	// need active_plane ? 1 : 0 format instead of doing row_addr[active_plane] b/c doing the latter gave us plane1 data when active_plane was 0, race condtion?
        if (BootBlockLocked[row_addr[active_plane][PAGE_BITS+1:PAGE_BITS]]) begin
            $sformat(msg, "LOCKED: Not Programing Block 0x%0h.  Boot Block has been locked.", active_plane ? row_addr[1][BLCK_BITS+PAGE_BITS-1:PAGE_BITS] : row_addr[0][BLCK_BITS+PAGE_BITS-1:PAGE_BITS]);
        end else begin
            $sformat(msg, "LOCKED: Not Programing Block 0x%0h, page 0x%0h, UnlockAddrLowr=%0h UnlockAddrUpr=%0h, invert=%0d", 
	    	active_plane ? row_addr[1][BLCK_BITS+PAGE_BITS-1:PAGE_BITS] : row_addr[0][BLCK_BITS+PAGE_BITS-1:PAGE_BITS],
		active_plane ? row_addr[1][PAGE_BITS-1:0] : row_addr[0][PAGE_BITS-1:0]  , UnlockAddrLower, UnlockAddrUpper, LockInvert);
        end
        WARN(msg);
        status_register [7] = 1'b0;
        delay = tLBSY_max;
        go_busy(delay);
        array_prog_done = 1'b1;
        Rb_n_int <= 1'b1;   // not busy anymore
        status_register [6:5] = 2'b11;
        if (LOCK_DEVICE) begin
            status_register [7] = 1'b0;
        end else begin
            status_register [7] = 1'b1;
        end
    end //unlocked_write_command
end
endtask

//-----------------------------------------------------------------
// TASK : clear_queued_planes()
//      ensures that all planes are not queued as active until
//      addressed by the next command.
//-----------------------------------------------------------------
task clear_queued_planes;
    integer i;
begin
    for (i=0;i<NUM_PLANES; i=i+1) begin
        queued_plane[i] = 0;
        if(DEBUG[4]) begin $sformat(msg, "INFO: Cleared queued plane %0d. Value %d", i, queued_plane[i]); INFO(msg); end 
    end
end
endtask

//-----------------------------------------------------------------
// TASK : finish_array_prog
// Cleans up status register and busy signals once array
// programming has finished.
//-----------------------------------------------------------------
task finish_array_prog;
begin
    if (DEBUG[0]) begin $sformat(msg, "PROGRAM DATA REG DONE."); INFO(msg); end
    //if not a cache op, device goes ready
    // Also, if not the last tLPROG of final cache program pages for copyback2, 
    //   device will go ready
    if (~cache_op && ~(queued_copyback2 && ~copyback2)) begin
        Rb_n_int <= 1'b1; // Device Ready
        status_register [6] = 2'b1;           
        if (~nand_mode[0]) status_register[5] = 1;
        //output_status; // already done by new (always @(status_register)) block
    end else if (cache_op && (Rb_n_int === 1'b1)) begin	// for the case where we terminate pgmcache op by waiting a long time after 15h
        if (~nand_mode[0]) status_register[5] = 1;
	cache_op <= 1'b0;
        //output_status;
    end else begin
        cache_prog_last = 1'b0;
        //output_status;
    end
end
endtask

//-----------------------------------------------------------------
// TASK : finish_array_load
// Cleans up status register and busy signals once reading
// from the flash memory array has finished.
//-----------------------------------------------------------------
task finish_array_load;
begin
    if (DEBUG[0]) begin $sformat(msg, "ARRAY LOAD COMPLETE."); INFO(msg); end
    if ((lastCmd !== 8'h3F) && (lastCmd !== 8'h31)) begin
        Rb_n_int <= disable_ready_n;
        if (copyback2) begin
            status_register[6:5] = 2'b10;
        end else begin
        status_register [6] = 2'b1;           
        if (~nand_mode[0]) status_register[5] = 1;
        end
        //output_status; // already done by new (always @(status_register)) block
    end else begin
    	// normal status regs and p_rb settings in read cache mode are handled by load_reg_cache_mode task during read cache mode
	// here, we only handle the case where host waits a very long time after 00h-31h to allow the chip to finish fetching the next page, sts should transition C0h -> E0h
        if (status_register[6]) // if current sts is C0h and we get array_load_done flag, we have just finished fetching the next page of data during read cache operation 
	    status_register [5] = 1'b1;
    end
end
endtask

//-----------------------------------------------------------------
// TASK : go_busy (delay)
// Device goes busy for specified delay while still checking 
// for status and reset commands.
//-----------------------------------------------------------------
task go_busy;
    input delay;
    integer delay;
    reg saw_edge_we_n;
    reg last_we_n;
    realtime tstep;  //step through at a rate just under tWP;  that all we need for this busy task to work
begin
    if (DEBUG[0]) begin $sformat(msg, "busy delay of %t ns ", delay); INFO(msg); end
    if (sync_mode) begin
        tstep = (1000 * TS_RES_ADJUST);
    end else begin
        //tstep = tWP_min - (2* 1000 * TS_RES_ADJUST);
        tstep = 2 * (1000 * TS_RES_ADJUST);
    end
    last_we_n = We_n;
    while (delay > 0) begin  : delay_loop
        if ((delay -tstep) >= 0) begin
            #tstep;
        end else begin
            #delay;
        end
        delay = delay - tstep;
        if (delay < 0) delay = 0;
        if (last_we_n !== We_n) begin
            saw_edge_we_n = 1'b1;
        end else begin
            saw_edge_we_n = 1'b0;
        end
        last_we_n = We_n;
        if (Cle && We_n && ~Ale && Re_n && ~Ce_n && saw_edge_we_n) begin
            if ((Io [7 : 0] === 8'h70) && die_select && (cmnd_70h === 1'b0)) begin
                if (DEBUG[3]) begin $sformat(msg, "STATUS READ WHILE BUSY : MODE = STATUS"); INFO(msg); end
                cmnd_70h = 1'b1;
                cmnd_78h = 1'b0;
            end else if ((Io [7 : 0] === 8'h78) && ~disable_md_stat) begin
                if (DEBUG[1]) begin $sformat(msg, "MULTI DIE READ STATUS READ WHILE BUSY : MODE = STATUS"); INFO(msg); end
                cmnd_70h = 1'b0;
                cmnd_78h = 1'b1;
                addr_start = COL_BYTES +1;
                addr_stop  =  ADDR_BYTES;
                row_valid = 1'b0;
		if (lastCmd == 8'hFA && FEATURE_SET2[CMD_RESETLUN]) begin
		    lastCmd = 8'hAA; // set to illegal value to stop chip from executing another reset LUN during 78h cmd
		end
            end else if ((Io [7 : 0] === 8'hFF) | ((Io [7 : 0] === 8'hFC) & (sync_mode || sync_enh_mode))) begin
                $sformat(msg, "RESET WHILE BUSY - ABORT");
                INFO(msg);
                lastCmd = (Io [7 : 0]);
                nand_reset(1);
                disable delay_loop; //exit out of this loop
            end else if ((Io [7 : 0] === 8'hFA) & FEATURE_SET2[CMD_RESETLUN]) begin
                $sformat(msg, "RESET LUN WHILE BUSY - ABORT");
                INFO(msg);
                lastCmd = 8'hFA;
                row_valid = 1'b0;
                addr_start = COL_BYTES +1;
                addr_stop = ADDR_BYTES;
                disable delay_loop; //exit out of this loop
            end else begin // UNSUPPORTED COMMAND (DURING BUSY)
		// else this is a non-status command during busy.
		// since this could be an interleaved die operation, tell this device
		//  to look at the upcoming address cycles to de-select the die if needed
                if (die_select) begin
		    if (Io[7:0] == 8'h30 || Io[7:0] == 8'h32 || Io[7:0] == 8'h35 || Io[7:0] == 8'h10 || Io[7:0] == 8'h11 || Io[7:0] == 8'h15 ||
			Io[7:0] == 8'hD0 || Io[7:0] == 8'hD1) begin
			$sformat(msg, "LUN is busy, and has received new %0hh command. New command will be ignored.", Io); ERROR(ERR_CMD, msg);
		    end
		    if ({Io[7:1], 1'b0} !== 8'h60 && {Io[7:1], 1'b0} !== 8'hD0)
			col_valid = 1'b0; // Do not reset for case of interleaved read and erase, read did not output data
		    row_valid = 1'b0;
		    if ({Io[7:1], 1'b0} === 8'h60)
			addr_start = COL_BYTES +1;
		    else
			addr_start = 1;
		    addr_stop = ADDR_BYTES;
		end
            end
        end
    end // delay_loop
end
endtask   


//-----------------------------------------------------------------
// FUNCTION : memory_addr_exists (addr)
// Checks to see if memory address is already used in
// associative array.
// 5: SV assoc array, page is programmed
// 4: SV assoc array, page is not programmed
// 3: Verilog fullmem array
// 2: unused
// 1: Verilog NUM_ROW array, page is programmed
// 0: Verilog NUM_ROW array, page is not programmed
//-----------------------------------------------------------------
function [2:0] memory_addr_exists;
    input [ROW_BITS -1:0] addr;
begin : index
    `ifdef MODEL_SV
	if(mem_array.exists(addr))
	    memory_addr_exists = 5;
	else 
	    memory_addr_exists = 4;
    `else
       `ifdef FullMem
	memory_addr_exists = 3;
       `else
	memory_addr_exists = 0;
	for (memory_index=0; memory_index<memory_used; memory_index=memory_index+1) begin
	    if (memory_addr[memory_index] == addr) begin
		if (DEBUG[2]) begin $display("Memory index %0d memory address (%0h)", memory_index,  memory_addr[memory_index]); end
		memory_addr_exists = 1;
		disable index;
	    end
	end
       `endif
    `endif
end
endfunction


`ifdef MODEL_SV
`else
//-----------------------------------------------------------------
// FUNCTION : pp_addr_exists (addr)
// Checks to see if memory address is already used in
// partial page programming associative array.
//-----------------------------------------------------------------
function pp_addr_exists;
    input [(ROW_BITS) -1:0] addr;
begin : pp_func
    pp_addr_exists = 0;
    for (pp_index=0; pp_index<pp_used; pp_index=pp_index+1) begin
        if (pp_addr[pp_index] == addr) begin
            pp_addr_exists = 1;
            disable pp_func;
        end
    end
end
endfunction
`endif


//-----------------------------------------------------------------
// function : get_seq_page           
 //-----------------------------------------------------------------
function    [PAGE_BITS-1 : 0]  get_seq_page        ;
    input   [BLCK_BITS-1 : 0]  adrs                ;
begin
  `ifdef MODEL_SV
     if ( seq_page.exists(adrs) )
        get_seq_page = seq_page[adrs];
     else
        get_seq_page = {PAGE_BITS{1'h0}};
  `else
     get_seq_page  = seq_page[adrs];
  `endif
end
endfunction

//-----------------------------------------------------------------
// task : seq_page_erase           
 //-----------------------------------------------------------------
task      seq_page_erase      ;
    input   [BLCK_BITS-1 : 0]  adrs                ;
begin
  `ifdef MODEL_SV
     if ( seq_page.exists(adrs)) seq_page.delete(erase_block_addr);
  `endif
end
endtask

//-----------------------------------------------------------------
// function : get_OTP_array          
//-----------------------------------------------------------------
function    [PAGE_SIZE-1 : 0]  get_OTP_array       ;
    input   [PAGE_BITS-1 : 0]  adrs                ;
begin
  `ifdef MODEL_SV
      if ( OTP_array.exists(adrs) )
         get_OTP_array = OTP_array[adrs];
      else
         get_OTP_array = {PAGE_SIZE{1'h1}};
  `else
         get_OTP_array = OTP_array[adrs];
  `endif
end
endfunction


//-----------------------------------------------------------------
// TASK : mem_array_erase (erase_addr)
// Checks block for illegal random page programming
//-----------------------------------------------------------------
task erase_exec;
    input [BLCK_BITS +PAGE_BITS -1: 0] erase_addr;
begin
    `ifdef MODEL_SV
       mem_array.delete (erase_addr);
       pp_counter.delete(erase_addr);
    `elsif FullMem
       mem_array [erase_addr] = {PAGE_SIZE{erase_data[0]}};
       pp_counter[erase_addr] = {4{1'b0}}; //reset partial page counter
    `endif
end
endtask

//-----------------------------------------------------------------
// function : fn_inc_col_counter
//  Common function to increment col_counter. 
//-----------------------------------------------------------------
function    [COL_CNT_BITS -1 : 0]  fn_inc_col_counter  ;
    input   [COL_CNT_BITS -1  : 0] col_counter         ;
    input                          mlc_slc             ;
    input   [2:0]                  bpc                 ;
    input   [2:0]                  sub_col_cnt         ;
begin
        case (bpc)
            3'b010 : if(sub_col_cnt ==2'b01) fn_inc_col_counter = col_counter + 1'b1; else fn_inc_col_counter = col_counter;
            3'b011 : if(sub_col_cnt ==2'b10) fn_inc_col_counter = col_counter + 1'b1; else fn_inc_col_counter = col_counter;
            3'b100 : if(sub_col_cnt ==2'b11) fn_inc_col_counter = col_counter + 1'b1; else fn_inc_col_counter = col_counter;
            default:                         fn_inc_col_counter = col_counter + 1'b1; // bpc =1 
        endcase
end
endfunction

//-----------------------------------------------------------------
// function : fn_sub_col_cnt
//  Function to increment column sub count 
//-----------------------------------------------------------------
function    [2:0]   fn_sub_col_cnt      ;
    input   [2:0]   sub_col_cnt         ;
    input           mlc_slc             ;
    input   [2:0]   bpc                 ;
    input   [1:0]   sub_col_cnt_init    ;  // sub col cnt init enables counting
begin
        case (bpc)
            3'b010 : if (sub_col_cnt ==2'b01)
                        fn_sub_col_cnt = 0; // roll count over for next column
                     else
                        fn_sub_col_cnt = sub_col_cnt + 1'b1;
            3'b011 : if (sub_col_cnt ==2'b10)  
                        fn_sub_col_cnt = 0;  // roll count over for next column
                     else
                        fn_sub_col_cnt = sub_col_cnt + 1'b1;
            3'b100 : if (sub_col_cnt ==2'b11)  
                        fn_sub_col_cnt = 0;  // roll count over for next column
                     else
                        fn_sub_col_cnt = sub_col_cnt_init & (sub_col_cnt + 1'b1);
            default: fn_sub_col_cnt = sub_col_cnt; // BPC =1 don't need sub cnt
        endcase
end
endfunction

//-----------------------------------------------------------------
// TASK : nand_reset (soft_reset)
// Resets the device.
// 0 = power on reset
// 1 = soft reset 
//-----------------------------------------------------------------
task nand_reset;
    input soft_reset;
    reg dev_was_busy;
    integer delay;
begin
  if (!ResetComplete & InitReset_Complete) begin
    // if user gives reset command in middle of non-initial reset operation, model will ignore latter reset
    $sformat(msg, "Entering Reset in the middle of Reset ...");
    INFO(msg);
  end else begin
    ResetComplete = 1'b0;
    if (Rb_n_int === 1'b0) begin
        dev_was_busy = 1'b1;
    end else begin
        dev_was_busy = 1'b0;
    end
    $sformat(msg, "Entering Reset ...");
    INFO(msg);

    //reset read status states
    disable_rdStatus;
    // Delay For RB# (tWB)
    `ifdef SYNC2ASYNCRESET
        if (lastCmd === 8'hFF && sync_mode)     sync_mode <= #tITC_max 1'b0;
    `endif
    tWB_check_en = 1'b1;
    #tWB_delay;
    Rb_reset_n = 1'b0; //  to avoid glitch in RB#(ready), time RB reset n active low before deactive Rb n int.  
    Rb_n_int = 1'b1;
    disable_ready_n = 1'b1;
    if (soft_reset) begin
        // reset during regular op
        // Delay for RB# (tRST)
        if (dev_was_busy) begin : busy_interrupt
            //array read interrupted
            if (~array_load_done) begin
                delay = tRST_read;
                //array program interrupted
            end else if (~array_prog_done) begin
                delay = tRST_prog;
                if (~otp_prog_done) begin
                    corrupt_otp_page(otp_prog_addr); //OTP program interrupted
                end else begin
                    for (i=0;i<NUM_PLANES;i=i+1) begin
                        if (queued_plane[i]) corrupt_page(row_addr[i]); //regular array program interrupted
                    end
		    disable program_page_from_datareg; // disable the scheduled events, cannot disable program_page b/c it also disables go_busy and nand_reset
                end
            //erase interrupted
            end else if (~erase_done) begin
                //when interrupting go_busy task, model is already #1 ahead
                delay = (tRST_erase-1);
                for (i=0;i<NUM_PLANES;i=i+1) begin
                    if (queued_plane[i]) corrupt_block(row_addr[i][ROW_BITS-1:PAGE_BITS]);
                end
            end
        end else begin
            delay = tRST_ready;
        end // busy_interrupt
    end
       
    //clear flags and set status to busy
    status_register [6 : 5] = 2'b00;
    col_valid       = 1'b0;
    col_addr        = 0;
    temp_col_addr   = 0;
    row_valid       = 1'b0;
    for (i=0;i<NUM_PLANES;i=i+1) begin
        row_addr[i] = 0;
    end
    clear_queued_planes;
    rd_pg_cache_seqtl = 1'b0;
    multiplane_op_rd_cache = 1'b0;
    cache_valid     = 1'b0;
    multiplane_op_erase   = 1'b0;
    multiplane_op_rd      = 1'b0;
    multiplane_op_wr      = 1'b0;
    copy_queued_planes;  // clear cache queued planes and mp rd op cache flag on reset
    cache_op        = 1'b0;
    disable_md_stat = 1'b0;
    saw_cmnd_00h    = 1'b0;
    saw_cmnd_00h_stat    = 1'b0;
    saw_cmnd_65h    = 1'b0;
    do_read_id_2    = 1'b0;
    do_read_unique  = 1'b0;
    addr_start      = 0;
    addr_stop       = 0;
    active_plane    = 0;
    otp_prog_done   = 1'b1;
    edo_mode        = 0;
    erase_done      = 1'b1;
    Io_buf         <= {DQ_BITS{1'bz}};

    if (lastCmd === 8'hFF && (sync_mode || sync_enh_mode)) begin
        `ifdef SO
	sync_mode <= #tITC_max 1'b1;
        `else
	sync_mode <= #tITC_max 1'b0;
        `endif             
	//some devices only reset the Data Interface, Timing Mode may be retained
	onfi_features[8'h01] = 8'h00;
	switch_timing_mode(onfi_features[8'h01]);
	update_tWB;
    end
    if (OTP_mode) begin
	onfi_features[8'h90] = 8'h00; // Set back to normal operation mode
	OTP_mode = 1'b0;
	$sformat(msg,"Entering Normal Operating mode after Reset ..."); INFO(msg);
    end
    //device now goes busy for appropriate reset time
    if (soft_reset) begin
        go_busy(delay);
    end else begin
        //else this is a power-on reset
        //multi-die status read disabled after initial reset
        disable_md_stat = 1'b1;
`ifdef SHORT_RESET
        go_busy(tRST_ready);
`else
        go_busy(tRST_powerup);
`endif
    InitReset_Complete <= 1'b1;
    end

    // Ready
    Rb_reset_n     <= 1'b1;
    tprog_done      = 0;
    tload_done      = 0;
    t_readtox       = 0;
    t_readtoz       = 0;
    array_prog_done = 1'b1;
    array_load_done = 1'b1;
    status_register [6 : 5] = 2'b11;
    $sformat(msg, "Reset Complete");
    INFO(msg);
    ResetComplete   = 1'b1;
  end // if (ResetComplete InitReset_Complete) else
end
endtask

//-----------------------------------------------------------------
// TASK : disable_rdStatus
// Resets status flags to put device back in read mode
//-----------------------------------------------------------------
task disable_rdStatus;
begin
    cmnd_70h = 1'b0;
    cmnd_78h = 1'b0;
    // this task is usually called when any command is latched, so we can use this task to reset some signals at the start of a new command
    addr_cnt_en = 1'b1;	// enable counter again in case customer gives 05h command without also giving E0h cmd
    status_register[0] = 1'b0; // reset status fail bit to 0 in case it was previously set to 1
    saw_cmnd_81h_jedec = 1'b0;
    if (Wp_n && OTP_mode)
         status_register[7] = Wp_n; // reset this value when doing a new otp operation after the previous otp program failed
end
endtask

//-----------------------------------------------------------------
// TASK : update_features
// Selects the new operating characteristics based on the ONFI 
//  parameters feature address
//-----------------------------------------------------------------
task update_features;
    input [7:0] featAddr;
    begin
        case (featAddr)
            8'h01 : begin //Timing mode
                        if (onfi_features[featAddr][5:4] === 2'b01) begin
                            $display("-----------------------------------------------------------");
                            $sformat(msg, "Switching to SYNC timing mode %0d ...", onfi_features[featAddr][3:0]);
                            INFO(msg);
                            $display("-----------------------------------------------------------");
							// if we're already in sync mode, need to wait for cen to go low before switching
							//  (that's why the wait_for_cen flag is set)
                            if (~sync_mode) begin
                                switch_timing_mode(onfi_features[featAddr]);
 				tCK_sync = (tCK_sync_min + tCK_sync_max) / 2;
                            end
                            sync_mode <= 1'b1;
                            sync_enh_mode <= 1'b0;
                            if (~async_only_n) begin
                                $sformat(msg, "This configuration can not be run in sync mode. %h", async_only_n);  ERROR(ERR_MISC, msg);
                            end 
                        end else 
			begin                        
                            $display("-----------------------------------------------------------");
                            $sformat(msg, "Switching to ASYNC timing mode %0d ...", onfi_features[featAddr][3:0]);
                            INFO(msg);
                            $display("-----------------------------------------------------------");
                            switch_timing_mode(onfi_features[featAddr]);
                            update_tWB; // needed when going mode 0 to other modes
                            sync_mode <= 1'b0;
                            sync_enh_mode <= 1'b0;
                        end
			if (FEATURE_SET2[CMD_PGM_CLR] && (LUN_pgm_clear != onfi_features[featAddr][6])) begin
			    LUN_pgm_clear = onfi_features[featAddr][6];
                            $sformat(msg, "Switching PGM CLEAR option to %0d: clear %0s", onfi_features[featAddr][6], (onfi_features[featAddr][6] ? "selected LUN" : "all LUNs"));
                            INFO(msg);
			end
                    end    
            8'h10 : begin //  Programmable Output Drive Strength
                        if (DEBUG[2]) $display("Programmable I/O Drive Strength is not implemented in this model.");
                    end
            8'h80 : begin //  Programmable Output Drive Strength
                        if (DEBUG[2]) $display("Programmable I/O Drive Strength is not implemented in this model.");
                    end
            8'h81 : begin // Programmable R/B# pull-down strength
                        if (DEBUG[2]) $display("Programmable R/B# Pull-Down Strength  is not implemented in this model.");          
                    end

            8'h90 : begin //OTP operating mode
                      if(onfi_features[featAddr][3] & FEATURE_SET2[CMD_ECC]) begin 
                        update_feat_gen(onfi_features[featAddr][3]); 
                      end
                        OTP_mode     = onfi_features[featAddr][0] & FEATURE_SET[CMD_ONFIOTP];
                        OTP_pagelock = onfi_features[featAddr][1] & FEATURE_SET[CMD_PAGELOCK] & FEATURE_SET[CMD_ONFIOTP]; 
                        boot_block_lock_mode = onfi_features[featAddr][2] & FEATURE_SET[CMD_BOOTLOCK];

                        if (FEATURE_SET[CMD_ONFIOTP] & onfi_features[featAddr][0]) begin //set = OTP mode, clear= normal op mode
                            $sformat(msg,"Entering OTP mode ..."); INFO(msg);
                            // check lock by page enabled and protect bit is set (not all devices support this feature)
                            if (FEATURE_SET[CMD_PAGELOCK] & onfi_features[featAddr][1]) begin
                                $sformat(msg, "Protect bit is set.  Enabling OTP protect by page ..."); INFO(msg);
                            end
                        end else if (FEATURE_SET[CMD_BOOTLOCK] & onfi_features[featAddr][2] ) begin
                            $sformat(msg,"Entering Boot Block Lock Mode ..."); INFO(msg);
                        end else begin
                            $sformat(msg,"Entering Normal Operating mode ..."); INFO(msg);
                            //OTP_locked does not get reset when we leave OTP mode
                        end
                        if(~OTP_mode) status_register[7] = Wp_n;
                    end
            8'h91 : begin
                    end
            
            default: begin $sformat(msg, "This ONFI Feature address is reserved."); WARN(msg); end
       endcase
    end
endtask


//-----------------------------------------------------------------
// TASK : check_plane_addresses
// Loops through each plane to see if there is a queued
//  address for the current operation.  Checks to ensure that
//  multi-plane address rules are not violated.
//-----------------------------------------------------------------
task check_plane_addresses;
    integer thisPlane;
    reg [ROW_BITS -1 : 0] current_addr;
    reg [ROW_BITS -1 : 0] first_addr;
    reg addr_good;
    integer num_addresses; 
begin
    num_addresses = 0;
    addr_good = 0;
    for (thisPlane=0; thisPlane <NUM_PLANES; thisPlane=thisPlane+1) begin
        if (queued_plane[thisPlane]) begin
            if(DEBUG[4]) begin $sformat(msg, "INFO: Checked queued plane %0d. Value %0d", thisPlane, queued_plane[thisPlane]); INFO(msg); end 
            if (num_addresses > 0) begin
                current_addr = row_addr[thisPlane];
                    array_prog_2plane = 1'b1;
                    if (NUM_PLANES > 2) begin
                        if (~copyback & (current_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS] == first_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS])) begin
                            $sformat(msg, "Multi-plane address error. -> LSB's of Interleave/Plane addresses need to be different in multi plane operations. Interleave1=%h Interleave2=%h", current_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS], first_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS]);
                            ERROR(ERR_ADDR, msg);  // Verify different Plane addresses.  
                        end 
                        // copyback ops have identical interleave/plane address between read/program, the cache register is assoc with interleave/plane so no check is needed, need to check 2plane ???.  
                        if (copyback & FEATURE_SET[CMD_2PLANE] & (current_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS] != first_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS])) begin
                            $sformat(msg, "Copyback address error. -> Interleave/Plane Address must be identical. Interleave1=%h Interleave2=%h", current_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS], first_addr[PAGE_BITS + (NUM_PLANES >> 2):PAGE_BITS]);
                            ERROR(ERR_ADDR, msg);  // Verify same Plane Address.  
                        end 
                    end else begin
                        // no need to check for copyback mode, because only one interleave/plane.  
                        if (~copyback & (current_addr[PAGE_BITS] == first_addr[PAGE_BITS])) begin
                            $sformat(msg, "Multi-plane address error. -> LSB's of block addr violate multi plane addressing requirements. Block1=%h Block2=%h", current_addr[ROW_BITS-1:PAGE_BITS], first_addr[ROW_BITS-1:PAGE_BITS]);
                            ERROR(ERR_ADDR, msg);  // Verify that Plane addresses are different.  
                        end 
                    end
                    if (current_addr[PAGE_BITS-1:0] != first_addr[PAGE_BITS-1:0]) begin
                        $sformat(msg, "Multi-plane address error. -> Page address must be identical for multi plane op Page1=%b Page2=%b", current_addr[PAGE_BITS-1:0], first_addr[PAGE_BITS-1:0]);
                        ERROR(ERR_ADDR, msg);  // ??? multiplane errors with incomplete write clear_queued_planes uncomment with fix
                    end 
                    if(DEBUG[4]) begin $sformat(msg, "INFO: number of planes %0d", (NUM_PLANES >> 2)); INFO(msg); end 
		    // only make this check if there are LUN bits in row address
                    if ((NUM_DIE/NUM_CE != 1) && (current_addr[ROW_BITS-1:ROW_BITS-(NUM_DIE/NUM_CE)] != first_addr[ROW_BITS-1:ROW_BITS-(NUM_DIE/NUM_CE)])) begin
                        $sformat(msg, "Multi-plane address error. -> LUN addr must be identical for multi plane op  LUN1=%h  LUN2=%h ", current_addr[ROW_BITS-1:ROW_BITS-(NUM_DIE/NUM_CE)], first_addr[ROW_BITS-1:ROW_BITS-(NUM_DIE/NUM_CE)]); 
                        ERROR(ERR_ADDR, msg);  // ??? issue with multiple reads to same page separated by another page read.  
                    end
                num_addresses = num_addresses + 1;
            end else begin
                num_addresses = 1;
                first_addr = row_addr[thisPlane];
            end //if num_addresses
        end //if queued plane
    end // for thisPlane
end
endtask

//-----------------------------------------------------------------
// TASK : die_is_selected
// When die is selected after last row address byte, model executes some code
// Insetad of duplicating code for dual/quad/single die case, use this task to call the code
//-----------------------------------------------------------------
task die_is_selected;
begin
    die_select = 1'b1;
    if (DEBUG[1]) begin $sformat(msg, "DIE %d ACTIVE", thisDieNumber); INFO(msg); end
    if (saw_cmnd_00h_stat) begin 
	clear_queued_planes;  // ??? need to eval multiplane queues.  (latch address 00h)
	saw_cmnd_00h_stat = 1'b0;
    end
    col_addr = temp_col_addr;  // wait to assign col addr until die_select has been determined.  
    if (saw_cmnd_60h) begin 
	if(saw_cmnd_60h_clear) begin 
	    clear_queued_planes;
	    saw_cmnd_60h_clear = 1'b0;
	end 
	lastCmd = 8'h60;
    end
    if (lastCmd == 8'h80 && ~cmnd_78h && LUN_pgm_clear && ~multiplane_op_wr && ~cmnd_85h) begin
	clear_plane_register(new_addr[PAGE_BITS + (NUM_PLANES >> 2) : PAGE_BITS]);
    end
    if (lastCmd == 8'h85 && ~cmnd_78h && ~multiplane_op_wr) begin // clear queued planes after 85h-5addr
	clear_queued_planes;
    end
end
endtask

    //-----------------------------------------------------------------
    // TASK : update_tWB
    //  tWB can be different between async and sync timing modes.  Need 
    //    to set the correct value based on the current mode here.
    //-----------------------------------------------------------------
    task update_tWB;
        if (sync_mode) begin
            tWB_delay = tWB_sync_max;
        end else begin
            tWB_delay = tWB_max;
        end
    endtask

    // this will catch the flag that says we need to wait for the chip enable to
    // go inactive before switching the clock frequency for the new sync timing mode
    //  This is only valid for sync->sync timing mode transitions.
    //  Async->sync transitions are handled differently.
    always @(posedge wait_for_cen) begin
        wait (Ce_n);
        switch_timing_mode(onfi_features[8'h01]);
 	tCK_sync = (tCK_sync_min + tCK_sync_max) / 2;
        update_tWB;
        wait_for_cen <= #1 0;  //disable the flag until next timing mode switch
    end

    always @(sync_mode or sync_enh_mode) begin
        update_tWB;  //the model needs to switch between sync and async tWB timing
    end

task busy_gen;
    input [7:0] gen_num;
begin
    $display("%m, INFO: Nand model busy gen number = %d, time =%t.", gen_num, $realtime);
end
endtask

//-----------------------------------------------------------------
// Array prog/load scheduler
//-----------------------------------------------------------------


always @ (posedge array_prog_done) begin
    finish_array_prog;
end

always @ (posedge array_load_done) begin
    finish_array_load;
end


assign Ce_n =Ce_n_i;


//-----------------------------------------------------------------
// Write Protect
//-----------------------------------------------------------------
always @ (Wp_n) begin 
    // Original datasheet had Wp_n pin as a async-only pin
//    if (sync_mode == 0) begin
        status_register [7] = Wp_n;
        tm_wp_n <= $realtime;
    if (~LOCKTIGHT) begin
         // holding Wp_low locks all block
        UnlockAddrLower = {ROW_BITS{1'b0}};
        UnlockAddrUpper = {ROW_BITS{1'b1}};
        LockInvert = 1;
`ifdef KEEP_LOCKTIGHT_AFTER_WPN
`else
        if (Wp_n === 1'b0) begin
            UnlockTightTimeLow = $time;
        end else begin
            UnlockTightTimeHigh = $time; 
            // some devices do not allow exiting lock-tight when Wp_n is held low
            // for 100ns
            if ((UnlockTightTimeHigh-UnlockTightTimeLow > 100) && FEATURE_SET[CMD_LOCK]) begin
                $sformat (msg, "INFO: LOCK TIGHT disabled - Wp_n low > 100ns");
                INFO(msg);
                LOCKTIGHT = 1'b0;
            end // UnlockTightTimeHigh
        end //Wp_n === 1'b0
`endif
//    end // sync_mode
    end
end 

//-----------------------------------------------------------------
// Address input
//-----------------------------------------------------------------

// Set active plane and lock/unlock address range once address is valid
// Also do checks here to ensure we are not violating block boundaries or addressing rules
always @ (posedge row_valid) begin
    if (FEATURE_SET[CMD_2PLANE] | FEATURE_SET[CMD_MP]) begin
        //multi-die status read and reset LUN should not affect which plane is active
        if (~cmnd_78h & (lastCmd !== 8'hFA)) begin
            active_plane = new_addr[PAGE_BITS + (NUM_PLANES >> 2) : PAGE_BITS];
            if (lastCmd == 8'h06) begin
                //if this is just a select cache register command, don't change the saved page address
                //  even if the 8'h06-8'hE0 command inputs a different page address.  This will keep 
                //  multi-plane sequential cache reads working properly.
                row_addr[active_plane] = {new_addr[ROW_BITS-1:PAGE_BITS],row_addr[active_plane][PAGE_BITS-1:0]};
            end else begin
                row_addr[active_plane] = new_addr[ROW_BITS -1 : 0];
            end
        end
    end else begin
        //single plane address assignment
	if (~cmnd_78h & (lastCmd !== 8'hFA)) row_addr[active_plane] = new_addr[ROW_BITS -1 : 0];
    end
    if (lastCmd === 8'h23 & ~LOCKTIGHT) begin
        UnlockAddrLower = {row_addr[active_plane][ROW_BITS-1:PAGE_BITS],{PAGE_BITS{1'b0}}}; // remove page bits
        if (DEBUG[2]) begin $sformat (msg, "UnlockAddrLower = %0h", UnlockAddrLower); INFO(msg); end
    end
    if (lastCmd === 8'h24 & ~LOCKTIGHT) begin
        UnlockAddrUpper = {row_addr[active_plane][ROW_BITS-1:PAGE_BITS],{PAGE_BITS{1'b0}}}; // remove page bits
        LockInvert = row_addr[active_plane][0];
        if (DEBUG[2]) begin $sformat (msg, "UnlockAddrUpper=%0h  LockInvert=%0h", UnlockAddrUpper, LockInvert); INFO(msg); end
    end
    if (lastCmd === 8'h8C) begin
        copyback2_addr = new_addr[ROW_BITS -1 : 0];  //address will be used in copyback2 operation
    end
    if (lastCmd === 8'hFA) begin
        nand_reset (1'b1);
    end	
end


//address state enable is same for both sync and async mode
assign address_enable = (~Cle && Ale && ~Ce_n && Re_n);
// Address Latch
always @ (posedge We_n) begin
    if (address_enable) begin : latch_address
        if (saw_cmnd_00h) begin
            //need to distinguish between a status->00h read mode and a regular 00h->address->30h read page op
/*	    // moved to after addr byte 5 latch to only clear_queued_planes of selected die
            if (saw_cmnd_00h_stat)
                clear_queued_planes;  // ??? need to eval multiplane queues.  (latch address 00h)
            saw_cmnd_00h_stat = 1'b0;
*/
            saw_cmnd_00h = 1'b0;
            lastCmd = 8'h00;
            col_valid = 1'b0;
            row_valid = 1'b0;
            addr_start = 1;
            addr_stop = ADDR_BYTES;
            disable_md_stat = 1'b0;
        end
        we_adl_active <= 1'b0;
        tm_we_ale_r <= $realtime;

        // latch special read_id address (for devices that support ONFI or read_id)
        if ((addr_start === 1'b1) && (addr_stop === 1'b0)) begin : special_address
            id_reg_addr [7:0] = Io [7 : 0];
            col_counter = 0;
            //special case for read ONFI params (ECh with 00h address cycle)
            if ((ONFI_read_param === 1'b1) && (id_reg_addr === 8'h00 || (id_reg_addr === 8'h40 && FEATURE_SET2[CMD_JEDEC]))) begin
	        if (id_reg_addr === 8'h40)
		    JEDEC_read_param = 1;
		else
		    JEDEC_read_param = 0;
                col_valid  = 1'b1;
                col_addr = 0;
                new_addr = 0;
                row_valid  = 1'b1;
                load_cache_register(0,0);
            end else if ((do_read_unique === 1'b1) && (id_reg_addr === 8'h00)) begin
                $sformat(msg, "Manufacturer's Unique ID not defined in this behavioral model.  Will use 128'h05060708_090A0B0C_0D0E0F10_11121314.");
                INFO(msg);
                col_valid = 1'b1;
                col_addr = 0;
                row_valid  = 1'b1;
                load_cache_register(0,0); 

                //now check for get_features address
            end else if (lastCmd === 8'hEE) begin
                case (check_feat_addr(id_reg_addr,nand_mode[0]))
                    0 : begin
                        $sformat(msg, "INVALID ONFI GET FEATURES ADDRESS 0x%2h.", id_reg_addr);  ERROR(ERR_ADDR, msg);
                    end
                endcase
		tWB_check_en = 1'b1;
                go_busy(tWB_delay);
                Rb_n_int <= 1'b0;
                status_register[6:5]=2'b00;
                go_busy(tFEAT);
                status_register[6:5]<=2'b11;
                Rb_n_int <=1'b1;
            //now check for set_features address
            end else if (lastCmd === 8'hEF) begin
                case (check_feat_addr(id_reg_addr,nand_mode[0]))
                    0 : begin
                        $sformat(msg, "INVALID ONFI SET FEATURES ADDRESS 0x%2h.", id_reg_addr);  ERROR(ERR_ADDR, msg);
                    end
                endcase
            end // set_features 
        end else begin
            ONFI_read_param = 1'b0;
            if ((lastCmd !== 8'h05) && (lastCmd !== 8'h06)) begin do_read_unique = 1'b0; end
        end //special address

        // Latch Column
        if ((addr_start <= COL_BYTES) && (addr_start <= addr_stop) && ~col_valid  && ~col_addr_dis && ~nand_mode[0]) begin : latch_col_addr
            //ONFI read stays valid until another valid command and address are issued
            ONFI_read_param = 1'b0;
            case (addr_start)
                1 : begin
                        temp_col_addr [7 : 0] = Io [7 : 0];
                        if ((sync_mode || sync_enh_mode) && (temp_col_addr[0] !== 1'b0) && ((lastCmd != 8'hEE) && die_select)) begin
                            $sformat(msg, "LSB of column address must be 0 in sync mode.  lastCmd=%2h", lastCmd);
                            ERROR(ERR_ADDR, msg);
                        end
                    end                
                2 : begin 
                        temp_col_addr [COL_BITS - 1 : 8] = Io [(COL_BITS -8 - 1) : 0];
                        if(lastCmd ==8'h05) begin
                            if(die_select) 
                                col_addr = temp_col_addr;
                            else
                                temp_col_addr = col_addr;
                        end
                        if(lastCmd ==8'h85 | cmnd_85h) begin
                            if(die_select) begin
                                col_addr_dup = col_addr;
                                col_addr = temp_col_addr;
                            end else begin
                                col_addr_dup = temp_col_addr; // helper var in "pgm pause" case
                                temp_col_addr = col_addr;
                            end
                        end
                    end 
            endcase
            if (addr_start >= 2) begin
                col_valid = 1'b1;
            end
        end // latch_col_addr

        // Latch Row
        if ((addr_start >= (COL_BYTES +1)) && (addr_start <= addr_stop) && ~nand_mode[0]) begin : latch_row_addr
            case (addr_start)
                3 : begin
                    if(lastCmd ==8'h85 | cmnd_85h) begin
                        col_addr = col_addr_dup;  // col_addr will be set with complete address phases.  
			if (!die_select) begin
			    temp_col_addr = col_addr_dup; // in "pgm pause" case, restore temp_col_addr to col addr that was latched. col_addr_dup is helper var since we overwrote temp_col_addr
			end
                    end 
                    row_addr_last[active_plane] = new_addr[ROW_BITS -1 : 0];
                    row_valid     = 1'b0; //once we receive the 3rd cycle of addresses, the row address is no longer valid
                    new_addr [ 7 : 0] = Io [7 : 0];
                end
                4 : begin
                    new_addr [15 : 8] = Io [7 : 0];
                    if (ROW_BITS == 17) begin
                        LA[0] = Io [7];
                    end
                end
                5 : begin
                    new_addr [(ROW_BITS -1):16] = Io [(ROW_BITS -1 -16):0];
                    if (~row_valid) begin
                        case (LUN_BITS)
                        2       : begin
                                    LA[1] = Io [(ROW_BITS -1) -16];
                                    LA[0] = Io [(ROW_BITS -2) -16];
                                  end 
                        1       : begin 
                                    LA[1] = 1'b0;
                                    LA[0] = Io [(ROW_BITS -1) -16]; 
                                  end
                        default : begin 
                                    LA[1] = 1'b0;
                                    LA[0] = 1'b0;
                                  end 
                        endcase 
                        if (DEBUG[1]) begin $sformat(msg, "Lun Addr0 %d  : Lun Addr1 %d", LA[0], LA[1]); INFO(msg); end
                    end
                    //here we determine if this die model is the active device based
                    // on the row address
                    if ((NUM_DIE / NUM_CE) == 4) begin
                        if ( LA[1:0] == thisDieNumber[1:0]) begin
			    die_is_selected;
                        end else begin
                            die_select = 1'b0;
                            if (DEBUG[1]) begin $sformat(msg, "DIE %d INACTIVE", thisDieNumber); INFO(msg); end
                            temp_col_addr = col_addr;
                            if (saw_cmnd_60h) begin 
                                saw_cmnd_60h_clear = 1'b0;
                                saw_cmnd_60h = 1'b0;
                            end
                        end
                    end else if ((NUM_DIE / NUM_CE) == 2) begin
                        if ( LA[0] == thisDieNumber[0]) begin
			    die_is_selected;
                        end else begin
                            die_select = 1'b0;
                            if (DEBUG[1]) begin $sformat(msg, "DIE %d INACTIVE", thisDieNumber); INFO(msg); end
                            temp_col_addr = col_addr;
                            if (saw_cmnd_60h) begin 
                                saw_cmnd_60h_clear = 1'b0;
                                saw_cmnd_60h = 1'b0;
                            end
                        end
                    end else begin
			die_is_selected;
                    end
                    if(new_addr[PAGE_BITS-1:0] > NUM_PAGE) begin
                        $sformat(msg, "Error: Page Limit Exceeded.  Page=%2h Page Limit=%2h", new_addr[PAGE_BITS-1:0], NUM_PAGE);
                        ERROR(ERR_ADDR, msg);
                    end 

                    if(die_select & (new_addr[BLCK_BITS-1+PAGE_BITS:PAGE_BITS] > NUM_BLCK)) begin
                        $sformat(msg, "Block Limit Exceeded.  Block=%2h Block Limit=%2h", new_addr[BLCK_BITS-1+PAGE_BITS:PAGE_BITS], NUM_BLCK);
                        ERROR(ERR_ADDR, msg);
                    end 
                end
            endcase
            if (DEBUG[0]) begin 
                $sformat (msg, "Latch Address (%0h) = %0h", addr_start, Io [7 : 0]);
                INFO(msg);
            end
            //make sure interleaved ops don't allow the inactive die to continue when
            // the address is out of it's range
            if ((addr_start >= ADDR_BYTES) & die_select) begin
                row_valid = 1'b1;
            end
        end // latch_row_addr

        // Increase Address Counter
	if (addr_cnt_en)
            addr_start = addr_start + 1;

    end // latch_address
end

//-----------------------------------------------------------------
// Command input
//-----------------------------------------------------------------

//command state enable is same for both sync and async modes
assign command_enable = (Cle & ~Ale & ~Ce_n & Re_n);

always @ (posedge We_n) begin : cLatch
    if (command_enable) begin : Cle_enable
        //Make sure reset was first command issued after powerup for devices that require it
        `ifdef SO
        if (~ResetComplete & FEATURE_SET[CMD_ONFI] & ((Io[7:0] != 8'hFF) & (Io[7:0] != 8'hFC)) ) begin : reset_check
        `else
        if (~ResetComplete & FEATURE_SET[CMD_ONFI] & (Io[7:0] != 8'hFF) ) begin : reset_check
        `endif
            if (nand_mode[0]) begin
                $sformat(msg, "This device must receive reset command before any operations are allowed.");
                ERROR(ERR_CMD, msg);
            end else begin
            $sformat(msg, "This device must receive reset command before any operations are allowed.");
            ERROR(ERR_CMD, msg);
            end
        end    

        if (Rb_n_int === 1'b1) begin : cLatch_unbusy

            if (DEBUG[3]) begin $sformat(msg, "Command Latched = %2Hh", Io[7:0]); INFO(msg); end

            // *******************************
            // Command (00h) : PAGE READ START
            // *******************************
            if (Io [7 : 0] === 8'h00) begin : cmnd_00h
                abort_en = 1'b0;
                cmnd_85h = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if(~nand_mode[0] & ~(lastCmd === 8'h31 || lastCmd == 8'hE0 || lastCmd === 8'h00 || lastCmd === 8'h15) & status_register[6] & ~status_register[5]) begin $sformat(msg, "ERROR: Read Operation while array busy"); INFO(msg); end   // ??? verify for all models
                if(~nand_mode[0] & ~status_cmnd) begin
                    //if not in status mode, then this is the start of a read command
                    if ((lastCmd == 8'h00) & row_valid & FEATURE_SET[CMD_2PLANE]) begin
                        if (DEBUG[1]) begin $sformat(msg, "TWO PLANE Latch Second 00h Command"); INFO(msg); end
                        multiplane_op_rd    = 1'b1;
                        multiplane_op_wr    = 1'b0;
                        multiplane_op_erase = 1'b0;
                        queued_plane[active_plane] = 1;
                        if(DEBUG[4]) begin $sformat(msg, "INFO: Page Read Start Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    end else if (~multiplane_op_rd) begin
                        //as long as this isn't a multi-plane read or multi-LUN read, clear the plane queue, which is done after 00h-5addr
                        saw_cmnd_00h = 1'b1;
                        saw_cmnd_00h_stat = 1'b1;
//                        clear_queued_planes;
                    end                    
                    
                    lastCmd = 8'h00;
                    disable_rdStatus;
                    saw_cmnd_00h = 1'b1;
                    addr_start = 1;
                    addr_stop = ADDR_BYTES;
                    disable_md_stat = 1'b0;
                end                 
                else if (~nand_mode[0] & status_cmnd) begin
                    //don't set cmnd_00h high, as we are just returning to read mode from status mode
		    // We distinguish between a status->00h read mode and status->00h->address->30h read page op in the address latch block; disable_md_stat is updated there
                    saw_cmnd_00h = 1'b1;
 		    if (lastCmd != 8'h32)
                    	saw_cmnd_00h_stat = 1'b1; // doing sts polling during tDBSY of multiplane read would accidently trigger this signal, which would reset the selected planes
                    disable_rdStatus;
                end
                else if (nand_mode[0] & cmnd_70h) begin
                    if (lastCmd === 8'hEE || lastCmd == 8'hEC || lastCmd == 8'hED) begin
                        //don't set cmnd_00h high, as we are just returning to read mode from status mode
                        saw_cmnd_00h = 1'b1;
                        saw_cmnd_00h_stat = 1'b1;
                        disable_rdStatus;
                    end else begin
                        $sformat(msg, "Unexpected 00h cmd during nand_mode[0].");  ERROR(ERR_CMD, msg);
                    end 
                end

                if(~nand_mode[0]) begin
                    cache_op <= 1'b0;
                end 
            end //cmnd_00h

            // ***************************************
            // Command (05h) : RANDOM DATA READ START/CHANGE READ COLUMN
            // ***************************************
            else if (Io [7 : 0] === 8'h05) begin 
                
                cmnd_85h = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                // Some devices disable random read during cache mode
                if (die_select) begin
                    saw_cmnd_00h_stat = 1'b0;
                    lastCmd = 8'h05;
                    disable_rdStatus;
                    col_valid = 1'b0;
                    addr_start = 1;
                    addr_stop = COL_BYTES;
                end else begin
		    addr_cnt_en = 0;	// for unselected dies, addr_start should not be incremented.  It is enabled again when E0h cmnd is encountered or when disable_rdStatus task is called
                end
                saw_cmnd_00h = 1'b0;
                abort_en = 1'b0;
            end

            // ***********************************************
            // Command (06h) : MULTI-PLANE RANDOM DATA READ START/SELECT CACHE REGISTER
            // ***********************************************
            else if ((Io [7 : 0] === 8'h06) & (FEATURE_SET[CMD_2PLANE] | FEATURE_SET[CMD_MP])) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;  // clear because E0 is used to qualify 05 command read mode.
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                // Command ([06h] -> E0h)
                lastCmd = 8'h06;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop = ADDR_BYTES;
            end
        
            // ***************************************
            // Command (10h) : PROGRAM PAGE CONFIRM
            // ***************************************
            else if ((Io [7 : 0] === 8'h10) && die_select) begin
                cmnd_85h = 1'b0;
                datain_index = 0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if ((cache_op === 1) && ~nand_mode[0]) begin
                    cache_prog_last = 1'b1;
                end
		if (saw_cmnd_81h_jedec && ~multiplane_op_wr) begin
		    $sformat(msg, "81h-10h command can only be used during Multiplane Program Page"); ERROR(ERR_CMD, msg); 
		    saw_cmnd_81h_jedec = 1'b0;
		end else if ((row_valid && ~nand_mode[0] && Wp_n) 
                   ) begin
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Program Page Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    //program_page
                    if (((lastCmd === 8'hA5) && ~nand_mode[0]) 
                       ) begin
                        //8'hA5 -> OTP DATA PROTECT.  No programming, but there is busy time.
                        lastCmd = 8'h10;
                        if (~nand_mode[0]) OTP_locked = 1'b1;

			tWB_check_en = 1'b1;
                        #tWB_delay;
                        Rb_n_int = 1'b0;
                        status_register [6] = 1'b0;

                        if(~nand_mode[0]) begin 
                            status_register [5] = 1'b0;  
                            go_busy(tPROG_typ); 
                        end 
                        Rb_n_int <= 1'b1;   // not busy anymore
                        status_register [6] = 1'b1;
                        if(~nand_mode[0]) status_register [5] = 1'b1;
                    end else begin
                        if(~nand_mode[0]) begin
                            lastCmd = 8'h10;
                            copyback2 = 0;
			    saw_cmnd_81h_jedec = 1'b0;
                            program_page(multiplane_op_wr,cache_op);
                        end
                    end
                // SMK : ADD ERRORS for bad address or command here
                end
                // SMK : ADD ERRORS for bad address or command here

                multiplane_op_wr    = 1'b0;
                multiplane_op_rd    = 1'b0;
                multiplane_op_erase = 1'b0;
                cache_op <= 1'b0;
            end
    
            // ********************************************************
            // Command (11h) : MULTI-PLANE PROGRAM PAGE, 1st PLANE CONFIRM
            // ********************************************************
            else if ((Io [7 : 0] === 8'h11) & (FEATURE_SET[CMD_2PLANE] | FEATURE_SET[CMD_MP])) begin 

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (((lastCmd === 8'h80) || (lastCmd === 8'h85) || (lastCmd === 8'h8C)) && row_valid) begin
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Multi-Plane Program Page Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    multiplane_op_wr = FEATURE_SET[CMD_MP] | FEATURE_SET[CMD_2PLANE];
                    multiplane_op_rd = 1'b0;
                    multiplane_op_erase = 1'b0;
                    lastCmd = 8'h11;
                    //can't actually write to mem_array yet because final program command not seen
                    //busy time required to switch planes
		    tWB_check_en = 1'b1;
		    go_busy(tWB_delay);
                    Rb_n_int = 1'b0;
                    status_register[6:5] = 2'b00;
                    go_busy(tDBSY_min);
                    status_register[6:5] = array_prog_done ? 2'b11 : 2'b10;
                    Rb_n_int <= 1'b1;

/*  // ??/ replaces above
                    Rb_n_int                            <= #tWB_delay 1'b0;
                    status_register[6:5]                <= #tWB_delay 2'b00;

                    status_register[6:5]                <= #(tWB_delay + tDBSY_min) 2'b11;
                    Rb_n_int                            <= #(tWB_delay + tDBSY_min) 1'b1;
*/
                end 
            end
    
            // ********************************************************
            // Command (15h) : PROGRAM PAGE CACHE MODE CONFIRM
            // ********************************************************
            else if ((Io [7 : 0] === 8'h15) && die_select) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (boot_block_lock_mode) begin
                    $sformat(msg, "Error: Program Page Cache Mode Command %0h not allowed in boot block lock mode.", Io[7:0]); ERROR(ERR_CMD, msg); 
                end
                    
		if (saw_cmnd_81h_jedec && ~multiplane_op_wr) begin
		    $sformat(msg, "81h-15h command can only be used during Multiplane Program Page"); ERROR(ERR_CMD, msg); 
		    saw_cmnd_81h_jedec = 1'b0;
		end else if (((lastCmd === 8'h80) || (lastCmd === 8'h8C)) && row_valid && Wp_n) begin
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Program Page Cache Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    lastCmd = 8'h15;
                    cache_op <= 1'b1;
		    saw_cmnd_81h_jedec = 1'b0;
                    if(FEATURE_SET[CMD_2PLANE])
                        program_page (multiplane_op_wr, 1'b1);  // 2-Plane ops
                    else begin 
                        program_page (1'b0, 1'b1);  // need to revisit mp ???
                        multiplane_op_rd    = 1'b0;
                        multiplane_op_erase = 1'b0;
                        multiplane_op_wr    = 1'b0;
                    end 
                    
                    //copyback2 program cache 8Ch->15h
                    copyback2 = 0;
                end
            end

            // ********************************************************
            // Command (23h) : BLOCK UNLOCK START
            // ********************************************************
            else if ((Io [7 : 0] === 8'h23) && Wp_n && FEATURE_SET[CMD_LOCK]) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (ALLOWLOCKCOMMAND && ~LOCKTIGHT) begin
                    clear_queued_planes;
                    lastCmd = 8'h23;
                    disable_rdStatus;
                    row_valid = 1'b0;
                    col_valid = 1'b0;
                    addr_start = COL_BYTES +1;
                    addr_stop = ADDR_BYTES;                     
                    cache_op <= 1'b0;
                    disable_md_stat = 1'b0;
                end else begin
                    $sformat(msg, "Command 23h - IGNORED - Lock commands are disabled");
                    WARN(msg);
                end
                if(FEATURE_SET[CMD_MP] & die_select) multiplane_op_rd    = 1'b0;
            end
    
            // ********************************************************
            // Command (24h) : BLOCK UNLOCK CONFIRM
            // ********************************************************
            else if ((Io [7 : 0] === 8'h24) && FEATURE_SET[CMD_LOCK]) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (ALLOWLOCKCOMMAND && ~LOCKTIGHT) begin
                    if (row_valid) begin
                        lastCmd = 8'h24;
                        row_valid = 1'b0;
                        col_valid = 1'b0;
                        addr_start = COL_BYTES +1;
                        addr_stop = ADDR_BYTES;
                        LOCK_DEVICE = 1'b0;
                        status_register[7] = 1'b1;    
                    end
                end else begin
                    $sformat(msg, "Command 24h - IGNORED - Lock commands are disabled");
                    WARN(msg);
                end
                if(FEATURE_SET[CMD_MP] & die_select) multiplane_op_rd    = 1'b0;
            end
       
            // ********************************************************
            // Command (2Ah) : BLOCK LOCK
            // ********************************************************
            else if ((Io [7 : 0] === 8'h2A) && FEATURE_SET[CMD_LOCK]) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (ALLOWLOCKCOMMAND && ~LOCKTIGHT) begin
                    clear_queued_planes;
                    lastCmd = 8'h2A;
                    disable_rdStatus;
                    UnlockAddrLower = {ROW_BITS{1'b0}};
                    UnlockAddrUpper = {ROW_BITS{1'b1}};
                    LockInvert = 1'b1;
                    status_register[7] = 1'b0;
                    LOCK_DEVICE = 1'b1;       
                    cache_op <= 1'b0;
                    disable_md_stat = 1'b0;
                end else begin
                       $sformat(msg, "Command 2Ah - IGNORED - Lock commands are disabled");
                       WARN(msg);
                end
                if(FEATURE_SET[CMD_MP] & die_select) multiplane_op_rd    = 1'b0;
            end
       
            // ********************************************************
            // Command (2Ch) : BLOCK LOCK TIGHT
            // ********************************************************
            else if ((Io [7 : 0] === 8'h2C) && FEATURE_SET[CMD_LOCK]) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (ALLOWLOCKCOMMAND && ~LOCKTIGHT) begin
                    lastCmd = 8'h2C;
                    disable_rdStatus;
                    LOCKTIGHT = 1'b1;
                    LOCK_DEVICE = 1'b0;
                    status_register[7] = 1'b1;        
                    cache_op <= 1'b0;
                    disable_md_stat = 1'b0;
                end else begin
                    $sformat(msg, "Command 2Ch - IGNORED - Lock commands are disabled");
                    WARN(msg);
                end
                if(FEATURE_SET[CMD_MP] & die_select) multiplane_op_rd    = 1'b0;
            end
        
            // ********************************************************
            // Command (30h) : PAGE READ CONFIRM
            // ********************************************************
            else if (Io [7 : 0] === 8'h30) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (~nand_mode[0]) begin 
                    if (OTP_mode) begin //OTP_mode
                        OTP_read = 1'b1;
                        disable_md_stat = 1'b1;
                        disable_rdStatus;
                        lastCmd = 8'h30;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        load_cache_register (0, 0);
                        cache_valid = 1'b0;
                    end //OTP_mode
                    else if ((lastCmd === 8'h00) && row_valid && ~saw_cmnd_65h) begin //page_read
                        lastCmd = 8'h30;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        queued_plane[active_plane] = 1;
                        copy_queued_planes;
                        cache_rd_active_plane = active_plane; // need to set this reg in the case where we do 2 sequences of full read cache cmds
                        if(DEBUG[4]) begin $sformat(msg, "INFO: Page Read Confirm Set queued plane %0d. Value %0d", active_plane,queued_plane[active_plane]); INFO(msg); end 
//                        load_cache_register (multiplane_op_rd, 0);
			tWB_check_en = 1'b1;
                        load_cache_en = ~ load_cache_en;
                        // pre-ONFI 2.0 : for 2plane ops, pulsing Re_n after 2plane page read should output from Plane 0 first
                        // ONFI 2.0 : last plane addressed in a multiplane operation becomes active read plane
/*  
                        multiplane_op_rd    = 1'b0;
                        multiplane_op_wr    = 1'b0;
                        multiplane_op_erase = 1'b0;
                        cache_valid = 1'b0;
*/
                    end  //page_read
                    else if ((lastCmd === 8'hAF) && row_valid) begin //OTP_read
                        lastCmd = 8'h30;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        load_cache_register (0, 0);
                        cache_valid = 1'b0;
                    end //OTP_read
                    else if ((lastCmd === 8'h00) && row_valid && saw_cmnd_65h && (thisDieNumber == 3'b000)) begin //special_ID
                    //These are the special read unique and read id2 commands 
                    //(only supported on first die in a multi-die package)
                        lastCmd = 8'h30;
                        //pre-ONFI way of accessing READ UNIQUE ID and READ ID2
                        if (col_addr == 512) begin  // hex 200 (LSB of second Column Address = 02h)
                            if (FEATURE_SET[CMD_ID2]) begin
                                do_read_id_2 = 1'b1;
`ifdef x16
                                    col_counter = 256;  // Byte 512 for x16
`else
                                    col_counter = 512;  // Byte 512 for x8
`endif
                                load_cache_register(0,0); 
                            end else begin
                                $sformat(msg, "READ ID2 Command is not supported by this device.");
                                ERROR(ERR_CMD, msg);
                            end
                        end else if (col_addr == 0) begin
                            if (FEATURE_SET[CMD_UNIQUE]) begin
                                $sformat(msg, "Manufacturer's Unique ID not yet defined for this model.  Will use 128'h05060708_090A0B0C_0D0E0F10_11121314.");
                                INFO(msg);
                                do_read_unique = 1'b1;
                                col_counter = 0;
                                load_cache_register(0,0); 
                            end else begin
                                $sformat(msg, "READ UNIQUE Command is not supported by this device.");
                                ERROR(ERR_CMD, msg);
                            end
                        end else begin
                            $sformat(msg, "Invalid col_addr when attemping read_id_2 or read_unique, col_addr=%0hh", col_addr);
                            ERROR(ERR_ADDR, msg);
                        end
                        saw_cmnd_65h = 1'b0; 
                    end //special_ID
                    else if (FEATURE_SET[CMD_ID2] || FEATURE_SET[CMD_UNIQUE]) begin //save 30h as last command for legacy 30h->65h->00h->address->30h
                        lastCmd = 8'h30;
                    end
                end 
            end

            // ********************************************************
            // Command (31h) : PAGE READ CACHE MODE
            // ********************************************************
            else if (Io [7 : 0] === 8'h31) begin
                cmnd_85h = 1'b0;
                // support either seq cache (30h->31h->3Fh) or ONFI random cache page (30h->00h->address->31h->3Fh)
                //   31h only valid after 30h or 31h, or can we insert a rand
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (row_valid && FEATURE_SET[CMD_NEW] && die_select && ~nand_mode[0]) begin
                    // Reset Column Address
                    col_addr = 0;
                    col_counter = 0;
                    sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                    cache_op <= 1'b1;
                    //If sequential page read cache mode, use same queued planes as for read page for cached read
		    // !cmnd_78h is for case of die1 78h-00h, die0 78h-31h; die 0 should auto-increment row addr
                    if ((lastCmd === 8'h00) && !saw_cmnd_00h && !cmnd_78h && (FEATURE_SET[CMD_ONFI] | NOONFIRDCACHERANDEN)) begin
		    	// If we get (30h->00h->address->31h->3Fh) command, no need to auto-increment row addr because host inputted a new row addr
                        queued_plane[active_plane] = 1'b1;
                        copy_queued_planes;
                        if(DEBUG[4]) begin $sformat(msg, "INFO: Page Read Cache Set queued plane %0d Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    end else begin
		    	// otherwise we have sequential read cache (30h->31h->3Fh) command, need to auto-increment row addr
                        for (plane_addr = 0; plane_addr < NUM_PLANES; plane_addr = plane_addr +1) begin
                            if (queued_plane[plane_addr]) begin
                                if(&(row_addr[plane_addr][BLCK_BITS+PAGE_BITS-1:0])) begin
                                    $sformat(msg, "Read Page Cache Sequential cannot cross LUN(die) boundaries. Sequential command on Block=%0h :  Page=%0h : forces address over Block Limit=%0h which is the LUN boundary", (row_addr[plane_addr][BLCK_BITS+PAGE_BITS-1:PAGE_BITS]), (row_addr[plane_addr][PAGE_BITS-1:0]), (1<<BLCK_BITS)-1);
                                    ERROR(ERR_CACHE, msg);
                                end 
                                if(~(&row_addr[plane_addr][PAGE_BITS-1:0]))
                                    row_addr[plane_addr] = {(row_addr[plane_addr][(ROW_BITS -1) : (PAGE_BITS)]), (row_addr[plane_addr] [(PAGE_BITS -1) : 0] + 1'b1)};
                                else
                                    row_addr[plane_addr] = {(row_addr[plane_addr][(ROW_BITS -1) : (PAGE_BITS)]+NUM_PLANES), (row_addr[plane_addr] [(PAGE_BITS -1) : 0] + 1'b1)};
                            	active_plane = plane_addr; // need to set active plane in 31h sequential case b/c there is no address given in 31h sequential
                            	cache_rd_active_plane = active_plane;
                            end
                        end
                        if(FEATURE_SET[CMD_MPRDWC]) rd_pg_cache_seqtl = 1'b1;
                    end
                    lastCmd = 8'h31;
                    disable_rdStatus;
                    load_cache_register (0, 1);  // Load cache
                    if (NUM_PLANES==2 & (
                        (rd_pg_cache_seqtl & multiplane_op_rd_cache) | (~rd_pg_cache_seqtl & multiplane_op_rd)) ) begin
                       active_plane <= #1 0; // this will override the blocking assignment made in load_cache_register task
                    end
                    cache_valid = 1'b1;
                    abort_en = 1'b0;
                    rd_pg_cache_seqtl = 1'b0;
                end //row_valid
                saw_cmnd_00h = 1'b0;  // clear because cache_op is used to qualify 05 command read mode.
                if(FEATURE_SET[CMD_NEW] && die_select && ~nand_mode[0]) begin multiplane_op_rd = 1'b0; multiplane_op_erase = 1'b0; multiplane_op_wr = 1'b0; end 
            end
    
            // ********************************************************
            // Command (32h) : Multi-Plane page read
            // ********************************************************
            else if ((Io [7 : 0] === 8'h32) && FEATURE_SET[CMD_ONFI] && die_select) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0; // ??? may be issue with multiplane and read mode without read command.  
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (row_valid) begin
                    // Reset Column Address
                    col_addr = 0;
                    col_counter = 0;                
                    lastCmd = 8'h32;
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Multi_plane Page Read Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
		    tWB_check_en = 1'b1;
                    go_busy(tWB_delay);
                    Rb_n_int = 1'b0;
                    status_register[6:5]=2'b00;
                    go_busy(tDBSY_min);
                    status_register[6:5]<=2'b11;
                    Rb_n_int <=1'b1;
                    multiplane_op_rd = FEATURE_SET[CMD_MP] | FEATURE_SET[CMD_2PLANE]; 
                    multiplane_op_wr = 1'b0;
                    multiplane_op_erase = 1'b0;

/*  // ??? replaces above
                    Rb_n_int                            <= #tWB_delay 1'b0;
                    status_register[6:5]                <= #tWB_delay 2'b00;

                    status_register[6:5]                <= #(tWB_delay + tDBSY_min) 2'b11;
                    Rb_n_int                            <= #(tWB_delay + tDBSY_min) 1'b1;
                    multiplane_op_rd                    <= #(tWB_delay + tDBSY_min) FEATURE_SET[CMD_MP] | FEATURE_SET[CMD_2PLANE]; 
                    multiplane_op_wr                    <= #(tWB_delay + tDBSY_min) 1'b0;
                    multiplane_op_erase                 <= #(tWB_delay + tDBSY_min) 1'b0;
*/
                end
            end            

            // ********************************************************
            // Command (35h) : COPYBACK READ CONFIRM
            // ********************************************************
            else if ((Io [7 : 0] === 8'h35) && die_select) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (row_valid) begin
                    lastCmd = 8'h35;
                    //col_counter must be set to 0 so designs supporting Re# pulses after h35 work correctly
                    col_counter = 0;
                    copyback = 1'b1;
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Copyback Read Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    load_cache_register (multiplane_op_rd, cache_op);

                    //pre-ONFI 2.0 : for 2plane ops, pulsing Re_n after 2plane page read should
                    // output from Plane 0 first
                    // ONFI 2.0 : adds option for last plane addressed in a multiplane operation becoming active read plane
		    if (multiplane_op_rd & ~FEATURE_SET2[CMD_MP_OUTPUT] & NUM_PLANES==2) begin
			active_plane <= #1 0; // this will override the blocking assignment made in load_cache_register task
		    end
                end
                multiplane_op_rd    = 1'b0;
                multiplane_op_wr    = 1'b0;
                multiplane_op_erase = 1'b0;
                cache_op = 1'b0;
                copyback = 1'b0;
            end

            // ********************************************************
            // Command (3Ah) : COPYBACK2 READ
            // ********************************************************
            else if ((Io [7 : 0] === 8'h3A) && FEATURE_SET[CMD_ONFI]) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (die_select && row_valid) begin
                    abort_en = 1'b0;
                    if (lastCmd == 8'h00) begin
                        col_counter = 0;
//                        col_valid = 1;  // ??? 00h should have set the col valid signal.
                        lastCmd = 8'h3A;
                        queued_plane[active_plane] = 1;
                        if(DEBUG[4]) begin $sformat(msg, "INFO: Copyback2 Read Set queued plane %0d. Value %0d", active_plane,queued_plane[active_plane]); INFO(msg); end 
                        copyback2 = 1;
                        load_cache_register (multiplane_op_rd, 0);
                        multiplane_op_rd    = 1'b0;
                        multiplane_op_wr    = 1'b0; // ??? verify
                        multiplane_op_erase = 1'b0; // ??? verify
                        cache_valid = 1'b0;
                        copyback2 = #1 0;
                    end else begin
                        $sformat(msg, " Invalid command sequence.  8'h3A was not preceeded by an 8'h00 command."); 
                        ERROR(ERR_CMD, msg);
                    end
                end
            end
            // ********************************************************
            // Command (3Fh) : PAGE READ CACHE MODE LAST
            // ********************************************************
            else if ((Io [7 : 0] === 8'h3F) && FEATURE_SET[CMD_NEW]) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;

                if ((lastCmd !== 8'h3F) && row_valid) begin
                    lastCmd = 8'h3F;
                    disable_rdStatus;
                    // Reset Column Address
                    col_addr = 0;
                    col_counter = 0;
                    sub_col_cnt = sub_col_cnt_init;  // reset sub col count
		    
		    // this is normally done in copy_queued_planes task
		    for (plane_addr = 0; plane_addr < NUM_PLANES; plane_addr = plane_addr +1) begin
			if (queued_plane_cache[plane_addr]) begin
			    cache_rd_active_plane = plane_addr; // store this value so that the correct plane will output data during cache read
			end
		    end

                    if(FEATURE_SET[CMD_MPRDWC]) rd_pg_cache_seqtl = 1'b1;
                    load_cache_register (0, 1); 
                    
                    if (NUM_PLANES==2 & (
                        (rd_pg_cache_seqtl & multiplane_op_rd_cache) | (~rd_pg_cache_seqtl & multiplane_op_rd)) ) begin
                       active_plane <= #1 0; // this will override the blocking assignment made in load_cache_register task
                    end
                    rd_pg_cache_seqtl = 1'b0;

                    cache_valid = 1'b1;
                    cache_op <= 0;
                    clear_queued_planes;
                    
                    // MP not supported with cache mode.  
                    multiplane_op_rd    = 1'b0;
                    multiplane_op_wr    = 1'b0;
                    multiplane_op_erase = 1'b0;
                    copy_queued_planes;  // clears MP queued planes and multi-plane op rd cache flag.
                end else if ((lastCmd === 8'h3F) && row_valid) begin
                    $sformat(msg, "Illegal use of 3Fh command.");
                    ERROR(ERR_CMD, msg);
                end
            end
    
            // ********************************************************
            // Command (60h) : BLOCK ERASE START
            // ********************************************************
            else if (Io [7 : 0] === 8'h60) begin
                cmnd_85h = 1'b0;
                abort_en = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;

                if (~Wp_n) begin
                    $sformat(msg, "Wp_n = 0,  ERASE operation disabled.");
                    WARN(msg);
                end else if (OTP_mode) begin
                    $sformat(msg, "Device in OTP mode.  ERASE operation disabled.");
                    WARN(msg);
                end else begin 
                    if (((lastCmd === 8'h60) || (lastCmd === 8'hD1)) && row_valid && FEATURE_SET[CMD_2PLANE]) begin
                        //2nd half of 2-plane erase
                        multiplane_op_erase = 1'b1;
                        multiplane_op_rd = 1'b0;
                        multiplane_op_wr = 1'b0;
                        if (lastCmd === 8'h60) begin 
                            queued_plane[active_plane] = 1;  
                            if(DEBUG[4]) begin $sformat(msg, "INFO: Block Erase Set queued plane %0d. Value %0d", active_plane,queued_plane[active_plane]); INFO(msg); end 
                        end
                        lastCmd = 8'h60;
                    end else if (~multiplane_op_erase) begin
                        saw_cmnd_60h = 1'b1;
                        saw_cmnd_60h_clear = 1'b1;
//                        clear_queued_planes;  // only clear if to this die
                    end else begin
                        saw_cmnd_60h = 1'b1;
                        saw_cmnd_60h_clear = 1'b0;
                    end 
//                    lastCmd = 8'h60;
                    disable_rdStatus;
                    row_valid = 1'b0;
                    addr_start = COL_BYTES +1;
                    addr_stop = ADDR_BYTES;
                end       
                cache_op <= 1'b0;
                disable_md_stat = 1'b0;
            end
    
            // ********************************************************
            // Command (65h) : READ ID/UNIQUE (pre-ONFI implementation)
            //   30h->65h->00h->address->30h
            // ********************************************************
            else if ((Io [7 : 0] === 8'h65) && (FEATURE_SET[CMD_ID2] || FEATURE_SET[CMD_UNIQUE])) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (lastCmd == 8'h30) begin
                    lastCmd = 8'h65;
                    saw_cmnd_65h = 1'b1;
                end
            end

            // ********************************************************
            // Command (70h) : READ STATUS
            // ********************************************************
            else if ((Io [7 : 0] === 8'h70) && die_select) begin
            // SMK : ADD nand mode[0] SUPPORT HERE

                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                // Status
                cmnd_70h = 1'b1;
                cmnd_78h = 1'b0;
            end

            // ********************************************************
            // Command (78h) : MULTI-PLANE READ STATUS
            // ********************************************************
            else if (Io [7 : 0] === 8'h78) begin

                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                // Status
                if (disable_md_stat) begin
                    //some operations make this command illegal
                    $sformat(msg, "MULTI-DIE STATUS READ (78h) IS PROHIBITED DURING AND AFTER POWER-UP RESET, OTP OPERATIONS, READ PARAMETERS, READ ID, READ UNIQUE ID, and GET/SET FEATURES.");
                    ERROR(ERR_STATUS, msg);
                end else begin
                    cmnd_70h = 1'b0;
                    cmnd_78h = 1'b1;
                    addr_start = COL_BYTES +1;
                    addr_stop = ADDR_BYTES;
                    row_valid = 1'b0;
                end
		if (lastCmd == 8'hFA && FEATURE_SET2[CMD_RESETLUN]) begin
		    lastCmd = 8'hAA; // set to illegal value to stop chip from executing another reset LUN during 78h cmd
		end
            end
    
            // ********************************************************
            // Command (7Ah) : BLOCK LOCK READ STATUS
            // ********************************************************
            else if ((Io [7 : 0] === 8'h7A) && (die_select) && FEATURE_SET[CMD_LOCK]) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                   // Status
                lastCmd = 8'h7A;
                disable_rdStatus;
                addr_start = COL_BYTES +1;
                addr_stop = ADDR_BYTES;
                row_valid = 1'b0;
            end

            // ********************************************************
            // Command (80h) : PROGRAM PAGE START
            // ********************************************************
            else if (Io [7 : 0] === 8'h80) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (~Wp_n) begin //Write-protect
                    $sformat(msg, "Wp_n = 0,  PROGRAM operation disabled.");
                    WARN(msg);
                end else begin //end write protect ; else start program
                    lastCmd = 8'h80;
                    disable_rdStatus;
                    col_valid = 1'b0;
                    row_valid = 1'b0;
                    addr_start = 1'b1;
                    addr_stop = ADDR_BYTES;
                    col_counter = 0;
                    sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                    //Initial 80h command clears registers of all devices.
                    //If this is 2nd half of multiplane op, don't want to clear registers.
                    if (~multiplane_op_wr && ~LUN_pgm_clear) begin
			for (pl_cnt=0;pl_cnt<NUM_PLANES;pl_cnt=pl_cnt+1) begin
			    clear_plane_register(pl_cnt);
			end
                    end
                    multiplane_op_rd	= 1'b0;  // prog page clears all cache registers on a selected target, not just lun
                    multiplane_op_erase = 1'b0;
                    if (OTP_mode) begin
                        OTP_write = 1'b1;
                        disable_md_stat = 1'b1;
                        disable_rdStatus;
                    end
                end //program
                disable_md_stat = 1'b0;
            end
        
            // ********************************************************
            // Command (81h) : JEDEC MULTI-PLANE PROGRAM PAGE START
            // ********************************************************
            else if (Io [7 : 0] === 8'h81 && FEATURE_SET2[CMD_JEDEC]) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (~Wp_n) begin //Write-protect
                    $sformat(msg, "Wp_n = 0,  PROGRAM operation disabled.");
                    WARN(msg);
                end else begin //end write protect ; else start program
                    lastCmd = 8'h80; // make the model think 80h in order to re-use existing 80h code
                    disable_rdStatus;
		    saw_cmnd_81h_jedec = 1'b1;
                    col_valid = 1'b0;
                    row_valid = 1'b0;
                    addr_start = 1'b1;
                    addr_stop = ADDR_BYTES;
                    col_counter = 0;
                    sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                    //Initial 80h command clears registers of all devices.
                    //If this is 2nd half of multiplane op, don't want to clear registers.
                    if (~multiplane_op_wr && ~LUN_pgm_clear) begin
			for (pl_cnt=0;pl_cnt<NUM_PLANES;pl_cnt=pl_cnt+1) begin
			    clear_plane_register(pl_cnt);
			end
                    end
                    multiplane_op_rd	= 1'b0;  // prog page clears all cache registers on a selected target, not just lun
                    multiplane_op_erase = 1'b0;
                    if (OTP_mode) begin
                        OTP_write = 1'b1;
                        disable_md_stat = 1'b1;
                        disable_rdStatus;
                    end
                end //program
                disable_md_stat = 1'b0;
            end
        
            // ************************************************************
            // Command (85h) : COPYBACK PROGRAM START or RANDOM DATA INPUT
            // ************************************************************
            else if (Io [7 : 0] === 8'h85) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (row_valid) begin
                    if ((lastCmd === 8'h11) && FEATURE_SET[CMD_ONFI]) begin
                    //ONFI devices support 85h-11h-85h-10h for internal data move
                        queued_plane[active_plane] = 1;
                        if(DEBUG[4]) begin $sformat(msg, "INFO: Cmd 85h Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                        col_valid = 1'b0;
                        row_valid = 1'b0;
                        lastCmd = 8'h85;
                        disable_rdStatus;
                        addr_start = 1;
                        addr_stop = ADDR_BYTES;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        disable_md_stat = 1'b0;
                    end
                    //if address is already valid, then this is a random data input
                    else if ((lastCmd === 8'h85) | (lastCmd === 8'h80) | (lastCmd === 8'hA0) | (lastCmd === 8'h8C)) begin  
                        col_valid = 1'b0;
                        // Don't clear row address and row valid status here even if this is a 5-cycle 
                        // address input for ONFI 2.0 devices.
                        // At the very least we will require 2 address cycles, up to 5.  If only 2, then row address
                        // will remain the same
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        // do not set lastCmd here since this is just random data input and not the start of a command
                        addr_start = 1;
                        addr_stop = ADDR_BYTES;
                        cmnd_85h = 1'b1;
                    end
                    else begin //end row_valid (random data input) ; else start copyback
                    //else this is the first 85h for internal data move (not random data input)
                      if (~Wp_n) begin
                        $sformat(msg, "Wp_n = 0,  PROGRAM operation disabled.");
                        WARN(msg);
                      end else begin
                        //if this is the first of a multi-LUN copyback operation, clear the plane queue
//                        if (~multiplane_op) begin
//                            clear_queued_planes;  // ??? (command latch 85h), later specs donot allow this to clear.
//                        end
                        col_valid = 1'b0;
                        row_valid = 1'b0;
                        lastCmd = 8'h85;
                        disable_rdStatus;
                        addr_start = 1;
                        addr_stop = ADDR_BYTES;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        disable_md_stat = 1'b0;
                      end
                    end //end copyback

                    if(FEATURE_SET[CMD_MP]) multiplane_op_rd    = 1'b0;

                end else begin
		    // row_valid is low => we may possibly be re-enabling data input for a pgm "pause" operation
		    // we include 30h cmd as exception because model will latch 00h-30h cmd to lastCmd even for un-selected dies
		    // we include 10h cmd as exception for case of mp_copyback read, single plane copyback pgm, other plane copyback pgm. Other plane pgm was never executed b/c lastCmd=10h
                    if ((lastCmd === 8'h85) || (lastCmd === 8'h80) || (lastCmd === 8'h30) || (lastCmd === 8'h10)) begin
		    	// code is directly copied from row_valid case above
                        col_valid = 1'b0;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        // do not set lastCmd here since this is just random data input and not the start of a command, except after 30h, 10h cmd
                        if (lastCmd === 8'h30 || lastCmd === 8'h10)
			    lastCmd = 8'h85;
                        addr_start = 1;
                        addr_stop = ADDR_BYTES;
                        cmnd_85h = 1'b1;
                    end else begin
		        col_valid = 1'b0;
                        row_valid = 1'b0;
                        lastCmd = 8'h85;
                        disable_rdStatus;
                        addr_start = 1;
                        addr_stop = ADDR_BYTES;
                        col_counter = 0;
                        sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                        disable_md_stat = 1'b0; 
		    end
		end // ends if (row_valid) else...
            end
    
            // ***********************************************************
            // Command (8Ch) : COPYBACK 2 PROGRAM PAGE START (ONFI 2.0) 
            // ***********************************************************
            else if ((Io [7 : 0] === 8'h8C) && FEATURE_SET[CMD_ONFI]) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (~Wp_n) begin
                    $sformat(msg, "Wp_n = 0,  PROGRAM operation disabled.");
                    WARN(msg);
                end else begin
                    lastCmd = 8'h8C;
                    disable_rdStatus;
                    col_valid = 1'b0;
                    row_valid = 1'b0;
                    addr_start = 1'b1;
                    addr_stop = ADDR_BYTES;
                    col_counter = 0;
                    //switch to indicate copyback2 op is in progress 
                    // we'll need this to prevent array programming after cache_reg->data_reg transfer
                    // only valid for ONFI 2.0 devices
                    copyback2 = 1;
                    //The 8Ch command does not clear cache registers like 80h does.                        
                    disable_md_stat = 1'b0;
                end 
            end


            // ********************************************************
            // Command (90h) : READ ID
            // Only 1 LUN returns data, to avoid collisions
            // ********************************************************
            else if (Io [7 : 0] === 8'h90 & id_cmd_lun) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes;  // ??? (command latch 90h)
                lastCmd = 8'h90;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop = 0;
                col_counter = 0;
                cache_op <= 1'b0;
                disable_md_stat = 1'b0;
                ONFI_read_param = 1'b0;
                do_read_unique = 1'b0;
                if(FEATURE_SET[CMD_MP]) multiplane_op_rd    = 1'b0;
            end
    
            // ********************************************************
            // Command (A0h) : OTP DATA PROGRAM START
            // ********************************************************
            else if ((Io [7 : 0] === 8'hA0) && FEATURE_SET[CMD_OTP]) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                // Command (A0)
                for (pl_cnt=0;pl_cnt<NUM_PLANES;pl_cnt=pl_cnt+1) begin //plane_loop
		    if (bypass_cache)
			clear_data_register(pl_cnt);
		    else
                    	clear_cache_register(pl_cnt);
                    clear_queued_planes;
                end //plane_loop
                OTP_write = 1'b1;
                disable_md_stat = 1'b1;
                lastCmd = 8'hA0;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1'b1;
                addr_stop = ADDR_BYTES;
                col_counter = 0;
            end
     
            // ********************************************************
            // Command (A5h) : OTP DATA PROTECT 
            // ********************************************************
            else if ((Io [7 : 0] === 8'hA5) && FEATURE_SET[CMD_OTP]) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                // Command (A5)
                clear_queued_planes; // ??? (command latch a5h)
                lastCmd = 8'hA5;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1'b1;
                addr_stop = ADDR_BYTES;
                col_counter = 0;
                if (DEBUG[3]) begin $sformat(msg, "OTP Protect"); INFO(msg); end
            end

            // ********************************************************
            // Command (AFh) : OTP DATA READ START 
            // ********************************************************
            else if ((Io [7 : 0] === 8'hAF) && FEATURE_SET[CMD_OTP]) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes; // ??? (command latch afh)
                OTP_read = 1'b1;
                disable_md_stat = 1'b1;
                lastCmd = 8'hAF;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop = ADDR_BYTES;
            end
 
            // ********************************************************
            // Command (B8h) : PROGRAMMABLE IO DRIVESTRENGTH
            // ********************************************************
            else if ((Io [7 : 0] === 8'hB8) & FEATURE_SET[CMD_DRVSTR]) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes; // ??? (command latch b8h)
                lastCmd = 8'hB8;
                disable_rdStatus;
                cache_op <= 1'b0;
                disable_md_stat = 1'b0;
            end
    
            // ********************************************************
            // Command (D0h) : BLOCK ERASE CONFIRM
            // ********************************************************
            else if (Io [7 : 0] === 8'hD0) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if ((lastCmd === 8'h60) && row_valid && Wp_n) begin
                    lastCmd = 8'hD0;
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Block Erase Confirm Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
		    tWB_check_en = 1'b1;
		    erase_blk_en = ~ erase_blk_en;
//                    multiplane_op_erase = 1'b0;
//                    multiplane_op_rd    = 1'b0;
//                    multiplane_op_wr    = 1'b0;
//                    cache_op <= 1'b0;
		    // Previously, we detect D0h command, which triggers erase blk, and then this blk decodes next command.  The erase blk would schedule events instead of using go_busy.
		    // In the case where we interrupt erase with reset command, the scheduled events would still occur in the future.
		    // If a new erase command is given close to the scheduled event, then that new erase command might finish ahead of tBERS, but it still schedules events to happen after tBERS.
		    // With erase suspend, we cannot use scheduled events, so we switch to go_busy method
		    #(tWB_delay+1); // wait for erase_done to go low
		    // need to wait for always erase_blk_pls blk to finish, o.w. this cmd detection blk will immediately end at D0h cmd, which will cause conflicts with go_busy blk 
		    wait(erase_done);
                end
            end

            // ********************************************************
            // Command (D1h) : MULTI-PLANE BLOCK ERASE CONFIRM
            // ********************************************************
            else if ((Io[7:0] === 8'hD1) & FEATURE_SET[CMD_ONFI] & (FEATURE_SET[CMD_2PLANE] | FEATURE_SET[CMD_MP])) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                //This command is an optional command for the 1st block of a 2-plane erase (pre ONFI2.0)
                //This command is used to queue a block for erase (ONFI2.0, also supports cancelling of command if block address is all 1's)
                if (new_addr[ROW_BITS-1:PAGE_BITS] === {BLCK_BITS{1'b1}}) begin
                    clear_queued_planes;
                    //cancel the erase
                    lastCmd = 8'hD0;
                    row_valid = 0;
                    col_valid = 0;
                end else 
                if ((lastCmd === 8'h60) && row_valid) begin
                    queued_plane[active_plane] = 1;
                    if(DEBUG[4]) begin $sformat(msg, "INFO: Multi-Plane Block Erase Set queued plane %0d. Value %0d", active_plane, queued_plane[active_plane]); INFO(msg); end 
                    lastCmd = 8'hD1;
                    multiplane_op_erase = 1'b1;
                    multiplane_op_rd    = 1'b0;
                    multiplane_op_wr    = 1'b0;
		    tWB_check_en = 1'b1;
                    go_busy(tWB_delay);
                    Rb_n_int = 1'b0;
                    status_register[6:5]=2'b00;
                    go_busy(tDBSY_min);
                    status_register[6:5]<=2'b11;
                    Rb_n_int <=1'b1;

/*  // ???
                    Rb_n_int                            <= #tWB_delay 1'b0;
                    status_register[6:5]                <= #tWB_delay 2'b00;

                    status_register[6:5]                <= #(tWB_delay + tDBSY_min) 2'b11;
                    Rb_n_int                            <= #(tWB_delay + tDBSY_min) 1'b1;
*/
                end
            end
    
            // ********************************************************
            // Command (E0h) : RANDOM DATA READ CONFIRM, CHANGE READ COLUMN/SELECT CACHE REGISTER CONFIRM
            // ********************************************************
            else if (Io [7 : 0] === 8'hE0) begin

                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
		addr_cnt_en = 1; // enable counter b/c it was possibly disabled by previous 05h cmd during multi-lun sharing same p_ce config
                if ((lastCmd === 8'h06) && row_valid) begin
                    lastCmd = 8'hE0;
                    col_counter = 0;
                    sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                    cache_valid = 1'b0;                    
                end 
                else if ((lastCmd === 8'h05) && col_valid) begin
                    lastCmd = 8'hE0;
                    col_counter = 0;
                    sub_col_cnt = sub_col_cnt_init;  // reset sub col count
                end
            end
	    
            // ********************************************************
            // Command (ECh) : ONFI READ PARAMETER PAGE
            // Only 1 LUN returns data, to avoid collisions
            // ********************************************************
            else if ((Io [7 : 0] === 8'hEC) & (FEATURE_SET[CMD_ONFI] || FEATURE_SET2[CMD_JEDEC]) & id_cmd_lun) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes;
                lastCmd = 8'hEC;
                disable_rdStatus;
                ONFI_read_param = 1'b1;  // enables Read Parameter_Page Command
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop = 0;
                col_counter = 0;
                disable_md_stat = 1'b1;
                if(FEATURE_SET[CMD_MP]) multiplane_op_rd    = 1'b0;
                do_read_unique = 1'b0;
            end

            // ********************************************************
            // Command (EDh) : ONFI READ UNIQUE ID
            // Only 1 LUN returns data, to avoid collisions
            // ********************************************************
            else if ((Io[7:0] === 8'hED) & FEATURE_SET[CMD_UNIQUE] & FEATURE_SET[CMD_ONFI] & id_cmd_lun) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes;
                lastCmd = 8'hED;
                disable_rdStatus;
                disable_md_stat = 1'b1;
                do_read_unique  = 1'b1;  // enables Read_Unique_ID Command
                col_valid  = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop  = 0;
                if(FEATURE_SET[CMD_MP]) multiplane_op_rd    = 1'b0;
            end

            // ********************************************************
            // Command (EEh) : GET FEATURES
            // Only 1 LUN returns data, to avoid collisions
            // ********************************************************
            else if ((Io [7 : 0] === 8'hEE) & FEATURE_SET[CMD_FEATURES] & id_cmd_lun) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes;
                disable_md_stat = 1'b1;
                lastCmd = 8'hEE;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop = 0;
                col_counter = 0;
                ONFI_read_param = 1'b0;
                do_read_unique = 1'b0;
                if(FEATURE_SET[CMD_MP]) multiplane_op_rd    = 1'b0;
            end

            // ********************************************************
            // Command (EFh) : SET FEATURES
            // ********************************************************
            else if ((Io [7 : 0] === 8'hEF) && FEATURE_SET[CMD_FEATURES]) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                clear_queued_planes;
                disable_md_stat = 1'b1;
                lastCmd <= 8'hEF;
                disable_rdStatus;
                col_valid = 1'b0;
                row_valid = 1'b0;
                addr_start = 1;
                addr_stop = 0;
                col_counter = 0;
                if(FEATURE_SET[CMD_MP]) multiplane_op_rd    = 1'b0;
            end
                                    
            // ********************************************************
            // Command (FAh) : RESET LUN
            // ********************************************************
            else if ((Io [7 : 0] === 8'hFA) & FEATURE_SET2[CMD_RESETLUN]) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                lastCmd = 8'hFA;
                addr_start = COL_BYTES +1;
                addr_stop = ADDR_BYTES;
                row_valid = 1'b0;
		// In FCh and FFh commands, the nand_reset task interrupts the command detection always block
		// So, FAh should do the same thing, but the nand_reset task is not called in this block
		// Solution is to just to a static wait during which the nand_reset task is called by another block  
                if (~array_load_done)
                    #tRST_read;
                else if (~array_prog_done)
                    #tRST_prog;
                else if (~erase_done)
                     #tRST_erase;
                else 
		     #tRST_ready;
            end
	    
            // ********************************************************
            // Command (FCh) : SYNCHRONOUS RESET
            // ********************************************************
            else if (Io [7 : 0] === 8'hFC) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                //set lastCmd register 
                if (sync_mode || sync_enh_mode) begin
                    lastCmd = 8'hFC;
                    if (~ResetComplete)
                        nand_reset (1'b0);
                    else
                        nand_reset (1'b1);
                end else begin
                    $sformat(msg,"Illegal synchronous reset command.  Device is not in synchronous operation.");
                    ERROR(ERR_CMD, msg);
                end
            end

            // ********************************************************
            // Command (FFh) : RESET
            // ********************************************************
            else if (Io [7 : 0] === 8'hFF) begin
            // SMK : ADD nand mode[0] SUPPORT HERE
                //set lastCmd register 
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                saw_cmnd_60h = 1'b0;
                saw_cmnd_60h_clear = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                lastCmd = 8'hFF;
                if (nand_mode[0]) reset_cmd = 1;
                if (~ResetComplete) begin
                    nand_reset (1'b0);
                end else begin
                    nand_reset (1'b1);
                end
            end

            // ********************************************************
            // Command (??h) : UNSUPPORTED COMMAND
            // ********************************************************
            else if (die_select) begin
                $sformat(msg, "Unsupported command = %00h", Io[7:0]);
                ERROR(ERR_CMD, msg);
            end
        end //  cLatch_unbusy
        
        //-----------------------------------------------
        //------Command input during busy ---------------
        //-----------------------------------------------
        else if (Rb_n_int === 1'b0) begin 
            //else we are busy and only certain commands are allowed
            
            // even when busy we need to do status and reset
            if (DEBUG[3]) begin
                $sformat(msg, "Attempting to latch command %0h while busy ...", Io); 
                INFO(msg);
            end

            // ********************************************************
            // Command (70h) : READ STATUS (DURING BUSY)
            // ********************************************************
            if ((Io [7 : 0] === 8'h70) && (die_select)) begin
            // SMK : ADD nand mode[0] SUPPORT HERE
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (DEBUG[3]) begin $sformat (msg, "Command Latched = %2hh", Io[7:0]); INFO(msg); end
                // Status
                cmnd_70h = 1'b1;
                cmnd_78h = 1'b0;
            end

            // ********************************************************
            // Command (78h) : MULTI-PLANE READ STATUS (DURING BUSY)
            // ********************************************************
            else if (~nand_mode[0] && (Io [7 : 0] === 8'h78)) begin
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                if (DEBUG[3]) begin $sformat(msg, "Command Latched = %2hh", Io[7:0]); INFO(msg); end
                // Status
                cmnd_70h = 1'b0;
                cmnd_78h = 1'b1;
                addr_start = COL_BYTES +1;
                addr_stop = ADDR_BYTES;
                row_valid = 1'b0;
		if (lastCmd == 8'hFA && FEATURE_SET2[CMD_RESETLUN]) begin
		    lastCmd = 8'hAA; // set to illegal value to stop chip from executing another reset LUN during 78h cmd
		end
            end

            // ********************************************************
            // Command (FAh) : RESET LUN (DURING BUSY)
            // ********************************************************
            else if ((Io [7 : 0] === 8'hFA) & FEATURE_SET2[CMD_RESETLUN]) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                addr_start = COL_BYTES +1;
                addr_stop = ADDR_BYTES;
                row_valid = 1'b0;
                if (DEBUG[3]) begin $sformat(msg, "Command Latched = %2hh", Io[7:0]); INFO(msg); end
                lastCmd = 8'hFA;
		// In FCh and FFh commands, the nand_reset task interrupts the command detection always block
		// So, FAh should do the same thing, but the nand_reset task is not called in this block
		// Solution is to just to a static wait during which the nand_reset task is called by another block  
                if (~array_load_done)
                    #tRST_read;
                else if (~array_prog_done)
                    #tRST_prog;
                else if (~erase_done)
                     #tRST_erase;
                else 
		     #tRST_ready;
            end            
	    
            // ********************************************************
            // Command (FCh) : SYNCHRONOUS RESET
            // ********************************************************
            else if (~nand_mode[0] && (Io [7 : 0] === 8'hFC)) begin
                //set lastCmd register
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                // ??? saw_cmd_60 support 
                abort_en = 1'b0;
                if (sync_mode || sync_enh_mode) begin
                    lastCmd = 8'hFC;
                    nand_reset (1'b1);
                end else begin
                    $sformat(msg,"Illegal synchronous reset command.  Device is not in synchronous operation.");
                    ERROR(ERR_CMD, msg);
                end
            end

            // ********************************************************
            // Command (FFh) : RESET (DURING BUSY)
            // ********************************************************
            else if (Io [7 : 0] === 8'hFF) begin
                cmnd_85h = 1'b0;
                saw_cmnd_00h = 1'b0;
                saw_cmnd_00h_stat = 1'b0;
                stat_to_rd_mode_c0h  =    1'b0;
                abort_en = 1'b0;
                if (DEBUG[3]) begin $sformat(msg, "Command Latched = %2hh", Io[7:0]); INFO(msg); end
                lastCmd = 8'hFF;
                nand_reset (1'b1);
            end            

            // ********************************************************
            // Command (??h) : UNSUPPORTED COMMAND (DURING BUSY)
            // ********************************************************
            else begin
		// else this is a non-status command during busy.
		// since this could be an interleaved die operation, tell this device
		//  to look at the upcoming address cycles to de-select the die if needed
                if (die_select) begin
		    if (Io[7:0] == 8'h30 || Io[7:0] == 8'h32 || Io[7:0] == 8'h35 || Io[7:0] == 8'h10 || Io[7:0] == 8'h11 || Io[7:0] == 8'h15 ||
			Io[7:0] == 8'hD0 || Io[7:0] == 8'hD1) begin
			$sformat(msg, "LUN is busy, and has received new %0hh command. New command will be ignored.", Io); ERROR(ERR_CMD, msg);
		    end
		    if ({Io[7:1], 1'b0} !== 8'h60 && {Io[7:1], 1'b0} !== 8'hD0)
			col_valid = 1'b0; // Do not reset for case of interleaved read and erase, read did not output data
		    row_valid = 1'b0;
		    if ({Io[7:1], 1'b0} === 8'h60)
			addr_start = COL_BYTES +1;
		    else
			addr_start = 1;
		    addr_stop = ADDR_BYTES;
		end
            end
        end // : cLatch_unbusy/busy_command
    end // : Cle_enable
end    // : cLatch




//-----------------------------------------------------------------
// Column Address Disable
//-----------------------------------------------------------------
always @ (posedge Clk_We_n) begin : ColAddrDisBlk
    if (Cle && ~Ale && ~Ce_n && Wr_Re_n && Io [7 : 0] === 8'h60)
        col_addr_dis <= 1'b1;  
    else if(Cle && ~Ale && ~Ce_n && Wr_Re_n && (Io [7 : 0] === 8'hD1 || Io [7 : 0] === 8'hD0))
        col_addr_dis <= 1'b0;  
    else if(Cle && ~Ale && ~Ce_n && Wr_Re_n && col_addr_dis && ~(Io [7 : 0] === 8'hD1 || Io [7 : 0] === 8'hD0)) begin
        col_addr_dis <= 1'b0;  
        $sformat(msg, "Error: Erase Block command terminated unexpectedly.");
    end
end

//-----------------------------------------------------------------
// Data input
//-----------------------------------------------------------------

    //  sync ops latch data using Dqs (Clk is not used) when Ale and Cle are high
    //  use delayed Cle and Ale in datain_sync enable because Dqs can transition after Cle and Ale low
    reg Ale_del;
    reg Cle_del;
    time Cle_del_event = 0;
    time Ale_del_event = 0;

    // rise time = tDQSS_sync_min
    always @(posedge Ale) begin
        if(Wr_Re_n) begin
            if ($time + tDQSS_sync_min > Ale_del_event) begin
                Ale_del <= #(tDQSS_sync_min) Ale;
                Ale_del_event <= $time + tDQSS_sync_min;
            end else begin
                Ale_del <= #(Ale_del_event - $time) Ale;
            end
        end 
    end

    // fall time = tDQSS_sync_max + tDQSH_sync_max
    always @(negedge Ale) begin
        if(Wr_Re_n) begin
            if ($time + tDQSS_sync_max + tDQSH_sync_max > Ale_del_event) begin
                Ale_del <= #(tDQSS_sync_max + tDQSH_sync_max) Ale;
                Ale_del_event <= $time + tDQSS_sync_max + tDQSH_sync_max;
            end else begin
                Ale_del <= #(Ale_del_event - $time) Ale;
            end
        end 
    end

    // rise time = tDQSS_sync_min
    always @(posedge Cle) begin
        if(Wr_Re_n) begin
            if ($time + tDQSS_sync_min > Cle_del_event) begin
                Cle_del <= #(tDQSS_sync_min) Cle;
                Cle_del_event <= $time + tDQSS_sync_min;
            end else begin
                Cle_del <= #(Cle_del_event - $time) Cle;
            end
        end 
    end

    // fall time = tDQSS_sync_max + tDQSH_sync_max
    always @(negedge Cle) begin
        if(Wr_Re_n) begin
            if ($time + tDQSS_sync_max + tDQSH_sync_max > Cle_del_event) begin
                Cle_del <= #(tDQSS_sync_max + tDQSH_sync_max) Cle;
                Cle_del_event <= $time + tDQSS_sync_max + tDQSH_sync_max;
            end else begin
                Cle_del <= #(Cle_del_event - $time) Cle;
            end
        end
    end

    assign datain_sync = Cle_del & Ale_del & ~Ce_n & Re_n & Rb_n_int & sync_mode & ~sync_enh_mode; // ??? remove CE# for new parts.

//async mode data input
assign datain_async = ~Cle & ~Ale & ~Ce_n & Re_n & Rb_n_int & ~sync_mode & ~sync_enh_mode;
always @(posedge We_n) begin
    if (datain_async)
    begin : latch_data_async
        //only async mode needs these two variables set for tADL calculation
        if (die_select && ~sync_mode && ~sync_enh_mode) begin
            we_adl_active <= 1'b1;
            tm_we_data_r <= $realtime;
        end
        if (lastCmd === 8'hEF) begin   // wp_N no effect
        //also need to recognize here that the SET FEATURES command will apply to all LUNs per chip-enable
            //Only allowed for ONFI devices
            case (col_counter)
                0:  begin
                        if((id_reg_addr == 8'h80) & DRIVESTR_EN[1]) 
                            onfi_features[8'h10][7:0]       = Io;  // for backwards compatability feature address 80h =10h
                        else                     
                            onfi_features[id_reg_addr][7:0] = Io;
                    end  //P1
                1:  begin
                        if ((id_reg_addr == 8'h02) || (id_reg_addr == 8'h60) || (id_reg_addr == 8'h91) || (id_reg_addr == 8'h92)) begin
                            onfi_features[id_reg_addr][15:8] = Io;
                        end else begin
                            onfi_features[id_reg_addr][15:8]  = 8'h00;
                        end
                    end  //P2
                2:  begin
                        // This is the only feature address that uses sub-parameter bytes 2 and 3
                        if (id_reg_addr == 8'h92) begin
                            onfi_features[id_reg_addr][23:16] = Io;
                        end else begin
                            onfi_features[id_reg_addr][23:16]  = 8'h00;
                        end
                    end  //P3
                3:  begin
                        // This is the only feature address that uses sub-parameter bytes 2 and 3
                        if (id_reg_addr == 8'h92) begin
                            onfi_features[id_reg_addr][31:24] = Io;
                        end else begin
                            onfi_features[id_reg_addr][31:24]  = 8'h00;
                        end
                        //now we store the data
			tWB_check_en = 1'b1;
                        go_busy(tWB_delay);
                        Rb_n_int = 1'b0;
                        status_register[6:5]=2'b00;
                        go_busy(tFEAT);
                        //now update the design based on the input features parameters
                        update_features(id_reg_addr);
                        status_register[6:5]<=2'b11;
                        Rb_n_int <=1'b1;
                    end  //P4
            endcase
            col_counter = col_counter + 1;
        end

        // non-nand mode[0] data input
        else if (die_select & ~nand_mode[0] & Wp_n & col_valid & row_valid) begin
            if((col_addr + col_counter) <= (NUM_COL - 1))  begin
                if (DEBUG[2]) begin
                    $sformat (msg, "Latch Data (%0h : %0h : %0h + %0h) = %0h",
                        row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS-1):0], col_addr, col_counter, Io);
                    INFO(msg);
                end
                // creates window of 1s, DQ BITS wide starting at the column address which I/O data will go in cache reg
                bit_mask = ({DQ_BITS{1'b1}} << ((((col_counter+col_addr)*BPC_MAX)+sub_col_cnt)*DQ_BITS)); // shifting left zero-fills

                //mask clears data/cache reg entry so can "or" in I/O data
                if (bypass_cache) begin 
                    data_reg[active_plane] = (data_reg[active_plane] & ~bit_mask) | ( Io << ((((col_counter+col_addr)*BPC_MAX)+sub_col_cnt)*DQ_BITS)) ;
                    `ifdef PACK
                        case (active_plane)
                        0 : data_reg_packed0 [col_addr + col_counter] = Io;
                        1 : data_reg_packed1 [col_addr + col_counter] = Io;
                        2 : data_reg_packed2 [col_addr + col_counter] = Io;
                        3 : data_reg_packed3 [col_addr + col_counter] = Io;
                        endcase             
                    `endif
                end else begin 
                    cache_reg[active_plane] = (cache_reg[active_plane] & ~bit_mask) | ( Io << ((((col_counter+col_addr)*BPC_MAX)+sub_col_cnt)*DQ_BITS));
                    `ifdef PACK
                        case (active_plane)
                        0 : cache_reg_packed0 [col_addr + col_counter] = Io;
                        1 : cache_reg_packed1 [col_addr + col_counter] = Io;
                        2 : cache_reg_packed2 [col_addr + col_counter] = Io;
                        3 : cache_reg_packed3 [col_addr + col_counter] = Io;
                        endcase             
                    `endif
                end
                col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt);
                sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;
            end else begin
                $sformat (msg, "Error Data Input Overflow block=%0h : page=%0h : column=%0h : column limit=%0h ",
                    row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS-1):0], (col_addr+col_counter), (NUM_COL - 1));  ERROR(ERR_ADDR,msg);
            end
        end else if (die_select & lastCmd === 8'hB8) begin   // wp_N no effect ???
            DriveStrength = (Io & 8'b00001100);
        end
    end // latch_data_async
end


    // sync mode data input
    always @(Dqs) begin
    // data input
        if (datain_sync || datain_sync_enh)
        begin : latch_data_sync
            //also need to recognize here that the SET FEATURES command will apply to all LUNs per chip-enable
            if (lastCmd === 8'hEF) begin
                //Only allowed for ONFI devices
                case (col_counter)
                0: begin
                    if((id_reg_addr == 8'h80) & DRIVESTR_EN[1]) 
                        onfi_features[8'h10][7:0]       = Io;
                    else                     
                        onfi_features[id_reg_addr][7:0] = Io;
                end //P1
                1: begin
                    if ((id_reg_addr == 8'h02) || (id_reg_addr == 8'h60) || (id_reg_addr == 8'h91) || (id_reg_addr == 8'h92))
                        onfi_features[id_reg_addr][15:8] = Io;
                    else 
                        onfi_features[id_reg_addr][15:8]  = 8'h00;
                   end  //P2
                2: begin
                    // This is the only feature address that uses sub-parameter bytes 2 and 3
                    if (id_reg_addr == 8'h92)
                        onfi_features[id_reg_addr][23:16] = Io;
                    else
                        onfi_features[id_reg_addr][23:16]  = 8'h00;
                   end  //P3
                3: begin
                    // This is the only feature address that uses sub-parameter bytes 2 and 3
                    if (id_reg_addr == 8'h92) begin
                        onfi_features[id_reg_addr][31:24] = Io;
                    end else begin
                        onfi_features[id_reg_addr][31:24]  = 8'h00;
                    end
                    //now we store the data
		    tWB_check_en = 1'b1;
                    go_busy(tWB_delay);
                    Rb_n_int = 1'b0;
                    status_register[6:5]=2'b00;
                    if ((id_reg_addr == 8'h01) && (sync_mode || sync_enh_mode))
                        wait_for_cen <= 1;
                    go_busy(tFEAT);
                    //now update the design based on the input features parameters
                    update_features(id_reg_addr);
                    status_register[6:5]<=2'b11;
                    Rb_n_int <=1'b1;
                end
                endcase
                if (~Dqs) //get/set features need same data on both Dqs edges
                    col_counter = col_counter + 1;
            end
            else if (die_select && col_valid && row_valid) begin
                if((col_addr + col_counter) <= (NUM_COL - 1)) begin
                    if (DEBUG[2]) begin
                        $sformat (msg, "Latch Data (%0h : %0h : %0h + %0h) = %0h",
                            row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS -1) : 0], col_addr, col_counter, Io);
                        INFO(msg);
                    end

                    // Data Register
                    if (bypass_cache) begin
                        bit_mask = ({DQ_BITS{1'b1}} << ((((col_counter+col_addr)*BPC_MAX)+sub_col_cnt)*DQ_BITS)); // shifting left zero-fills
                        //mask clears cache reg entry so can or in I/O data
                        data_reg[active_plane] = (data_reg[active_plane] & ~bit_mask) | ( Io << ((((col_counter+col_addr)*BPC_MAX)+sub_col_cnt)*DQ_BITS)) ; // ???
			`ifdef PACK
                        case (active_plane)
                            0 : data_reg_packed0 [col_addr + col_counter] = Io;
                            1 : data_reg_packed1 [col_addr + col_counter] = Io;
                            2 : data_reg_packed2 [col_addr + col_counter] = Io;
                            3 : data_reg_packed3 [col_addr + col_counter] = Io;
                        endcase             
                        `endif
                    end else begin
                        // creates window of 1s, DQ BITS wide starting at the column address which I/O data will go in cache reg
                        bit_mask = ({DQ_BITS{1'b1}} << ((((col_counter+col_addr) * BPC_MAX) +sub_col_cnt) * DQ_BITS)); // shifting left zero-fills
                         //mask clears cache reg entry so can or in I/O data
                        cache_reg[active_plane] = (cache_reg[active_plane] & ~bit_mask) | (Io<<((((col_counter+col_addr) * BPC_MAX) +sub_col_cnt)*DQ_BITS));
                        `ifdef PACK
                         case (active_plane)
                         0 : case (sub_col_cnt)
                            2'b00 : cache_reg_packed0 [col_addr + col_counter][(0*DQ_BITS)+(DQ_BITS-1): 0*DQ_BITS] = Io;
                            2'b01 : cache_reg_packed0 [col_addr + col_counter][(1*DQ_BITS)+(DQ_BITS-1): 1*DQ_BITS] = Io;
                            2'b10 : cache_reg_packed0 [col_addr + col_counter][(2*DQ_BITS)+(DQ_BITS-1): 2*DQ_BITS] = Io;
                            2'b11 : cache_reg_packed0 [col_addr + col_counter][(3*DQ_BITS)+(DQ_BITS-1): 3*DQ_BITS] = Io;
                            endcase
                         1 : case (sub_col_cnt)
                            2'b00 : cache_reg_packed1 [col_addr + col_counter][(0*DQ_BITS)+(DQ_BITS-1): 0*DQ_BITS] = Io;
                            2'b01 : cache_reg_packed1 [col_addr + col_counter][(1*DQ_BITS)+(DQ_BITS-1): 1*DQ_BITS] = Io;
                            2'b10 : cache_reg_packed1 [col_addr + col_counter][(2*DQ_BITS)+(DQ_BITS-1): 2*DQ_BITS] = Io;
                            2'b11 : cache_reg_packed1 [col_addr + col_counter][(3*DQ_BITS)+(DQ_BITS-1): 3*DQ_BITS] = Io;
                            endcase 
                         2 : case (sub_col_cnt)
                            2'b00 : cache_reg_packed2 [col_addr + col_counter][(0*DQ_BITS)+(DQ_BITS-1): 0*DQ_BITS] = Io;
                            2'b01 : cache_reg_packed2 [col_addr + col_counter][(1*DQ_BITS)+(DQ_BITS-1): 1*DQ_BITS] = Io;
                            2'b10 : cache_reg_packed2 [col_addr + col_counter][(2*DQ_BITS)+(DQ_BITS-1): 2*DQ_BITS] = Io;
                            2'b11 : cache_reg_packed2 [col_addr + col_counter][(3*DQ_BITS)+(DQ_BITS-1): 3*DQ_BITS] = Io;
                            endcase 
                         3 : case (sub_col_cnt)
                            2'b00 : cache_reg_packed3 [col_addr + col_counter][(0*DQ_BITS)+(DQ_BITS-1): 0*DQ_BITS] = Io;
                            2'b01 : cache_reg_packed3 [col_addr + col_counter][(1*DQ_BITS)+(DQ_BITS-1): 1*DQ_BITS] = Io;
                            2'b10 : cache_reg_packed3 [col_addr + col_counter][(2*DQ_BITS)+(DQ_BITS-1): 2*DQ_BITS] = Io;
                            2'b11 : cache_reg_packed3 [col_addr + col_counter][(3*DQ_BITS)+(DQ_BITS-1): 3*DQ_BITS] = Io;
                            endcase 
                         endcase             
                        `endif
                    end 
                    col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt);
                    sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;

                end else if (die_select && lastCmd === 8'hB8) begin
                    DriveStrength = (Io & 8'b00001100);
                end else begin
                    $sformat (msg, "Error Data Input Overflow block=%0h : page=%0h : column=%0h : column limit=%0h ",
                        row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS-1):0], (col_addr+col_counter), (NUM_COL - 1));  ERROR(ERR_ADDR,msg);
                end        
            end
        end // latch_data_sync
    end


always @(MLC_SLC)
begin
    sub_col_cnt_init =  {2{ 1'b0  }} ;
    sub_col_cnt = 0;  // reset sub col count
end

//-----------------------------------------------------------------
// Data output
//-----------------------------------------------------------------
always @(Clk) begin
    //#############################
    // SYNC MODE OUTPUT
    //#############################
    if (sync_mode) begin
	//check to see if last posedge Clk had Cle and Ale high, so we'll still output data after tDQSCK from negedge clock
	//  regardless if Ale and Cle have already gone low when negedge Clk occurs
	if (Clk)    sync_output_active = (sync_mode && Cle && Ale && ~Ce_n && die_select && ~Wr_n);
	data_out_sync_enh_and_sync;
    end
end

task data_out_sync_enh_and_sync;
    begin
        //Sync Mode status output
        if ((sync_output_active || data_out_enable_sync_enh) && status_cmnd) begin
            output_status;
        end else begin
            if (((sync_output_active && (Clk || (~Clk && saw_posedge_dqs))) || data_out_enable_sync_enh) && (Rb_n_int === 1'b1)) begin : not_busy_sync
                //Read ID2 and Read Unique take precedence.  Only way out is reset or power up/down
                //-----------------
                if (do_read_id_2) begin
                    //-----------------
                    //Read ID2
                    //-----------------
                    if (DEBUG[0]) begin $sformat(msg, "Sync Mode : ReadID2 (%0d)", col_counter); INFO(msg); end
                        sync_output_data(rd_uid_id2_array[col_counter]);

                        col_counter = col_counter + 1;

                end else if (do_read_unique) begin
                    //-----------------
                    //Read Unique
                    //-----------------
                    if (DEBUG[0]) begin $sformat(msg, "ReadUnique (%0h)=%h", col_addr+col_counter, rd_uid_id2_array[col_addr+col_counter]); INFO(msg); end
                      sync_output_data(rd_uid_id2_array[col_addr+col_counter]);

                    col_counter = col_counter + 1;
                end else if (lastCmd === 8'hEE) begin
                    //-----------------
                    //Read Features
                    //-----------------
                    case (col_counter)
                        0,1     : begin
                            if((id_reg_addr == 8'h80) & DRIVESTR_EN[1]) data = onfi_features[8'h10][07:00];
                            else                                        data = onfi_features[id_reg_addr][07:00];
                        end 
                        2,3     : data = onfi_features[id_reg_addr][15:08];
                        4,5     : data = onfi_features[id_reg_addr][23:16];
                        6,7     : data = onfi_features[id_reg_addr][31:24];
                        default : data = 8'h00;
                    endcase

                    sync_output_data(data);
                    col_counter = col_counter + 1;

                //-----------------
                // Normal Page Read
                //-----------------
                end else if ((lastCmd !== 8'h7A) && col_valid && row_valid && ((col_addr + col_counter) <= (NUM_COL - 1))) begin
                    // Data Buffer
                    if(lastCmd == 8'hEC) begin
                        if(bypass_cache) begin
                            data_out_reg[07:00] = data_reg[active_plane]  >> ((((col_counter+col_addr))) * 8) ;
                            `ifdef x16
                                data_out_reg[DQ_BITS-1:08] = 8'h00;
                            `endif
                        end else begin
                            data_out_reg[07:00] = cache_reg[active_plane] >> ((((col_counter+col_addr))) * 8) ;
                            `ifdef x16
                                data_out_reg[DQ_BITS-1:08] = 8'h00;
                            `endif
                        end
                        sync_output_data (data_out_reg);

                        if (DEBUG[2]) begin  $sformat(msg, "Data Read (%0h : %0h : %0h + %0h) = %0h", row_addr[active_plane][(ROW_BITS -1) : (PAGE_BITS)], row_addr[active_plane][(PAGE_BITS -1) : 0], col_addr, col_counter, data_out_reg); INFO(msg);  end
                        col_counter = fn_inc_col_counter(col_counter, MLC_SLC, 3'b001, sub_col_cnt)  ;
                        sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, 3'b001, sub_col_cnt_init) ;
                    end else begin
                        if(bypass_cache) begin
                            data_out_reg = data_reg[active_plane]  >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS) ;
			end
                        else
                            data_out_reg = cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS) ;
                
                        sync_output_data (data_out_reg);

                        if (DEBUG[2]) begin  $sformat(msg, "Data Read (%0h : %0h : %0h + %0h) = %0h", row_addr[active_plane][(ROW_BITS -1) : (PAGE_BITS)], row_addr[active_plane][(PAGE_BITS -1) : 0], col_addr, col_counter, data_out_reg); INFO(msg);  end
                        col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt)  ;
                        sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;
                    end
                //-----------------
                //some designs support reading out of cache register right after read for internal data move
                //-----------------
                end else if (~col_valid && ~row_valid && (lastCmd === 8'h35)) begin
                    // use cache mode timing
                    data_out_reg = cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS) ;
                    sync_output_data(data_out_reg);

                    col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt)  ;
                    sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;

                //-----------------
                // extra case to drive data bus high z after column boundary is reached
                //-----------------
                end else if (~status_cmnd && col_valid && row_valid && ((col_addr + col_counter) > (NUM_COL - 1))) begin                
                    rd_out <= #(tDQSCK_sync_max) 1'b0;

                end else if (lastCmd === 8'h7A) begin
                    //-----------------
                    //Lock Status Read
                    //-----------------
                    if (DEBUG[0]) begin $sformat(msg, "BLOCK LOCK READ STATUS\n"); INFO(msg); end
                    if (~ALLOWLOCKCOMMAND) begin
                        // device was not locked on startup, cannot be locked later
                        sync_output_data (8'h06);
                        if (DEBUG[0]) begin $sformat(msg, "Lock Status Read=%0hh at address  %0h", 8'h06, row_addr[active_plane][ROW_BITS-1:PAGE_BITS] ); INFO(msg); end
                    end else begin
                        if ((UnlockAddrLower <= row_addr[active_plane]) && (row_addr[active_plane] <= UnlockAddrUpper)) begin
                            sync_output_data ({{(DQ_BITS-3){1'b0}}, ~LockInvert, ~LOCKTIGHT, LOCKTIGHT});
                            if (DEBUG[0]) begin 
                                $sformat(msg, "Lock Status Read=%0hh at address  %0h", {{(DQ_BITS-3){1'b0}}, ~LockInvert, ~LOCKTIGHT, LOCKTIGHT}, row_addr[active_plane] ); 
                                INFO(msg); 
                            end
                        end else begin
                            sync_output_data ({{(DQ_BITS-3){1'b0}}, LockInvert, ~LOCKTIGHT, LOCKTIGHT});
                            if (DEBUG[0]) begin
                                $sformat(msg, "Lock Status Read=%0hh at address  %0h", {{(DQ_BITS-3){1'b0}}, LockInvert, ~LOCKTIGHT, LOCKTIGHT}, row_addr[active_plane] );
                                INFO(msg);
                            end
                        end
                    end

                end else if (lastCmd === 8'hB8) begin
                    //-----------------
                    //Read DriveStrength
                    //-----------------
                    sync_output_data(DriveStrength);
                    if (DEBUG[0]) begin $sformat(msg, "DriveStrength=%0h", DriveStrength); INFO(msg); end
                
                end else if (lastCmd === 8'h90) begin    
                    if (id_reg_addr === 8'h00) begin : regular_id_read
                        //-----------------
                        //Read ID
                        //-----------------
                        // Reset Counter
                        if (col_counter > ((2*NUM_ID_BYTES) - 1))   col_counter = 0;
            
                        case (col_counter)
                            0,1 : data = READ_ID_BYTE0;
                            2,3 : data = READ_ID_BYTE1;
                            4,5 : data = READ_ID_BYTE2;
                            6,7 : data = READ_ID_BYTE3;
                            8,9 : data = READ_ID_BYTE4;
			    `ifdef IDBYTESGT5
                            10,11 : data = READ_ID_BYTE5;
                            12,13 : data = READ_ID_BYTE6;
                            14,15 : data = READ_ID_BYTE7;
			    `endif
                        endcase

                        sync_output_data(data);
                        if (DEBUG[0]) begin $sformat(msg, "Read ID (%0h)", col_counter); INFO(msg); end
                        
                        col_counter = col_counter + 1'b1;

                    end else if ((id_reg_addr === 8'h20) && (FEATURE_SET[CMD_ONFI])) begin : onfi_id_read
                        //-----------------
                        //Read ONFI ID
                        //-----------------
                        case (col_counter)
                            0,1     : data = 8'h4F; //'O'
                            2,3     : data = 8'h4E; //'N'
                            4,5     : data = 8'h46; //'F'
                            6,7     : data = 8'h49; //'I'
                            default : begin
                               $sformat(msg, "ONFI read beyond 4 bytes is indeterminate.");
                               ERROR(ERR_MISC, msg);
                               data = {DQ_BITS{1'bx}};
                            end
                        endcase
                        sync_output_data(data);
                        if (DEBUG[0]) begin $sformat(msg, "ONFI Read ID (%0h)", col_counter); INFO(msg); end
                        col_counter = col_counter + 1;
                    end else if ((id_reg_addr === 8'h40) && (FEATURE_SET2[CMD_JEDEC])) begin
                        //-----------------
                        //Read JEDEC ID
                        //-----------------
                        case (col_counter)
                            0,1     : data = 8'h4A; //'J'
                            2,3     : data = 8'h45; //'E'
                            4,5     : data = 8'h44; //'D'
                            6,7     : data = 8'h45; //'E'
                            8,9     : data = 8'h43; //'C'
                            10,11   : data = 8'h05; // sync mode
                            default : begin
                               $sformat(msg, "JEDEC read beyond 6 bytes is indeterminate.");
                               ERROR(ERR_MISC, msg);
                               data = {DQ_BITS{1'bx}};
                            end
                        endcase
                        sync_output_data(data);
                        if (DEBUG[0]) begin $sformat(msg, "JEDEC Read ID (%0h)", col_counter); INFO(msg); end
                        col_counter = col_counter + 1;
                    end // id_read
                end else if ((lastCmd === 8'hFF) | (lastCmd === 8'hFC) | (lastCmd === 8'hFA)) begin
                    rd_out <= #tAC_sync_max 1'b0;
                    $sformat(msg, "data invalidated by reset");
                    WARN(msg);
                end else begin             
                    //-----------------
                    //No valid data 
                    //-----------------
                    // If we get here, bad read -- out of bounds or unknown
                    rd_out <= #tAC_sync_max 1'b0;
                    $sformat(msg, "DATA NOT Transfered on Re_n");
                    ERROR(ERR_MISC, msg);
                end
            end else begin  //not_busy block : else (if busy)
                //this will output zz's if Re_n is toggled during busy with a status command
                if (~status_cmnd)    rd_out <= #tAC_sync_max 1'b0;
            end // : not_busy
        end
    end

endtask

assign data_out_enable_async = (~sync_mode && ~sync_enh_mode && ~Cle && ~Ale && ~Ce_n && We_n && die_select);
always @ (negedge Re_n) begin
    //#############################
    // ASYNC MODE OUTPUT
    //#############################
    //Async Mode status output 
    if(data_out_enable_async && status_cmnd) begin
    // 70h only works on the last addressed die
        output_status;
    end else begin
    //only need to go here if not a status reg read
    if (die_select && ~sync_mode && ~sync_enh_mode) begin : rd_die_select
        if (data_out_enable_async && (Rb_n_int === 1'b1)) begin : not_busy
            //Read ID2 and Read Unique take precedence.  Only way out is reset or power up/down
            //-----------------
            if (do_read_id_2) begin
                //-----------------
                //Read ID2
                //-----------------
                if (DEBUG[0]) begin $sformat(msg, "ReadID2 (%0d)", col_counter); INFO(msg); end
                    Io_buf <= #tREA_max rd_uid_id2_array[col_counter];
                    rd_out <= #tREA_max 1'b1;

                    col_counter = col_counter + 1;

            end else if (do_read_unique) begin
                //-----------------
                //Read Unique
                //-----------------
                if (DEBUG[0]) begin $sformat(msg, "ReadUnique (%0h)=%h", col_addr+col_counter, rd_uid_id2_array[col_addr+col_counter]); INFO(msg); end
                Io_buf <= #tREA_max rd_uid_id2_array[col_addr+col_counter];
                rd_out <= #tREA_max 1'b1;

                col_counter = col_counter + 1;
            end else if (lastCmd === 8'hEE) begin
                //-----------------
                //Read Features
                //-----------------
                case (col_counter)
                    0       : begin
                            if((id_reg_addr == 8'h80) & DRIVESTR_EN[1]) data = onfi_features[8'h10][07:00];
                            else                                        data = onfi_features[id_reg_addr][07:00];
                    end 
                    1       : data = onfi_features[id_reg_addr][15:08];
                    2       : data = onfi_features[id_reg_addr][23:16];
                    3       : data = onfi_features[id_reg_addr][31:24];
                    default : data = 8'h00;
                endcase

                if (tCEA_max - tREA_max < $realtime - tm_ce_n_f) begin
                    //negedge is far enough away from negedge Ce_n, use tREA
                    Io_buf <= #(tREA_max) data;
                    rd_out <= #(tREA_max) 1'b1;
                end else begin
                    //negedge Re_n close to negedge Ce_n, use tCEA
                    Io_buf <= #(tm_ce_n_f + tCEA_max - $realtime) data;
                    rd_out <= #(tm_ce_n_f + tCEA_max - $realtime) 1'b1;
                end
                col_counter = col_counter + 1;

            //-----------------
            // Normal Page Read
            //-----------------
            end else if (~nand_mode[0] && (lastCmd !== 8'h7A) && col_valid && row_valid && ((col_addr + col_counter) <= (NUM_COL - 1))) begin
                // Data Buffer
                // determine whether CE access time or RE access time dominates
                if(lastCmd == 8'hEC) begin
                    if (tCEA_max - tREA_max < $realtime - tm_ce_n_f) begin
                        //negedge is far enough away from negedge Ce_n, use tREA
                        if (DEBUG[2]) begin $sformat(msg, "Using tREA timing"); INFO(msg); end
                        `ifdef x16
                            Io_buf[07:00] <= #(tREA_max) cache_reg[active_plane] >> ((col_counter+col_addr)*8);
                            Io_buf[15:08] <= #(tREA_max) 8'h00;
                        `else
                            Io_buf <= #(tREA_max) cache_reg[active_plane] >> ((col_counter+col_addr)*DQ_BITS);
                        `endif
                        rd_out <= #(tREA_max) 1'b1;
                    end else begin
                        //negedge Re_n close to negedge Ce_n, use tCEA
                        if (DEBUG[2]) begin $sformat(msg, "Using tCEA timing"); INFO(msg); end
                        `ifdef x16
                            Io_buf[07:00] <= #(tm_ce_n_f + tCEA_max - $realtime) cache_reg[active_plane] >> ((col_counter+col_addr)*8);
                            Io_buf[15:08] <= #(tm_ce_n_f + tCEA_max - $realtime) 8'h00;
                        `else
                            Io_buf <= #(tm_ce_n_f + tCEA_max - $realtime) cache_reg[active_plane] >> ((col_counter+col_addr)*DQ_BITS);
                        `endif
                        rd_out <= #(tm_ce_n_f + tCEA_max - $realtime) 1'b1;
                    end
                    if (DEBUG[2]) begin $sformat(msg, "Data Read (%0h : %0h : %0h + %0h) = %0h", row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS-1):0], col_addr, col_counter, cache_reg[active_plane] [(col_addr + col_counter)*DQ_BITS+:DQ_BITS]); INFO(msg); end
                    col_counter = fn_inc_col_counter(col_counter, MLC_SLC, 3'b001, sub_col_cnt)  ;
                    sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, 3'b001, sub_col_cnt_init) ;
                end else if (cache_op === 1) begin
                // use cache mode timing
                    if (tCEA_cache_max - tREA_cache_max < $realtime - tm_ce_n_f) begin
                        //negedge is far enough away from negedge Ce_n, use tREA
                        if (DEBUG[2]) begin $sformat(msg, "Using tREA cache timing"); INFO(msg); end
                        Io_buf <= #(tREA_cache_max) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                        rd_out <= #(tREA_cache_max) 1'b1;
                    end else begin
                        //negedge Re_n close to negedge Ce_n, use tCEA
                        if (DEBUG[2]) begin $sformat(msg, "Using tCEA cache timing"); INFO(msg); end
                        Io_buf <= #(tm_ce_n_f + tCEA_cache_max - $realtime) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                        rd_out <= #(tm_ce_n_f + tCEA_cache_max - $realtime) 1'b1;
                    end
                    if (DEBUG[2]) begin $sformat(msg, "Data Read (%0h : %0h : %0h + %0h) = %0h", row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS-1):0], col_addr, col_counter, cache_reg[active_plane] [(col_addr + col_counter)*DQ_BITS+:DQ_BITS]); INFO(msg); end
                    col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt)  ;
                    sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;
                end else begin
                    //regular read, no cache mode
                    if (tCEA_max - tREA_max < $realtime - tm_ce_n_f) begin
                        //negedge is far enough away from negedge Ce_n, use tREA
                        if (DEBUG[2]) begin $sformat(msg, "Using tREA timing"); INFO(msg); end
                        Io_buf <= #(tREA_max) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                        rd_out <= #(tREA_max) 1'b1;
                    end else begin
                        //negedge Re_n close to negedge Ce_n, use tCEA
                        if (DEBUG[2]) begin $sformat(msg, "Using tCEA timing"); INFO(msg); end
                        Io_buf <= #(tm_ce_n_f + tCEA_max - $realtime) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                        rd_out <= #(tm_ce_n_f + tCEA_max - $realtime) 1'b1;
                    end
                    if (DEBUG[2]) begin $sformat(msg, "Data Read (%0h : %0h : %0h + %0h) = %0h", row_addr[active_plane][(ROW_BITS-1):(PAGE_BITS)], row_addr[active_plane][(PAGE_BITS-1):0], col_addr, col_counter, cache_reg[active_plane] [(col_addr + col_counter)*DQ_BITS+:DQ_BITS]); INFO(msg); end
                    col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt)  ;
                    sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;
                end
   


            //-----------------
            //some designs support reading out of cache register right after read for internal data move
            //-----------------
            end else if (~col_valid && ~row_valid && (lastCmd === 8'h35)) begin
                // use cache mode timing
                if (tCEA_cache_max - tREA_cache_max < $realtime - tm_ce_n_f) begin
                    //negedge is far enough away from negedge Ce_n, use tREA
                    if (DEBUG[2]) begin $sformat(msg, "Using tREA cache timing"); INFO(msg); end
                    Io_buf <= #(tREA_cache_max) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                    rd_out <= #(tREA_cache_max) 1'b1;
                end else begin
                    //negedge Re_n close to negedge Ce_n, use tCEA
                    if (DEBUG[2]) begin $sformat(msg, "Using tCEA cache timing"); INFO(msg); end
                    Io_buf <= #(tm_ce_n_f + tCEA_cache_max - $realtime) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                    rd_out <= #(tm_ce_n_f + tCEA_cache_max - $realtime) 1'b1;
                end
                col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt)  ;
                sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;

            //-----------------
            // extra case to drive data bus high z after column boundary is reached
            //-----------------
            end else if (~status_cmnd && col_valid && row_valid && ((col_addr + col_counter) > (NUM_COL - 1))) begin                
                rd_out <= #(tREA_max) 1'b0;

            end else if (lastCmd === 8'h7A) begin
                //-----------------
                //Lock Status Read
                //-----------------
                if (DEBUG[0]) begin $sformat(msg, "BLOCK LOCK READ STATUS\n"); INFO(msg); end
                if (~ALLOWLOCKCOMMAND) begin
                    // device was not locked on startup, cannot be locked later
                    Io_buf <= #(tREA_max) 8'h06;
                    rd_out <= #(tREA_max) 1'b1;
                       if (DEBUG[0]) begin $sformat(msg, "Lock Status Read=%0hh at address  %0h", 8'h06, row_addr[active_plane][ROW_BITS-1:PAGE_BITS] ); INFO(msg); end
                end else begin
                    rd_out <= #(tREA_max) 1'b1;
                    if ((UnlockAddrLower <= row_addr[active_plane]) && (row_addr[active_plane] <= UnlockAddrUpper)) begin
                        Io_buf <= #(tREA_max) {{(DQ_BITS-3){1'b0}}, ~LockInvert, ~LOCKTIGHT, LOCKTIGHT};
                        if (DEBUG[0]) begin 
                            $sformat(msg, "Lock Status Read=%0hh at address  %0h", {{(DQ_BITS-3){1'b0}}, ~LockInvert, ~LOCKTIGHT, LOCKTIGHT}, row_addr[active_plane] ); 
                            INFO(msg); 
                        end
                    end else begin
                        Io_buf <= #(tREA_max) {{(DQ_BITS-3){1'b0}}, LockInvert, ~LOCKTIGHT, LOCKTIGHT};
                        if (DEBUG[0]) begin
                            $sformat(msg, "Lock Status Read=%0hh at address  %0h", {{(DQ_BITS-3){1'b0}}, LockInvert, ~LOCKTIGHT, LOCKTIGHT}, row_addr[active_plane] );
                            INFO(msg);
                        end
                    end
                end

            end else if (lastCmd === 8'hB8) begin
                //-----------------
                //Read DriveStrength
                //-----------------
                Io_buf <= #tREAIO_max DriveStrength;
                rd_out <= #tREAIO_max 1'b1;
                if (DEBUG[0]) begin $sformat(msg, "DriveStrength=%0h", DriveStrength); INFO(msg); end
                
            end else if (lastCmd === 8'h90) begin    
                if (id_reg_addr === 8'h00) begin : regular_id_read
                    //-----------------
                    //Read ID
                    //-----------------
                    // Reset Counter
                    if (col_counter > (NUM_ID_BYTES - 1)) begin
                        col_counter = 0;
                       end
                    case (col_counter)
                        0 : Io_buf <= #(tREA_max) READ_ID_BYTE0;
                        1 : Io_buf <= #(tREA_max) READ_ID_BYTE1;
                        2 : Io_buf <= #(tREA_max) READ_ID_BYTE2;
                        3 : Io_buf <= #(tREA_max) READ_ID_BYTE3;
                        4 : Io_buf <= #(tREA_max) READ_ID_BYTE4;
			`ifdef IDBYTESGT5
                        5 : Io_buf <= #(tREA_max) READ_ID_BYTE5;
                        6 : Io_buf <= #(tREA_max) READ_ID_BYTE6;
                        7 : Io_buf <= #(tREA_max) READ_ID_BYTE7;
			`endif
                    endcase
                    rd_out <= #(tREA_max) 1'b1;    
                    if (DEBUG[0]) begin $sformat(msg, "Read ID (%0h)", col_counter); INFO(msg); end

                    col_counter = col_counter + 1;

                end else if ((id_reg_addr === 8'h20) && (FEATURE_SET[CMD_ONFI])) begin : onfi_id_read
                    //-----------------
                    //Read ONFI ID
                    //-----------------
                       // Reset Counter
                    if (col_counter > 3) begin
                           $sformat(msg, "ONFI read beyond 4 bytes is indeterminate.");
                           ERROR(ERR_MISC, msg);
                           IoX_enable <= #(tREA_max) 1'b1;
                           rd_out <= #(tREA_max) 1'b0;
                    end else begin
                           rd_out <= #(tREA_max) 1'b1 ;
		    end
            
                    case (col_counter)
                        0 : Io_buf <= #(tREA_max) 8'h4F; //'O'
                        1 : Io_buf <= #(tREA_max) 8'h4E; //'N'
                        2 : Io_buf <= #(tREA_max) 8'h46; //'F'
                        3 : Io_buf <= #(tREA_max) 8'h49; //'I'
                    endcase
    
                    if (DEBUG[0]) begin $sformat(msg, "ONFI Read ID (%0h)", col_counter); INFO(msg); end
                    col_counter = col_counter + 1;
                end else if ((id_reg_addr === 8'h40) && (FEATURE_SET2[CMD_JEDEC])) begin
                    //-----------------
                    //Read JEDEC ID
                    //-----------------
                    if (col_counter > 5) begin
                           $sformat(msg, "JEDEC read beyond 6 bytes is indeterminate.");
                           ERROR(ERR_MISC, msg);
                           IoX_enable <= #(tREA_max) 1'b1;
                           rd_out <= #(tREA_max) 1'b0;
                    end else begin
                            rd_out <= #(tREA_max) 1'b1 ;
		    end
            
                    case (col_counter)
                        0 : Io_buf <= #(tREA_max) 8'h4A; //'J'
                        1 : Io_buf <= #(tREA_max) 8'h45; //'E'
                        2 : Io_buf <= #(tREA_max) 8'h44; //'D'
                        3 : Io_buf <= #(tREA_max) 8'h45; //'E'
                        4 : Io_buf <= #(tREA_max) 8'h43; //'C'
                        5 : Io_buf <= #(tREA_max) 8'h01; // async mode
                    endcase
    
                    if (DEBUG[0]) begin $sformat(msg, "JEDEC Read ID (%0h)", col_counter); INFO(msg); end
                    col_counter = col_counter + 1;
                end // id_read
            end else if (Pre) begin
                //----------------------
                //Power-On Preload read
                //----------------------
                //if none of the above is true, check for pre-load read on devices that support it
                rd_out <= #(tREA_max) 1'b1;
                Io_buf <= #(tREA_max) cache_reg[active_plane] >> ((((col_counter+col_addr) * BPC_MAX) + sub_col_cnt) * DQ_BITS);
                col_counter = fn_inc_col_counter(col_counter, MLC_SLC, BPC, sub_col_cnt)  ;
                sub_col_cnt = fn_sub_col_cnt(sub_col_cnt, MLC_SLC, BPC, sub_col_cnt_init) ;
            end else if ((lastCmd === 8'hFF) | (lastCmd === 8'hFC) | (lastCmd === 8'hFA)) begin
                rd_out <= #(tREA_max) 1'b0;
                $sformat(msg, "data invalidated by reset");
                WARN(msg);
            end else begin             
                //-----------------
                //No valid data 
                //-----------------
                // If we get here, bad read -- out of bounds or unknown
                rd_out <= #(tREA_max) 1'b0;
                $sformat(msg, "DATA NOT Transfered on Re_n");
                ERROR(ERR_MISC, msg);
            end
        end else begin  //not_busy block : else (if busy)
            //this will output zz's if Re_n is toggled during busy with a status command
            if (~status_cmnd)    rd_out <= #(tREA_max) 1'b0;

        end // : not_busy
    end end// : rd_die_select
end


//#####################################################
// Tri - stating the IO bus
//
//  This section control the tri-stating of the IO
//  bus based on when Re_n and Ce_n transition.
//#####################################################

//---------------------------
//  Re_n->IO transitions
//---------------------------

// disable IO output on posedge Re_n or Ce_n 
always @ (posedge Re_n) begin
    //posedge Re_n with Ce_n low
    if (data_out_enable_async && Re_n) begin
        //schedule these transitions
        IoX_enable <= #(tRHOH_min) 1'b1;
        IoX_enable <= #(tRHZ_max-1) 1'b1;
        IoX_enable <= #(tRHZ_max) 1'b0;
        rd_out <= #tRHOH_min 1'b0;     
        t_readtox = ($realtime + tRHOH_min);
        t_readtoz = ($realtime + tRHZ_max);
    end
end

`ifdef EDO
    always @ (negedge Re_n) begin
        //negedge Re_n in devices that support EDO read mode utilizes tRLOH_min
        if (data_out_enable_async && ~Re_n && edo_mode) begin
            if (($realtime + tRLOH_min) > (tm_re_n_r + tRHOH_min)) begin
                IoX <= #(tRLOH_min) 1'b1;
                IoX <= #(tRHZ_max) 1'b0;
                rd_out <= #(tRLOH_min) 1'b0;
                t_readtox = ($realtime + tRLOH_min);
                t_readtoz = ($realtime + tRHZ_max);
            end
        end
    end
`endif
  
//---------------------------
//  Ce_n->IO transitions
//---------------------------

// reschedule these transitions for special timing cases
always @ (posedge Ce_n) begin
if(~sync_mode && ~sync_enh_mode) begin
    //----------------------------------
    //posedge Ce_n with Re_n already low 
    //----------------------------------
    // (if Ce_n->high and Re_n->low switch at same time, ignore this)
    if (~Cle && ~Ale && ~Re_n && We_n && (tm_re_n_f != $realtime) && (tm_re_n_f != 0)) begin
        if (DEBUG[2]) $display("tm_re_n_f=%0t, realtime=%0t, cen=%0d, ren=%0d", tm_re_n_f, $realtime, Ce_n, Re_n);
        //schedule these transitions
        IoX_enable  <= #(tCOH_min) 1'b1;
        if (cache_op) begin
            IoX_enable  <= #(tCHZ_cache_max) 1'b0;
            t_readtoz <= ($realtime + tCHZ_cache_max);
        end else begin
            IoX_enable  <= #(tCHZ_max) 1'b0;
            t_readtoz <= ($realtime + tCHZ_max);
        end
        t_readtox <= ($realtime + tCOH_min);
        rd_out <= #tCOH_min 1'b0;
    end else
    //----------------------------------
     //posedge Ce_n and posedge Re_n at same time
    //----------------------------------
    if (~Cle && ~Ale && Re_n && We_n && rd_out) begin
        if (tm_re_n_f > t_readtoz) begin
             //This can only happen when Ce_n and Re_n go high at the same time
             // therefore this part is needed since we can't say whether the posedge Re_n
             // always block or this code will be executed first.

            //last rising edge of Re_n is more than tRHZ_max away from this edge
            // therefore Ce timing dominates
            IoX_enable <= #(tCOH_min) 1'b1;
            if (cache_op) begin
                IoX_enable  <= #(tCHZ_cache_max) 1'b0;
                t_readtoz <= ($realtime + tCHZ_cache_max);
            end else begin
                IoX_enable  <= #(tCHZ_max) 1'b0;
                t_readtoz <= ($realtime + tCHZ_max);
            end
            rd_out <= #tCOH_min 1'b0;
            t_readtox <= ($realtime + tCOH_min);
        end else begin
          //else Re_n is high and the Re_n based Io transitions were already
          //scheduled.  So here we check to see whether Ce_n based Io transitions
          //are more critical than Re_n based transitions already scheduled during
          // this timestamp.
            if (($realtime + tCOH_min) < t_readtox) begin
                IoX_enable <= #(tCOH_min) 1'b1;
                rd_out <= #tCOH_min 1'b0;
                t_readtox <= $realtime + tCOH_min;
            end
            if (cache_op) begin
                if (($realtime + tCHZ_cache_max) < t_readtoz) begin
                    t_readtoz <= $realtime + tCHZ_cache_max;
                    // need this part to ensure that IoX_enable transitions from 1->0 so
                    // the always block below will catch it and disable X's
		    IoX_enable <= #(tCHZ_cache_max -1) 1'b1;
                    IoX_enable <= #(tCHZ_cache_max) 1'b0; 
                end
            end else begin
                if (($realtime + tCHZ_max) < t_readtoz) begin
                    t_readtoz <= $realtime + tCHZ_max;
                    // need this part to ensure that IoX_enable transitions from 1->0 so
                    // the always block below will catch it and disable X's
		    IoX_enable <= #(tCHZ_max -1) 1'b1;
                    IoX_enable <= #(tCHZ_max) 1'b0; 
                end
            end
        end
    end else begin
        //default case for Ce_n going high during Io==X's, disable Io if not high-z
        if (Io_wire !== {DQ_BITS{1'bz}}) begin
            if (Io_wire === {DQ_BITS{1'bx}}) begin
                //if we are already x's, then there is the possibility that a scheduled data->x->z
                //from the last read is going to overwrite our scheduled Z's transition here.  So, we
                // add additional logic here to ensure the posedge of Ce_n result in the correct 
                // Io transitions at the right time

                //don't proceed if previous read is closer to tri-stating than tCHZ
                if ((tm_re_n_r + tRHZ_max) > ($realtime + tCHZ_max)) begin
                    //need this part to ensure that IoX_enable transitions from 1->0 so
                    // the always block below will catch it and disable X's
                    if (cache_op) begin
                        IoX_enable <= #(tCHZ_cache_max -1) 1'b1;
                    end else begin
                        IoX_enable <= #(tCHZ_max -1) 1'b1;
                    end
                    t_readtox <= $realtime; //doesn't matter what we set this to if we are already X's
                    //now schedule the X->Z transition
                    if (cache_op) begin
                        IoX_enable <= #(tCHZ_cache_max) 1'b0;
                        t_readtoz <= ($realtime + tCHZ_cache_max);
                    end else begin
                        IoX_enable <= #(tCHZ_max) 1'b0;
                        t_readtoz <= ($realtime + tCHZ_max);
                    end
                    rd_out <= 1'b0;  //output should already be disabled if x's
                end 
                
            end //Io_wire !== x's
        end //Io_wire !== z's
    end
end else begin //sync_mode
    release_dqs = 1;
end
end //posedge Ce_n



//enable X's on output
always @(posedge IoX_enable) begin
    if (t_readtox - $realtime < 0.5 && $realtime - t_readtox < 0.5) begin // if t_readtox = $realtime +- 0.5ns error, in case of real-type precision issues
        IoX <= 1'b1;
        rd_out <= 1'b0;
    end
end

//disable X's on output
always @(negedge IoX_enable) begin
    if (t_readtoz - $realtime < 0.5 && $realtime - t_readtoz < 0.5) begin // if t_readtoz = $realtime +- 0.5ns error, in case of real-type precision issues
        IoX <= 1'b0;
    end
end


//#############################################################################
// Timing checks
//#############################################################################

/*
*/
    
always @ (posedge We_n) begin 
    if (command_enable && ($realtime < (tVCC_delay+tRB_PU_max))) begin $sformat(msg,"Host must wait for R/B# to be valid and high before issuing the reset cmd : delay timing =%d ns", (tVCC_delay+tRB_PU_max)); ERROR(ERR_TIM, msg); end
end 

always @ (We_n) begin
  if (~sync_mode & ~sync_enh_mode & PowerUp_Complete) begin
    if (~We_n) begin : negedge_We_n
        if (~Ce_n) begin
             if (cache_op === 1) begin
                // special cache mode timing checks
                if ($realtime - tm_we_n_f < tWC_cache_min) begin $sformat(msg,"Cache Mode tWC violation on We_n by %t ", tm_we_n_f + tWC_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_we_n_r < tWH_cache_min) begin $sformat(msg,"Cache Mode tWH violation on We_n by %t ", tm_we_n_r + tWH_cache_min - $realtime); ERROR(ERR_TIM, msg); end
             end else if (lastCmd === 8'hB8) begin
                if ($realtime - tm_we_n_f < tWCIO_min) begin $sformat(msg,"tWCIO violation on We_n by %t ", tm_we_n_f + tWCIO_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_we_n_r < tWHIO_min) begin $sformat(msg,"tWHIO violation on We_n by %t ", tm_we_n_r + tWHIO_min - $realtime); ERROR(ERR_TIM, msg); end
             end else begin
                if ($realtime - tm_we_n_f < tWC_min) begin $sformat(msg,"tWC violation on We_n by %t ", tm_we_n_f + tWC_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_we_n_r < tWH_min) begin $sformat(msg,"tWH violation on We_n by %t ", tm_we_n_r + tWH_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_re_n_r < tRHW_min) begin $sformat(msg,"tRHW violation on We_n by %t ", tm_re_n_r + tRHW_min - $realtime); ERROR(ERR_TIM, msg); end
            end
            tm_we_n_f <= $realtime;
        end
    end else begin : posedge_We_n
        if (~Ce_n) begin
            if (cache_op === 1) begin
                // special cache mode timing checks
                if (cmnd_85h && ~Ale && ~Cle && ~status_cmnd && ~cmnd_78h) begin
                    if ($realtime - tm_we_n_r_ale < tCCS_cache_min) begin $sformat(msg,"Cache Mode tCCS violation on We_n by %t", tm_we_n_r_ale + tCCS_cache_min - $realtime); ERROR(ERR_TIM,msg); end
                end
                if ($realtime - tm_we_n_f < tWP_cache_min) begin $sformat(msg,"Cache Mode tWP violation on We_n by %t ", tm_we_n_f + tWP_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_r < tCLS_cache_min) begin $sformat(msg,"Cache Mode tCLS violation on We_n by %t ", tm_cle_r + tCLS_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_f < tCLS_cache_min) begin $sformat(msg,"Cache Mode tCLS violation on We_n by %t ", tm_cle_f + tCLS_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ce_n_f < tCS_cache_min) begin $sformat(msg,"Cache Mode tCS violation on We_n by %t ", tm_ce_n_f + tCS_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_io_ztodata < tDS_cache_min) begin $sformat(msg,"Cache Mode tDS violation on We_n by %t ", tm_io_ztodata + tDS_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ale_r < tALS_cache_min) begin $sformat(msg,"Cache Mode tALS violation on We_n by %t ", tm_ale_r + tALS_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ale_f < tALS_cache_min) begin $sformat(msg,"Cache Mode tALS violation on We_n by %t ", tm_ale_f + tALS_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_wp_n < tWW_cache_min) begin $sformat(msg,"Cache Mode tWW violation on We_n by %t ", tm_wp_n + tWW_cache_min - $realtime); ERROR(ERR_TIM, msg); end
            end else if (lastCmd === 8'hB8) begin
                if ($realtime - tm_we_n_f < tWPIO_min) begin $sformat(msg,"tWPIO violation on We_n by %t ", tm_we_n_f + tWPIO_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_r < tCLSIO_min) begin $sformat(msg,"tCLSIO violation on We_n by %t ", tm_cle_r + tCLSIO_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_f < tCLSIO_min) begin $sformat(msg,"tCLSIO violation on We_n by %t ", tm_cle_f + tCLSIO_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_io_ztodata < tDSIO_min) begin $sformat(msg,"tDSIO violation on We_n by %t ", tm_io_ztodata + tDSIO_min - $realtime); ERROR(ERR_TIM, msg); end
            end else if (cmnd_85h && ~Ale && ~Cle && ~status_cmnd && ~cmnd_78h && die_select) begin
                if ($realtime - tm_we_n_r_ale < tCCS_min) begin $sformat(msg,"tCCS violation on We_n by %t", tm_we_n_r_ale + tCCS_min - $realtime); ERROR(ERR_TIM,msg); end
            end else begin
                if ($realtime - tm_we_n_f < tWP_min) begin $sformat(msg,"tWP violation on We_n by %t ", tm_we_n_f + tWP_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ale_r < tALS_min) begin $sformat(msg,"tALS violation on We_n by %t ", tm_ale_r + tALS_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ale_f < tALS_min) begin $sformat(msg,"tALS violation on We_n by %t ", tm_ale_f + tALS_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_r < tCLS_min) begin $sformat(msg,"tCLS violation on We_n by %t ", tm_cle_r + tCLS_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_f < tCLS_min) begin $sformat(msg,"tCLS violation on We_n by %t ", tm_cle_f + tCLS_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ce_n_f < tCS_min) begin $sformat(msg,"tCS violation on We_n by %t ", tm_ce_n_f + tCS_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_wp_n < tWW_min) begin $sformat(msg,"tWW violation on We_n by %t ", tm_wp_n + tWW_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_io_ztodata < tDS_min) begin $sformat(msg,"tDS violation on We_n by %t ", tm_io_ztodata + tDS_min - $realtime); ERROR(ERR_TIM, msg); end
                if ((we_adl_active && ~Ale && ~Cle) && ($realtime - tm_we_ale_r < tADL_min)) begin 
                        $sformat(msg,"tADL violation on We_n by %t ", tm_we_ale_r + tADL_min - $realtime); ERROR(ERR_TIM, msg); 
                        $display("tm_we_ale_r=%0t , tm_we_data_r=%0t", tm_we_ale_r, tm_we_data_r);
                    end
            end
        end
        tm_we_n_r <= $realtime;
        if (Ale) tm_we_n_r_ale <= $realtime;
    end //posedge_We_n
  end
end


always @ (Re_n) begin
  if (~sync_mode & ~sync_enh_mode & PowerUp_Complete) begin
    if (~Re_n) begin : negedge_Re_n
        if (~Ce_n) begin
            if (cache_op === 1) begin
                // special cache mode timing checks
                if ((lastCmd == 8'hE0) && ~status_cmnd && ~cmnd_78h) begin
                    if ($realtime - tm_we_n_r < tCCS_cache_min) begin $sformat(msg,"Cache Mode tCCS violation on Re_n by %t", tm_we_n_r + tCCS_cache_min - $realtime); ERROR(ERR_TIM,msg); end
                end
                if ($realtime - tm_io_datatoz < tIR_cache_min) begin $sformat(msg,"Cache Mode tIR violation on Re_n by %t ", tm_io_datatoz + tIR_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_re_n_f < tRC_cache_min) begin $sformat(msg,"Cache Mode tRC violation on Re_n by %t ", tm_re_n_f + tRC_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_re_n_r < tREH_cache_min) begin $sformat(msg,"Cache Mode tREH violation on Re_n by %t ", tm_re_n_r + tREH_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_we_n_r < tWHR_cache_min) begin $sformat(msg,"Cache Mode tWHR violation on Re_n by %t ", tm_we_n_r + tWHR_cache_min - $realtime); ERROR(ERR_TIM, msg); end
            end else if (lastCmd === 8'hB8) begin
                if ($realtime - tm_we_n_r < tWHRIO_min) begin $sformat(msg,"tWHRIO violation on Re_n by %t ", tm_we_n_r + tWHRIO_min - $realtime); ERROR(ERR_TIM, msg); end
            end else if ((lastCmd == 8'hE0) && ~status_cmnd && ~cmnd_78h && die_select) begin
                    if ($realtime - tm_we_n_r < tCCS_min) begin $sformat(msg,"tCCS violation on Re_n by %t", tm_we_n_r + tCCS_min - $realtime); ERROR(ERR_TIM,msg); end
            end else begin
                if ($realtime - tm_ale_f < tAR_min) begin $sformat(msg,"tAR violation on Re_n by %t ", tm_ale_f + tAR_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_cle_f < tCLR_min) begin $sformat(msg,"tCLR violation on Re_n by %t ", tm_cle_f + tCLR_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_re_n_f < tRC_min) begin $sformat(msg,"tRC violation on Re_n by %t ", tm_re_n_f + tRC_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_re_n_r < tREH_min) begin $sformat(msg,"tREH violation on Re_n by %t ", tm_re_n_r + tREH_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_we_n_r < tWHR_min) begin $sformat(msg,"tWHR violation on Re_n by %t ", tm_we_n_r + tWHR_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_io_datatoz < tIR_min) begin $sformat(msg,"tIR violation on Re_n by %t ", tm_io_datatoz + tIR_min - $realtime); ERROR(ERR_TIM, msg); end
                if (($realtime - tm_rb_n_r < tRR_min) && ~status_cmnd && die_select) begin $sformat(msg,"tRR violation on Re_n by %t ", tm_rb_n_r + tRR_min - $realtime); ERROR(ERR_TIM, msg); end
            end
`ifdef EDO
            //read EDO mode, not supported by all devices
            if (($realtime - tm_re_n_f) < tEDO_RC) begin
                edo_mode = 1'b1;
                if (DEBUG[0]) begin $sformat(msg,"tRC less than %0d, EDO READ MODE enabled.", tEDO_RC); INFO(msg); end
            end else begin
                edo_mode = 1'b0;
            end
`endif
        end
        tm_re_n_f <= $realtime;
    end else begin : posedge_Re_n
        if (~Ce_n) begin
            if (cache_op === 1) begin
                // special cache mode timing checks
                if ($realtime - tm_re_n_f < tRP_cache_min) begin $sformat(msg,"Cache Mode tRP violation on Re_n by %0t", tm_re_n_f + tRP_cache_min - $realtime); ERROR(ERR_TIM, msg); end
            end else if (lastCmd === 8'hB8) begin
                if ($realtime - tm_re_n_f < tRPIO_min) begin $sformat(msg,"tRPIO violation on Re_n by %0t", tm_re_n_f + tRPIO_min - $realtime); ERROR(ERR_TIM, msg); end
            end else begin
                if ($realtime - tm_re_n_f < tRP_min) begin $sformat(msg,"tRP violation on Re_n by %0t", tm_re_n_f + tRP_min - $realtime); ERROR(ERR_TIM, msg); end
            end
        end
        tm_re_n_r <= $realtime;
    end // posedge_Re_n
  end
end

always @ (Ce_n) begin
    if (~Ce_n) begin
        tm_ce_n_f <= $realtime;
    end else begin
        if (PowerUp_Complete && ~sync_mode && ~sync_enh_mode) begin
            if (cache_op === 1) begin
                // special cache mode timing checks
                if ($realtime - tm_we_n_r < tCH_cache_min) begin $sformat(msg,"Cache Mode tCH violation on We_n by %0t", tm_we_n_r + tCH_cache_min - $realtime);  ERROR(ERR_TIM, msg); end
            end else begin
                //avoid timing violation during sim init if Ce_n starts as anything other than 1'b1
                if (($realtime - tm_we_n_r < tCH_min) && (tm_we_n_r > 0)) begin $sformat(msg,"tCH violation on We_n by %0t", tm_we_n_r + tCH_min - $realtime); ERROR(ERR_TIM, msg); end
            end
        end
        tm_ce_n_r <= $realtime;
    end
end

always @ (Rb_n_int) begin
    if (~Rb_n_int) begin
        tm_rb_n_f <= $realtime;
    end else begin
        tm_rb_n_r <= $realtime;
    end
end

always @ (Cle) begin
  if (~Ce_n) begin
    if (~Cle) begin
        tm_cle_f <= $realtime;
    end else begin
        tm_cle_r <= $realtime;
    end
    if (PowerUp_Complete && ~sync_mode && ~sync_enh_mode) begin
        if (cache_op === 1) begin
            // special cache mode timing checks
            if ($realtime - tm_we_n_r < tCLH_cache_min) begin $sformat(msg,"Cache Mode tCLH violation on Cle by %0t", tm_we_n_r + tCLH_cache_min - $realtime); ERROR(ERR_TIM, msg); end
        end else if (lastCmd === 8'hB8) begin
            if ($realtime - tm_we_n_r < tCLHIO_min) begin $sformat(msg,"tCLHIO violation on Cle by %0t", tm_we_n_r + tCLHIO_min - $realtime); ERROR(ERR_TIM, msg); end
        end else begin
            if ($realtime - tm_we_n_r < tCLH_min) begin $sformat(msg,"tCLH violation on Cle by %0t", tm_we_n_r + tCLH_min - $realtime); ERROR(ERR_TIM, msg); end
        end
    end
  end //~sync_mode && ~sync_enh_mode && ~Ce_n
end

always @ (Ale) begin
  if (~Ce_n) begin
    if (~Ale) begin
        tm_ale_f <= $realtime;
    end else begin
        tm_ale_r <= $realtime;
    end
    if (PowerUp_Complete && ~sync_mode && ~sync_enh_mode) begin
        if (cache_op === 1) begin
            // special cache mode timing checks
            if ($realtime - tm_we_n_r < tALH_cache_min) begin $sformat(msg,"Cache Mode tALH violation on Ale by %0t", tm_we_n_r + tALH_cache_min - $realtime); ERROR(ERR_TIM, msg); end
        end else begin
            if ($realtime - tm_we_n_r < tALH_min) begin $sformat(msg,"tALH violation on Ale by %0t", tm_we_n_r + tALH_min - $realtime); ERROR(ERR_TIM, msg); end
        end
    end
  end //~sync_mode && ~sync_enh_mode && ~Ce_n
end

always @ (Io_buf) begin
  if (~sync_mode && ~sync_enh_mode && ~Ce_n) begin
    if ((Io_buf === {DQ_BITS{1'bx}}) && ($realtime == t_readtox)) begin
        if (PowerUp_Complete) begin
            if (cache_op === 1) begin
            // special cache mode timing checks
                if ($realtime - tm_we_n_r < tDH_cache_min) begin $sformat(msg,"Cache Mode tDH violation on IO by %0t", tm_we_n_r + tDH_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                if (edo_mode) begin
                    if ((0 < ($realtime - tm_re_n_f)) && (($realtime - tm_re_n_f)  < tRLOH_cache_min)) begin $sformat(msg,"Cache Mode tRLOH violation on IO by %0t", tm_re_n_f + tRLOH_cache_min - $realtime); ERROR(ERR_TIM, msg); end
                end
            end else if (lastCmd === 8'hB8) begin
                if ($realtime - tm_we_n_r < tDHIO_min) begin $sformat(msg,"tDHIO violation on IO by %0t", tm_we_n_r + tDHIO_min - $realtime); ERROR(ERR_TIM, msg); end
            end else begin
                if ($realtime - tm_we_n_r < tDH_min) begin $sformat(msg,"tDH violation on IO by %0t", tm_we_n_r + tDH_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_ce_n_r < tCOH_min) begin $sformat(msg,"tCOH violation on IO by %0t", tm_ce_n_r + tCOH_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_re_n_r < tRHOH_min) begin $sformat(msg,"tRHOH violation on IO by %0t", tm_re_n_r + tRHOH_min - $realtime); ERROR(ERR_TIM, msg); end
                if (edo_mode) begin
                    if ((0 < ($realtime - tm_re_n_f)) && (($realtime - tm_re_n_f)  < tRLOH_min)) begin $sformat(msg,"tRLOH violation on IO by %0t", tm_re_n_f + tRLOH_min - $realtime); ERROR(ERR_TIM, msg); end
                end
            end
        end
        tm_io_datatoz <= $realtime;
    end else begin
        tm_io_ztodata <= $realtime;
    end
  end //~sync_mode && ~sync_enh_mode && ~Ce_n
end

always @(posedge tWB_check_en) begin
    tWB_check;
end

//-----------------------------------------------------------------
// TASK : tWB_check ()
// Check that no commands are issued during tWB
// template of this task comes from go_busy task
//-----------------------------------------------------------------
task tWB_check;
    integer delay;
    reg saw_edge_we_n;
    reg last_we_n;
    realtime tstep;
begin
    tstep = (1000 * TS_RES_ADJUST);
    delay = tWB_delay;
    last_we_n = We_n;
    while (delay > 0) begin
        if ((delay -tstep) >= 0) begin
            #tstep;
        end else begin
            #delay;
        end
        delay = delay - tstep;
        if (delay < 0) delay = 0;
        if (last_we_n !== We_n) begin
            saw_edge_we_n = 1'b1;
        end else begin
            saw_edge_we_n = 1'b0;
        end
        last_we_n = We_n;
        if (Cle && We_n && ~Ale && Re_n && ~Ce_n && saw_edge_we_n) begin
	    $sformat(msg, "Do not issue a new command during tWB, even if R/B# or RDY is ready"); ERROR(ERR_CMD, msg);
        end
    end
    tWB_check_en = 1'b0;
end
endtask

    //#########################################################################
    //  High-speed sync logic
    //#########################################################################

    //--------------------------------------------------------
    // Dq interface enable/disable (Dq and Io are same thing)
    //--------------------------------------------------------

    // Drive Dqs from tristrate to 1'b0 once the device is given control of the interface
    always @ (posedge Clk) begin
        if (drive_dqs && sync_mode) begin
            Dqs_buf <= #tDQSD_sync_min 1'b0;
            //Dq must be driven to some value when the device the driver
            Io_buf  <= #tDQSD_sync_min {DQ_BITS{1'b0}};
            dqs_en <= #tDQSD_sync_min 1;
            drive_dqs = 0;
        end
        //once we lose control or Dqs, must transition back to tristate
        if (release_dqs && sync_mode) begin
            Dqs_buf <= #tDQSHZ_sync_min 1'bz;
            //Dq must be driven to some value when the device the driver
            Io_buf  <= #tDQSHZ_sync_min {DQ_BITS{1'bz}};
            dqs_en <= #tDQSHZ_sync_min 0;
            release_dqs = 0;
        end
    end

        //---------------------------
        // DQS data-out transition
        //---------------------------

    assign dqs_out_enable = (Cle && Ale && ~Wr_n_int && ~Ce_n && die_select);
    //align the Dqs output during reads with the Dq data
    always @ (Clk) begin
        // make sure that Dqs also transitions low even when Ale 
        // and Cle are low (as long as they were high during posedge clock)
        if (Clk) dqs_enable = dqs_out_enable;
        if (sync_mode && dqs_enable) begin
            if (Clk) begin
                saw_posedge_dqs <= 1;
                Dqs_buf <= #tDQSCK_sync_max 1'b1;
            end else begin
                if (saw_posedge_dqs) begin
                    Dqs_buf <= #tDQSCK_sync_max 1'b0;
                end
            end
        end else if (sync_mode) begin
            IoX_enable <= #tDQSCK_sync_max 1'b0;
            t_readtoz = $realtime + tDQSCK_sync_max;
            IoX        <= #tDQSCK_sync_max 1'b0;
            saw_posedge_dqs <= 0;
        end
    end

    //-----------------------------------------------------------------
    // Data output
    //-----------------------------------------------------------------

    always @ (posedge Wr_n) begin
        if (sync_mode && ~Ce_n && die_select) begin
            release_dqs = 1;
        end
    end

    //sync : data output cycle start, dqs->0
    // drive_dqs lets the next clock know that it's time
    // for the device to drive the Dqs I/O
    always @(negedge Wr_n) begin
        if (sync_mode && ~Ce_n && die_select) begin
            drive_dqs <= 1'b1;
        end
    end

    //-----------------------------------------------------------------
    // Signal checks
    //-----------------------------------------------------------------

    //sync mode Dqs check, removed in revision 7.25 as this check is no longer valid
    // Dqs in command/address phase is don't care, perhaps we wanted to guarantee dqs is only used during data input/output
/*    always @(Dqs) begin
        if (Cle ^ Ale) begin
            $sformat(msg,"Dqs may not transition during command or address latch.");
            ERROR(ERR_MISC, msg);    
       end
    end
*/
    // Checks for illegal Ce_n sync mode transition
    always @ (Ce_n) begin
        if (sync_mode & timezero) begin
            if (Ale || Cle) begin
                $sformat(msg,"Illegal Ce_n transition in sync mode.  Ce_n may only transition when Ale and Cle are both low.");
                ERROR(ERR_MISC, msg);
            end else begin
                if (Ce_n && (($realtime - tm_clk_r) < tCH_sync_min)) begin $sformat(msg, "Sync mode : tCH violation by %0t", tCH_sync_min - ($realtime - tm_clk_r)); ERROR(ERR_TIM,msg); end
            end
            //if (Io !== {DQ_BITS{1'bz}}) begin
    //        if (Ce_n && ~(~Ale && ~Cle && Wr_n)) begin
    //			// can only have posedge Ce_n during Idle (Ale and Cle are low and Wr_n is high)
    //            $sformat(msg,"Illegal Ce_n transition in sync mode.  Ce_n may only transition high during idle.");
    //            ERROR(ERR_MISC, msg);
    //        end
        end
        first_clk <= 1'b1;  //used to indicate first clock edge for timing checks below
        new_clk   <= 1'b1;  //used to indicate that a new clock period calculation is needed for timing checks
    end
    


    //-----------------------------------------------------------------
    // Timing checks
    //-----------------------------------------------------------------

    reg [2:0] lastState;


    //determine start of tCAD
    always @(posedge Clk) begin
        if (sync_mode && ~Ce_n) begin
            update_tCAD;
        end else begin
            //not in sync mode, so make state unknown
            lastState <= 3'b000;
        end       
    end

    task update_tCAD;
        reg set_tCAD;
    begin
        set_tCAD = 0;
        casex ({Wr_n,Cle,Ale}) 
        3'b000: begin
            // check idle and start tCAD after tCKWR if last clock was data output
            if (lastState == 3'b011) check_idle <= #((tCKWR_sync_min-1)*tCK_sync-1) 1'b1;
            lastState <= 3'b000;
            //if this is first clock after ce active and after tCS
            if ((($realtime - tm_ce_n_f) >= tCS_sync_min) && (($realtime - tm_ce_n_f) < tCS_sync_min + tCK_sync)) set_tCAD = 1;
        end 
        3'b001, 3'b010 : begin
            lastState <= 3'b000;
        end
        3'b011 : begin
            lastState <= 3'b011; //Data Read
        end
        3'b100 : begin
            // tCAD starts on tWPST after last DQS if inputting data, or on first idle clock after Ce_n goes low
            if (($realtime - tCK_sync) < tm_dqs_f) begin
                //since we've already consumed part of a clock cycle to get to this posedge, we'll activate
                // check idle after the remaining tWPST to verify the tWPST->tCAD timing requirement
                check_idle <= #(tWPST_sync_min - ($realtime - tm_dqs_f) -1) 1'b1;
                set_tCAD = 1;
            end
            if ((($realtime - tm_ce_n_f) >= tCS_sync_min) && (($realtime - tm_ce_n_f) < tCS_sync_min + tCK_sync)) set_tCAD = 1;
            lastState <= 3'b100;  //idle
        end
        3'b101 : begin
             //Address cycle
            if (lastState !== 3'b101) set_tCAD = 1;
            lastState <= {Wr_n,Cle,Ale};
        end
        3'b110 : begin
            //Command cycle
            if (lastState !== 3'b110) set_tCAD = 1;
            lastState <= {Wr_n,Cle,Ale}; 
        end
        3'b111 : begin
            lastState <= {Wr_n,Cle,Ale}; //Data Write
        end
        endcase
        // check to see if bus is still idle after tCKWR following data output
        if (check_idle) begin
            if (~Ale && ~Cle) begin
                set_tCAD = 1;
            end else begin
                //if not still idle, there was a glitch and tCAD has not been met
                $sformat(msg,"Sync mode : tCAD timing violation."); ERROR(ERR_TIM, msg);
            end
            check_idle <= 0;
        end
        // now update tCAD if previous checks show it's necessary
        if (set_tCAD) tm_cad_r <= $realtime;
    end
    endtask

    always @(Wr_n) begin
        if (sync_mode && ~Ce_n) begin
            if (Wr_n) tm_wr_n_r <= $realtime;
            else      tm_wr_n_f <= $realtime;  // ??? may need to have ~Wr_n instead of else clause
        end
    end

    reg tcs_sync_chk_en = 1'b0;
    always @ (Ce_n) begin
        if (Ce_n) begin // posedge Ce_n
	    tcs_sync_chk_en <= 1'b0;	
	end else begin // negedge Ce_n
	    tcs_sync_chk_en <= 1'b1;
	    check_idle <= 0; // this signal is used in calcualting tCAD, neet to reset this signal if CE is toggled
	end    
    end 	

    // During sync mode, checking tCS from negedge CE_n to posedge clock is useless. If tCS fails on first first clock edge, then tCS should pass on next clock edge.
    // Instead, check that ALE/CLE are low on clock edges during tCS, unless we latch FFh reset command
    always @ (posedge Clk) begin
        if(sync_mode & tcs_sync_chk_en) begin
	   if (($realtime - tm_ce_n_f) >= tCS_sync_min) begin
	   	tcs_sync_chk_en <= 1'b0;
	   end else if ((Cle || Ale) && (Io[7:0] !== 8'hFF)) begin 
	   	$sformat(msg,"tCS violation, ALE or CLE went high during tCS"); ERROR(ERR_TIM, msg);
	   end
        end
    end     
    
    //Clk only used in Sync Mode
    always @ (Clk) begin
      if (sync_mode && ~Ce_n) begin
        if (Clk) begin //posedge clk
            //Added an extra clock period condition temporarily to the tCS check.  Won't flag timing violation if tCS > tCK (as is currently in one datasheet)
            // this will be reconciled in the next release of the model
            if (Cle && Ale && Clk) begin //posedge Clk with data access
                if ((($realtime - tm_cad_r) < tCAD_sync_min) && (lastState[1:0] !== 2'b11)) begin $sformat(msg,"Sync mode : tCAD violation by %0t", tm_cad_r + tCAD_sync_min - $realtime); ERROR(ERR_TIM, msg); end
                if (($realtime - tm_clk_r < tWHR_sync_min) && (lastState == 3'b110) && ~Wr_n) begin $sformat(msg,"Sync mode : tWHR violation by %t ", tm_clk_r + tWHR_sync_min - $realtime); ERROR(ERR_TIM, msg); end
            end else if ((Cle || Ale) && Clk) begin //posedge Clk with Command or address
                if ($realtime - tm_wp_n < tWW_sync_min) begin $sformat(msg,"Sync mode : tWW violation by %t ", tm_wp_n + tWW_sync_min - $realtime); ERROR(ERR_TIM, msg); end
                if ($realtime - tm_wr_n_r < tRHW_sync_min) begin $sformat(msg,"Sync mode : tRHW violation by %t ", tm_wr_n_r + tRHW_sync_min - $realtime); ERROR(ERR_TIM, msg); end
                // report violation if we violate tCAD or we didn't idle before switching from data in/out to cmd/addr 
                if (($realtime - tm_cad_r) < tCAD_sync_min) begin $sformat(msg,"Sync mode : tCAD violation by %0t", tm_cad_r + tCAD_sync_min - $realtime); ERROR(ERR_TIM, msg); end
                if (($realtime - tm_dq) < tCAS_sync_min) begin $sformat(msg, "Sync mode : tCAS violation by %0t", tCAS_sync_min - ($realtime - tm_dq)); ERROR(ERR_TIM,msg);end
            end
            if (Wr_n) begin
                if (($realtime - tm_wr_n_r) < tCALS_sync_min) begin $sformat(msg,"Sync mode : Wr_n tCALS violation by %0t", (tm_wr_n_r + tCALS_sync_min - $realtime)); ERROR(ERR_TIM, msg); end
            end
            if (~Wr_n) begin
                if (($realtime - tm_wr_n_f) < tCALS_sync_min) begin $sformat(msg,"Sync mode : Wr_n tCALS violation by %0t", (tm_wr_n_f + tCALS_sync_min - $realtime)); ERROR(ERR_TIM, msg); end
            end
            if (Ale) begin
                if (($realtime - tm_ale_r) < tCALS_sync_min) begin $sformat(msg,"Sync mode : Ale tCALS violation by %0t", tm_ale_r + tCALS_sync_min - $realtime); ERROR(ERR_TIM, msg); end        
                if (~Wr_n && ($realtime - tm_wr_n_clk) < tWRCK_sync_min) begin $sformat(msg,"Sync mode : Ale tWRCK violation by %0t", tm_wr_n_clk + tWRCK_sync_min - $realtime); ERROR(ERR_TIM, msg); end        
            end
            if (Cle) begin
                if (($realtime - tm_cle_r) < tCALS_sync_min) begin $sformat(msg,"Sync mode : Cle tCALS violation by %0t", tm_cle_r + tCALS_sync_min - $realtime); ERROR(ERR_TIM, msg); end
                if (~Wr_n && ($realtime - tm_wr_n_clk) < tWRCK_sync_min) begin $sformat(msg,"Sync mode : Cle tWRCK violation by %0t", tm_wr_n_clk + tWRCK_sync_min - $realtime); ERROR(ERR_TIM, msg); end        
            end
        end
        if (~Ce_n && ~Clk) begin : negedge_Clk
            if (~new_clk && (tm_ce_n_f != $realtime)) begin
                if (($realtime - tm_clk_r) < tCKH_sync_min) begin $sformat(msg,"Sync mode : min tCKH violation by %0t, tCKH=%0t", tCKH_sync_min - ($realtime - tm_clk_r), tCKH_sync_min); ERROR(ERR_TIM, msg); end
                if (($realtime - tm_clk_r) > tCKH_sync_max) begin $sformat(msg,"Sync mode : max tCKH violation by %0t, tCKH=%0t", ($realtime - tm_clk_r) - tCKH_sync_max, tCKH_sync_max); ERROR(ERR_TIM, msg); end
            end
            tm_clk_f <= $realtime;
        end else if (~Ce_n && Clk) begin : posedge_Clk
            if (~first_clk && (tm_ce_n_f != $realtime)) begin
                //clock period checks
                tCK_sync = $realtime - tm_clk_r;  //calculate the clock period
                if (new_clk) begin
	                if (DEBUG[0]) $display("new clk : tCK_sync_min=%0t, tCK_sync_max=%0t, tCK_sync=%0t", tCK_sync_min, tCK_sync_max, tCK_sync);
                    update_clock_parameters;  //only need to do this update after the first tCK_sync calculation after device becomes active
                end
                new_clk = 0;
                if (($realtime - tm_clk_f) < tCKL_sync_min) begin $sformat(msg,"Sync mode : min tCKL violation by %0t, tCKL=%0t", tCKL_sync_min - ($realtime - tm_clk_f), tCKL_sync_min); ERROR(ERR_TIM, msg); end
                if (($realtime - tm_clk_f) > tCKL_sync_max) begin $sformat(msg,"Sync mode : max tCKL violation by %0t, tCKL=%0t", ($realtime - tm_clk_f) - tCKL_sync_max, tCKL_sync_max); ERROR(ERR_TIM, msg); end
                if (($realtime - tm_clk_r) < tCK_sync_min) begin $sformat(msg,"Sync mode : min tCK violation by %0t", tCK_sync_min - ($realtime - tm_clk_r)); ERROR(ERR_TIM,msg);end
                if (($realtime - tm_clk_r) > tCK_sync_max) begin $sformat(msg,"Sync mode : max tCK violation by %0t", ($realtime - tm_clk_r) - tCK_sync_max); ERROR(ERR_TIM,msg);end
            end
            if (first_clk) first_clk <= 0;
            tm_clk_r <= $realtime;        
        end
      end //sync_mode && ~Ce_n
    end

    always @(negedge Ale or negedge Cle) begin
        if(sync_mode && ~Ce_n) begin
            if (($realtime - tm_clk_r) < tCALH_sync_min) begin $sformat(msg, "Sync Mode : tCALH violation by %0t", tCALH_sync_min - ($realtime - tm_clk_r)); ERROR(ERR_TIM,msg); end 
        end
    end

    //keep track of last command or address clock edge for use in tWHR check
    always @(posedge Clk) begin
        if(sync_mode && ~Ce_n) begin
        case ({Ale, Cle}) 
        2'b01 : begin
                    tm_cle_clk <= $realtime;
                    // SMK : Wp_n is an async only pin
    //                if (($realtime - tm_wp_n) < tWW_sync_min) begin $sformat(msg, "Sync Mode : tWW violation by %0t", tWW_sync_min - ($realtime - tm_wp_n)); ERROR(ERR_TIM,msg); end
                end
        2'b10 :  tm_ale_clk <= $realtime;
        endcase
        end
    end

    always @(posedge Clk) begin
            if (sync_mode && ~Ce_n && Wr_n) begin
                if (tm_wr_end < tm_wr_start) begin
                    if (($realtime - tm_dqs_f) < tDSS_sync_min - TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDSS hold violation by %0t", tDSS_sync_min - ($realtime - tm_dqs_f)); ERROR(ERR_TIM,msg); end
                end
                if (Cle && Ale) begin 
                //check for first clock during data read, enable first_dqs control for timing checks 
                    if (($realtime - tm_ale_clk) < tADL_sync_min) begin $sformat(msg, "Sync Mode : tADL violation by %0t", tADL_sync_min - ($realtime - tm_ale_clk)); ERROR(ERR_TIM,msg); end
		    if (cmnd_85h && ~status_cmnd && ~cmnd_78h && die_select) begin
			if ($realtime - tm_ale_clk < tCCS_min) begin $sformat(msg,"tCCS sync violation by %t", tCCS_min - ($realtime - tm_ale_clk )); ERROR(ERR_TIM,msg); end
                    end
		    if ((($realtime - tm_cle_r) < ($realtime - tm_clk_r)) && (($realtime - tm_ale_r) < ($realtime - tm_clk_r))) begin
                        first_dqs <= 1;
                        tm_wr_start <= $realtime;  //start of the write mode cycles
                        tm_wr_end   <= 0;
                    end
                end else if (~Cle && ~Ale) begin
                    if ((($realtime - tm_cle_f) < ($realtime - tm_clk_r)) && (($realtime - tm_ale_f) < ($realtime - tm_clk_r))) begin
                        tm_wr_end  <= #tDQSS_sync_max $realtime; //indicates that the write cycles are done
                    end
                end
            end
            if (sync_mode && ~Ce_n && ~Wr_n) begin
                if (($realtime - tm_wr_n_f) < ($realtime - tm_clk_r)) begin
		    tm_wr_n_clk <= $realtime;  // latch the time when low Wr_n is latched by clk, use this is tWRCK check
		end
		if (Cle && Ale) begin
                    if (($realtime - tm_cle_clk) < tWHR_sync_min) begin $sformat(msg, "Sync Mode : tWHR violation by %0t", tWHR_sync_min - ($realtime - tm_cle_clk)); ERROR(ERR_TIM,msg); end 
                    if (($realtime - tm_ale_clk) < tWHR_sync_min) begin $sformat(msg, "Sync Mode : tWHR violation by %0t", tWHR_sync_min - ($realtime - tm_ale_clk)); ERROR(ERR_TIM,msg); end 
                    if ((lastCmd == 8'hE0) && ~saw_cmnd_00h && ~status_cmnd && ~cmnd_78h) begin
                        if (($realtime - tm_cle_clk) < tCCS_min) begin $sformat(msg,"tCCS sync violation by %t", tCCS_min - ($realtime - tm_cle_clk)); ERROR(ERR_TIM,msg); end
                    end
                end
            end
    end

    // Need the extra 0.001 in some of these cases to get around the simulator rounding errors
    always @(Dqs) begin
        //last part of the 'if' condition is to make sure the DQS->1 idle transition well after write mode does not trigger tDQSS check
        if (sync_mode && ~Ce_n && Wr_n && (tm_wr_end < tm_wr_start)) begin  //data & dqs input timing checks
            if (($realtime - tm_dq) < (tDS_sync_min - TS_RES_ADJUST)) begin $sformat(msg, "Sync mode : tDS violation by %0t", tDS_sync_min - ($realtime - tm_dq)); ERROR(ERR_TIM,msg);end
            if (Dqs) begin
                if (first_dqs) begin 
                    if (($realtime - tm_wr_start) < tDQSS_sync_min - TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDQSS min violation by %0t", tDQSS_sync_min - ($realtime - tm_wr_start)); ERROR(ERR_TIM,msg);end
                    if (($realtime - tm_wr_start) > tDQSS_sync_max + TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDQSS max violation by %0t", ($realtime - tm_wr_start) - tDQSS_sync_max); ERROR(ERR_TIM,msg);end
                    if (($realtime - tm_dqs_f) < tWPRE_sync_min) begin $sformat(msg,"Sync Mode : tWPRE violation by %0t", tWPRE_sync_min - ($realtime - tm_dqs_f)); ERROR(ERR_TIM,msg); end
                end else begin
                    if (($realtime - tm_dqs_f) < tDQSL_sync_min - TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDQSL min pulse width violation by %0t", tDQSL_sync_min - ($realtime - tm_dqs_f)); ERROR(ERR_TIM,msg);end
                    if (($realtime - tm_dqs_f) > tDQSL_sync_max + TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDQSL max pulse width violation by %0t", ($realtime - tm_dqs_f) - tDQSL_sync_max); ERROR(ERR_TIM,msg);end
                end
                tm_dqs_r <= $realtime;
            end else begin
                if (first_dqs != 0) begin
                    if (($realtime - tm_dqs_r) < tDQSH_sync_min - TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDQSH min pulse width violation by %0t", tDQSH_sync_min - ($realtime - tm_dqs_r)); ERROR(ERR_TIM,msg);end
                    if (($realtime - tm_dqs_r) > tDQSH_sync_max + TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDQSH max pulse width violation by %0t", ($realtime - tm_dqs_r) - tDQSH_sync_max); ERROR(ERR_TIM,msg);end
                end
                if (($realtime - tm_clk_r) < tDSH_sync_min - TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tDSH hold violation by %0t", tDSH_sync_min - ($realtime - tm_clk_r)); ERROR(ERR_TIM,msg); end
                tm_dqs_f <= $realtime;
            end
            first_dqs <= 0;
        end else if (sync_mode && ~Ce_n) begin
        //check for postamble constraint 
            if ((tm_dqs_f > tm_wr_start) && (($realtime - tm_dqs_f) < tWPST_sync_min)) begin $sformat(msg, "Sync Mode : tWPST violation by %0t", tWPST_sync_min - ($realtime - tm_dqs_f)); ERROR(ERR_TIM,msg); end
        end
    end

    always @(Io) begin
        if (sync_mode && ~Ce_n) begin
            if (Ale && Cle) begin
                if (($realtime - tm_dqs_r) < (tDH_sync_min - TS_RES_ADJUST)) begin 
                    $sformat(msg, "Sync Mode : tDH violation by %0t", tDH_sync_min - ($realtime - tm_dqs_r)); ERROR(ERR_TIM,msg); 
                end 
                if (($realtime - tm_dqs_f) < (tDH_sync_min - TS_RES_ADJUST)) begin $sformat(msg, "Sync Mode : tDH violation by %0t", tDH_sync_min - ($realtime - tm_dqs_f)); ERROR(ERR_TIM,msg); end 
            end else if (Ale || Cle) begin
                if (($realtime - tm_clk_r) < tCAH_sync_min - TS_RES_ADJUST) begin $sformat(msg, "Sync Mode : tCAH violation by %0t", tCAH_sync_min - ($realtime - tm_clk_r)); ERROR(ERR_TIM,msg); end 
            end
            tm_dq <= $realtime;
        end
    end

    task update_clock_parameters;
    begin
        if (DEBUG[0]) begin
            $display("-------------------------------------------------");
            $display("Updating clock period based timing parameters ...");
            $display("-------------------------------------------------");

            $display("Parameters based on min/max period ");
            $display(" ...............................");
            $display("tCKH_sync_min=%0t", tCKH_sync_min);
            $display("tCKH_sync_max=%0t", tCKH_sync_max);
            $display("tCKL_sync_min=%0t", tCKL_sync_min);
            $display("tCKL_sync_max=%0t", tCKL_sync_max);
            $display("tDQSH_sync_min=%0t", tDQSH_sync_min);
            $display("tDQSH_sync_max=%0t", tDQSH_sync_max);
            $display("tDQSL_sync_min=%0t", tDQSL_sync_min);
            $display("tDQSL_sync_max=%0t", tDQSL_sync_max);
            $display("tDQSS_sync_min=%0t", tDQSS_sync_min);
            $display("tDQSS_sync_max=%0t", tDQSS_sync_max);
            $display("tDSH_sync_min=%0t", tDSH_sync_min);
            $display("tDSS_sync_min=%0t", tDSS_sync_min);
            $display("tWPRE_sync_min=%0t", tWPRE_sync_min);
            $display("tWPST_sync_min=%0t", tWPST_sync_min);

        end

	if (sync_mode) begin
        tCKH_sync_min =     0.45 * tCK_sync;
	    tCKH_sync_max =     0.55 * tCK_sync;
	    tCKL_sync_min =     0.45 * tCK_sync;
	    tCKL_sync_max =     0.55 * tCK_sync;
        tDQSH_sync_min =    0.4  * tCK_sync;
        tDQSH_sync_max =    0.6  * tCK_sync;
        tDQSL_sync_min =    0.4  * tCK_sync;
        tDQSL_sync_max =    0.6  * tCK_sync;
        tDQSS_sync_min =    0.75 * tCK_sync;
        tDQSS_sync_max =    1.25 * tCK_sync;
        tDSH_sync_min =     0.2  * tCK_sync;
        tDSS_sync_min =     0.2  * tCK_sync;
        tWPRE_sync_min =    1.5  * tCK_sync;
        tWPST_sync_min =    1.5  * tCK_sync;
	// the following are used in sync data output
        tHP_sync_min        = tCK_sync/2;
        tQH_sync_min        = tHP_sync_min - tQHS_sync_max;
        tDVW_sync_min       = tQH_sync_min - tDQSQ_sync_max;
	// by assigning quotient to integer type, quotient is automatically rounded to nearest integer
        tCKWR_sync_min      = ((tDQSCK_sync_max + tCK_sync_min) / tCK_sync_min);
        if (tCKWR_sync_min < ((tDQSCK_sync_max + tCK_sync_min) / tCK_sync_min))
		tCKWR_sync_min = tCKWR_sync_min + 1; // if tCKWR_sync_min was rounded down, then add 1 to it
        tACmaxQHminsync     = tAC_sync_max + tQH_sync_min;
        tACmaxDQSQmaxDVWminsync = tAC_sync_max + tDQSQ_sync_max + tDVW_sync_min;
	end

        if (DEBUG[0]) begin
            $display("Parameters based new clock period ");
            $display(" ...............................");
            $display("tCKH_sync_min=%0t", tCKH_sync_min);
            $display("tCKH_sync_max=%0t", tCKH_sync_max);
            $display("tCKL_sync_min=%0t", tCKL_sync_min);
            $display("tCKL_sync_max=%0t", tCKL_sync_max);
            $display("tDQSH_sync_min=%0t", tDQSH_sync_min);
            $display("tDQSH_sync_max=%0t", tDQSH_sync_max);
            $display("tDQSL_sync_min=%0t", tDQSL_sync_min);
            $display("tDQSL_sync_max=%0t", tDQSL_sync_max);
            $display("tDQSS_sync_min=%0t", tDQSS_sync_min);
            $display("tDQSS_sync_max=%0t", tDQSS_sync_max);
            $display("tDSH_sync_min=%0t", tDSH_sync_min);
            $display("tDSS_sync_min=%0t", tDSS_sync_min);
            $display("tWPRE_sync_min=%0t", tWPRE_sync_min);
            $display("tWPST_sync_min=%0t", tWPST_sync_min);
        end
    end
    endtask

endmodule

