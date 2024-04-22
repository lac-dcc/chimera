--------------------------------------------------------------------/
----                                                             ----
----  Packet Disassembler                                        ----
----  Disassembles Token and Data USB packets                    ----
----                                                             ----
----  Author: Rudolf Usselmann                                   ----
----          rudi@asics.ws                                      ----
----  Conversion to VHDL from Verilog by Alvaro Lopes            ----
----          alvieboy@alvie.com                                 ----
----                                                             ----
----  Downloaded from: http://www.opencores.org/cores/usb1_funct ----
----                                                             ----
---------------------------------------------------------------------
----                                                             ----
---- Copyright (C) 2000-2002 Rudolf Usselmann                    ----
----                         www.asics.ws                        ----
----                         rudi@asics.ws                       ----
----                                                             ----
---- This source file may be used and distributed without        ----
---- restriction provided that this copyright statement is not   ----
---- removed from the file and that any derivative work contains ----
---- the original copyright notice and the associated disclaimer.----
----                                                             ----
----     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ----
---- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ----
---- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ----
---- FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ----
---- OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ----
---- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ----
---- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ----
---- GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ----
---- BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ----
---- LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ----
---- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ----
---- OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ----
---- POSSIBILITY OF SUCH DAMAGE.                                 ----
----                                                             ----
---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity usb1_pd is
  port (
    clk:    in std_logic;
    rst:    in std_logic;

		-- UTMI RX I/F
		rx_data:    in std_logic_vector(7 downto 0);
    rx_valid:   in std_logic;
    rx_active:  in std_logic;
    rx_err:     in std_logic;

		-- PID Information
		pid_OUT:    out std_logic;
    pid_IN:    out std_logic;
    pid_SOF:    out std_logic;
    pid_SETUP:    out std_logic;
		pid_DATA0:    out std_logic;
    pid_DATA1:    out std_logic;
    pid_DATA2:    out std_logic;
    pid_MDATA:    out std_logic;
		pid_ACK:    out std_logic;
    pid_NACK:    out std_logic;
    pid_STALL:    out std_logic;
    pid_NYET:    out std_logic;
		pid_PRE:    out std_logic;
    pid_ERR:    out std_logic;
    pid_SPLIT:    out std_logic;
    pid_PING:    out std_logic;
		pid_cks_err:    out std_logic;

		-- Token Information
		token_fadr:    out std_logic_vector(6 downto 0);
    token_endp:    out std_logic_vector(3 downto 0);
    token_valid:    out std_logic;
    crc5_err:    out std_logic;
		frame_no:     out std_logic_vector(10 downto 0);

		-- Receive Data Output
		rx_data_st:     out std_logic_vector(7 downto 0);
    rx_data_valid:    out std_logic;
    rx_data_done:    out std_logic;
    crc16_err:    out std_logic;

		-- Misc.
		seq_err:    out std_logic;
    rx_busy:    out std_logic
	);
end entity usb1_pd;

architecture behave of usb1_pd is

-- Local Wires and Registers
--
type state_type is ( IDLE, ACTIVE, TOKEN, DATA );

signal state: state_type;
signal pid: std_logic_vector(7 downto 0);
signal pid_le_sm:   std_logic;
signal pid_ld_en:   std_logic;
--signal pid_cks_err: std_logic;

signal token0, token1: std_logic_vector(7 downto 0);		-- Token Registers
signal token_le_1, token_le_2: std_logic;	-- Latch enables for token storage registers
signal token_crc5: std_logic_vector(4 downto 0);

signal	d0, d1, d2: std_logic_vector(7 downto 0);		-- Data path delay line (used to filter out crcs)
signal data_valid_d: std_logic;		-- Data Valid output from State Machine
signal data_done: std_logic;		-- Data cycle complete output from State Machine
signal data_valid0: std_logic; 		-- Data valid delay line
signal rxv1: std_logic;
signal rxv2: std_logic;

--signal seq_err: std_logic;		-- State machine sequence error

--signal pid_ack: std_logic;

signal token_valid_r1, token_valid_str1, token_valid_str2: std_logic;

signal rx_active_r: std_logic;

signal crc5_out, crc5_out2: std_logic_vector(4 downto 0);
signal crc16_clr: std_logic;
signal crc16_sum, crc16_out: std_logic_vector(15 downto 0);

-- PID Encodings
constant USBF_T_PID_OUT		: std_logic_vector(3 downto 0) := "0001";
constant USBF_T_PID_IN		: std_logic_vector(3 downto 0) := "1001";
constant USBF_T_PID_SOF		: std_logic_vector(3 downto 0) := "0101";
constant USBF_T_PID_SETUP	: std_logic_vector(3 downto 0) := "1101";
constant USBF_T_PID_DATA0	: std_logic_vector(3 downto 0) := "0011";
constant USBF_T_PID_DATA1	: std_logic_vector(3 downto 0) := "1011";
constant USBF_T_PID_DATA2	: std_logic_vector(3 downto 0) := "0111";
constant USBF_T_PID_MDATA	: std_logic_vector(3 downto 0) := "1111";
constant USBF_T_PID_ACK		: std_logic_vector(3 downto 0) := "0010";
constant USBF_T_PID_NACK		: std_logic_vector(3 downto 0) := "1010";
constant USBF_T_PID_STALL	: std_logic_vector(3 downto 0) := "1110";
constant USBF_T_PID_NYET		: std_logic_vector(3 downto 0) := "0110";
constant USBF_T_PID_PRE		: std_logic_vector(3 downto 0) := "1100";
constant USBF_T_PID_ERR		: std_logic_vector(3 downto 0) := "1100";
constant USBF_T_PID_SPLIT	: std_logic_vector(3 downto 0) := "1000";
constant USBF_T_PID_PING		: std_logic_vector(3 downto 0) := "0100";
constant USBF_T_PID_RES		: std_logic_vector(3 downto 0) := "0000";

signal pid_RES: std_logic;
signal pid_TOKEN: std_logic;
signal pid_DATA: std_logic;

signal pid_OUT_i, pid_IN_i,
  pid_SOF_i, pid_SETUP_i,
  pid_PING_i, pid_DATA0_i,
  pid_DATA1_i, pid_DATA2_i,
  pid_MDATA_i, pid_ACK_i: std_logic;


------------------------------------------------------------------/
--
-- Misc Logic
--

signal	rx_busy_d: std_logic;
signal token_valid_i: std_logic;
signal token_fadr_i:  std_logic_vector(6 downto 0);
signal token_endp_i:  std_logic_vector(3 downto 0);

signal crc5_din: std_logic_vector(10 downto 0);
signal crc16_in: std_logic_vector(7 downto 0);
signal pid_ack_q: std_logic;

begin

token_valid <= token_valid_i;
token_fadr  <= token_fadr_i;
token_endp  <= token_endp_i;

pid_OUT <= pid_OUT_i;
pid_IN  <= pid_IN_i;
pid_SOF <= pid_SOF_i;
pid_SETUP <= pid_SETUP_i;
pid_PING  <= pid_PING_i;
pid_DATA0 <= pid_DATA0_i;
pid_DATA1 <= pid_DATA1_i;
pid_DATA2 <= pid_DATA2_i;
pid_MDATA <= pid_MDATA_i;
pid_ACK <= pid_ACK_i;


process(clk,rst)
begin
  if rst='0' then
    rx_busy_d <= '0';
  elsif rising_edge(clk) then
	  if (rx_valid='1' and (state = DATA))	then
      rx_busy_d <= '1';
	  elsif(state /= DATA) then
      rx_busy_d <= '0';
    end if;
  end if;
end process;

process(clk)
begin
  if rising_edge(clk) then
	  rx_busy <= rx_busy_d;
  end if;
end process;

-- PID Decoding Logic
pid_ld_en <= pid_le_sm and rx_active and rx_valid;


process(clk,rst)
begin
  if rst='0' then
    pid <= x"f0";
  elsif rising_edge(clk) then
    if pid_ld_en='1' then
      pid <= rx_data;
    end if;
  end if;
end process;

pid_cks_err <= '1' when (pid(3 downto 0) /= not (pid(7 downto 4))) else '0';

	pid_OUT_i   <='1' when pid(3 downto 0) = USBF_T_PID_OUT else '0';
	pid_IN_i    <='1' when pid(3 downto 0) = USBF_T_PID_IN else '0';
	pid_SOF_i   <='1' when pid(3 downto 0) = USBF_T_PID_SOF else '0';
	pid_SETUP_i <='1' when pid(3 downto 0) = USBF_T_PID_SETUP else '0';
	pid_DATA0_i <='1' when pid(3 downto 0) = USBF_T_PID_DATA0 else '0';
	pid_DATA1_i <='1' when pid(3 downto 0) = USBF_T_PID_DATA1 else '0';
	pid_DATA2_i <='1' when pid(3 downto 0) = USBF_T_PID_DATA2 else '0';
	pid_MDATA_i <='1' when pid(3 downto 0) = USBF_T_PID_MDATA else '0';
	pid_ACK_i   <='1' when pid(3 downto 0) = USBF_T_PID_ACK else '0';
	pid_NACK  <='1' when pid(3 downto 0) = USBF_T_PID_NACK else '0';
	pid_STALL <='1' when pid(3 downto 0) = USBF_T_PID_STALL else '0';
	pid_NYET  <='1' when pid(3 downto 0) = USBF_T_PID_NYET else '0';
	pid_PRE   <='1' when pid(3 downto 0) = USBF_T_PID_PRE else '0';
	pid_ERR   <='1' when pid(3 downto 0) = USBF_T_PID_ERR else '0';
	pid_SPLIT <='1' when pid(3 downto 0) = USBF_T_PID_SPLIT else '0';
	pid_PING_i  <='1' when pid(3 downto 0) = USBF_T_PID_PING else '0';
	pid_RES   <='1' when pid(3 downto 0) = USBF_T_PID_RES else '0';

	pid_TOKEN <= pid_OUT_i or pid_IN_i or pid_SOF_i or pid_SETUP_i or pid_PING_i;
	pid_DATA <= pid_DATA0_i or pid_DATA1_i or pid_DATA2_i or pid_MDATA_i;


process(clk)
begin
  if rising_edge(clk) then
    if(token_le_1='1') then token0 <= rx_data; end if;
    if(token_le_2='1') then token1 <= rx_data; end if;
    token_valid_r1 <= token_le_2;
    token_valid_str1 <= token_valid_r1 or pid_ack_q;
    token_valid_str2 <= token_valid_str1;
  end if;
end process;

token_valid_i <= token_valid_str1;

-- CRC 5 should perform the check in one cycle (flow through logic)
-- 11 bits and crc5 input, 1 bit output
crc5_err <= '1' when token_valid_i='1' and (crc5_out2 /= token_crc5) else '0';

crc5_din <= token_fadr_i(0) &
			token_fadr_i(1) &
			token_fadr_i(2) &
			token_fadr_i(3) &
			token_fadr_i(4) &
			token_fadr_i(5) &
			token_fadr_i(6) &
			token_endp_i(0) &
			token_endp_i(1) &
			token_endp_i(2) &
			token_endp_i(3);

u0: entity work.usb1_crc5
  port map (
	  crc_in => "11111",
	  din => crc5_din,
	  crc_out => crc5_out
  );

-- Invert and reverse result bits
crc5_out2 <= not ( crc5_out(0)&crc5_out(1)&crc5_out(2)&crc5_out(3)&crc5_out(4) );

frame_no <=  token1(2 downto 0) & token0;
token_fadr_i <= token0(6 downto 0);
token_endp_i <= token1(2 downto 0) & token0(7);
token_crc5 <= token1(7 downto 3);

process(clk,rst)
begin
  if rst='0' then
    rxv1 <= '0';
    rxv2 <= '0';
  elsif rising_edge(clk) then
	  if(data_valid_d='1') then
      rxv1 <= '1';
	  elsif (data_done='1')	then
      rxv1 <= '0';
    end if;
  	if(rxv1='1' and data_valid_d='1')	then
      rxv2 <= '1';
	  elsif (data_done='1')	then
      rxv2 <= '0';
    end if;
  end if;
end process;


process(clk)
begin
  if rising_edge(clk) then
	  data_valid0 <= rxv2 and data_valid_d;
	  if(data_valid_d='1')	then
      d0 <=  rx_data;
	    d1 <=  d0;
      d2 <=  d1;
    end if;

	  rx_active_r <= rx_active;

	  if(crc16_clr='1') then
      crc16_sum <= x"FFFF";
	  else
	    if(data_valid_d='1') then
        crc16_sum <= crc16_out;
      end if;
    end if;
  end if;
end process;

rx_data_st <= d2;
rx_data_valid <= data_valid0;
rx_data_done <= data_done;

crc16_clr <= rx_active and not rx_active_r;

crc16_in <= rx_data(0) & rx_data(1) & rx_data(2) & rx_data(3) & rx_data(4) & rx_data(5) & rx_data(6) & rx_data(7);

u1: entity work.usb1_crc16
  port map (
    crc_in => crc16_sum,
	  din => crc16_in,
	  crc_out => crc16_out
  );

-- Verify against polynomial 
crc16_err <= '1' when data_done='1' and (crc16_sum /= x"800d") else '0';

------------------------------------------------------------------/
--
-- Receive/Decode State machine
--

process (clk, rst, state, rx_valid, rx_active, rx_err, pid_ACK_i, pid_TOKEN, pid_DATA)
  variable next_state: state_type;
begin
	next_state := state;	-- Default don't change current state
	pid_le_sm <= '0';
	token_le_1 <= '0';
	token_le_2 <= '0';
	data_valid_d <= '0';
	data_done <= '0';
	seq_err <= '0';
	pid_ack_q <= '0';
	case state is
	  when IDLE =>
			pid_le_sm <= '1';
			if (rx_valid='1' and rx_active='1')	then
        next_state := ACTIVE;
		  end if;
	  when ACTIVE =>
			if (pid_ACK_i='1' and rx_err='0') then
				pid_ack_q <= '1';
				--if rx_active='0' then
          next_state := IDLE;
			  --end if;
			elsif ( pid_TOKEN='1' and rx_valid='1' and rx_active='1' and rx_err='0') then
				token_le_1 <= '1';
				next_state := TOKEN;
			elsif (pid_DATA='1' and rx_valid='1' and rx_active='1' and rx_err='0') then
				data_valid_d <= '1';
				next_state := DATA;
			elsif( rx_active='0' or rx_err='1' or (rx_valid='1' and not (pid_TOKEN='1' or pid_DATA='1')) ) then
				seq_err <= not rx_err;
				if (rx_active='0') then
          next_state := IDLE;
			  end if;
		  end if;

	  when TOKEN =>
			if (rx_valid='1' and rx_active='1' and rx_err='0') then
				token_le_2 <= '1';
				next_state := IDLE;
			elsif( rx_active='0' or rx_err='1' )	then -- ERROR
				seq_err <= not rx_err;
				if (rx_active='0') then
          next_state := IDLE;
        end if;
      end if;

	  when DATA =>
			if (rx_valid='1' and rx_active='1' and rx_err='0') then
        data_valid_d <= '1';
      end if;

      if (rx_active='0' or rx_err='1') then
				data_done <= '1';
				if (rx_active='0') then
          next_state := IDLE;
			  end if;
		  end if;
    end case;
    if rst='0' then
      next_state := IDLE;
    end if;
    if rising_edge(clk) then
      state <= next_state;
    end if;
  end process;

end behave;
