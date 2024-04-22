----------------------------------------------------------------------------
-- Import useful libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- entity declaraction
entity  ADC_ISERDES_10bit_ultrascale  is

    port (
               -- System
               reset        :  in  std_logic;
               bitslip      :  in  std_logic;

               -- Clock inputs
               clkin        :  in  std_logic; -- line
               clkdiv       :  in  std_logic; -- iserdes-out (div by 4)
               frame_clk    :  in  std_logic; -- frame

               -- Data (serial in, parallel out)
               s_data        :  in  std_logic;
               p_data        :  out std_logic_vector(9 downto 0)
    );

end  ADC_ISERDES_10bit_ultrascale;

architecture ADC_ISERDES_arc of ADC_ISERDES_10bit_ultrascale is

     -- Components

     component ISERDESE3 generic (
      DATA_WIDTH           : integer;
      FIFO_ENABLE          : boolean
      );
     PORT (
      Q            : out std_logic_vector(7 downto 0);
      CLK          : in std_logic;
      CLK_B        : in std_logic;
      CLKDIV       : in std_logic;
      RST          : in std_logic;
      D            : in std_logic;
      FIFO_RD_CLK  : in std_logic;
      FIFO_RD_EN   : in std_logic;
      FIFO_EMPTY   : out std_logic
      );
     end component;

     component serdes_gearbox generic (
       DIN_WIDTH     : integer;
       S_TO_P_FACTOR : integer;
       P_TO_S_FACTOR : integer
       );
     port (
       fastclock : in std_logic;
       slowclock : in std_logic;
       din        : in std_logic_vector(3 downto 0);
       bitslip    : in std_logic;
       dout       : out std_logic_vector(9 downto 0)
       );
     end component;

     signal gearbox_q : std_logic_vector(9 downto 0);

     -- ISERDES Master
     signal iserdes_q         : std_logic_vector(7 downto 0);
     signal iserdes_d         : std_logic;
     signal iserdes_clk       : std_logic;
     signal iserdes_clk_inv   : std_logic;
     signal iserdes_rst       : std_logic;
     signal iserdes_clkdiv    : std_logic;
     signal iserdes_bitslip   : std_logic;
     signal iserdes_shift     : std_logic_vector(2 downto 1);

     signal iserdes_bitslip_d1 : std_logic;
     signal iserdes_bitslip_d2 : std_logic;
     signal iserdes_bitslip_d3 : std_logic;

     begin

     -- Signal routing
     iserdes_clk     <= clkin;
     iserdes_clk_inv <= not clkin;
     iserdes_clkdiv  <= clkdiv;
     iserdes_rst     <= reset;
     iserdes_d       <= s_data;
     -- iserdes_q is inverted, has MSb in bit 0 (due to differential-pair
     -- routing on ADC16 board, and is in straight offset binary.  Leave MSb
     -- inverted to convert to 2's complement, but invert/restore polarity of
     -- remaining bits and bit-reverse since ADC sends LSb first.
     p_data <=     gearbox_q(0) &
               not gearbox_q(1) &
               not gearbox_q(2) &
               not gearbox_q(3) &
               not gearbox_q(4) &
               not gearbox_q(5) &
               not gearbox_q(6) &
               not gearbox_q(7) &
               not gearbox_q(8) &
               not gearbox_q(9);

     process (clkdiv)
     begin
         if rising_edge(clkdiv) then
             iserdes_bitslip_d1 <= bitslip;
             iserdes_bitslip_d2 <= iserdes_bitslip_d1;
             iserdes_bitslip_d3 <= iserdes_bitslip_d2;
             iserdes_bitslip <= (not iserdes_bitslip_d3 and iserdes_bitslip_d2);
         end if;
     end process;

     -- ISERDESE1 Master
     iserdes_m_inst : ISERDESE3
     GENERIC MAP (
      DATA_WIDTH           => 4, -- Only 4 or 8 are allowed
      FIFO_ENABLE          => FALSE
      )
     PORT MAP (
      Q            => iserdes_q,
      CLK          => iserdes_clk,
      CLK_B        => iserdes_clk_inv,
      CLKDIV       => iserdes_clkdiv,
      RST          => iserdes_rst,
      D            => iserdes_d,
      FIFO_RD_CLK  => '0',
      FIFO_RD_EN   => '0',
      FIFO_EMPTY   => open
      );

      -- Gearbox, because ultrascale doesn't support 10-bit ISERDES
      gearbox_inst : serdes_gearbox
      GENERIC MAP (
        DIN_WIDTH => 4,
        S_TO_P_FACTOR => 5,
        P_TO_S_FACTOR => 2
        )
      PORT MAP (
        fastclock => iserdes_clkdiv,
        slowclock => frame_clk,
        din     => iserdes_q(3 downto 0),
        dout    => gearbox_q,
        bitslip => iserdes_bitslip
      );

      


end ADC_ISERDES_arc;

