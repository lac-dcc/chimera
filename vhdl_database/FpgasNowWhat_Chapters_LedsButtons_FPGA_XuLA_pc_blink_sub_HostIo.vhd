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
-- ©2011 - X Engineering Software Systems Corp. (www.xess.com)
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Modules for passing bits back and forth from the host PC
-- to FPGA application logic through the JTAG port.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use work.CommonPckg.all;

package HostIoPckg is

-- Use one of these to select which USER opcode enables the I/O to the host through the JTAG port.
  type TapUserInstr_t is (USER1, USER2);

  -- Use one of these to select the memory operation to perform via the JTAG port.
  constant NOP_OPCODE_C   : std_logic_vector(1 downto 0) := "00";
  constant SIZE_OPCODE_C  : std_logic_vector(1 downto 0) := "01";
  constant WRITE_OPCODE_C : std_logic_vector(1 downto 0) := "10";
  constant READ_OPCODE_C  : std_logic_vector(1 downto 0) := "11";

  component BscanToHostIo is
    generic (
      TAP_USER_INSTR_G : TapUserInstr_t := USER1  -- USER instruction this module responds to.
      );
    port (
      -- Interface to HostIoHdrScannner.
      inShiftDr_o : out std_logic;  -- True when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
      drck_o      : out std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
      tdi_o       : out std_logic;  -- Bit from the host to the FPGA application logic.
      tdo_i       : in  std_logic  -- Bit from the FPGA application logic to the host.
      );
  end component;

  component HostIoHdrScannner is
    generic (
      ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
      PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
      );
    port (
      -- Interface to BscanHostIo.
      inShiftDr_i : in  std_logic;  -- True when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
      drck_i      : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
      tdi_i       : in  std_logic;  -- Bit from the host to the FPGA application logic.
      -- Interface to FPGA application logic.
      pyldCntr_o  : out std_logic_vector(PYLD_CNTR_LENGTH_G-1 downto 0);  -- This counts down the number of payload bits still to be received.
      active_o    : out std_logic  -- Tell the external circuitry it has been activated.
      );
  end component;

  component RamCtrlSync is
    port (
      clk_i     : in  std_logic;        -- Clock for this domain.
      ctrlIn_i  : in  std_logic;  -- RAM control signal from other clock domain.
      ctrlOut_o : out std_logic;  -- RAM control signal for this clock domain.
      doneIn_i  : in  std_logic;  -- RAM operation done signal from this clock domain.
      doneOut_o : out std_logic  -- RAM operation done signal for the other clock domain. 
      );
  end component;

  component HostIoToMem is
    generic (
      ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
      PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
      );
    port (
      reset_i        : in  std_logic := LO;        -- Active-high reset signal.
      -- Interface to BscanHostIo.
      inShiftDr_i    : in  std_logic;  -- true when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
      drck_i         : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
      tdi_i          : in  std_logic;  -- Bit from the host to the FPGA application logic.
      tdo_o          : out std_logic;  -- Bit from the FPGA application logic to the host.
      -- Interface to the memory.
      addr_o         : out std_logic_vector;       -- Address to memory.
      wr_o           : out std_logic;   -- Write data to memory when high.
      dataFromHost_o : out std_logic_vector;       -- Data written to memory.
      rd_o           : out std_logic;   -- Read data from memory when high.
      dataToHost_i   : in  std_logic_vector;       -- Data read from memory.
      rwDone_i       : in  std_logic := HI  -- True when memory read/write operation is done.
      );
  end component;

  component HostIoToDut is
    generic (
      ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
      PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
      );
    port (
      reset_i         : in  std_logic := LO;  -- Active-high reset signal.
      -- Interface to BscanHostIo.
      inShiftDr_i     : in  std_logic;  -- true when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
      drck_i          : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
      tdi_i           : in  std_logic;  -- Bit from the host to the FPGA application logic.
      tdo_o           : out std_logic;  -- Bit from the FPGA application logic to the host.
      -- Test vector I/O.
      clkToDut_o      : out std_logic;  -- Rising edge clock signals arrival of vector to FPGA app. logic.
      vectorFromDut_i : in  std_logic_vector;  -- Gather inputs to send back to host thru this bus.
      vectorToDut_o   : out std_logic_vector  -- Output test vector from the host to FPGA app. logic thru this bus.
      );
  end component;

  component HostIoToRam is
    generic (
      ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
      PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
      );
    port (
      reset_i        : in  std_logic := LO;        -- Active-high reset signal.
      -- Interface to BscanHostIo.
      inShiftDr_i    : in  std_logic;  -- true when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
      drck_i         : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
      tdi_i          : in  std_logic;  -- Bit from the host to the FPGA application logic.
      tdo_o          : out std_logic;  -- Bit from the FPGA application logic to the host.
      -- Interface to the memory.
      clk_i          : in  std_logic;   -- Clock from FPGA application logic. 
      addr_o         : out std_logic_vector;       -- Address to memory.
      wr_o           : out std_logic;   -- Write data to memory when high.
      dataFromHost_o : out std_logic_vector;       -- Data written to memory.
      rd_o           : out std_logic;   -- Read data from memory when high.
      dataToHost_i   : in  std_logic_vector;       -- Data read from memory.
      rwDone_i       : in  std_logic := HI  -- High when memory read/write operation is done.
      );
  end component;

end package;



--**************************************************************************************************
-- This module connects the BSCAN primitive to a HostIo module.
--**************************************************************************************************

library IEEE, UNISIM;
use IEEE.STD_LOGIC_1164.all;
use UNISIM.VComponents.all;
use work.CommonPckg.all;
use work.HostIoPckg.all;

entity BscanToHostIo is
  generic (
    TAP_USER_INSTR_G : TapUserInstr_t := USER1  -- USER instruction this module responds to.
    );
  port (
    -- Interface to HostIoHdrScannner.
    inShiftDr_o : out std_logic;  -- True when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
    drck_o      : out std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
    tdi_o       : out std_logic;  -- Bit from the host to the FPGA application logic.
    tdo_i       : in  std_logic  -- Bit from the FPGA application logic to the host.
    );
end entity;


architecture arch of BscanToHostIo is
  -- Signals from BSCAN primitive.
  signal bscanReset_s : std_logic;
  signal bscanShift_s : std_logic;
  signal bscanDrck1_s : std_logic;
  signal bscanDrck2_s : std_logic;
  signal bscanSel1_s  : std_logic;
  signal bscanSel2_s  : std_logic;
  signal bscanSel_s   : std_logic;
begin

  -- Boundary-scan interface to FPGA JTAG port.
  UBscanUser : BSCAN_SPARTAN3A
    port map(
      DRCK1 => bscanDrck1_s,  -- data clock after USER1 instruction received.
      DRCK2 => bscanDrck2_s,  -- data clock after USER2 instruction received.
      RESET => bscanReset_s,            -- JTAG TAP FSM reset.
      SEL1  => bscanSel1_s,             -- USER1 instruction enables user-I/O.
      SEL2  => bscanSel2_s,             -- USER2 instruction enables user-I/O.
      SHIFT => bscanShift_s,  -- True when JTAG TAP FSM is in the SHIFT-DR state.
      TDI   => tdi_o,  -- Data bits from the host arrive through here.
      TDO1  => tdo_i,  -- Bits from the FPGA app. logic go to the TDO pin and back to the host.
      TDO2  => tdo_i  -- Bits from the FPGA app. logic go to the TDO pin and back to the host.
      );

  -- Select the appropriate sel signal based upon which USER instruction this module responds to.
  bscanSel_s <= bscanSel1_s when TAP_USER_INSTR_G = USER1 else bscanSel2_s;

  -- Detect when a USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
  inShiftDr_o <= YES when bscanReset_s = LO and bscanShift_s = HI and bscanSel_s = HI else NO;

  -- Output the appropriate drck signal to the HostIo module.
  drck_o <= bscanDrck1_s when TAP_USER_INSTR_G = USER1 else bscanDrck2_s;

end architecture;



--**************************************************************************************************
-- This module accepts a bitstream from a BscanHostIo module and extracts an ID and
-- the number of payload bits that follow.  It triggers a downstream module if the received
-- ID matches the ID passed in by the generic parameter. The downstream module accepts the
-- bitstream until all the payload bits are processed.  The downstream module can also return
-- results that it has produced (usually from an operation initiated by a previous instruction). 
-- After the payload bit counter decrements to zero, this module is reset and it
-- repeats the entire process for the next instruction.
--
--             |                    Complete Instruction                      |
--             |          Header reception           |   Payload reception    |
-- TDI:        |       ID        | # of payload bits | Payload bits from host |
-- TDO:        |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx| Result bits from FPGA  |
-- Bit counter |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  N-1 N-2 ...... 2 1 0  |
--**************************************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.CommonPckg.all;

entity HostIoHdrScannner is
  generic (
    ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
    PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
    );
  port (
    -- Interface to BscanHostIo.
    inShiftDr_i : in  std_logic;  -- True when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
    drck_i      : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
    tdi_i       : in  std_logic;  -- Bit from the host to the FPGA application logic.
    -- Interface to FPGA application logic.
    pyldCntr_o  : out std_logic_vector(PYLD_CNTR_LENGTH_G-1 downto 0);  -- This counts down the number of payload bits still to be received.
    active_o    : out std_logic  -- Tell the external circuitry it has been activated.
    );
end entity;


architecture arch of HostIoHdrScannner is
  -- The header register consists of the ID field and a field with the # of payload bits that follow.
  signal id_r       : std_logic_vector(ID_G'high downto ID_G'low);
  signal pyldCntr_r : std_logic_vector(pyldCntr_o'range);
  signal hdrRcvd_r  : std_logic;  -- High after an ID and # of payload bits have been shifted in.
begin

  -- Scan in the header and any following payload bits.
  process(drck_i)
  begin
    if rising_edge(drck_i) then

      -- Reset the header register if BSCAN drops out of USER SHIFT-DR state or if the current instruction is done.
      -- Detect when an instruction is done, i.e. has received all its payload bits.
      -- Detection uses payload counter value of 1 (not 0) because the last bit has entered at that point.
      if inShiftDr_i = NO or (hdrRcvd_r = YES and pyldCntr_r = 1) then
        -- Clear the header register and set MSbit of payload bit counter.  A header has
        -- been received when this bit has been shifted all the way through the counter and ID
        -- registers and into the header received flag.
        id_r                        <= (others => ZERO);
        pyldCntr_r                  <= (others => ZERO);
        pyldCntr_r(pyldCntr_r'high) <= YES;
        hdrRcvd_r                   <= NO;
        
      else    -- Otherwise, shift in header bits on the rising edge of DRCK.
        if hdrRcvd_r = NO then  -- Shift bits into the header register until a complete header is received.
          pyldCntr_r <= tdi_i & pyldCntr_r(pyldCntr_r'high downto 1);
          id_r       <= pyldCntr_r(0) & id_r(id_r'high downto 1);
          hdrRcvd_r  <= id_r(0);
        else  -- After a header has been received, count down the number of payload bits following the header.
          pyldCntr_r <= pyldCntr_r - 1;
        end if;
      end if;
    end if;
  end process;

  -- This module is activated if it matches the ID in the header.
  active_o <= HI when (id_r(id_r'high downto 0) = ID_G(0 to ID_G'high)) and (hdrRcvd_r = HI) else LO;

  -- Output the number of payload bits still to be received.
  pyldCntr_o <= pyldCntr_r;
  
end architecture;



--**************************************************************************************************
-- This module interfaces with BscanToHostIo to perform read/write operations to memory devices.
--
-- Write operations:
-- Once the HostIoHdrScannner module extracts the ID and number of payload bits,
-- a write operation is activated by the opcode in the first two bits in the payload.
-- This module then extracts a starting address from the payload bitstream.
-- Then this module extracts data words from the payload bitstream and writes them to
-- the memory device at sequentially increasing addresses beginning from that address.
--
--       |     Header reception     |                    Payload bits                        |
-- TDI:  |  ID  | # of payload bits | Opcode | Starting address |  Data1  | ........ | DataN |
-- TDO:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- Addr: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|   Addr   | ..... | Addr + N - 1 |
-- Data: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|   Data1  | ..... | DataN        |
--
-- Read operations:
-- Once the HostIoHdrScannner module extracts the ID and number of payload bits,
-- a read operation is activated by the opcode in the first two bits in the payload.
-- This module then extracts a starting address from the payload bitstream.
-- Then this module reads data from the memory device at sequentially increasing addresses
-- starting from that address, and it shifts them serially back to the host.
--
--       |     Header reception     |        Payload bits       |  RAM data goes back to host  |
-- TDI:  |  ID  | # of payload bits | Opcode | Starting address |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- TDO:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Data1  | ... | DataN        |
-- Addr: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Addr   | ... | Addr + N - 1 |
-- Data: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Data1  | ... | DataN        |
--
-- Parameter query operation:
-- Once the HostIoHdrScannner module extracts the ID and number of payload bits,
-- a parameter query operation is activated by the opcode in the first two bits in the payload.
-- This module then places the width of the memory address and data buses into a register
-- and shifts it serially back to the host.
--
--       |     Header reception     | Payload bits |  Parameter data goes back to host  |
-- TDI:  |  ID  | # of payload bits |    Opcode    |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- TDO:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|   Address width   |   Data width   |
-- Addr: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- Data: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
--**************************************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.CommonPckg.all;
use work.HostIoPckg.all;

entity HostIoToMem is
  generic (
    ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
    PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
    );
  port (
    reset_i        : in  std_logic := LO;        -- Active-high reset signal.
    -- Interface to BscanHostIo.
    inShiftDr_i    : in  std_logic;  -- true when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
    drck_i         : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
    tdi_i          : in  std_logic;  -- Bit from the host to the FPGA application logic.
    tdo_o          : out std_logic;  -- Bit from the FPGA application logic to the host.
    -- Interface to the memory.
    addr_o         : out std_logic_vector;       -- Address to memory.
    wr_o           : out std_logic;     -- Write data to memory when high.
    dataFromHost_o : out std_logic_vector;       -- Data written to memory.
    rd_o           : out std_logic;     -- Read data from memory when high.
    dataToHost_i   : in  std_logic_vector;       -- Data read from memory.
    rwDone_i       : in  std_logic := HI  -- True when memory read/write operation is done.
    );
end entity;


architecture arch of HostIoToMem is
  signal pyldCntr_s           : std_logic_vector(PYLD_CNTR_LENGTH_G-1 downto 0);
  signal active_s             : std_logic;
  signal opcode_r             : std_logic_vector(NOP_OPCODE_C'range);
  signal opcodeRcvd_r         : std_logic;
  signal addrFromHost_r       : std_logic_vector(addr_o'high downto 0);
  signal addrFromHostRcvd_r   : std_logic;
  constant PARAM_SIZE_C       : natural := 16;
  constant SHIFT_REG_SIZE_C   : natural := IntMax(PARAM_SIZE_C, dataFromHost_o'length);
  signal shiftReg_r           : std_logic_vector(SHIFT_REG_SIZE_C-1 downto 0);
  signal bitCntr_r            : natural range 0 to SHIFT_REG_SIZE_C;
  signal wrToMemory_r         : std_logic;
  signal rdFromMemory_r       : std_logic;
  signal dataFromMemory_r     : std_logic_vector(dataToHost_i'high downto 0);
  signal dataFromMemoryRcvd_r : std_logic;
begin

  -- Scan the bits from the host looking for an instruction header.
  UHdrScannner : HostIoHdrScannner
    generic map (
      ID_G               => ID_G,
      PYLD_CNTR_LENGTH_G => PYLD_CNTR_LENGTH_G
      )
    port map (
      -- Interface to BSCAN primitive.
      inShiftDr_i => inShiftDr_i,
      drck_i      => drck_i,
      tdi_i       => tdi_i,
      -- Interface to FPGA application logic.
      pyldCntr_o  => pyldCntr_s,
      active_o    => active_s
      );

  -- Process the instruction bits as they arrive from the host.
  process(drck_i)
  begin
    if rising_edge(drck_i) then

      -- Keep processing as long as this module is activated or writing to memory.
      if (active_s = YES or wrToMemory_r = HI) and (reset_i = LO) then

        -- First, get the opcode from the host.
        if opcodeRcvd_r = NO then
          opcode_r     <= tdi_i & opcode_r(opcode_r'high downto 1);
          opcodeRcvd_r <= opcode_r(0);  -- Opcode complete once LSB is set.

        -- Next, process the received opcode.
        else
          case opcode_r is

            when SIZE_OPCODE_C =>  -- Return memory address and data bus parameters.
              if bitCntr_r = 0 then  -- Load the memory parameters into the host shift register.
                shiftReg_r(PARAM_SIZE_C-1 downto 0) <= CONV_STD_LOGIC_VECTOR(dataFromHost_o'length, PARAM_SIZE_C/2)
                                                       & CONV_STD_LOGIC_VECTOR(addr_o'length, PARAM_SIZE_C/2);
                bitCntr_r <= shiftReg_r'length;  -- Set the number of data bits to send.
              else  -- Shift next bit of memory parameters to the host.
                shiftReg_r <= ZERO & shiftReg_r(shiftReg_r'high downto 1);  -- Shift register contents.
                bitCntr_r  <= bitCntr_r - 1;  -- One more bit has been sent to the host.
              end if;

            when WRITE_OPCODE_C =>      -- Perform write to memory.
              if addrFromHostRcvd_r = NO then  -- Receiving the memory write address from the host.
                addrFromHost_r     <= tdi_i & addrFromHost_r(addrFromHost_r'high downto 1);
                addrFromHostRcvd_r <= addrFromHost_r(0);  -- Address complete once LSB is set.
              else    -- Now get data to write to memory from the host.
                if shiftReg_r(0) = NO then  -- Shifting in data from host before writing it to memory. 
                  shiftReg_r <= tdi_i & shiftReg_r(dataFromHost_o'high downto 1);
                else  -- Data from host received, now write it into the memory.
                  dataFromHost_o                  <= tdi_i & shiftReg_r(dataFromHost_o'high downto 1);  -- Store host data so it doesn't change if more bits arrive from host.
                  -- Clear shift register so it can receive more data from the host.
                  shiftReg_r                      <= (others => ZERO);
                  shiftReg_r(dataFromHost_o'high) <= HI;
                  wrToMemory_r                    <= HI;  -- Initiate write of host data to memory.
                end if;
                if wrToMemory_r = HI and rwDone_i = HI then  -- Write to memory is done.
                  wrToMemory_r   <= LO;  -- Stop any further writes till another complete data word arrives from host.
                  addrFromHost_r <= addrFromHost_r + 1;  -- Point to next memory location to be written.
                end if;
              end if;

            -- Perform read of memory.
            when READ_OPCODE_C =>
              if addrFromHostRcvd_r = NO then  -- Receiving the memory read address from the host.
                addrFromHost_r     <= tdi_i & addrFromHost_r(addrFromHost_r'high downto 1);
                addrFromHostRcvd_r <= addrFromHost_r(0);  -- Address complete once LSB is set.
                rdFromMemory_r     <= addrFromHost_r(0);  -- Initiate read as soon as address is received.
                bitCntr_r          <= dataFromMemory_r'length - 1;  -- Output garbage word until 1st read has a chance to complete.
              else
                if dataFromMemoryRcvd_r = NO then  -- Receive a complete data word from the host.
                  if rdFromMemory_r = HI and rwDone_i = HI then  -- Keep checking to see when memory data arrives.
                    rdFromMemory_r       <= LO;  -- OK, data is here so stop the reading the memory.
                    dataFromMemory_r     <= dataToHost_i;  -- Store the memory data until it can be loaded into the host shift reg.
                    dataFromMemoryRcvd_r <= YES;  -- Set flag to initiate loading of memory data into shift reg.
                    addrFromHost_r       <= addrFromHost_r + 1;  -- Point to next memory location to read from.
                  elsif pyldCntr_s >= shiftReg_r'length then
                    rdFromMemory_r <= HI;  -- Initiate the next read unless the host shift reg already contains the final data read.
                  end if;
                end if;
                if bitCntr_r /= 0 then  -- Shift data from memory to the host.
                  shiftReg_r <= ZERO & shiftReg_r(shiftReg_r'high downto 1);  -- Shift register contents.
                  bitCntr_r  <= bitCntr_r - 1;  -- One more bit has been sent to the host.
                else  -- Load data from memory into shift register (whether it's ready or not).
                  shiftReg_r(dataFromMemory_r'range) <= dataFromMemory_r;  -- Load the new data into the host shift register.
                  bitCntr_r                          <= dataFromMemory_r'length - 1;  -- Set the number of data bits to send.
                  dataFromMemoryRcvd_r               <= NO;  -- Clear the flag so the next memory read can occur.
                end if;
              end if;

            -- Default case is NOP.
            when others =>
              null;
              
          end case;
        end if;
        
      else  -- Reset everything when this module is not selected or is reset.
        opcode_r                            <= (others => ZERO);
        opcode_r(opcode_r'high)             <= ONE;
        opcodeRcvd_r                        <= NO;
        addrFromHost_r                      <= (others => ZERO);
        addrFromHost_r(addrFromHost_r'high) <= ONE;
        addrFromHostRcvd_r                  <= NO;
        shiftReg_r                          <= (others => ZERO);
        shiftReg_r(dataFromHost_o'high)     <= ONE;
        bitCntr_r                           <= 0;
        wrToMemory_r                        <= LO;
        rdFromMemory_r                      <= LO;
        dataFromMemoryRcvd_r                <= NO;
      end if;
    end if;

  end process;

  -- Force output low if this module has not been selected. 
  -- This allows the bit outputs of multiple modules to be OR'ed together
  -- and sent to the TDO input of the BSCAN primitive.
  tdo_o <= shiftReg_r(0) when active_s = YES else LO;

  -- Attach this module to a memory.
  addr_o <= addrFromHost_r;
  wr_o   <= wrToMemory_r;
  rd_o   <= rdFromMemory_r;
  
end architecture;



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.CommonPckg.all;
use work.SyncToClockPckg.all;

entity RamCtrlSync is
  port (
    clk_i     : in  std_logic;          -- Clock for this domain.
    ctrlIn_i  : in  std_logic;  -- RAM control signal from other clock domain.
    ctrlOut_o : out std_logic;  -- RAM control signal for this clock domain.
    doneIn_i  : in  std_logic;  -- RAM operation done signal from this clock domain.
    doneOut_o : out std_logic  -- RAM operation done signal for the other clock domain. 
    );
end entity;

architecture arch of RamCtrlSync is
  signal ctrlIn_s : std_logic;
begin

  -- Sync the RAM control signal from the other clock domain to this clock domain.
  UCtrlSync : SyncToClock port map (clk_i => clk_i, unsynced_i => ctrlIn_i, synced_o => ctrlIn_s);

  -- Now handle the handshaking to the RAM.
  process(clk_i)
    variable prevCtrlIn_s : std_logic := LO;
  begin
    if rising_edge(clk_i) then
      -- If RAM control signal from other clock doamin is inactive, then deactivate the RAM and tell
      -- the controller in the other clock domain that the memory operation is not done.          
      if ctrlIn_s = LO then
        ctrlOut_o <= LO;
        doneOut_o <= LO;
      -- If the RAM control signal was inactive but is now active, then activate the RAM but
      -- keep the done signal back to the other clock domain inactive.
      elsif prevCtrlIn_s = LO then
        ctrlOut_o <= HI;
        doneOut_o <= LO;
      -- If the RAM control is active and the RAM has finished its operation, then deactivate
      -- the RAM and tell the controller in the other clock domain that the operation is done.
      elsif doneIn_i = HI then
        ctrlOut_o <= LO;
        doneOut_o <= HI;
      end if;
      -- Store the previous state of the control signal so we can detect the rising edge.
      prevCtrlIn_s := CtrlIn_s;
    end if;
  end process;
end architecture;



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.CommonPckg.all;
use work.SyncToClockPckg.all;
use work.HostIoPckg.all;

entity HostIoToRam is
  generic (
    ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
    PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
    );
  port (
    reset_i        : in  std_logic := LO;        -- Active-high reset signal.
    -- Interface to BscanHostIo.
    inShiftDr_i    : in  std_logic;  -- true when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
    drck_i         : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
    tdi_i          : in  std_logic;  -- Bit from the host to the FPGA application logic.
    tdo_o          : out std_logic;  -- Bit from the FPGA application logic to the host.
    -- Interface to the memory.
    clk_i          : in  std_logic;     -- Clock from FPGA application logic. 
    addr_o         : out std_logic_vector;       -- Address to memory.
    wr_o           : out std_logic;     -- Write data to memory when high.
    dataFromHost_o : out std_logic_vector;       -- Data written to memory.
    rd_o           : out std_logic;     -- Read data from memory when high.
    dataToHost_i   : in  std_logic_vector;       -- Data read from memory.
    rwDone_i       : in  std_logic := HI  -- High when memory read/write operation is done.
    );
end entity;


architecture arch of HostIoToRam is
  signal wr_s       : std_logic;
  signal rd_s       : std_logic;
  signal rwDone_s   : std_logic;
  signal wrDone_s   : std_logic;
  signal rdDone_s   : std_logic;
  signal rdWrDone_s : std_logic;
begin

  UHostIoToMemory : HostIoToMem
    generic map (
      ID_G               => ID_G,
      PYLD_CNTR_LENGTH_G => PYLD_CNTR_LENGTH_G
      )
    port map(
      reset_i        => reset_i,
      inShiftDr_i    => inShiftDr_i,
      drck_i         => drck_i,
      tdi_i          => tdi_i,
      tdo_o          => tdo_o,
      addr_o         => addr_o,
      wr_o           => wr_s,
      dataFromHost_o => dataFromHost_o,
      rd_o           => rd_s,
      dataToHost_i   => dataToHost_i,
      rwDone_i       => rwDone_s
      );

  UWrRamCtrlSync : RamCtrlSync
    port map (
      clk_i     => clk_i,
      ctrlIn_i  => wr_s,
      ctrlOut_o => wr_o,
      doneIn_i  => rwDone_i,
      doneOut_o => wrDone_s
      );

  URdRamCtrlSync : RamCtrlSync
    port map (
      clk_i     => clk_i,
      ctrlIn_i  => rd_s,
      ctrlOut_o => rd_o,
      doneIn_i  => rwDone_i,
      doneOut_o => rdDone_s
      );

  rdWrDone_s <= rdDone_s or wrDone_s;
  UDoneSync : SyncToClock port map (clk_i => drck_i, unsynced_i => rdWrDone_s, synced_o => rwDone_s);

end architecture;



--**************************************************************************************************
-- This module interfaces with BscanToHostIo to send/receive test vectors to/from a device-under-test (DUT).
--
-- Write operations:
-- Once the HostIoHdrScannner module extracts the ID and number of payload bits,
-- a write operation is activated by the opcode in the first two bits in the payload.
-- This module then extracts a starting address from the payload bitstream.
-- Then this module extracts data words from the payload bitstream and writes them to
-- the memory device at sequentially increasing addresses beginning from that address.
--
--       |     Header reception     |                    Payload bits                        |
-- TDI:  |  ID  | # of payload bits | Opcode | Starting address |  Data1  | ........ | DataN |
-- TDO:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- Addr: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|   Addr   | ..... | Addr + N - 1 |
-- Data: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|   Data1  | ..... | DataN        |
--
-- Read operations:
-- Once the HostIoHdrScannner module extracts the ID and number of payload bits,
-- a read operation is activated by the opcode in the first two bits in the payload.
-- This module then extracts a starting address from the payload bitstream.
-- Then this module reads data from the memory device at sequentially increasing addresses
-- starting from that address, and it shifts them serially back to the host.
--
--       |     Header reception     |        Payload bits       |  RAM data goes back to host  |
-- TDI:  |  ID  | # of payload bits | Opcode | Starting address |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- TDO:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Data1  | ... | DataN        |
-- Addr: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Addr   | ... | Addr + N - 1 |
-- Data: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Data1  | ... | DataN        |
--
-- Parameter query operation:
-- Once the HostIoHdrScannner module extracts the ID and number of payload bits,
-- a parameter query operation is activated by the opcode in the first two bits in the payload.
-- This module then places the width of the memory address and data buses into a register
-- and shifts it serially back to the host.
--
--       |     Header reception     | Payload bits |  Parameter data goes back to host  |
-- TDI:  |  ID  | # of payload bits |    Opcode    |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- TDO:  |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|   Address width   |   Data width   |
-- Addr: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
-- Data: |xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|
--**************************************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.CommonPckg.all;
use work.HostIoPckg.all;

entity HostIoToDut is
  generic (
    ID_G               : std_logic_vector := "11111111";  -- The ID this module responds to.
    PYLD_CNTR_LENGTH_G : natural          := 32  -- Length of payload bit counter.
    );
  port (
    reset_i         : in  std_logic := LO;  -- Active-high reset signal.
    -- Interface to BscanHostIo.
    inShiftDr_i     : in  std_logic;  -- true when USER JTAG instruction is active and the TAP FSM is in the Shift-DR state.
    drck_i          : in  std_logic;  -- Bit clock. TDI clocked in on rising edge, TDO sampled on falling edge.
    tdi_i           : in  std_logic;  -- Bit from the host to the FPGA application logic.
    tdo_o           : out std_logic;  -- Bit from the FPGA application logic to the host.
    -- Test vector I/O.
    clkToDut_o      : out std_logic;  -- Rising edge clock signals arrival of vector to FPGA app. logic.
    vectorFromDut_i : in  std_logic_vector;  -- Gather inputs to send back to host thru this bus.
    vectorToDut_o   : out std_logic_vector  -- Output test vector from the host to FPGA app. logic thru this bus.
    );
end entity;


architecture arch of HostIoToDut is
  signal active_s           : std_logic;
  signal opcode_r           : std_logic_vector(NOP_OPCODE_C'range);
  signal opcodeRcvd_r       : std_logic;
  constant PARAM_SIZE_C     : natural := 16;
  constant SHIFT_REG_SIZE_C : natural := IntMax(IntMax(PARAM_SIZE_C, vectorFromDut_i'length), vectorToDut_o'length);
  signal shiftReg_r         : std_logic_vector(SHIFT_REG_SIZE_C-1 downto 0);
  signal bitCntr_r          : natural range 0 to SHIFT_REG_SIZE_C;
  signal activateClk_r      : std_logic;
begin

  -- Scan the bits from the host looking for an instruction header.
  UHdrScannner : HostIoHdrScannner
    generic map (
      ID_G               => ID_G,
      PYLD_CNTR_LENGTH_G => PYLD_CNTR_LENGTH_G
      )
    port map (
      -- Interface to BSCAN primitive.
      inShiftDr_i => inShiftDr_i,
      drck_i      => drck_i,
      tdi_i       => tdi_i,
      -- Interface to FPGA application logic.
      active_o    => active_s
      );

  -- Process the instruction bits as they arrive from the host.
  process(drck_i)
  begin
    if rising_edge(drck_i) then

      -- Keep processing as long as this module is activated.
      if active_s = YES and reset_i = LO then

        -- First, get the opcode from the host.
        if opcodeRcvd_r = NO then
          opcode_r     <= tdi_i & opcode_r(opcode_r'high downto 1);
          opcodeRcvd_r <= opcode_r(0);  -- Opcode complete once LSB is set.

        -- Next, process the received opcode.
        else
          case opcode_r is

            when SIZE_OPCODE_C =>  -- Return DUT input and output-width parameters.
              if bitCntr_r = 0 then  -- Load the I/O parameters into the host shift register.
                shiftReg_r(PARAM_SIZE_C-1 downto 0) <= CONV_STD_LOGIC_VECTOR(vectorFromDut_i'length, PARAM_SIZE_C/2)
                                                       & CONV_STD_LOGIC_VECTOR(vectorToDut_o'length, PARAM_SIZE_C/2);
                bitCntr_r <= PARAM_SIZE_C;  -- Set the number of bits to send.
              else  -- Shift next bit of I/O parameters to the host.
                shiftReg_r <= ZERO & shiftReg_r(shiftReg_r'high downto 1);  -- Shift register contents.
                bitCntr_r  <= bitCntr_r - 1;  -- One more bit has been sent to the host.
              end if;

            when WRITE_OPCODE_C =>  -- Output a test vector to the FPGA application logic.
              case vectorToDut_o'length is
                when 0 =>
                  activateClk_r <= YES;
                when 1 =>
                  vectorToDut_o(0) <= tdi_i;
                  activateClk_r    <= YES;
                when others =>
                  if shiftReg_r(0) = NO then  -- Shifting in data from host before writing it to memory. 
                    shiftReg_r(vectorToDut_o'range) <= tdi_i & shiftReg_r(vectorToDut_o'high downto 1);
                  else  -- Vector from host received, now apply it to the FPGA application logic.
                    vectorToDut_o                  <= tdi_i & shiftReg_r(vectorToDut_o'high downto 1);  -- Output test vector to FPGA application logic.
                    activateClk_r                  <= HI;  -- Pulse vector clock for one cycle after vector is received.
                    -- Clear shift register so it can receive another vector from the host.
                    shiftReg_r                     <= (others => ZERO);
                    shiftReg_r(vectorToDut_o'high) <= HI;
                  end if;
              end case;

            when READ_OPCODE_C =>  -- Get results of a test vector from the DUT.
              if bitCntr_r /= 0 then    -- Shifting DUT result to the host.
                shiftReg_r <= ZERO & shiftReg_r(shiftReg_r'high downto 1);  -- Shift register contents.
                bitCntr_r  <= bitCntr_r - 1;  -- One more bit has been sent to the host.
              else  -- Loading the DUT result into the shift register.
                shiftReg_r(vectorFromDut_i'range) <= vectorFromDut_i;  -- Load the new data into the host shift register.
                bitCntr_r                         <= vectorFromDut_i'length - 1;  -- Set the number of data bits to send.
              end if;

            -- Default case is NOP.
            when others =>
              null;
              
          end case;
        end if;
        
      else  -- Reset everything when this module is not selected or is reset.
        opcode_r                <= (others => ZERO);
        opcode_r(opcode_r'high) <= ONE;
        opcodeRcvd_r            <= NO;
        shiftReg_r              <= (others => ZERO);
        if vectorToDut_o'length > 0 then
          shiftReg_r(vectorToDut_o'high) <= ONE;
        end if;
        bitCntr_r     <= 0;
        activateClk_r <= LO;
      end if;
    end if;

  end process;

  clkToDut_o <= not drck_i when activateClk_r = HI else LO;

  -- Force output low if this module has not been selected. 
  -- This allows the bit outputs of multiple modules to be OR'ed together
  -- and sent to the TDO input of the BSCAN primitive.
  tdo_o <= shiftReg_r(0) when active_s = YES else LO;
  
end architecture;



