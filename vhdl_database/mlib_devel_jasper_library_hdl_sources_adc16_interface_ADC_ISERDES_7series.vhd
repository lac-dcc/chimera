----------------------------------------------------------------------------
-- Import useful libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- entity declaraction
entity  ADC_ISERDES_7series  is
    generic (
               ADC_RESOLUTION     : integer  := 8
    );
    port (
               -- System
               reset        :  in  std_logic;
               bitslip      :  in  std_logic;

               -- Clock inputs
               clkin        :  in  std_logic; -- line clock or bit clock
               clkdiv       :  in  std_logic; -- fabric_clk or frame_clk_2x
               frame_clk    :  in  std_logic; -- frame_clk

               -- Data (serial in, parallel out)
               s_data        :  in  std_logic;
               p_data        :  out std_logic_vector(ADC_RESOLUTION-1 downto 0)
    );

end  ADC_ISERDES_7series;

architecture ADC_ISERDES_arc of ADC_ISERDES_7series is

     -- Components

     component ISERDESE2 generic (
      DATA_RATE            : string;
      DATA_WIDTH           : integer;
      DYN_CLKDIV_INV_EN    : boolean;
      DYN_CLK_INV_EN       : boolean;
      INTERFACE_TYPE       : string;
      IOBDELAY             : string;
      NUM_CE               : integer;
      OFB_USED             : boolean;
      SERDES_MODE          : string
      );
     port (
      O            : out std_logic;
      Q1           : out std_logic;
      Q2           : out std_logic;
      Q3           : out std_logic;
      Q4           : out std_logic;
      Q5           : out std_logic;
      Q6           : out std_logic;
      Q7           : out std_logic;
      Q8           : out std_logic;
      SHIFTOUT1    : out std_logic;
      SHIFTOUT2    : out std_logic;
      BITSLIP      : in std_logic;
      CE1          : in std_logic;
      CLK          : in std_logic;
      CLKB         : in std_logic;
      OCLK         : in std_logic;
      OCLKB        : in std_logic;
      CLKDIVP      : in std_logic;
      CLKDIV       : in std_logic;
      DYNCLKSEL    : in std_logic;
      DYNCLKDIVSEL : in std_logic;
      SHIFTIN1     : in std_logic;
      SHIFTIN2     : in std_logic;
      RST          : in std_logic;
      D            : in std_logic;
      DDLY         : in std_logic;
      OFB          : in std_logic
      );
     end component;

     -- ISERDES Master
     signal iserdes_q         : std_logic_vector(7 downto 0);
     signal iserdes_d         : std_logic;
     signal iserdes_clk       : std_logic;
     signal iserdes_clk_inv   : std_logic;
     signal iserdes_rst       : std_logic;
     signal iserdes_clkdiv    : std_logic;
     signal iserdes_bitslip   : std_logic;

     signal iserdes_bitslip_d1 : std_logic;
     signal iserdes_bitslip_d2 : std_logic;
     signal iserdes_bitslip_d3 : std_logic;

     signal bitslip_swap       : std_logic_vector( 1 downto 0);
--     signal bitslip_swap       : std_logic;
     signal bitslip_count      : std_logic_vector( 3 downto 0);
     signal bitslip_delay      : std_logic_vector( 3 downto 0);
--     signal q_d0               : std_logic_vector( 7 downto 0);
     signal q_d0               : std_logic_vector(15 downto 0);
     signal q_d1               : std_logic_vector(15 downto 0);

     attribute mark_debug    : string;

     begin

     -- Signal routing
     iserdes_clk     <= clkin;
     iserdes_clk_inv <= not clkin;
     iserdes_clkdiv  <= clkdiv;
     iserdes_rst     <= reset;
     iserdes_d       <= s_data;

        ISERDES_BITSLIP_PROCESS: process ( clkdiv, reset, bitslip_delay )
        begin
                if reset = '1' then
                        bitslip_delay <= "0000";
                elsif rising_edge(clkdiv) then
                        bitslip_delay(3 downto 1) <= bitslip_delay(2 downto 0);
                        bitslip_delay(0) <= bitslip;
                end if;

                -- Reference Xilinx UG471, the last paragraph of page 159:
                -- Bitslip cannot be asserted for two consecutive CLKDIV cycles.
                -- Bitslip must be deasserted for at least one CLKDIV cycle
                -- between two bitslip assertions.
                if bitslip_delay = "0001" then
                        iserdes_bitslip <= '1';
                else
                        iserdes_bitslip <= '0';
                end if;

                -- Swap the two halves of the output of this module when ADC_RESOLUTON/2 bitslips
                -- happen
                if reset = '1' then
                        bitslip_count <= (others => '0');
                        bitslip_swap <= (others => '0');
                elsif rising_edge(clkdiv) then
                        if bitslip_count < ADC_RESOLUTION/2 then
                                bitslip_count <= bitslip_count + iserdes_bitslip;
                        else
                                bitslip_count <= (others => '0');
                                bitslip_swap <= bitslip_swap + 1;
                        end if;
                end if;
        end process;

        ISERDES_OUTPUT_PROCESS: process ( clkdiv, reset, bitslip_swap, q_d1 )
--        ISERDES_OUTPUT_PROCESS: process ( clkdiv, reset )
        begin
                if reset = '1' then
                        q_d0 <= (others => '0');
                        q_d1 <= (others => '0');
                elsif rising_edge(clkdiv) then
                        -- Example 1 of receiving 0x5e, 0x5f and 0x60
                        -- frame_clk    0>1 1>0 0>1 1>0 0>1 1>0
                        -- q_d0         e       f       0
                        -- q_d1             5       5       6
                        -- p_data           5e      5f      60

                        -- Example 2 of receiving 0x5e, 0x5f and 0x60
                        -- frame_clk    0>1 1>0 0>1 1>0 0>1 1>0
                        -- q_d0             5       5       6    
                        -- q_d1         e       f       0    
                        -- p_data           5e      5f      60
          
                        if frame_clk = '0' then
                            q_d0( 7 downto 0) <=    iserdes_q(0) &
                                                    iserdes_q(1) &
                                                    iserdes_q(2) &
                                                    iserdes_q(3) &
                                                    iserdes_q(4) &
                                                    iserdes_q(5) &
                                                    iserdes_q(6) &
                                                    iserdes_q(7);
                        else
                            q_d0(15 downto 8) <=    iserdes_q(0) &
                                                    iserdes_q(1) &
                                                    iserdes_q(2) &
                                                    iserdes_q(3) &
                                                    iserdes_q(4) &
                                                    iserdes_q(5) &
                                                    iserdes_q(6) &
                                                    iserdes_q(7);
                        end if;

                        if frame_clk='0' and bitslip_swap(1)='0' then
                            q_d1( 7 downto 0) <= q_d0( 7 downto 0); 
                            q_d1(15 downto 8) <= q_d0(15 downto 8);
                        elsif frame_clk='1' and bitslip_swap(1)='1' then
                            q_d1( 7 downto 0) <= q_d0(15 downto 8);
                            q_d1(15 downto 8) <= q_d0( 7 downto 0);
                        else
                            q_d1 <= q_d1;
                        end if; 
                end if;

                if bitslip_swap(0) = '0' then
                    p_data <=   q_d1(15 downto 16-ADC_RESOLUTION/2) &
                                q_d1( 7 downto  8-ADC_RESOLUTION/2);
                else
                    p_data <=   q_d1( 7 downto  8-ADC_RESOLUTION/2) &
                                q_d1(15 downto 16-ADC_RESOLUTION/2);

                end if;

        end process;



     -- ISERDESE1 Master
     iserdes_m_inst : ISERDESE2
     GENERIC MAP (
      DATA_RATE            => "DDR",
--      DATA_WIDTH              => 8,
      DATA_WIDTH              => ADC_RESOLUTION/2,
      DYN_CLKDIV_INV_EN    => false,
      DYN_CLK_INV_EN       => false,
      INTERFACE_TYPE       => "NETWORKING",
      IOBDELAY             => "IFD",
      NUM_CE               => 1,
      OFB_USED             => false,
      SERDES_MODE          => "MASTER"
      )
     PORT MAP (
      O            => open,
      Q1           => iserdes_q(0),
      Q2           => iserdes_q(1),
      Q3           => iserdes_q(2),
      Q4           => iserdes_q(3),
      Q5           => iserdes_q(4),
      Q6           => iserdes_q(5),
      Q7           => iserdes_q(6),
      Q8           => iserdes_q(7),
      SHIFTOUT1    => open,
      SHIFTOUT2    => open,
      BITSLIP      => iserdes_bitslip,
      CE1          => '1',
      --CE2          => '0', --Useless if NUM_CE = 1
      CLK          => iserdes_clk,
      CLKB         => iserdes_clk_inv,
      OCLK         => '0',
      OCLKB        => '0',
      CLKDIV       => iserdes_clkdiv,
      CLKDIVP      => '0',
      RST          => iserdes_rst,
      D            => '0',
      DDLY         => iserdes_d,
      DYNCLKDIVSEL => '0',
      DYNCLKSEL    => '0',
      OFB          => '0',
      SHIFTIN1     => '0',
      SHIFTIN2     => '0'
      );

end ADC_ISERDES_arc;

