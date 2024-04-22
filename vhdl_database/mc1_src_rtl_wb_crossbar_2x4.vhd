----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This is a 2 x 4 crossbar interconnect module with the following properties:
--   * Wishbone B4 pipelined interface (see: https://cdn.opencores.org/downloads/wbspec_b4.pdf)
--   * The crossbar connects two masters to four slaves.
--   * The two most significant bits of the address are used to select which slave to access (this
--     scheme can easily be changed by altering address_to_port()).
--   * A master may only have pending requests to at most one slave at a time.
--   * When the two masters are competing to access the same slave, master A has precedence.
--   * A request (STB) from a master will be stalled (STALL) if:
--     - It tries to access a slave that is busy with the other master.
--     - It tries to access a new slave while it has pending requests from another slave.
--     - It tries to issue more than the maximum allowed number of pending requests. (*)
--
-- (*) A pending request is one that has been issued by a master but not yet responded to.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wb_crossbar_2x4 is
  generic(
    ADR_WIDTH : positive := 30;            -- Address bus width
    DAT_WIDTH : positive := 32;            -- Must be a multiple of GRANULARITY
    GRANULARITY : positive := 8;           -- Usually 8 (for byte granularity)
    LOG2_MAX_PENDING_REQS : positive := 6  -- Max pending reqs = 2**LOG2_MAX_PENDING_REQS-1
  );
  port(
    -- Common control signals.
    i_rst : in std_logic;
    i_clk : in std_logic;

    -- Signals from/to MASTER A.
    i_adr_a : in std_logic_vector(ADR_WIDTH-1 downto 0);
    i_dat_a : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_we_a : in std_logic;
    i_sel_a : in std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    i_cyc_a : in std_logic;
    i_stb_a : in std_logic;
    o_dat_a : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_ack_a : out std_logic;
    o_stall_a : out std_logic;
    o_rty_a : out std_logic;
    o_err_a : out std_logic;

    -- Signals from/to MASTER B.
    i_adr_b : in std_logic_vector(ADR_WIDTH-1 downto 0);
    i_dat_b : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_we_b : in std_logic;
    i_sel_b : in std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    i_cyc_b : in std_logic;
    i_stb_b : in std_logic;
    o_dat_b : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_ack_b : out std_logic;
    o_stall_b : out std_logic;
    o_rty_b : out std_logic;
    o_err_b : out std_logic;

    -- Signals to/from SLAVE 0.
    o_adr_0 : out std_logic_vector(ADR_WIDTH-1 downto 0);
    o_dat_0 : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_we_0 : out std_logic;
    o_sel_0 : out std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    o_cyc_0 : out std_logic;
    o_stb_0 : out std_logic;
    i_dat_0 : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_ack_0 : in std_logic;
    i_stall_0 : in std_logic;
    i_rty_0 : in std_logic;
    i_err_0 : in std_logic;

    -- Signals to/from SLAVE 1.
    o_adr_1 : out std_logic_vector(ADR_WIDTH-1 downto 0);
    o_dat_1 : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_we_1 : out std_logic;
    o_sel_1 : out std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    o_cyc_1 : out std_logic;
    o_stb_1 : out std_logic;
    i_dat_1 : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_ack_1 : in std_logic;
    i_stall_1 : in std_logic;
    i_rty_1 : in std_logic;
    i_err_1 : in std_logic;

    -- Signals to/from SLAVE 2.
    o_adr_2 : out std_logic_vector(ADR_WIDTH-1 downto 0);
    o_dat_2 : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_we_2 : out std_logic;
    o_sel_2 : out std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    o_cyc_2 : out std_logic;
    o_stb_2 : out std_logic;
    i_dat_2 : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_ack_2 : in std_logic;
    i_stall_2 : in std_logic;
    i_rty_2 : in std_logic;
    i_err_2 : in std_logic;

    -- Signals to/from SLAVE 3.
    o_adr_3 : out std_logic_vector(ADR_WIDTH-1 downto 0);
    o_dat_3 : out std_logic_vector(DAT_WIDTH-1 downto 0);
    o_we_3 : out std_logic;
    o_sel_3 : out std_logic_vector(DAT_WIDTH/GRANULARITY-1 downto 0);
    o_cyc_3 : out std_logic;
    o_stb_3 : out std_logic;
    i_dat_3 : in std_logic_vector(DAT_WIDTH-1 downto 0);
    i_ack_3 : in std_logic;
    i_stall_3 : in std_logic;
    i_rty_3 : in std_logic;
    i_err_3 : in std_logic
  );
end wb_crossbar_2x4;

architecture rtl of wb_crossbar_2x4 is
  constant C_MAX_PENDING_REQS : positive := 2**LOG2_MAX_PENDING_REQS - 1;

  subtype T_REQ_COUNT is unsigned(LOG2_MAX_PENDING_REQS-1 downto 0);

  subtype T_PORT is std_logic_vector(2 downto 0);
  constant PORT_0 : T_PORT := "000";
  constant PORT_1 : T_PORT := "001";
  constant PORT_2 : T_PORT := "010";
  constant PORT_3 : T_PORT := "011";
  constant NO_PORT : T_PORT := "111";

  -- Registered state signals (master A).
  signal s_active_port_a : T_PORT;
  signal s_pending_reqs_a : T_REQ_COUNT;
  signal s_pending_reqs_is_0_a : std_logic;
  signal s_pending_reqs_is_1_a : std_logic;
  signal s_pending_reqs_is_max_a : std_logic;

  -- Registered state signals (master B).
  signal s_active_port_b : T_PORT;
  signal s_pending_reqs_b : T_REQ_COUNT;
  signal s_pending_reqs_is_0_b : std_logic;
  signal s_pending_reqs_is_1_b : std_logic;
  signal s_pending_reqs_is_max_b : std_logic;

  -- Signals from a selected slave to master A.
  signal s_dat_from_slave_a : std_logic_vector(DAT_WIDTH-1 downto 0);
  signal s_ack_from_slave_a : std_logic;
  signal s_stall_from_slave_a : std_logic;
  signal s_rty_from_slave_a : std_logic;
  signal s_err_from_slave_a : std_logic;

  -- Signals from a selected slave to master B.
  signal s_dat_from_slave_b : std_logic_vector(DAT_WIDTH-1 downto 0);
  signal s_ack_from_slave_b : std_logic;
  signal s_stall_from_slave_b : std_logic;
  signal s_rty_from_slave_b : std_logic;
  signal s_err_from_slave_b : std_logic;

  -- Request arbiter signals for master A.
  signal s_req_a : std_logic;
  signal s_no_pending_req_a : std_logic;
  signal s_can_honor_req_a : std_logic;
  signal s_req_validated_a : std_logic;
  signal s_req_port_a : T_PORT;
  signal s_next_port_a : T_PORT;
  signal s_stall_a : std_logic;
  signal s_stb_a : std_logic;

  -- Request arbiter signals for master B.
  signal s_req_b : std_logic;
  signal s_no_pending_req_b : std_logic;
  signal s_can_honor_req_b : std_logic;
  signal s_req_validated_b : std_logic;
  signal s_req_port_b : T_PORT;
  signal s_next_port_b : T_PORT;
  signal s_stall_b : std_logic;
  signal s_stb_b : std_logic;

  -- CYC signals to the slaves.
  signal s_cyc_0 : std_logic;
  signal s_cyc_1 : std_logic;
  signal s_cyc_2 : std_logic;
  signal s_cyc_3 : std_logic;
  signal s_last_cyc_0 : std_logic;
  signal s_last_cyc_1 : std_logic;
  signal s_last_cyc_2 : std_logic;
  signal s_last_cyc_3 : std_logic;

  -- Map an address to a slave port.
  function address_to_port(adr : std_logic_vector) return T_PORT is
    variable v_msb : std_logic_vector(1 downto 0);
  begin
    v_msb := adr(adr'high downto adr'high-1);
    case v_msb is
      when "00"   => return PORT_0;
      when "01"   => return PORT_1;
      when "10"   => return PORT_2;
      when "11"   => return PORT_3;
      when others => return PORT_0;  -- Should never happen.
    end case;
  end function;

  function is_valid_port(p : T_PORT) return boolean is
  begin
    -- The most significant bit of T_PORT is cleared if a valid port is selected.
    -- NO_PORT is the only "port" with the most significant bit set.
    return p(2) = '0';
  end;

begin
  --------------------------------------------------------------------------------------------------
  -- Slave to master A MUX.
  --------------------------------------------------------------------------------------------------

  with s_active_port_a select s_dat_from_slave_a <=
      i_dat_0 when PORT_0,
      i_dat_1 when PORT_1,
      i_dat_2 when PORT_2,
      i_dat_3 when PORT_3,
      (others => '-') when others;
  with s_active_port_a select s_ack_from_slave_a <=
      i_ack_0 when PORT_0,
      i_ack_1 when PORT_1,
      i_ack_2 when PORT_2,
      i_ack_3 when PORT_3,
      '0' when others;
  with s_next_port_a select s_stall_from_slave_a <=
      i_stall_0 when PORT_0,
      i_stall_1 when PORT_1,
      i_stall_2 when PORT_2,
      i_stall_3 when PORT_3,
      '0' when others;
  with s_next_port_a select s_rty_from_slave_a <=
      i_rty_0 when PORT_0,
      i_rty_1 when PORT_1,
      i_rty_2 when PORT_2,
      i_rty_3 when PORT_3,
      '0' when others;
  with s_next_port_a select s_err_from_slave_a <=
      i_err_0 when PORT_0,
      i_err_1 when PORT_1,
      i_err_2 when PORT_2,
      i_err_3 when PORT_3,
      '0' when others;


  --------------------------------------------------------------------------------------------------
  -- Slave to master B MUX.
  --------------------------------------------------------------------------------------------------

  with s_active_port_b select s_dat_from_slave_b <=
      i_dat_0 when PORT_0,
      i_dat_1 when PORT_1,
      i_dat_2 when PORT_2,
      i_dat_3 when PORT_3,
      (others => '-') when others;
  with s_active_port_b select s_ack_from_slave_b <=
      i_ack_0 when PORT_0,
      i_ack_1 when PORT_1,
      i_ack_2 when PORT_2,
      i_ack_3 when PORT_3,
      '0' when others;
  with s_next_port_b select s_stall_from_slave_b <=
      i_stall_0 when PORT_0,
      i_stall_1 when PORT_1,
      i_stall_2 when PORT_2,
      i_stall_3 when PORT_3,
      '0' when others;
  with s_next_port_b select s_rty_from_slave_b <=
      i_rty_0 when PORT_0,
      i_rty_1 when PORT_1,
      i_rty_2 when PORT_2,
      i_rty_3 when PORT_3,
      '0' when others;
  with s_next_port_b select s_err_from_slave_b <=
      i_err_0 when PORT_0,
      i_err_1 when PORT_1,
      i_err_2 when PORT_2,
      i_err_3 when PORT_3,
      '0' when others;


  --------------------------------------------------------------------------------------------------
  -- Master A slave selection logic.
  -- Note: These signals are non-registered, so keep the logic complexity to a minimum, and NO
  -- combinatorial loops (signal feedback)!
  --------------------------------------------------------------------------------------------------

  -- Do we have any pending requests for master A?
  s_no_pending_req_a <= s_pending_reqs_is_0_a or (s_pending_reqs_is_1_a and s_ack_from_slave_a);

  -- Decode the current request from master A.
  s_req_a <= i_cyc_a and i_stb_a;
  s_req_port_a <= address_to_port(i_adr_a);

  -- Can we honor the request from master A?
  s_can_honor_req_a <= not s_pending_reqs_is_max_a when
      s_req_port_a = s_active_port_a or
      (s_no_pending_req_a = '1' and (s_req_port_a /= s_active_port_b or s_no_pending_req_b = '1'))
      else '0';
  s_req_validated_a <= s_req_a and s_can_honor_req_a;

  -- Determine the next slave port for master A.
  s_next_port_a <=
      s_req_port_a when s_req_validated_a = '1' else
      NO_PORT when s_no_pending_req_a = '1' else
      s_active_port_a;

  -- Do we need to stall master A?
  s_stall_a <= s_stall_from_slave_a or not s_can_honor_req_a;

  -- Should STB be forwarded from master A?
  s_stb_a <= s_req_validated_a;


  --------------------------------------------------------------------------------------------------
  -- Master B slave selection logic.
  -- Note: These signals are non-registered, so keep the logic complexity to a minimum, and NO
  -- combinatorial loops (signal feedback)!
  --------------------------------------------------------------------------------------------------

  -- Do we have any pending requests for master B?
  s_no_pending_req_b <= s_pending_reqs_is_0_b or (s_pending_reqs_is_1_b and s_ack_from_slave_b);

  -- Decode the current request from master B.
  s_req_b <= i_cyc_b and i_stb_b;
  s_req_port_b <= address_to_port(i_adr_b);

  -- Can we honor the request from master B?
  -- TODO(m): Can we optimize the collision detection logic (s_next_port_a is expensive)?
  s_can_honor_req_b <= not s_pending_reqs_is_max_b when
      s_req_port_b /= s_next_port_a and
      (s_req_port_b = s_active_port_b or s_no_pending_req_b = '1')
      else '0';
  s_req_validated_b <= s_req_b and s_can_honor_req_b;

  -- Determine the next slave port for master B.
  s_next_port_b <=
      s_req_port_b when s_req_validated_b = '1' else
      NO_PORT when s_no_pending_req_b = '1' else
      s_active_port_b;

  -- Do we need to stall master B?
  s_stall_b <= s_stall_from_slave_b or not s_can_honor_req_b;

  -- Should STB be forwarded from master B?
  s_stb_b <= s_req_validated_b;


  --------------------------------------------------------------------------------------------------
  -- Send the signals to master A.
  --------------------------------------------------------------------------------------------------

  o_dat_a <= s_dat_from_slave_a;
  o_ack_a <= s_ack_from_slave_a;
  o_stall_a <= s_stall_a;
  o_rty_a <= s_rty_from_slave_a;
  o_err_a <= s_err_from_slave_a;


  --------------------------------------------------------------------------------------------------
  -- Send the signals to master B.
  --------------------------------------------------------------------------------------------------

  o_dat_b <= s_dat_from_slave_b;
  o_ack_b <= s_ack_from_slave_b;
  o_stall_b <= s_stall_b;
  o_rty_b <= s_rty_from_slave_b;
  o_err_b <= s_err_from_slave_b;


  --------------------------------------------------------------------------------------------------
  -- Send the signals to slave 0.
  --------------------------------------------------------------------------------------------------

  o_adr_0 <= i_adr_a when s_next_port_a = PORT_0 else
             i_adr_b when s_next_port_b = PORT_0 else (others => '-');
  o_dat_0 <= i_dat_a when s_next_port_a = PORT_0 else
             i_dat_b when s_next_port_b = PORT_0 else (others => '-');
  o_we_0  <= i_we_a  when s_next_port_a = PORT_0 else
             i_we_b  when s_next_port_b = PORT_0 else '-';
  o_sel_0 <= i_sel_a when s_next_port_a = PORT_0 else
             i_sel_b when s_next_port_b = PORT_0 else (others => '-');
  s_cyc_0 <= i_cyc_a when s_next_port_a = PORT_0 else
             i_cyc_b when s_next_port_b = PORT_0 else '0';
  o_stb_0 <= s_stb_a when s_next_port_a = PORT_0 else
             s_stb_b when s_next_port_b = PORT_0 else '0';

  -- We need to hold on the the CYC signal one cycle after we have switched ports.
  o_cyc_0 <= s_cyc_0 or s_last_cyc_0;


  --------------------------------------------------------------------------------------------------
  -- Send the signals to slave 1.
  --------------------------------------------------------------------------------------------------

  o_adr_1 <= i_adr_a when s_next_port_a = PORT_1 else
             i_adr_b when s_next_port_b = PORT_1 else (others => '-');
  o_dat_1 <= i_dat_a when s_next_port_a = PORT_1 else
             i_dat_b when s_next_port_b = PORT_1 else (others => '-');
  o_we_1  <= i_we_a  when s_next_port_a = PORT_1 else
             i_we_b  when s_next_port_b = PORT_1 else '-';
  o_sel_1 <= i_sel_a when s_next_port_a = PORT_1 else
             i_sel_b when s_next_port_b = PORT_1 else (others => '-');
  s_cyc_1 <= i_cyc_a when s_next_port_a = PORT_1 else
             i_cyc_b when s_next_port_b = PORT_1 else '0';
  o_stb_1 <= s_stb_a when s_next_port_a = PORT_1 else
             s_stb_b when s_next_port_b = PORT_1 else '0';

  -- We need to hold on the the CYC signal one cycle after we have switched ports.
  o_cyc_1 <= s_cyc_1 or s_last_cyc_1;


  --------------------------------------------------------------------------------------------------
  -- Send the signals to slave 2.
  --------------------------------------------------------------------------------------------------

  o_adr_2 <= i_adr_a when s_next_port_a = PORT_2 else
             i_adr_b when s_next_port_b = PORT_2 else (others => '-');
  o_dat_2 <= i_dat_a when s_next_port_a = PORT_2 else
             i_dat_b when s_next_port_b = PORT_2 else (others => '-');
  o_we_2  <= i_we_a  when s_next_port_a = PORT_2 else
             i_we_b  when s_next_port_b = PORT_2 else '-';
  o_sel_2 <= i_sel_a when s_next_port_a = PORT_2 else
             i_sel_b when s_next_port_b = PORT_2 else (others => '-');
  s_cyc_2 <= i_cyc_a when s_next_port_a = PORT_2 else
             i_cyc_b when s_next_port_b = PORT_2 else '0';
  o_stb_2 <= s_stb_a when s_next_port_a = PORT_2 else
             s_stb_b when s_next_port_b = PORT_2 else '0';

  -- We need to hold on the the CYC signal one cycle after we have switched ports.
  o_cyc_2 <= s_cyc_2 or s_last_cyc_2;


  --------------------------------------------------------------------------------------------------
  -- Send the signals to slave 3.
  --------------------------------------------------------------------------------------------------

  o_adr_3 <= i_adr_a when s_next_port_a = PORT_3 else
             i_adr_b when s_next_port_b = PORT_3 else (others => '-');
  o_dat_3 <= i_dat_a when s_next_port_a = PORT_3 else
             i_dat_b when s_next_port_b = PORT_3 else (others => '-');
  o_we_3  <= i_we_a  when s_next_port_a = PORT_3 else
             i_we_b  when s_next_port_b = PORT_3 else '-';
  o_sel_3 <= i_sel_a when s_next_port_a = PORT_3 else
             i_sel_b when s_next_port_b = PORT_3 else (others => '-');
  s_cyc_3 <= i_cyc_a when s_next_port_a = PORT_3 else
             i_cyc_b when s_next_port_b = PORT_3 else '0';
  o_stb_3 <= s_stb_a when s_next_port_a = PORT_3 else
             s_stb_b when s_next_port_b = PORT_3 else '0';

  -- We need to hold on the the CYC signal one cycle after we have switched ports.
  o_cyc_3 <= s_cyc_3 or s_last_cyc_3;


  --------------------------------------------------------------------------------------------------
  -- Prepare state for the next cycle (update registered signals).
  --------------------------------------------------------------------------------------------------

  process(i_rst, i_clk)
    variable v_req_count_a : T_REQ_COUNT;
    variable v_req_count_b : T_REQ_COUNT;
  begin
    if i_rst = '1' then
      s_pending_reqs_a <= to_unsigned(0, LOG2_MAX_PENDING_REQS);
      s_pending_reqs_b <= to_unsigned(0, LOG2_MAX_PENDING_REQS);
      s_pending_reqs_is_0_a <= '1';
      s_pending_reqs_is_0_b <= '1';
      s_pending_reqs_is_1_a <= '0';
      s_pending_reqs_is_1_b <= '0';
      s_pending_reqs_is_max_a <= '0';
      s_pending_reqs_is_max_b <= '0';

      s_active_port_a <= NO_PORT;
      s_active_port_b <= NO_PORT;

      s_last_cyc_0 <= '0';
      s_last_cyc_1 <= '0';
      s_last_cyc_2 <= '0';
      s_last_cyc_3 <= '0';
    elsif rising_edge(i_clk) then
      -- Update the number of pending requests for master A.
      v_req_count_a := s_pending_reqs_a;
      if s_req_validated_a = '1' and s_ack_from_slave_a = '0' and s_stall_from_slave_a = '0' then
        v_req_count_a := v_req_count_a + 1;
      elsif (s_req_validated_a = '0' or (s_req_validated_a = '1' and s_stall_from_slave_a = '1'))
            and s_ack_from_slave_a = '1' then
        v_req_count_a := v_req_count_a - 1;
      end if;
      if v_req_count_a = 0 then
        s_pending_reqs_is_0_a <= '1';
      else
        s_pending_reqs_is_0_a <= '0';
      end if;
      if v_req_count_a = 1 then
        s_pending_reqs_is_1_a <= '1';
      else
        s_pending_reqs_is_1_a <= '0';
      end if;
      if v_req_count_a = C_MAX_PENDING_REQS then
        s_pending_reqs_is_max_a <= '1';
      else
        s_pending_reqs_is_max_a <= '0';
      end if;
      s_pending_reqs_a <= v_req_count_a;

      -- Update the number of pending requests for master B.
      v_req_count_b := s_pending_reqs_b;
      if s_req_validated_b = '1' and s_ack_from_slave_b = '0' and s_stall_from_slave_b = '0' then
        v_req_count_b := v_req_count_b + 1;
      elsif (s_req_validated_b = '0' or (s_req_validated_b = '1' and s_stall_from_slave_b = '1'))
            and s_ack_from_slave_b = '1' then
        v_req_count_b := v_req_count_b - 1;
      end if;
      if v_req_count_b = 0 then
        s_pending_reqs_is_0_b <= '1';
      else
        s_pending_reqs_is_0_b <= '0';
      end if;
      if v_req_count_b = 1 then
        s_pending_reqs_is_1_b <= '1';
      else
        s_pending_reqs_is_1_b <= '0';
      end if;
      if v_req_count_b = C_MAX_PENDING_REQS then
        s_pending_reqs_is_max_b <= '1';
      else
        s_pending_reqs_is_max_b <= '0';
      end if;
      s_pending_reqs_b <= v_req_count_b;

      -- Update the active ports.
      s_active_port_a <= s_next_port_a;
      s_active_port_b <= s_next_port_b;

      -- Remember the last CYC state for the slaves.
      s_last_cyc_0 <= s_cyc_0;
      s_last_cyc_1 <= s_cyc_1;
      s_last_cyc_2 <= s_cyc_2;
      s_last_cyc_3 <= s_cyc_3;
    end if;
  end process;
end rtl;
