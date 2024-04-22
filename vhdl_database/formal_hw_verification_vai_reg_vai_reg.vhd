library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity vai_reg is
  generic (
    Formal : boolean := true
  );
  port (
    Reset_n_i    : in  std_logic;
    Clk_i        : in  std_logic;
    -- req
    Din_i        : in  std_logic_vector(7 downto 0);
    DinValid_i   : in  std_logic;
    DinStart_i   : in  std_logic;
    DinStop_i    : in  std_logic;
    DinAccept_o  : out std_logic;
    -- ack
    Dout_o       : out std_logic_vector(7 downto 0);
    DoutValid_o  : out std_logic;
    DoutStart_o  : out std_logic;
    DoutStop_o   : out std_logic;
    DoutAccept_i : in  std_logic
  );
end entity vai_reg;



architecture rtl of vai_reg is


  constant C_READ  : std_logic_vector(3 downto 0) := x"0";
  constant C_WRITE : std_logic_vector(3 downto 0) := x"1";

  type t_fsm_state is (IDLE, GET_HEADER, GET_DATA,
                       SET_DATA, SEND_HEADER, SEND_DATA, SEND_FOOTER);
  signal s_fsm_state : t_fsm_state;

  type t_register is array(0 to 7) of std_logic_vector(7 downto 0);
  signal s_register : t_register;

  signal s_header : std_logic_vector(7 downto 0);
  signal s_data   : std_logic_vector(7 downto 0);

  signal s_error : boolean;
  signal s_dout_accepted : boolean;

  alias a_addr : std_logic_vector(3 downto 0) is s_header(7 downto 4);


begin


  s_dout_accepted <= (DoutValid_o and DoutAccept_i) = '1';


  process (Reset_n_i, Clk_i) is
  begin
    if (Reset_n_i = '0') then
      DinAccept_o <= '0';
      DoutStart_o <= '0';
      DoutStop_o  <= '0';
      DoutValid_o <= '0';
      Dout_o      <= (others => '0');
      s_header    <= (others => '0');
      s_data      <= (others => '0');
      s_register  <= (others => (others => '0'));
      s_error     <= false;
      s_fsm_state <= IDLE;
    elsif (rising_edge(Clk_i)) then
      case s_fsm_state is

        when IDLE =>
          DinAccept_o <= '0';
          DoutStart_o <= '0';
          DoutStop_o  <= '0';
          DoutValid_o <= '0';
          Dout_o      <= (others => '0');
          s_header    <= (others => '0');
          s_data      <= (others => '0');
          s_error     <= false;
          DinAccept_o <= '1';
          s_fsm_state <= GET_HEADER;

        when GET_HEADER =>
          if (DinValid_i = '1' and DinStart_i = '1') then
            s_header <= Din_i;
            if (Din_i(3 downto 0) = C_READ and DinStop_i = '1') then
              DinAccept_o <= '0';
              s_fsm_state <= GET_DATA;
            elsif (Din_i(3 downto 0) = C_WRITE and DinStop_i = '0') then
              s_fsm_state <= SET_DATA;
            else
              DinAccept_o <= '0';
              s_fsm_state <= IDLE;
            end if;
          end if;

        when GET_DATA =>
          if (unsigned(a_addr) <= 7) then
            s_data <= s_register(to_integer(unsigned(a_addr)));
          else
            s_error <= true;
            s_data  <= (others => '0');
          end if;
          s_fsm_state <= SEND_HEADER;

        when SET_DATA =>
          if (DinValid_i = '1') then
            DinAccept_o <= '0';
            if (DinStop_i = '1') then
              if (unsigned(a_addr) <= 7) then
                s_register(to_integer(unsigned(a_addr))) <= Din_i;
              else
                s_error <= true;
              end if;
              s_fsm_state <= SEND_HEADER;
            else
              s_fsm_state <= IDLE;
            end if;
          end if;

        when SEND_HEADER =>
          DoutValid_o <= '1';
          DoutStart_o <= '1';
          Dout_o      <= s_header;
          if (s_dout_accepted) then
            DoutValid_o <= '0';
            DoutStart_o <= '0';
            if (s_header(3 downto 0) = C_WRITE) then
              s_fsm_state <= SEND_FOOTER;
            else
              s_fsm_state <= SEND_DATA;
            end if;
          end if;

        when SEND_DATA =>
          DoutValid_o <= '1';
          Dout_o      <= s_data;
          if (s_dout_accepted) then
            DoutValid_o <= '0';
            s_fsm_state <= SEND_FOOTER;
          end if;

        when SEND_FOOTER =>
          DoutValid_o <= '1';
          DoutStop_o  <= '1';
          Dout_o      <= x"01" when s_error else x"00";
          if (s_dout_accepted) then
            Dout_o      <= (others => '0');
            DoutValid_o <= '0';
            DoutStop_o  <= '0';
            s_fsm_state <= IDLE;
          end if;

        when others => null;

      end case;
    end if;
  end process;



  FormalG : if Formal generate


    signal s_addr : natural range 0 to 15;

    type t_cmd is (READ, WRITE, NOP);
    signal s_cmd : t_cmd;


  begin


    -- VHDL helper logic
    process is
    begin
      wait until rising_edge(Clk_i);
      if (s_fsm_state = GET_HEADER) then
        if (DinValid_i = '1' and DinStart_i = '1') then
          s_cmd  <= READ  when Din_i(3 downto 0) = x"0" else
                    WRITE when Din_i(3 downto 0) = x"1" else
                    NOP;
          s_addr <= to_integer(unsigned(Din_i(7 downto 4)));
        end if;
      end if;
    end process;


    default clock is rising_edge(Clk_i);

    -- RESTRICTIONS

    -- Initial reset
    INITIAL_RESET : restrict {not Reset_n_i[*2]; Reset_n_i[+]}[*1];


    -- CONSTRAINTS

    -- Inputs are low during reset for simplicity
    ASSUME_INPUTS_DURING_RESET : assume always
      not Reset_n_i ->
      not DinValid_i and
      not DinStart_i and
      not DinStop_i  and
      not DoutAccept_i;

    -- Valid stable until accepted
    JOB_REQ_VALID_STABLE : assume always
      DinValid_i and not DinAccept_o -> next (stable(DinValid_i) until_ DinAccept_o);

    -- Start stable until accepted
    JOB_REQ_START_STABLE : assume always
      DinValid_i and not DinAccept_o -> next (stable(DinStart_i) until_ DinAccept_o);

    -- Stop stable until accepted
    JOB_REQ_STOP_STABLE : assume always
      DinValid_i and not DinAccept_o -> next (stable(DinStop_i) until_ DinAccept_o);

    -- Data stable until accepted
    JOB_REQ_DIN_STABLE : assume always
      DinValid_i and not DinAccept_o -> next (stable(Din_i) until_ DinAccept_o);


    -- ASSERTIONS

    -- Asynchronous (unclocked) Reset asserts
    AFTER_RESET : process (all) is
    begin
      if (not Reset_n_i) then
        RESET_STATE  : assert s_fsm_state = IDLE;
        RESET_ACCEPT : assert DinAccept_o = '0';
        RESET_START  : assert DoutStart_o = '0';
        RESET_STOP   : assert DoutStop_o = '0';
        RESET_VALID  : assert DoutValid_o = '0';
        RESET_REG    : assert s_register = (0 to 7 => x"00");
      end if;
    end process AFTER_RESET;

    -- FSM states in valid range
    FSM_STATES_VALID : assert always
      s_fsm_state = IDLE or s_fsm_state = GET_HEADER or
      s_fsm_state = GET_DATA or s_fsm_state = SET_DATA or
      s_fsm_state = SEND_HEADER or s_fsm_state = SEND_DATA or
      s_fsm_state = SEND_FOOTER;

    -- Discard jobs with invalid command
    INV_CMD_DISCARD : assert always
      s_fsm_state = GET_HEADER and DinValid_i = '1' and DinStart_i = '1' and
      Din_i(3 downto 0) /= x"0" and Din_i(3 downto 0) /= x"1"
      ->
      next s_fsm_state = IDLE;

    -- Discard read job with invalid stop flags
    READ_INV_FLAGS_DISCARD : assert always
      s_fsm_state = GET_HEADER and DinValid_i = '1' and DinStart_i = '1' and
      Din_i(3 downto 0) = x"0" and DinStop_i = '0'
      ->
      next s_fsm_state = IDLE;

    -- Discard write job with invalid stop flags
    WRITE_INV_FLAGS_DISCARD : assert always
      s_fsm_state = GET_HEADER and DinValid_i = '1' and DinStart_i = '1' and
      Din_i(3 downto 0) = x"1" and DinStop_i = '1'
      ->
      next s_fsm_state = IDLE;

    -- After a valid job read request,
    -- a job read acknowledge has to follow
    READ_VALID_ACK : assert always
      {s_fsm_state = GET_HEADER and DinValid_i = '1' and DinStart_i = '1' and
       Din_i(3 downto 0) = x"0" and DinStop_i = '1'}
      |=>
      {-- Job ack header cycle
       not DoutValid_o [*];
       DoutValid_o and DoutStart_o and not DoutAccept_i [*];
       DoutValid_o and DoutStart_o and DoutAccept_i;
       -- Job ack data cycle
       not DoutValid_o [*];
       DoutValid_o and not DoutStart_o and not DoutStop_o and not DoutAccept_i [*];
       DoutValid_o and not DoutStart_o and not DoutStop_o and DoutAccept_i;
       -- Job ack footer cycle
       not DoutValid_o [*];
       DoutValid_o and DoutStop_o};

    -- After a valid job write request,
    -- a job read acknowledge has to follow
    WRITE_VALID_ACK : assert always
      {s_fsm_state = GET_HEADER and DinValid_i = '1' and DinStart_i = '1' and
       Din_i(3 downto 0) = x"1" and DinStop_i = '0';
       not DinValid_i [*];
       DinValid_i and DinStop_i}
      |=>
      {-- Job ack header cycle
       not DoutValid_o [*];
       DoutValid_o and DoutStart_o and not DoutAccept_i [*];
       DoutValid_o and DoutStart_o and DoutAccept_i;
       -- Job ack footer cycle
       not DoutValid_o [*];
       DoutValid_o and DoutStop_o};

     -- Start & stop flag have to be exclusive
     JOB_ACK_NEVER_START_STOP : assert never
       DoutStart_o and DoutStop_o;

     -- Start & Stop have to be active together with valid
     JOB_ACK_START_STOP_VALID : assert always
       DoutStart_o or DoutStop_o -> DoutValid_o;

     -- Valid has to be stable until accepted
     JOB_ACK_VALID_STABLE : assert always
       DoutValid_o and not DoutAccept_i -> next (stable(DoutValid_o) until_ DoutAccept_i);

     -- Start has to be stable until accepted
     JOB_ACK_START_STABLE : assert always
       DoutValid_o and not DoutAccept_i -> next (stable(DoutStart_o) until_ DoutAccept_i);

     -- Stop has to be stable until accepted
     JOB_ACK_STOP_STABLE : assert always
       DoutValid_o and not DoutAccept_i -> next (stable(DoutStop_o) until_ DoutAccept_i);

     -- Data has to be stable until accepted
     JOB_ACK_DOUT_STABLE : assert always
       DoutValid_o and not DoutAccept_i -> next (stable(Dout_o) until_ DoutAccept_i);

    -- Data from selected address has to be read
    READ_DATA : assert always
      DoutValid_o and not DoutStart_o and not DoutStop_o and s_addr <= 7
      ->
      Dout_o = s_register(s_addr);

    -- 0 has to be read when invalid address is given
    READ_DATA_INV_ADDR : assert always
      DoutValid_o and not DoutStart_o and not DoutStop_o and s_addr > 7
      ->
      Dout_o = x"00";

    -- Register has to be written at given address with given data
    -- when correct job req write occurs
    WRITE_DATA : assert always
      -- Job req header cycle
      {s_fsm_state = GET_HEADER and DinValid_i = '1' and DinStart_i = '1' and
       Din_i(3 downto 0) = x"1" and unsigned(Din_i(7 downto 4)) <= 7 and DinStop_i = '0';
       -- Job req data / footer cycle
       not DinValid_i [*];
       DinValid_i and not DinStart_i and DinStop_i and not DinAccept_o [*];
       DinValid_i and not DinStart_i and DinStop_i and DinAccept_o}
      |=>
      {s_register(s_addr) = prev(Din_i)};


    -- FUNCTIONAL COVERAGE

    FOOTER_VALID : cover {DoutValid_o = '1' and DoutStop_o = '1' and Dout_o = 8x"0"};
    FOOTER_ERR   : cover {DoutValid_o = '1' and DoutStop_o = '1' and Dout_o = 8x"1"};


  end generate FormalG;


end architecture rtl;

