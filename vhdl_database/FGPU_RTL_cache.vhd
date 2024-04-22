-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity cache is -- {{{
port(
  -- port a
  wea                 : in std_logic_vector(CACHE_N_BANKS*DATA_W/8-1 downto 0);
  ena                 : in std_logic;
  addra               : in unsigned(M+L-1 downto 0);
  dia                 : in std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
  doa                 : out std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0) := (others=>'0');
  -- port b
  enb, enb_be         : in std_logic;
  wr_fifo_rqst_addr   : in cache_addr_array(N_WR_FIFOS-1 downto 0);
  rd_fifo_rqst_addr   : in cache_addr_array(N_AXI-1 downto 0);
  wr_fifo_dout        : in cache_word_array(N_WR_FIFOS-1 downto 0);
  rd_fifo_din_v       : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  dob                 : out std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0) := (others=>'0');

  -- ticket signals
  ticket_rqst_wr      : in std_logic_vector(N_WR_FIFOS-1 downto 0);
  ticket_ack_wr_fifo  : out std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  ticket_rqst_rd      : in std_logic_vector(N_AXI-1 downto 0);
  ticket_ack_rd_fifo  : out std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  
  -- be signals
  be_rdData           : out std_logic_vector (DATA_W/8*2**N-1 downto 0) := (others=>'0');

  clk, nrst           : in std_logic
);
end cache; -- }}}
architecture Behavioral of cache is
  -- internal signals definitions {{{
  signal ticket_ack_wr_fifo_n      : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal ticket_ack_rd_fifo_n      : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal ticket_ack_wr_fifo_i      : std_logic_vector(N_WR_FIFOS-1 downto 0) := (others=>'0');
  signal ticket_ack_rd_fifo_i      : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  -- }}}
  -- constants and functions {{{
  CONSTANT COL_W            : natural := 8;
  CONSTANT N_COL            : natural := 4*2**N;
  --}}}
  -- cache definition {{{
  type cache_bank_type is array(0 to 2**(M+L)-1) of std_logic_vector(N_COL*COL_W-1 downto 0);
  shared variable cache               : cache_bank_type := (others=>(others=>'0'));
  -- }}}
  -- port b signals & ticketing system {{{
  signal addrb, addrb_n                   : unsigned((M+L)-1 downto 0) := (others=>'0');
  signal dib, doa_n, dob_n                : std_logic_vector((2**N)*DATA_W-1 downto 0) := (others=>'0');
  signal web                              : std_logic_vector((2**N)*DATA_W/8-1 downto 0) := (others=>'0');
  signal rd_fifo_din_v_p0                 : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal rd_fifo_din_v_p1                 : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal rd_fifo_rqst_addr_inc            : unsigned((M+L)-1 downto 0) := (others=>'0');
  signal rd_fifo_rqst_addr_inc_n          : unsigned((M+L)-1 downto 0) := (others=>'0');
  signal wr_fifo_dout_d0                  : cache_word_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal ticket_ack_vec                   : std_logic_vector(2**BURST_WORDS_W/CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal ticket_ack_wr_vec                : std_logic_vector(2**BURST_WORDS_W/CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal ticket_ack_rd_vec                : std_logic_vector(2**BURST_WORDS_W/CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal ticket_ack_vec_d0                : std_logic_vector(2**BURST_WORDS_W/CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal ticket_ack_wr_vec_d0             : std_logic_vector(2**BURST_WORDS_W/CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal ticket_ack_rd_vec_d0             : std_logic_vector(2**BURST_WORDS_W/CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal ticket_ack_vec_n                 : std_logic := '0';
  signal ticket_ack_wr_vec_n              : std_logic := '0';
  signal ticket_ack_rd_vec_n              : std_logic := '0';
  signal wr_fifo_ack_indx_n               : integer range 0 to N_WR_FIFOS-1 := 0;
  signal wr_fifo_ack_indx                 : integer range 0 to N_WR_FIFOS-1 := 0;
  signal wr_fifo_ack_indx_d0              : integer range 0 to N_WR_FIFOS-1 := 0;
  signal rd_fifo_ack_indx_n               : integer range 0 to N_AXI-1 := 0;
  signal rd_fifo_ack_indx                 : integer range 0 to N_AXI-1 := 0;
  signal rd_fifo_ack_indx_d0              : integer range 0 to N_AXI-1 := 0;
  signal wr_fifo_rqst_addr_d0             : cache_addr_array(N_WR_FIFOS-1 downto 0) := (others=>(others=>'0'));
  signal rd_fifo_rqst_addr_d0             : cache_addr_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  -- }}}
  -- be signals{{{
  type be_mem_type is array(0 to 2**(M+L)-1) of std_logic_vector(2**N*DATA_W/8-1 downto 0);
  shared variable be                      : be_mem_type := (others=>(others=>'0'));
  signal be_we                            : std_logic := '0';
  attribute max_fanout of wr_fifo_ack_indx_d0 : signal is 60;
  signal be_rdData_n                      : std_logic_vector (DATA_W/8*2**N-1 downto 0) := (others=>'0');
  ---}}}
begin
  -- internal signals assignments -------------------------------------------------------------------------{{{
  ticket_ack_wr_fifo <= ticket_ack_wr_fifo_i;
  ticket_ack_rd_fifo <= ticket_ack_rd_fifo_i;
  ---------------------------------------------------------------------------------------------------------}}}
  -- error handling -------------------------------------------------------------------------------------------{{{
  -- assert(addra(7 downto 0) /= X"B7" or addra(8) /= '0' or wea(7 downto 4) /= X"F");
  ---------------------------------------------------------------------------------------------------------}}}
  -- be  -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if ena = '1' then
        -- if to_integer(addra) = 11 and wea /= (wea'range => '0') then
        --   report "Address B written";
        -- end if;
        for j in 0 to 2**N*DATA_W/8-1 loop
          if wea(j) = '1' then
            be(to_integer(addra))(j) := '1';
          end if;
        end loop;
      end if;
    end if;
  end process;
  process(clk)
  begin
    if rising_edge(clk) then
      be_rdData_n <= be(to_integer(addrb));
      if be_we = '1' then
        be(to_integer(addrb)) := (others=>'0');
      end if;
      if enb_be = '1' then
        be_rdData <= be_rdData_n;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- cache port b control -------------------------------------------------------------------------------------------{{{
  assert(ticket_ack_rd_vec = (ticket_ack_rd_vec'reverse_range=>'0') or ticket_ack_wr_vec = (ticket_ack_wr_vec'reverse_range=>'0'));
  process(clk)
  begin
    if rising_edge(clk) then
      ticket_ack_wr_fifo_i <= ticket_ack_wr_fifo_n;
      ticket_ack_rd_fifo_i <= ticket_ack_rd_fifo_n;
      wr_fifo_dout_d0 <= wr_fifo_dout;
      ticket_ack_vec(ticket_ack_vec'high-1 downto 0) <= ticket_ack_vec(ticket_ack_vec'high downto 1);
      ticket_ack_vec(ticket_ack_vec'high) <= ticket_ack_vec_n;
      ticket_ack_vec_d0 <= ticket_ack_vec;
      ticket_ack_wr_vec(ticket_ack_wr_vec'high-1 downto 0) <= ticket_ack_wr_vec(ticket_ack_wr_vec'high downto 1);
      ticket_ack_wr_vec(ticket_ack_wr_vec'high) <= ticket_ack_wr_vec_n;
      ticket_ack_wr_vec_d0 <= ticket_ack_wr_vec;
      ticket_ack_rd_vec(ticket_ack_rd_vec'high-1 downto 0) <= ticket_ack_rd_vec(ticket_ack_rd_vec'high downto 1);
      ticket_ack_rd_vec(ticket_ack_rd_vec'high) <= ticket_ack_rd_vec_n;
      ticket_ack_rd_vec_d0 <= ticket_ack_rd_vec;
      wr_fifo_ack_indx <= wr_fifo_ack_indx_n;
      rd_fifo_ack_indx <= rd_fifo_ack_indx_n;
      wr_fifo_ack_indx_d0 <= wr_fifo_ack_indx;
      rd_fifo_ack_indx_d0 <= rd_fifo_ack_indx;
      wr_fifo_rqst_addr_d0 <= wr_fifo_rqst_addr;
      rd_fifo_rqst_addr_d0 <= rd_fifo_rqst_addr;
      -- write path
      web <= (others=>'0');
      dib <= wr_fifo_dout_d0(wr_fifo_ack_indx_d0);
      if ticket_ack_wr_vec_d0 /= (ticket_ack_wr_vec_d0'reverse_range => '0') then
        addrb <= wr_fifo_rqst_addr_d0(wr_fifo_ack_indx_d0);
        web <= (others=>'1');
      end if;
      -- read path
      be_we <= '0';
      rd_fifo_din_v_p1 <= (others=>'0');
      if ticket_ack_rd_vec_d0 /= (ticket_ack_rd_vec_d0'reverse_range => '0') then
        addrb <= rd_fifo_rqst_addr_inc;
        rd_fifo_din_v_p1(rd_fifo_ack_indx_d0) <= '1';
        be_we <= '1';
      end if;
      rd_fifo_din_v_p0 <= rd_fifo_din_v_p1;
      rd_fifo_din_v <= rd_fifo_din_v_p0;

      if nrst = '0' then
        rd_fifo_rqst_addr_inc <= (others=>'0');
      else
        rd_fifo_rqst_addr_inc <= rd_fifo_rqst_addr_inc_n;
      end if;
    end if;
  end process;
  process(ticket_rqst_wr, ticket_rqst_rd, ticket_ack_vec, wr_fifo_ack_indx, rd_fifo_ack_indx, rd_fifo_rqst_addr_inc, rd_fifo_rqst_addr_d0, ticket_ack_rd_vec_d0)
    variable wr_served: boolean := false;
  begin
    ticket_ack_wr_fifo_n <= (others=>'0');
    ticket_ack_rd_fifo_n <= (others=>'0');
    ticket_ack_vec_n <= '0';
    ticket_ack_wr_vec_n <= '0';
    ticket_ack_rd_vec_n <= '0';
    wr_fifo_ack_indx_n <= wr_fifo_ack_indx;
    rd_fifo_ack_indx_n <= rd_fifo_ack_indx;
    rd_fifo_rqst_addr_inc_n <= rd_fifo_rqst_addr_inc;
    if ticket_ack_rd_vec_d0(ticket_ack_rd_vec_d0'high downto 1) /= (0 to ticket_ack_rd_vec_d0'high-1 =>'0') then
      rd_fifo_rqst_addr_inc_n <= rd_fifo_rqst_addr_inc + 1;
    else
      rd_fifo_rqst_addr_inc_n <= rd_fifo_rqst_addr_d0(rd_fifo_ack_indx);
    end if;
    wr_served := false;
    for i in 0 to N_WR_FIFOS-1 loop
      -- if ticket_rqst_wr(i) = '1' and ticket_ack_vec = (ticket_ack_vec'range=>'0') then
      if ticket_rqst_wr(i) = '1' and ticket_ack_vec(ticket_ack_vec'high downto 1) = (0 to ticket_ack_vec'high-1 =>'0') then
        ticket_ack_wr_fifo_n(i) <= '1';
        wr_served := true;
        ticket_ack_vec_n <= '1';
        ticket_ack_wr_vec_n <= '1';
        wr_fifo_ack_indx_n <= i;
        exit;
      end if;
    end loop;
    if wr_served = false then
      for i in 0 to N_AXI-1 loop
        if ticket_rqst_rd(i) = '1' and ticket_ack_vec(ticket_ack_vec'high downto 1) = (0 to ticket_ack_vec'high-1 =>'0') then
          ticket_ack_rd_fifo_n(i) <= '1';
          ticket_ack_vec_n <= '1';
          ticket_ack_rd_vec_n <= '1';
          rd_fifo_ack_indx_n <= i;
          -- rd_fifo_rqst_addr_inc_n <= rd_fifo_rqst_addr(i);
          exit;
        end if;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- cache mems -------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      doa_n <= cache(to_integer(addra));
      for j in 0 to N_COL-1 loop
        if wea(j) = '1' then
          cache(to_integer(addra))((j+1)*COL_W-1 downto j*COL_W) := dia((j+1)*COL_W-1 downto j*COL_W);
        end if;
      end loop;
      if ena = '1' then
        doa <= doa_n;
      end if;
    end if;
  end process;
  process(clk)
  begin
    if rising_edge(clk) then
      if enb = '1' then
        dob <= dob_n;
      end if;
      dob_n <= cache(to_integer(addrb));
      -- assert(web = (web'range => '0') or dib /= (dib'range => '0')) severity failure;
      for j in 0 to N_COL-1 loop
        if web(j) = '1' then
          cache(to_integer(addrb))((j+1)*COL_W-1 downto j*COL_W) := dib((j+1)*COL_W-1 downto j*COL_W);
        end if;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
end Behavioral;
