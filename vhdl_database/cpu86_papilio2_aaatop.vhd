----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:25 02/11/2015 
-- Design Name: 
-- Module Name:    aaatop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

----------------------------------------------------------------------------------
-- LED example, by Jerome Cornet
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
 
library UNISIM;
use UNISIM.vcomponents.all;
 
entity Aaatop is
Port (
	CLK : in  STD_LOGIC;
	txd : inout std_logic;
	rxd : in std_logic;
	
	ARD_RESET : out  STD_LOGIC;
	DUO_SW1 : in  STD_LOGIC;
--	DUO_LED : out std_logic;
			 
	sram_addr : out std_logic_vector(20 downto 0);
	sram_data : inout std_logic_vector(7 downto 0);
	sram_ce : out std_logic;
	sram_we : out std_logic;
	sram_oe : out std_logic;
	
	Arduino : inout  STD_LOGIC_VECTOR (53 downto 0)
);
end Aaatop;

architecture Behavioral of Aaatop is

   signal   CLOCK_40MHZ :     std_logic;
   signal   CTS         :      std_logic  := '1';
   signal   PIN3        :      std_logic;
   signal   LED1        :     std_logic;
   signal   LED2N       :     std_logic;
   signal   LED3N       :     std_logic;
   signal   PIN4        :     std_logic;
   signal   RTS         :     std_logic;

component clk32to40
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic
 );
end component;

   -- Architecture declarations
   signal csromn : std_logic := '1';
   signal csesramn : std_logic;

   -- Internal signal declarations
   SIGNAL DCDn        : std_logic := '1';
   SIGNAL DSRn        : std_logic := '1';
   SIGNAL RIn         : std_logic := '1';
   SIGNAL abus        : std_logic_vector(19 DOWNTO 0);
   SIGNAL cscom1      : std_logic;
   SIGNAL dbus_com1   : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in     : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in_cpu : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_out    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_rom    : std_logic_vector(7 DOWNTO 0) := X"FF";
   SIGNAL dbus_esram  : std_logic_vector(7 DOWNTO 0) := X"EE";
   SIGNAL dout        : std_logic;
   SIGNAL dout1       : std_logic;
   SIGNAL intr        : std_logic;
   SIGNAL iom         : std_logic;
   SIGNAL nmi         : std_logic;
   SIGNAL por         : std_logic;
   SIGNAL rdn         : std_logic;
   SIGNAL resoutn     : std_logic;
   SIGNAL sel_s       : std_logic_vector(2 DOWNTO 0);
   SIGNAL wea         : std_logic_VECTOR(0 DOWNTO 0);
   SIGNAL wran        : std_logic;
   SIGNAL wrcom       : std_logic;
   SIGNAL wrn         : std_logic;
   signal rxclk_s	  : std_logic;

   -- Component Declarations
   COMPONENT cpu86
   PORT( 
      clk      : IN     std_logic;
      dbus_in  : IN     std_logic_vector (7 DOWNTO 0);
      intr     : IN     std_logic;
      nmi      : IN     std_logic;
      por      : IN     std_logic;
      abus     : OUT    std_logic_vector (19 DOWNTO 0);
      dbus_out : OUT    std_logic_vector (7 DOWNTO 0);
      cpuerror : OUT    std_logic;
      inta     : OUT    std_logic;
      iom      : OUT    std_logic;
      rdn      : OUT    std_logic;
      resoutn  : OUT    std_logic;
      wran     : OUT    std_logic;
      wrn      : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT blk_mem_40K
   PORT (
      addra : IN     std_logic_VECTOR (15 DOWNTO 0);
      clka  : IN     std_logic;
      dina  : IN     std_logic_VECTOR (7 DOWNTO 0);
      wea   : IN     std_logic_VECTOR (0 DOWNTO 0);
      douta : OUT    std_logic_VECTOR (7 DOWNTO 0)
   );
   END COMPONENT;
--   COMPONENT bootstrap
--   PORT (
--      abus : IN     std_logic_vector (7 DOWNTO 0);
--      dbus : OUT    std_logic_vector (7 DOWNTO 0)
--   );
--   END COMPONENT;
--   COMPONENT esram
--   PORT (
--      addra : IN     std_logic_VECTOR (7 DOWNTO 0);
--      clka  : IN     std_logic;
--      dina  : IN     std_logic_VECTOR (7 DOWNTO 0);
--      wea   : IN     std_logic_VECTOR (0 DOWNTO 0);
--      douta : OUT    std_logic_VECTOR (7 DOWNTO 0)
--   );
--   END COMPONENT;
   COMPONENT uart_top
   PORT (
      BR_clk   : IN     std_logic ;
      CTSn     : IN     std_logic  := '1';
      DCDn     : IN     std_logic  := '1';
      DSRn     : IN     std_logic  := '1';
      RIn      : IN     std_logic  := '1';
      abus     : IN     std_logic_vector (2 DOWNTO 0);
      clk      : IN     std_logic ;
      csn      : IN     std_logic ;
      dbus_in  : IN     std_logic_vector (7 DOWNTO 0);
      rdn      : IN     std_logic ;
      resetn   : IN     std_logic ;
      sRX      : IN     std_logic ;
      wrn      : IN     std_logic ;
      B_CLK    : OUT    std_logic ;
      DTRn     : OUT    std_logic ;
      IRQ      : OUT    std_logic ;
      OUT1n    : OUT    std_logic ;
      OUT2n    : OUT    std_logic ;
      RTSn     : OUT    std_logic ;
      dbus_out : OUT    std_logic_vector (7 DOWNTO 0);
      stx      : OUT    std_logic 
   );
   END COMPONENT;
begin
  ARD_RESET <= not(DUO_SW1);

	sram_addr <= '0' & abus;

	CTS <= '1';
--	w1b(1) <= 'Z';
--	PIN3 <= not w1b(1); -- por
	PIN3 <= '1';

	dcm0: clk32to40
  port map
   (-- Clock in ports
    CLK_IN1 => clk,
    -- Clock out ports
    CLK_OUT1 => CLOCK_40MHZ);

   -- Architecture concurrent statements
   -- HDL Embedded Text Block 4 mux
   -- dmux 1                        
   
   process(sel_s,dbus_com1,dbus_in,dbus_rom,dbus_esram)
      begin
         case sel_s is
              when "011"  => dbus_in_cpu <= dbus_esram;  -- esram
              when "101"  => dbus_in_cpu <= dbus_com1;  -- UART     
              when "110"  => dbus_in_cpu <= dbus_rom;   -- BootStrap Loader  
              when others=> dbus_in_cpu <= dbus_in;    -- Embedded SRAM        
          end case;         
   end process;
	
	process(csesramn,wrn,rdn,dbus_out,sram_data)
	begin
		sram_ce <= '1';
		sram_we <= '1';
		sram_oe <= '1';
		sram_data <= (others => 'Z');
		if csesramn='0' then
			sram_ce <= '0';
			if wrn='0' then
				sram_data <= dbus_out;
				sram_we <= '0';
			else
				if rdn='0' then
					dbus_esram <= sram_data;
					sram_oe <= '0';
				end if;
			end if;
		end if;
	end process;

   -- HDL Embedded Text Block 7 clogic
   wrcom <= not wrn;      
   wea(0)<= not wrn;
   PIN4  <= resoutn; -- For debug only
   
   -- dbus_in_cpu multiplexer
   sel_s <= csesramn & cscom1 & csromn;
   
   -- chip_select 
   -- Comport, uart_16550
   -- COM1, 0x3F8-0x3FF
   cscom1 <= '0' when (abus(15 downto 3)="0000001111111" AND iom='1') else '1';
   
   -- Bootstrap ROM 256 bytes 
   -- FFFFF-FF=FFF00
--   csromn <= '0' when ((abus(19 downto 8)=X"FFF") AND iom='0') else '1';   

   -- esram 256 bytes 
   -- 0xEEE00
--   csesramn <= '0' when ((abus(19 downto 8)=X"EEE") AND iom='0') else '1';   
   csesramn <= '0' when ((abus(19)='0') AND iom='0') else '1';   

   nmi   <= '0';
   intr  <= '0';
   dout  <= '0';
   dout1 <= '0';
   DCDn  <= '0';
   DSRn  <= '0';
   RIn   <= '0';

   por <= NOT(PIN3);

   -- Instance port mappings.
   U_1 : cpu86
      PORT MAP (
         clk        => CLOCK_40MHZ,
         dbus_in    => dbus_in_cpu,
         intr       => intr,
         nmi        => nmi,
         por        => por,
         abus       => abus,
         cpuerror   => LED1,
         dbus_out   => dbus_out,
         inta       => OPEN,
         iom        => iom,
         rdn        => rdn,
         resoutn    => resoutn,
         wran       => wran,
         wrn        => wrn
      );
   U_3 : blk_mem_40K
      PORT MAP (
         clka  => CLOCK_40MHZ,
         dina  => dbus_out,
         addra => abus(15 DOWNTO 0),
         wea   => wea,
         douta => dbus_in
      );
--   esram0 : esram
--   PORT map (
--      addra => abus(15 downto 0),
--      clka  => CLOCK_40MHZ,
--      dina  => dbus_out,
--      wea   => wea_esram,
--      douta => dbus_in_esram
--   );
--   U_2 : bootstrap
--      PORT MAP (
--         abus => abus(7 DOWNTO 0),
--         dbus => dbus_rom
--      );
   U_0 : uart_top
   PORT MAP (
       BR_clk   => rxclk_s,
       CTSn     => CTS,
       DCDn     => DCDn,
       DSRn     => DSRn,
       RIn      => RIn,
       abus     => abus(2 DOWNTO 0),
       clk      => CLOCK_40MHZ,
       csn      => cscom1,
       dbus_in  => dbus_out,
       rdn      => rdn,
       resetn   => resoutn,
       sRX      => RXD,
       wrn      => wrn,
       B_CLK    => rxclk_s,
       DTRn     => OPEN,
       IRQ      => OPEN,
       OUT1n    => led2n,
       OUT2n    => led3n,
       RTSn     => RTS,
       dbus_out => dbus_com1,
       stx      => TXD
    );

end Behavioral;
