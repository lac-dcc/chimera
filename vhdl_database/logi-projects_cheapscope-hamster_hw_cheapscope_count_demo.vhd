--clock)
--Connect capture_clk to the clock of the domain you are debugging, and connect probes to the 16 signals you are monitoring:
--
--Connect 'tx' to the RS232 signal to the host
--
--Connect "probes" to whatever you want to watch.
--
--You will then need to add the cheapscope.vhd, capture.vhd and transmitter,vhd to your  design
--
--The last thing to do is to decide what trigger (if any) to use to decide when to send data to the host. Sadly this is a code change inside cheapscope's capture.c - to receive the trigger config from the host is way to much work!
--
----============================
---- Trigger goes here
----============================            
--               if probes(15) = '1' then
--                  state           <= STATE_TRIGGERED;
--               end if;
----============================


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;



library UNISIM;
use UNISIM.VComponents.all;

entity cheapscope_count_demo is
    Port (  OSC_FPGA    : in    STD_LOGIC;
	 			PB 			: in	 STD_LOGIC_VECTOR( 1 downto 0);
				LED        	: out   STD_LOGIC_VECTOR( 1 downto 0);
				--SYS_TX      : out std_logic;
				SYS_RX        : out std_logic
			);
end cheapscope_count_demo;

architecture Behavioral of cheapscope_count_demo is

   COMPONENT cheapscope
      GENERIC( tx_freq :natural);
      PORT(  capture_clk : IN  std_logic;
             tx_clk      : IN  std_logic;
             probes      : IN  std_logic_vector(15 downto 0);          
             serial_tx   : OUT std_logic);
   END COMPONENT;

signal count: std_logic_vector(31 downto 0);
signal reset,trigger: std_logic;

 
begin
 
--CHEAPSCOPE ISTANTIATION-----------------------------------
Inst_cheapscope: cheapscope GENERIC MAP (
   --tx_freq => 100000000 --100Mhz clock
	tx_freq => 50000000 --50Mhz clock
   ) PORT MAP(
      capture_clk => count(0),				--
      --probes      => count(25 downto 10),	--pass the count low 16 bits
		probes      => (trigger & count(14 downto 0)),	--pass the count low 16 bits
      tx_clk      => OSC_FPGA ,
      serial_tx   => SYS_RX
   );
	


	reset <= not PB(0);
	trigger <= not PB(1);

	--count update
	process (OSC_FPGA )
	begin
		if(OSC_FPGA 'event and OSC_FPGA  = '1') then
			if(reset = '1') then
				count <= (others => '0');
			else 
				count <= count +1 ;
			end if;
		end if;
	end process;
	
	led <= count(24 downto 23);

end Behavioral;