/*
---------------------------------------------------------------------------
   Proprietary & Confidental, All right reserved, 2013
   Silicon Storage Technology, Inc.	
---------------------------------------------------------------------------
Description     : SQI Serial Flash Memory, SST26WF080B 1MB Memory
Revision Status : 1.0
---------------------------------------------------------------------------

Important Notes Please Read
---------------------------
 (1) This model has several non-volatile memorys. 
     These bits are initalized at time 0 to the default values. To 
     load these memorys with customer data load them after time 0;
     The below example loads the main flash memory from a file.
     Example: initial #1 $readmemh(<path>.I0.memory,<file name>);       // 080=1M, 016=2M, 032=4M, 064=8M bytes memory

 (2) This model has several non-volatial bits in the status registers. If you want them
     set to a different initial condition then edit this model defparam commands to
     change the values.

 (3) For simulation purposes the erase times can be shortened using the 'defparam' command
      do not shorten to less than 1uS
      Example: defparam <path>.I0.Tbe = 25_000;   // reduce block erase time from 25mS to 25uS
      Example: defparam <path>.I0.Tse = 25_000;   // reduce sector erase time from 25mS to 25uS
      Example: defparam <path>.I0.Tsce = 25_000;  // reduce chip erase time from 50mS to 25uS
      Example: defparam <path>.I0.Tpp = 25_000;   // reduce page program time from 1.5mS to 25uS
      Example: defparam <path>.I0.Tws = 1000;     // reduce suspend to ready time from 10uS to 1uS

 (4) On timing errors all of flash memory will be set to 'xx', timming errors are a fatal problem.

 (5) Parameter MASK_ERRORS is used to inhibit corruption of memory on timing errors at the start of simulation.
     This allows the unknows to be cleared before corrupting memory on timing checks. The default value is 500nS.
     To change this value use defparam to increase it to the value you need.
     Example: defparam <path>.MASK_ERRORS = 1000;	// increase time to 1uS

 (6) This model uses a common module for all the SST26VF***B family of products. This
     module is appended to the top level module code. The module name is "sst26wfxxxb".
     If more than 1 instance of the SST26VF*B family of products is placed in a design
     there will be a syntact error that module sst26wfxxxb is defined more than once.
     if this happens delete the sst26wfxx module definitions from all but one of the Verilog models.

 (7) The below code is the definition of the non-volatile memory used in the chip.

//---------------------------------------------------------------------------
// Define non-volatile Memory
//---------------------------------------------------------------------------
reg [7:0] memory[Memsize-1:0];          // define Flash memory array, non-volitable
reg [7:0] security_id[(Kilo*2)-1:0];	// Define secutity ID memory addr 0->7 are SST space the rest is user space, non-volitable
reg [7:0] SFDP[(Kilo*2)-1:0];		// serial flash discoverable parameters
reg [PROTECT_REG_MSB:0] wlldr_mem;	// Define write-lock lock down reg, non-volitable
reg WPEN;				// bit 7 of config register, non-volitable
reg SEC;				// status[5] 1-bit Lockout Security ID, non-volitable



------------------------------------------------------------------------------------
 Pin Descriptions
 Symbol    Pin Name   Type    Function
-------    ------------ ------ -------------------------------------------
 SCK       Serial Clock input  Provides clock to device
 SIO[3:0]  Serial Data  I/O    provide data input and output
 CEb       Chipenable   input  Active low chip enable
------------------------------------------------------------------------------------
*/

`timescale 1ns / 10 ps
module sst26wf080b(SCK,SIO,CEb);
input SCK;              // device clock
input CEb;              // chip enable active low
inout [3:0] SIO;        // serial 4-bit bus I/O
reg [31:0] error_cnt;	// count timing errors
	parameter MASK_ERRORS=500;			// mask any timing errors before this time

	defparam IO.Ksize = 0;  //Size of memory in Kilo bytes
	defparam I0.Msize = 1;				// Size of memory in Mega bites. I.E. 8-bit field size, use S080=1, S016=2, S032=4
	defparam I0.ADDR_MSB=19;			// most significant address bit, 32Mb=21,16Mb=20, 8Mb=19, 4Mb=18;
	defparam I0.Memory_Capacity = 8'h58;		// ID read memory size 32M=52,16M=51,8M=58, JEDEC read value
	// change below values if you need non-default values on POR
	defparam I0.WLLD_value = 32'h0000_0000;	// init WLLD protection register non-volitale, default to all 0's
	defparam I0.INIT_WPEN = 1'b0;			// value of WPEN, configuration register bit 7 default on POR
	defparam I0.SECURITY_LOCKOUT_VALUE=1'b0;	// Value of SEC, status register bit 5 on POR

	//--------------------------------------------------
	// Place common sst26wfxxxB model
	//--------------------------------------------------
	sst26wfxxxb I0(SCK,SIO,CEb);

	//--------------------------------------------------
	// Timing checks
	//--------------------------------------------------
	wire HOLDb;
	wire read_slow_flag;
	wire read_dual_io_flag;
	wire [3:0] Tds_inhibit;
	reg notifer_Tsckh,notifer_Tsckl,notifier_Tces,notifier_Tceh,notifier_Tchs,notifier_Tchh;
	reg notifier_Tcph,notifier_Tds;
	reg notifier_Fclk;
	reg notifier_Thls,notifier_Thhs,notifier_Thhh;
	assign HOLDb = I0.HOLDb;			// bring up lower level holdb net
	assign read_slow_flag = I0.read_slow_flag;	// slow timing on SPI read flag I.E. Read cmd '03h'
	assign read_dual_io_flag = I0.SPI_SDIOR_active;	// slow timing on SPI dual I/O read, i.e. cmd 'BBh'
	assign Tds_inhibit[3] = I0.SIO_IO[3] | CEb;	// i/o = input and CEb active
	assign Tds_inhibit[2] = I0.SIO_IO[2] | CEb;	// i/o = input and CEb active
	assign Tds_inhibit[1] = I0.SIO_IO[1] | CEb;	// i/o = input and CEb active
	assign Tds_inhibit[0] = I0.SIO_IO[0] | CEb;	// i/o = input and CEb active
	specify
		specparam CellType = "SST26WFxxx";

		specparam Fclk_slow = 24.99;		// Min serial clock period during '03h' Read command
		specparam Tsckh_slow = 11.0;		// Min serial clock high time 'SCK' during '03h' Read command
		specparam Tsckl_slow = 11.0;		// Min serial clock low time 'SCK' during '03h' Read command

		specparam Fclk_dual_io = 12.49;		// Min serial clock period during 'BBh' Read command
		specparam Tsckh_dual_io = 5.5;		// Min serial clock high time 'SCK' during 'BBh' Read command
		specparam Tsckl_dual_io = 5.5;		// Min serial clock low time 'SCK' during 'BBh' Read command

		specparam Fclk = 9.59;			// Min serial clock period
		specparam Tsckh = 4.5;			// Min serial clock high time 'SCK'
		specparam Tsckl = 4.5;			// Min serial clock low time 'SCK'
		specparam Tces = 5;			// CEb falling to SCK rising setup time
		specparam Tceh = 5;			// SCK rising to CEb rising hold time
		specparam Tchs = 5;			// CEb not active setup time
		specparam Tchh = 5;			// CEb not active hold time
		specparam Tcph = 12.0;			// Min CEb high time
		specparam Tds = 3;			// Data in setup time to SCK rising
		specparam Tdh = 4;			// Data in hold time to SCK rising
		specparam Thls = 5.0;			// HOLDb falling to SCK rising setup
		specparam Thhs = 5.0;			// HOLDb rising to SCK risinf setup
		specparam Thhh = 5.0;			// SCK to HOLDb hold time

		// HOLDb timing tests
		$setup(posedge SCK ,negedge HOLDb,Thls, notifier_Thls);
		$setup(posedge SCK ,posedge HOLDb,Thhs, notifier_Thhs);
		$hold (posedge SCK ,negedge HOLDb,Thhh, notifier_Thhh);


		// 40Mhz, slow speed read timing checks opcode Read '03h' in SPI mode
		$period(posedge SCK &&& read_slow_flag==1'b1 ,Fclk_slow,notifier_Fclk);
		$period(negedge SCK &&& read_slow_flag==1'b1 ,Fclk_slow,notifier_Fclk);
		$width(negedge SCK &&& read_slow_flag==1'b1,Tsckh_slow,0,notifer_Tsckh);
		$width(posedge SCK &&& read_slow_flag==1'b1,Tsckl_slow,0,notifer_Tsckl);

		// 80Mhz, read timing checks opcode Read 'BBh' in SPI mode
		$period(posedge SCK &&& read_dual_io_flag==1'b1 ,Fclk_dual_io,notifier_Fclk);
		$period(negedge SCK &&& read_dual_io_flag==1'b1 ,Fclk_dual_io,notifier_Fclk);
		$width(negedge SCK &&& read_dual_io_flag==1'b1,Tsckh_dual_io,0,notifer_Tsckh);
		$width(posedge SCK &&& read_dual_io_flag==1'b1,Tsckl_dual_io,0,notifer_Tsckl);

		// 104 Mhz timing
		$period(posedge SCK &&& CEb==1'b0 ,Fclk,notifier_Fclk);
		$period(negedge SCK &&& CEb==1'b0 ,Fclk,notifier_Fclk);
		$width(negedge SCK,Tsckh,0,notifer_Tsckh);
		$width(posedge SCK,Tsckl,0,notifer_Tsckl);
		$setup(negedge CEb,posedge SCK,Tces, notifier_Tces);
		$setup(negedge CEb,posedge SCK,Tchh, notifier_Tchh);
		$hold (posedge SCK,posedge CEb,Tceh, notifier_Tceh);
		$setup(posedge SCK,posedge CEb,Tchs, notifier_Tchs);
		$width(posedge CEb,Tcph,0,notifier_Tcph);
		$setuphold(posedge SCK &&& Tds_inhibit[3]==1'b0, SIO[3],Tds,Tdh,notifier_Tds);
		$setuphold(posedge SCK &&& Tds_inhibit[2]==1'b0, SIO[2],Tds,Tdh,notifier_Tds);
		$setuphold(posedge SCK &&& Tds_inhibit[1]==1'b0, SIO[1],Tds,Tdh,notifier_Tds);
		$setuphold(posedge SCK &&& Tds_inhibit[0]==1'b0, SIO[0],Tds,Tdh,notifier_Tds);
	endspecify

always @(notifier_Thls or notifier_Thhs or notifier_Thhh) begin
        if($realtime > MASK_ERRORS ) begin
                $display("\t%m Fatal Timing Error for SIO[3] HOLDb timing to SCK rising time=%0.2f",$realtime);
                corrupt_all;            // corrupt memory
        end
end

always @(notifier_Fclk) begin
        if($realtime > MASK_ERRORS ) begin
                $display("\t%m Fatal Timing Error Fclk time=%0.2f",$realtime);
                corrupt_all;            // corrupt memory
        end
end


always @(notifier_Tds) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tds/Tdh time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end
always @(notifier_Tcph) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tcph time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end
always @(notifier_Tchh) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tchh time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end
always @(notifier_Tchs) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tchs time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end
always @(notifier_Tceh) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tceh time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end
always @(notifier_Tces) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tces time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end

always @( notifer_Tsckh or notifer_Tsckl) begin
	if($realtime > MASK_ERRORS ) begin
		$display("\t%m Fatal Timing Error Tsckh or Tsckl CEb width error time=%0.2f",$realtime);
		corrupt_all;		// corrupt memory
	end
end

//---------------------------------------------------------------------------
// corrupt all of memory on timing error
//---------------------------------------------------------------------------
task corrupt_all;
reg [31:0] nn;
begin
	error_cnt = error_cnt + 1;	// count the number of timing errors
	$display("\t%m Fatal Error all of memory being set to 'xx' error_cnt=%0d",error_cnt);
        for(nn=0;nn<I0.Memsize;nn=nn+16) begin
                I0.memory[nn+0] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+1] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+2] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+3] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+4] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+5] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+6] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+7] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+8] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+9] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+10] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+11] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+12] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+13] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+14] = 8'hxx; // clear main memory to 'xx' on error
                I0.memory[nn+15] = 8'hxx; // clear main memory to 'xx' on error
        end
end
endtask

endmodule

/* -------------------------------------------------------------------------------
            Proprietary & Confidental, All right reserved, 2010
            Silicon Storage Technology, Inc. a subsidiary of Microchip
----------------------------------------------------------------------------------
This is the common model for the SST26WFxxxB family of chips
This model is configured using defparam commands from the chip level module
This is a serial FLASH memory that can be configured for SPI or SQI bus formats.
----------------------------------------------------------------------------------
Block memory definisions
----------------------------------------------------------------------------------
top    4 * 8K parameter block
---    1 * 32K block
---    64k blocks
---    ...
---    ...
---    64k blocks
---    1  * 32K block
bottom 4 * 8K parameter block
---------------------------------------------------------------------------

 Pin Descriptions
 Symbol    Pin Name         Type       Function
-------    ------------     ------    -------------------------------------------
 SCK       Serial Clock     input     Provides clock to device
 SIO[3:0]  Serial Data      I/O       Provide data input and output, QUAD/SPI mode
            SIO[0] = SPI    I/O       SIO[0]/SI
            SIO[1] = SPI    I/O       SIO[1]/SO
            SIO[2] Quad     I/O       SIO[2]/WPb
            SIO[3] Quad     I/O       SIO[3]/HOLDb
 CEb       Chip Enable      input     Active low chip enable
------------------------------------------------------------------------------- */

`timescale 1ns / 10 ps
module sst26wfxxxb(SCK,SIO,CEb);
input SCK;              // device clock
input CEb;              // chip enable active low
inout [3:0] SIO;        // serial 4-bit bus I/O

parameter True = 1'b1;
parameter False = 1'b0;
parameter Kilo = 1024;                  // size of kilo 2^10
parameter Mega = (Kilo * Kilo);         // Size of mega 2^20
parameter S080B=1;                      // size of SST26WF080B 1M bytes
parameter S016B=2;                      // size of SST26WF016B 2M bytes
parameter S032B=4;                      // size of SST26WF032B 4M bytes
parameter S040B=0;	//For memory size less than 1M

//--------------------------------------------------------------------------------
// change below parameters to change Memory size or init non-volitale registers
//--------------------------------------------------------------------------------
parameter Ksize = 0;
parameter Msize = S032B;                			// Size of Memory in Mega bites. use S080B, S016B, S032B
parameter Memsize = (Msize * Mega ) + (Ksize * Kilo);    			// Size of Memory in bytes
parameter ADDR_MSB=21;                  			// most significant address bit, 32Mb=21,16Mb=20, 8Mbit=19
parameter INIT_WPEN = 1'b0;					// For Configuration Register bit[7]/WPEN default value on por
parameter PROTECT_REG_MSB = ((Memsize/(Kilo*64))+(16-1));	// MSB of protection register, 1M=31, 2M=47, 4M=79
parameter WLLD_value = 80'h0000_0000_0000_0000_0000;		// WLLD non-Volatile memory initial contents
parameter SECURITY_LOCKOUT_VALUE=1'b0;				// value of security lockout bit on default startup, SEC status[5]
parameter Memory_Capacity=8'h52;				// JEDEC device ID 32B=52,16B=51,080B=58

`protect
//---------------------------------------------------------------------------
parameter MANUFACTURE=8'hBF;            // JEDEC manufacture ID for SST
parameter Memory_Type = 8'h26;          // JEDEC define Memory type
parameter Sector_MSB=11;                // 4k sector size MSB sector address = [11:0]
parameter Block08k_MSB=12;		// MSB of 8K blocks
parameter Block32k_MSB=14;		// MSB of 32K blocks
parameter Block64k_MSB=15;		// MSB of 64K blocks
parameter SST_SEC_ID_LSB='h18;          // bottom address of SST security id space that  cannot be written
parameter ID_MSB=4;                     // MSB bit of security ID address max address 'h1F
parameter Burst8_MSB=2;			// Burst MSB bit
parameter Burst16_MSB=3;		// Burst MSB bit
parameter Burst32_MSB=4;		// Burst MSB bit
parameter Burst64_MSB=5;		// Burst MSB bit
parameter Burst8=8'h00;			// burst values
parameter Burst16=8'h01;		// burst values
parameter Burst32=8'h02;		// burst values
parameter Burst64=8'h03;		// burst values

parameter AF_MSB = 23;			// MSB of serial address field [23:0] i.e. 3 bytes of address data
parameter Sector_Size = (4 * Kilo);     // sector size;
parameter Block_64k = (64*Kilo);        // normal block size
parameter Block_32k=(32*Kilo);          // 32K->64K Memory space/top-32K-->top-64K Memory space
parameter Block_08k=(8*Kilo);           // top/bottom 32k blocks of Memory are in 8K blocks
parameter Program_Page_Size=(Kilo/4);   // program page size 256 bytes


//---------------------------------------------------------------------------
// SPI opcodes 
//---------------------------------------------------------------------------
parameter SPI_NOP		= 8'h00;	// NOP command
parameter SPI_RSTEN		= 8'h66;	// Reset Enable
parameter SPI_RST		= 8'h99;	// Reset Chip
parameter SPI_EQIO		= 8'h38;	// Enable QUAD I/O
parameter SPI_RSTQIO		= 8'hFF;	// Restet QUAD I/O
parameter SPI_RDSR		= 8'h05;	// Read Status Register
parameter SPI_WRSR		= 8'h01;	// Write Status Register
parameter SPI_RDCR		= 8'h35;	// Read Configuration Register
parameter SPI_READ		= 8'h03;	// 50Mhz Read of Memory
parameter SPI_HS_READ		= 8'h0B;	// High Speed Read of Memory 80Mhz
parameter SPI_QUAD_READ		= 8'h6B;	// SPI QUAD Output Read
parameter SPI_QUAD_IO_READ	= 8'hEB;	// SPI QUAD I/O Read
parameter SPI_SDOR		= 8'h3B;	// SPI DUAL Output Read
parameter SPI_SDIOR		= 8'hBB;	// SPI DUAL I/O Read
parameter SPI_SB		= 8'hC0;	// Set Burst Length
parameter SPI_RBSPI		= 8'hEC;	// SPI nB Burst with Wrap
parameter SPI_JEDEC_ID		= 8'h9F;	// Jedec ID Read
parameter SPI_SFDP		= 8'h5A;	// Serial Flash Discoverable Parameters
parameter SPI_WREN		= 8'h06;	// Write Enable
parameter SPI_WRDI		= 8'h04;	// Write Disable
parameter SPI_SE		= 8'h20;	// Sector Erase 4K bytes size
parameter SPI_BE		= 8'hD8;	// Block Erase 64K,32K,8K erase
parameter SPI_CE		= 8'hC7;	// Chip Erase
parameter SPI_PP		= 8'h02;	// Page Program SIO[1] bit used as data in, SIO[0] used as data out
parameter SPI_QUAD_PP		= 8'h32;	// SPI QUAD Page Program
parameter SPI_WRSU		= 8'hB0;	// Suspend Program/Erase
parameter SPI_WRRE		= 8'h30;	// Resume Program/Erase
parameter SPI_RBPR		= 8'h72;	// Read Block Protection Register
parameter SPI_WBPR		= 8'h42;	// Write Block Protection Register
parameter SPI_LBPR		= 8'h8D;	// Lock Down Block Protection Register
parameter SPI_nVWLDR		= 8'hE8;	// Non-Volatile Write Lock down Register
parameter SPI_ULBPR		= 8'h98;	// Global Block Protection Unlock
parameter SPI_RSID		= 8'h88;	// Read Security ID
parameter SPI_PSID		= 8'hA5;	// Program User Security ID Area
parameter SPI_LSID		= 8'h85;	// Lock Out security ID Programing
parameter SPI_DPD		= 8'hB9;	// Enable Deep Power Down mode
parameter SPI_DPD_RST		= 8'hAB;	// Disable Deep Power Down mode; output device ID

//---------------------------------------------------------------------------
// SQI opcodes 
//---------------------------------------------------------------------------
parameter SQI_NOP 		= SPI_NOP;	// NOP command
parameter SQI_RSTEN		= SPI_RSTEN;	// Reset Enable
parameter SQI_RST		= SPI_RST;	// Reset Chip
parameter SQI_RSTQIO		= SPI_RSTQIO;	// Restet QUAD I/O
parameter SQI_RDSR		= SPI_RDSR;	// Read Status Register
parameter SQI_WRSR		= SPI_WRSR;	// Write Status Register
parameter SQI_RDCR		= SPI_RDCR;	// Read Configuration Register
parameter SQI_HS_READ		= SPI_HS_READ;	// High Speed Read of Memory 80Mhz
parameter SQI_SB		= SPI_SB;	// Set Burst Length
parameter SQI_RBSQI		= 8'h0C;	// SQI nB Burst with Wrap
parameter SQI_J_ID		= 8'hAF;	// Quad I/O J-ID Read
parameter SQI_WREN		= SPI_WREN;	// Write Enable
parameter SQI_WRDI		= SPI_WRDI;	// Write Disable
parameter SQI_SE		= SPI_SE;	// Sector Erase 4K bytes size
parameter SQI_BE		= SPI_BE;	// Block Erase 64K,32K,8K erase
parameter SQI_CE		= SPI_CE;	// Chip Erase
parameter SQI_PP		= SPI_PP;	// Page Program SIO[1] bit used as data in, SIO[0] used as data out
parameter SQI_WRSU		= SPI_WRSU;	// Suspend Program/Erase
parameter SQI_WRRE		= SPI_WRRE;	// Resume Program/Erase
parameter SQI_RBPR		= SPI_RBPR;	// Read Block Protection Register
parameter SQI_WBPR		= SPI_WBPR;	// Write Block Protection Register
parameter SQI_LBPR		= SPI_LBPR;	// Lock Down Block Protection Register
parameter SQI_nVWLDR		= SPI_nVWLDR;	// Non-Volatile Write Lock down Register
parameter SQI_ULBPR		= SPI_ULBPR;	// Global Block Protection Unlock
parameter SQI_RSID		= SPI_RSID;	// Read Security ID
parameter SQI_PSID		= SPI_PSID;	// Program User Security ID Area
parameter SQI_LSID		= SPI_LSID;	// Lock Out security ID Programing
parameter SQI_DPD		= SPI_DPD;	// Enable Deep Power Down mode
parameter SQI_DPD_RST		= SPI_DPD_RST;	// Disable Deep Power Down mode; output device ID

`endprotect
//---------------------------------------------------------------------------
// Define Timings
// You can use defparam to change the erase/program times to a shorter value.
// This may make your simulation run faster Tws, Tse, Tbe, Tpp, minimun value 1000,
// Tsce min value 2000
//---------------------------------------------------------------------------
parameter Tv = 5;               // Output valid from SCK falling
parameter Tclz = 0;             // SCK low to low-z output
parameter Tchz = 12.5;          // Chip enable inactive to SIO z-stated
parameter Tse = 25_000_000;     // Sector erase time 25mS
parameter Tbe = 25_000_000;     // Block erase 25mS
parameter Tsce = 50_000_000;    // chip erase time 50mS
parameter Tpp = 1_500_000;      // page program time 1.5mS
parameter Tws = 10_000;         // suspend to ready time 10uS
parameter Tpsid = 200_000;      // Program Security ID time
parameter Tre = 1_000_000;	// reset recovery when reset during program/erase
parameter Trp = 100_000;	// reset recovery when reset during program/erase
parameter Thz = 7.0;		// HOLD falling to SO z-state
parameter Tlz = 7.0;		// HOLD rising to SO not z-state
parameter Tsbr = 10_000;	// recovery from Deep Power Down mode

//---------------------------------------------------------------------------
// Define non-volatile Memory
//---------------------------------------------------------------------------
reg [7:0] memory[Memsize-1:0];          // define Flash Memory array, non-volitable, 1, 2 or 4 Megabytes
reg [7:0] security_id[(Kilo*2)-1:0];	// Define secutity ID Memory addr 0->7 are SST space the rest is user space, non-volitable
reg [7:0] SFDP[(Kilo*2)-1:0];		// serial flash discoverable parameters
reg [PROTECT_REG_MSB:0] wlldr_mem;	// Define write-lock lock down reg, non-volitable, [31:0], [47:0], [79:0]
reg WPEN;				// (bit 7 WPEN) of configuration register, non-volitable
reg SEC;				// (status[5] SEC), 1-bit Lockout Security ID, non-volitable

`protect
//---------------------------------------------------------------------------
// reg/wire definishions
//---------------------------------------------------------------------------
reg [PROTECT_REG_MSB:0] t_wlldr_mem;		// Define temp storage, write-lock lock down reg, non-volitable
reg [PROTECT_REG_MSB:0] protect;		// protection register definishion max size for 32M-bit
wire [PROTECT_REG_MSB:0] protect_or;		// combine protection bits protect | wlldr_mem
wire [7:0] status,config_reg;			// status, configuration  register
wire BUSY;					// status reg bit 0,7 active high busy signal, program or erase in progress
reg RES;					// reserved status bit
reg WPLD;					// Write protection lock down, status bit 4
reg WSP;                                	// Program Suspend status, Status Register
reg WEL;					// status bit 1
reg WSE;					// status bit 2, write suspend erase status, 1= suspend in progress
reg IOC;					// config[1]
reg DPD;
wire BPNV;					// config[3], Block Protection Volatility State
reg PE;						// config[5]
reg EE;						// config[6]
reg RSTEN;					// enable reset command
reg [7:0] pmem[Program_Page_Size-1:0];		// storage for program Memory 256 bytes
reg [7:0] x_pmem[Program_Page_Size-1:0];	// tmp storage for program Memory 256 bytes
reg [7:0] s_pmem[Program_Page_Size-1:0];	// save suspended data here
reg read_slow_flag;				// timing check flag for 40Mhz read
reg [3:0] SIO_IO;                       	// True if outputing data on SIO[3:0]
reg [3:0] SIO_OUT;                      	// output data for SIO
reg [31:0] cnt;					// generic counter for loops
reg clock;                              	// internal SCK
reg [7:0] spi_count,sqi_count;                 	// SPI clock counter
reg [7:0] sqi_cmd,spi_cmd,l_spi_cmd;		// command input storage
reg [7:0] RSTQIO_cmd;				// storage for the SPI RSTQIO command in SQI mode
reg [7:0] l_sqi_cmd;				// latched sqi command
wire suspend_act;                        	// True if in suspend mode
reg SPI_SDIOR_active;				// loop active
reg SPI_SDOR_active;				// loop active
reg SQI_HS_READ_active;				// SQI high speed read loop active
reg SPI_WRSU_active;				// suspend active flag
reg SPI_nVWLDR_active;				// loop active
reg SPI_WRSR_PGM_active;			// used to set busy on config reg program
reg SPI_WRSR_active;				// loop active
reg SPI_LSID_active;				// loop active
reg SPI_PSID_active;				// spi PSID loop active
reg SPI_PSID_ip;				// security programing in progress
reg SPI_RSID_active;				// spi read security id active
reg SPI_DPD_RST_RDID_active;			// loop active
reg erase_active;				// SE,BE,CE erase actice
reg erase_ip;					// SE,BE,CE erase in progress
reg SPI_QUAD_PP_active;				// loop active
reg SPI_RDCR_active;				// loop active
reg SQI_PP_active;				// loop active
reg SPI_PP_active;				// loop active
reg SPI_RBPR_active;				// loop active
reg SPI_WBPR_active;				// loop active flag
reg SPI_nVWLDR_cmd_active;			// loop active
reg SPI_RDSR_active;				// loop active
reg SPI_SFDP_active;				// loop active
reg SPI_JEDEC_ID_active;			// loop active
reg SPI_RBSPI_active;				// loop active flag
reg SPI_SB_active;				// loop active flag
reg SPI_READ_active,SPI_READ_QUAD_active;	// read loop is active ir True
reg SPI_QUAD_IO_READ_active;			// loop active
reg SQI_SPI_mode; 	                     	// True = QUAD mode False=SPI mode
reg [7:0] Mode_Configuration;           	// configuration data for continious read with no opcode
reg [7:0] burst_length;                 	// burst length  00=8bytes, 01=16bytes, 02=32bytes, 03=64bytes
wire WBPR_protection_lck;			// table 2 for WBPR cammond
wire WPb;					// write protect bar signal
reg valid_addr;					// program address valid, address was read in 
reg valid_data;					// program data valid, i.e. at least 1 clock of data
reg [AF_MSB:0] pgm_addr;			// program address 
reg [15:0] pgm_id_addr;				// program security id address 
reg [AF_MSB:0] erase_addr;			// erase address 
reg [31:0] erase_size,resume_size;		// erase size 
reg [AF_MSB:0] suspend_addr,resume_addr;	// save program address on suspend
real start_erase;				// start time of erase or program
real s_time_left;				// save time left for nested suspends
real save_erase_time;				// on suspend save realtime in here
real erase_time;				// time needed to erase sector/block/chip
real time_left;					// time left for program/erase to finish
reg page_program_active;			// page program is active
reg [7:0] wsr_sreg,wsr_creg;			// tmp data storage for write status/configuration registers
wire CONFIG_protection_lck;			// configuration write protect 
wire write_protect;
reg CE_flag,BE_flag,SE_flag;			// erase type flags 
reg s_BE_flag,s_SE_flag;			// flags saved for suspend 
wire HOLDb, HOLDb_IO;				// composit hold control siginals
reg clockx;					// internal clock
reg pgm_sus_reset;

event reset;					// Trigger reset block
event SPI_READ_trg;				// Start spi read operation 50Mhz
event SPI_QUAD_READ_trg;			// Start SPI QUAD read
event SPI_QUAD_IO_READ_trg;			// Start SPI QUAD IO READ	
event SPI_SB_trg;				// Start SPI Set Burst Count
event SPI_RBSPI_trg;				// Start SPI Burst Read
event SPI_JEDEC_ID_trg;				// Start JEDEC_ ID read
event SPI_SFDP_trg;				// start SFDP , Serial Flash Discoverable Parameters
event SPI_RDSR_trg;				// Read Status register
event SPI_WBPR_trg;				// Trigger write block protection register
event SPI_RBPR_trg;				// Read block protection register
event SPI_PP_trg;				// Page program trigger
event SPI_RDCR_trg;				// Start read of Configuration Register
event SPI_QUAD_PP_trg;				// Start SPI QUAD page write
event SPI_SE_trg;				// Start sector erase
event SPI_BE_trg;				// Start block erase
event SPI_CE_trg;				// Start Chip erase
event SPI_RSID_trg;				// Spi read security id
event SPI_PSID_trg;				// Spi program user security id space
event SPI_LSID_trg;				// Security ID lockout
event SPI_DPD_RST_trg;				// Deep Power Down Reset
event SPI_WRSR_trg;				// Write status register
event SPI_nVWLDR_trg;				// Write non-volatile block protection register
event SPI_ULBPR_trg;				// Trigger Global Block Protection Unlock
event SPI_WRSU_trg;				// Enter suspend mode
event SPI_WRRE_trg;				// Exit suspend mode , resume
event SQI_HS_READ_trg;				// SQI high speed read trigger
event SPI_SDOR_trg;				// Spi dual output read
event SPI_SDIOR_trg;				// Dual I/O read
event SPI_LBPR_trg;				// Lock down block protection reg
event SPI_EQIO_trg;				// Enable Quad I/O

//---------------------------------------------------------------------------
// Status/Configuration register definisions, Protection logic
//---------------------------------------------------------------------------
assign status = {BUSY,RES,SEC,WPLD,WSP,WSE,WEL,BUSY};		// create status register
assign config_reg = {WPEN,EE,PE,1'b0,BPNV,1'b0,IOC,1'b0};	// create configuration register
assign BUSY = page_program_active | erase_ip | SPI_LSID_active | SPI_WRSR_PGM_active | SPI_nVWLDR_active
		| pgm_sus_reset;	
assign BPNV = ~(|wlldr_mem);					// block protection volatility state, configuration reg[3]
assign WPb = SIO[2];						// rename SIO[2] to WPb for code clairity
assign protect_or = protect | wlldr_mem;			// combine non-volital protect with volital protect
assign suspend_act = (WSE | WSP);				// suspend active net

//---------------------------------------------------------------------------
// write protection SPI mode configuration reg write only, protection = True
// Check Table 2 lines 2,4,5,6
//---------------------------------------------------------------------------
assign CONFIG_protection_lck = (SQI_SPI_mode===True) ? False : (~WPb & ~IOC & WPEN);

assign write_protect = ~SQI_SPI_mode & ~IOC & WPEN & ~WPb;	
assign WBPR_protection_lck = (SQI_SPI_mode===True) ? WPLD : WPLD | write_protect;

//---------------------------------------------------------------------------
// I/O assignments
//---------------------------------------------------------------------------
assign SIO[0] = (SIO_IO[0]===True && HOLDb_IO===1'b1) ? SIO_OUT[0] : 1'bz;         // output data on SIO ? SI
assign SIO[1] = (SIO_IO[1]===True && HOLDb_IO===1'b1) ? SIO_OUT[1] : 1'bz;         // output data on SIO ? SO
assign SIO[2] = (SIO_IO[2]===True)                    ? SIO_OUT[2] : 1'bz;         // output data on SIO ?
assign SIO[3] = (SIO_IO[3]===True)                    ? SIO_OUT[3] : 1'bz;         // output data on SIO ?

//---------------------------------------------------------------------------
// HOLD# setup
//---------------------------------------------------------------------------
assign HOLDb = CEb | IOC | SIO[3] | SQI_SPI_mode ;	// no timing HOLDb
assign #(Tlz,Thz) HOLDb_IO = HOLDb;			// I/O control timing HOLDb signal

//-------------------------------------------------------
// Generate internal clock
//-------------------------------------------------------
always @(SCK) if(CEb === 1'b0) clockx = SCK;
              else if (CEb === 1'b1 ) clockx = 1'b0;
              else clockx = 1'bx;

always @(posedge clockx) if(HOLDb===1'b1) clock = clockx; else  clock = 1'b0;
always @(negedge clockx) clock = clockx;

//-------------------------------------------------------
// Define begining of command operation
//-------------------------------------------------------
always @( negedge CEb ) begin
	spi_count = 0;			// clear spi clock counter
	sqi_count = 0;			// clear sqi clock counter
	spi_cmd = SPI_NOP;		// clear SPI command register
	sqi_cmd = SQI_NOP;		// clear SQI command register
	RSTQIO_cmd = SPI_NOP;		// clear command
end

//-------------------------------------------------------
// Terminate still runnung named blocks on CEb inactive
//-------------------------------------------------------
always @( posedge CEb ) begin
      	SIO_IO <= #Tchz  {False,False,False,False};    	// Turn off IO control SIO[3:0]
	#0 if(SPI_READ_active==True) begin
		disable SPI_READ_label;
		SPI_READ_active = False;		// read loop is inactive
		read_slow_flag = False;			// set timing checks back to normal
	end
	if(SPI_READ_QUAD_active==True) begin
		disable SPI_QUAD_READ_label;
		SPI_READ_QUAD_active = False;
	end
	if(SPI_QUAD_IO_READ_active===True) begin
		disable SPI_QUAD_IO_READ_label;
		SPI_QUAD_IO_READ_active = False;
	end
	if(SPI_SB_active===True) begin
		disable SPI_SB_label;
		SPI_SB_active = False;
	end
	if(SPI_RBSPI_active===True) begin
		disable SPI_RBSPI_label;
		SPI_RBSPI_active = False;
	end
	if(SPI_JEDEC_ID_active===True) begin
		disable SPI_JEDEC_ID_label;
		SPI_JEDEC_ID_active = False;
	end
	if(SPI_SFDP_active===True) begin
		disable SPI_SFDP_label;
		SPI_SFDP_active = False;
	end
	if(SPI_RDSR_active===True) begin
		disable SPI_RDSR_label;
		SPI_RDSR_active = False;
	end
	if(SPI_RDCR_active===True) begin
		disable SPI_RDCR_label;
		SPI_RDCR_active = False;
	end
	if(SPI_RBPR_active===True) begin
		disable SPI_RBPR_label;
		SPI_RBPR_active = False;
	end
	if(SPI_RSID_active ===True) begin
		disable SPI_RSID_label;
		SPI_RSID_active = False;
	end
	if(SPI_WBPR_active ===True) begin
		disable SPI_WBPR_label;
		SPI_WBPR_active = False;
	end
	if(SQI_HS_READ_active===True) begin
		disable SQI_HS_READ_label;
		SQI_HS_READ_active = False;
	end
	if(SPI_SDOR_active===True) begin
		disable SPI_SDOR_label;
		SPI_SDOR_active = False;
	end
	if(SPI_SDIOR_active ===True) begin
		disable SPI_SDIOR_label;
		SPI_SDIOR_active = False;
	end
	if(SPI_DPD_RST_RDID_active ===True) begin
		disable SPI_DPD_RST_RDID_label;
		SPI_DPD_RST_RDID_active = False;
	end
end

//-----------------------------------------------------------
// Read in hex command stream,  SQI mode commands
//-----------------------------------------------------------
always @( posedge clock && SQI_SPI_mode === True) begin
	if(BUSY===False && Mode_Configuration[7:4]===4'hA && sqi_count===8'h00) begin			// continue sqi_hs_read command ?
		sqi_count = 8;										// abort this command loop
		-> SQI_HS_READ_trg;									// continue from previous read
		#1 Mode_Configuration = 8'hFF;								// clear mode config
	end
	if(sqi_count < 2 ) begin									// 1st 2 clocks are command
		sqi_cmd = sqi_cmd <<4;									// shift command data
		sqi_cmd[3:0] = SIO[3:0];								// load in cmd data
	end
	if(sqi_count < 8 ) begin									// look for SPI RSTIO cmd
		RSTQIO_cmd = RSTQIO_cmd <<1;								// shift command data
		RSTQIO_cmd[0] = SIO[0];									// load in cmd data
		if(BUSY===False && sqi_count===8'h07 && RSTQIO_cmd===SPI_RSTQIO)
			@(posedge CEb) SQI_SPI_mode=False;						// exit SQI mode while in SQI mode using SPI format
	end
	if(sqi_count === 8'h01) begin									// start of SQI command interperter
	   l_sqi_cmd = sqi_cmd;										// latch SQI command
	   if(DPD===False && RSTEN===True && l_sqi_cmd !== SQI_RST) RSTEN = False;					// clear reset enable on incorrect sequence
	   if(DPD===False && l_sqi_cmd === SQI_RSTEN)  RSTEN = True;		    					// enable reset command
	   else if(DPD===False && l_sqi_cmd===SQI_RST && RSTEN===True)	@(posedge CEb)	-> reset;		// reset chip
	   else if(DPD===False && l_sqi_cmd===SQI_NOP )					RSTEN=False;		// NOP command
	   else if(DPD===False && l_sqi_cmd===SQI_RDSR)					-> SPI_RDSR_trg;	// SQI read status register
	   else if(DPD===False && l_sqi_cmd===SQI_RDCR)					-> SPI_RDCR_trg;	// SQI read configuration register
	   else if(DPD===False && BUSY===True  && l_sqi_cmd===SQI_WRSU)			-> SPI_WRSU_trg;	// Enter suspend mode
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_RSTQIO) @(posedge CEb) SQI_SPI_mode=False;	// Reset to SPI mode
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_WREN)	@(posedge CEb)	WEL = True;		// Write Enable flag set
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_WRDI)	@(posedge CEb)	WEL = False;		// Write Enable flag cleared
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_WRRE )		-> SPI_WRRE_trg;	// exit suspend mode resume normal mode
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_RBPR)			-> SPI_RBPR_trg;	// Read Block Protection Register
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_HS_READ)		-> SQI_HS_READ_trg;   	// normal read, 80Mhz
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_SB)			-> SPI_SB_trg;		// Set Burst Count
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_RBSQI)		-> SPI_RBSPI_trg;	// sqi nB Burst with Wrap
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_J_ID)			-> SPI_JEDEC_ID_trg; 	// Read JEDEC ID
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_RSID)			-> SPI_RSID_trg;	// Read security ID
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_CE     && WEL===True)	-> SPI_CE_trg;		// Chip erase
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_SE     && WEL===True)	-> SPI_SE_trg;		// Sector erase
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_BE     && WEL===True)	-> SPI_BE_trg;		// Block erase
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_LBPR   && WEL===True)	-> SPI_LBPR_trg;	// Lock Down Block Protection Reg.
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_ULBPR  && WEL===True)	-> SPI_ULBPR_trg;	// Global Block Protection Unlock
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_LSID   && WEL===True)	-> SPI_LSID_trg;	// lockout security ID programing
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_WRSR   && WEL===True)	-> SPI_WRSR_trg;	// Write status register
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_PP     && WEL===True)	-> SPI_QUAD_PP_trg;	// SQI page program
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_WBPR   && WEL===True)	-> SPI_WBPR_trg;	// Write Block Protection Register
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_nVWLDR && WEL===True)	-> SPI_nVWLDR_trg;	// write non-volatile block protection register
	   else if(DPD===False && BUSY===False && l_sqi_cmd===SQI_PSID   && WEL===True)	-> SPI_PSID_trg;	// program Security ID space 2K
	   else if(BUSY===False && l_sqi_cmd===SQI_DPD)	  		 @(posedge CEb)	DPD = True;		// deep power down mode
	   else if(BUSY===False && l_sqi_cmd===SQI_DPD_RST)				-> SPI_DPD_RST_trg;	// exit deep power down mode
	   else begin
		   if({l_sqi_cmd[7],l_sqi_cmd[3]}!== 2'b11)					// check for start of SPI RSTQIO cmd
		      $display("\t%m Warning Illegal SQI Instruction='%h' aborted, time=%0.2f",l_sqi_cmd,$realtime);
		      if(BUSY===True) $display("\t%m Check BUSY most commands don't run during busy");
	   end
	end
	if( sqi_count < 9 ) sqi_count = sqi_count + 1;				              		// incremint bit counter for command sample
end

//-----------------------------------------------------------
// Read in serial command stream command,  SPI mode commands
//-----------------------------------------------------------
always @( posedge clock && SQI_SPI_mode === False ) begin
	if(BUSY===False && Mode_Configuration[7:4]===4'hA && spi_count===8'h00) begin			// continue previous command ?
		spi_count = 8;										// abort command loop
		if(l_spi_cmd === SPI_QUAD_IO_READ) -> SPI_QUAD_IO_READ_trg;				// continue from previous read, quad read
		else if(l_spi_cmd === SPI_SDIOR)   -> SPI_SDIOR_trg;					// continue from previous read, dual read
		Mode_Configuration <= #1 8'hFF;								// clear mode config
	end
	if(spi_count < 8 ) begin									// 1st 8 clocks are command
		spi_cmd = spi_cmd <<1;									// shift command data
		spi_cmd[0] = SIO[0];									// load in cmd data
	end
	if( spi_count === 8'h07) begin									// start of SPI command interperter
		l_spi_cmd = spi_cmd;                                                    		// latch command
		if(DPD===False && RSTEN===True && l_spi_cmd !== SPI_RST) RSTEN = False;				// clear reset enable on incorrect sequence

		if(DPD===False && l_spi_cmd === SPI_RSTEN)  RSTEN = True;		    				// enable reset command
		else if(DPD===False && l_spi_cmd===SPI_NOP ) RSTEN=False;						// NOP command
		else if(DPD===False && l_spi_cmd===SPI_RST && RSTEN===True)	@(posedge CEb)	-> reset;		// reset command
		else if(DPD===False && l_spi_cmd===SPI_RDSR)					-> SPI_RDSR_trg;		// SPI read status register
		else if(DPD===False && l_spi_cmd===SPI_RDCR)					-> SPI_RDCR_trg;		// SPI read configuration register
		else if(DPD===False && BUSY===True  && l_spi_cmd===SPI_WRSU)			-> SPI_WRSU_trg;		// Enter suspend mode
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_READ)			-> SPI_READ_trg;        	// normal read, 50Mhz
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_HS_READ)			-> SPI_READ_trg;		// normal read, 80Mhz
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_RSTQIO)	@(posedge CEb)	SQI_SPI_mode=False;	// This cmd does nothing as already in SPI mode
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_WREN)	@(posedge CEb)	WEL = True;		// Write Enable flag set
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_WRDI)	@(posedge CEb)	WEL = False;		// Write Enable flag cleared
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_SDOR)			-> SPI_SDOR_trg;		// dual output read
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_SDIOR)			-> SPI_SDIOR_trg;	// dual I/O output read
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_QUAD_READ)		-> SPI_QUAD_READ_trg;	// SPI QUAD read
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_QUAD_IO_READ)		-> SPI_QUAD_IO_READ_trg;	// SPI QUAD IO READ
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_RBSPI)			-> SPI_RBSPI_trg;	// SPI Burst read
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_EQIO )			-> SPI_EQIO_trg;		// enter SQI mode
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_JEDEC_ID)		-> SPI_JEDEC_ID_trg;	// Read JEDEC ID
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_RBPR)			-> SPI_RBPR_trg;		// Read Block Protection Register
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_SFDP)			-> SPI_SFDP_trg;		// Read Serial Flash Discoverable Parameters
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_RSID)			-> SPI_RSID_trg;		// SPI Read security ID
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_SB)			-> SPI_SB_trg;		// SPI Set Burst Count
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_WRRE)			-> SPI_WRRE_trg;		// exit suspend mode resume normal mode
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_QUAD_PP && WEL===True)	-> SPI_QUAD_PP_trg;	// SPI QUAD page program
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_ULBPR   && WEL===True)	-> SPI_ULBPR_trg;	// Global Block Protection Unlock
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_nVWLDR  && WEL===True)	-> SPI_nVWLDR_trg;	// write non-volatile block protection register
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_WRSR    && WEL===True)	-> SPI_WRSR_trg;		// Write status register
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_LSID    && WEL===True)	-> SPI_LSID_trg;		// lockout security ID programing
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_PP      && WEL===True)	-> SPI_PP_trg;		// SPI page program
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_WBPR    && WEL===True)	-> SPI_WBPR_trg;		// Write Block Protection Register
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_SE      && WEL===True)	-> SPI_SE_trg;		// Sector erase
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_BE      && WEL===True)	-> SPI_BE_trg;		// Block erase
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_CE      && WEL===True)	-> SPI_CE_trg;		// Chip erase
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_PSID    && WEL===True)	-> SPI_PSID_trg;		// program Security ID space 2K
		else if(DPD===False && BUSY===False && l_spi_cmd===SPI_LBPR    && WEL===True)	-> SPI_LBPR_trg;		// Lock Down Block Protection Reg.
	  	else if(BUSY===False && l_spi_cmd===SPI_DPD)			@(posedge CEb)	DPD = True;		// deep power down mode
		else if(BUSY===False && l_spi_cmd===SPI_DPD_RST)				-> SPI_DPD_RST_trg;	// exit deep power down mode
	        else begin
			$display("\t%m Warning Illegal SPI Instruction='%h' aborted, time=%0.2f",l_spi_cmd,$realtime);
			if(BUSY===True) $display("\t%m Check BUSY most commands not allowed during busy");
		end
	end
	if( spi_count < 9 ) spi_count = spi_count + 1;				              		// incremint bit counter for command sample
end

//---------------------------------------------------------------------------
// Enter SQI mode
//---------------------------------------------------------------------------
always @(SPI_EQIO_trg) begin
	@(posedge CEb)
	if (~write_protect) SQI_SPI_mode = True;
end

//---------------------------------------------------------------------------
// Lock Down Block Protection Reg.
//---------------------------------------------------------------------------
always @(SPI_LBPR_trg) begin
	@(posedge CEb) begin
		WPLD = True;	// set WPLD (write protection lock down status[4])
		WEL = False;	// clear status[2] WEL
	end
end

//---------------------------------------------------------------------------
// Resume, exit suspend mode
//---------------------------------------------------------------------------
always @(SPI_WRRE_trg) begin :SPI_WRRE_label
reg [8:0] pcount;
	if(suspend_act===False) $display("\t%m Warning WRRE(h30) cmd ignnored not in suspend mode, time=%0.2f",$realtime);
	else begin							// suspend_act===True
		if(WSP === True) begin					// resume from Page program ?
			WSP = False;					// clear program suspend flag
			page_program_active = True;			// flags needed to continue PP program 
			valid_data = True; valid_addr = True;		// flags needed to continue PP program
			SPI_PP_active = True;				// flags needed to continue PP program
			time_left = s_time_left;			// program time left
			pgm_addr = resume_addr;				// restort program address
			for(pcount=0;pcount<Program_Page_Size;pcount = pcount+1) pmem[pcount] = s_pmem[pcount];	// restore suspended program data
		end
		else if(WSE===True) begin				// Erase Suspended ?
			erase_active = True;				// restart erase on CEb inactive
			WSE = False;					// clear erase suspend flag
			valid_addr = True;				// set resume address as valid
			valid_data = True;				// set resume data as valid
			erase_addr = resume_addr;			// restore address
			erase_size = resume_size;			// restore size of erase area
			time_left = s_time_left;			// erase time left
			BE_flag = s_BE_flag;				// restore type of erase
			SE_flag = s_SE_flag;				// restore type of erase
		end
		@(posedge CEb) ;					// wait for CEb to go inactive, starts erase/program loops
	end
end

//---------------------------------------------------------------------------
// enter suspend mode, WEL=1 already to get here
//---------------------------------------------------------------------------
always @(SPI_WRSU_trg) begin :SPI_WRSU_label
reg [8:0] pcount;
	@(posedge CEb) ;					// wait for CEb to go inactive
	#0 if((page_program_active === False && erase_ip === False) || SPI_PSID_ip===True ) begin
		$display("\t%m Warning Write Suspend(hB0), only allowed during PP(h32),PP(h02),BE(hD8),SE(h20) cmds, cmd aborted time=%0.2f",$realtime);
	end
	else if(CE_flag===True)  begin				// no suspend during chip erase
		$display("\t%m Warning Write Suspend(hB0), not allowed during CE(hC7) cmd, cmd aborted time=%0.2f",$realtime);
	end
	else if(suspend_act===True) begin
		$display("\t%m Warning Write Suspend(hB0), nested suspends not allowed, WRSU(hB0) cmd aborted time=%0.2f",$realtime);
	end
	else begin						// begin Suspend mode
		SPI_WRSU_active = True;				// this loop is active
		if(page_program_active === True) begin
			disable page_program_label;		// abort programing on suspend
			s_time_left = (time_left - ($realtime - start_erase)) + Tws;
			resume_addr = suspend_addr;		// save suspended address
			for(pcount=0;pcount<Program_Page_Size;pcount = pcount+1) s_pmem[pcount] = pmem[pcount];	// save suspended data program data
			WSP = True;				// set WSE in status register
			#Tws ;					// wait for suspend program complete
			page_program_active = False;		// clear busy
			WEL = False;				// clear WEL write enable
		end
		else if( erase_ip === True) begin		// Sector/Block erase in progress ?
			disable erase_label;			// abort erase on suspend
			s_time_left = (time_left - ($realtime - start_erase)) + Tws;
			resume_addr = suspend_addr;		// save suspended address
			resume_size = erase_size;		// save block size to erase 
			WSE = True;				// set WSE in status register
			#Tws ;					// wait for suspend of erase complete
			erase_ip = False;			// clear erase loop flag;
			WEL = False;
			s_BE_flag = BE_flag;			// save type of erase
			s_SE_flag = SE_flag;			// save type of erase
			BE_flag = False;
			SE_flag = False;
		end
		SPI_WRSU_active = False;			// this loop is inactive
	end
end

//---------------------------------------------------------------------------
// Global Block Protection Unlock
//---------------------------------------------------------------------------
always @(SPI_ULBPR_trg) begin :SPI_ULBPR_label
reg [7:0] count;				// counter
	@(posedge CEb) begin
		if(WBPR_protection_lck === False) begin		// check block protect lock down register

			// clear the block write protection
			for(count=0;count<(PROTECT_REG_MSB-15);count=count+1) protect[count]=1'b0;
	
			// clear the 8 8K block write protection bits
			count = PROTECT_REG_MSB-15;
			repeat(8) begin protect[count] = 1'b0; count = count + 2; end
			WEL = False;				// clear write enable in status reg
		end
		else begin
			$display("\t%m Warning ULBPR(h98) cmd aborted time=%0.2f",$realtime);
		end
	end
end

//---------------------------------------------------------------------------
// program status/configuration register
//---------------------------------------------------------------------------
always @(posedge CEb) begin : SPI_WRSR_PGM
	if(SPI_WRSR_active===True && suspend_act===False) begin
		disable SPI_WRSR_label;
		SPI_WRSR_active = False;
		if(valid_data===True) begin		// 16 clocks of data ?
			IOC = wsr_creg[1];		// set IOC right away, don't wait for program to finish
			if(wsr_creg[7]!==WPEN) begin	// WPEN <- 0
				SPI_WRSR_PGM_active = True;	// set busy
				if(wsr_creg[7]===False) begin	// WPEN <- 0
					#Tse WPEN = wsr_creg[7];// program WPEN
				end
				else begin			// WPEN <- 1
					#Tpp WPEN = wsr_creg[7];// Erase WPEN
				end
			end
			WEL = False;			// clear WEL
			valid_data = False;		// clear valid data flag
			SPI_WRSR_PGM_active = False;	// clear busy
		end
		else $display("\t%m Warning WRSR(h01) has invalid data, cmd aborted, time=%0.2f",$realtime);
	end
end

//---------------------------------------------------------------------------
// write status register
//---------------------------------------------------------------------------
always @(SPI_WRSR_trg) begin :SPI_WRSR_label
	if(suspend_act===False && CONFIG_protection_lck===False) begin
		SPI_WRSR_active = True;
		valid_data = False;					// default valid data
		if(SQI_SPI_mode === True) begin				// SQI bus
			$display("\t%m Warning do not run cmd WRSR(h01) in SQI mode time=%0.2f",$realtime);
			@(posedge clock) wsr_sreg[7:4] = SIO[3:0];	// read in status register
			@(posedge clock) wsr_sreg[3:0] = SIO[3:0];
			@(posedge clock) wsr_creg[7:4] = SIO[3:0];	// read in configuration register
			@(posedge clock) wsr_creg[3:0] = SIO[3:0];
		end
		else begin						// SPI bus
			repeat(8) @(posedge clock ) begin		// read in status register
				wsr_sreg = wsr_sreg <<1;
				wsr_sreg[0] = SIO[0];
			end
			repeat(8) @(posedge clock ) begin		// read in configuration register
				wsr_creg = wsr_creg <<1;
				wsr_creg[0] = SIO[0];
			end
		end
		valid_data = True;					// set valid data flag
		forever @(posedge clock ) ;				// wait here for CEb rising
	end
	else begin
		if(CONFIG_protection_lck===True) begin
		  $display("\t%m Warning command WRSR('h01) aborted, configuration reg write protected time=%0.2f",$realtime);
		end
		if(suspend_act===True ) begin
		  $display("\t%m Warning command WRSR('h01) aborted, not a valid cmd is suspend mode, time=%0.2f",$realtime);
		end
		valid_data = False;			// default valid data
		SPI_WRSR_active = False;
	end
end

//---------------------------------------------------------------------------
// Security ID program, lockout
//---------------------------------------------------------------------------
always @(SPI_LSID_trg) begin :SPI_LSID_label
	@(posedge CEb) begin
		if(suspend_act===False) begin
			SPI_LSID_active = True;			// set busy
			SEC = True;			// program SEC bit of status register
			#Tpsid
			WEL = False;				// clear write enable in status reg
			SPI_LSID_active = False;		// clear busy
		end
		else begin
			$display("\t%m Warning command LSID(h85) not allowed in suspend mode, aborted time=%0.2f",$realtime);
		end
	end
end

//---------------------------------------------------------------------------
// Security ID program, Program Security ID Memory when CEb inactive ?
//---------------------------------------------------------------------------
always @(posedge CEb) begin :Sec_ID_pgm_label
reg [AF_MSB:0] nn;
	if(SPI_PSID_active === True && suspend_act===False ) begin		// Page_Program of Security ID is active
		disable SPI_PSID_label;						// disable Security ID page program loop
		SPI_PSID_active = False;					// clear program loop
		if(valid_data===True && valid_addr===True && suspend_act===False) begin
			page_program_active = True;				// set busy
			valid_addr = False;					// default valid address
			valid_data = False;					// default valid data
			for(nn=0;nn<Program_Page_Size;nn=nn+1) begin		// save current data in Memory
			   x_pmem[nn]=security_id[{pgm_id_addr[10:8],nn[7:0]}];	// save security_id data that will be written over
			   security_id[{pgm_id_addr[10:8],nn[7:0]}] = 8'hxx;	// make data 'xx'
			end
			SPI_PSID_ip = True;					// security programing in progress
			#Tpp for(nn=0;nn<Program_Page_Size;nn=nn+1) begin	// Wait Tpp time for program to finish, then update memory
				security_id[{pgm_id_addr[10:8],nn[7:0]}] = x_pmem[nn] & pmem[nn[7:0]];
			//$display("\tprogram security_id add=%h, data=%h time=%0.2f",{pgm_id_addr[ADDR_MSB:8],nn[7:0]},(x_pmem[nn] & pmem[nn[7:0]]),
				//$realtime);
			end
			SPI_PSID_ip = False;					// security programing complete
			page_program_active = False;				// clear busy
			WEL = False;
		end
		else begin
			$display("\t%m Warning PSID(hA5) Page Program error, PSID(hA5) cmd aborted time=%0.2f",$realtime);
		end
	end
end

//---------------------------------------------------------------------------
// Program Security ID , get address and data
//---------------------------------------------------------------------------
always @(SPI_PSID_trg) begin : SPI_PSID_label
reg [8:0] pcount;
reg [7:0] sdata;

	valid_addr = False;						// default valid address
	valid_data = False;						// default valid data
	if(suspend_act === False) begin					// check WREN flag, no program on suspend active
		SPI_PSID_active = True;					// program loop is active
		for(pcount=0;pcount<Program_Page_Size;pcount = pcount+1) pmem[pcount] = 8'hFF;  // clear program data to all 1's

		if(SQI_SPI_mode === True) begin
			repeat(4) begin						// read in address, set valid address flag when complete
				pgm_id_addr = pgm_id_addr <<4;
				@(posedge clock) pgm_id_addr[3:0]=SIO[3:0];	// read in 1-nibble of address
			end
		end
		else begin
			repeat(16) begin					// read in address, set valid address flag when complete
				pgm_id_addr = pgm_id_addr <<1;
				@(posedge clock) pgm_id_addr[0] = SIO[0];	// read in 1-bit of address
			end
		end
		pgm_id_addr = pgm_id_addr & ((Kilo*2)-1);			// clear unused upper address bits above 2K memory boundry
		valid_addr = True;						// address read complete set valid address flag
		if(SEC===False) begin						// check for proteced Memory
			valid_data = False;					// no data valid
			forever begin						// Read program data, loop through all data abort on CEb rising
				if(SQI_SPI_mode === True) begin			// SQI mode
					@(posedge clock) sdata[7:4]=SIO[3:0];	// read high nibble
					valid_data = True;			// at least 1 valid data clock
					@(posedge clock) sdata[3:0]=SIO[3:0];	// read low nibble
				end
				else begin					// SPI mode
					repeat(8) @(posedge clock) begin	// read in byte of data
						valid_data = True;		// at least 1 valid data clock
						sdata = sdata <<1;
						sdata[0] = SIO[0];
					end
				end
				if(pgm_id_addr >= 'h0008) begin			// don't program SST Memory section
					pmem[pgm_id_addr[7:0]] = sdata;		// save byte of data page Memory
				end
				pgm_id_addr[7:0]=pgm_id_addr[7:0] + 1;		// increment to next addr of page Memory, wrap on 256 byte bountry
			end
		end
		else begin							// protected Memory abort program
			valid_addr = False;					// default valid address
			valid_data = False;					// default valid data
			SPI_PSID_active = False;				// abort program on protected Memory
			$display("\t%m Warning PSID(hA5) command aborted SEC=1 Locked Memory address=%h, time %0.2f",
			pgm_id_addr,$realtime);
		end
		SPI_PSID_active = False;
	end
	else begin
			$display("\t%m Warning PSID(hA5) command aborted, PSID does not work in Suspend Mode, time=%0.2f",$realtime);
	end
end


//----------------------------------------------------------------------------
// SPI Mode Read Security ID space
//----------------------------------------------------------------------------
always @(SPI_RSID_trg ) begin :SPI_RSID_label
reg [7:0] data;
reg [15:0] addr;		// max value 2K-1
	SPI_RSID_active = True;
	if(SQI_SPI_mode === True) begin					// SQI mode
		// read in address[15:0]
       		@(posedge clock) addr[15:12] = SIO[3:0];
       		@(posedge clock) addr[11:8]  = SIO[3:0];
       		@(posedge clock) addr[7:4]   = SIO[3:0];
       		@(posedge clock) addr[3:0]   = SIO[3:0];
		repeat(6) @(posedge clock) ;				// 3 dummy cycles
		forever begin						// output SQI nibble data
			data = security_id[addr[10:0]];			// read from RSID Memory, limit to 2K address range
			addr[10:0] = addr[10:0] + 1;			// increment address, wrap at 2k boundry
			@(negedge clock) begin
				SIO_IO <= #Tclz  {True,True,True,True};	// Set I/O controls
				#Tv SIO_OUT[3:0] = data[7:4];		// send high nibble
			end
			@(negedge clock)
				#Tv SIO_OUT[3:0] = data[3:0];		// send low nibble
		end
	end
	else begin							// SPI mode
		repeat(16) begin
        		@(posedge clock)  begin                         // wait for clk rising
                        	addr = addr <<1;                        // shift left address
                        	addr[0] = SIO[0];                       // read in address bit
                	end
        	end
		repeat(8) @(posedge clock) ;				// dummy cycle
		forever begin						// output SPI serial data
			data = security_id[addr[10:0]];			// read from RSID Memory, limit to 2K address range
			addr[10:0] = addr[10:0] + 1;			// increment address, wrap at 2k boundry
			repeat(8) begin
				@(negedge clock) ;			// wait here for clock falling
 				SIO_IO <= #Tclz {False,False,True,False}; // Turn on IO control SIO[1]
				#Tv SIO_OUT[1] = data[7];		// output 1 bit data
				data = data <<1;			// shift data left
			end
		end
	end
	SPI_RSID_active = False;
end



//---------------------------------------------------------------------------
// erase Memory when CEb inactive ?
//---------------------------------------------------------------------------
always @(posedge CEb) begin :erase_label
reg [31:0] nn;
	if(erase_active === True) begin
		erase_ip = True;						// set erase in progress flag
		erase_active = False;
		disable erase_setup_label;
		if(valid_addr === True ) begin					// check valid address and WSE
			suspend_addr = erase_addr;				// save erase address for possible suspend
			start_erase = $realtime;				// save time of program/erase start
			for(nn=erase_addr;nn<(erase_addr+erase_size);nn=nn+8) begin	// make unknown
				memory[nn[ADDR_MSB:0]+0] = 8'hxx; memory[nn[ADDR_MSB:0]+1] = 8'hxx;
				memory[nn[ADDR_MSB:0]+2] = 8'hxx; memory[nn[ADDR_MSB:0]+3] = 8'hxx;
				memory[nn[ADDR_MSB:0]+4] = 8'hxx; memory[nn[ADDR_MSB:0]+5] = 8'hxx;
				memory[nn[ADDR_MSB:0]+6] = 8'hxx; memory[nn[ADDR_MSB:0]+7] = 8'hxx;
			end
			#time_left for(nn=erase_addr;nn<(erase_addr+erase_size);nn=nn+8) begin	// make known at completion of erase
				memory[nn[ADDR_MSB:0]+0]=8'hFF; memory[nn[ADDR_MSB:0]+1]=8'hFF;
				memory[nn[ADDR_MSB:0]+2]=8'hFF; memory[nn[ADDR_MSB:0]+3]=8'hFF;
				memory[nn[ADDR_MSB:0]+4]=8'hFF; memory[nn[ADDR_MSB:0]+5]=8'hFF;
				memory[nn[ADDR_MSB:0]+6]=8'hFF; memory[nn[ADDR_MSB:0]+7]=8'hFF;
				WEL = False;
			end
		end
		else if(valid_addr === False) begin
			$display("\t%m Warning erase address error, erase cmd aborted time=%0.2f",$realtime);
		end
		CE_flag = False; BE_flag = False; SE_flag = False;
		erase_ip = False;
	end
end
//---------------------------------------------------------------------------
// Erase SE,BE,CE Memory
//---------------------------------------------------------------------------
always @(SPI_SE_trg or SPI_BE_trg or SPI_CE_trg) begin :erase_setup_label
	if(WEL === True && WSE === False) begin 					// check no suspend of sector/block
		erase_active = True;							// erase loop is active
		valid_addr = False;							// default valid address as bad
		if(l_spi_cmd===SPI_CE || l_sqi_cmd===SQI_CE) begin			// chip erase
			CE_flag = True; BE_flag=False; SE_flag=False;			// set erase type
			time_left = Tsce;						// erase time
			erase_addr = 0;							// chip erase address starts at 0
			erase_time = Tsce;
			erase_size = Memsize;
			if(Chip_proT(erase_addr)===False && suspend_act===False) begin	// check protected areas
				valid_addr = True;					// set address as valid
			end
			else begin
				$display("\t%m Warning chip erase error, trying to erase protected Memory cmd aborted time=%0.2f",$realtime);
				valid_addr = False;
			end
		end
		else begin								// read in 24 bit address
			if(SQI_SPI_mode === False) begin				// SPI
				repeat(24) begin					// read in address, set valid address flag when complete
					erase_addr = erase_addr <<1;
					@(posedge clock) erase_addr[0] = SIO[0];

				end
			end
			else begin							// SQI
				repeat(6) begin						// read in address, set valid address flag when complete
					erase_addr = erase_addr <<4;
					@(posedge clock) erase_addr[3:0] = SIO[3:0];
				end
			end
			if(Write_proT(erase_addr)===False && PGM_ERASE(erase_addr,resume_addr)===False) valid_addr = True;
			else begin
				$display("\t%m Warning erase error, trying to erase protected Memory cmd aborted time=%0.2f",
				$realtime);
				valid_addr = False;
			end
		end
		erase_addr = erase_addr & (Memsize-1);			// clear unused upper address bits if address is greater tham memory size

		if(l_spi_cmd===SPI_SE || l_sqi_cmd===SQI_SE) begin	// Sector Erase ?
			time_left = Tse;				// time left to program
			SE_flag=True; BE_flag=False; CE_flag = False;	// set erase flag for SE
			erase_size = Sector_Size;			// set erase size
			erase_addr[Sector_MSB:0] = 0;			// clear unused lower address bits to 0
		end
		else if(l_spi_cmd===SPI_BE || l_sqi_cmd===SQI_BE)  begin// Block erase ?
			BE_flag=True; SE_flag=False; CE_flag = False;	// set erase flag for BE
			time_left = Tbe;				// time left to program
									// set block size, clear unused lower address bits to 0
			if(erase_addr < (Kilo * 32))                 begin erase_size=Block_08k; erase_addr[Block08k_MSB:0]=0; end
			else if(erase_addr < (Kilo * 64))            begin erase_size=Block_32k; erase_addr[Block32k_MSB:0]=0; end
			else if(erase_addr >= (Memsize-(Kilo * 32))) begin erase_size=Block_08k; erase_addr[Block08k_MSB:0]=0; end
			else if(erase_addr >= Memsize-(Kilo * 64))   begin erase_size=Block_32k; erase_addr[Block32k_MSB:0]=0; end
			else 					     begin erase_size=Block_64k; erase_addr[Block64k_MSB:0]=0; end
		end
		forever @(posedge clock) ;						// wait here for CEb to become inactice
	
		erase_active = False;							// erase loop is active
	end
	else begin
		$display("\t%m Warning erase error,nested erase not allowed in suspend mode, cmd aborted time=%0.2f",$realtime);
	end
end

//---------------------------------------------------------------------------
// page program Memory when CEb inactive ?
//---------------------------------------------------------------------------
always @(posedge CEb) begin :page_program_label
reg [AF_MSB:0] nn;
	if(SPI_PP_active === True || SPI_QUAD_PP_active === True) begin		// Page_Program is active
		if(SPI_PP_active === True) begin				// Page_Program_label is active
			disable SPI_PP_label;					// disable page program loop
			SPI_PP_active = False;					// clear program loop
		end
		else if(SPI_QUAD_PP_active === True) begin			// Page_Program_label is active
			disable SPI_QUAD_PP_label;				// disable page program loop
			SPI_QUAD_PP_active = False;				// clear program loop
		end
		if(valid_data===True && valid_addr===True ) begin
			page_program_active = True;				// set busy
			valid_addr = False;					// default valid address
			valid_data = False;					// default valid data
			suspend_addr = {pgm_addr[ADDR_MSB:8],8'h00};		// save program address for possible suspend
			start_erase = $realtime;				// save time of program/erase start
			if (time_left == Tpp) begin
				for(nn=0;nn<Program_Page_Size;nn=nn+1) begin		// save current data in Memory
				   x_pmem[nn] = memory[{pgm_addr[ADDR_MSB:8],nn[7:0]}];	// save Memory data that will be written over
				   memory[{pgm_addr[ADDR_MSB:8],nn[7:0]}] = 8'hxx;	// make data 'xx'
				end
			end
			#time_left for(nn=0;nn<Program_Page_Size;nn=nn+1) begin
				memory[{pgm_addr[ADDR_MSB:8],nn[7:0]}] = x_pmem[nn] & pmem[nn[7:0]];
			//$display("\tprogram Memory add=%h, data=%h time=%0.2f",{pgm_addr[ADDR_MSB:8],nn[7:0]},(x_pmem[nn] & pmem[nn[7:0]]),$realtime);
			//$display("\tnn=%h, nn[7:0]=%h, x_pmem[nn]=%h, pmem[nn[7:0]]=%h time=%0.2f",nn,nn[7:0],x_pmem[nn], pmem[nn[7:0]],$realtime);
			end
			page_program_active = False;				// clear busy
			WEL = False;
		end
		else begin
			$display("\t%m Warning Page Program error, PP(h02)/PP(h32) cmd aborted time=%0.2f",$realtime);
		end
	end
end

//---------------------------------------------------------------------------
// QUAD Page program read in address, data, place program data into pgm_addr array
// When CEb goes high program loop is called using pgm_addr and pmem
//---------------------------------------------------------------------------
always @(SPI_QUAD_PP_trg) begin : SPI_QUAD_PP_label
reg [8:0] pcount;
reg [7:0] sdata;
	if((IOC === False) && (SQI_SPI_mode === False)) $display("\t%m Warning SPI QUAD PAGE READ(h32) command aborted when IOC=0 time=%0.2f",$realtime);
	else begin
		valid_addr = False;						// default valid address
		valid_data = False;						// default valid data
		if(WEL === True && WSP === False) begin				// check WSP flag, no program on program suspend active
			SPI_QUAD_PP_active = True;				// program loop is active
			time_left = Tpp;					// time left to program
			for(pcount=0;pcount<Program_Page_Size;pcount = pcount+1) pmem[pcount] = 8'hFF;  // clear program data to all 1's
	
			repeat(6) begin						// read in address, set valid address flag when complete
				pgm_addr = pgm_addr <<4;
				@(posedge clock) pgm_addr[3:0] = SIO[3:0];
			end
			pgm_addr = pgm_addr & (Memsize-1);			// clear upper unused address bits
			valid_addr = True;					// address read complete set valid address flag
			if(Write_proT(pgm_addr)===False && ERASE_PGM(resume_addr,pgm_addr)===False) begin	// check for proteced Memory
				valid_data = False;				// no data valid
				forever begin					// Read program data, loop through all data abort on CEb rising
					repeat(2) @(posedge clock ) begin	// read in byte of data
							valid_data = True;	// at least 1 data clock
							sdata = sdata <<4;
							sdata[3:0] = SIO[3:0];	// read data as nibbles
					end
					pmem[pgm_addr[7:0]] = sdata;		// save byte of page data
					pgm_addr[7:0] = pgm_addr[7:0] + 1;	// increment to next addr of page Memory, wrap on 256 byte bountry
				end
			end
			else begin						// protected Memory abort program
				valid_addr = False;				// default valid address
				valid_data = False;				// default valid data
				SPI_QUAD_PP_active = False;			// abort program on protected Memory
				$display("\t%m Warning attempting to program protected page address=%h, PP(h32) cmd aborted time=%0.2f",
				pgm_addr,$realtime);
			end
			SPI_QUAD_PP_active = False;
		end
		else begin
			$display("\t%m Warning Nested Page Program not allowed in program suspend mode time=%0.2f",$realtime);
		end
	end
end

//---------------------------------------------------------------------------
// Page program read in address, data, place program data into pgm_addr array
// When CEb goes high program loop is called using pgm_addr and pmem
//---------------------------------------------------------------------------
always @(SPI_PP_trg) begin : SPI_PP_label
reg [8:0] pcount;
reg [7:0] sdata;

	valid_addr = False;						// default valid address
	valid_data = False;						// default valid data
	time_left = Tpp;						// time left to program
	if(WEL === True && WSP === False) begin 			// check WSP status before programing, no programing on program suspend active
		SPI_PP_active = True;					// program loop is active
		for(pcount=0;pcount<Program_Page_Size;pcount = pcount+1) pmem[pcount] = 8'hFF;  // clear program data to all 1's

		repeat(24) begin					// read in address, set valid address flag when complete
			pgm_addr = pgm_addr <<1;
			@(posedge clock) pgm_addr[0] = SIO[0];
		end
		pgm_addr = pgm_addr & (Memsize-1);			// clear upper unused address bits
		valid_addr = True;					// address read complete set valid address flag
		if(Write_proT(pgm_addr)===False && ERASE_PGM(resume_addr,pgm_addr)===False) begin	// check for proteced Memory
			valid_data = False;				// no data valid
			forever begin					// Read program data, loop through all data abort on CEb rising
				repeat(8) @(posedge clock ) begin	// read in byte of data
						valid_data = True;	// at least 1 valid data clock
						sdata = sdata <<1;
						sdata[0] = SIO[0];
				end
				pmem[pgm_addr[7:0]] = sdata;		// save byte of page data
				pgm_addr[7:0] = pgm_addr[7:0] + 1;	// increment to next addr of page Memory, wrap on 256 byte bountry
			end
		end
		else begin						// protected Memory abort program
			valid_addr = False;				// default valid address
			valid_data = False;				// default valid data
			SPI_PP_active = False;				// abort program on protected Memory
			if(ERASE_PGM(resume_addr,pgm_addr)===True) begin
				$display("\t%m Warning attempting to program erase suspended Memory address=%h, PP(h02) cmd aborted time=%0.2f",
				pgm_addr,$realtime);
			end
			else $display("\t%m Warning attempting to program protected page address=%h, PP(h02) cmd aborted time=%0.2f",pgm_addr,$realtime);
		end
		SPI_PP_active = False;
	end
	else begin
		$display("\t%m Warning Nested Page Program not allowed in program suspend mode time=%0.2f",$realtime);
	end
end

//---------------------------------------------------------------------------
// SPI Read block protection register
//---------------------------------------------------------------------------
always @(SPI_RBPR_trg) begin :SPI_RBPR_label
reg [PROTECT_REG_MSB:0] tmp_protect;					// protection register definishion max size for 32M-bit
	SPI_RBPR_active = True;						// read l status loop is active
	tmp_protect = protect_or;					// copy protection reg
	if(SQI_SPI_mode === True) begin
		@(negedge clock) ;                              // wait here for clock falling
		@(negedge clock) ;                              // wait here for clock falling
		forever begin						// out put SPI data bit by 
			@(negedge clock) ;                              // wait here for clock falling
            		SIO_IO <= #Tclz  {True,True,True,True};     	// Turn on IO control SIO[3:0]
			#Tv begin					// output nibble of data
				SIO_OUT[3]=tmp_protect[PROTECT_REG_MSB]; tmp_protect = tmp_protect <<1;	// shift data left
				SIO_OUT[2]=tmp_protect[PROTECT_REG_MSB]; tmp_protect = tmp_protect <<1;	// shift data left
				SIO_OUT[1]=tmp_protect[PROTECT_REG_MSB]; tmp_protect = tmp_protect <<1;	// shift data left
				SIO_OUT[0]=tmp_protect[PROTECT_REG_MSB]; tmp_protect = tmp_protect <<1;	// shift data left
			end
		end
	end
	else begin
		forever begin						// out put SPI data bit by 
			@(negedge clock) ;                              // wait here for clock falling
            		SIO_IO <= #Tclz  {False,False,True,False};     	// Turn on IO control SIO[1]
			#Tv SIO_OUT[1]=tmp_protect[PROTECT_REG_MSB];	// shift out protection data
                	tmp_protect = tmp_protect <<1;                 	// shift data left
		end
	end
	SPI_RBPR_active = False;					// read status loop is inactive
end

//----------------------------------------------------------------------------
// Program Block Protection Register volatile -volitale
//----------------------------------------------------------------------------
always @(SPI_WBPR_trg ) begin :SPI_WBPR_label
reg [8:0] ncount;
reg [7:0] bit_count;			// number of bits to read
	if(suspend_act===False && WBPR_protection_lck===False && WPLD===False) begin	// check truth table table 2 in spec
		SPI_WBPR_active = True;				// this loop is active
		ncount = PROTECT_REG_MSB;
		if(SQI_SPI_mode === True) begin			// SQI mode
			repeat((PROTECT_REG_MSB+1)/4) begin
				@(posedge clock) begin
					protect[ncount] = SIO[3];  ncount = ncount - 1;
					protect[ncount] = SIO[2];  ncount = ncount - 1;
					protect[ncount] = SIO[1];  ncount = ncount - 1;
					protect[ncount] = SIO[0];  ncount = ncount - 1;
				end
			end
		end
		else begin							// SPI mode
			repeat(PROTECT_REG_MSB+1) begin
				@(posedge clock) protect[ncount] = SIO[0];	// save protection data
				ncount = ncount - 1;				// count the number of clocks
			end
		end
		WEL = False;						// clear WEL on WBPR command
		forever @(posedge clock) ;				// if to many clocks wait here for CEb to go inactive
	end
	else begin
		if(WEL === False)
			$display("\t%m Warning status flag WEL=0, WBPR(h42) cmd aborted time=%0.2f",$realtime);
		else if(suspend_act===True)
			$display("\t%m Warning WBPR not allowed in suspend mode, WBPR[h42) cmd aborted time=%0.2f",$realtime);
		else if(WBPR_protection_lck === True)
			$display("\t%m Warning Block Protection Reg protected, WBPR(h42) cmd aborted time=%0.2f",$realtime);
	end
	SPI_WBPR_active = False;		// this loop is inactive
end
//----------------------------------------------------------------------------
// Program Block Protection Register non-volitale
//----------------------------------------------------------------------------
always @(SPI_nVWLDR_trg) begin :SPI_nVWLDR_cmd_label
reg [8:0] ncount;
reg [7:0] bit_count;				// number of bits to read
	t_wlldr_mem = wlldr_mem;		// save current value of wlldr_mem
	if(suspend_act===False && WBPR_protection_lck === False) begin		// check truth table table 2 in spec
		SPI_nVWLDR_cmd_active = True;	// this loop is active
		ncount = PROTECT_REG_MSB;

		if(SQI_SPI_mode === True) begin	// SQI mode
			repeat((PROTECT_REG_MSB+1)/4) begin
				@(posedge clock) begin
					t_wlldr_mem[ncount] = SIO[3]; ncount = ncount - 1;
					t_wlldr_mem[ncount] = SIO[2]; ncount = ncount - 1;
					t_wlldr_mem[ncount] = SIO[1]; ncount = ncount - 1;
					t_wlldr_mem[ncount] = SIO[0]; ncount = ncount - 1;
				end
			end
		end
		else begin				//SPI mode
			repeat(PROTECT_REG_MSB+1) begin
				@(posedge clock) t_wlldr_mem[ncount] = SIO[0];			// save non-volatile data
				ncount = ncount - 1;	// count the number of clocks
			end
		end

		forever @(posedge clock) ;	// if to many clocks wait here for CEb to go inactive
	end
	else begin
		if(WBPR_protection_lck === True)
			$display("\t%m Warning nVWLDR(hE8) cmd aborted (protected) time=%0.2f",$realtime);
		else if(suspend_act===True)
			$display("\t%m Warning nVWLDR(E8) not allowed in suspend mode, nVWLDR(hE8) cmd aborted time=%0.2f",$realtime);
	end
	SPI_nVWLDR_cmd_active = False;		// this loop is inactive
end

//---------------------------------------------------------------------------
// nVWLDR program command, program wlldr_mem[], wait for program complete
//---------------------------------------------------------------------------
always @(posedge CEb) begin :SPI_nVWLDR_label
reg [7:0]nn;
	if(SPI_nVWLDR_cmd_active===True && suspend_act===False) begin
		disable SPI_nVWLDR_cmd_label;
		SPI_nVWLDR_cmd_active = False;
		SPI_nVWLDR_active = True;		// set busy
		// make sure read protect flags are never set, clear the read flags
		nn=0; repeat(8) begin t_wlldr_mem[PROTECT_REG_MSB-nn]=False; nn=nn+2;  end
		#Tpp wlldr_mem = wlldr_mem | t_wlldr_mem;	// copy tmp data to final data, wait for program to complete
		SPI_nVWLDR_active = False;		// clear busy
		WEL = False;				// clear WEL on WBPR command
	end
end

//---------------------------------------------------------------------------
// SPI Read configuration register
//---------------------------------------------------------------------------
always @(SPI_RDCR_trg) begin :SPI_RDCR_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
	SPI_RDCR_active = True;						// read l status loop is active
	if(SQI_SPI_mode === True) begin					// SQI mode ?
		repeat(2) @(negedge clock) ;				// dummy cycle
		forever begin						// out put SPI data bit by 
			data = config_reg;				// byte boundry, save config register
			@(negedge clock) ;                              // wait here for clock falling
            		SIO_IO <= #Tclz  {True,True,True,True};     	// Turn on IO control SIO[1]
                	#Tv SIO_OUT[3:0] = data[7:4];                 	// output high nibble
			@(negedge clock) ;                              // wait here for clock falling
                	#Tv SIO_OUT[3:0] = data[3:0];                 	// output low nibble
		end
	end
	else begin							// SPI mode
		forever begin						// out put SPI data bit by bit
			data = config_reg;				// byte boundry, read configuration register
			repeat(8) begin
				@(negedge clock) ;                      // wait here for clock falling
            			SIO_IO <= #Tclz {False,False,True,False}; // Turn on IO control SIO[1]
                		#Tv SIO_OUT[1] = data[7];             	// output 1 bit data
                		data = data <<1;                       	// shift data left
			end
		end
	end
	SPI_RDCR_active = False;					// read status loop is inactive
end

//---------------------------------------------------------------------------
// SPI Read status register
//---------------------------------------------------------------------------
always @(SPI_RDSR_trg) begin :SPI_RDSR_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
	SPI_RDSR_active = True;						// read l status loop is active
	if(SQI_SPI_mode === True) begin					// SQI mode ?
		repeat(2) @(negedge clock) ;				// dummy cycle
		forever begin						// out put SPI data bit by 
			data = status;					// byte boundry, save status register
			@(negedge clock) ;                              // wait here for clock falling
            		SIO_IO <= #Tclz  {True,True,True,True};		// Turn on IO control SIO[1]
                	#Tv SIO_OUT[3:0] = data[7:4];                   // output high nibble data
			@(negedge clock) ;                              // wait here for clock falling
                	#Tv SIO_OUT[3:0] = data[3:0];                   // output low nibble data
		end
	end
	else begin							// SPI mode
		forever begin						// out put SPI data bit by 
			data = status;					// byte boundry, save status register
			repeat(8) begin
				@(negedge clock) ;                      // wait here for clock falling
            			SIO_IO <= #Tclz  {False,False,True,False}; // Turn on IO control SIO[1]
                		#Tv SIO_OUT[1] = data[7];               // output 1 bit data
                		data = data <<1;                        // shift data left
			end
		end
	end
	SPI_RDSR_active = False;					// read status loop is inactive
end


//----------------------------------------------------------------------------
// SPI Mode Read Serial Flash Discoverable Parameters
//----------------------------------------------------------------------------
always @(SPI_SFDP_trg ) begin :SPI_SFDP_label
reg [7:0] data;
reg [10:0] addr;		// max value 2K-1
	SPI_SFDP_active = True;
	repeat(24) begin
        	@(posedge clock)  begin                         // wait for clk rising
                        addr = addr <<1;                        // shift left address
                        addr[0] = SIO[0];                       // read in address bit
                end
        end
	repeat(8) @(posedge clock) ;				// dummy cycle
	forever begin						// output SPI serial data
		data = SFDP[addr];				// read from SFDP Memory
		addr = addr + 1;				// increment address
		repeat(8) begin
			@(negedge clock) ;			// wait here for clock falling
 			SIO_IO <= #Tclz  {False,False,True,False}; // Turn on IO control SIO[1]
			#Tv SIO_OUT[1] = data[7];		// output 1 bit data
			data = data <<1;			// shift data left
		end
	end
	SPI_SFDP_active = False;
end


//----------------------------------------------------------------------------
// SPI Mode Read JDEC registers
//----------------------------------------------------------------------------
always @(SPI_JEDEC_ID_trg ) begin :SPI_JEDEC_ID_label
reg [1:0] ptr;
reg [7:0] data;
	SPI_JEDEC_ID_active = True;
	ptr = 0;
	if(SQI_SPI_mode === True)
	begin	
		@(negedge clock) ;
		@(negedge clock) ;
	end	
	forever begin						// output SPI serial data
		if(ptr === 2'b00)       data = MANUFACTURE;
		else if(ptr === 2'b01)  data = Memory_Type;
		else if(ptr === 2'b10 ) data = Memory_Capacity;
		if( ptr === 2'b10) ptr = 0; else ptr = ptr + 1;
		if(SQI_SPI_mode === True) begin					// SQI mode
				@(negedge clock) ;				// wait here for clock falling
 				SIO_IO <= #Tclz  {True,True,True,True};		// Turn on IO control SIO[3:0]
				#Tv SIO_OUT[3:0] = data[7:4];			// output nibble bit data
				@(negedge clock) ;				// wait here for clock falling
				#Tv SIO_OUT[3:0] = data[3:0];			// output 1 nibble data
		end
		else begin							// SPI mode
			repeat(8) begin
				@(negedge clock) ;				// wait here for clock falling
 				SIO_IO <= #Tclz  {False,False,True,False};	// Turn on IO control SIO[1]
				#Tv SIO_OUT[1] = data[7];			// output 1 bit data
				data = data <<1;				// shift data left
			end
		end
	end
	SPI_JEDEC_ID_active = False;
end

//----------------------------------------------------------------------------
// Deep Power Down Reset Read device ID
//----------------------------------------------------------------------------
always @(SPI_DPD_RST_trg ) begin :SPI_DPD_RST_RDID_label
reg [7:0] data;
	SPI_DPD_RST_RDID_active = True;
	forever begin						// output SPI serial data
		data = Memory_Capacity;
		if(SQI_SPI_mode === True) begin					// SQI mode
				@(negedge clock) ;				// wait here for clock falling
 				SIO_IO <= #Tclz  {True,True,True,True};		// Turn on IO control SIO[3:0]
				#Tv SIO_OUT[3:0] = data[7:4];			// output nibble bit data
				@(negedge clock) ;				// wait here for clock falling
				#Tv SIO_OUT[3:0] = data[3:0];			// output 1 nibble data
		end
		else begin							// SPI mode
			repeat(8) begin
				@(negedge clock) ;				// wait here for clock falling
 				SIO_IO <= #Tclz  {False,False,True,False};	// Turn on IO control SIO[1]
				#Tv SIO_OUT[1] = data[7];			// output 1 bit data
				data = data <<1;				// shift data left
			end
		end
	end
	SPI_DPD_RST_RDID_active = False;
end

//----------------------------------------------------------------------------
// Deep Power Down Reset - Recovery from Deep Power Down Mode
//----------------------------------------------------------------------------
always @(SPI_DPD_RST_trg ) begin :SPI_DPD_RST_label
reg [7:0] data;
	@(posedge CEb)
	#Tsbr DPD = False;
end

//---------------------------------------------------------------------------
// SPI Read with Burst 
//---------------------------------------------------------------------------
always @(SPI_RBSPI_trg) begin :SPI_RBSPI_label
reg [AF_MSB:0] addr;						// address storage
reg [7:0] data;							// tmp storage of data
	if(IOC === False && SQI_SPI_mode === False) $display("\t%m Warning SPI BURST READ(hEC) command aborted when IOC=0 time=%0.2f",$realtime);
	else begin
		SPI_RBSPI_active = True;				// read loop is active
		repeat(6) begin
        		@(posedge clock) ;				// wait for clk rising
                	addr = addr <<4;				// shift left address
                	addr[3:0] = SIO[3:0];				// read in address nibble
        	end
		// read mode
		repeat(6) @(posedge clock) ;				// 3 dummy cycles
	
		forever begin									// output SPI data 1 byte
                	data = (Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]];     // get data at addr
			@(negedge clock) ;                                      		// wait here for clock falling
            		SIO_IO <= #Tclz  {True,True,True,True}; 	     			// Turn on IO control SIO[3:0]
                	#Tv SIO_OUT[3:0] = data[7:4];                       			// output 4 bit data
			@(negedge clock) ;                                      		// wait here for clock falling
                	#Tv SIO_OUT[3:0] = data[3:0];                       			// output 4 bit data
			if(burst_length===Burst8) addr[Burst8_MSB:0]=addr[Burst8_MSB:0] + 1;	// inc address with wrap
			else if(burst_length===Burst16) addr[Burst16_MSB:0]=addr[Burst16_MSB:0] + 1;
			else if(burst_length===Burst32) addr[Burst32_MSB:0]=addr[Burst32_MSB:0] + 1;
			else if(burst_length===Burst64) addr[Burst64_MSB:0]=addr[Burst64_MSB:0] + 1;
		end
		SPI_RBSPI_active = False;					// read loop is inactive
	end
end



//---------------------------------------------------------------------------
// SPI Set Burst Count
//---------------------------------------------------------------------------
always @(SPI_SB_trg) begin :SPI_SB_label
reg [7:0] bl;
	SPI_SB_active = True;
	if(SQI_SPI_mode === True) begin
		@(posedge clock) bl[7:4] = SIO[3:0];
		@(posedge clock) bl[3:0] = SIO[3:0];
	end
	else begin
		@(posedge clock) bl[7] = SIO[0];	// MSB bit of burst count
		@(posedge clock) bl[6] = SIO[0];	// --- bit of burst count
		@(posedge clock) bl[5] = SIO[0];	// --- bit of burst count
		@(posedge clock) bl[4] = SIO[0];	// --- bit of burst count
		@(posedge clock) bl[3] = SIO[0];	// --- bit of burst count
		@(posedge clock) bl[2] = SIO[0];	// --- bit of burst count
		@(posedge clock) bl[1] = SIO[0];	// --- bit of burst count
		@(posedge clock) bl[0] = SIO[0];	// LSB bit of burst count
	end
	burst_length = bl;			// set register

	if( |burst_length[7:2] !== 1'b0) begin		// check for legal values of burst count 
		$display("\t%m Warning SPI Set Burst Instruction has invalid data=%h, time=%0.2f", burst_length,$realtime);
		$display("\t%m Setting bits[7:2] of Burst Count Register to 0");
		burst_length[7:2] = 6'b000000;		// clear upper bits
	end
	forever @(posedge clock) ;			// wait for end of operation, Disable cmd will exit this line
	SPI_SB_active = False;
end



//---------------------------------------------------------------------------
// SQI High Speed Read
//---------------------------------------------------------------------------
always @(SQI_HS_READ_trg) begin :SQI_HS_READ_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
reg [7:0] count;
	SQI_HS_READ_active = True;					// Read loop is active
        if(Mode_Configuration[7:4]===4'hA) begin			// if no command header read in 1st address nibble
		addr[3:0] = SIO[3:0]; count = 5; 		        // read in first address nibble
	end
	else count = 6;							// read 6 times if command header
	repeat(count) begin
        	@(posedge clock)  					// wait for clk rising
                addr = addr <<4;					// shift left address
                addr[3:0] = SIO[3:0];					// read in address nibble
        end
	// read mode
	@(posedge clock) Mode_Configuration[7:4]=SIO[3:0];		// read in Mode configuration
	@(posedge clock) Mode_Configuration[3:0]=SIO[3:0];		// read in Mode configuration

	// 4 dummy nibbles
	repeat(4) @(posedge clock) ;					// 2 dummy  bytes

	forever begin									// output SPI data 1 byte
                data = (Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]];     // get data at addr
		@(negedge clock) ;                                      		// wait here for clock falling
            	SIO_IO <= #Tclz  {True,True,True,True}; 	     			// Turn on IO control SIO[3:0]
                #Tv SIO_OUT[3:0] = data[7:4];                       			// output 4 bit data
		@(negedge clock) ;                                      		// wait here for clock falling
                #Tv SIO_OUT[3:0] = data[3:0];                       			// output 4 bit data
                addr = addr + 1;	                                		// increment to next address on byte boundry
	end
	SQI_HS_READ_active = False;
end



//---------------------------------------------------------------------------
// SPI_READ DUAL IO
//---------------------------------------------------------------------------
always @(SPI_SDIOR_trg) begin :SPI_SDIOR_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
reg [7:0] count;
	SPI_SDIOR_active = True;
        if(Mode_Configuration[7:4]===4'hA) begin			// if no command header read in 1st address nibble
		addr[1:0] = SIO[1:0]; count = 11; 		        // read in first address 2-bits
	end
	else count = 12;							// read 6 times if command header
	repeat(count) begin
        	@(posedge clock)  begin                                 // wait for clk rising
                        addr = addr <<2;                                // shift left address
                        addr[1:0] = SIO[1:0];                           // read in address nibble
                end
        end
	// read mode
	@(posedge clock) Mode_Configuration[7:6]=SIO[1:0];		// read in Mode configuration
	@(posedge clock) Mode_Configuration[5:4]=SIO[1:0];		// read in Mode configuration
	@(posedge clock) Mode_Configuration[3:2]=SIO[1:0];		// read in Mode configuration
	@(posedge clock) Mode_Configuration[1:0]=SIO[1:0];		// read in Mode configuration

	forever begin									// output SPI data 1 byte
                data = (Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]];     // get data at addr
		@(negedge clock) ;                                      		// wait here for clock falling
            	SIO_IO <= #Tclz  {False,False,True,True}; 	     			// Turn on IO control SIO[3:0]
                #Tv SIO_OUT[3:0] = data[7:6];                       			// output 4 bit data
		@(negedge clock) #Tv SIO_OUT[3:0] = data[5:4];
		@(negedge clock) #Tv SIO_OUT[3:0] = data[3:2];
		@(negedge clock) #Tv SIO_OUT[3:0] = data[1:0];
                addr = addr + 1;	                                		// increment to next address on byte boundry
	end
	SPI_SDIOR_active = False;
end


//---------------------------------------------------------------------------
// SPI_READ QUAD IO
//---------------------------------------------------------------------------
always @(SPI_QUAD_IO_READ_trg) begin :SPI_QUAD_IO_READ_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
reg [7:0] count;
	if(IOC === False) $display("\t%m Warning SPI IO QUAD READ(hEB) command aborted when IOC=0 time=%0.2f",$realtime);
	else begin
		SPI_QUAD_IO_READ_active = True;
        	if(Mode_Configuration[7:4]===4'hA) begin			// if no command header read in 1st address nibble
			addr[3:0] = SIO[3:0]; count = 5; 		        // read in first address nibble
		end
		else count = 6;							// read 6 times if command header
		repeat(count) begin
        		@(posedge clock)  begin                                 // wait for clk rising
                        	addr = addr <<4;                                // shift left address
                        	addr[3:0] = SIO[3:0];                           // read in address nibble
                	end
        	end
		// read mode
		@(posedge clock) Mode_Configuration[7:4]=SIO[3:0];		// read in Mode configuration
		@(posedge clock) Mode_Configuration[3:0]=SIO[3:0];		// read in Mode configuration
	
		// 2 dummy bytes
		repeat(4) @(posedge clock) ;					// 2 dummy  bytes
	
		forever begin									// output SPI data 1 byte
                	data = (Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]];     // get data at addr
			@(negedge clock) ;                                      		// wait here for clock falling
            		SIO_IO <= #Tclz  {True,True,True,True}; 	     			// Turn on IO control SIO[3:0]
                	#Tv SIO_OUT[3:0] = data[7:4];                       			// output 4 bit data
			@(negedge clock) ;                                      		// wait here for clock falling
                	#Tv SIO_OUT[3:0] = data[3:0];                       			// output 4 bit data
                	addr = addr + 1;	                                		// increment to next address on byte boundry
		end
		SPI_QUAD_IO_READ_active = False;
	end
end

//---------------------------------------------------------------------------
// SPI_READ QUAD 
//---------------------------------------------------------------------------
always @(SPI_QUAD_READ_trg) begin :SPI_QUAD_READ_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
	if(IOC === False) $display("\t%m Warning SPI QUAD READ(h6B) command aborted when IOC=0 time=%0.2f",$realtime);
	else begin
		SPI_READ_QUAD_active = True;					// this loop is active
		repeat(24) begin
        		@(posedge clock)  begin                                 // wait for clk rising
                        	addr = addr <<1;                                // shift left address
                        	addr[0] = SIO[0];                               // read in address bit
                	end
        	end
		// run 8 dummy cycles
		repeat(8) @(negedge clock) ;
		forever begin									// output SPI data 1 byte
                	data = (Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]];     // get data at addr
			@(negedge clock) ;                                      		// wait here for clock falling
            		SIO_IO <= #Tclz  {True,True,True,True}; 	     			// Turn on IO control SIO[3:0]
                	#Tv SIO_OUT[3:0] = data[7:4];                       			// output 4 bit data
			@(negedge clock) ;                                      		// wait here for clock falling
                	#Tv SIO_OUT[3:0] = data[3:0];                       			// output 4 bit data
                	addr = addr + 1;	                                		// increment to next address on byte boundry
		end
		SPI_READ_QUAD_active = False;							// this loop is active
	end
end

//---------------------------------------------------------------------------
// SPI_READ dual, SDOR
//---------------------------------------------------------------------------
always @(SPI_SDOR_trg) begin :SPI_SDOR_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
	SPI_SDOR_active = True;						// read loop is active
	repeat(24) begin
        	@(posedge clock)  begin                                 // wait for clk rising
                        addr = addr <<1;                                // shift left address
                        addr[0] = SIO[0];                               // read in address bit
                end
        end
	repeat(8) @(negedge clock) ;					// dummy cycle for read
	forever begin							// out put SPI data 2 bits at a time
		data=(Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]];     // get data at addr
		addr = addr + 1;					// increment to next address on byte boundry
		@(negedge clock) ;                                      // wait here for clock falling
        	SIO_IO <= #Tclz  {False,False,True,True};	      	// Turn on IO control SIO[1:0]
                #Tv SIO_OUT[1:0] = data[7:6];                       	// output 2 bits data
		@(negedge clock) #Tv SIO_OUT[1:0] = data[5:4];         	// output 2 bits data
		@(negedge clock) #Tv SIO_OUT[1:0] = data[3:2];         	// output 2 bits data
		@(negedge clock) #Tv SIO_OUT[1:0] = data[1:0];         	// output 2 bits data
	end
	SPI_SDOR_active = False;					// read loop is inactive
end

//---------------------------------------------------------------------------
// SPI_READ 80/50Mhz
//---------------------------------------------------------------------------
always @(SPI_READ_trg) begin :SPI_READ_label
reg [AF_MSB:0] addr;							// address storage
reg [7:0] data;								// tmp storage of data
	SPI_READ_active = True;						// read loop is active
	repeat(24) begin
        	@(posedge clock)  begin                                 // wait for clk rising
                        addr = addr <<1;                                // shift left address
                        addr[0] = SIO[0];                               // read in address bit
                end
        end
	if(l_spi_cmd === SPI_HS_READ) repeat(8) @(negedge clock) ;	// added dummy cycle for high speed read
	if(l_spi_cmd === SPI_READ) read_slow_flag = True;		// set timing checks to slow read for SCK timing check
	forever begin							// out put SPI data bit by 
                data = (Read_proT(addr)===True) ? 8'h00 : memory[addr[ADDR_MSB:0]]; // get data at addr
                addr = addr + 1;                                	// increment to next address on byte boundry
		repeat(8) begin
			@(negedge clock) ;                              // wait here for clock falling
            		SIO_IO <= #Tclz  {False,False,True,False};     	// Turn on IO control SIO[1]
                	#Tv SIO_OUT[1] = data[7];                     	// output 1 bit data
                	data = data <<1;                          	// shift data left
		end
	end
	read_slow_flag = False;						// set timing checks back to normal
	SPI_READ_active = False;					// read loop is inactive
end

//---------------------------------------------------------------------------
// chip por setup
//---------------------------------------------------------------------------
initial begin

	for(cnt=0;cnt<(Kilo*2);cnt=cnt+1) security_id[cnt] = 8'hFF;	// init security Memory
	for(cnt=0;cnt<Memsize;cnt=cnt+8) begin				// init flash Memory
		 memory[cnt+0] = 8'hFF; memory[cnt+1] = 8'hFF; memory[cnt+2] = 8'hFF; memory[cnt+3] = 8'hFF;
		 memory[cnt+4] = 8'hFF; memory[cnt+5] = 8'hFF; memory[cnt+6] = 8'hFF; memory[cnt+7] = 8'hFF;
	end

	wlldr_mem = WLLD_value;			// set contents of write-lock lock down register, non-volatile
	SEC = SECURITY_LOCKOUT_VALUE;		// Security ID Status, non-volatile
	WPLD = False;				// write protection lockdown status, non-volatile
	clock = 1'b0;
	WPEN = INIT_WPEN;			// write protect pin enable, non-volatile bit
	PE = False;				// default unused configuration register bits
	EE = False;				// default unused configuration register bits
	DPD = False;				// deep power down mode
	pgm_sus_reset = False;			// part is busy if reset while programming is suspended
	#0 ->reset;				// call reset block

	// set volatile protect register to initial condition
	for(cnt=0;cnt<=PROTECT_REG_MSB;cnt=cnt+1) protect[cnt] = 1'b1;				// all protect bits set
	for(cnt=PROTECT_REG_MSB;cnt > (PROTECT_REG_MSB-16); cnt=cnt-2) protect[cnt] = 1'b0;	// read protect bits cleared

	// init serial flash discoverable parameters
	for(cnt=0;cnt<(Kilo*2);cnt=cnt+1) SFDP[cnt] = 8'hFF;		// init to all FF

	SFDP['h000] = 8'h53;
	SFDP['h001] = 8'h46;
	SFDP['h002] = 8'h44;
	SFDP['h003] = 8'h50;
	SFDP['h004] = 8'h06;
	SFDP['h005] = 8'h01;
	SFDP['h006] = 8'h02;
	SFDP['h007] = 8'hFF;
	SFDP['h008] = 8'h00;
	SFDP['h009] = 8'h06;
	SFDP['h00A] = 8'h01;
	SFDP['h00B] = 8'h10;
	SFDP['h00C] = 8'h30;
	SFDP['h00D] = 8'h00;
	SFDP['h00E] = 8'h00;
	SFDP['h00F] = 8'hFF;
	SFDP['h010] = 8'h81;
	SFDP['h011] = 8'h00;
	SFDP['h012] = 8'h01;
	SFDP['h013] = 8'h06;
	SFDP['h014] = 8'h00;
	SFDP['h015] = 8'h01;
	SFDP['h016] = 8'h00;
	SFDP['h017] = 8'hFF;
	SFDP['h018] = 8'hBF;
	SFDP['h019] = 8'h00;
	SFDP['h01A] = 8'h01;
	SFDP['h01B] = 8'h18;
	SFDP['h01C] = 8'h00;
	SFDP['h01D] = 8'h02;
	SFDP['h01E] = 8'h00;
	SFDP['h01F] = 8'h01;
	SFDP['h030] = 8'hFD;
	SFDP['h031] = 8'h20;
	SFDP['h032] = 8'hF1;
	SFDP['h033] = 8'hFF;
	SFDP['h034] = 8'hFF;
	SFDP['h035] = 8'hFF;
	SFDP['h036] = 8'h7F;
	SFDP['h037] = 8'h00;
	SFDP['h038] = 8'h44;
	SFDP['h039] = 8'hEB;
	SFDP['h03A] = 8'h08;
	SFDP['h03B] = 8'h6B;
	SFDP['h03C] = 8'h08;
	SFDP['h03D] = 8'h3B;
	SFDP['h03E] = 8'h80;
	SFDP['h03F] = 8'hBB;
	SFDP['h040] = 8'hFE;
	SFDP['h041] = 8'hFF;
	SFDP['h042] = 8'hFF;
	SFDP['h043] = 8'hFF;
	SFDP['h044] = 8'hFF;
	SFDP['h045] = 8'hFF;
	SFDP['h046] = 8'h00;
	SFDP['h047] = 8'hFF;
	SFDP['h048] = 8'hFF;
	SFDP['h049] = 8'hFF;
	SFDP['h04A] = 8'h44;
	SFDP['h04B] = 8'h0B;
	SFDP['h04C] = 8'h0C;
	SFDP['h04D] = 8'h20;
	SFDP['h04E] = 8'h0D;
	SFDP['h04F] = 8'hD8;
	SFDP['h050] = 8'h0F;
	SFDP['h051] = 8'hD8;
	SFDP['h052] = 8'h10;
	SFDP['h053] = 8'hD8;
	SFDP['h054] = 8'h20;
	SFDP['h055] = 8'h91;
	SFDP['h056] = 8'h48;
	SFDP['h057] = 8'h24;
	SFDP['h058] = 8'h80;
	SFDP['h059] = 8'h6F;
	SFDP['h05A] = 8'h1D;
	SFDP['h05B] = 8'h81;
	SFDP['h05C] = 8'hED;
	SFDP['h05D] = 8'h0F;
	SFDP['h05E] = 8'h77;
	SFDP['h05F] = 8'h38;
	SFDP['h060] = 8'h30;
	SFDP['h061] = 8'hB0;
	SFDP['h062] = 8'h30;
	SFDP['h063] = 8'hB0;
	SFDP['h064] = 8'hF7;
	SFDP['h065] = 8'hA9;
	SFDP['h066] = 8'hD5;
	SFDP['h067] = 8'h5C;
	SFDP['h068] = 8'h29;
	SFDP['h069] = 8'hC2;
	SFDP['h06A] = 8'h5C;
	SFDP['h06B] = 8'hFF;
	SFDP['h06C] = 8'hF0;
	SFDP['h06D] = 8'h30;
	SFDP['h06E] = 8'hC0;
	SFDP['h06F] = 8'h80;
	SFDP['h100] = 8'hFF;
	SFDP['h101] = 8'h00;
	SFDP['h102] = 8'h04;
	SFDP['h103] = 8'hFF;
	SFDP['h104] = 8'hF3;
	SFDP['h105] = 8'h7F;
	SFDP['h106] = 8'h00;
	SFDP['h107] = 8'h00;
	SFDP['h108] = 8'hF5;
	SFDP['h109] = 8'h7F;
	SFDP['h10A] = 8'h00;
	SFDP['h10B] = 8'h00;
	SFDP['h10C] = 8'hF9;
	SFDP['h10D] = 8'hFF;
	SFDP['h10E] = 8'h0D;
	SFDP['h10F] = 8'h00;
	SFDP['h110] = 8'hF5;
	SFDP['h111] = 8'h7F;
	SFDP['h112] = 8'h00;
	SFDP['h113] = 8'h00;
	SFDP['h114] = 8'hF3;
	SFDP['h115] = 8'h7F;
	SFDP['h116] = 8'h00;
	SFDP['h117] = 8'h00;
	SFDP['h200] = 8'hBF;
	SFDP['h201] = 8'h26;
	SFDP['h202] = 8'h58;
	SFDP['h203] = 8'hFF;
	SFDP['h204] = 8'hB9;
	SFDP['h205] = 8'hDF;
	SFDP['h206] = 8'hFD;
	SFDP['h207] = 8'hFF;
	SFDP['h208] = 8'h65;
	SFDP['h209] = 8'hF1;
	SFDP['h20A] = 8'h95;
	SFDP['h20B] = 8'hF1;
	SFDP['h20C] = 8'h32;
	SFDP['h20D] = 8'hFF;
	SFDP['h20E] = 8'h0A;
	SFDP['h20F] = 8'h12;
	SFDP['h210] = 8'h23;
	SFDP['h211] = 8'h46;
	SFDP['h212] = 8'hFF;
	SFDP['h213] = 8'h0F;
	SFDP['h214] = 8'h19;
	SFDP['h215] = 8'h32;
	SFDP['h216] = 8'h0F;
	SFDP['h217] = 8'h19;
	SFDP['h218] = 8'h19;
	SFDP['h219] = 8'h03;
	SFDP['h21A] = 8'h0A;
	SFDP['h21B] = 8'hFF;
	SFDP['h21C] = 8'hFF;
	SFDP['h21D] = 8'hFF;
	SFDP['h21E] = 8'hFF;
	SFDP['h21F] = 8'hFF;
	SFDP['h220] = 8'h00;
	SFDP['h221] = 8'h66;
	SFDP['h222] = 8'h99;
	SFDP['h223] = 8'h38;
	SFDP['h224] = 8'hFF;
	SFDP['h225] = 8'h05;
	SFDP['h226] = 8'h01;
	SFDP['h227] = 8'h35;
	SFDP['h228] = 8'h06;
	SFDP['h229] = 8'h04;
	SFDP['h22A] = 8'h02;
	SFDP['h22B] = 8'h32;
	SFDP['h22C] = 8'hB0;
	SFDP['h22D] = 8'h30;
	SFDP['h22E] = 8'h72;
	SFDP['h22F] = 8'h42;
	SFDP['h230] = 8'h8D;
	SFDP['h231] = 8'hE8;
	SFDP['h232] = 8'h98;
	SFDP['h233] = 8'h88;
	SFDP['h234] = 8'hA5;
	SFDP['h235] = 8'h85;
	SFDP['h236] = 8'hC0;
	SFDP['h237] = 8'h9F;
	SFDP['h238] = 8'hAF;
	SFDP['h239] = 8'h5A;
	SFDP['h23A] = 8'hB9;
	SFDP['h23B] = 8'hAB;
	SFDP['h23C] = 8'h06;
	SFDP['h23D] = 8'hEC;
	SFDP['h23E] = 8'h06;
	SFDP['h23F] = 8'h0C;
	SFDP['h240] = 8'h00;
	SFDP['h241] = 8'h03;
	SFDP['h242] = 8'h08;
	SFDP['h243] = 8'h0B;
	SFDP['h244] = 8'hFF;
	SFDP['h245] = 8'hFF;
	SFDP['h246] = 8'hFF;
	SFDP['h247] = 8'hFF;
	SFDP['h248] = 8'hFF;
	SFDP['h249] = 8'h07;
	SFDP['h24A] = 8'hFF;
	SFDP['h24B] = 8'hFF;
	SFDP['h24C] = 8'h02;
	SFDP['h24D] = 8'h02;
	SFDP['h24E] = 8'hFF;
	SFDP['h24F] = 8'h06;
	SFDP['h250] = 8'h03;
	SFDP['h251] = 8'h00;
	SFDP['h252] = 8'hFD;
	SFDP['h253] = 8'hFD;
	SFDP['h254] = 8'h04;
	SFDP['h255] = 8'h04;
	SFDP['h256] = 8'h00;
	SFDP['h257] = 8'hFC;
	SFDP['h258] = 8'h03;
	SFDP['h259] = 8'h00;
	SFDP['h25A] = 8'hFE;
	SFDP['h25B] = 8'hFE;
	SFDP['h25C] = 8'h02;
	SFDP['h25D] = 8'h02;
	SFDP['h25E] = 8'h07;
	SFDP['h25F] = 8'h0E;
end

always @(reset) begin
		
	IOC = True; //False;			// clear IOC status
	WSE = False;			// erase suspend status
	RSTEN = False;			// enable reset disabled
	read_slow_flag = False;
	RES = False;			// reserved status bit 6
	SIO_OUT = 4'h0;			// turn off SIO drivers
	spi_count = 0;			// clear spi clock counter
	spi_cmd = SPI_NOP;		// clear SPI command register
	sqi_cmd = SQI_NOP;		// clear SQI command register
	l_sqi_cmd = SQI_NOP;
	l_spi_cmd = SPI_NOP;
	RSTQIO_cmd  = SPI_NOP;
	SQI_SPI_mode = False;		// set to spi mode
	s_BE_flag=False; s_SE_flag=False;
	SPI_READ_active = False;
	SPI_READ_QUAD_active=False;
	SPI_SDOR_active = False;
	SPI_RDSR_active = False;
	SPI_QUAD_IO_READ_active=False;
	Mode_Configuration = 8'hFF;     // default Mode Configuration
	CE_flag=False; SE_flag=False; BE_flag=False;
	SPI_SB_active = False;
	SPI_JEDEC_ID_active = False;
	SPI_SFDP_active = False;
	burst_length=0;                 // set burst length to 8
	SPI_PSID_ip = False;
	SQI_HS_READ_active=False;
	SPI_WRSR_PGM_active = False;
	SPI_RBSPI_active=False;
	SPI_WBPR_active = False;
	SPI_nVWLDR_cmd_active=False;
	SPI_RBPR_active = False;
	SPI_SDIOR_active = False;
	SPI_PP_active = False;
	SQI_PP_active = False;
	valid_addr = False;					// default valid address
	valid_data = False;					// default valid data
	SPI_RDCR_active = False;
	SPI_QUAD_PP_active = False;
	SPI_RSID_active = False;
	erase_active = False;					// erase loop is active
	WEL = False;						// clear Write enable latch in status register
	#0 if(BUSY===True) begin				// if busy abort erase/program in progress
		if(page_program_active === True) begin		// abort PP program 
		   disable page_program_label;			// abort spi page program in progress
		   disable Sec_ID_pgm_label;			// Security ID program
		   #Trp page_program_active = False;		// clear busy on program , wait for program abort time
		   SPI_PSID_ip = False;				// abort security ID program loop
		end
		else if( erase_ip === True) begin		// abort erase SE,BE,CE
			WSP = False;				// write suspend status
			disable erase_label;
			#Tre erase_ip = False;
		end
		else if(SPI_LSID_active === True) begin		// abort Security ID lockout
			disable SPI_LSID_label;
			#Trp SPI_LSID_active = False;
			SEC = 1'bx;
		end
		else if(SPI_WRSR_active===True) begin		// reset during status register programing time
			disable SPI_WRSR_PGM;
			if(wsr_creg[7]===False) begin	// WPEN <- 0
				#Trp SPI_WRSR_active=False;
			end
			else begin			// WPEN <- 1
				#Tre SPI_WRSR_active=False;
			end
		end
		else if(SPI_nVWLDR_active===True) begin		// reset during WLLDR programing time
			disable SPI_nVWLDR_label;
			#Trp SPI_nVWLDR_active=False;
		end
		else if(SPI_WRSU_active===True) begin		// reset during suspend #Tws time
			disable SPI_WRSU_label;			// exit suspent loop
			#Trp SPI_WRSU_active=False;		// clear suspend loop active flag
		end
	end
	if (WSP === True) begin
		WSP = False;					// write suspend status
		pgm_sus_reset = True;
		#Trp pgm_sus_reset = False;
	end

	WSP = False;					// write suspend status
	suspend_addr=0; resume_addr=0;
	SPI_WRSU_active = False;
	SPI_PSID_active = False;
	page_program_active = False;
	erase_ip = False;
	SPI_LSID_active = False;
	SPI_WRSR_active=False;
	SPI_nVWLDR_active=False;
	SPI_LSID_active = False;
	WEL = False;						// clear Write enable latch in status register
end

//-------------------------------------------------------------
// protection functions, return True/False for read protection
// given and address
//-------------------------------------------------------------
function Read_proT;
input [AF_MSB:0] addr;                      // address
reg return_value;
reg [AF_MSB+1:0] taddr;
begin
	// clear upper address bits that are unused
	taddr = addr & (Memsize-1);

	return_value = True;		// set default return value
        if(taddr < (Memsize-(Kilo*32)) && taddr >= (Kilo*32)) return_value = False;		// check Memory that has no protection
        else if(taddr < (Kilo*8)) return_value  = protect[PROTECT_REG_MSB-14];	// check lower 8K
        else if(taddr < (Kilo*16)) return_value = protect[PROTECT_REG_MSB-12];	// next 8k
        else if(taddr < (Kilo*24)) return_value = protect[PROTECT_REG_MSB-10];	// next 8k
        else if(taddr < (Kilo*32)) return_value = protect[PROTECT_REG_MSB-8];	// next 8k

        else if(taddr >= (Memsize-(Kilo*8))) return_value = protect[PROTECT_REG_MSB-0];		// check top 8K
        else if(taddr >= (Memsize-(Kilo*16))) return_value = protect[PROTECT_REG_MSB-2];	// next 8K
        else if(taddr >= (Memsize-(Kilo*24))) return_value = protect[PROTECT_REG_MSB-4];	// next 8K
        else if(taddr >= (Memsize-(Kilo*32))) return_value = protect[PROTECT_REG_MSB-6];	// next 8K

	Read_proT = return_value;	// return True/False for read protection at this address
end
endfunction

//-------------------------------------------------------------
// protection functions, return True/False for write protection
// given and address True = protected
//-------------------------------------------------------------
function Write_proT;
input [AF_MSB:0] addr;                  // address
reg [AF_MSB+1:0] address;               // address
reg return_value;
reg [7:0] index;
reg [AF_MSB+1:0] taddr;
begin
	// clear upper address bits that are unused
	taddr = addr; taddr = taddr & (Memsize-1);

	return_value = True;		// set default return value
	if(taddr < (Memsize-(Kilo*64)) && taddr >= (Kilo*64)) begin				// check address 64K --> Memsize-64K
		index = 0;									// index to bottom of table
		address=(Kilo*64);								// starting address at bottom of table
		while(address < (Memsize-(Kilo*64)) && return_value===True) begin		// loop through each 64K block
			if(taddr >= address && taddr < (address + (Kilo*64))) begin
				if(protect_or[index] === False) return_value = False;		// check protect flag
			end
			index = index + 1;							// increment protect array pointer
			address = address+(Kilo*64);						// increment to next 64K protection block
		end
	end
	// check lower 64k of Memory
        else if(taddr < (Kilo*8) ) begin if(protect_or[PROTECT_REG_MSB-15]==False) return_value = False; end // check lower 8K
        else if(taddr < (Kilo*16)) begin if(protect_or[PROTECT_REG_MSB-13]==False) return_value = False; end // next 8k
        else if(taddr < (Kilo*24)) begin if(protect_or[PROTECT_REG_MSB-11]==False) return_value = False; end // next 8k
        else if(taddr < (Kilo*32)) begin if(protect_or[PROTECT_REG_MSB- 9]==False) return_value = False; end // next 8k
        else if(taddr < (Kilo*64)) begin if(protect_or[PROTECT_REG_MSB-17]==False) return_value = False; end // next 32k
	// check upper 64k of Memory
        else if(taddr >= (Memsize-(Kilo*8)) ) begin if(protect_or[PROTECT_REG_MSB-1]==False) return_value = False; end // check top 8K
        else if(taddr >= (Memsize-(Kilo*16))) begin if(protect_or[PROTECT_REG_MSB-3]==False) return_value = False; end // next 8K
        else if(taddr >= (Memsize-(Kilo*24))) begin if(protect_or[PROTECT_REG_MSB-5]==False) return_value = False; end // next 8K
        else if(taddr >= (Memsize-(Kilo*32))) begin if(protect_or[PROTECT_REG_MSB-7]==False) return_value = False; end // next 8K
        else if(taddr >= (Memsize-(Kilo*64))) begin if(protect_or[PROTECT_REG_MSB-16]==False) return_value = False; end // next 32K
	Write_proT = return_value;	// return True/False for read protection at this address
end
endfunction

//----------------------------------------------------------------
// check chip for any protection return False if OK to erase chip
//----------------------------------------------------------------
function Chip_proT;
input [AF_MSB:0] addr;                      // address, always 0
reg return_value;
begin
	return_value = |protect_or[PROTECT_REG_MSB:0];
	Chip_proT = return_value;
end
endfunction


//----------------------------------------------------------------------------------------
// check for program address matches erase address during suspend of block or sector erase
// in suspend mode verify that the address to be programed does not match suspended
// sector or block, return True if match
//----------------------------------------------------------------------------------------
function ERASE_PGM;
input [AF_MSB:0] erase_address_in;	// erase address of suspended block/sector
input [AF_MSB:0] pgm_address_in;	// address to program, check if it's in suspended sector/block
reg return_value;
reg [AF_MSB+1:0] erase_address,pgm_address;
begin
	// clear unused upper address bits
	erase_address = erase_address_in & (Memsize-1);
	pgm_address = pgm_address_in & (Memsize-1);

	return_value = False;			// default to no match
	if(WSE===True) begin			// make sure you are in erase suspend mode
		if(s_SE_flag === True) begin	// check if SE when suspended, I.E. 4K Sector Size
			if(erase_address[ADDR_MSB:12] === pgm_address[ADDR_MSB:12]) return_value = True;
		end
		// ---------------------------------------------------------------------
		// if block erase you must check address for block size
		// ---------------------------------------------------------------------
		else if(s_BE_flag === True) begin				// check if BE when suspended
			if(erase_address < (Kilo * 32)) begin 			// 8K block size
				if(erase_address[ADDR_MSB:13] === pgm_address[ADDR_MSB:13]) return_value = True;
			end
			else if( erase_address < (Kilo * 64)) begin		// 32k Block size
				if(erase_address[ADDR_MSB:15] === pgm_address[ADDR_MSB:15]) return_value = True;
			end
			else if( erase_address >= (Memsize-(Kilo * 32))) begin	// 8K block size
				if(erase_address[ADDR_MSB:13] === pgm_address[ADDR_MSB:13]) return_value = True;
			end
			else if( erase_address >= Memsize-(Kilo * 64)) begin	// 32k Block size
				if(erase_address[ADDR_MSB:15] === pgm_address[ADDR_MSB:15]) return_value = True;
			end
			else begin						// 64K block size
				if(erase_address[ADDR_MSB:16] === pgm_address[ADDR_MSB:16]) return_value = True;
			end
		end
	end
	ERASE_PGM = return_value;
end
endfunction

//----------------------------------------------------------------------------------------
// check for program address matches erase address during suspend of page program.
// In suspend mode verify that the address to be erased does not match suspended
// program address, return True if addresses match I.E. abort programing
//----------------------------------------------------------------------------------------
function PGM_ERASE;
input [AF_MSB:0] erase_address_in;	// erase address of block/sector to be erased
input [AF_MSB:0] pgm_address_in;	// suspended page program address
reg return_value;
reg [AF_MSB+1:0] erase_address, pgm_address;
begin
	// clear upper unused address bits
	erase_address = erase_address_in & (Memsize-1);
	pgm_address = pgm_address_in & (Memsize-1);

	return_value = False;	// default to no match
	if(WSP===True) begin	// make sure you are in program suspend mode
		if(l_spi_cmd===SPI_SE || l_sqi_cmd===SQI_SE) begin	// sector erase 4K size ?
			if(erase_address[AF_MSB:12] === pgm_address[AF_MSB:12]) return_value = True;
		end
		// ---------------------------------------------------------------------
		// if block erase you must check address for block size
		// ---------------------------------------------------------------------
		else if(l_spi_cmd===SPI_BE || l_sqi_cmd===SQI_BE) begin
			if(erase_address < (Kilo * 32)) begin 			// 8K block size
				if(erase_address[AF_MSB:13] === pgm_address[AF_MSB:13]) return_value = True;
			end
			else if( erase_address < (Kilo * 64)) begin		// 32k Block size
				if(erase_address[AF_MSB:15] === pgm_address[AF_MSB:15]) return_value = True;
			end
			else if( erase_address >= (Memsize-(Kilo * 32))) begin	// 8K block size
				if(erase_address[AF_MSB:13] === pgm_address[AF_MSB:13]) return_value = True;
			end
			else if( erase_address >= Memsize-(Kilo * 64)) begin	// 32k Block size
				if(erase_address[AF_MSB:15] === pgm_address[AF_MSB:15]) return_value = True;
			end
			else begin						// 64K block size
				if(erase_address[AF_MSB:16] === pgm_address[AF_MSB:16]) return_value = True;
			end
		end
	end
	PGM_ERASE = return_value;
end
endfunction
`endprotect

endmodule