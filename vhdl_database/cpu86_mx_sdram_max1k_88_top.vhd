library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity max1k_88_top is
    port(
        USER_BTN     : in    std_logic := '0';
        LED     : out   std_logic_vector(7 downto 0);
		  RsTx : out std_logic;
		  RsRx : in std_logic;
        CLK12M   : in    std_logic := '0';
		SDRAM_ADDR								: out		std_logic_vector(13 downto 0);
		SDRAM_BA									: out		std_logic_vector(1 downto 0);
		SDRAM_CASn								: out		std_logic;
		SDRAM_CKE								: out		std_logic;
		SDRAM_CSn								: out		std_logic;
		SDRAM_DQ									: inout	std_logic_vector(15 downto 0);
		SDRAM_DQM								: out		std_logic_vector(1 downto 0);
		SDRAM_RASn								: out		std_logic;
		SDRAM_WEn								: out		std_logic;
		SDRAM_CLK								: out		std_logic
    );
end entity;

architecture behavioral of max1k_88_top is

COMPONENT NIOS_sdram_controller_0
	PORT
	(
		az_addr		:	 IN STD_LOGIC_VECTOR(21 DOWNTO 0);
		az_be_n		:	 IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		az_cs		:	 IN STD_LOGIC;
		az_data		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		az_rd_n		:	 IN STD_LOGIC;
		az_wr_n		:	 IN STD_LOGIC;
		clk		:	 IN STD_LOGIC;
		reset_n		:	 IN STD_LOGIC;
		za_data		:	 OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		za_valid		:	 OUT STD_LOGIC;
		za_waitrequest		:	 OUT STD_LOGIC;
		zs_addr		:	 OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
		zs_ba		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		zs_cas_n		:	 OUT STD_LOGIC;
		zs_cke		:	 OUT STD_LOGIC;
		zs_cs_n		:	 OUT STD_LOGIC;
		zs_dq		:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		zs_dqm		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		zs_ras_n		:	 OUT STD_LOGIC;
		zs_we_n		:	 OUT STD_LOGIC
	);
END COMPONENT;

signal clk40 : std_logic;
signal dbus_in  : std_logic_vector (7 DOWNTO 0);
signal intr     : std_logic;
signal nmi      : std_logic;
signal por      : std_logic := '1';
signal ipor   : std_logic_vector(7 DOWNTO 0) := (others => '1');
signal abus     : std_logic_vector (19 DOWNTO 0);
   SIGNAL dbus_in_cpu : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_out    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_rom    : std_logic_vector(7 DOWNTO 0);
signal cpuerror : std_logic;
signal inta     : std_logic;
signal iom      : std_logic;
signal rdn      : std_logic;
signal resoutn  : std_logic := '0';
signal wran     : std_logic;
signal wrn      : std_logic;
   SIGNAL wea         : std_logic_VECTOR(0 DOWNTO 0);
   SIGNAL sel_s       : std_logic_vector(5 DOWNTO 0) := "111111";
   signal csromn : std_logic;
   signal csisramn : std_logic;
   signal csesdramn : std_logic;
   SIGNAL dout        : std_logic;
   SIGNAL dout1       : std_logic;

   SIGNAL wrcom       : std_logic;
   signal rxclk_s	  : std_logic;
   SIGNAL DCDn        : std_logic := '1';
   SIGNAL DSRn        : std_logic := '1';
   SIGNAL RIn         : std_logic := '1';
   SIGNAL cscom1      : std_logic;
   SIGNAL dbus_com1   : std_logic_vector(7 DOWNTO 0);
	signal CTS         : std_logic  := '1';
   signal   DTRn     : std_logic;
   signal   IRQ      : std_logic;
   signal   OUT1n    : std_logic;
   signal   OUT2n    : std_logic;
   signal   RTSn     : std_logic;
   signal   stx     : std_logic;


signal za_data : std_logic_vector(15 DOWNTO 0);
signal za_valid : std_logic;
signal za_waitrequest : std_logic;
signal az_addr : std_logic_vector(21 DOWNTO 0);
signal az_be_n : std_logic_vector(1 DOWNTO 0);
signal az_cs : std_logic;
signal az_data : std_logic_vector(15 DOWNTO 0);
signal az_rd_n : std_logic;
signal az_wr_n : std_logic;
signal clk_int80 : std_logic;
signal reset_n : std_logic;
	signal	pll_sys_locked					: std_logic;

begin
--	 clk40 <= CLK12M;
--clk40/baudrate static SDRAM access status :
--1M/960		: 80cyc80=GOOD
--4M/3840	: 20cyc80=GOOD
--5M/4800	: 16cyc80=BAD0	20cyc100=GOOD
--8M/7680	: 10cyc80=BAD1
--10M/9600	: 08cyc80=BAD?	10cyc100=BAD0
pll0: entity work.pll12to40 PORT MAP (
		inclk0	 => CLK12M,
		c0	 => clk40,
		c1	 => clk_int80,
		c2	 => SDRAM_CLK,
		locked	 => pll_sys_locked
	);
--	 led <= dbus_out;
--	 led <= ipor;
	RsTx <= stx;
--	led <= rxclk_s & DTRn & IRQ & OUT1n & OUT2n & RTSn & stx & ipor(0);
	led <= RsRx & DTRn & IRQ & OUT1n & OUT2n & RTSn & stx & ipor(0);

   nmi   <= '0';
   intr  <= '0';
   dout  <= '0';
   dout1 <= '0';
   DCDn  <= '0';
   DSRn  <= '0';
   RIn   <= '0';

	CTS <= '1';
   por <= ipor(0) or not pll_sys_locked;
	process(clk40)
	begin
		if rising_edge(clk40) then
			if USER_BTN='0' then
				ipor <= (others => '1');
			else
				ipor <= '0' & ipor(7 downto 1);
			end if;
		end if;
	end process;
	 
   U_1 : entity work.cpu86
      PORT MAP (
         clk        => clk40,
         dbus_in    => dbus_in_cpu,
         intr       => intr,
         nmi        => nmi,
         por        => por,
         abus       => abus,
         cpuerror   => cpuerror,
         dbus_out   => dbus_out,
         inta       => inta,
         iom        => iom,
         rdn        => rdn,
         resoutn    => resoutn,
         wran       => wran,
         wrn        => wrn
      );
	wea(0) <= not wrn and not csisramn;
	ram0:		ENTITY work.ram PORT map(
		address	=> abus(14 downto 0),
		clock		=> clk40,
		data		=> dbus_out,
		wren		=> wea(0),
		q		   => dbus_in
	);
	wrcom <= wrn or cscom1;
	rom0: entity work.bootstrap    port map(
		abus   => abus(7 downto 0),
		dbus   => dbus_rom
	);
   -- chip_select 
   -- Comport, uart_16550
   -- COM1, 0x3F8-0x3FF
   cscom1 <= '0' when (abus(15 downto 4)=x"03f" AND iom='1') else '1';
   -- internal SRAM
   -- below 0x4000
   csisramn <= '0' when (abus(19 downto 16)=x"0" AND iom='0') else '1';
  -- Bootstrap ROM 256 bytes 
   -- FFFFF-FF=FFF00
   csromn <= '0' when ((abus(19 downto 8)=X"FFF") AND iom='0') else '1';   
   -- external SDRAM as I/O
   -- 0x408-0x40F
--   csesdramn <= '0' when (abus(15 downto 4)=x"040" AND iom='1') else '1';
   -- external SDRAM 256 bytes 
   -- 040FF-FF=04000
--   csesdramn <= '0' when ((abus(19 downto 16)=X"1") AND iom='0') else '1';
   -- external SDRAM as memory
   -- all memory except isram and rom
   csesdramn <= '0' when (csisramn='1' AND csromn='1' AND iom='0') else '1';
   -- dbus_in_cpu multiplexer
--   sel_s <= cscom1 & csromn & csisramn & csspin & csesdramn & csbutled;
   sel_s <= cscom1 & csromn & csisramn & "1" & csesdramn & "1";
--   sel_s <= "1" & csromn & csisramn & "111";
--   process(sel_s,dbus_com1,dbus_in,dbus_rom,dbus_esram,dbus_spi,buttons)
   process(sel_s,dbus_com1,dbus_in,dbus_rom,dbus_in_cpu,za_data)
      begin
         case sel_s is
              when "011111"  => dbus_in_cpu <= dbus_com1;  -- UART     
              when "101111"  => dbus_in_cpu <= dbus_rom;   -- BootStrap Loader  
              when "110111"  => dbus_in_cpu <= dbus_in;    -- Embedded SRAM        
--              when "111011"  => dbus_in_cpu <= dbus_spi;   -- SPI
              when "111101" => dbus_in_cpu <= za_data(7 downto 0);  -- External SDRAM  
--              when "111110" => dbus_in_cpu <= x"0" & buttons;  -- butled
              when others => dbus_in_cpu <= dbus_in_cpu;  -- default : latch
          end case;
   end process;
   U_0 : entity work.uart_top
   PORT MAP (
       BR_clk   => rxclk_s,
       CTSn     => CTS,
       DCDn     => DCDn,
       DSRn     => DSRn,
       RIn      => RIn,
       abus     => abus(2 DOWNTO 0),
       clk      => clk40,
       csn      => cscom1,
       dbus_in  => dbus_out,
       rdn      => rdn,
       resetn   => resoutn,
       sRX      => RsRx,
       wrn      => wrn,
       B_CLK    => rxclk_s,
       DTRn     => DTRn,
       IRQ      => IRQ,
       OUT1n    => OUT1n,
       OUT2n    => OUT2n,
--       RTSn     => RTS,
       RTSn     => RTSn,
       dbus_out => dbus_com1,
       stx      => stx
    );
	reset_n <= resoutn;
	az_addr(21 downto 20) <= (others => '0');
	az_addr(19 downto 0) <= abus(19 downto 0);
	az_be_n <= (others => '0');
	az_data(15 downto 8) <= (others => '0');
	az_data(7 downto 0) <= dbus_out;
	az_cs <= csesdramn;			-- STRANGE! the controller seems to not use az_cs ? only az_rd_n and az_wr_n
	az_rd_n <= rdn or az_cs;
	az_wr_n <= wrn or az_cs;
	sdram0 : NIOS_sdram_controller_0 port map (
		-- inputs:
		az_addr => az_addr,
		az_be_n => az_be_n,
		az_cs => az_cs,
		az_data => az_data,
		az_rd_n => az_rd_n,
		az_wr_n => az_wr_n,
		clk => clk_int80,
		reset_n => reset_n,

		-- outputs:
		za_data => za_data,
		za_valid => za_valid,
		za_waitrequest => za_waitrequest,

		zs_addr => SDRAM_ADDR(11 downto 0),						-- comment this line, if the full address width of 14 bits is required
--		zs_addr	=> SDRAM_ADDR,											-- uncomment this line, if the full address width of 14 bits is required
		zs_ba => SDRAM_BA,
		zs_cas_n => SDRAM_CASn,
		zs_cke => SDRAM_CKE,
		zs_cs_n => SDRAM_CSn,
		zs_dq => SDRAM_DQ,
		zs_dqm => SDRAM_DQM,
		zs_ras_n => SDRAM_RASn,
		zs_we_n => SDRAM_WEn
	);


	SDRAM_ADDR(13) <= '0';																				-- comment this line, if the full address width of 14 bits is required
	SDRAM_ADDR(12) <= '0';																				-- comment this line, if the full address width of 14 bits is required

end architecture;
