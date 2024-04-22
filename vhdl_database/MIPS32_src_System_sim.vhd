library ieee;
use ieee.std_logic_1164.all;
use work.Common.all;

entity System_sim is
end System_sim;

architecture Behavioral of System_sim is
  component CPU
    generic (
      debug      : boolean);
    port (
      clk : in std_logic;
      rst : in std_logic;
      start_addr : std_logic_vector (31 downto 0);

      -- Memory
      mem_en        : out std_logic;
      mem_rw        : out RwType;
      mem_length    : out LenType;
      mem_addr      : out std_logic_vector (31 downto 0);
      mem_data_in   : out std_logic_vector (31 downto 0);
      mem_data_out  : in  std_logic_vector (31 downto 0);
      mem_completed : in  std_logic;
      
      -- Interupts
      int_com : in std_logic      
    );
  end component;
  component MemoryVirtual
    generic (
      debug : boolean);
    port (
      clk       : in  std_logic;
      rst       : in  std_logic;
      en        : in  std_logic;
      rw        : in  RwType;
      length    : in  LenType;
      addr      : in  std_logic_vector (31 downto 0);
      data_in   : in  std_logic_vector (31 downto 0);
      data_out  : out std_logic_vector (31 downto 0);
      completed : out std_logic;
      int_com   : out std_logic
    );
  end component;

  signal clk : std_logic;
  signal rst : std_logic;

  -- Memory
  signal mem_en        : std_logic;
  signal mem_rw        : RwType;
  signal mem_length    : LenType;
  signal mem_addr      : std_logic_vector (31 downto 0);
  signal mem_data_in   : std_logic_vector (31 downto 0);
  signal mem_data_out  : std_logic_vector (31 downto 0);
  signal mem_completed : std_logic;
  
  -- Interupts
  signal int_com : std_logic;

  constant clk_period : time := 40 ns;
  
begin
  CPU_1 : CPU
    generic map (
      debug      => true
    )
    port map (
      clk           => clk,
      rst           => rst,
      start_addr    => RAM_START,
      mem_en        => mem_en,
      mem_rw        => mem_rw,
      mem_length    => mem_length,
      mem_addr      => mem_addr,
      mem_data_in   => mem_data_in,
      mem_data_out  => mem_data_out,
      mem_completed => mem_completed,
      int_com       => int_com
    );

  MemoryVirtual_1 : MemoryVirtual
    generic map (
      debug => true)
    port map (
      clk       => clk,
      rst       => rst,
      en        => mem_en,
      rw        => mem_rw,
      length    => mem_length,
      addr      => mem_addr,
      data_in   => mem_data_in,
      data_out  => mem_data_out,
      completed => mem_completed,
      int_com   => int_com
    );

  -- clock generation, print debug messages
  process
  begin
    -- boot up
    rst <= '0', '1' after clk_period;
    clk <= '0';
    wait for 2*clk_period;

    -- tick
    loop
      clk <= '1', '0' after 0.5*clk_period;
      wait for clk_period;
    end loop;
  end process;
  

end Behavioral;
