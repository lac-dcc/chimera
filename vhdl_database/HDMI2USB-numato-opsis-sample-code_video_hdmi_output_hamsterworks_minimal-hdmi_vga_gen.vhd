----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Generates a test 800x600 signal 
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

   constant h_rez        : natural := 800;
   constant h_sync_start : natural := 800+40;
   constant h_sync_end   : natural := 800+40+128;
   constant h_max        : natural := 1056;
   signal   h_count      : unsigned(11 downto 0) := (others => '0');
   signal   h_offset     : unsigned(7 downto 0) := (others => '0');

   constant v_rez        : natural := 600;
   constant v_sync_start : natural := 600+1;
   constant v_sync_end   : natural := 600+1+4;
   constant v_max        : natural := 628;
   signal   v_count      : unsigned(11 downto 0) := x"250";
   signal   v_offset     : unsigned(7 downto 0) := (others => '0');
   signal clk40 : std_logic;
begin

Inst_clocking: vga_clocking PORT MAP(
		clk50           => clk50,
		pixel_clock     => clk40
	);
   pixel_clock <= clk40;

   
process(clk40)
   begin
      if rising_edge(clk40) then
         if h_count < h_rez and v_count < v_rez then
            red_p   <= std_logic_vector(h_count(7 downto 0)+h_offset);
            green_p <= std_logic_vector(v_count(7 downto 0)+v_offset);
            blue_p  <= std_logic_vector(h_count(7 downto 0)+v_count(7 downto 0));
            blank   <= '0';
            if h_count = 0 or h_count = h_rez-1 then
               red_p   <= (others => '1');
               green_p <= (others => '1');
               blue_p  <= (others => '1');
            end if;
            if v_count = 0 or v_count = v_rez-1 then
               red_p   <= (others => '1');
               green_p <= (others => '1');
               blue_p  <= (others => '1');
            end if;
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
