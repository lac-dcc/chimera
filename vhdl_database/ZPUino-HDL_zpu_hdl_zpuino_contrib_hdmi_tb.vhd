library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture sim of tb is

  signal clk, rst: std_ulogic := '0';
  constant period: time := 31.25ns;
  signal sysclk, sysclk_shift, pixelclk, tmdsclk_n, tmdsclk_p, pll_locked, clk_x2, rstout: std_ulogic;

  signal dummydata: std_logic_vector(31 downto 0) := (others => '0');
  signal dummyaddress: std_logic_vector(26 downto 2) := (others => '0');

  signal read_data: std_logic_vector(31 downto 0) := (others => '0');
  signal read_address: std_logic_vector(29 downto 2) := (others => '0');
  signal stb,cyc,ack: std_logic;

begin

  clk <= not clk after period/2;

  process begin
    wait for 10 ns;
    rst<='1';
    wait for 50 ns;
    rst<='0';
    wait;
  end process;

  pll: entity work.clkgen
  port map (
    clkin         => clk,
    rstin         => rst,

    sysclk        => sysclk,
    sysclk_shift  => sysclk_shift,
    pixelclk      => pixelclk,
    tmdsclk_p     => tmdsclk_p,
    tmdsclk_n     => tmdsclk_n,
    pll_locked    => pll_locked,
    clk_x2        => clk_x2,
    rstout        => rstout
  );

  hdmi: entity work.hdmi_640_480
  port map (
    wb_clk_i  => sysclk,
	 	wb_rst_i  => rstout,
    wb_dat_o  => open,
    wb_dat_i  => dummydata,
    wb_adr_i  => dummyaddress,
    wb_we_i   => '0',
    wb_cyc_i  => '0',
    wb_stb_i  => '0',
    wb_ack_o  => open,
    id        => open,

    -- Wishbone MASTER interface
    mi_wb_dat_i => read_data,
    mi_wb_dat_o => open,
    mi_wb_adr_o => read_address,
    mi_wb_sel_o => open,
    mi_wb_cti_o => open,
    mi_wb_we_o  => open,
    mi_wb_cyc_o => cyc,
    mi_wb_stb_o => stb,
    mi_wb_ack_i => ack,
    mi_wb_stall_i => '0',

    -- clocking
    CLK_PIX     => pixelclk,
    CLK_P       => tmdsclk_p,
    clk_X2      => clk_x2,
    PLL_LOCKED  => pll_locked,

    -- HDMI signals

    tmds        => open,
    tmdsb       => open
  );

  process(sysclk)
  begin
    if rising_edge(sysclk) then
      if rstout='1' then
        ack<='0';
      else
        if stb='1' and cyc='1' then
          ack<='1';
          read_data<=read_address(9 downto 2) & read_address(9 downto 2)
          & read_address(9 downto 2) & read_address(9 downto 2);
        else
          ack<='0';
        end if;

      end if;
    end if;
  end process;

end sim;


