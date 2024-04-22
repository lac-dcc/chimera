library ieee;
use ieee.std_logic_1164.all;
-- use  IEEE.STD_LOGIC_ARITH.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;



entity vt100 is
  port(
    Reset_n : in std_logic;
    clk     : in std_logic;

    junkBuzzer : out std_logic;

    videoR : out std_logic_vector(3 downto 0);
    videoG : out std_logic_vector(3 downto 0);
    videoB : out std_logic_vector(3 downto 0);
    hSync  : out std_logic;
    vSync  : out std_logic;

    blinkenlight : out std_logic_vector(5 downto 0);

    NMI_n : in std_logic;

    RXD0 : in  std_logic;
    CTS0 : in  std_logic;
    DSR0 : in  std_logic;
    RI0  : in  std_logic;
    DCD0 : in  std_logic;
    TXD0 : out std_logic;
    RTS0 : out std_logic;
    DTR0 : out std_logic;

    ps2Clk  : inout std_logic;
    ps2Data : inout std_logic
    );
end vt100;


architecture struct of vt100 is
  signal pixelClk       : std_logic;
  signal row            : unsigned(9 downto 0);
  signal col            : unsigned(9 downto 0);
  signal display_enable : std_logic;
  signal frame_start    : std_logic;
  signal row_start      : std_logic;

  signal dispram_addr_b   : std_logic_vector(11 downto 0) := "000000000000";
  signal dispram_output_b : std_logic_vector(7 downto 0);

  signal serialClkCount : unsigned(15 downto 0);
  signal cpuClkCount    : unsigned(7 downto 0);
  signal cpuClock       : std_logic;
  signal serialClock    : std_logic;
  signal kbdClock       : std_logic;
  signal kbdClkCount    : unsigned(11 downto 0);

  signal M1_n    : std_logic;
  signal MREQ_n  : std_logic;
  signal IORQ_n  : std_logic;
  signal RD_n    : std_logic;
  signal WR_n    : std_logic;
  signal RFSH_n  : std_logic;
  signal HALT_n  : std_logic;
  signal WAIT_n  : std_logic;
  signal INT_n   : std_logic;
  signal RESET_s : std_logic;
  signal BUSRQ_n : std_logic;
  signal BUSAK_n : std_logic;
  signal A       : std_logic_vector(15 downto 0);
  signal D       : std_logic_vector(7 downto 0);
  signal ROM_D   : std_logic_vector(7 downto 0);
  signal SRAM_D  : std_logic_vector(7 downto 0);
  signal UART0_D : std_logic_vector(7 downto 0);
  signal UART1_D : std_logic_vector(7 downto 0);
  signal CPU_D   : std_logic_vector(7 downto 0);

  signal DISPRAM_D : std_logic_vector(7 downto 0);
  signal BLINKEN_D : std_logic_vector(7 downto 0);


  signal Mirror : std_logic;

  signal IOWR_n      : std_logic;
  signal RAMCS_n     : std_logic;
  signal ROMCS_n     : std_logic;
  signal DISPRAMCS_n : std_logic;

  signal UART0CS_n : std_logic;
  signal UART1CS_n : std_logic;
  signal BLINKCS_n : std_logic;

  signal BaudOut0 : std_logic;
  signal BaudOut1 : std_logic;

  signal PS2NewDataFlag : std_logic;
  signal PS2Character : std_logic_vector(7 downto 0);
  
begin

  pixelClk <= clk;


  Wait_n  <= '1';
  BusRq_n <= '1';
  INT_n   <= '1';

  process (Reset_n, cpuClock)
  begin
    if Reset_n = '0' then
      Reset_s <= '0';
    --Mirror <= '0';
    elsif cpuClock'event and cpuClock = '1' then
      Reset_s <= '1';
    --if IORQ_n = '0' and A(7 downto 4) = "1111" then
    --  Mirror <= D(0);
    --end if;
    end if;
  end process;

  process (Clk)
  begin
    if(rising_edge(Clk)) then

      if cpuClkCount < 20 then
        cpuClkCount <= cpuClkCount + 1;
      else
        cpuClkCount <= (others => '0');
      end if;

      if cpuClkCount < 10 then
        cpuClock <= '1';
      else
        cpuClock <= '0';
      end if;

		-- 1.8432 MHz clock (ish) from 50 MHz
		if (serialClkCount < 271) then
			serialClkCount <= serialClkCount + 1;
		else
			serialClkCount <= (others => '0');
		end if;
		
		if (serialClkCount < 135) then
			serialClock <= '1';
		else
			serialClock <= '0';
		end if;
				
    end if;
  end process;

  -- Memory decoding
  IOWR_n <= WR_n or IORQ_n;

  -- 1K RAM at 8000-83FF
  RAMCS_n     <= '0' when A(15 downto 10) = "100000" and MREQ_n = '0'          else '1';
  -- 4K display ram at F000-FFFF
  DISPRAMCS_n <= '0' when A(15 downto 12) = "1111" and MREQ_n = '0'            else '1';
  -- 4K ROM at anywhere else (but mainly 0000-0fff)
  ROMCS_n     <= '0' when RAMCS_n = '1' and DISPRAMCS_n = '1' and MREQ_n = '0' else '1';

  -- I/O Decoding - port 00-07 and 08-15 are UARTS, port 255 is the blinkenlights
  BLINKCS_n <= '0' when IORQ_n = '0' and A(7 downto 0) = "11111111" else '1';
  UART0CS_n <= '0' when IORQ_n = '0' and A(7 downto 3) = "00000"    else '1';
  UART1CS_n <= '0' when IORQ_n = '0' and A(7 downto 3) = "00001"    else '1';

  -- data bus selection
  CPU_D <=
    SRAM_D    when RAMCS_n = '0' else
    DISPRAM_D when DISPRAMCS_n = '0' else
    UART0_D   when UART0CS_n = '0' else
    UART1_D   when UART1CS_n = '0' else
    BLINKEN_D when BLINKCS_n = '0' else
    ROM_D;

  ps2kbd: entity work.ps2_keyboard
    port map(
		clk => clk,
		ps2_clk => PS2Clk,
		ps2_data => PS2Data,
		ps2_code_new => PS2NewDataFlag,
		ps2_code => PS2Character
	 );

  vgactrl1 : entity work.vga_controller
    port map(
      n_reset     => Reset_n,
      pixelClk    => pixelClk,
      hSync       => hSync,
      vSync       => vSync,
      frame_start => frame_start,
      row_start   => row_start,
      disp_enable => display_enable,
      row         => row,
      column      => col
      );

  vgagfx1 : entity work.vga_textmode
    port map(
      n_reset          => Reset_n,
      pixelClk         => pixelClk,
      row              => std_logic_vector(row),
      column           => std_logic_vector(col),
      disp_enable      => display_enable,
      frame_start      => frame_start,
      row_start        => row_start,
      display_mem_addr => dispram_addr_b,
      display_mem_data => dispram_output_b,
      videoR           => videoR,
      videoG           => videoG,
      videoB           => videoB
      );

  displaymem : entity work.displayram
    port map (
      -- clock_a => cpuClock,
      -- address_a => A(11 downto 0),
      clock_a   => cpuClock,
      address_a => A(11 downto 0),
      q_a       => DISPRAM_D,
      data_a    => D,
      enable_a  => not DISPRAMCS_n,
      wren_a    => not (WR_n or DISPRAMCS_n),

      enable_b  => '1',
      clock_b   => pixelClk,
      address_b => dispram_addr_b,
      q_b       => dispram_output_b,
      data_b    => "00000000"
      );

  cpu0 : entity work.T80s
    generic map(Mode => 1, T2Write => 1, IOWait => 0)
    port map(
      RESET_n => RESET_s,
      CLK_n   => cpuClock,
      WAIT_n  => WAIT_n,
      INT_n   => INT_n,
      NMI_n   => NMI_n,
      BUSRQ_n => BUSRQ_n,
      M1_n    => M1_n,
      MREQ_n  => MREQ_n,
      IORQ_n  => IORQ_n,
      RD_n    => RD_n,
      WR_n    => WR_n,
      RFSH_n  => RFSH_n,
      HALT_n  => HALT_n,
      BUSAK_n => BUSAK_n,
      A       => A,
      DI      => CPU_D,
      DO      => D);

  uart0 : entity work.T16450
    port map(
      MR_n    => Reset_s,
      XIn     => Clk,
      RClk    => BaudOut0,
      CS_n    => UART0CS_n,
      Rd_n    => RD_n,
      Wr_n    => IOWR_n,
      A       => A(2 downto 0),
      D_In    => D,
      D_Out   => UART0_D,
      SIn     => RXD0,
      CTS_n   => CTS0,
      DSR_n   => DSR0,
      RI_n    => RI0,
      DCD_n   => DCD0,
      SOut    => TXD0,
      RTS_n   => RTS0,
      DTR_n   => DTR0,
      OUT1_n  => open,
      OUT2_n  => open,
      BaudOut => BaudOut0,
      Intr    => open);

  rom0 : entity work.bootrom
    port map (
      address => A(11 downto 0),
      clock   => cpuClock,
      q       => ROM_D
      );

  sram0 : entity work.sram
    port map (
      -- missing RAMCS_n
      -- clken => not RAMCS_n,
      address => A(9 downto 0),
      clock   => cpuClock,
      data    => D,
      q       => SRAM_D,
      wren    => not (WR_n or RAMCS_n)
      );

  -- Allow Z80 to update LED states - only 6 of the 8 bits are wired to LEDs though
  process(cpuClkCount, reset_n)
  begin
    if (reset_n = '0') then
      BLINKEN_D <= "00000000";
    elsif (rising_edge(cpuClock)) then
      if BLINKCS_n = '0' and WR_n = '0' then
        BLINKEN_D <= D;
      end if;
    end if;
  end process;


  junkBuzzer <= '1';

  blinkenlight(0) <= not BLINKEN_D(0);
  blinkenlight(1) <= not BLINKEN_D(1);
  blinkenlight(2) <= not BLINKEN_D(2);
  blinkenlight(3) <= not BLINKEN_D(3);
  blinkenlight(4) <= not BLINKEN_D(4);
  blinkenlight(5) <= not BLINKEN_D(5);

end;

