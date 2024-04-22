----------------------------------------------------------------------------------
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
-- 02111-1307, USA.
--
-- ©1997-2010 - X Engineering Software Systems Corp. (www.xess.com)
----------------------------------------------------------------------------------

--------------------------------------------------------------------
--    Miscellaneous constants and functions for USER JTAG instructions.
--------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.CommonPckg.all;

package UserInstrJtagPckg is

  -- TDO register used to deliver test result back to the PC.
  constant TDO_LENGTH : natural := 32;
  subtype tdoType is std_logic_vector(TDO_LENGTH-1 downto 0);

  -- Register that receives the instruction to execute.
  constant INSTR_LENGTH : natural := 8;
  subtype instrType is std_logic_vector(INSTR_LENGTH-1 downto 0);

  -- Possible instructions that can be executed.
  constant INSTR_NOP           : instrType := "00000000";
  constant INSTR_RUN_TEST      : instrType := "00000011";
  constant INSTR_RAM_WRITE     : instrType := "00000101";
  constant INSTR_RAM_READ      : instrType := "00000111";
  constant INSTR_RAM_SIZE      : instrType := "00001001";
  constant INSTR_FLASH_ERASE   : instrType := "00001011";
  constant INSTR_FLASH_WRITE   : instrType := "00001101";
  constant INSTR_FLASH_BLK_PGM : instrType := "00001111";
  constant INSTR_FLASH_READ    : instrType := "00010001";
  constant INSTR_FLASH_SIZE    : instrType := "00010011";
  constant INSTR_CAPABILITIES  : instrType := "11111111";

  -- Possible capabilities for the instruction execution unit.
  -- The lower and upper bytes are mirrors of each other, and bits are set
  -- in the middle two bytes to indicate if a given capability is present.
  constant NO_CAPABILITIES        : tdoType := x"A50000A5";
  constant CAPABLE_RUN_TEST_BIT   : natural := 8;
  constant CAPABLE_RAM_WRITE_BIT  : natural := 9;
  constant CAPABLE_RAM_READ_BIT   : natural := 10;
  constant CAPABLE_FLASH_PGM_BIT  : natural := 11;
  constant CAPABLE_FLASH_READ_BIT : natural := 12;

  -- Operation status codes
  constant OP_INPROGRESS : tdoType := x"01230123";
  constant OP_PASSED     : tdoType := x"45674567";
  constant OP_FAILED     : tdoType := x"89AB89AB";

  component UserinstrJtag
    generic(
      FPGA_TYPE_G          : natural := SPARTAN3_G;         -- type of FPGA
      ENABLE_RAM_INTFC_G   : boolean := false;  -- true to enable JTAG-RAM interface
      ENABLE_FLASH_INTFC_G : boolean := false;  -- true to enable JTAG-Flash interface
      ENABLE_TEST_INTFC_G  : boolean := false;  -- true to enable JTAG-test diagnostic interface
      DATA_WIDTH_G         : natural := 16;  -- memory data width
      ADDR_WIDTH_G         : natural := 32;  -- memory address width (host-side)
      BLOCK_ADDR_WIDTH_G   : natural := 11   -- internal RAM buffer address width
      );
    port(
      clk           : in  std_logic;    -- main clock input
      bscan_drck    : in  std_logic;    -- JTAG clock from BSCAN module
      bscan_reset   : in  std_logic;    -- true when BSCAN module is reset
      bscan_sel     : in  std_logic;    -- true when BSCAN module selected
      bscan_shift   : in  std_logic;  -- true when TDI & TDO are shifting data
      bscan_update  : in  std_logic;  -- true when BSCAN TAP is in update-dr state
      bscan_tdi     : in  std_logic;    -- scan data received on TDI pin
      bscan_tdo     : out std_logic;    -- scan data sent to TDO pin
      rd            : out std_logic;    -- read signal to memory
      rd_continue   : out std_logic;    -- enable contiguous reads
      wr            : out std_logic;    -- write signal to memory
      erase         : out std_logic;    -- erase signal to memory
      blk_pgm       : out std_logic;    -- block programming signal to memory
      begun         : in  std_logic;    -- true when operation has begun
      done          : in  std_logic;    -- true when operation is done
      addr          : out std_logic_vector(ADDR_WIDTH_G-1 downto 0);  -- address to memory
      din           : in  std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data from memory
      dout          : out std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data to memory
      run_test      : out std_logic;    -- initiate test diagnostic
      test_progress : in  std_logic_vector(1 downto 0);  -- progress of test: in-progress or done
      test_failed   : in  std_logic;    -- test diagnostic failed
      s             : out std_logic_vector(6 downto 0)  -- 7-seg LED for displaying user feedback
      );
  end component;

end package;



----------------------------------------------------------------------------------
-- Description: SDRAM/RAM upload/download via JTAG.
--   Basic operation:
--     1) PC sends USER instruction to JTAG boundary-scan port on FPGA.
--        This activates the JTAG instruction execution unit.
--     2) The PC sends instructions via JTAG to accomplish one of the
--        following tasks:
--          A) Get RAM organization:
--               a) Send INSTR_RAM_SIZE instruction.
--               b) Read TDO register containing the width of the RAM address
--                  and data buses.
--          B) Write data to RAM:
--               a) Send INSTR_RAM_WRITE instruction.
--               b) Send starting address of RAM block.
--               c) Send number of words in the block of RAM to write.
--               d) Send data which is written into the RAM sequentially 
--                  from the starting address.
--          C) read data from RAM:
--               a) Send INSTR_RAM_READ instruction.
--               b) Send starting address of RAM block.
--               c) Send number of words in the block of RAM to read.
--               d) Read the TDO register containing RAM data as it is read
--                  sequentially from the starting address.
--
-- Description: Flash upload/download via JTAG.
--   Basic operation:
--     1) PC sends USER1 instruction to JTAG boundary-scan port on FPGA.
--        This activates the JTAG instruction execution unit.
--     2) The PC sends instructions via JTAG to accomplish one of the
--        following tasks:
--          A) Get Flash organization:
--               a) Send INSTR_FLASH_SIZE instruction.
--               b) Read TDO register containing the width of the Flash address
--                  and data buses, and the width of the block RAM address bus.
--          B) Erase the entire Flash chip:
--               a) Send the INSTR_FLASH_ERASE instruction.
--               b) Continually read the TDO register while the OP_INPROGRESS
--                  code is being returned, and stop when the OP_PASSED code
--                  is returned. The Flash is erased.
--          C) Program data into Flash:
--               a) Send INSTR_FLASH_PGM instruction.
--               b) Send starting address of Flash block.
--               c) Send number of words in the block of Flash to write.
--               d) Send data which is written into the block RAM. 
--                  When all the data is downloaded, the contents of the RAM
--                  block are automatically programmed into the Flash.
--               e) Continually read the TDO register while the OP_INPROGRESS
--                  code is being returned, and stop when the OP_PASSED code
--                  is returned. The Flash has been programmed with the data.
--          D) Read data from Flash:
--               a) Send INSTR_FLASH_READ instruction.
--               b) Send starting address of Flash block.
--               c) Send number of words in the block of Flash to read.
--               d) Read the TDO register containing Flash data as it is read
--                  sequentially from the starting address.
--------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.CommonPckg.all;
use work.UserInstrJtagPckg.all;

library UNISIM;
use UNISIM.VComponents.all;


entity UserinstrJtag is
  generic(
    FPGA_TYPE_G          : natural := SPARTAN3_G;         -- type of FPGA
    ENABLE_RAM_INTFC_G   : boolean := false;  -- true to enable JTAG-RAM interface
    ENABLE_FLASH_INTFC_G : boolean := false;  -- true to enable JTAG-Flash interface
    ENABLE_TEST_INTFC_G  : boolean := false;  -- true to enable JTAG-test diagnostic interface
    DATA_WIDTH_G         : natural := 16;     -- memory data width
    ADDR_WIDTH_G         : natural := 32;     -- memory address width (host-side)
    BLOCK_ADDR_WIDTH_G   : natural := 11  -- internal RAM buffer address width
    );
  port(
    clk           : in  std_logic;      -- main clock input
    bscan_drck    : in  std_logic;      -- JTAG clock from BSCAN module
    bscan_reset   : in  std_logic;      -- true when BSCAN module is reset
    bscan_sel     : in  std_logic;      -- true when BSCAN module selected
    bscan_shift   : in  std_logic;  -- true when TDI & TDO are shifting data
    bscan_update  : in  std_logic;  -- true when BSCAN TAP is in update-dr state
    bscan_tdi     : in  std_logic;      -- scan data received on TDI pin
    bscan_tdo     : out std_logic;      -- scan data sent to TDO pin
    rd            : out std_logic;      -- read signal to memory
    rd_continue   : out std_logic;      -- enable contiguous reads
    wr            : out std_logic;      -- write signal to memory
    erase         : out std_logic;      -- erase signal to memory
    blk_pgm       : out std_logic;      -- block programming signal to memory
    begun         : in  std_logic;      -- true when operation has begun
    done          : in  std_logic;      -- true when operation is done
    addr          : out std_logic_vector(ADDR_WIDTH_G-1 downto 0);  -- address to memory
    din           : in  std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data from memory
    dout          : out std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data to memory
    run_test      : out std_logic;      -- initiate test diagnostic
    test_progress : in  std_logic_vector(1 downto 0);  -- progress of test: in-progress or done
    test_failed   : in  std_logic;      -- test diagnostic failed
    s             : out std_logic_vector(6 downto 0)  -- 7-seg LED for displaying user feedback
    );
end entity;


architecture arch of UserinstrJtag is

  -- signal conditioning for drck to prevent transients on the clock signal
  signal drck_sreg  : std_logic_vector(3 downto 0) := "0000";
  signal drck_pulse : std_logic;
  signal jtag_clk   : std_logic;

  -- registers for JTAG instruction execution unit
  signal instr    : instrType;  -- register that receives the instruction to execute via JTAG
  signal tdo      : tdoType;  -- TDO register used to deliver results back via JTAG
  signal rw_cntr  : std_logic_vector(ADDR_WIDTH_G-1 downto 0);  -- stores the number of words left to read/write to memory
  signal bit_cntr : natural range 0 to 2*ADDR_WIDTH_G+DATA_WIDTH_G-1;  -- counts the number of operand bits received after the instruction

  -- signals from the JTAG instruction execution unit to/from the memory interface
  signal jaddr        : std_logic_vector(ADDR_WIDTH_G-1 downto 0);  -- address for read/write
  signal jrd          : std_logic;      -- initiate a read
  signal jrd_continue : std_logic;      -- enable contiguous reads
  signal jwr          : std_logic;      -- initiate a write
  signal jerase       : std_logic;      -- initiate an erase
  signal jblk_pgm     : std_logic;  -- initiate the programming of block RAM contents into memory
  signal rd_word      : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data read from memory
  signal jrd_word     : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data from memory sync'ed to JTAG clock domain
  signal wr_word      : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- data written to memory
  signal buff         : std_logic_vector(DATA_WIDTH_G-1 downto 0);  -- buffer for data to be written
  signal op_done      : std_logic;      -- operation from instr unit is done
  signal jop_done     : std_logic;  -- instr unit done signal sync'ed to JTAG clock domain

  -- synchronizing counters for crossing between JTAG and memory clock domains  
  constant SYNC_DLY       : natural := 2;  -- must be 6 or less
  signal rd_dly           : natural range 0 to SYNC_DLY+2;  -- for read operations  
  signal wr_dly           : natural range 0 to SYNC_DLY+2;  -- for write operations  
  signal erase_dly        : natural range 0 to SYNC_DLY+2;  -- for erase operations  
  signal blk_pgm_dly      : natural range 0 to SYNC_DLY+2;  -- for block programming operations  
  signal rd_continue_sync : std_logic;  -- sync flip-flop register

  -- LED patterns displayed during execution of instructions for user feedback  
  constant LED_ZERO         : std_logic_vector(s'range) := "1110111";
  constant LED_ONE          : std_logic_vector(s'range) := "0010010";
  constant LED_TWO          : std_logic_vector(s'range) := "1011101";
  constant LED_THREE        : std_logic_vector(s'range) := "1011011";
  constant LED_FOUR         : std_logic_vector(s'range) := "0111010";
  constant LED_FIVE         : std_logic_vector(s'range) := "1101011";
  constant LED_SIX          : std_logic_vector(s'range) := "1101111";
  constant LED_SEVEN        : std_logic_vector(s'range) := "1010010";
  constant LED_EIGHT        : std_logic_vector(s'range) := "1111111";
  constant LED_NINE         : std_logic_vector(s'range) := "1111011";
  constant LED_DASH         : std_logic_vector(s'range) := "0001000";
  constant LED_WRITE        : std_logic_vector(s'range) := LED_ONE;
  constant LED_READ         : std_logic_vector(s'range) := LED_TWO;
  constant LED_ERASE        : std_logic_vector(s'range) := LED_THREE;
  constant LED_PGM          : std_logic_vector(s'range) := LED_FOUR;
  constant LED_SIZE         : std_logic_vector(s'range) := LED_FIVE;
  constant LED_TEST         : std_logic_vector(s'range) := LED_SIX;
  constant LED_CAPABILITIES : std_logic_vector(s'range) := LED_SEVEN;
  constant LED_NOP          : std_logic_vector(s'range) := LED_DASH;
  
begin

  bscan_tdo <= tdo(0);  -- send output of TDO shift-register to TDO pin

  -- Generate a single-cycle pulse on the rising edge of drck.
  -- This cleans-up the drck signal which seems to get transients when the SDRAM refreshes on the XSA-3S1000 Board.
  process(bscan_reset, clk)
  begin
    if bscan_reset = YES then
      drck_sreg <= "0000";
    elsif rising_edge(clk) then
      drck_sreg <= bscan_drck & drck_sreg(drck_sreg'high downto 1);
      if drck_sreg = "1100" then  -- make sure we have a clean edge on drck
        drck_pulse <= HI;
      else
        drck_pulse <= LO;
      end if;
    end if;
  end process;

  jtag_clk <= drck_pulse when FPGA_TYPE_G = SPARTAN3_G else bscan_drck;

  -- This process waits for instructions and operands to arrive through the JTAG port
  -- and then executes them.
  process(bscan_reset, jtag_clk)
  begin

    -- Load the NOP instruction when the boundary-scan is reset.
    if bscan_reset = YES then
      instr        <= INSTR_NOP;
      -- no operations are initiated in the reset state
      jrd          <= NO;
      jrd_continue <= NO;
      jwr          <= NO;
      jerase       <= NO;
      jblk_pgm     <= NO;
      run_test     <= NO;

    elsif rising_edge(jtag_clk) then
      
      jrd_word <= rd_word;
      jop_done <= op_done;

      -- Get instructions and operands and then execute them when the JTAG TAP FSM
      -- has received the USER1 instruction and is placed in the SHIFT-DR state.
      if bscan_shift = YES and bscan_sel = YES then

        -- This counter keeps track of where we are in the execution of an instruction.
        -- Depending upon its value, we may be shifting-in an address, RAM block size,
        -- or data.
        bit_cntr <= bit_cntr + 1;

        -- This register stores data that is shifted-out through the TDO pin of
        -- the JTAG port back to the PC.
        tdo <= '1' & tdo(tdo'high downto 1);  -- shift-out contents of TDO register

        -- Shift bits into the instruction register until a complete instruction
        -- has been assembled.  An instruction is not complete until the LSbit of 
        -- the instr. reg. is '1'.
        if instr(0) = '0' then
          instr    <= bscan_tdi & instr(instr'high downto 1);  -- shift the TDI bit into the MSB of the instr. reg.
          bit_cntr <= 0;  -- no operand bits are received until a complete instruction is present 
          -- no operations are initiated in the NOP state
          jrd      <= NO;
          jwr      <= NO;
          jerase   <= NO;
          jblk_pgm <= NO;
          run_test <= NO;

        -- A complete instruction has been received, so gather the operands and execute it.
        else

          -- disable all operations by default
          jrd      <= NO;
          jwr      <= NO;
          jerase   <= NO;
          jblk_pgm <= NO;
          run_test <= NO;

          case instr is

            -- Write data to memory.
            when INSTR_RAM_WRITE | INSTR_FLASH_WRITE =>
              if ENABLE_RAM_INTFC_G = true or ENABLE_FLASH_INTFC_G = true then
                s <= LED_WRITE;  -- use the LED to indicate memory writes are in progress 
                -- Gather the initial operand bits and form the starting address.
                if bit_cntr < ADDR_WIDTH_G then
                  jaddr <= bscan_tdi & jaddr(jaddr'high downto 1);
                -- Gather the following bits and form the size of the data block to be written.
                elsif bit_cntr < 2*ADDR_WIDTH_G then
                  rw_cntr <= bscan_tdi & rw_cntr(rw_cntr'high downto 1);
                  -- While the block size is being gathered, pre-decrement the starting
                  -- address once because we will pre-increment it later when writing starts.
                  if bit_cntr = ADDR_WIDTH_G then
                    jaddr <= jaddr - 1;
                  end if;
                -- Gather first N-1 bits of data word to be written to memory.
                elsif bit_cntr < 2*ADDR_WIDTH_G+DATA_WIDTH_G-1 then
                  buff <= bscan_tdi & buff(buff'high downto 1);
                -- Get the last bit of the data word and send it and the address to memory.
                else  -- if bit_cntr = 2*ADDR_WIDTH_G+DATA_WIDTH_G-1 then
                  wr_word  <= bscan_tdi & buff(buff'high downto 1);
                  jaddr    <= jaddr + 1;  -- increment to the address which will be written to
                  jwr      <= YES;      -- activate the write operation
                  -- Now set the bit counter so we start gathering the next word of data
                  -- to write to memory.  There is no need to gather the address since we can
                  -- get that by incrementing the current address.
                  bit_cntr <= 2*ADDR_WIDTH_G;
                  rw_cntr  <= rw_cntr - 1;  -- one less word to write to memory
                  -- If all the data has been written to memory (remember, the decrement of
                  -- the word counter has not occurred yet), then go back and wait for
                  -- another instruction to arrive.
                  if rw_cntr = 1 then
                    if instr = INSTR_RAM_WRITE then
                      -- a complete block of data has been written to RAM
                      instr <= INSTR_NOP;
                    end if;
                    if instr = INSTR_FLASH_WRITE then
                      -- once a complete block of data is received, program it into Flash
                      tdo      <= OP_INPROGRESS;  -- immediately inform the PC that the Flash programming is in-progress.
                      bit_cntr <= 1;  -- TDO usually gets loaded when counter is 0, so it will be 1 after the load
                      instr    <= INSTR_FLASH_BLK_PGM;  -- self-initiate this instruction
                    end if;
                  end if;
                end if;
              else
                null;
              end if;

            -- Read data from the memory.
            when INSTR_RAM_READ | INSTR_FLASH_READ =>
              if ENABLE_RAM_INTFC_G = true or ENABLE_FLASH_INTFC_G = true then
                s <= LED_READ;  -- use the LED to indicate memory reads are in progress 
                -- Gather the initial operand bits and form the starting address.
                if bit_cntr < ADDR_WIDTH_G then
                  jaddr        <= bscan_tdi & jaddr(jaddr'high downto 1);  -- gather address
                  jrd_continue <= YES;
                -- Gather the following bits and form the size of the data block to be read.
                elsif bit_cntr < 2*ADDR_WIDTH_G then
                  rw_cntr <= bscan_tdi & rw_cntr(rw_cntr'high downto 1);
                  -- Initiate the first read while gathering the number of words to read.
                  if bit_cntr = ADDR_WIDTH_G then
                    jrd          <= YES;
                    jrd_continue <= YES;
                  end if;
                  -- The first read should be done by now, so load the data from memory into
                  -- the TDO register for transfer to the PC.
                  if bit_cntr = 2*ADDR_WIDTH_G-1 then
                    tdo(jrd_word'range) <= jrd_word;
                  end if;
                -- Send the data read from memory to the PC.  Transfer contents of TDO to the PC
                -- during this phase (TDI bits are ignored).
                elsif bit_cntr < 2*ADDR_WIDTH_G+DATA_WIDTH_G-1 then
                  -- Initiate the next read from memory while the current data word is shifted out.
                  if bit_cntr = 2*ADDR_WIDTH_G then
                    jaddr <= jaddr + 1;  -- increment to the address which will be read from next
                    jrd   <= YES;       -- activate the read operation
                  end if;
                -- Send the last bit of the data word while getting the next data word from memory.
                else            -- if bit_cntr = 2*ADDR_WIDTH_G+DATA_WIDTH_G-1 then
                  tdo(jrd_word'range) <= jrd_word;  -- load next data word from memory into TDO register
                  -- Now set the bit counter so we start sending the next word of data from memory
                  -- to the PC.  There is no need to gather the address since we can
                  -- get that by incrementing the current address.
                  bit_cntr            <= 2*ADDR_WIDTH_G;
                  rw_cntr             <= rw_cntr - 1;  -- one less word to read from memory
                  -- If all the data has been read from memory (remember, the decrement of
                  -- the word counter has not occurred yet), then go back and wait for
                  -- another instruction to arrive.
                  if rw_cntr = 1 then
                    jrd          <= NO;  -- deactivate the read operation
                    jrd_continue <= NO;
                    instr        <= INSTR_NOP;
                  end if;
                end if;
              else
                null;
              end if;

            -- Erase the Flash chip.
            when INSTR_FLASH_ERASE =>
              if ENABLE_FLASH_INTFC_G = true then
                s      <= LED_ERASE;  -- use the LED to indicate Flash is being erased
                jerase <= YES;          -- initiate the erasure by default
                -- place the status of the erasure in the TDO register after the previous status has shifted out 
                if bit_cntr = 0 then
                  if jop_done = YES then
                    tdo    <= OP_PASSED;   -- erasure is done, so tell the PC
                    jerase <= NO;       -- stop the erase process              
                    instr  <= INSTR_NOP;   -- wait for further instructions
                  else
                    tdo <= OP_INPROGRESS;  -- not done, so tell the PC erasure is still in progress
                  end if;
                elsif bit_cntr = TDO_LENGTH-1 then
                  bit_cntr <= 0;        -- roll-over the bit counter
                end if;
              else
                null;
              end if;

            -- Initiate the transfer of the block RAM to the Flash chip.
            when INSTR_FLASH_BLK_PGM =>
              if ENABLE_FLASH_INTFC_G = true then
                s        <= LED_PGM;  -- use the LED to indicate a block of Flash is being programmed
                jwr      <= NO;         -- no more writing to block RAM
                jblk_pgm <= YES;  -- initiate the transfer of the block RAM to the Flash
                -- place the status of the programming in the TDO register after the previous status has shifted out 
                if bit_cntr = 0 then
                  if jop_done = YES then
                    tdo      <= OP_PASSED;  -- block of Flash has been programmed, so tell the PC
                    jblk_pgm <= NO;  -- stop the block programming process               
                    instr    <= INSTR_NOP;  -- wait for further instructions
                  else
                    tdo <= OP_INPROGRESS;  -- not done, so tell the PC block programming is still in progress
                  end if;
                elsif bit_cntr = TDO_LENGTH-1 then
                  bit_cntr <= 0;        -- roll-over the bit counter
                end if;
              else
                null;
              end if;

            -- Send back the organization of the memory.              
            when INSTR_RAM_SIZE | INSTR_FLASH_SIZE =>
              if ENABLE_RAM_INTFC_G = true or ENABLE_FLASH_INTFC_G = true then
                s <= LED_SIZE;  -- use the LED to indicate memory organization is being queried
                -- Send back the memory address and data widths to the PC
                if bit_cntr = 0 then
                  tdo(23 downto 0) <= CONV_STD_LOGIC_VECTOR(BLOCK_ADDR_WIDTH_G, 8) &  -- not used with RAM
                                       CONV_STD_LOGIC_VECTOR(ADDR_WIDTH_G, 8) &
                                       CONV_STD_LOGIC_VECTOR(DATA_WIDTH_G, 8);
                  instr <= INSTR_NOP;  -- wait for another instruction while memory size information shifts out
                end if;
              else
                null;
              end if;

            -- Run a diagnostic on the board.
            when INSTR_RUN_TEST =>
              if ENABLE_TEST_INTFC_G = true then
                run_test <= YES;  -- Not really needed.  Diagnostic will run to completion as long as button is not pressed.
                if bit_cntr = 0 then
                  if test_progress /= "11" then
                    tdo <= OP_INPROGRESS;
                  else
                    if test_failed = YES then
                      tdo <= OP_FAILED;
                    else
                      tdo <= OP_PASSED;
                    end if;
                  end if;
                elsif bit_cntr = TDO_LENGTH-1 then
                  bit_cntr <= 0;        -- roll-over the bit counter
                end if;
              else
                null;
              end if;

            -- Send back the capabilities that this interface supports
            when INSTR_CAPABILITIES =>
              s <= LED_CAPABILITIES;  -- use the LED to indicate interface capabilities are being queried
              if bit_cntr = 0 then
                tdo <= NO_CAPABILITIES;
                if ENABLE_RAM_INTFC_G = true then
                  tdo(CAPABLE_RAM_READ_BIT)  <= YES;
                  tdo(CAPABLE_RAM_WRITE_BIT) <= YES;
                end if;
                if ENABLE_FLASH_INTFC_G = true then
                  tdo(CAPABLE_FLASH_READ_BIT) <= YES;
                  tdo(CAPABLE_FLASH_PGM_BIT)  <= YES;
                end if;
                if ENABLE_TEST_INTFC_G = true then
                  tdo(CAPABLE_RUN_TEST_BIT) <= YES;
                end if;
                instr <= INSTR_NOP;  -- wait for another instruction while capabilities information shifts out
              end if;
              
            when others =>
              s <= LED_NOP;  -- use the LED to indicate NOP instruction is being executed
          end case;

        end if;

      -- The JTAG TAP FSM is no longer in the SHIFT-DR state or executing the USER1
      -- instruction, so the JTAG instruction execution unit should execute NOP's.
      else
        instr    <= INSTR_NOP;
        jrd      <= NO;
        jwr      <= NO;
        jerase   <= NO;
        jblk_pgm <= NO;
        run_test <= NO;
      end if;
      
    end if;

  end process;

  addr <= jaddr;    -- output memory address from the JTAG interface
  dout <= wr_word;  -- output memory data from the JTAG interface

  -- Transform slow read/write signals from the JTAG instruction execution unit into fast 
  -- read/write signals for the memory.
  process(clk)
  begin
    if rising_edge(clk) then
      
--      rd_continue_sync <= jrd_continue;
--      rd_continue      <= rd_continue_sync;
      rd_continue <= jrd_continue;

      -- if a read is starting or in-progress...
      if jrd = YES or rd_dly >= SYNC_DLY then
        if rd_dly < SYNC_DLY then
          -- wait for the read initiation to sync across the clock boundary
          rd_dly <= rd_dly + 1;
        elsif rd_dly = SYNC_DLY then
          -- start the actual read operation
          rd     <= YES;
          rd_dly <= rd_dly + 1;         -- go to the next state
        elsif rd_dly = SYNC_DLY+1 then
          if begun = YES then
            -- remove the read signal as soon as the memory initiates the read
            rd <= NO;
          end if;
          if done = YES then
            -- send the data from the memory to the JTAG interface when the read operation is done
            op_done <= YES;
            rd_word <= din;
            rd_dly  <= rd_dly + 1;      -- go to the next state 
          end if;
        else
          -- wait until the slow read signal is removed
          if jrd = NO then
            op_done <= NO;
            rd_dly  <= 0;
          end if;
        end if;

      -- if a write is starting or in-progress...
      elsif jwr = YES or wr_dly >= SYNC_DLY then
        if wr_dly < SYNC_DLY then
          -- wait for the write initiation to sync across the clock boundary
          wr_dly <= wr_dly + 1;
        elsif wr_dly = SYNC_DLY then
          -- start the actual write operation
          wr     <= YES;
          wr_dly <= wr_dly + 1;         -- go to the next state
        elsif wr_dly = SYNC_DLY+1 then
          if begun = YES then
            -- remove the write signal as soon as the memory initiates the write
            wr <= NO;
          end if;
          if done = YES then
--           op_done <= YES; -- uncommenting this causes failures of flash programming.  I don't know why.
            wr_dly <= wr_dly + 1;       -- go to the next state
          end if;
        else
          -- wait until the slow write signal is removed
          if jwr = NO then
            op_done <= NO;
            wr_dly  <= 0;
          end if;
        end if;

      -- if an erase is starting or in-progress...
      elsif jerase = YES or erase_dly >= SYNC_DLY then
        if erase_dly < SYNC_DLY then
          erase_dly <= erase_dly + 1;  -- wait for the erase initiation to sync across the clock boundary
        elsif erase_dly = SYNC_DLY then
          erase     <= YES;             -- start the actual erase operation
          erase_dly <= erase_dly + 1;   -- go to the next state
        elsif erase_dly = SYNC_DLY+1 then
          if begun = YES then
            erase <= NO;  -- remove the erase signal as soon as the Flash initiates the erase
          end if;
          if done = YES then
            op_done   <= YES;  -- indicate when the erase operation is done
            erase_dly <= erase_dly + 1;  -- go to the next state 
          end if;
        else
          -- wait until the slow erase signal is removed
          if jerase = NO then
            op_done   <= NO;
            erase_dly <= 0;
          end if;
        end if;

      -- if a block programming is starting or in-progress...
      elsif jblk_pgm = YES or blk_pgm_dly >= SYNC_DLY then
        if blk_pgm_dly < SYNC_DLY then
          blk_pgm_dly <= blk_pgm_dly + 1;  -- wait for the block programming initiation to sync across the clock boundary
        elsif blk_pgm_dly = SYNC_DLY then
          blk_pgm     <= YES;  -- start the actual block programming operation
          blk_pgm_dly <= blk_pgm_dly + 1;  -- go to the next state
        elsif blk_pgm_dly = SYNC_DLY+1 then
          if begun = YES then
            blk_pgm <= NO;  -- remove the block programming signal as soon as the Flash initiates the operation
          end if;
          if done = YES then
            op_done     <= YES;  -- indicate when the block programming operation is done
            blk_pgm_dly <= blk_pgm_dly + 1;  -- go to the next state 
          end if;
        else
          -- wait until the slow block programming signal is removed
          if jblk_pgm = NO then
            op_done     <= NO;
            blk_pgm_dly <= 0;
          end if;
        end if;

      -- clear everything if the slow signal from the JTAG instruction execution unit is absent or didn't last long enough
      else
        op_done     <= NO;
        rd          <= NO;
        rd_dly      <= 0;
        wr          <= NO;
        wr_dly      <= 0;
        erase       <= NO;
        erase_dly   <= 0;
        blk_pgm     <= NO;
        blk_pgm_dly <= 0;
      end if;
    end if;
  end process;

end architecture;
