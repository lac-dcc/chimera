library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity rtc is
    generic (
        OverrideCMOS : boolean -- Overide CMOS/RTC mode settings with keyb_dip
    );
    port (
        clk          : in  std_logic;
        cpu_clken    : in  std_logic;
        hard_reset_n : in  std_logic;
        reset_n      : in  std_logic;
        ce           : in  std_logic; -- chip enable
        as           : in  std_logic; -- address strobe
        ds           : in  std_logic; -- data strobe
        r_nw         : in  std_logic;
        adi          : in  std_logic_vector(7 downto 0); -- address/data in
        do           : out std_logic_vector(7 downto 0); -- data out
        -- bits 0..3 set mode; bit 4 sets autoboot
        keyb_dip     : in  std_logic_vector(7 downto 0)  -- keyboard DIP
    );
end entity;

architecture rtl of rtc is

    signal ds_r : std_logic;
    signal as_r : std_logic;
    signal addr : std_logic_vector(5 downto 0);

    type rtc_ram_type is array(0 to 63) of std_logic_vector(7 downto 0);

-- CMOS configuration RAM allocation
--
-- From http://beebwiki.mdfs.net/index.php/CMOS_configuration_RAM_allocation
--
--   Location  Settings                                 Configured with
--   -----------------------------------------------------------------------------
--    0        Econet Station Number                    *SetStation nnn
--    1        File server station number               *Config. FS nnn
--    2        File server network number               *Config. FS nnn.sss
--    3        Printer server station number            *Config. PS nnn
--    4        Printer server network number            *Config. PS nnn.sss
--    5 b0-b3  Default filing system ROM                *Config. File nn
--      b4-b7  Default language ROM                     *Config. Lang nn
--    6        ROMs 0-7 unplugged/inserted              *Insert nn/*Unplug nn
--    7        ROMs 8-15 unplugged/inserted             *Insert nn/*Unplug nn
--    8 b0-b2  EDIT screen mode
--      b3     EDIT TAB to columns/words
--      b4     EDIT overwrite/insert
--      b5     EDIT display returns
--      b6-b7  spare
--    9        Telecoms software
--   10 b0-b3  Default screen mode b0-b2,b7             *Config. Mode nn
--      b4     Default TV interlace                     *Config. TV xx,n
--      b5-b7  Default TV position, 0 to 3, -4 to -1    *Config. TV nn,x
--   11 b0-b2  Default floppy speed                     *Config. FDrive n
--      b3     Shift Caps on startup          \         *Config. ShCaps
--      b4     No Lock on startup              (*fx202) *Config. NoCaps
--      b5     Caps Lock on startup           /         *Config. Caps
--      b6     ADFS load directory on startup           *Config. NoDir/Dir
--      b7     ADFS floppy/hard drive on startup        *Config. Floppy/Hard
--   12        Keyboard repeat delay           (*fx11)  *Config. Delay nnn
--   13        Keyboard repeat rate            (*fx12)  *Config. Repeat nnn
--   14        Printer ignore character        (*fx246) *Config. Ignore nnn
--   15 b0     Ignore/enable Tube                       *Config. NoTube/Tube
--      b1     Ignore printer ignore character (*fx182) *Config. Ignore/Ignore nnn
--      b2-b4  Default serial speed 0-7     (*fx7/*fx8) *Config. Baud n
--      b5-b7  Default printer device, 0-7     (*fx245) *Config. Print n
--   16 b0     Default to shadow screen on start (MER)  *Config. Shadow
--      b1     Default BEEP quite/loud                  *Config. Quiet/Loud
--      b2     Internal/External Tube                   *Config. InTube/ExTube
--      b3     Scrolling enabled/protected              *Config. Scroll/NoScroll
--      b4     Noboot/boot on reset                     *Config. NoBoot/Boot
--      b5-b7  Default serial data format      (*fx192) *Config. Data n
--   17 b0     ANFS raise 2 pages of workspace          *Config. NoSpace/Space
--      b1     ANFS run *FindLib on logon               *-Net-Opt 5,n
--      b2-b3                                           *-Net-Opt 6,n
--             b2 ANFS use &0Bxx-&0Cxx or &0Exx-&0Fxx workspace
--             b3 unused
--      b4-b5  unused                                   *-Net-Opt 7,n
--      b6-b7                                           *-Net-Opt 8,n
--             b6 ANFS protected
--             b7 Display version number on startup
--   18 b0-b3  Compact joystick speed         \         *Config. Stick nn
--      b4     unused                          (*fx190)
--      b5     Compact joystick proportional/switched   *Config. Proportional/Switched
--      b6-b7  Century 19-22                  /
--   19        Country code                    (*fx240) *Config. Country nnn
--   20-29     Reserved for Acorn
--   20 b0-b3  ARM CoPro CPU type (JGH ARM Modules)     *Config. CPU <cpuname>
--      b4-b7
--   30-45     Allocated to ROM 0-15
--   46-49     Reserved for user applications
--
--   255       EEPROM size

    -- bits 2..0 (mode) overlaid by DIP switches
    constant ini10 : std_logic_vector(7 downto 0) := x"F7";

    -- bit 4 (noboot/boot) overlaid by DIP switches
    constant ini16 : std_logic_vector(7 downto 0) := x"80";

    signal rtc_ram : rtc_ram_type := (
        x"30", -- RTC Seconds
        x"00", -- RTC Seconds Alarm
        x"02", -- RTC Minutes
        x"00", -- RTC Minutes Alarm
        x"18", -- RTC Hours
        x"00", -- RTC Hours Alarm
        x"06", -- RTC Day of Week
        x"07", -- RTC Date of Month
        x"11", -- RTC Month
        x"15", -- RTC Year
        x"00", -- RTC Register A
        x"00", -- RTC Register B
        x"00", -- RTC Register C
        x"00", -- RTC Register D
        x"00", -- CMOS  0 - Econet station number
        x"FE", -- CMOS  1 - Econet file server identity (lo)
        x"00", -- CMOS  2 - Econet file server identity (hi)
        x"EB", -- CMOS  3 - Econet print server identity (lo)
        x"00", -- CMOS  4 - Econet print server identity (hi)
        x"C9", -- CMOS  5 - Default Filing System / Language (default file system MMFS)
        x"FF", -- CMOS  6 - ROM frugal bits (*INSERT/*UNPLUG)
        x"FF", -- CMOS  7 - ROM frugal bits (*INSERT/*UNPLUG)
        x"00", -- CMOS  8 - Edit startup settings
        x"00", -- CMOS  9 - reserved for telecommunications applications
        ini10, -- CMOS 10 - VDU mode and *TV settings
        x"63", -- CMOS 11 - ADFS startup options, keyboard settings, floppy params
        x"20", -- CMOS 12 - Keyboard auto-repeat delay
        x"08", -- CMOS 13 - Keyboard auto-repeat rate
        x"0A", -- CMOS 14 - Printer ignore character
        x"2D", -- CMOS 15 - Default printer type, serial baud rate, ignore status and TUBE select
        ini16, -- CMOS 16 - Default serial data format, auto boot option, int/ext TUBE, bell amplitude
        x"00", -- CMOS 17 - reserved for ANFS
        x"00", -- CMOS 18 - reserved for ANFS
        x"00", -- CMOS 19 - reserved for ANFS
        x"00", -- CMOS 20 - reserved for future use by Acorn
        x"00", -- CMOS 21 - reserved for future use by Acorn
        x"00", -- CMOS 22 - reserved for future use by Acorn
        x"00", -- CMOS 23 - reserved for future use by Acorn
        x"00", -- CMOS 24 - reserved for future use by Acorn
        x"00", -- CMOS 25 - reserved for future use by Acorn
        x"00", -- CMOS 26 - reserved for future use by Acorn
        x"00", -- CMOS 27 - reserved for future use by Acorn
        x"00", -- CMOS 28 - reserved for future use by Acorn
        x"00", -- CMOS 29 - reserved for future use by Acorn
        x"00", -- CMOS 30 - reserved for future use by third parties
        x"00", -- CMOS 31 - reserved for future use by third parties
        x"00", -- CMOS 32 - reserved for future use by third parties
        x"00", -- CMOS 33 - reserved for future use by third parties
        x"00", -- CMOS 34 - reserved for future use by third parties
        x"00", -- CMOS 35 - reserved for future use by third parties
        x"00", -- CMOS 36 - reserved for future use by third parties
        x"00", -- CMOS 37 - reserved for future use by third parties
        x"00", -- CMOS 38 - reserved for future use by third parties
        x"00", -- CMOS 39 - reserved for future use by third parties
        x"00", -- CMOS 40 - reserved for future use by the user
        x"00", -- CMOS 41 - reserved for future use by the user
        x"00", -- CMOS 42 - reserved for future use by the user
        x"00", -- CMOS 43 - reserved for future use by the user
        x"00", -- CMOS 44 - reserved for future use by the user
        x"00", -- CMOS 45 - reserved for future use by the user
        x"00", -- CMOS 46 - reserved for future use by the user
        x"00", -- CMOS 47 - reserved for future use by the user
        x"00", -- CMOS 48 - reserved for future use by the user
        x"00"  -- CMOS 49 - reserved for future use by the user
        );


    type RTC_STATE_TYPE is (
        INIT, WRITE_10, WRITE_16, RUNNING
    );

    signal rtc_state : RTC_STATE_TYPE := INIT;

begin

    process(clk,reset_n)
    begin
        if rising_edge(clk) then

            if hard_reset_n = '0' then
                rtc_state <= INIT;

            else

                case rtc_state is

                    when INIT =>
                        as_r <= '0';
                        ds_r <= '0';
                        do <= (others => '0');
                        if OverrideCMOS then
                            rtc_state <= WRITE_10;
                        else
                            rtc_state <= RUNNING;
                        end if;

                    -- Copy the screen mode from the DIP switches into CMOS on power up
                    when WRITE_10 =>
                        rtc_ram(24) <= ini10 xor ("00000" & keyb_dip(2 downto 0));
                        rtc_state <= WRITE_16;

                    -- Copy the noboot/boot mode from the DIP switches into CMOS on power up
                    when WRITE_16 =>
                        rtc_ram(30) <= ini16 xor ("000" & keyb_dip(3) & "0000");
                        rtc_state <= RUNNING;

                    when RUNNING =>

                        if reset_n = '0' then
                            as_r <= '0';
                            ds_r <= '0';
                            do <= (others => '0');

                        elsif (cpu_clken = '1') then
                            as_r <= as;
                            ds_r <= ds;

                            -- Latch the RTC Address of the falling edge of rtc_as
                            if ce = '1' and as = '0' and as_r = '1' then
                                addr <= adi(5 downto 0);
                            end if;

                            -- Latch the Write Data on the falling edge of rtc_ds
                            if ce = '1' and ds = '0' and ds_r = '1' and r_nw = '0' then
                                rtc_ram(to_integer(unsigned(addr))) <= adi;
                            end if;

                            -- Read Data
                            do <= rtc_ram(to_integer(unsigned(addr)));
                        end if;
                end case;
            end if;
        end if;
    end process;

end architecture rtl;
