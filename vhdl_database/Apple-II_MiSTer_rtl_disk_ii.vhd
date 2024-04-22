-------------------------------------------------------------------------------
--
-- Disk II emulator
--
-- This feeds "pre-nibblized" data to the processor.
--
-- Original by Stephen A. Edwards, sedwards@cs.columbia.edu
-- Write and 2 disks support by (c)2022 Gyorgy Szombathelyi
--
-------------------------------------------------------------------------------
--
-- Each track is represented as 0x1A00 bytes
-- Each disk image consists of 35 * 0x1A00 bytes = 0x38A00 (227.5 K)
--
-- X = $60 for slot 6
--
--  Off          On
-- C080,X      C081,X		Phase 0  Head Stepper Motor Control
-- C082,X      C083,X		Phase 1
-- C084,X      C085,X		Phase 2
-- C086,X      C087,X		Phase 3
-- C088,X      C089,X           Motor On
-- C08A,X      C08B,X           Select Drive 2 (select drive 1 when off)
-- C08C,X      C08D,X           Q6  (Shift/load?)
-- C08E,X      C08F,X           Q7  (Write request to drive)
--
--
-- Q7 Q6
-- 0  0  Read
-- 0  1  Sense write protect
-- 1  0  Write
-- 1  1  Load Write Latch
--
-- Reading a byte:
--        LDA $C08E,X  set read mode
-- ...
-- READ   LDA $C08C,X
--        BPL READ
--
-- Sense write protect:
--   LDA $C08D,X
--   LDA $C08E,X
--   BMI PROTECTED
--
-- Writing
--   STA $C08F,X   set write mode
--   CMP $C08C,X   shift byte to disk
--   ..
--   LDA DATA
--   STA $C08D,X   load byte to write
--   CMP $C08C,X   shift byte to disk
--
-- Data bytes must be written in 32 cycle loops.
--
-- There are 70 phases for the head stepper and and 35 tracks,
-- i.e., two phase changes per track.
--
-- The disk spins at 300 rpm; one new bit arrives every 4 us
-- The processor's clock is 1 MHz = 1 us, so it takes 8 * 4 = 32 cycles
-- for a new byte to arrive
--
-- This corresponds to dividing the 2 MHz signal by 64 to get the byte clock
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity disk_ii is  
  port (
    CLK_14M        : in  std_logic;
    CLK_2M         : in  std_logic;
    PHASE_ZERO     : in  std_logic;
    IO_SELECT      : in  std_logic;             -- e.g., C600 - C6FF ROM
    DEVICE_SELECT  : in  std_logic;             -- e.g., C0E0 - C0EF I/O locations
    RESET          : in  std_logic;
    DISK_READY     : in  std_logic_vector(1 downto 0);
    A              : in  unsigned(15 downto 0);
    D_IN           : in  unsigned( 7 downto 0); -- From 6502
    D_OUT          : out unsigned( 7 downto 0); -- To 6502
    D1_ACTIVE      : buffer std_logic;             -- Disk 1 motor on
    D2_ACTIVE      : buffer std_logic;             -- Disk 2 motor on
    -- Track buffer interface disk 1
    TRACK1         : out unsigned( 5 downto 0); -- Current track (0-34)
    TRACK1_ADDR    : out unsigned(12 downto 0);
    TRACK1_DI      : out unsigned( 7 downto 0);
    TRACK1_DO      : in  unsigned( 7 downto 0);
    TRACK1_WE      : out std_logic;
    TRACK1_BUSY    : in  std_logic;
    -- Track buffer interface disk 2
    TRACK2         : out unsigned( 5 downto 0); -- Current track (0-34)
    TRACK2_ADDR    : out unsigned(12 downto 0);
    TRACK2_DI      : out unsigned( 7 downto 0);
    TRACK2_DO      : in  unsigned( 7 downto 0);
    TRACK2_WE      : out std_logic;
    TRACK2_BUSY    : in  std_logic
    );
end disk_ii;

architecture rtl of disk_ii is

  signal motor_phase : std_logic_vector(3 downto 0);
  signal drive_on : std_logic;
  signal drive_real_on : std_logic; -- 1 sec delay for turning off the drive
  signal drive2_select : std_logic;
  signal q6, q7 : std_logic;
  signal CLK_2M_D: std_logic;

  signal rom_dout : unsigned(7 downto 0);
  signal d_out1   : unsigned(7 downto 0);
  signal d_out2   : unsigned(7 downto 0);

  -- Current phase of the head.  This is in half-steps to assign
  -- a unique position to the case, say, when both phase 0 and phase 1 are
  -- on simultaneously.  phase(7 downto 2) is the track number
  signal phase : unsigned(7 downto 0);  -- 0 - 139

  signal track_byte_addr : unsigned(12 downto 0);
  signal read_disk : std_logic;    -- When C08C accessed
  signal write_reg : std_logic;
  signal data_reg : unsigned(7 downto 0);
  signal reset_data_reg : std_logic;
  signal write_mode : std_logic;        -- When C08E/F accessed

begin

  interpret_io : process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      if reset = '1' then
        motor_phase <= (others => '0');
        drive_on <= '0';
        drive2_select <= '0';
        q6 <= '0';
        q7 <= '0';
      else
        if DEVICE_SELECT = '1' then
          if A(3) = '0' then                      -- C080 - C087
            motor_phase(TO_INTEGER(A(2 downto 1))) <= A(0);
          else
            case A(2 downto 1) is
              when "00" => drive_on <= A(0);      -- C088 - C089
              when "01" => drive2_select <= A(0); -- C08A - C08B
              when "10" => q6 <= A(0);            -- C08C - C08D
              when "11" => q7 <= A(0);            -- C08E - C08F
              when others => null;
            end case;
          end if;
        end if;
      end if;
    end if;
  end process;
  
  drive_on_delay: process (CLK_14M, reset)
    variable spindown_delay : unsigned(23 downto 0);  -- Accounts for disk spin rate
    variable drive_on_old : std_logic;
  begin
    if reset = '1' then
      spindown_delay := (others => '0');
      drive_real_on <= '0';
    elsif rising_edge(CLK_14M) then
      if spindown_delay /= 0 then
        spindown_delay := spindown_delay - 1;
        if spindown_delay = 0 then
          drive_real_on <= '0';
        end if;
      end if;

      if drive_on = '1' then
        spindown_delay := (others => '0');
        drive_real_on <= '1';
      elsif drive_on_old = '1' then
        spindown_delay := to_unsigned(14000000, 24); -- 1 sec delay
      end if;

      drive_on_old := drive_on;

    end if;
  end process;

  D1_ACTIVE <= drive_real_on and not drive2_select;
  D2_ACTIVE <= drive_real_on and drive2_select;
  write_mode <= q7;

  read_disk <= '1' when DEVICE_SELECT = '1' and A(3 downto 0) = x"C" else
               '0';  -- C08C
  write_reg <= '1' when DEVICE_SELECT = '1' and A(3 downto 2) = "11" and A(0) = '1' else
               '0';  -- C08F/D

  D_OUT <= rom_dout when IO_SELECT = '1' else data_reg when q6 = '0' else x"00";
  data_reg <= d_out1 when drive2_select = '0' else d_out2;

  drive_1 : entity work.drive_ii
  port map (
    CLK_14M        => CLK_14M,
    CLK_2M         => CLK_2M,
    PHASE_ZERO     => PHASE_ZERO,
    RESET          => RESET,
    DISK_READY     => DISK_READY(0),
    D_IN           => D_IN,         -- From 6502
    D_OUT          => d_out1,       -- To 6502
    DISK_ACTIVE    => D1_ACTIVE,    -- Disk motor on
    MOTOR_PHASE    => motor_phase,
    WRITE_MODE     => write_mode,
    READ_DISK      => read_disk,    -- C08C
    WRITE_REG      => write_reg,    -- C08F/D
    -- Track buffer interface
    TRACK          => TRACK1, -- Current track (0-34)
    TRACK_ADDR     => TRACK1_ADDR,
    TRACK_DI       => TRACK1_DI,
    TRACK_DO       => TRACK1_DO,
    TRACK_WE       => TRACK1_WE,
    TRACK_BUSY     => TRACK1_BUSY
  );

  drive_2 : entity work.drive_ii
  port map (
    CLK_14M        => CLK_14M,
    CLK_2M         => CLK_2M,
    PHASE_ZERO     => PHASE_ZERO,
    RESET          => RESET,
    DISK_READY     => DISK_READY(1),
    D_IN           => D_IN,         -- From 6502
    D_OUT          => d_out2,       -- To 6502
    DISK_ACTIVE    => D2_ACTIVE,    -- Disk motor on
    MOTOR_PHASE    => motor_phase,
    WRITE_MODE     => write_mode,
    READ_DISK      => read_disk,    -- C08C
    WRITE_REG      => write_reg,    -- C08F/D
    -- Track buffer interface
    TRACK          => TRACK2, -- Current track (0-34)
    TRACK_ADDR     => TRACK2_ADDR,
    TRACK_DI       => TRACK2_DI,
    TRACK_DO       => TRACK2_DO,
    TRACK_WE       => TRACK2_WE,
    TRACK_BUSY     => TRACK2_BUSY
  );

  -- ROM
  rom : entity work.disk_ii_rom port map (
    addr => A(7 downto 0),
    clk  => CLK_14M,
    dout => rom_dout);

end rtl;
