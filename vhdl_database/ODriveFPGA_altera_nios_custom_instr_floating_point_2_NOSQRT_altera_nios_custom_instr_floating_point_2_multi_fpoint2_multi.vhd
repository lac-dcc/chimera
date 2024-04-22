-- (C) 2001-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity fpoint2_multi is 
	port (
        clk	: in std_logic; -- clock for custon instruction
        clk_en	: in std_logic; -- clock enable for custom instruction 
        reset	: in std_logic; -- reset registers in custom instruction
        reset_req	: in std_logic; -- reset req for RAMs
        dataa  	: in std_logic_vector(31 downto 0); -- src1 operand
        datab  	: in std_logic_vector(31 downto 0); -- src2 operand
        result 	: out std_logic_vector(31 downto 0); -- result of the operation
        n      	: in std_logic_vector(2 downto 0); -- custom instruction operation 
        start   : in std_logic; -- custom instruction starts, driven to '1' for one cycle
        done    : out std_logic -- custom instruction finishes, driven to '1' for one cycle
        );                                                                   
end;

architecture fpmulti of fpoint2_multi is
 
-- components declaration
component fpoint2_multi_datapath 
  port (
    clk      : in std_logic;
    clk_en   : in std_logic;
    reset    : in std_logic;
    reset_req: in std_logic;
    start    : in std_logic;
    dataa    : in std_logic_vector(31 downto 0);
    datab    : in std_logic_vector(31 downto 0);
    result   : out std_logic_vector(31 downto 0);
    op       : in std_logic_vector(2 downto 0)
    ); 
end component;

-- Constant signals
  -- minus one latency for counter register latching
  constant FDIVS_LAT      : std_logic_vector:= b"1101"; -- divide            latency = 14-1  
  constant FSUBS_LAT      : std_logic_vector:= b"0010"; -- substract         latency = 3-1 
  constant FADDS_LAT      : std_logic_vector:= b"0010"; -- add               latency = 3-1 
  constant FMULS_LAT      : std_logic_vector:= b"0001"; -- multiply          latency = 2-1
  constant FSQRTS_LAT     : std_logic_vector:= b"0101"; -- sqrt              latency = 6-1      
  constant FLOATIS_LAT    : std_logic_vector:= b"0001"; -- int to float      latency = 2-1

-- internal signals
  signal counter       : std_logic_vector(3 downto 0); 
  signal counter_in    : std_logic_vector(3 downto 0); 
  signal load_data     : std_logic_vector(3 downto 0);    
  signal busy          : std_logic;

begin
    
  process(clk,reset)begin
    if(reset = '1')then
      busy <= '0'; 
    elsif(clk'event and clk='1')then
        if(start = '1')then 
          busy <= '1';
        elsif(counter = b"0000")then 
          busy <= '0';
        end if;
    end if;
  end process;  
  
  process(clk,reset)begin
    if(reset = '1')then
      counter <= b"1111"; 
    elsif(clk'event and clk='1')then
        if(clk_en = '1')then 
            if(start = '1')then
              counter <= load_data; 
            else
              counter <= counter - 1;   
            end if;
        end if;
    end if;
  end process;
                                                                    
  process(n)begin                                    
    case n is
      when "010"  => load_data <= FLOATIS_LAT;           
      when "011"  => load_data <= FSQRTS_LAT;   
      when "100"  => load_data <= FMULS_LAT;						  	       
      when "110"  => load_data <= FSUBS_LAT;    
      when "111"  => load_data <= FDIVS_LAT;
      when others => load_data <= FADDS_LAT;
    end case;                                                     
  end process;
  
  -- Assert done when counter reaches 0 except for fixsi and round
  -- operations which need to assert done immediately (conbinatorially).
  done <= '1' when ((counter = b"0000" and busy = '1') or 
    (start = '1' and (n = "000" or n = "001"))) else '0';
  
  datapath : fpoint2_multi_datapath 
  port map (                                       
    clk      => clk	 ,
    clk_en   => clk_en   ,
    reset    => reset	 ,
    reset_req=> reset_req,
    start    => start	 ,
    dataa    => dataa	 ,
    datab    => datab	 ,
    result   => result	 ,
    op       => n	
  );

end architecture fpmulti;








