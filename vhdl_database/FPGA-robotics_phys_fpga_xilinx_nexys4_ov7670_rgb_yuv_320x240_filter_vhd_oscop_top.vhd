library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


library WORK;
use WORK.VGA_PKG.ALL;
use WORK.OSC_PKG.ALL;

entity top_oscop is
  generic (
    g_clk_freq        : natural := 100000000;
    g_sample_freq     : natural :=    250000  -- 250kHz
  );
  Port (
    rst               : in  std_logic;
    clk               : in  std_logic;
   ------ signal to be sampled ----------
    signal2sample     : in  std_logic_vector(c_bt_ramword-1 downto 0);
    -- restart the capture (after trigger detection)
    restart_capture   : in  std_logic;
   ------ to vga ----------------------
    vga_out_red         : out  std_logic_vector (7 downto 0);
    vga_out_green       : out  std_logic_vector (7 downto 0);
    vga_out_blue        : out  std_logic_vector (7 downto 0);
    vga_hsynch          : out  std_logic;
    vga_vsynch          : out  std_logic
  );
end top_oscop;


architecture struct of top_oscop is

  component BRAM is
    generic (
      gBitsProfBRAM       : natural := 10; -- 1024 posiciones
      gBitsBRAM           : natural := 8  -- palabra de 8 bits
    );
    port(
      clk          : in std_logic;
      -- puerto A de escritura
      dina         : in std_logic_vector(gBitsBRAM-1 downto 0);
      addra        : in std_logic_vector(gBitsProfBRAM-1 downto 0);
      wea          : in std_logic;
      douta        : out std_logic_vector(gBitsBRAM-1 downto 0);
      -- puerto B de lectura
      addrb        : in std_logic_vector(gBitsProfBRAM-1 downto 0);
      doutb        : out std_logic_vector(gBitsBRAM-1 downto 0)
    );
  end component;

  component CONTROL_OSCILOS is
    generic (
      g_clk_freq        : natural := 100000000;
      g_sample_freq     : natural :=    250000  -- 250kHz
    );
    Port (
      rst               : in  std_logic;
      clk               : in  std_logic;
      -- senal con la que se va a parar la captura
      trigger           : in  std_logic;
      -- senal con la que se continua la captura despues de pararse
      restart_capture   : in  std_logic;
      -- orden de capturar un nuevo dato
      capture_data_o    : out  std_logic;
      -- direccion de memoria donde se guardan los datos capturados
      addr_capture_o    : out  std_logic_vector(c_bt_ramdepth-1 downto 0)
    );
  end component;

  component DRAW_OSC is
    Port (
      FilaPantalla      : in  std_logic_vector (c_nb_lines-1 downto 0);
      ColPantalla       : in  std_logic_vector (c_nb_pxls-1 downto 0);
      Visible           : in  STD_LOGIC;
      red               : out std_logic_vector (7 downto 0);
      green             : out std_logic_vector (7 downto 0);
      blue              : out std_logic_vector (7 downto 0);
      -- addres and data to/from the ram
      data_ram          : in  std_logic_vector (c_bt_ramword-1 downto 0);
      addr_ram          : out std_logic_vector (c_bt_ramdepth-1 downto 0);
      -- were is the last (leftmost) sample in the ram (lifo)
      offset_addr_ram   : in  std_logic_vector (c_bt_ramdepth-1 downto 0)
      );
  end component;

  component vga_sync is
  Port (
    -- In ports
    rst        : in std_logic;
    clk        : in std_logic;
    -- Out ports
    visible    : out std_logic;
    new_pxl    : out std_logic;
    hsync      : out std_logic;
    vsync      : out std_logic;
    col        : out unsigned(10-1 downto 0);
    row        : out unsigned(10-1 downto 0)
  );
  end component;

  component FLANCO is
    generic (
      g_signal_inactive   : std_logic := '1'
    );
    port (
      rst                 : in   std_logic;
      clk                 : in   std_logic;
      -- from the push buttom
      signal_level_i      : in   std_logic;
      -- edge detectetion
      signal_edge_o       : out  std_logic
    );
  end component;


  -- BRAM - CONTROL_OSC
  signal capture_data    :   std_logic;
  -- BRAM - CONTROL_OSC - DRAW_OSC
  signal addr_capture    :   std_logic_vector(c_bt_ramdepth-1 downto 0);

  -- BRAM - DRAW_OSC
  signal addr_draw       :   std_logic_vector(c_bt_ramdepth-1 downto 0);
  signal data_draw       :   std_logic_vector(c_bt_ramword-1 downto 0);


  -- CONTROL_OSC
  --signal trigger         :   std_logic;

  -- SINCRO - DRAE_OSC
  signal osc_col         :   std_logic_vector (c_nb_pxls-1 downto 0);
  signal osc_row         :   std_logic_vector (c_nb_lines-1 downto 0);
  signal osc_col_us      :   unsigned (c_nb_pxls-1 downto 0);
  signal osc_row_us      :   unsigned (c_nb_lines-1 downto 0);
  signal osc_visible     :   std_logic;

  signal restart_capture_fl : std_logic;

begin
  osc_col <= std_logic_vector(osc_col_us);
  osc_row <= std_logic_vector(osc_row_us);


  I_LIFO_BRAM: BRAM
    generic map (
      gBitsProfBRAM   => c_bt_ramdepth,    
      gBitsBRAM       => c_bt_ramword
    )
    port map (
      clk          => clk,
      -- puerto A de escritura
      dina         => signal2sample,
      addra        => addr_capture,
      wea          => capture_data,
      -- douta        
      -- puerto B de lectura
      addrb        => addr_draw,
      doutb        => data_draw
    );

  I_CTROL_OSC: CONTROL_OSCILOS
    generic map (
      g_clk_freq      => g_clk_freq,
      g_sample_freq   => g_sample_freq
    )
    port map (
      rst             => rst,
      clk             => clk,
      trigger         => signal2sample(0),
      restart_capture => restart_capture_fl,
      capture_data_o  => capture_data,
      addr_capture_o  => addr_capture
    );

  I_DRAW: DRAW_OSC
    port map (
      FilaPantalla    => osc_row,
      ColPantalla     => osc_col,
      Visible         => osc_visible,
      red             => vga_out_red,
      green           => vga_out_green, 
      blue            => vga_out_blue, 
      -- addres and data to/from the ram
      data_ram        => data_draw,
      addr_ram        => addr_draw,
      -- were is the last (leftmost) sample in the ram (lifo)
      offset_addr_ram => addr_capture
      );

  I_VGA_SYNC: vga_sync
    port map (
      rst       => rst,
      clk       => clk,
      visible   => osc_visible,
      --new_pxl   => vga_new_pxl,
      hsync     => vga_hsynch,
      vsync     => vga_vsynch,
      col       => osc_col_us,
      row       => osc_row_us
    );

  I_FLANCO: FLANCO
    generic map (
      g_signal_inactive => c_push_button_inactive
    )
    port map (
      rst             => rst,
      clk             => clk,
      -- from the push buttom
      signal_level_i  => restart_capture,
      -- edge detectetion
      signal_edge_o   => restart_capture_fl
    );
  
end struct;

