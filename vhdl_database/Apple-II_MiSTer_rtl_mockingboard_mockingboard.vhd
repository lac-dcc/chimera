--
-- Mockingboard clone for the Apple II
-- Model A: two AY-3-8913 chips for six audio channels
--
-- Top file by W. Soltys <wsoltys@gmail.com>
-- 
-- loosely based on:
-- http://www.downloads.reactivemicro.com/Public/Apple%20II%20Items/Hardware/Mockingboard_v1/Mockingboard-v1a-Docs.pdf
-- http://www.applelogic.org/CarteBlancheIIProj6.html
--

library ieee ;
  use ieee.std_logic_1164.all ;
--  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;
  
  
entity MOCKINGBOARD is
  port (
    CLK_14M           : in std_logic;
    PHASE_ZERO        : in std_logic;
    PHASE_ZERO_R      : in std_logic;
    PHASE_ZERO_F      : in std_logic;
    I_ADDR            : in std_logic_vector(7 downto 0);
    I_DATA            : in std_logic_vector(7 downto 0);
    O_DATA            : out std_logic_vector(7 downto 0);
    
    I_RW_L            : in std_logic;
    O_IRQ_L           : out std_logic;
    O_NMI_L           : out std_logic;
    I_IOSEL_L         : in std_logic;
    I_RESET_L         : in std_logic;
    I_ENA_H           : in std_logic;     
    
    O_AUDIO_L         : out std_logic_vector(9 downto 0);
    O_AUDIO_R         : out std_logic_vector(9 downto 0)
    );
 end;
 
 
 architecture RTL of MOCKINGBOARD is
 
  signal o_pb_l           : std_logic_vector(7 downto 0);
  signal o_pb_r           : std_logic_vector(7 downto 0);
  
  signal i_psg_r          : std_logic_vector(7 downto 0);
  signal o_psg_r          : std_logic_vector(7 downto 0);
  signal i_psg_l          : std_logic_vector(7 downto 0);
  signal o_psg_l          : std_logic_vector(7 downto 0);

  signal o_psg_al         : std_logic_vector(7 downto 0);
  signal o_psg_bl         : std_logic_vector(7 downto 0);
  signal o_psg_cl         : std_logic_vector(7 downto 0);
  signal o_psg_ol         : std_logic_vector(9 downto 0);
  
  signal o_psg_ar         : std_logic_vector(7 downto 0);
  signal o_psg_br         : std_logic_vector(7 downto 0);
  signal o_psg_cr         : std_logic_vector(7 downto 0);
  signal o_psg_or         : std_logic_vector(9 downto 0);
  
  signal o_data_l          : std_logic_vector(7 downto 0);
  signal o_data_r          : std_logic_vector(7 downto 0);
  
  signal lirq             : std_logic;
  signal rirq             : std_logic;
  
  signal PSG_EN   : std_logic;
  signal VIA_CE_F, VIA_CE_R, PHASE_ZERO_D : std_logic;

  component YM2149
  port (
    CLK         : in  std_logic;
    CE          : in  std_logic;
    RESET       : in  std_logic;
    BDIR        : in  std_logic; -- Bus Direction (0 - read , 1 - write)
    BC          : in  std_logic; -- Bus control
    DI          : in  std_logic_vector(7 downto 0);
    DO          : out std_logic_vector(7 downto 0);
    CHANNEL_A   : out std_logic_vector(7 downto 0);
    CHANNEL_B   : out std_logic_vector(7 downto 0);
    CHANNEL_C   : out std_logic_vector(7 downto 0);

    SEL         : in  std_logic;
    MODE        : in  std_logic;

    ACTIVE      : out std_logic_vector(5 downto 0);

    IOA_in      : in  std_logic_vector(7 downto 0);
    IOA_out     : out std_logic_vector(7 downto 0);

    IOB_in      : in  std_logic_vector(7 downto 0);
    IOB_out     : out std_logic_vector(7 downto 0)
    );
  end component;

begin

  O_DATA <= o_data_l when I_ADDR(7) = '0' else o_data_r;
  O_IRQ_L <= not lirq or not I_ENA_H;
  O_NMI_L <= not rirq or not I_ENA_H;

  PSG_EN <= PHASE_ZERO_F;
  VIA_CE_R <= PHASE_ZERO_F;
  VIA_CE_F <= PHASE_ZERO_R;


-- Left Channel Combo
  m6522_left : work.via6522
    port map (
      clock       => clk_14M,
      rising      => VIA_CE_R,
      falling     => VIA_CE_F,
      reset       => not I_RESET_L,

      addr        => I_ADDR(3 downto 0),
      wen         => not I_RW_L and not I_ADDR(7) and not I_IOSEL_L and I_ENA_H,
      ren         => I_RW_L and not I_ADDR(7) and not I_IOSEL_L and I_ENA_H,
      data_in     => I_DATA,
      data_out    => o_data_l,

      phi2_ref    => open,

      port_a_o    => i_psg_l,
      port_a_t    => open,
      port_a_i    => o_psg_l,

      port_b_o    => o_pb_l,
      port_b_t    => open,
      port_b_i    => (others => '1'),

      ca1_i       => '1',
      ca2_o       => open,
      ca2_i       => '1',
      cb1_o       => open,
      cb1_i       => '1',
      cb1_t       => open,
      cb2_o       => open,
      cb2_i       => '1',
      cb2_t       => open,
      irq         => lirq
      );

  psg_left: YM2149
  port map (
    CLK         => CLK_14M,
    CE          => PSG_EN and I_ENA_H,
    RESET       => not o_pb_l(2),
    BDIR        => o_pb_l(1),
    BC          => o_pb_l(0),
    DI          => i_psg_l,
    DO          => o_psg_l,
    CHANNEL_A   => o_psg_al,
    CHANNEL_B   => o_psg_bl,
    CHANNEL_C   => o_psg_cl,

    SEL         => '0',
    MODE        => '0',

    ACTIVE      => open,

    IOA_in      => (others => '0'),
    IOA_out     => open,

    IOB_in      => (others => '0'),
    IOB_out     => open
    );

  O_AUDIO_L <= std_logic_vector(unsigned("00" & o_psg_al) + unsigned("00" & o_psg_bl) + unsigned("00" & o_psg_cl));

-- Right Channel Combo
  m6522_right : work.via6522
    port map (
      clock       => clk_14M,
      rising      => VIA_CE_R,
      falling     => VIA_CE_F,
      reset       => not I_RESET_L,

      addr        => I_ADDR(3 downto 0),
      wen         => not I_RW_L and I_ADDR(7) and not I_IOSEL_L and I_ENA_H,
      ren         => I_RW_L and I_ADDR(7) and not I_IOSEL_L and I_ENA_H,
      data_in     => I_DATA,
      data_out    => o_data_r,

      phi2_ref    => open,

      port_a_o    => i_psg_r,
      port_a_t    => open,
      port_a_i    => o_psg_r,

      port_b_o    => o_pb_r,
      port_b_t    => open,
      port_b_i    => (others => '1'),

      ca1_i       => '1',
      ca2_o       => open,
      ca2_i       => '1',
      cb1_o       => open,
      cb1_i       => '1',
      cb1_t       => open,
      cb2_o       => open,
      cb2_i       => '1',
      cb2_t       => open,
      irq         => rirq
      );

  psg_right: YM2149
  port map (
    CLK         => CLK_14M,
    CE          => PSG_EN and I_ENA_H,
    RESET       => not o_pb_r(2),
    BDIR        => o_pb_r(1),
    BC          => o_pb_r(0),
    DI          => i_psg_r,
    DO          => o_psg_r,
    CHANNEL_A   => o_psg_ar,
    CHANNEL_B   => o_psg_br,
    CHANNEL_C   => o_psg_cr,

    SEL         => '0',
    MODE        => '0',

    ACTIVE      => open,

    IOA_in      => (others => '0'),
    IOA_out     => open,

    IOB_in      => (others => '0'),
    IOB_out     => open
    );

  O_AUDIO_R <= std_logic_vector(unsigned("00" & o_psg_ar) + unsigned("00" & o_psg_br) + unsigned("00" & o_psg_cr));


end architecture RTL;