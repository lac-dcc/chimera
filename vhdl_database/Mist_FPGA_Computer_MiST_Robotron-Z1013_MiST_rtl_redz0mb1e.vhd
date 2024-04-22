------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       :  redzombie.vhd
-- Author     :  fpgakuechle
-- Company    : hobbyist
-- Created    : 2012-12
-- Last update: 2013-04-15
-- Licence     : GNU General Public License (http://www.gnu.de/documents/gpl.de.html)
------------------------------------------------------------------------------
-- Description: 
-- top structural, clues CPU, RAM and IO- control together
--red zombie (z1013 at starterkit) topfile
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.pkg_redz0mb1e.all;

library support;
library T80;


entity redz0mb1e is
  port (
    RESET_n               : in std_logic;
    --
    cpu_clk               : in std_logic;
    cpu_hold_n            : in std_logic;
    video_clk             : in std_logic;
    -- ascii from keyboard (or serial line)
    ascii                 : in std_logic_vector( 7 downto 0);
    ascii_press           : in std_logic;
    ascii_release         : in std_logic;
    -- vga interface
    red_o                 : out std_logic;
    blue_o                : out std_logic;
    green_o               : out std_logic;
    vsync_o               : out std_logic;
    hsync_o               : out std_logic;
    col_fg                : in  T_COLOR;
    col_bg                : in  T_COLOR;
    -- SRAM interface
    ramAddr               : out std_logic_vector(15 downto 0);
    ramData_in            : in  std_logic_vector(7 downto 0);
    ramData_out           : out std_logic_vector(7 downto 0);
    ramOe_N               : out std_logic; 
    ramCE_N               : out std_logic;
    ramWe_N               : out std_logic;
    -- user port (PIO port A) for joystick
    x4_in                 : in  std_logic_vector(7 downto 0);
    x4_out                : out std_logic_vector(7 downto 0);
    --
    sound_out             : out std_logic;
    -- PETERS extension
    clk_2MHz_4MHz         : out std_logic
);
end entity redz0mb1E;

architecture behave of redz0mb1E is

  signal boot_state   : std_logic := '1';
  signal CEN          : std_logic;
  signal WAIT_n       : std_logic := '1';
  signal int_sense_n  : std_logic;
  --
  signal M1_n         : std_logic;
  signal IOREQ_n      : std_logic;
  signal mreq_n       : std_logic;
  signal RFSH_n       : std_logic;
  --
  signal RD_n         : std_logic;
  signal WR_n         : std_logic;
  --
  signal addr         : std_logic_vector(15 downto 0);
  signal data2cpu     : std_logic_vector(7 downto 0);
  --
  signal data4PIO     : std_logic_vector(7 downto 0);
  signal data4RAM     : std_logic_vector(7 downto 0);
  signal data4ROM     : std_logic_vector(7 downto 0);
  signal data4video   : std_logic_vector(7 downto 0);
  signal data4ext     : std_logic_vector(7 downto 0);
  signal data4CPU     : std_logic_vector(7 downto 0);

  --memory block select
  signal sel_rom_n    : std_logic;
  signal sel_vram_n   : std_logic;
  signal sel_ram_n    : std_logic;

  --io
  signal sel_io_pio_n    : std_logic;  --pio_select
  signal sel_io_kybrow_n : std_logic;
  signal sel_io_1_n      : std_logic;

  signal wait_io_pio_n : std_logic := '1';
  --
  signal porta4pio     : std_logic_vector(7 downto 0);
  signal portb4pio     : std_logic_vector(7 downto 0);
                       
  signal porta2pio     : std_logic_vector(7 downto 0):= (others => '0');
  signal portb2pio     : std_logic_vector(7 downto 0):= (others => '0');

  signal stba2PIO_n    : std_logic  := '0';
  signal stbb2PIO_n    : std_logic  := '0';
                         
  signal rdya4PIO_n    : std_logic;
  signal rdyb4PIO_n    : std_logic;

  signal IRQEna2PIO    : std_logic := '1';
  signal IRQEna4PIO    : std_logic;
                         
  signal astb2PIO_n    : std_logic := '1'; 
  signal bstb2PIO_n    : std_logic := '1'; 

  -- signals for peters extension
  signal extension_reg : std_logic_vector(7 downto 0);
  constant  ext_video_32_64     : natural := 7;
  constant  ext_clk_2MHz_4MHz   : natural := 6;
  constant  ext_2nd_zgen        : natural := 5;
  constant  ext_romdis          : natural := 4;
  
  
  component T80s
    generic (
      Mode    : integer;
      T2Write : integer;
      IOWait  : integer);
    port (
      RESET_n : in  std_logic;
      CLK_n   : in  std_logic;
      WAIT_n  : in  std_logic;
      INT_n   : in  std_logic;
      NMI_n   : in  std_logic;
      BUSRQ_n : in  std_logic;
      M1_n    : out std_logic;
      MREQ_n  : out std_logic;
      IORQ_n  : out std_logic;
      RD_n    : out std_logic;
      WR_n    : out std_logic;
      RFSH_n  : out std_logic;
      HALT_n  : out std_logic;
      BUSAK_n : out std_logic;
      A       : out std_logic_vector(15 downto 0);
      DI      : in  std_logic_vector(7 downto 0);
      DO      : out std_logic_vector(7 downto 0));
  end component;

  component video
    generic (
      G_System : T_SYSTEM;
       G_ReadOnly :boolean);
    port (
      clk       : in  std_logic;
      rst_i     : in  std_logic;
      cs_ni     : in  std_logic;
      we_ni     : in  std_logic;
      data_i    : in  std_logic_vector(7 downto 0);
      data_o    : out std_logic_vector(7 downto 0);
      addr_i    : in  std_logic_vector(9 downto 0);
      video_clk : in  std_logic;
      red_o     : out std_logic;
      blue_o    : out std_logic;
      green_o   : out std_logic;
      vsync_o   : out std_logic;
      hsync_o   : out std_logic;
      col_fg    : in  T_COLOR;
      col_bg    : in  T_COLOR
    );
   end component;
  
  component ram_sys
    generic (
      G_System : T_SYSTEM);
    port (
      clk    : in  std_logic;
      cs_ni  : in  std_logic;
      we_ni  : in  std_logic;
      data_o : out std_logic_vector(7 downto 0);
      data_i : in  std_logic_vector(7 downto 0);
      addr_i : in  std_logic_vector(13 downto 0)); -- 14 bit = 16k, 16 bit = 64k
  end component;

  component rom_sys
    generic (
      G_SYSTEM : T_SYSTEM);
    port (
      clk    : in  std_logic;
      cs_ni  : in  std_logic;
      oe_ni  : in  std_logic;
      data_o : out std_logic_vector( 7 downto 0);
      addr_i : in  std_logic_vector(11 downto 0));
  end component;

  component addr_decode
    port (
      addr_i   : in  std_logic_vector(15 downto 0);
      ioreq_ni : in  std_logic;
      mreq_ni  : in  std_logic;
      rfsh_ni  : in  std_logic;
      cs_mem_o : out std_logic_vector(3 downto 0);
      cs_io_no  : out std_logic_vector(3 downto 0));
  end component;              --not used

  COMPONENT pio
    PORT (
      clk      : in  std_logic;
      ce_ni    : in  std_logic;
      IOREQn_i   : in  std_logic;
      data_o   : out std_logic_vector(7 downto 0);
      data_i   : in  std_logic_vector(7 downto 0);
      RD_n     : in  std_logic;
      M1_n     : in  std_logic;
      sel_b_nA : in  std_logic;
      sel_c_nD : in  std_logic;
      IRQEna_i : in  std_logic;
      IRQEna_o : out std_logic;
      INTn_o   : out std_logic;
      astb_n   : in  std_logic;
      ardy_n   : out std_logic;
      porta_o  : out std_logic_vector(7 downto 0);
      porta_i  : in  std_logic_vector(7 downto 0);
      bstb_n   : in  std_logic;
      brdy_n   : out std_logic;
      portb_o  : out std_logic_vector(7 downto 0);
      portb_i  : in  std_logic_vector(7 downto 0)); 
  END COMPONENT;
 --
  component kyb_emu
    port (
      clk_4x8               : in  std_logic;
      clk_ps2               : in  std_logic;
      data_i                : in  std_logic_vector(7 downto 0);
      ce_key_ni             : in  std_logic;
      col_o                 : out std_logic_vector(7 downto 0);
      key_released          : in  std_logic;
      key_event             : in  std_logic;
      key_extended          : in  std_logic;
      scancode_in           : in  std_logic_vector(7 downto 0);
      keyboard_layout_en_de : in  std_logic
    );
  end component;
  
begin

  --z80
  T80_1 : T80s
    generic map (
      Mode    => 0,
      T2Write => 0,
      IOWait  => 1                      --std IO-cycle
      )
    port map (
      RESET_n => reset_n,               --
      CLK_n   => cpu_clk,               --
      WAIT_n  => wait_n,                --no waits @ 1st implement
      INT_n   => int_sense_n,                 --
      NMI_n   => '1',                   -- no NMI implemented
      BUSRQ_n => '1',                   --no 2nd busmaster (dma) used yet
      M1_n    => M1_n,
      IORQ_n  => IOREQ_n,               --IO Request
      mreq_n  => mreq_n,
      RFSH_n  => rfsh_n,                --refresh deselects all mem devices
      HALT_n  => open,                  --not used at 1st impl
      BUSAK_n => open,                  --bus freeing (for DMA) not used yet
      A       => Addr,                  --
      RD_n    => RD_n,
      WR_n    => WR_n,
      DI      => Data2cpu,              --
      DO      => data4CPU);             --

    --ROM
    b_rom_sys:block is
    begin
      rom_sys_1: rom_sys
        generic map (
          G_System => DEV
          )
        port map (
          clk    => cpu_clk,
          cs_ni  => sel_rom_n,
          oe_ni  => rd_n,
          data_o => data4rom,
          addr_i => addr(11 downto 0)
        );
    end block b_rom_sys;

    -- use external RAM as ROM, so take data from there
    --data4rom <= rom_data_in;

    --RAM
    SRAM_control_p: process(sel_rom_n, sel_ram_n, wr_n, data4cpu, addr)
    begin
        if wr_n = '0' and sel_ram_n = '0' then
            --write to SRAM
            ramWe_N     <= '0';     
            ramOe_N     <= '1';
            ramData_out <= data4cpu;
        else
            -- read
            ramWe_N     <= '1';
            ramOe_N     <= '0';
            ramData_out <= (others => '-');
        end if;         

--      ramCe_N         <= sel_ram_n and sel_rom_n;
        ramCe_N         <= sel_ram_n;
        ramAddr         <= addr(15 downto 0);
    end process;
    data4ram <= ramData_in;


--  -- internal RAM (no *.z80 load possible)
--  ram_sys_1: entity work.ram_sys
--      generic map (
--          G_System => DEV
--      )
--      port map 
--      (
--          clk    => cpu_clk,
--          cs_ni  => sel_ram_n,
--          we_ni  => wr_n,
--          data_o => data4ram,
--          data_i => data4cpu,
--          addr_i => addr(13 downto 0)
--      );
   
        
    -- Boot State Controller        
    -- keep CPU reading of NOP until ROM is reached
    boot_state_control: process(cpu_clk, reset_n)
    begin
        if (reset_n = '0') then
            boot_state <= '1';
        elsif rising_edge(cpu_clk) then
            if boot_state = '1' and sel_rom_n = '0' then --ROM selektiert
                boot_state <= '0';  
            end if;
        end if;
    end process;    
  
--datain - mux
-- PIO

pio_1: pio
  PORT MAP (
    clk      => cpu_clk,
    ce_ni    => sel_io_pio_n,
    IOREQn_i => IOREQ_n,
    data_o   => data4PIO,
    data_i   => data4cpu,
    RD_n     => RD_n,
    M1_n     => M1_n,
    sel_b_nA => addr(1),
    sel_c_nD => addr(0),
    IRQEna_i => IRQEna2PIO,
    IRQEna_o => IRQEna4PIO,
    INTn_o   => int_sense_n,
    astb_n   => astb2PIO_n,                 -- Data strobe in, is able to generate IREQ
    ardy_n   => rdya4PIO_n,                 --
    porta_o  => porta4pio,
    porta_i  => porta2pio,
    bstb_n   => bstb2PIO_n,
    brdy_n   => rdyb4PIO_n,
    portb_o  => portb4pio,
    portb_i  => portb2pio);

    -- PIO port A (X4) for user port (joystick)
    x4_out      <= porta4pio;
    porta2pio   <= x4_in;

    -- PIO port B for sound
    sound_out   <= portb4pio( 7);


    -- eingabegerät zu tastenbuffer
--kyb_emu_1 : kyb_emu
--  PORT MAP (
--      clk_4x8               => cpu_clk,               -- : in  std_logic;
--      clk_ps2               => cpu_clk,               -- : in  std_logic;
--      data_i                => data4cpu,              -- : in  std_logic_vector(7 downto 0);
--      ce_key_ni             => sel_io_kybrow_n,       -- : in  std_logic;
--      col_o                 => portb2pio,             -- : out std_logic_vector(7 downto 0);
--      key_extended          => key_extended,          -- : in  std_logic;
--      key_released          => key_released,          -- : in  std_logic;
--      key_event             => key_event,             -- : in  std_logic;
--      scancode_in           => kyb_in,                -- : in  std_logic_vector(7 downto 0);
--      keyboard_layout_en_de => keyboard_layout_en_de  -- : in  std_logic
--  );


    keyboard_matrix_inst : entity work.keyboard_matrix
    port map
    (
        clk            => cpu_clk,                       -- : in    std_logic;
        -- Z1013 side
        column         => data4cpu,                      -- : in    std_logic_vector( 7 downto 0);
        column_en_n    => sel_io_kybrow_n,               -- : in    std_logic;
        row            => portb2pio,                     -- : out   std_logic_vector( 7 downto 0);  -- to PIO port B
        -- keyboard side (from scancode decoder)
        ascii          => ascii,                         -- : in    std_logic_vector( 7 downto 0);
        ascii_press    => ascii_press,                   -- : in    std_logic;
        ascii_release  => ascii_release                  -- : in    std_logic;
    );


    --Ausgabegerät
    --Bildspeicher + Zeichengenerator + Ausgabe optionen

video_1 : video
  generic map (
    G_System   => DEV,
    G_ReadOnly => false)
  port map (
    clk       => cpu_clk,
    rst_i     => reset_n,
    cs_ni     => sel_vram_n,
    we_ni     => wr_n,
    data_i    => data4cpu,
    data_o    => data4video,      
    addr_i    => addr(9 downto 0),
    video_clk => video_clk,
    red_o     => red_o,
    blue_o    => blue_o,
    green_o   => green_o,
    vsync_o   => vsync_o,
    hsync_o   => hsync_o,
    col_fg    => col_fg,
    col_bg    => col_bg);

--Timer
  
--PC-Link
--RAM/POM schreiben etc
--adressdecode
b_addr_decode : block is

  signal cs_mem  : std_logic_vector(3 downto 0);
  signal cs_io_n : std_logic_vector(3 downto 0);
begin
  addr_decode_1 : addr_decode
    port map (
      addr_i   => addr,
      ioreq_ni => ioreq_n,
      mreq_ni  => mreq_n,
      rfsh_ni  => rfsh_n,
      cs_mem_o => cs_mem,
      cs_io_no => cs_io_n);

  sel_rom_n  <=  cs_mem(2);
  sel_vram_n <=  cs_mem(1);
  sel_ram_n  <=  cs_mem(3);

  sel_io_pio_n     <= cs_io_n(0);
  sel_io_kybrow_n  <= cs_io_n(2);
  sel_io_1_n       <= cs_io_n(1);  
end block b_addr_decode;

-- A B AND
-- 0 0  0
-- 0 1  0
-- 1 0  0
-- 1 1  1
wait_n <= wait_io_pio_n and cpu_hold_n;

--data BUS to cpu
data2cpu <= "00000000" when boot_state = '1'   else
            data4PIO   when sel_io_pio_n = '0' else
            data4ROM   when sel_rom_n    = '0' else
            data4video when sel_vram_n   = '0' else
            data4RAM   when sel_ram_n    = '0' else
            data4ext   when sel_io_1_n   = '0' else
            "11111111"; --data4RAM;


    -- extension register 'PETERS-Platine'
    process
    begin
        wait until rising_edge( cpu_clk);
        if wr_n = '0' and sel_io_1_n = '0' then
            extension_reg( ext_clk_2MHz_4MHz)   <= data4cpu( ext_clk_2MHz_4MHz);
        end if;
        if reset_n = '0' then
            extension_reg   <= ( others => '0');
        end if;
        data4ext    <= extension_reg;
    end process;

    clk_2MHz_4MHz <= extension_reg( ext_clk_2MHz_4MHz);

end architecture;
