--------------------------------------------------------------------------------
-- Company: 		 Xilinx
--
-- Create Date:    16:40:22 03/01/07
-- Design Name:    Stopwatch
-- Module Name:    time_cnt - time_cnt_arch
-- Project Name:   ISE In Depth Tutorial
-- Target Devienable:  xc3sA700-4fg484
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity time_cnt is
   port ( ce        : in    std_logic; 
          clk       : in    std_logic; 
          clr       : in    std_logic; 
			 load		  : in    std_logic;
			 up		  : in 	 std_logic;
			 q         : in    std_logic_vector (19 downto 0);
          hundredths : out  std_logic_vector (3 downto 0); 
          tenths    : out   std_logic_vector (3 downto 0);
          sec_lsb   : out   std_logic_vector (3 downto 0); 
          sec_msb   : out   std_logic_vector (3 downto 0); 
          minutes   : out   std_logic_vector (3 downto 0));
end time_cnt;


architecture time_cnt_arch of time_cnt is

  signal hundredths_cnt, tenths_cnt : std_logic_vector (3 downto 0);
  signal ones_cnt, tens_cnt, mins_cnt : std_logic_vector (3 downto 0);
  signal enable, tc_up, tc_down : std_logic;
  signal tc_1, tc_2, tc_3, tc_4, tc_5 : std_logic;
  
begin

 process (up, hundredths_cnt, tenths_cnt, ones_cnt, tens_cnt, mins_cnt)
 begin
	if (up = '1' AND hundredths_cnt = "1001") OR (up = '0' AND hundredths_cnt = "0000") then
		tc_1 <= '1';
	else tc_1 <= '0';
   end if;
		if (up = '1' AND tenths_cnt = "1001") OR (up = '0' AND tenths_cnt = "0000") then
		tc_2 <= '1';
	else tc_2 <= '0';
   end if;
		if (up = '1' AND ones_cnt = "1001") OR (up = '0' AND ones_cnt = "0000") then
		tc_3 <= '1';
	else tc_3 <= '0';
   end if;
		if (up = '1' AND tens_cnt = "0101") OR (up = '0' AND tens_cnt = "0000") then
		tc_4 <= '1';
	else tc_4 <= '0';
   end if;
		if (up = '1' AND mins_cnt = "1001") OR (up = '0' AND mins_cnt = "0000") then
		tc_5 <= '1';
	else tc_5 <= '0';
   end if;
  end process;
 							
  enable <= NOT (tc_1 AND tc_2 AND tc_3 AND tc_4 AND tc_5) AND ce;

  process (clk, clr)  -- hundredths of seconds count
  begin
    if clr = '1' then
      hundredths_cnt <= "0000";
-- change elseif to elsif on the following line
    elsif clk'event and clk = '1' then
		if  load ='1' then
            hundredths_cnt <= q(3 downto 0);
      elsif enable = '1' then
         if (up ='1') then   
            if hundredths_cnt = "1001" then
					hundredths_cnt <= "0000";
				else
					hundredths_cnt <= hundredths_cnt + 1;
				end if;
         else  -- count down
            if hundredths_cnt = "0000" then
					hundredths_cnt <="1001";
				else
					hundredths_cnt <= hundredths_cnt - 1;
				end if;
         end if;
      end if;
    end if;
  end process;

  process (clk, clr)  -- tenths of seconds count
  begin
    if clr = '1' then
      tenths_cnt <= "0000";
    elsif clk'event and clk = '1' then
		if  load ='1' then
            tenths_cnt <= q(7 downto 4);
		elsif (enable = '1') then
			if ((up ='1') AND (hundredths_cnt = "1001")) then   
				if tenths_cnt = "1001" then
					tenths_cnt <= "0000";
				else
					tenths_cnt <= tenths_cnt + 1;
				end if;
			elsif (up ='0') AND (hundredths_cnt = "0000") then
				if tenths_cnt = "0000" then
					tenths_cnt <="1001";
				else
					tenths_cnt <= tenths_cnt - 1;
				end if;
			end if;        
      end if;
    end if;
  end process;

  process (clk, clr)  -- seconds count
  begin
    if clr = '1' then
      ones_cnt <= "0000";
    elsif clk'event and clk = '1' then
		 if  load ='1' then
            ones_cnt <= q(11 downto 8);
       elsif (enable = '1') then
				if ((up ='1') AND (hundredths_cnt = "1001") AND (tenths_cnt = "1001")) then   
               if ones_cnt = "1001" then
						ones_cnt <= "0000";
					else
						ones_cnt <= ones_cnt + 1;
					end if;
            elsif ((up ='0') AND (hundredths_cnt = "0000") AND (tenths_cnt = "0000")) then
               if ones_cnt = "0000" then
						ones_cnt <="1001";
					else
						ones_cnt <= ones_cnt - 1;
					end if;
            end if;
        end if;
    end if;
  end process;

  process (clk, clr)  -- Tens of seconds count
  begin
    if clr = '1' then
      tens_cnt <= "0000";
    elsif clk'event and clk = '1' then
		if  load ='1' then
         tens_cnt <= q(15 downto 12);
      elsif (enable = '1') then
         if ((up ='1') AND (hundredths_cnt = "1001") AND (tenths_cnt = "1001") AND (ones_cnt = "1001")) then   
				if tens_cnt = "0101" then
					tens_cnt <= "0000";
				else
					tens_cnt <= tens_cnt + 1;
				end if;
			 elsif ((up ='0') AND (hundredths_cnt = "0000") AND (tenths_cnt = "0000") AND (ones_cnt = "0000")) then 
				if tens_cnt = "0000" then
					tens_cnt <="0101";
				else
					tens_cnt <= tens_cnt - 1;
				end if;
          end if;
      end if;
    end if;
  end process;

  process (clk, clr)    -- minutes count
  begin
    if clr = '1' then
      mins_cnt <= "0000";
    elsif clk'event and clk = '1' then
	 	if  load ='1' then
            mins_cnt <= q(19 downto 16);
      elsif (enable = '1') then
           if ((up ='1') AND (hundredths_cnt = "1001") AND (tenths_cnt = "1001") AND (tens_cnt = "0101") AND (ones_cnt = "1001")) then   
               if mins_cnt = "1001" then
						mins_cnt <= "0000";
					else
						mins_cnt <= mins_cnt + 1;
					end if;
           elsif ((up ='0') AND (hundredths_cnt = "0000") AND (tenths_cnt = "0000") AND (tens_cnt = "0000") and (ones_cnt = "0000")) then
               if mins_cnt = "0000" then
						mins_cnt <="1001";
				   else
						mins_cnt <= mins_cnt - 1;
				   end if;
           end if;
      end if;
    end if;
  end process;

  hundredths <= hundredths_cnt;
  tenths <= tenths_cnt;
  sec_lsb <= ones_cnt;
  sec_msb <= tens_cnt;
  minutes <= mins_cnt;

end time_cnt_arch;
