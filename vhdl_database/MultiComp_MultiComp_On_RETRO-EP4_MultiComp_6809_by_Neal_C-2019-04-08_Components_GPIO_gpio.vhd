-- General-purpose I/O.
--
-- A simple GPIO unit for a 6809 multicomp. Aims to provide a number of
-- programmable I/O lines all accessed through an indirect mechanism using
-- 2 locations in the processor address space; this fills the final 2 spare
-- locations.
--
-- The operation is fully synchronous on the master clock; a clock enable
-- determines when the state changes.
--
-- Design by Neal Crook foofoobedoo@gmail.com Jun2015.
--
-- You are free to use this file in your own projects but must never charge for
-- it nor use it without acknowledgement.
--
-- GPIO PROGRAMMING INTERFACE
-- ==========================
--
-- The software interface is through 2 read/write registers, usually decoded
-- at the following addresses:
-- $FFD6 GPIOADR
-- $FFD7 GPIODAT
--
-- GPIOADR specifies the register to access. GPIODAT provides data read/write
-- to selected register.
--
-- Using a 16-bit store you can generate an atomic register select/data write.
-- There is no equivalent mechanism for reads. Therefore, if any ISR ever
-- accesses a GPIO register, you must bracket any GPIO register operations
-- with disable/enable of interrupts. It's probably safest simply to never
-- access GPIO within an ISR.
--
-- When you have written a value to GPIOADR (either with an 8-bit or 16-bit
-- store) you can perform multiple GPIODAT reads and writes to the selected
-- register; there is no need to re-write GPIOADR until you wish to select
-- a different register. Beware of interrupts though; see note above.
--
-- For each group of physical pins there are 2 registers in GPIO.
-- The odd register is the data direction register
-- The even register is the data register.
-- A 0 in the data direction register marks the bit as an output, and a 1 marks it as an input
-- (mnemonic: 0utput, 1nput)
-- A write to the data register sends the write data to the pin for each bit that is an output
-- A read from the data register samples the pin for each bit that is an input, and returns the last
-- value written for each bit that is an output.
-- When you switch a pin from input to output, it will immediately assume the value that was
-- most recently written to it.
--
-- The following registers are implemented:
--
-- 0 DAT0 bits [2:0]
-- 1 DDR1 bits [2:0]
-- 2 DAT2 bits [7:0]
-- 3 DDR3 bits [7:0]
--
-- After reset, GPIOADR=0, all DDR*=0 (output) all DAT*=0 (output low).
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gpio is
port (
        n_reset : in std_logic;
        clk     : in std_logic;
        hold    : in std_logic;
        -- conditioned with chip select externally
        n_wr    : in std_logic;
        dataIn  : in std_logic_vector(7 downto 0);
        dataOut : out std_logic_vector(7 downto 0);
        -- 0 for GPIOADR, 1 for GPIODAT
        regAddr : in std_logic;

        -- GPIO
        dat0_i    : in std_logic_vector(2 downto 0);
        dat0_o    : out std_logic_vector(2 downto 0);
        n_dat0_oe : out std_logic_vector(2 downto 0);

        dat2_i    : in std_logic_vector(7 downto 0);
        dat2_o    : out std_logic_vector(7 downto 0);
        n_dat2_oe : out std_logic_vector(7 downto 0)
);

end gpio;

architecture rtl of gpio is

  -- state
  signal reg        : std_logic_vector(7 downto 0);
  signal reg_dat0   : std_logic_vector(2 downto 0);
  signal reg_dat0_d : std_logic_vector(2 downto 0);
  signal reg_ddr0   : std_logic_vector(2 downto 0);
  signal reg_dat2   : std_logic_vector(7 downto 0);
  signal reg_dat2_d : std_logic_vector(7 downto 0);
  signal reg_ddr2   : std_logic_vector(7 downto 0);

begin
  -- outputs
  dat0_o    <= reg_dat0;
  n_dat0_oe <= reg_ddr0; -- a 1 means input so active low oe.
  dat2_o    <= reg_dat2;
  n_dat2_oe <= reg_ddr2;


  -- per-cycle write data
  proc_dat0: process(reg_ddr0, reg_dat0, dat0_i, dataIn, reg, n_wr, regAddr)
    begin
      if reg = x"00" and n_wr = '0' and regAddr = '1' then
        -- write
        reg_dat0_d <= (dataIn(2 downto 0) and not reg_ddr0) or (dat0_i and reg_ddr0);
      else
        -- hold
        reg_dat0_d <= (reg_dat0 and not reg_ddr0) or (dat0_i and reg_ddr0);
      end if;
    end process;

  proc_dat2: process(reg_ddr2, reg_dat2, dat2_i, dataIn, reg, n_wr, regAddr)
    begin
      if reg = x"02" and n_wr = '0' and regAddr = '1' then
        -- write
        reg_dat2_d <= (dataIn   and not reg_ddr2) or (dat2_i and reg_ddr2);
      else
        -- hold
        reg_dat2_d <= (reg_dat2 and not reg_ddr2) or (dat2_i and reg_ddr2);
      end if;
    end process;

  -- register read - conditioned externally with n_gpioCS and so can have
  -- a simple async decode here. MUXed externally so no need to drive a
  -- defined value when not being accessed. Result of all of this is that
  -- the n_rd is not needed here at all..
  dataOut <= reg                when regAddr = '0' else
             "00000" & reg_dat0 when regAddr = '1' and reg = "00000000" else
             "00000" & reg_ddr0 when regAddr = '1' and reg = "00000001" else
             reg_dat2           when regAddr = '1' and reg = "00000010" else
             reg_ddr2           when regAddr = '1' and reg = "00000011" else
             "00000000"; -- don't need this, but it's a clean way to
                         -- indicate "no such register"


  -- state (and register write)
  proc_reg: process(clk, n_reset)
    begin
      if n_reset='0' then
        reg      <= "00000000";
        reg_dat0 <= "000";
        reg_ddr0 <= "000";
        reg_dat2 <= "00000000";
        reg_ddr2 <= "00000000";
      elsif rising_edge(clk) then
        reg_dat0 <= reg_dat0_d;
        reg_dat2 <= reg_dat2_d;

        -- write
        if hold = '0' and n_wr = '0' then
          if regAddr = '0' then
            -- address register
            reg <= dataIn;
          else
            -- data direction register selected by data register
            if reg = "00000001" then reg_ddr0 <= dataIn(2 downto 0); end if;
            if reg = "00000011" then reg_ddr2 <= dataIn;             end if;
          end if;
        end if;


      end if;
    end process;

end rtl;
