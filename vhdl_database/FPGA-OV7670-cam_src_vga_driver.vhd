----------------------------------------------------------------------------------
-- VGA 640x480@60hz
-- http://tinyvga.com/vga-timing/640x480@60Hz
-- Because of picking the high 13 bits of address, each pixel is read at most 8 times. 
-- this results in a strectched 80 x 60 downscale into 480 x 640.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_driver is
  Port ( 
	 iVGA_CLK	    : in  STD_LOGIC;
	 r	    : out STD_LOGIC_VECTOR(3 downto 0);
	 g	    : out STD_LOGIC_VECTOR(3 downto 0);
	 b	    : out STD_LOGIC_VECTOR(3 downto 0);
	 hs	    : out STD_LOGIC;
	 vs	    : out STD_LOGIC;
	 surv : in std_logic;
	 rgb : in std_logic;
	 debug : in natural;
	 debug2 : in natural;
	 buffer_addr : out STD_LOGIC_VECTOR(12 downto 0);
	 buffer_data : in  STD_LOGIC_VECTOR(15 downto 0);
	 newframe : out std_logic;
	 leftmotion : out natural;
	 rightmotion : out natural
       );
end vga_driver;

architecture Behavioral of vga_driver is

  constant hRes       : natural := 640;
  constant vRes       : natural := 480;

  constant hMax  : natural := 799;
  constant hStartSync : natural := 656;
  constant hEndSync   : natural := 752;

  constant vMax  : natural := 524;
  constant vStartSync : natural := 490;
  constant vEndSync   : natural := 491;

  signal hCount : unsigned(9 downto 0) := (others => '0');
  signal vCount : unsigned(9 downto 0) := (others => '0');
  signal address : unsigned(16 downto 0) := (others => '0');
  signal blank : std_logic := '1';
  signal compare : 	 std_logic := '0';
  signal tempbuff : std_logic := '1';

  signal sumright : natural := 0;
  signal sumleft : natural := 0;
begin
  buffer_addr <= std_logic_vector(address(15 downto 3)); 

  process(iVGA_CLK)
    variable r0    : unsigned (3 downto 0);
    variable g0	    :  unsigned (3 downto 0);
    variable b0	    :  unsigned (3 downto 0); 

  begin

    if rising_edge(iVGA_CLK) then
      if surv = '0' then
	sumleft <= 0;
	sumright <= 0;
	if hCount = hMax then
	  hCount <= (others => '0');
	  if vCount = vMax then
	    vCount <= (others => '0');
	  else
	    vCount <= vCount+1;
	  end if;
	else
	  hCount <= hCount+1;
	end if;

	if blank = '0' then 
	  g  <= buffer_data(11 downto 8);
	  r  <= buffer_data(7 downto 4);
	  b  <= buffer_data(3 downto 0);
	else
	  r  <= (others => '0');
	  g  <= (others => '0');
	  b  <= (others => '0');
	end if;


	if vCount  >= vRes then
	  address <= (others => '0');
	  blank <= '1';
	else	
	  if hCount < hRes then
	    blank <= '0';
	    if hCount = hRes-1 then 
	      if vCount( 2 downto 0 ) /= "111" then
		address <= address - hRes +1; ---debug +debug2; -- I dont know why its 641 (/8 = 81). But it works.
	      else
		address <= address+1;
	      end if;
	    elsif vCount( 1 ) /= '1' then -- Blank every other
	      blank <='1';
	      address <= address+1;
	    else
	      address <= address+1;
	    end if;
	  else
	    blank <= '1';
	  end if;
	end if;

	if hCount >= hStartSync and hCount < hEndSync then
	  hs <= '1';
	else
	  hs <= '0';
	end if;

	if vCount >= vStartSync and vCount < vEndSync then
	  vs <= '1';
	else
	  vs <= '0';
	end if;

      else--	if surv = '1' then
	if hCount = hMax then
	  hCount <= (others => '0');
	  if vCount = vMax then
	    vCount <= (others => '0');
	    sumleft <= 0;
	    sumright <= 0;
	  else
	    vCount <= vCount+1;
	  end if;

	else
	  if hCount = hRes/2 then
	    leftmotion <= sumleft;
	    rightmotion <= sumright;
	  end if;
	  hCount <= hCount+1;
	end if;

	if blank = '0' then 
	    if compare = '0' then
		g0  := unsigned(buffer_data(11 downto 8));
		r0  := unsigned(buffer_data(7 downto 4));
		b0  := unsigned(buffer_data(3 downto 0));
	      g  <= buffer_data(11 downto 8);
	      r  <= buffer_data(7 downto 4);
	      b  <= buffer_data(3 downto 0);
	    else 
              if (abs(to_integer(unsigned(buffer_data(7 downto 4))) - to_integer(r0)) +
	      abs(to_integer(unsigned(buffer_data(11 downto 8))) - to_integer(g0)) +
	      abs(to_integer(unsigned(buffer_data(3 downto 0))) - to_integer(b0))) 
	      > 15+debug-debug then--+ debug - debug2 then
		g <= "1111";

		if hCount < hres/2 then
		  sumleft <= sumleft + 1;
		else
		  sumright <= sumright + 1;
		end if;

	      else
	      g  <= buffer_data(11 downto 8);
	      r  <= buffer_data(7 downto 4);
	      b  <= buffer_data(3 downto 0);
	      end if;

	    end if;
	else
	  r   <= (others => '0');
	  g <= (others => '0');
	  b  <= (others => '0');
	end if;


	if vCount  < vRes/2 then
	  if hCount < hRes then
	    blank <= '0';
	    if hCount = hRes-1 then 
	      if vCount( 2 downto 0 ) /= "111" then
		address <= address - hRes +1; --+1 for address, address 0 read already
	      else
		if compare = '0' then
		  address <= address+19200; -- 2400 * 8.		
		  compare <= '1';
		else
		  address <= address-19198;
		  compare <= '0';
		  tempbuff <= '1';
		end if;
	      end if;
	    elsif vCount( 1 ) /= '1' then 
	      blank <='1';
	      address <= address+1;
	    else --Because this counts up to 640, then it gets subtracted. The compare flag should go in the top if statement
	      address <= address+1;
	    end if;
	  else
	    blank <= '1';
	  end if;
	elsif vCount < vRes then

	  if hCount < hRes then
	    blank <= '0';
	    if hCount = hRes-1 then 
	      if vCount( 2 downto 0 ) /= "111" then
		address <= address - hRes +1; ---debug +debug2; --+1 for address, address 0 read already
	      else
		address <= address+1;
	      end if;
	    elsif vCount( 1 ) /= '1' then -- Blank every other
	      blank <='1';
	      address <= address+1;
	    else
	      address <= address+1;
	    end if;
	  else
	    blank <= '1';
	  end if;
	else
	  address <= (others => '0');
	  blank <= '1';
	end if;

	if hCount >= hStartSync and hCount < hEndSync then
	  hs <= '1';
	else
	  hs <= '0';
	end if;

	if vCount >= vStartSync and vCount < vEndSync then
	  vs <= '1';
	else
	  vs <= '0';
	end if;

      end if; -- end surv
    end if; -- end rising edge
  end process;
end Behavioral;
