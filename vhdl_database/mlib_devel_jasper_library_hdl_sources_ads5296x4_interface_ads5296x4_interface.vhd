----------------------------------------------------------------------------
-- Import useful libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- entity declaraction
entity  ads5296x4_interface  is
    generic (
               G_NUM_CLOCKS : integer := 4;
               G_NUM_UNITS  : integer := 4 -- Typically 4 or 8
    );
    port (
               -- System
               fabric_clk_o     :  out std_logic;
               fabric_clk_90_o  :  out std_logic;
               fabric_clk_180_o :  out std_logic;
               fabric_clk_270_o :  out std_logic;
               frame_clk_o    :  out std_logic;
               -- route out internal clocks so two
               -- modules can be slaved together
               line_clk_4b_o  :  out std_logic;
               line_clk_10b_o :  out std_logic;
               frame_clk_i    :  in  std_logic;
               line_clk_4b_i  :  in  std_logic;
               line_clk_10b_i :  in  std_logic;
               fabric_clk_i   :  in  std_logic;
               locked         :  out std_logic_vector((G_NUM_UNITS / 4) - 1 downto 0);
               reset          :  in  std_logic;
               sof            :  out std_logic;

               -- ZDOK
               clk_line_p    :  in  std_logic_vector(  G_NUM_CLOCKS-1 downto 0);
               clk_line_n    :  in  std_logic_vector(  G_NUM_CLOCKS-1 downto 0);
               clk_frame_p   :  in  std_logic_vector(  G_NUM_CLOCKS-1 downto 0);
               clk_frame_n   :  in  std_logic_vector(  G_NUM_CLOCKS-1 downto 0);
               ser_a_p       :  in  std_logic_vector(4*G_NUM_UNITS-1 downto 0);
               ser_a_n       :  in  std_logic_vector(4*G_NUM_UNITS-1 downto 0);
               ser_b_p       :  in  std_logic_vector(4*G_NUM_UNITS-1 downto 0);
               ser_b_n       :  in  std_logic_vector(4*G_NUM_UNITS-1 downto 0);

	       -- ISERDES Controller (always 128 bits no matter what G_NUM_UNITS is)
               iserdes_bitslip  :  in  std_logic_vector(127 downto 0);

               -- Parallel outputs
               a1  :  out std_logic_vector(9 downto 0);
               a2  :  out std_logic_vector(9 downto 0);
               a3  :  out std_logic_vector(9 downto 0);
               a4  :  out std_logic_vector(9 downto 0);
               b1  :  out std_logic_vector(9 downto 0);
               b2  :  out std_logic_vector(9 downto 0);
               b3  :  out std_logic_vector(9 downto 0);
               b4  :  out std_logic_vector(9 downto 0);
               c1  :  out std_logic_vector(9 downto 0);
               c2  :  out std_logic_vector(9 downto 0);
               c3  :  out std_logic_vector(9 downto 0);
               c4  :  out std_logic_vector(9 downto 0);
               d1  :  out std_logic_vector(9 downto 0);
               d2  :  out std_logic_vector(9 downto 0);
               d3  :  out std_logic_vector(9 downto 0);
               d4  :  out std_logic_vector(9 downto 0);
               e1  :  out std_logic_vector(9 downto 0);
               e2  :  out std_logic_vector(9 downto 0);
               e3  :  out std_logic_vector(9 downto 0);
               e4  :  out std_logic_vector(9 downto 0);
               f1  :  out std_logic_vector(9 downto 0);
               f2  :  out std_logic_vector(9 downto 0);
               f3  :  out std_logic_vector(9 downto 0);
               f4  :  out std_logic_vector(9 downto 0);
               g1  :  out std_logic_vector(9 downto 0);
               g2  :  out std_logic_vector(9 downto 0);
               g3  :  out std_logic_vector(9 downto 0);
               g4  :  out std_logic_vector(9 downto 0);
               h1  :  out std_logic_vector(9 downto 0);
               h2  :  out std_logic_vector(9 downto 0);
               h3  :  out std_logic_vector(9 downto 0);
               h4  :  out std_logic_vector(9 downto 0);

               -- Delay Controller (always 64 bits, no matter the value of G_NUM_UNITS)
               delay_rst        :  in  std_logic_vector(63 downto 0);
               delay_tap        :  in  std_logic_vector(8 downto 0);

               -- Demux mode bits
               demux_mode       :  in  std_logic_vector(1 downto 0);

               -- Snap Controller
               snap_req         :  in  std_logic;
               snap_we          :  out std_logic;
               snap_addr        :  out std_logic_vector(9 downto 0);

               -- ROACH2 rev and number of ADC boards (for adc16_controller)
               roach2_rev       :  out std_logic_vector(1 downto 0);
               zdok_rev         :  out std_logic_vector(1 downto 0);
               num_units        :  out std_logic_vector(3 downto 0)
    );

end  ads5296x4_interface;

architecture ads5296x4_interface_arc of ads5296x4_interface is

     -- Components

     component adc_unit_10bit_ultrascale port (
               -- System
               fabric_clk    :  in std_logic;
               line_clk      :  in std_logic;
               iserdes_divclk:  in std_logic;
               frame_clk     :  in std_logic;
               reset         :  in  std_logic;

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

               -- Delay Controller
               delay_rst_a      :  in  std_logic_vector(3 downto 0);
               delay_rst_b      :  in  std_logic_vector(3 downto 0);
               delay_tap        :  in  std_logic_vector(8 downto 0)
     );
     end component;

     component ADC_MMCM   port (
               -- System
               reset        :  in  std_logic;
               locked       :  out std_logic;

               -- Clock inputs
               clkin        :  in  std_logic;

               -- Clock outputs
               clkout0p     :  out std_logic;
               clkout0n     :  out std_logic;
               clkout1p     :  out std_logic;
               clkout1n     :  out std_logic;
               clkout2      :  out std_logic;
               clkout2_90   :  out std_logic;
               clkout2_180  :  out std_logic;
               clkout2_270  :  out std_logic;
               clkout3      :  out std_logic
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

     component BUFG  port  (
               O            : out std_logic;
               I            : in  std_logic
     );
     end component;

     -- Attribute declarations

     attribute keep : string;
     attribute s    : string;

     -- Signals

     type  i4_v1  is array (0 to G_NUM_UNITS-1) of std_logic;
     type  i4_v4  is array (0 to G_NUM_UNITS-1) of std_logic_vector(3 downto 0);
     type  i4_v8  is array (0 to G_NUM_UNITS-1) of std_logic_vector(7 downto 0);
     type  i4_v20 is array (0 to G_NUM_UNITS-1) of std_logic_vector(19 downto 0);
     type  i4_v32 is array (0 to G_NUM_UNITS-1) of std_logic_vector(31 downto 0);
     type  i4_v40 is array (0 to G_NUM_UNITS-1) of std_logic_vector(39 downto 0);

     -- Clocking (keep and s attributes retain unused clocks)
     signal line_clk_in       : std_logic_vector(G_NUM_CLOCKS-1 downto 0);
     signal line_clk_in_per_quad  : std_logic_vector((G_NUM_UNITS / 4)-1 downto 0);
     attribute keep of line_clk_in : signal is "true";
     attribute s    of line_clk_in : signal is "yes";

     -- frame_clk_in signals are not used (they exist for termination only)
     signal frame_clk_in : std_logic_vector(G_NUM_CLOCKS-1 downto 0);
     attribute keep of frame_clk_in : signal is "true";
     attribute s    of frame_clk_in : signal is "yes";

     signal line_clk_10b : std_logic;
     signal line_clk_4b  : std_logic;
     signal fabric_clk   : std_logic;
     signal frame_clk    : std_logic;
     signal absel        : std_logic;
     signal absel_enable : std_logic;
     signal locked_0     : std_logic;

     -- MMCM BUFGs
     signal bufg_i : std_logic_vector(6 downto 0);
     signal bufg_o : std_logic_vector(6 downto 0);

     -- ZDOK
     signal s_ser_a_p : i4_v4;
     signal s_ser_a_n : i4_v4;
     signal s_ser_b_p : i4_v4;
     signal s_ser_b_n : i4_v4;

     -- ISERDES Controller
     signal s_iserdes_bitslip : i4_v8;
     signal s_p_data : i4_v32;
     signal s_p_data0 : i4_v32;
     signal s_p10_data : i4_v40;
     signal s_p10_data0 : i4_v40;

     -- Delay Controller
     signal s_delay_rst_a  : i4_v4;
     signal s_delay_rst_b  : i4_v4;
     signal delay_rst0     : std_logic_vector(63 downto 0);
     signal delay_rst1     : std_logic_vector(63 downto 0);
     signal delay_rst2     : std_logic_vector(63 downto 0);
     signal delay_rst_edge : std_logic_vector(63 downto 0);

     -- Snap Controller
     signal s_snap_req : std_logic_vector(1 downto 0);
     signal s_snap_counter: std_logic_vector(10 downto 0);

     begin

     -- Select line clocks for each quad ADC board
     line_clk_gen: for i in 0 to ((G_NUM_UNITS / 4) - 1) generate
         line_clk_in_per_quad(i) <= line_clk_in(0); -- TODO: this hardcodes a single clock
         locked(i) <= locked_0; -- everyone locks off a single MMCM
     end generate;

     adc_mmcm_0 : ADC_MMCM
     PORT MAP (
       reset        => reset,
       locked       => locked_0,
       clkin        => line_clk_in_per_quad(0),
       clkout0p     => bufg_i(0), -- 4-bit clk = clkin / 2 (for after 4-bit SERDES)
       clkout0n     => open,
       clkout1p     => bufg_i(1), -- frame_clk = clkin / 5
       clkout1n     => open,
       clkout2      => bufg_i(2), -- fabric_clk = 2*clkin / 5 (=2*frame clk)
       clkout2_90   => bufg_i(3), -- fabric_clk (90 degrees)
       clkout2_180  => bufg_i(4), -- fabric_clk (180 degrees)
       clkout2_270  => bufg_i(5), -- fabric_clk (270 degrees)
       clkout3      => bufg_i(6)
     );

     -- MMCM BUFGs
     bufg_gen: for i in 0 to 6 generate
       inst : BUFG
       PORT MAP (
         O => bufg_o(i),
         I => bufg_i(i)
       );
     end generate;

     -- IBUFDS for clocks
     ibufds_clk: for i in 0 to G_NUM_CLOCKS-1 generate
       -- ADC line clocks
       line_clk_inst : IBUFDS
       generic map (
         DIFF_TERM  => TRUE,
         IOSTANDARD => "LVDS_25")
       port map (
         I   => clk_line_p(i),
         IB  => clk_line_n(i),
         O   => line_clk_in(i)
       );
     end generate;

     -- Internal routing
     -- route out clocks
     line_clk_4b_o    <= bufg_o(0);
     frame_clk_o      <= bufg_o(1);
     fabric_clk_o     <= bufg_o(2);
     fabric_clk_90_o  <= bufg_o(3);
     fabric_clk_180_o <= bufg_o(4);
     fabric_clk_270_o <= bufg_o(5);
     line_clk_10b_o   <= bufg_o(6);
     -- route in clocks
     line_clk_4b <= line_clk_4b_i;
     line_clk_10b <= line_clk_10b_i;
     fabric_clk <= fabric_clk_i;

     num_units  <= std_logic_vector(to_unsigned(G_NUM_UNITS,  num_units'length));

     -- Parallel data outputs
     a1 <= s_p10_data(0)(39 downto 30);
     a2 <= s_p10_data(0)(29 downto 20);
     a3 <= s_p10_data(0)(19 downto 10);
     a4 <= s_p10_data(0)( 9 downto  0);
     b1 <= s_p10_data(1)(39 downto 30);
     b2 <= s_p10_data(1)(29 downto 20);
     b3 <= s_p10_data(1)(19 downto 10);
     b4 <= s_p10_data(1)( 9 downto  0);
     c1 <= s_p10_data(2)(39 downto 30);
     c2 <= s_p10_data(2)(29 downto 20);
     c3 <= s_p10_data(2)(19 downto 10);
     c4 <= s_p10_data(2)( 9 downto  0);
     d1 <= s_p10_data(3)(39 downto 30);
     d2 <= s_p10_data(3)(29 downto 20);
     d3 <= s_p10_data(3)(19 downto 10);
     d4 <= s_p10_data(3)( 9 downto  0);

     adc1_board: if G_NUM_UNITS > 4 generate
       e1 <= s_p10_data(4)(39 downto 30);
       e2 <= s_p10_data(4)(29 downto 20);
       e3 <= s_p10_data(4)(19 downto 10);
       e4 <= s_p10_data(4)( 9 downto  0);
       f1 <= s_p10_data(5)(39 downto 30);
       f2 <= s_p10_data(5)(29 downto 20);
       f3 <= s_p10_data(5)(19 downto 10);
       f4 <= s_p10_data(5)( 9 downto  0);
       g1 <= s_p10_data(6)(39 downto 30);
       g2 <= s_p10_data(6)(29 downto 20);
       g3 <= s_p10_data(6)(19 downto 10);
       g4 <= s_p10_data(6)( 9 downto  0);
       h1 <= s_p10_data(7)(39 downto 30);
       h2 <= s_p10_data(7)(29 downto 20);
       h3 <= s_p10_data(7)(19 downto 10);
       h4 <= s_p10_data(7)( 9 downto  0);
     end generate;

     adc1_dummy: if G_NUM_UNITS < 5 generate
       e1 <= "0000000000";
       e2 <= "0000000000";
       e3 <= "0000000000";
       e4 <= "0000000000";
       f1 <= "0000000000";
       f2 <= "0000000000";
       f3 <= "0000000000";
       f4 <= "0000000000";
       g1 <= "0000000000";
       g2 <= "0000000000";
       g3 <= "0000000000";
       g4 <= "0000000000";
       h1 <= "0000000000";
       h2 <= "0000000000";
       h3 <= "0000000000";
       h4 <= "0000000000";
       locked(1) <= '0';
     end generate;

     -- Generate adc_unit modules and associated wiring
     ADC: for i in 0 to G_NUM_UNITS-1 generate

       -- ZDOK
       s_ser_a_p(i) <= ser_a_p(4*i+3 downto 4*i);
       s_ser_a_n(i) <= ser_a_n(4*i+3 downto 4*i);
       s_ser_b_p(i) <= ser_b_p(4*i+3 downto 4*i);
       s_ser_b_n(i) <= ser_b_n(4*i+3 downto 4*i);

       -- ISERDES Controller
       s_iserdes_bitslip(i) <= iserdes_bitslip(8*i+7 downto 8*i);

       -- Delay Controller (lower half is for "a"; upper half is for "b")
       s_delay_rst_a(i) <= delay_rst_edge(4*i+3    downto 4*i);
       s_delay_rst_b(i) <= delay_rst_edge(4*i+3+32 downto 4*i+32);

       adc_unit_10_bit_inst: adc_unit_10bit_ultrascale
       port map (
                   fabric_clk => fabric_clk,
                   line_clk   => line_clk_10b,
                   iserdes_divclk => line_clk_4b,
                   frame_clk  => frame_clk,
                   reset      => reset,

                   ser_a_p => s_ser_a_p(i),
                   ser_a_n => s_ser_a_n(i),
                   ser_b_p => s_ser_b_p(i),
                   ser_b_n => s_ser_b_n(i),

                   iserdes_bitslip => s_iserdes_bitslip(i),
                   p_data => s_p10_data0(i),
                   absel => absel,
                   demux_mode => demux_mode,

                   delay_rst_a => s_delay_rst_a(i),
                   delay_rst_b => s_delay_rst_b(i),
                   delay_tap => delay_tap
       );
     end generate; -- for i in...

    process(frame_clk)
    begin
      if rising_edge(frame_clk) then
        -- snap_req shift register - Capture snap_req on rising edge
        -- of frame clock so that A/B will be even/odd consistent.
        s_snap_req <= s_snap_req(0) & snap_req;
      end if;
    end process;

    process(frame_clk, locked_0)
    begin
      -- If MMCM is unlocked, reset absel_enable
      if rising_edge(frame_clk) then
        -- Rising edge of frame_clk enables absel toggling if MMCM locked
        -- to ensure that absel has known phase relation to frame_clk.
        absel_enable <= locked_0;
      end if;
    end process;

    process(fabric_clk, absel_enable, locked_0)
    begin
      if rising_edge(fabric_clk) then
        -- Toggle a/b lane selector
        absel <= (not absel) and absel_enable;
      end if;
    end process;

    process(fabric_clk)
    begin
      if rising_edge(fabric_clk) then
        -- s_p_data pipeline
        s_p_data <= s_p_data0;
        s_p10_data <= s_p10_data0;

        -- delay_rst shift register
        delay_rst2 <= delay_rst1;
        delay_rst1 <= delay_rst0;
        delay_rst0 <= delay_rst;

        -- delay_rst rising edge detector (output must be two cycles wide to
        -- guaranty that it is high when frame clock is high).
        delay_rst_edge <= (not delay_rst2) and (delay_rst1 or delay_rst0);

        -- '0' to '1' transition on snap_req
        sof <= (not s_snap_req(1)) and (s_snap_req(0));
        if s_snap_req(1) = '0' and s_snap_req(0) = '1' then
          -- Reset snap counter
          s_snap_counter <= (others => '0');
        elsif s_snap_counter(10) = '0'  then
          -- Count until MSb is '1'
          s_snap_counter <= s_snap_counter + 1;
        end if;
      end if;
    end process;

    snap_we <= not s_snap_counter(10);
    snap_addr <= s_snap_counter(9 downto 0);

end ads5296x4_interface_arc;
