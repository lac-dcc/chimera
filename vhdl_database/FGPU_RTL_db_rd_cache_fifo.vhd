-- libraries --------------------------------------------------------------------------------------------{{{
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity rd_cache_fifo is -- {{{
  -- cu_mem_cntrl <- port A (myram) port B -> cache
generic(
  SIZEA       : integer := 1024;
  ADDRWIDTHA  : integer := 10;
  SIZEB       : integer := 256;
  ADDRWIDTHB  : integer := 8
);
port(
  clk                     : in  std_logic;
  push                    : in  std_logic;
  cache_rdData            : in  std_logic_vector(DATA_W*CACHE_N_BANKS - 1 downto 0);
  cache_rdAddr            : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
  rdData                  : out std_logic_vector(DATA_W*RD_CACHE_N_WORDS - 1 downto 0);
  rdAddr                  : out unsigned(GMEM_WORD_ADDR_W-RD_CACHE_N_WORDS_W-1 downto 0);
  nempty                  : out std_logic;
  nrst                    : in std_logic
);
end entity; -- }}}

architecture behavioral of rd_cache_fifo is
  function log2(val : INTEGER) return natural is -- {{{
    variable res : natural;
  begin
    for i in 0 to 31 loop
      if (val <= (2 ** i)) then
        res := i;
        exit;
      end if;
    end loop;
    return res;
  end function Log2; -- }}}

  -- signals {{{
  constant minWIDTH : integer := DATA_W*RD_CACHE_N_WORDS;
  constant maxSIZE  : integer := SIZEA;
  constant RATIO    : integer := CACHE_N_BANKS*DATA_W/minWIDTH;

  -- An asymmetric RAM is modeled in a similar way as a symmetric RAM, with an
  -- array of array object. Its aspect ratio corresponds to the port with the
  -- lower data width (larger depth)
  type ramType is array (natural range <>) of std_logic_vector(minWIDTH - 1 downto 0);
  -- cu_mem_cntrl <- port A (myram) port B -> cache
  signal data_fifo                        : ramType(0 to maxSIZE-1) := (others => (others => '0'));
  type addr_fifo_type is array(natural range <>) of unsigned(GMEM_WORD_ADDR_W-RD_CACHE_N_WORDS_W-1 downto 0);
  signal addr_fifo                        : addr_fifo_type(0 to maxSIZE-1) := (others => (others => '0'));

  signal data_fifo_rdData_n               : std_logic_vector(DATA_W*RD_CACHE_N_WORDS-1 downto 0);
  signal data_fifo_rdData                 : std_logic_vector(DATA_W*RD_CACHE_N_WORDS-1 downto 0);
  signal addr_fifo_rdData_n               : unsigned(GMEM_WORD_ADDR_W-RD_CACHE_N_WORDS_W-1 downto 0);
  signal addr_fifo_rdData                 : unsigned(GMEM_WORD_ADDR_W-RD_CACHE_N_WORDS_W-1 downto 0);
  signal addrA                            : unsigned(ADDRWIDTHA - 1 downto 0);
  signal addrB                            : unsigned(ADDRWIDTHB - 1 downto 0);
  signal enB, enA                         : std_logic;
  signal nempty_p0                        : std_logic;
  -- }}}
begin
  enB <= '1';
  enA <= '1';

  -- addr fifo -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        addr_fifo_rdData_n <= (others => '0'); -- NOT NEEDED
        addr_fifo_rdData   <= (others => '0'); -- NOT NEEDED
      else
        if enA = '1' then
          addr_fifo_rdData_n <= addr_fifo(to_integer(addrA));
        end if;
        addr_fifo_rdData <= addr_fifo_rdData_n;
      end if;
    end if;
  end process;

  rdAddr <= addr_fifo_rdData;

  process(clk)
  begin
    if rising_edge(clk) then
      for i in 0 to RATIO - 1 loop
        if enB = '1' then
          if push = '1' then
            addr_fifo(to_integer(addrB & to_unsigned(i, log2(RATIO)))) <= cache_rdAddr & to_unsigned(i, log2(RATIO));
          end if;
        end if;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- data fifo -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        data_fifo_rdData_n <= (others => '0'); -- NOT NEEDED
        data_fifo_rdData   <= (others => '0'); -- NOT NEEDED
      else
        if enA = '1' then
          data_fifo_rdData_n <= data_fifo(to_integer(addrA));
        end if;
        data_fifo_rdData <= data_fifo_rdData_n;
      end if;
    end if;
  end process;
  rdData <= data_fifo_rdData;

  process(clk)
  begin
    if rising_edge(clk) then
      for i in 0 to RATIO - 1 loop
        if enB = '1' then
          if push = '1' then
            data_fifo(to_integer(addrB & to_unsigned(i, log2(RATIO)))) <= cache_rdData((i + 1) * minWIDTH - 1 downto i * minWIDTH);
          end if;
        end if;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        addrB <= (others => '0');
        addrA <= (others => '0');

        nempty_p0 <= '0'; -- NOT NEEDED
        nempty    <= '0'; -- NOT NEEDED
      else
        if enB = '1' and push = '1' then
          addrB <= addrB + 1;
        end if;

        if addrA(addrA'high downto addrA'high-ADDRWIDTHB+1) /= addrB then
          addrA <= addrA + 1;
        end if;

        if addrA(addrA'high downto addrA'high-ADDRWIDTHB+1) /= addrB then
          nempty_p0 <= '1';
        else
          nempty_p0 <= '0';
        end if;
        nempty <= nempty_p0;
      end if;
    end if;
  end process;

end architecture;
