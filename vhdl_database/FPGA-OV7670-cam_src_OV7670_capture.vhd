---------------------------------------------------------------------------------
-- Purpose:
--    address , referencing whatever buffer
--    data , from camera to _top to vga
--    write enable, from camera to _top to whatever buffer telling it to start writing
--
-- Uses Default HREF and VREF settings from OV7670. 

--    duty   href_last    hold_data         dout		     we 
--    00        0         xxxxxxxxxxxxxxxx  xxxxxxxxxxxxxxxx  0   
--    01        0         xxxxxxxxRRRRRGGG  xxxxxxxxxxxxxxxx  0
--    10        0->1      RRRRRGGGGGGBBBBB  xxxxxxxxRRRRRGGG  0
--    11        0         GGGBBBBBxxxxxxxx  RRRRRGGGGGGBBBBB  1 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OV7670_capture is
  Port ( pclk  : in   STD_LOGIC;
	 vsync : in   STD_LOGIC;
	 href  : in   STD_LOGIC; 
	 surv : in std_logic;
	 sw5 : in std_logic;
	 sw6 : in std_logic;
	 dport  : in   STD_LOGIC_VECTOR (7 downto 0);
	 addr  : out  STD_LOGIC_VECTOR (12 downto 0);
	 dout  : out  STD_LOGIC_VECTOR (15 downto 0);
	 we    : out  STD_LOGIC;
	 maxx : out natural
       );
end OV7670_capture;

architecture Behavioral of OV7670_capture is
  --In comparison to current href, vync, data.
  --latched means the signal is one cycle late
  --hold means we the signal is two cycles late.
  signal duty         : std_logic_vector(1 downto 0)  := (others => '0');
  signal address      : STD_LOGIC_VECTOR(12 downto 0) := (others => '0');
  signal we_reg       : std_logic := '0';

  signal latched_vsync : STD_LOGIC := '0';
  signal latched_href  : STD_LOGIC := '0';
  signal latched_data  : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
  signal hold_data     : std_logic_vector(15 downto 0) := (others => '0');
  signal hold_href     : std_logic := '0';
  signal holdR	       : std_logic_vector(3 downto 0)  := (others => '0');
  signal holdG	       : std_logic_vector(3 downto 0)  := (others => '0');
  signal holdB	       : std_logic_vector(3 downto 0)  := (others => '0');

  -- signal duty         : std_logic_vector(0 downto 0)  := (others => '0'); -- 2x vert
  -- signal href_last    : std_logic_vector(14 downto 0)  := (others => '0'); -- 1/2x 
  signal href_last     : std_logic_vector(6 downto 0)  := (others => '0'); 
  signal halfaddress   : std_logic := '0';
  signal saveframe     : std_logic := '0';
  signal cnt	       : natural := 0;
  signal max	       : natural := 0;
  signal framecnt      : natural := 0;
  signal framemax      : natural := 0;
begin
  with sw5 select framemax <= 29 when '0', 14 when others;

  addr	<= address;
  we	<= we_reg;
  dout  <= hold_data; 

  process(pclk)
  begin
    maxx <= max;
    -- Process at rising edge
    -- Capture at falling edge

    if falling_edge(pclk) then
      latched_data  <= dport;
      latched_href  <= href;
      latched_vsync <= vsync;
    end if;

    if rising_edge(pclk) then
      if we_reg = '1'  then
	if cnt > max then
	  max <= cnt;
	end if;
	if surv = '1' then
	  -- Can't put this inside vsync? I wonder
	  if saveframe = '0' and cnt = 0 then
	    address  <=  std_logic_vector(to_unsigned(1, address'length));
	    if framecnt = framemax then
	      saveframe <= '1';
	    end if;
	    framecnt <= framecnt + 1;
	  elsif saveframe = '1' and cnt = 0 then
	    address  <= std_logic_vector(to_unsigned(2401, address'length));
	    saveframe <= '0';
	    framecnt <= 0;
	  else
	    address <= std_logic_vector(unsigned(address)+1);
	  end if;
	else
	  address <= std_logic_vector(unsigned(address)+1);
	end if;


	cnt <= cnt + 1;
      end if;



      if hold_href = '0' and latched_href = '1' then
	duty <= std_logic_vector(unsigned(duty)+1);
      end if;

      hold_href <= latched_href; 
      -- capturing the data from the camera, 12-bit RGB
      if latched_href = '1' then
	href_last    <= (others => '0');
	hold_data <= hold_data( 7 downto 0) & latched_data;
      end if;

      we_reg  <= '0';

      -- If a new screen is about to start
      if sw6 = '0' then
	if latched_vsync = '1' then 
	  duty        <= (others => '0');
	  href_last   <= (others => '0');
	  address	    <= (others => '0');
	  cnt	    <= 0;
	else
	  if surv = '1' then 
	    if href_last(href_last'high) = '1' then
	      if duty = "10" then --and address /= 100101100000
		if saveframe = '0' and cnt < 2400 then
		  we_reg <= '1';
		elsif saveframe = '1' and cnt < 2401 then
		  we_reg <= '1';
		else
		  we_reg <= '0';
		end if;
	      end if;
	      href_last <= (others => '0');
	    else
	      href_last <= href_last(href_last'high-1 downto 0) & latched_href;
	    end if;
	  else
	    if href_last(href_last'high) = '1' then
	      if duty = "10" then
		we_reg <= '1';
	      end if;
	      href_last <= (others => '0');
	    else
	      href_last <= href_last(href_last'high-1 downto 0) & latched_href;
	    end if;
	  end if;
	end if;
      end if;
    end if;
  end process;
end Behavioral;
