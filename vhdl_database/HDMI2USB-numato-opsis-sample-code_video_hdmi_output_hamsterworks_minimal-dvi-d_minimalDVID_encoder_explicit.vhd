-------------------------------------------------------------------
-- minimalDVID_encoder.vhd : A quick and dirty DVI-D implementation
--
-- Author: Mike Field <hamster@snap.net.nz>
--
-- DVI-D uses TMDS as the 'on the wire' protocol, where each 8-bit
-- value is mapped to one or two 10-bit symbols, depending on how
-- many 1s or 0s have been sent. This makes it a DC balanced protocol,
-- as a correctly implemented stream will have (almost) an equal 
-- number of 1s and 0s. 
--
-- Because of this implementation quite complex. By restricting the 
-- symbols to a subset of eight symbols, all of which having have 
-- five ones (and therefore five zeros) this complexity drops away
-- leaving a simple implementation. Combined with a DDR register to 
-- send the symbols the complexity is kept very low.
--
-------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity MinimalDVID_encoder is
    Port ( clk    : in  STD_LOGIC;
           blank  : in  STD_LOGIC;
           hsync  : in  STD_LOGIC;
           vsync  : in  STD_LOGIC;
           red    : in  STD_LOGIC_VECTOR (2 downto 0);
           green  : in  STD_LOGIC_VECTOR (2 downto 0);
           blue   : in  STD_LOGIC_VECTOR (2 downto 0);
           hdmi_p : out STD_LOGIC_VECTOR (3 downto 0);
           hdmi_n : out STD_LOGIC_VECTOR (3 downto 0));
end MinimalDVID_encoder;

architecture Behavioral of MinimalDVID_encoder is
   -- For holding the outward bound TMDS symbols in the slow and fast domain
   signal c0_symbol, c0_high_speed  : std_logic_vector(9 downto 0) := (others => '0');
   signal c1_symbol, c1_high_speed  : std_logic_vector(9 downto 0) := (others => '0');
   signal c2_symbol, c2_high_speed  : std_logic_vector(9 downto 0) := (others => '0');   
   signal clk_high_speed            : std_logic_vector(9 downto 0) := (others => '0');
   signal c2_output_bits            : std_logic_vector(1 downto 0) := "00";
   signal c1_output_bits            : std_logic_vector(1 downto 0) := "00";
   signal c0_output_bits            : std_logic_vector(1 downto 0) := "00";
   signal clk_output_bits           : std_logic_vector(1 downto 0) := "00";

   -- Controlling the transfers into the high speed domain
   signal latch_high_speed : std_logic_vector(4 downto 0) := "00001";
   
   -- From the DDR outputs to the output buffers
   signal c0_serial, c1_serial, c2_serial, clk_serial : std_logic;

   -- For generating the x5 clocks
   signal clk_x5,  clk_x5_unbuffered  : std_logic;
   signal clk_feedback    : std_logic;

   -- To glue the HSYNC and VSYNC into the control character.
   signal syncs           : std_logic_vector(1 downto 0);

begin
   syncs <= vsync & hsync;

clk_proc: process(clk)
   begin
      if rising_edge(clk) then
         -----------------------------------------------
         -- Channel 0 carries the blue pixels, and also
         -- includes the HSYNC and VSYNCs during
         -- the CTL (blanking) periods.
        -----------------------------------------------
         if blank = '1' then
            case syncs is 
               when "00"   => c0_symbol <= "1101010100";
               when "01"   => c0_symbol <= "0010101011";
               when "10"   => c0_symbol <= "0101010100";
               when others => c0_symbol <= "1010101011";      
            end case;
         else
            case blue is 
               ---  Colour                   TMDS symbol   Value 
               when "000"  => c0_symbol <= "0111110000"; -- 0x10
               when "001"  => c0_symbol <= "0001001111"; -- 0x2F
               when "010"  => c0_symbol <= "0111001100"; -- 0x54
               when "011"  => c0_symbol <= "0010001111"; -- 0x6F
               when "100"  => c0_symbol <= "0000101111"; -- 0x8F
               when "101"  => c0_symbol <= "1000111001"; -- 0xB4
               when "110"  => c0_symbol <= "1000011011"; -- 0xD2
               when others => c0_symbol <= "1011110000"; -- 0xEF
            end case;
         end if;

         -----------------------------------------------
         -- Channel 1 carries the Green pixels
         -----------------------------------------------
         if blank = '1' then
            c1_symbol <= "1101010100";
         else
            case green is 
               when "000"  => c1_symbol <= "0111110000"; -- 0x10
               when "001"  => c1_symbol <= "0001001111"; -- 0x2F
               when "010"  => c1_symbol <= "0111001100"; -- 0x54
               when "011"  => c1_symbol <= "0010001111"; -- 0x6F
               when "100"  => c1_symbol <= "0000101111"; -- 0x8F
               when "101"  => c1_symbol <= "1000111001"; -- 0xB4
               when "110"  => c1_symbol <= "1000011011"; -- 0xD2
               when others => c1_symbol <= "1011110000"; -- 0xEF
            end case;
         end if;

        -----------------------------------------------
         -- Channel 2 carries the Red pixels
         -----------------------------------------------
          if blank = '1' then
            c2_symbol <= "1101010100";
         else
            case red is 
               when "000"  => c2_symbol <= "0111110000"; -- 0x10
               when "001"  => c2_symbol <= "0001001111"; -- 0x2F
               when "010"  => c2_symbol <= "0111001100"; -- 0x54
               when "011"  => c2_symbol <= "0010001111"; -- 0x6F
               when "100"  => c2_symbol <= "0000101111"; -- 0x8F
               when "101"  => c2_symbol <= "1000111001"; -- 0xB4
               when "110"  => c2_symbol <= "1000011011"; -- 0xD2
               when others => c2_symbol <= "1011110000"; -- 0xEF
            end case;
          end if;
       end if;
   end process;

process(clk_x5)
   begin
      ---------------------------------------------------------------
      -- Now take the 10-bit words and take it into the high-speed
      -- clock domain once every five cycles. 
      -- 
      -- Then send out two bits every clock cycle using DDR output
      -- registers.
      ---------------------------------------------------------------   
      if rising_edge(clk_x5) then
         c0_output_bits  <= c0_high_speed(1 downto 0);
         c1_output_bits  <= c1_high_speed(1 downto 0);
         c2_output_bits  <= c2_high_speed(1 downto 0);
         clk_output_bits <= clk_high_speed(1 downto 0);

         if latch_high_speed(0) = '1' then
            c0_high_speed   <= c0_symbol;
            c1_high_speed   <= c1_symbol;
            c2_high_speed   <= c2_symbol;
            clk_high_speed  <= "0000011111";
         else
            c0_high_speed   <= "00" & c0_high_speed(9 downto 2);
            c1_high_speed   <= "00" & c1_high_speed(9 downto 2);
            c2_high_speed   <= "00" & c2_high_speed(9 downto 2);
            clk_high_speed  <= "00" & clk_high_speed(9 downto 2);
         end if;
         latch_high_speed <= latch_high_speed(0) & latch_high_speed(4 downto 1);
      end if;
   end process;

   ------------------------------------------------------------------
   -- Convert the TMDS codes into a serial stream, two bits at a time
   ------------------------------------------------------------------
c0_to_serial: ODDR2
   generic map(DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
   port map (C0 => clk_x5,  C1 => not clk_x5, CE => '1', R => '0', S => '0',
             D0 => C0_output_bits(0), D1 => C0_output_bits(1), Q => c0_serial);
OBUFDS_c0  : OBUFDS port map ( O  => hdmi_p(2), OB => hdmi_n(2), I => c0_serial);

c1_to_serial: ODDR2
   generic map(DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
   port map (C0 => clk_x5,  C1 => not clk_x5, CE => '1', R => '0', S => '0',
             D0 => C1_output_bits(0), D1 => C1_output_bits(1), Q  => c1_serial);
OBUFDS_c1  : OBUFDS port map ( O  => hdmi_p(1), OB => hdmi_n(1), I => c1_serial);
   
c2_to_serial: ODDR2
   generic map(DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
   port map (C0 => clk_x5,  C1 => not clk_x5, CE => '1', R => '0', S => '0',
             D0 => C2_output_bits(0), D1 => C2_output_bits(1), Q  => c2_serial);
OBUFDS_c2  : OBUFDS port map ( O  => hdmi_p(0), OB => hdmi_n(0), I => c2_serial);

clk_to_serial: ODDR2
   generic map(DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC") 
   port map (C0 => clk_x5,  C1 => not clk_x5, CE => '1', R => '0', S => '0',
             D0 => Clk_output_bits(0), D1 => Clk_output_bits(1), Q  => clk_serial);
OBUFDS_clk : OBUFDS port map ( O  => hdmi_p(3), OB => hdmi_n(3), I => clk_serial);
   
   ------------------------------------------------------------------
   -- Use a PLL to generate a x5 clock, which is used to drive 
   -- the DDR registers.This allows 10 bits to be sent for every 
   -- pixel clock
   ------------------------------------------------------------------
PLL_BASE_inst : PLL_BASE
   generic map (
      CLKFBOUT_MULT => 10,                  
      CLKOUT0_DIVIDE => 2,       CLKOUT0_PHASE => 0.0,   -- Output 5x original frequency
      CLK_FEEDBACK => "CLKFBOUT",
      CLKIN_PERIOD => 13.33,
      DIVCLK_DIVIDE => 1
   )
      port map (
      CLKFBOUT => clk_feedback, 
      CLKOUT0  => clk_x5_unbuffered,
      CLKFBIN  => clk_feedback,    
      CLKIN    => clk, 
      RST      => '0'
   );

BUFG_pclkx5  : BUFG port map ( I => clk_x5_unbuffered,  O => clk_x5);

end Behavioral;
