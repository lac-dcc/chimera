----------------------------------------------------------------------------
-- Import useful libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- entity declaraction
entity  adc_unit_10bit_ultrascale  is
    port (
               -- System
               fabric_clk    :  in std_logic;
               line_clk      :  in std_logic;
               frame_clk     :  in std_logic;
               iserdes_divclk:  in std_logic;
               reset         :  in std_logic;

               -- ZDOK
               ser_a_p       :  in  std_logic_vector(3 downto 0);
               ser_a_n       :  in  std_logic_vector(3 downto 0);
               ser_b_p       :  in  std_logic_vector(3 downto 0);
               ser_b_n       :  in  std_logic_vector(3 downto 0);

               -- ISERDES Controller
               iserdes_bitslip  :  in  std_logic_vector(7 downto 0);
               p_data           :  out std_logic_vector(39 downto 0);
               absel            :  in std_logic;
               demux_mode       :  in  std_logic_vector(1 downto 0);

               -- IODELAY Controller
               delay_rst_a      :  in  std_logic_vector(3 downto 0);
               delay_rst_b      :  in  std_logic_vector(3 downto 0);
               delay_tap        :  in  std_logic_vector(8 downto 0)
    );

end  adc_unit_10bit_ultrascale;

architecture adc_unit_arc of adc_unit_10bit_ultrascale is
     -- Components
     component IDELAYE3 generic (
        DELAY_SRC              : string;
        CASCADE                : string; 
        DELAY_TYPE             : string; 
        REFCLK_FREQUENCY       : real;
        DELAY_FORMAT           : string
        );
     port (
         CASC_IN                : in std_logic;
         CASC_RETURN            : in std_logic;
         CASC_OUT               : out std_logic;
         DATAOUT                : out std_logic;
         DATAIN                 : in std_logic;
         CLK                    : in std_logic; 
         CE                     : in std_logic; 
         INC                    : in std_logic; 
         LOAD                   : in std_logic; 
         CNTVALUEIN             : in std_logic_vector(8 downto 0);
         CNTVALUEOUT            : out std_logic_vector(8 downto 0);
         IDATAIN                : in std_logic; 
         RST                    : in std_logic; 
         EN_VTC                 : in std_logic
         );
     end component;


     component ADC_ISERDES_10bit_ultrascale   port (
               -- System
               reset        :  in  std_logic;
               bitslip      :  in  std_logic;

               -- Clock inputs
               clkin        :  in  std_logic; -- line
               clkdiv       :  in  std_logic; -- iserdes output clock (div by 4)
               frame_clk    :  in  std_logic; -- frame/system

               -- Data (serial in, parallel out)
               s_data       :  in  std_logic;
               p_data       :  out std_logic_vector(9 downto 0)
      );
     end component;

     component IBUFDS  generic (
               DIFF_TERM    : boolean;
               IOSTANDARD   : string
     );
     port (
               I            : in  std_logic;
               IB           : in  std_logic;
               O            : out std_logic
     );
     end component;

     -- Signals
     signal adc_iserdes_data_a : std_logic_vector(39 downto 0);
     signal adc_iserdes_data_b : std_logic_vector(39 downto 0);
     signal adc_iserdes_data_a_pipelined : std_logic_vector(39 downto 0);
     signal adc_iserdes_data_b_pipelined : std_logic_vector(39 downto 0);
     signal adc_iserdes_data : std_logic_vector(39 downto 0);

     signal ibuf_ser_a : std_logic_vector(3 downto 0);
     signal ibuf_ser_b : std_logic_vector(3 downto 0);

     signal delay_a_out     : std_logic_vector(3 downto 0);
     signal delay_b_out     : std_logic_vector(3 downto 0);

     begin

     process (frame_clk, adc_iserdes_data_a, adc_iserdes_data_b)
     begin
       -- Pipeline serdes outputs (using slower frame clock)
       if frame_clk'event and frame_clk = '1' then
         adc_iserdes_data_a_pipelined <= adc_iserdes_data_a;
         adc_iserdes_data_b_pipelined <= adc_iserdes_data_b;
       end if;
     end process;

     process (absel, adc_iserdes_data_a_pipelined, adc_iserdes_data_b_pipelined)
     begin
       -- Mux pipelined data based on absel signal
       if absel = '0' then
         case demux_mode is
           when "01" => adc_iserdes_data <= adc_iserdes_data_a_pipelined(39 downto 30)
                                          & adc_iserdes_data_b_pipelined(39 downto 30)
                                          & adc_iserdes_data_a_pipelined(19 downto 10)
                                          & adc_iserdes_data_b_pipelined(19 downto 10);

           when "10" => adc_iserdes_data <= adc_iserdes_data_a_pipelined(39 downto 30)
                                          & adc_iserdes_data_b_pipelined(39 downto 30)
                                          & adc_iserdes_data_a_pipelined(29 downto 20)
                                          & adc_iserdes_data_b_pipelined(29 downto 20);

           when others => adc_iserdes_data <= adc_iserdes_data_a_pipelined;
         end case;
       else
         case demux_mode is
           when "01" => adc_iserdes_data <= adc_iserdes_data_a_pipelined(29 downto 20)
                                          & adc_iserdes_data_b_pipelined(29 downto 20)
                                          & adc_iserdes_data_a_pipelined( 9 downto  0)
                                          & adc_iserdes_data_b_pipelined( 9 downto  0);

           when "10" => adc_iserdes_data <= adc_iserdes_data_a_pipelined(19 downto 10)
                                          & adc_iserdes_data_b_pipelined(19 downto 10)
                                          & adc_iserdes_data_a_pipelined( 9 downto  0)
                                          & adc_iserdes_data_b_pipelined( 9 downto  0);

           when others => adc_iserdes_data <= adc_iserdes_data_b_pipelined;
         end case;
       end if;
     end process;

     process (fabric_clk, adc_iserdes_data)
     begin
       -- Capture mux output on rising edge of fabric clock
       if fabric_clk'event and fabric_clk = '1' then
         p_data <= adc_iserdes_data;
       end if;
     end process;

     -- ISERDES block
     ISERDES_GEN : for i in 0 to 3 generate
     begin
     adc_iserdes_a_inst : ADC_ISERDES_10bit_ultrascale
     PORT MAP (
               reset      => reset,
               bitslip    => iserdes_bitslip(2*i),
               clkin      => line_clk,
               clkdiv     => iserdes_divclk,
               frame_clk  => frame_clk,
               s_data     => delay_a_out(i),
               p_data     => adc_iserdes_data_a(10*(3-i)+9 downto 10*(3-i))
      );

     adc_iserdes_b_inst : ADC_ISERDES_10bit_ultrascale
     PORT MAP (
               reset      => reset,
               bitslip    => iserdes_bitslip(2*i+1),
               clkin      => line_clk,
               clkdiv     => iserdes_divclk,
               frame_clk  => frame_clk,
               s_data     => delay_b_out(i),
               p_data     => adc_iserdes_data_b(10*(3-i)+9 downto 10*(3-i))
      );

     ibufds_ser_a_inst : IBUFDS
     generic map (
               DIFF_TERM  => TRUE,
               IOSTANDARD => "LVDS_25")
     port map (
               I   => ser_a_p(i),
               IB  => ser_a_n(i),
               O   => ibuf_ser_a(i)
     );

     ibufds_ser_b_inst : IBUFDS
     generic map (
               DIFF_TERM  => TRUE,
               IOSTANDARD => "LVDS_25")
     port map (
               I   => ser_b_p(i),
               IB  => ser_b_n(i),
               O   => ibuf_ser_b(i)
      );

     iodelay1_a : IDELAYE3
       generic map (
         DELAY_SRC              => "IDATAIN",        -- DATAIN, IDATAIN
         CASCADE                => "NONE",           -- NONE, MASTER, SLAVE_MIDDLE, SLAVE_END
         DELAY_TYPE             => "VAR_LOAD",       -- FIXED, VARIABLE, or VAR_LOAD
         REFCLK_FREQUENCY       => 200.0,
         DELAY_FORMAT           => "COUNT"           -- TIME, COUNT
         )
       port map (
         CASC_IN                => '0',
         CASC_RETURN            => '0',
         CASC_OUT               => open,
         DATAOUT                => delay_a_out(i),
         DATAIN                 => '0',              -- Data from FPGA logic
         CLK                    => frame_clk,
         CE                     => '0',              -- DELAY_DATA_CE,
         INC                    => '0',              -- DELAY_DATA_INC,
         LOAD                   => delay_rst_a(i),
         CNTVALUEIN             => delay_tap,        -- DELAY_TAP_IN,
         CNTVALUEOUT            => open,             -- DELAY_TAP_OUT,
         IDATAIN                => ibuf_ser_a(i),    -- Driven by IOB
         RST                    => '0',
         EN_VTC                 => '0'
         );

     iodelay1_b : IDELAYE3
       generic map (
         DELAY_SRC              => "IDATAIN",        -- DATAIN, IDATAIN
         CASCADE                => "NONE",           -- NONE, MASTER, SLAVE_MIDDLE, SLAVE_END
         DELAY_TYPE             => "VAR_LOAD",       -- FIXED, VARIABLE, or VAR_LOAD
         REFCLK_FREQUENCY       => 200.0,
         DELAY_FORMAT           => "COUNT"           -- TIME, COUNT
         )
       port map (
         CASC_IN                => '0',
         CASC_RETURN            => '0',
         CASC_OUT               => open,
         DATAOUT                => delay_b_out(i),
         DATAIN                 => '0',              -- Data from FPGA logic
         CLK                    => frame_clk,
         CE                     => '0',              -- DELAY_DATA_CE,
         INC                    => '0',              -- DELAY_DATA_INC,
         LOAD                   => delay_rst_b(i),
         CNTVALUEIN             => delay_tap,        -- DELAY_TAP_IN,
         CNTVALUEOUT            => open,             -- DELAY_TAP_OUT,
         IDATAIN                => ibuf_ser_b(i),    -- Driven by IOB
         RST                    => '0',
         EN_VTC                 => '0'
         );

     end generate ISERDES_GEN;

end adc_unit_arc;

