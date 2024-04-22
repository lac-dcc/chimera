-- fast transmitter slave
-- ebm_ebft is a write only master on a dedicated
-- bus. the pcie endpoint acts as its slave

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.all;
use std.textio.all;

entity ebm0_pcie_vpcie_slave is
 generic
 (
  EBFT_DWIDTH: natural := 64;
  EBS_DWIDTH: natural := 32
 );
 port
 (
  clk: in std_logic;
  rst: in std_logic;

  -- fast transmitter
  eb_ft_dxt_i: in std_logic_vector(EBFT_DWIDTH - 1 downto 0);
  eb_bft_i: in std_logic;
  eb_as_i: in std_logic;
  eb_eof_i: in std_logic;
  eb_dk_o: out std_logic;
  eb_err_o: out std_logic;

  -- pcie endpoint
  pcie_mwr_en: out std_ulogic;
  pcie_mwr_addr: out std_ulogic_vector(work.pcie.ADDR_WIDTH - 1 downto 0);
  pcie_mwr_data: out std_ulogic_vector(work.pcie.PAYLOAD_WIDTH - 1 downto 0);
  pcie_mwr_size: out std_ulogic_vector(work.pcie.SIZE_WIDTH - 1 downto 0);
  pcie_msi_en: out std_ulogic
 );
end ebm0_pcie_vpcie_slave;

architecture ebm0_pcie_vpcie_slave_arch of ebm0_pcie_vpcie_slave is

 type state_t is
 (
  state_idle,
  state_bcast,
  state_not_eof,
  state_write,
  state_not_bft
 );
 attribute enum_encoding: string;
 attribute enum_encoding of state_t: type is
 (
  "00001 00010 00100 01000 10000"
 );
 signal state: state_t;
 signal next_state: state_t;

 -- host address
 signal addr_reg: std_ulogic_vector(63 downto 0);
 signal addr_en: std_ulogic;

 -- burst counter
 signal burst_reg: unsigned(15 downto 0);
 signal burst_clr: std_ulogic;
 signal burst_en: std_ulogic;

 -- burst bit index
 signal burst_index: integer;

 -- store the current data word
 signal data_en: std_ulogic;

begin

 -- update state register
 process(clk, rst)
 begin
  if rst = '1' then
   state <= state_idle;
  elsif rising_edge(clk) then
   state <= next_state;
  end if;
 end process;

 -- next state logic
 process
 (
  state,
  eb_bft_i,
  eb_as_i,
  eb_eof_i
 )
  variable l: line;
 begin
  case state is

   when state_idle =>
    if eb_bft_i = '1' and eb_as_i = '1' then
     -- bus granted by ebone manager
     if eb_eof_i = '1' then
      next_state <= state_bcast;
     else
      next_state <= state_not_eof;
     end if;
    end if;

   when state_bcast =>
    next_state <= state_not_bft;

   when state_not_eof =>
    if eb_eof_i = '1' then
     next_state <= state_write;
    end if;

   when state_write =>
    next_state <= state_idle;
    if eb_bft_i = '1' then
     next_state <= state_not_bft;
    end if;

   when state_not_bft =>
    -- wait until not bft
    if eb_bft_i = '0' then
     next_state <= state_idle;
    end if;

   when others =>
    next_state <= state_idle;

  end case;
 end process;

 -- moore output logic
 process(state, eb_as_i)
  variable l: line;
 begin

  eb_dk_o <= '0';
  eb_err_o <= '0';
  pcie_mwr_en <= '0';
  pcie_mwr_addr <= (others => '0');
  pcie_mwr_size <= (others => '0');
  pcie_msi_en <= '0';
  addr_en <= '0';
  burst_en <= '0';
  burst_clr <= '0';
  data_en <= '0';

  case state is

   when state_idle =>

   when state_bcast =>
    pcie_msi_en <= '1';

   when state_not_eof =>
    eb_dk_o <= '1';
    if eb_as_i = '1' then
     burst_clr <= '1';
     addr_en <= '1';
    else
     burst_en <= '1';
     data_en <= '1';
    end if;

   when state_write =>
    -- mwr_size in bytes
    pcie_mwr_size <= std_ulogic_vector(to_unsigned(burst_index / 8, 16));
    pcie_mwr_addr <= addr_reg;
    pcie_mwr_en <= '1';

   when state_not_bft =>

   when others =>
    write(l, String'("slave, state_others"));
    writeline(output, l);

  end case;
 end process;

 -- host addr process

 assert EBFT_DWIDTH >= 64 report "EBFT_DWIDTH must be >= 64" severity failure;

 process(clk, rst)
 begin
  if rst = '1' then
   addr_reg <= (others => '0');
  elsif rising_edge(clk) then
   if addr_en = '1' then
    -- FIXME: has to check eb_as_i
    if eb_as_i = '1' then
     addr_reg <= std_ulogic_vector(eb_ft_dxt_i(63 downto 0));
    end if;
   end if;
  end if;
 end process;

 -- burst counter process

 process(rst, clk)
 begin
  if rst = '1' then
   burst_reg <= (others => '0');
  elsif rising_edge(clk) then
   if burst_clr = '1' then
    burst_reg <= (others => '0');
   elsif burst_en = '1' then
    burst_reg <= burst_reg + 1;
   end if;
  end if;
 end process;

 -- burst_index = burst_reg * EBFT_DWIDTH

 ebft_dwidth_64_generate: if EBFT_DWIDTH = 64 generate
  burst_index <= to_integer(burst_reg sll 6);
 end generate ebft_dwidth_64_generate;

 ebft_dwidth_128_generate: if EBFT_DWIDTH = 128 generate
  burst_index <= to_integer(burst_reg sll 7);
 end generate ebft_dwidth_128_generate;

 ebft_dwidth_256_generate: if EBFT_DWIDTH = 256 generate
  burst_index <= to_integer(burst_reg sll 8);
 end generate ebft_dwidth_256_generate;

 -- store data process
 process(rst, clk)
  variable l:  line;
 begin
  if rst = '1' then
  elsif rising_edge(clk) then
   if data_en = '1' then
    pcie_mwr_data(burst_index + EBFT_DWIDTH - 1 downto burst_index)
     <= std_ulogic_vector(eb_ft_dxt_i);
   end if;
  end if;
 end process;

end ebm0_pcie_vpcie_slave_arch;


-- master 0

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.all;
use std.textio.all;

entity ebm0_pcie_vpcie_master is
 generic
 (
  EBFT_DWIDTH: natural := 64;
  EBS_DWIDTH: natural := 32
 );
 port
 (
  clk: in std_logic;
  rst: in std_logic;

  -- master 0
  eb_m0_clk_o: out std_logic;
  eb_m0_rst_o: out std_logic;
  eb_m0_brq_o: out std_logic;
  eb_m0_bg_i: in std_logic;
  eb_m0_as_o: out std_logic;
  eb_m0_eof_o: out std_logic;
  eb_m0_aef_o: out std_logic;
  eb_m0_dat_o: out std32;
  eb_dk_i: in std_logic;
  eb_err_i: in std_logic;
  eb_dat_i: in std32;
  eb_bft_i: in std_logic;
  eb_bmx_i: in std_logic;

  -- pcie endpoint signals
  pcie_req_en: in std_ulogic;
  pcie_req_ack: out std_ulogic;
  pcie_req_wr: in std_ulogic;
  pcie_req_bar: in std_ulogic_vector(work.pcie.BAR_WIDTH - 1 downto 0);
  pcie_req_addr: in std_ulogic_vector(work.pcie.ADDR_WIDTH - 1 downto 0);
  pcie_req_data: in std_ulogic_vector(work.pcie.DATA_WIDTH - 1 downto 0);
  pcie_rep_en: out std_ulogic;
  pcie_rep_data: out std_ulogic_vector(work.pcie.DATA_WIDTH - 1 downto 0)
 );
end ebm0_pcie_vpcie_master;

architecture ebm0_pcie_vpcie_master_arch of ebm0_pcie_vpcie_master is

 -- master state
 type state_t is
 (
  state_idle,
  state_brq,
  state_as,
  state_data,
  state_reply,
  state_ack,
  state_done
 );
 attribute enum_encoding: string;
 attribute enum_encoding of state_t: type is
 (
  "0000001 0000010 0000100 0001000 0010000 0100000 1000000"
 );
 signal state: state_t;
 signal next_state: state_t;
 signal eb_busy: std_logic;

 -- burst word32 counter
 signal burst_w32_reg: unsigned(15 downto 0);
 signal burst_w32_clr: std_ulogic;
 signal burst_w32_en: std_ulogic;

 -- burst bit index
 signal burst_index: integer;

 -- request word32 count
 signal req_w32_count: unsigned(15 downto 0);
 signal req_w32_count_minus_one: unsigned(15 downto 0);
 signal req_w32_count_minus_two: unsigned(15 downto 0);

 -- ebone sized request word
 signal req_word: std_logic_vector(31 downto 0);

 -- pcie size reply word
 signal rep_word: std_ulogic_vector(work.pcie.DATA_WIDTH - 1 downto 0);

 -- request captured information
 signal req_is_read: std_ulogic;
 signal req_bar: std_ulogic_vector(work.pcie.BAR_WIDTH - 1 downto 0);
 signal req_addr: std_ulogic_vector(work.pcie.ADDR_WIDTH - 1 downto 0);

 -- latch pcie reply data
 signal rep_data_en: std_ulogic;

 -- ebone master 0 logic
 signal eb_m0_brq: std_logic;
 signal eb_m0_as: std_logic;
 signal eb_m0_eof: std_logic;
 signal eb_m0_aef: std_logic;

begin

 -- master automaton

 eb_m0_clk_o <= clk;
 eb_m0_rst_o <= rst;
 eb_m0_brq_o <= eb_m0_brq;
 eb_m0_as_o <= eb_m0_as;
 eb_m0_eof_o <= eb_m0_eof;
 eb_m0_aef_o <= eb_m0_aef;

 eb_busy <= eb_bmx_i or eb_bft_i;

 -- update master state register
 process(clk, rst)
 begin
  if rst = '1' then
   state <= state_idle;
  elsif rising_edge(clk) then
   state <= next_state;
  end if;
 end process;

 -- next state logic
 process
 (
  state,
  pcie_req_en,
  req_is_read,
  eb_busy,
  eb_m0_bg_i,
  eb_err_i,
  eb_dk_i,
  burst_w32_reg
 )
  variable l: line;
 begin
  case state is

   when state_idle =>
    if pcie_req_en = '1' and eb_busy = '0' then
     write(l, String'("to_brq"));
     writeline(output, l);
     next_state <= state_brq;
    end if;

   when state_brq =>
    -- request bus mastership
    -- wait for the bus manager to grant the access
    -- retry if not granted within the next clock cycle
    if eb_m0_bg_i = '1' then
     write(l, String'("to_as"));
     writeline(output, l);
     next_state <= state_as;
    else
     write(l, String'("to_idle"));
     writeline(output, l);
     next_state <= state_idle;
    end if;

   when state_as =>
    -- addressing phase
    if eb_err_i = '1' and eb_dk_i = '1' then
     -- TODO retry
     write(l, String'("to_idle(err and dk)"));
     writeline(output, l);
     next_state <= state_done;
    elsif eb_err_i = '1' then
     -- TODO error
     write(l, String'("to_idle(err)"));
     writeline(output, l);
     next_state <= state_done;
    elsif eb_dk_i = '1' then
     -- data acknowledge, wait one clock
     write(l, String'("to_dk"));
     writeline(output, l);
     next_state <= state_data;
    end if;

   when state_data =>
    next_state <= state_data;
    if burst_w32_reg = req_w32_count_minus_one then
     next_state <= state_ack;
     if req_is_read = '1' then
      write(l, String'("to_reply"));
      writeline(output, l);
      next_state <= state_reply;
     end if;
    end if;

   when state_reply =>
    write(l, String'("to_ack"));
    writeline(output, l);
    next_state <= state_ack;

   when state_ack =>
    next_state <= state_done;

   when state_done =>
    write(l, String'("to_idle"));
    writeline(output, l);
    next_state <= state_idle;

   when others =>
    next_state <= state_idle;
  end case;

 end process;

 -- moore output logic
 process(state)
  variable l: line;
 begin

  eb_m0_brq <= '0';
  eb_m0_as <= '0';
  eb_m0_eof <= '0';
  eb_m0_aef <= '0';
  eb_m0_dat_o <= (others => '0');

  burst_w32_clr <= '0';
  burst_w32_en <= '0';

  pcie_req_ack <= '0';
  pcie_rep_en <= '0';

  rep_data_en <= '0';

  case state is

   when state_idle =>
    write(l, String'("state_idle"));
    writeline(output, l);

   when state_brq =>
    -- assert brq signal
    write(l, String'("state_brq"));
    writeline(output, l);
    eb_m0_brq <= '1';

   when state_as =>
    -- assert as and put addressing info on the bus
    eb_m0_brq <= '1';
    eb_m0_as <= '1';
    eb_m0_dat_o(31) <= req_is_read;
    eb_m0_dat_o(29 downto 28) <= std_logic_vector(req_bar(1 downto 0));
    -- address is divided by 4
    eb_m0_dat_o(27 downto 0) <= std_logic_vector(req_addr(29 downto 2));

    if req_w32_count = x"0001" then
     eb_m0_aef <= '1';
    end if;

    burst_w32_clr <= '1';

   when state_data =>
    -- read or write data burst
    eb_m0_brq <= '1';
    burst_w32_en <= '1';

    if burst_w32_reg = req_w32_count_minus_two then
     -- special case of single transfer
     if req_w32_count /= x"0001" then   
      eb_m0_aef <= '1';
     end if;
    elsif burst_w32_reg = req_w32_count_minus_one then
     eb_m0_eof <= '1';
     burst_w32_en <= '0';
    end if;

    -- next burst word
    if req_is_read = '1' then
     -- write(l, String'("REP_WORD: "));
     -- write(l, integer'image(to_integer(unsigned(rep_word))));
     -- write(l, String'(", EB_DAT_I: "));
     -- write(l, integer'image(to_integer(unsigned(eb_dat_i))));
     -- writeline(output, l);
     rep_data_en <= '1';
    else
     eb_m0_dat_o <= req_word;
    end if;

   when state_reply =>
    pcie_rep_en <= '1';

   when state_ack =>
    pcie_req_ack <= '1';

   when state_done =>
    -- transfer done
    write(l, String'("state_done"));
    writeline(output, l);

   when others =>
    write(l, String'("state_others"));
    writeline(output, l);

  end case;
 end process;

 -- burst word32 counter process
 process(rst, clk)
 begin
  if rst = '1' then
   burst_w32_reg <= (others => '0');
  elsif rising_edge(clk) then
   if burst_w32_clr = '1' then
    burst_w32_reg <= (others => '0');
   elsif burst_w32_en = '1' then
    burst_w32_reg <= burst_w32_reg + 1;
   end if;
  end if;
 end process;

 -- burst_index = burst_w32_reg * 32
 burst_index <= to_integer(burst_w32_reg & "00000");

 -- pcie_req_en related process
 process(clk, rst)
 begin
  if rst = '1' then
   req_is_read <= '0';
   req_bar <= (others => '0');
   req_addr <= (others => '0');
   req_w32_count <= x"0000";
   req_w32_count_minus_one <= x"0000";
   req_w32_count_minus_two <= x"0000";
  elsif rising_edge(clk) then
   if pcie_req_en = '1' then
    req_is_read <= not pcie_req_wr;
    req_bar <= pcie_req_bar;
    req_addr <= pcie_req_addr;
    req_w32_count <= x"0001";
    req_w32_count_minus_one <= x"0000";
    req_w32_count_minus_two <= x"ffff";
   end if;
  end if;
 end process;

 -- generate input word according to data_width

 w32_generate: if work.pcie.DATA_WIDTH = 32 generate
  process(pcie_req_data, eb_dat_i)
  begin
   req_word(31 downto 0) <= std_logic_vector(pcie_req_data(31 downto 0));
   rep_word(31 downto 0) <= std_ulogic_vector(eb_dat_i);
  end process;
 end generate w32_generate;

 w64_generate: if work.pcie.DATA_WIDTH = 64 generate
  process(pcie_req_data, eb_dat_i)
  begin
   req_word(31 downto 0) <= std_logic_vector(pcie_req_data(31 downto 0));
   rep_word(63 downto 0) <= x"00000000" & std_ulogic_vector(eb_dat_i);
  end process;
 end generate w64_generate;

 -- pcie_rep_data latch process
 process(clk, rst)
 begin
  if rst = '1' then
   pcie_rep_data <= (others => '0');
  elsif rising_edge(clk) then
   if rep_data_en = '1' then
    pcie_rep_data <= rep_word;
   end if;
  end if;
 end process;

end ebm0_pcie_vpcie_master_arch;


-- endpoint main entity

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ebs_pkg.all;
use std.textio.all;

entity ebm0_pcie_vpcie is
 generic
 (
  EBFT_DWIDTH: natural := 64;
  EBS_DWIDTH: natural := 32
 );
 port
 (
  clk: in std_logic;
  rst: in std_logic;
  
  -- master 0
  eb_m0_clk_o: out std_logic;
  eb_m0_rst_o: out std_logic;
  eb_m0_brq_o: out std_logic;
  eb_m0_bg_i: in std_logic;
  eb_m0_as_o: out std_logic;
  eb_m0_eof_o: out std_logic;
  eb_m0_aef_o: out std_logic;
  eb_m0_dat_o: out std32;
  eb_dk_i: in std_logic;
  eb_err_i: in std_logic;
  eb_dat_i: in std32;

  -- fast transmitter
  eb_ft_dxt_i: in std_logic_vector(EBFT_DWIDTH - 1 downto 0);
  eb_bmx_i: in std_logic;
  eb_bft_i: in std_logic;
  eb_as_i: in std_logic;
  eb_eof_i: in std_logic;
  eb_dk_o: out std_logic;
  eb_err_o: out std_logic
 );
end ebm0_pcie_vpcie;


-- ebm0 consists of the master 0, a ft slave and the endpoint

architecture ebm0_pcie_vpcie_arch of ebm0_pcie_vpcie is

 -- pcie endpoint signals
 signal pcie_req_en: std_ulogic;
 signal pcie_req_ack: std_ulogic;
 signal pcie_req_wr: std_ulogic;
 signal pcie_req_bar: std_ulogic_vector(work.pcie.BAR_WIDTH - 1 downto 0);
 signal pcie_req_addr: std_ulogic_vector(work.pcie.ADDR_WIDTH - 1 downto 0);
 signal pcie_req_data: std_ulogic_vector(work.pcie.DATA_WIDTH - 1 downto 0);
 signal pcie_rep_en: std_ulogic;
 signal pcie_rep_data: std_ulogic_vector(work.pcie.DATA_WIDTH - 1 downto 0);
 signal pcie_mwr_en: std_ulogic;
 signal pcie_mwr_addr: std_ulogic_vector(work.pcie.ADDR_WIDTH - 1 downto 0);
 signal pcie_mwr_data: std_ulogic_vector(work.pcie.PAYLOAD_WIDTH - 1 downto 0);
 signal pcie_mwr_size: std_ulogic_vector(work.pcie.SIZE_WIDTH - 1 downto 0);
 signal pcie_msi_en: std_ulogic;

begin

 -- virtual pcie endpoint

 pcie_endpoint:
 work.pcie.endpoint
 port map
 (
  rst => rst,
  clk => clk,
  req_en => pcie_req_en,
  req_ack => pcie_req_ack,
  req_wr => pcie_req_wr,
  req_bar => pcie_req_bar,
  req_addr => pcie_req_addr,
  req_data => pcie_req_data,
  rep_en => pcie_rep_en,
  rep_data => pcie_rep_data,
  mwr_en => pcie_mwr_en,
  mwr_addr => pcie_mwr_addr,
  mwr_data => pcie_mwr_data,
  mwr_size => pcie_mwr_size,
  msi_en => pcie_msi_en
 );

 -- master 0

 ebm0_pcie_vpcie_master:
 entity work.ebm0_pcie_vpcie_master
 generic map
 (
  EBFT_DWIDTH => EBFT_DWIDTH,
  EBS_DWIDTH => EBS_DWIDTH
 )
 port map
 (
  clk => clk,
  rst => rst,
  eb_m0_clk_o => eb_m0_clk_o,
  eb_m0_rst_o => eb_m0_rst_o,
  eb_m0_brq_o => eb_m0_brq_o,
  eb_m0_bg_i => eb_m0_bg_i,
  eb_m0_as_o => eb_m0_as_o,
  eb_m0_eof_o => eb_m0_eof_o,
  eb_m0_aef_o => eb_m0_aef_o,
  eb_m0_dat_o => eb_m0_dat_o,
  eb_dk_i => eb_dk_i,
  eb_err_i => eb_err_i,
  eb_dat_i => eb_dat_i,
  eb_bft_i => eb_bft_i,
  eb_bmx_i => eb_bmx_i,
  pcie_req_en => pcie_req_en,
  pcie_req_ack => pcie_req_ack,
  pcie_req_wr => pcie_req_wr,
  pcie_req_bar => pcie_req_bar,
  pcie_req_addr => pcie_req_addr,
  pcie_req_data => pcie_req_data,
  pcie_rep_en => pcie_rep_en,
  pcie_rep_data => pcie_rep_data
 );

 -- slave of fast transmitter

 ebm0_pcie_vpcie_slave:
 entity work.ebm0_pcie_vpcie_slave
 generic map
 (
  EBFT_DWIDTH => EBFT_DWIDTH,
  EBS_DWIDTH => EBS_DWIDTH
 )
 port map
 (
  clk => clk,
  rst => rst,
  eb_ft_dxt_i => eb_ft_dxt_i,
  eb_bft_i => eb_bft_i,
  eb_as_i => eb_as_i,
  eb_eof_i => eb_eof_i,
  eb_dk_o => eb_dk_o,
  eb_err_o => eb_err_o,
  pcie_mwr_en => pcie_mwr_en,
  pcie_mwr_addr => pcie_mwr_addr,
  pcie_mwr_data => pcie_mwr_data,
  pcie_mwr_size => pcie_mwr_size,
  pcie_msi_en => pcie_msi_en
 );

end ebm0_pcie_vpcie_arch;
