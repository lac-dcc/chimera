library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Common.all;

entity System is
  port (
    -- Input --
    clk0:         in      std_logic;
    clk1:         in      std_logic;
    clk_key:      in      std_logic;
    rst:          in      std_logic;
    switch:       in      std_logic_vector (15 downto 0);
    key:          in      std_logic_vector (3 downto 0);
    
    -- Output --
    led:          out     std_logic_vector (15 downto 0);
    seg7_l:       out     std_logic_vector (6 downto 0);
    seg7_r:       out     std_logic_vector (6 downto 0);
    
    -- RAM --
    ram1_en:      out     std_logic;
    ram1_oe:      out     std_logic;
    ram1_rw:      out     std_logic;
    ram1_data:    inout   std_logic_vector (15 downto 0);
    ram1_addr:    out     std_logic_vector (17 downto 0);
    ram2_en:      out     std_logic;
    ram2_oe:      out     std_logic;
    ram2_rw:      out     std_logic;
    ram2_data:    inout   std_logic_vector (15 downto 0);
    ram2_addr:    out     std_logic_vector (17 downto 0);
    
    -- COM --
    com_ready:    in      std_logic;
    com_rdn:      out     std_logic;
    com_wrn:      out     std_logic;
    com_tbre:     in      std_logic;
    com_tsre:     in      std_logic;
    
    -- Flash --
    flash_byte:   out     std_logic;
    flash_vpen:   out     std_logic;
    flash_ce:     out     std_logic;
    flash_oe:     out     std_logic;
    flash_we:     out     std_logic;
    flash_rp:     out     std_logic;
    flash_data:   inout   std_logic_vector (15 downto 0);
    flash_addr:   out     std_logic_vector (22 downto 0)
    );
end System;

architecture Behavioral of System is
  component Seg7 is
    port (
      digit:      in    std_logic_vector (3 downto 0);
      led_out:    out   std_logic_vector (6 downto 0)
    );
  end component;
  
  component Rom1
    port (
      clka: in std_logic;
      addra: in Int10;
      douta: out Int32
    );
  end component;
  
  signal clk: std_logic;
  signal temp: Int32;
  signal seg7_l_num, seg7_r_num: Int4;
  
begin
  clk <= clk_key;
  ram1_en <= '1';
  ram1_oe <= '1';
  ram1_rw <= '1';
  ram1_addr <= Int16_Zero & "00";
  ram2_en <= '1';
  ram2_oe <= '1';
  ram2_rw <= '1';
  ram2_addr <= Int16_Zero & "00";
  com_rdn <= '1';
  com_wrn <= '1';
  flash_byte <= '1';
  flash_vpen <= '1';
  flash_ce <= '1';
  flash_oe <= '1';
  flash_we <= '1';
  flash_rp <= '1';
  flash_addr <= Int16_Zero & "0000000";

  
  seg7_left: Seg7 port map (
    seg7_l_num,
    seg7_l
  );
  seg7_right: Seg7 port map (
    seg7_r_num,
    seg7_r
  );

  rom_instance: Rom1 port map (
    clka => clk,
    addra => "0000000010",
    douta => temp
  );
  
  led <= temp(15 downto 0);
  seg7_l_num <= temp(7 downto 4);
  seg7_r_num <= temp(3 downto 0);
end Behavioral;
