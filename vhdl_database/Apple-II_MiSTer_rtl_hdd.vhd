-------------------------------------------------------------------------------
--
-- HDD interface
--
-- This is a ProDOS HDD interface based on the AppleWin interface.
-- Currently, the CPU must be halted during command execution.
--
-- Steven A. Wilson
--
-------------------------------------------------------------------------------
-- Registers (per AppleWin source/Harddisk.cpp)
-- C0F0         (r)   EXECUTE AND RETURN STATUS
-- C0F1         (r)   STATUS (or ERROR)
-- C0F2         (r/w) COMMAND
-- C0F3         (r/w) UNIT NUMBER
-- C0F4         (r/w) LOW BYTE OF MEMORY BUFFER
-- C0F5         (r/w) HIGH BYTE OF MEMORY BUFFER
-- C0F6         (r/w) LOW BYTE OF BLOCK NUMBER
-- C0F7         (r/w) HIGH BYTE OF BLOCK NUMBER
-- C0F8         (r)   NEXT BYTE
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdd is
  port (
    CLK_14M        : in std_logic;
    IO_SELECT      : in std_logic;      -- e.g., C600 - C6FF ROM
    DEVICE_SELECT  : in std_logic;      -- e.g., C0E0 - C0EF I/O locations
    RESET          : in std_logic;
    A              : in unsigned(15 downto 0);
    RD             : in std_logic; -- 6502 RD/WR
    D_IN           : in unsigned(7 downto 0);  -- From 6502
    D_OUT          : out unsigned(7 downto 0);  -- To 6502
    sector         : out unsigned(15 downto 0); -- Sector number to read/write
    hdd_read       : out std_logic;
    hdd_write      : out std_logic;
    hdd_mounted    : in std_logic;
    hdd_protect    : in std_logic;
    ram_addr       : in unsigned(8 downto 0);  -- Address for sector buffer
    ram_di         : in unsigned(7 downto 0);  -- Data to sector buffer
    ram_do         : out unsigned(7 downto 0); -- Data from sector buffer
    ram_we         : in std_logic              -- Sector buffer write enable
    );
end hdd;

architecture rtl of hdd is
  signal rom_dout : unsigned(7 downto 0);

  -- Interface registers
  signal reg_status: unsigned(7 downto 0);
  signal reg_command: unsigned(7 downto 0);
  signal reg_unit: unsigned(7 downto 0);
  signal reg_mem_l: unsigned(7 downto 0);
  signal reg_mem_h: unsigned(7 downto 0);
  signal reg_block_l: unsigned(7 downto 0);
  signal reg_block_h: unsigned(7 downto 0);

  -- Internal sector buffer offset counter; incremented by
  -- access to C0F8 and reset when a command is written to
  -- C0F2.
  signal sec_addr: unsigned (8 downto 0);
  signal increment_sec_addr: std_logic;
  signal select_d: std_logic;

  -- Sector buffer
  type sector_ram is array(0 to 511) of unsigned(7 downto 0);
  -- Double-ported RAM for holding a sector
  signal sector_buf : sector_ram;

  -- ProDOS constants
  constant PRODOS_COMMAND_STATUS   : unsigned := X"00";
  constant PRODOS_COMMAND_READ     : unsigned := X"01";
  constant PRODOS_COMMAND_WRITE    : unsigned := X"02";
  constant PRODOS_COMMAND_FORMAT   : unsigned := X"03";
  constant PRODOS_STATUS_NO_DEVICE : unsigned := X"28";
  constant PRODOS_STATUS_PROTECT   : unsigned := X"2B";

begin
  sector <= reg_block_h & reg_block_l;

  cpu_interface : process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      D_OUT <= X"FF";
      hdd_read <= '0';
      hdd_write <= '0';
      if reset = '1' then
        reg_status <= X"00";
        reg_command <= X"00";
        reg_unit <= X"00";
        reg_mem_l <= X"00";
        reg_mem_h <= X"00";
        reg_block_l <= X"00";
        reg_block_h <= X"00";
      else
        select_d <= DEVICE_SELECT;
        if DEVICE_SELECT = '1' then
          if RD = '1' then
            case A(3 downto 0) is
              when X"0" =>
                sec_addr <= "000000000";
                case reg_command is
                  when PRODOS_COMMAND_STATUS =>
                    if hdd_mounted = '1' and reg_unit = X"70" then
                      reg_status <= X"00";
                      D_OUT <= X"00";
                    else
                      reg_status <= X"01";
                      D_OUT <= PRODOS_STATUS_NO_DEVICE;
                    end if;
                  when PRODOS_COMMAND_READ =>
                    if hdd_mounted = '1' and reg_unit = X"70" then
                      hdd_read <= '1';
                      reg_status <= X"00";
                      D_OUT <= X"00";
                    else
                      reg_status <= X"01";
                      D_OUT <= PRODOS_STATUS_NO_DEVICE;
                    end if;
                  when PRODOS_COMMAND_WRITE =>
                    if hdd_mounted = '0' or reg_unit /= X"70" then
                      D_OUT <= PRODOS_STATUS_NO_DEVICE;
                      reg_status <= X"01";
                    elsif hdd_protect = '1' then
                      D_OUT <= PRODOS_STATUS_PROTECT;
                    else
                      D_OUT <= X"00";
                      reg_status <= X"00";
                      hdd_write <= '1';
                    end if;
                    when others => null;
                end case;
              when X"1" =>
                D_OUT <= reg_status;
              when X"2" => D_OUT <= reg_command;
              when X"3" => D_OUT <= reg_unit;
              when X"4" => D_OUT <= reg_mem_l;
              when X"5" => D_OUT <= reg_mem_h;
              when X"6" => D_OUT <= reg_block_l;
              when X"7" => D_OUT <= reg_block_h;
              when X"8" =>
                D_OUT <= sector_buf(to_integer(sec_addr));
                increment_sec_addr <= '1';
              when others => null;
            end case;
          else -- RD = '0'; 6502 is writing
            case A(3 downto 0) is
              when X"2" =>
                if D_IN = X"02" then
                  sec_addr <= "000000000";
                end if;
                reg_command <= D_IN;
              when X"3" => reg_unit <= D_IN;
              when X"4" => reg_mem_l <= D_IN;
              when X"5" => reg_mem_h <= D_IN;
              when X"6" => reg_block_l <= D_IN;
              when X"7" => reg_block_h <= D_IN;
              when X"8" =>
                sector_buf(to_integer(sec_addr)) <= D_IN;
                increment_sec_addr <= '1';
              when others => null;
            end case;
          end if; -- RD/WR
        elsif DEVICE_SELECT = '0' and select_d = '1' then
          if increment_sec_addr = '1' then
            sec_addr <= sec_addr + 1;
            increment_sec_addr <= '0';
          end if;
        elsif IO_SELECT = '1' then -- Firmware ROM read
          if RD = '1' then
            D_OUT <= rom_dout;
          end if;
        end if; -- DEVICE_SELECT/IO_SELECT
      end if; -- RESET
    end if;
  end process; -- cpu_interface

  -- Dual-ported RAM holding the contents of the sector
  sec_storage : process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      if ram_we = '1' then
        sector_buf(to_integer(ram_addr)) <= ram_di;
      end if;
      ram_do <= sector_buf(to_integer(ram_addr));
    end if;
  end process;

  rom : entity work.hdd_rom port map (
    addr => A(7 downto 0),
    clk  => CLK_14M,
    dout => rom_dout);
end rtl;
