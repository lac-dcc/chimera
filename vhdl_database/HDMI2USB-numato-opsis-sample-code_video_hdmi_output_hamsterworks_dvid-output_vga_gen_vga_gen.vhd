----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Generates a test 1280x720 signal 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_gen is
    Port ( clk50           : in  STD_LOGIC;
		     pixel_clock     : out std_logic;

           red_p   : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           green_p : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           blue_p  : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
           blank   : out STD_LOGIC := '0';
           hsync   : out STD_LOGIC := '0';
           vsync   : out STD_LOGIC := '0');
end vga_gen;

architecture Behavioral of vga_gen is
	COMPONENT vga_clocking
	PORT( clk50           : IN  std_logic;          
         pixel_clock     : OUT std_logic);
	END COMPONENT;

   constant h_rez        : natural := 1280;
   constant h_sync_start : natural := 1280+72;
   constant h_sync_end   : natural := 1280+80;
   constant h_max        : natural := 1647;
   signal   h_count      : unsigned(11 downto 0) := (others => '0');
   signal   h_offset     : unsigned(7 downto 0) := (others => '0');

   constant v_rez        : natural := 720;
   constant v_sync_start : natural := 720+3;
   constant v_sync_end   : natural := 720+3+5;
   constant v_max        : natural := 749;
   signal   v_count      : unsigned(11 downto 0) := (others => '0');
   signal   v_offset     : unsigned(7 downto 0) := (others => '0');
   signal clk75 : std_logic;
begin

Inst_clocking: vga_clocking PORT MAP(
		clk50           => clk50,
		pixel_clock     => clk75
	);
   pixel_clock <= clk75;

   
process(clk75)
   begin
      if rising_edge(clk75) then
         if h_count < h_rez and v_count < v_rez then
            red_p   <= std_logic_vector(h_count(7 downto 0)+h_offset);
            green_p <= std_logic_vector(v_count(7 downto 0)+v_offset);
            blue_p  <= std_logic_vector(h_count(7 downto 0)+v_count(7 downto 0));
            blank   <= '0';
         else
            red_p   <= (others => '0');
            green_p <= (others => '0');
            blue_p  <= (others => '0');
            blank   <= '1';
         end if;

         if h_count >= h_sync_start and h_count < h_sync_end then
            hsync <= '1';
         else
            hsync <= '0';
         end if;
         
         if v_count >= v_sync_start and v_count < v_sync_end then
            vsync <= '1';
         else
            vsync <= '0';
         end if;
         
         if h_count = h_max then
            h_count <= (others => '0');
            if v_count = v_max then
               h_offset <= h_offset + 1;
               v_offset <= v_offset + 1;
               v_count <= (others => '0');
            else
               v_count <= v_count+1;
            end if;
         else
            h_count <= h_count+1;
         end if;

      end if;
   end process;

end Behavioral;

