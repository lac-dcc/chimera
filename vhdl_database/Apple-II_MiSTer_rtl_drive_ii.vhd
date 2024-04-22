-------------------------------------------------------------------------------
--
-- Disk II emulator - drive part
--
-- This feeds "pre-nibblized" data to the processor.
--
-- Original by Stephen A. Edwards, sedwards@cs.columbia.edu
-- Write support by (c)2022 Gyorgy Szombathelyi
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity drive_ii is  
  port (
    CLK_14M       : in  std_logic;
    CLK_2M        : in  std_logic;
    PHASE_ZERO    : in  std_logic;
    RESET         : in  std_logic;
    DISK_READY    : in  std_logic;
    D_IN          : in  unsigned( 7 downto 0); -- From 6502
    D_OUT         : out unsigned( 7 downto 0); -- To 6502
    DISK_ACTIVE   : in  std_logic;             -- Disk motor on
    MOTOR_PHASE   : in  std_logic_vector(3 downto 0);
    WRITE_MODE    : in  std_logic;
    READ_DISK     : in  std_logic; -- C08C
    WRITE_REG     : in  std_logic; -- C08F/D
    -- Track buffer interface
    TRACK         : out unsigned( 5 downto 0); -- Current track (0-34)
    TRACK_ADDR    : out unsigned(12 downto 0);
    TRACK_DI      : out unsigned( 7 downto 0);
    TRACK_DO      : in  unsigned( 7 downto 0);
    TRACK_WE      : out std_logic;
    TRACK_BUSY    : in  std_logic
    );
end drive_ii;

architecture rtl of drive_ii is
  signal CLK_2M_D: std_logic;

  -- Current phase of the head.  This is in half-steps to assign
  -- a unique position to the case, say, when both phase 0 and phase 1 are
  -- on simultaneously.  phase(7 downto 2) is the track number
  signal phase : unsigned(7 downto 0);  -- 0 - 139

  signal track_byte_addr : unsigned(12 downto 0);
  signal data_reg : unsigned(7 downto 0);
  signal reset_data_reg : std_logic;

begin

  update_phase : process (CLK_14M, reset)
    variable phase_change : integer;
    variable new_phase : integer;
    variable rel_phase : std_logic_vector(3 downto 0);
  begin
      if reset = '1' then
        phase <= TO_UNSIGNED(70, 8);    -- Deliberately odd to test reset
      elsif rising_edge(CLK_14M) then
        if DISK_ACTIVE = '1' then
          phase_change := 0;
          new_phase := TO_INTEGER(phase);
          rel_phase := MOTOR_PHASE;
          case phase(2 downto 1) is
            when "00" =>
              rel_phase := rel_phase(1 downto 0) & rel_phase(3 downto 2);
            when "01" =>
              rel_phase := rel_phase(2 downto 0) & rel_phase(3);
            when "10" => null;
            when "11" =>
              rel_phase := rel_phase(0) & rel_phase(3 downto 1);
            when others => null;
          end case;

          if phase(0) = '1' then            -- Phase is odd
            case rel_phase is
              when "0000" => phase_change := 0;
              when "0001" => phase_change := -3;
              when "0010" => phase_change := -1;
              when "0011" => phase_change := -2;
              when "0100" => phase_change := 1;
              when "0101" => phase_change := -1;
              when "0110" => phase_change := 0;
              when "0111" => phase_change := -1;
              when "1000" => phase_change := 3;
              when "1001" => phase_change := 0;
              when "1010" => phase_change := 1;
              when "1011" => phase_change := -3;
              when "1111" => phase_change := 0;
              when others => null;
            end case;
          else                              -- Phase is even
            case rel_phase is
              when "0000" => phase_change := 0;
              when "0001" => phase_change := -2;
              when "0010" => phase_change := 0;
              when "0011" => phase_change := -1;
              when "0100" => phase_change := 2;
              when "0101" => phase_change := 0;
              when "0110" => phase_change := 1;
              when "0111" => phase_change := 0;
              when "1000" => phase_change := 0;
              when "1001" => phase_change := 1;
              when "1010" => phase_change := 2;
              when "1011" => phase_change := -2;
              when "1111" => phase_change := 0;
              when others => null;
            end case;
          end if;

          if new_phase + phase_change <= 0 then
            new_phase := 0;
          elsif new_phase + phase_change > 139 then
            new_phase := 139;
          else
            new_phase := new_phase + phase_change;
          end if;
          phase <= TO_UNSIGNED(new_phase, 8);
        end if;
      end if;
  end process;

  TRACK <= phase(7 downto 2);

  -- Go to the next byte if the counter times out (read) or when a new byte is written
  read_head : process (CLK_14M, reset)
  variable byte_delay : unsigned(5 downto 0);  -- Accounts for disk spin rate
  begin
    if reset = '1' then
      track_byte_addr <= (others => '0');
      byte_delay := (others => '0');
      reset_data_reg <= '0';
    elsif rising_edge(CLK_14M) then
      TRACK_WE <= '0';

      CLK_2M_D <= CLK_2M;
      if CLK_2M = '1' and CLK_2M_D = '0' and DISK_READY = '1' and DISK_ACTIVE = '1' then
        byte_delay := byte_delay - 1;

        if WRITE_MODE = '0' then
          -- read mode
          if reset_data_reg = '1' then
            data_reg <= (others => '0');
            reset_data_reg <= '0';
          end if;

          if byte_delay = 0 then
            data_reg <= TRACK_DO;
            if track_byte_addr = X"19FF" then
              track_byte_addr <= (others => '0');
            else
              track_byte_addr <= track_byte_addr + 1;
            end if;
          end if;
          if READ_DISK = '1' and PHASE_ZERO = '1' then
            reset_data_reg <= '1';
          end if;
        else
          -- write mode
          if WRITE_REG = '1' then data_reg <= D_IN; end if;
          if READ_DISK = '1' and PHASE_ZERO = '1' then
            TRACK_WE <= not TRACK_BUSY;
            if track_byte_addr = X"19FF" then
              track_byte_addr <= (others => '0');
            else
              track_byte_addr <= track_byte_addr + 1;
            end if;
          end if;
        end if;

      end if;
    end if;
  end process;

  D_OUT <= data_reg;
  TRACK_ADDR <= track_byte_addr;
  TRACK_DI <= data_reg;

end rtl;
