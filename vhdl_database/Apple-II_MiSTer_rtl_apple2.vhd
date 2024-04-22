-------------------------------------------------------------------------------
-- Top level of an Apple //e
-- Szombathelyi György
--
-- Based on:
-- Top level of an Apple ][+
--
-- Stephen A. Edwards, sedwards@cs.columbia.edu
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity apple2 is
  port (
    CLK_14M        : in  std_logic;              -- 14.31818 MHz master clock
    CLK_2M         : out std_logic;
    PALMODE        : in  std_logic := '0';       -- PAL/NTSC selection
    ROMSWITCH      : in std_logic;
    CPU_WAIT       : in  std_logic;
    PHASE_ZERO     : buffer std_logic;
    PHASE_ZERO_R   : buffer std_logic;           -- next clock is PHI0=1
    PHASE_ZERO_F   : buffer std_logic;           -- next clock is PHI0=0
    FLASH_CLK      : in  std_logic;        -- approx. 2 Hz flashing char clock
    reset          : in  std_logic;
    cpu            : in  std_logic;              -- 0 - 6502, 1 - 65C02
    ADDR           : out unsigned(15 downto 0);  -- CPU address
    ram_addr       : out unsigned(17 downto 0);  -- RAM address
    D              : out unsigned(7 downto 0);   -- Data to RAM
    ram_do         : in unsigned(15 downto 0);   -- Data from RAM (lo byte: MAIN RAM, hi byte: AUX RAM)
    aux            : buffer std_logic;           -- Write to MAIN or AUX RAM
    PD             : in unsigned(7 downto 0);    -- Data to CPU from peripherals
    CPU_WE         : out std_logic;
    IRQ_n          : in std_logic;
    NMI_n          : in std_logic;
    ram_we         : out std_logic;              -- RAM write enable
    VIDEO          : out std_logic;
    COLOR_LINE     : out std_logic;
    TEXT_MODE      : buffer std_logic;
    HBL            : out std_logic;
    VBL            : buffer std_logic;
    K              : in unsigned(7 downto 0);    -- Keyboard data
    READ_KEY       : buffer std_logic;           -- Processor has read key
    AKD            : in std_logic;               -- Any key down flag
    AN             : buffer std_logic_vector(3 downto 0);  -- Annunciator outputs
    -- GAMEPORT input bits:
    --  7    6    5    4    3   2   1    0
    -- pdl3 pdl2 pdl1 pdl0 pb3 pb2 pb1 casette
    GAMEPORT       : in std_logic_vector(7 downto 0);
    PDL_STROBE     : buffer std_logic;           -- Pulses high when C07x read
    STB            : buffer std_logic;           -- Pulses high when C04x read
    IO_SELECT      : out std_logic_vector(7 downto 0);
    DEVICE_SELECT  : out std_logic_vector(7 downto 0);
    IO_STROBE      : out std_logic;
	 -- load different video roms
    ioctl_addr : in  std_logic_vector(24 downto 0);
    ioctl_data : in  std_logic_vector(7 downto 0);
    ioctl_index   : in  std_logic_vector(7 downto 0);
    ioctl_download: in  std_logic;
    ioctl_wr   : in  std_logic;

    speaker        : out std_logic              -- One-bit speaker output
    );
end apple2;

architecture rtl of apple2 is

  component ramcard is
    port ( clk: in std_logic;
           reset_in: in std_logic;
           addr: in unsigned(15 downto 0);
           ram_addr: out unsigned(17 downto 0);          
           card_ram_we: out std_logic;
           card_ram_rd: out std_logic
    );
  end component;

  -- Clocks
  signal CLK_7M : std_logic;
  signal Q3, RAS_N, CAS_N, AX : std_logic;
  signal COLOR_REF : std_logic;
  signal CPU_EN : std_logic;
  signal PHASE_ZERO_D : std_logic;

  -- From the timing generator
  signal VIDEO_ADDRESS : unsigned(15 downto 0);
  signal LDPS_N : std_logic;
  signal WNDW_N, GR2 : std_logic;
  signal SEGA, SEGB, SEGC : std_logic;
  
  -- Soft switches
  signal soft_switches : std_logic_vector(7 downto 0) := "00000000";
  signal MIXED_MODE : std_logic;
  signal PAGE2 : std_logic;
  signal HIRES_MODE : std_logic;
  signal DHIRES_MODE : std_logic;

  -- ][e auxilary switches
  signal RAMRD : std_logic;
  signal RAMWRT : std_logic;
  signal CXROM : std_logic;
  signal STORE80 : std_logic;
  signal C3ROM : std_logic;
  signal C8ROM : std_logic;
  signal ALTZP : std_logic;
  signal ALTCHAR : std_logic;
  signal COL80 : std_logic;
  signal SF_D : std_logic;

  -- CPU signals
  signal D_IN : unsigned(7 downto 0);
  signal D_OUT: unsigned(7 downto 0);
  signal A : unsigned(15 downto 0);
  signal T65_A : std_logic_vector(23 downto 0);
  signal T65_DI : std_logic_vector(7 downto 0);
  signal T65_DO : std_logic_vector(7 downto 0);
  signal T65_WE_N : std_logic;
  signal R65C02_A : unsigned(15 downto 0);
  signal R65C02_DO : unsigned(7 downto 0);
  signal R65C02_WE_N : std_logic;
  signal we : std_logic;

  -- Main ROM signals
  signal rom_out : unsigned(7 downto 0);
  signal rom_addr : unsigned(13 downto 0);

  -- Address decoder signals
  signal RAM_SELECT : std_logic := '1';
  signal KEYBOARD_SELECT : std_logic := '0';
  signal TAPE_OUT : std_logic;
  signal SPEAKER_SELECT : std_logic;
  signal SOFTSWITCH_SELECT : std_logic;
  signal ROM_SELECT : std_logic;
  signal GAMEPORT_SELECT : std_logic;
  --signal IO_STROBE : std_logic;
  signal HRAM_CONTROL : std_logic;
  signal C01X_SELECT : std_logic;

  -- Speaker signal
  signal speaker_sig : std_logic := '0';        

  signal CPU_DL, VIDEO_DL : unsigned(7 downto 0);     -- Latched RAM data
  signal VIDEO_DL_LATCH : unsigned(15 downto 0);
  
  -- Bank Switched RAM signals
  signal Dxxx : std_logic;
  signal HRAM_READ : std_logic;
  signal HRAM_PRE_WR : std_logic;
  signal HRAM_WR_N : std_logic;
  signal HRAM_BANK1 : std_logic;
  signal CPU_RAM_ADDR : unsigned(17 downto 0);

  signal HRAM_READ_EN : std_logic;
  signal HRAM_WRITE_EN : std_logic;

  signal ioselect  : std_logic_vector(7 downto 0);
  signal devselect : std_logic_vector(7 downto 0);
  
  signal R_W_n     : std_logic;

  -- ramcard
  signal card_addr : unsigned(17 downto 0);
  signal card_ram_rd : std_logic;
  signal card_ram_we : std_logic;
  signal ram_card_read : std_logic;
  signal ram_card_write : std_logic;
  signal ram_card_sel : std_logic;

  
  signal video_rom_select : std_logic;
begin

  CLK_2M <= Q3;

  ram_addr <= CPU_RAM_ADDR when PHASE_ZERO = '1' else "00" & VIDEO_ADDRESS;
  ram_we <= ((we and RAM_SELECT) or (we and (HRAM_WRITE_EN or ram_card_write))) when PHASE_ZERO = '1' else '0';
  CPU_WE <= we;

  -- ramcard  
  ram_card_D: component ramcard
    port map
    (
      clk => CLK_14M,
      reset_in => reset,
      addr => A,
      ram_addr => card_addr,
      card_ram_we => card_ram_we,
      card_ram_rd => card_ram_rd
    );
    
    ram_card_read  <= ROM_SELECT and card_ram_rd;
    ram_card_write <= ROM_SELECT and card_ram_we;
	 ram_card_sel   <= ram_card_write  when we = '1' else ram_card_read;
  
  RAM_data_latch : process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      if AX = '1' and CAS_N = '0' and RAS_N = '1' and Q3 = '0' then
        -- Latch video data at Phase 1, CPU data at Phase 0
        if PHASE_ZERO = '0' then
            VIDEO_DL_LATCH <= ram_do;
        elsif aux = '0' then
            CPU_DL <= ram_do(7 downto 0);
        else
            CPU_DL <= ram_do(15 downto 8);
        end if;
      end if;
    end if;
  end process;
  VIDEO_DL <= VIDEO_DL_LATCH(7 downto 0) when PHASE_ZERO = '0' else VIDEO_DL_LATCH(15 downto 8);

  ADDR <= A;
  D <= D_OUT;

  IO_SELECT <= ioselect;
  DEVICE_SELECT <= devselect;

  -- Address decoding
--  rom_addr <= (A(13) and A(12)) & (not A(12)) & A(11 downto 0);
  rom_addr <= A(13 downto 0);

  address_decoder: process (A, C3ROM, C8ROM, CXROM)
  begin
    ROM_SELECT <= '0';
    RAM_SELECT <= '0';
    KEYBOARD_SELECT <= '0';
    C01X_SELECT <= '0';
    TAPE_OUT <= '0';
    SPEAKER_SELECT <= '0';
    SOFTSWITCH_SELECT <= '0';
    GAMEPORT_SELECT <= '0';
    PDL_STROBE <= '0';
    STB <= '0';
    HRAM_CONTROL <= '0';
    ioselect <= (others => '0');
    devselect <= (others => '0');
    IO_STROBE <= '0';
    case A(15 downto 14) is
      when "00" | "01" | "10" =>         -- 0000 - BFFF
        RAM_SELECT <= '1';
      when "11" => -- C000 - FFFF
        case A(13 downto 12) is
          when "00" =>                  -- C000 - CFFF
            case A(11 downto 8) is
              when x"0" =>              -- C000 - C0FF
                case A(7 downto 4) is
                  when x"0" =>          -- C000 - C00F
                     KEYBOARD_SELECT <= '1';
                  when x"1" =>          -- C010 - C01F
                    C01X_SELECT <= '1';
                  when x"2" =>          -- C020 - C02F
                    TAPE_OUT <= '1';
                  when x"3" =>          -- C030 - C03F
                    SPEAKER_SELECT <= '1';
                  when x"4" =>          -- C040 - C04F
                    STB <= '1';
                  when x"5" =>          -- C050 - C05F
                    SOFTSWITCH_SELECT <= '1';
                  when x"6" =>          -- C060 - C06F
                    GAMEPORT_SELECT <= '1';
                  when x"7" =>          -- C070 - C07F
                    PDL_STROBE <= '1';
                  when x"8" =>          -- C080 - C08F
                    HRAM_CONTROL <= '1';
                  when x"9" | x"A" | x"B" | -- C090 - C0FF
                       x"C" | x"D" | x"E" | x"F" =>
                    devselect(TO_INTEGER(A(6 downto 4))) <= '1';
                  when others => null;                
                end case;
              when x"1" | x"2" |   -- C100 - C2FF, C400-C7FF
                   x"4" | x"5" | x"6" | x"7" =>
                if CXROM = '1' then
                  ROM_SELECT <= '1';
                else
                  ioselect(TO_INTEGER(A(10 downto 8))) <= '1';
                end if;
              when x"3" => -- C300 - C3FF
                if CXROM = '1' or C3ROM = '0' then
                  ROM_SELECT <= '1';
                else
                  ioselect(TO_INTEGER(A(10 downto 8))) <= '1';
                end if;
              when x"8" | x"9" | x"A" |  -- C800 - CFFF
                   x"B" | x"C" | x"D" | x"E" | x"F" =>
                if CXROM = '1' or C8ROM = '1' then
                  ROM_SELECT <= '1';
                else
                  IO_STROBE <= '1';
                end if;
              when others => null;
            end case;
          when "01" | "10" | "11" =>    -- D000 - FFFF
            ROM_SELECT <= '1';
          when others =>
            null;
        end case;
      when others => null;
    end case;        
  end process address_decoder;

  aux_ctrl: process(A, we, RAMRD, RAMWRT, STORE80, HIRES_MODE, PAGE2, ALTZP, ram_card_sel)
  begin
    aux <= '0';
	 if ram_card_sel = '1' then
        aux <= '0';
    elsif A(15 downto 9) = "0000000" or A(15 downto 14) = "11" then -- Page 00,01,C0-FF
        aux <= ALTZP;
    elsif A(15 downto 10) = "000001" then -- Page 04-07
        aux <= (STORE80 and PAGE2) or (not STORE80 and (( RAMRD and not we ) or ( RAMWRT and we)));
    elsif A(15 downto 13) = "001" then -- Page 20-3F
        aux <= (STORE80 and PAGE2 and HIRES_MODE) or ((not STORE80 or not HIRES_MODE) and (( RAMRD and not we ) or ( RAMWRT and we)));
    else
        aux <= ( RAMRD and not we ) or ( RAMWRT and we);
    end if;
  end process aux_ctrl;

  speaker_ctrl: process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      if PHASE_ZERO_R = '1' and SPEAKER_SELECT = '1' then
        speaker_sig <= not speaker_sig;
      end if;
    end if;
  end process speaker_ctrl;

  softswitches: process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      if PHASE_ZERO_R = '1' and SOFTSWITCH_SELECT = '1' then
        soft_switches(TO_INTEGER(A(3 downto 1))) <= A(0);
      end if;
    end if;
  end process softswitches;

  TEXT_MODE <= soft_switches(0);
  MIXED_MODE <= soft_switches(1);
  PAGE2 <= soft_switches(2);
  HIRES_MODE <= soft_switches(3);
  AN <= soft_switches(7 downto 4);
  DHIRES_MODE <= AN(3);

  hram_ctrl: process (CLK_14M, reset)
  begin
    if reset = '1' then
        HRAM_PRE_WR <= '0';
        HRAM_READ <= '0';
        HRAM_WR_N <= '0';
        HRAM_BANK1 <= '0';
    elsif rising_edge(CLK_14M) then
      if PHASE_ZERO_R = '1' and HRAM_CONTROL = '1' then
        HRAM_BANK1 <= A(3);
        HRAM_PRE_WR <= A(0) and not we;
        if (HRAM_PRE_WR and not we and A(0)) = '1' then
            HRAM_WR_N <= '0';
        elsif A(0) = '0' then
            HRAM_WR_N <= '1';
        end if;
        HRAM_READ <= not (A(0) xor A(1));
      end if;
    end if;
  end process hram_ctrl;

  Dxxx <= '1' when A(15 downto 12) = x"D" else '0';
  CPU_RAM_ADDR <= card_addr when ram_card_sel = '1' else "00" & A(15 downto 13) & (A(12) and not (HRAM_BANK1 and Dxxx)) & A(11 downto 0);
  HRAM_READ_EN <= HRAM_READ and A(15) and A(14) and (A(13) or A(12)); -- Dxxx-Fxxx
  HRAM_WRITE_EN <= not HRAM_WR_N and A(15) and A(14) and (A(13) or A(12)); -- Dxxx-Fxxx

  softswitches_IIe: process (CLK_14M, reset)
  begin
    if reset = '1' then
      STORE80 <= '0';
      RAMRD <= '0';
      RAMWRT <= '0';
      CXROM <= '0';
      ALTZP <= '0';
      C3ROM <= '0';
      C8ROM <= '0';
      COL80 <= '0';
      ALTCHAR <= '0';
    elsif rising_edge(CLK_14M) then
      READ_KEY <= '0';
      if A(15 downto 8) = x"C3" and C3ROM = '0' then
        C8ROM <= '1';
      elsif A = x"CFFF" then
        C8ROM <= '0';
      end if;
      if PHASE_ZERO_R = '1' and KEYBOARD_SELECT = '1' and we = '1' then
        case A(3 downto 1) is
        when "000" => STORE80 <= A(0);
        when "001" => RAMRD <= A(0);
        when "010" => RAMWRT <= A(0);
        when "011" => CXROM <= A(0);
        when "100" => ALTZP <= A(0);
        when "101" => C3ROM <= A(0);
        when "110" => COL80 <= A(0);
        when "111" => ALTCHAR <= A(0);
        when others => null;
        end case;
      elsif C01X_SELECT = '1' and we = '0' then
        case A(3 downto 0) is
        when x"0" =>
          SF_D <= AKD;
          READ_KEY <= '1';
        when x"1" => SF_D <= not HRAM_BANK1;
        when x"2" => SF_D <= HRAM_READ;
        when x"3" => SF_D <= RAMRD;
        when x"4" => SF_D <= RAMWRT;
        when x"5" => SF_D <= CXROM;
        when x"6" => SF_D <= ALTZP;
        when x"7" => SF_D <= C3ROM;
        when x"8" => SF_D <= STORE80;
        when x"9" => SF_D <= not VBL;
        when x"A" => SF_D <= TEXT_MODE;
        when x"B" => SF_D <= MIXED_MODE;
        when x"C" => SF_D <= PAGE2;
        when x"D" => SF_D <= HIRES_MODE;
        when x"E" => SF_D <= ALTCHAR;
        when x"F" => SF_D <= COL80;
        when others => null;
        end case;
      elsif C01X_SELECT = '1' and we = '1' then
        READ_KEY <= '1';
      end if;
    end if;
  end process softswitches_IIe;

  speaker <= speaker_sig;

  D_IN <= CPU_DL when RAM_SELECT = '1' or HRAM_READ_EN = '1' or ram_card_read = '1' else  -- RAM
          K when KEYBOARD_SELECT = '1' else  -- Keyboard
          SF_D & K(6 downto 0) when C01X_SELECT = '1' else -- ][e softswitches
          GAMEPORT(TO_INTEGER(A(2 downto 0))) & VIDEO_DL_LATCH(6 downto 0)  -- Gameport
             when GAMEPORT_SELECT = '1' else
          rom_out when ROM_SELECT = '1' else  -- ROMs
          VIDEO_DL_LATCH(7 downto 0) when TAPE_OUT = '1' or SPEAKER_SELECT = '1' or STB = '1' or
                        SOFTSWITCH_SELECT = '1' or PDL_STROBE = '1' or
                        HRAM_CONTROL = '1' or A = x"CFFF" else  -- Floating bus
          PD;                           -- Peripherals

  timing : entity work.timing_generator port map (
    CLK_14M        => CLK_14M,
	 PALMODE        => PALMODE,
    VID7M          => CLK_7M,
    CAS_N          => CAS_N,
    RAS_N          => RAS_N,
    Q3	           => Q3,
    AX             => AX,
    PHI0           => PHASE_ZERO,
    PHI0_EN_R      => PHASE_ZERO_R,
    PHI0_EN_F      => PHASE_ZERO_F,
    COLOR_REF      => COLOR_REF,
    TEXT_MODE      => TEXT_MODE,
    PAGE2          => PAGE2,
    HIRES_MODE     => HIRES_MODE,
    MIXED_MODE     => MIXED_MODE,
    COL80          => COL80,
    STORE80        => STORE80,
    DHIRES_MODE    => DHIRES_MODE,
    VID7           => VIDEO_DL(7),
    VIDEO_ADDRESS  => VIDEO_ADDRESS,
    SEGA           => SEGA,
    SEGB           => SEGB,
    SEGC           => SEGC,
    GR1            => COLOR_LINE,
    GR2            => GR2,
    VBLANK         => VBL,
    HBLANK         => HBL,
    WNDW_N         => WNDW_N,
    LDPS_N         => LDPS_N);

  video_rom_select <= '1' when ioctl_download='1' and ioctl_wr = '1' and ioctl_index = "00000001" else '0';
	 
  video_display : entity work.video_generator port map (
    CLK_14M    => CLK_14M,
    CLK_7M     => CLK_7M,
    GR2        => GR2,
    SEGA       => SEGA,
    SEGB       => SEGB,
    SEGC       => SEGC,
    ALTCHAR    => ALTCHAR,
    ROMSWITCH  => ROMSWITCH,
    WNDW_N     => WNDW_N,
    DL         => VIDEO_DL,
    LDPS_N     => LDPS_N,
    FLASH_CLK  => FLASH_CLK,

    ioctl_addr => ioctl_addr,
    ioctl_data => ioctl_data,
    ioctl_wr => video_rom_select,
	 
    VIDEO      => VIDEO);

  we <= not T65_WE_N when cpu = '0' else not R65C02_WE_N;
  A <= unsigned(T65_A(15 downto 0)) when cpu = '0' else R65C02_A;
  D_OUT <= unsigned(T65_DO) when cpu = '0' else R65C02_DO;
  T65_DI <= std_logic_vector(D_OUT) when T65_WE_N = '0' else std_logic_vector(D_IN);
  --CPU_EN <= PHASE_ZERO_F; -- not sure why this isn't working??
  CPU_EN <= '1' when PHASE_ZERO_D = '1' and PHASE_ZERO = '0' else '0';
  cpu_enable: process (CLK_14M)
  begin
    if rising_edge(CLK_14M) then
      PHASE_ZERO_D <= PHASE_ZERO;
    end if;
  end process cpu_enable;




  cpu6502 : entity work.T65
    port map (
      mode     => "00",
      clk      => CLK_14M,
      enable   => CPU_EN and (not CPU_WAIT),
      res_n    => not reset,

      Rdy      => '1',
      Abort_n  => '1',
      SO_n     => '1',

      IRQ_n    => IRQ_N,
      NMI_n    => NMI_N,
      R_W_n    => T65_WE_N,
      A        => T65_A,
      DI       => T65_DI,
      DO       => T65_DO
    );

  cpu65c02: entity work.R65C02
    port map (
        reset => not reset,
        clk => CLK_14M,
        enable => CPU_EN and (not CPU_WAIT),
        nmi_n => NMI_N,
        irq_n => IRQ_N,
        di => D_IN,
        do => R65C02_DO,
        addr => R65C02_A,
        nwe => R65C02_WE_N
    );

  -- Original Apple had asynchronous ROMs.  We use a synchronous ROM
  -- that needs its address earlier, hence the odd clock.
  roms : work.spram
  generic map (14,8,"rtl/roms/apple2e.mif")
  port map (
   address => std_logic_vector(rom_addr),
   clock => CLK_14M,
   data => (others=>'0'),
   wren => '0',
   unsigned(q) => rom_out);

end rtl;
