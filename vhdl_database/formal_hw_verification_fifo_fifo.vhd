library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity fifo is
  generic (
    Formal : boolean := true;
    Depth  : positive := 16;
    Width  : positive := 16
  );
  port (
    Reset_n_i    : in  std_logic;
    Clk_i        : in  std_logic;
    -- write
    Wen_i        : in  std_logic;
    Din_i        : in  std_logic_vector(Width-1 downto 0);
    Full_o       : out std_logic;
    Werror_o     : out std_logic;
    -- read
    Ren_i        : in  std_logic;
    Dout_o       : out std_logic_vector(Width-1 downto 0);
    Empty_o      : out std_logic;
    Rerror_o     : out std_logic
  );
end entity fifo;


architecture rtl of fifo is


  subtype t_fifo_pnt is natural range 0 to Depth-1;
  signal s_write_pnt : t_fifo_pnt;
  signal s_read_pnt  : t_fifo_pnt;

  type t_fifo_mem is array (t_fifo_pnt'low to t_fifo_pnt'high) of std_logic_vector(Din_i'range);
  signal s_fifo_mem : t_fifo_mem;

  signal s_almost_full  : boolean;
  signal s_almost_empty : boolean;

  function incr_pnt (data : t_fifo_pnt) return t_fifo_pnt is
  begin
    if (data = t_fifo_mem'high) then
      return 0;
    end if;
    return data + 1;
  end function incr_pnt;


begin


  s_almost_full <= (s_write_pnt = s_read_pnt - 1) or
                   (s_write_pnt = t_fifo_mem'high and s_read_pnt = t_fifo_mem'low);

  s_almost_empty <= (s_read_pnt = s_write_pnt - 1) or
                    (s_read_pnt = t_fifo_mem'high and s_write_pnt = t_fifo_mem'low);

  WriteP : process (Reset_n_i, Clk_i) is
  begin
    if (Reset_n_i = '0') then
      s_write_pnt <= 0;
      Werror_o    <= '0';
    elsif (rising_edge(Clk_i)) then
      Werror_o <= Wen_i and Full_o;
      if (Wen_i = '1' and Full_o = '0') then
        s_fifo_mem(s_write_pnt) <= Din_i;
        s_write_pnt <= incr_pnt(s_write_pnt);
      end if;
    end if;
  end process WriteP;


  ReadP : process (Reset_n_i, Clk_i) is
  begin
    if (Reset_n_i = '0') then
      s_read_pnt <= 0;
      Rerror_o   <= '0';
    elsif (rising_edge(Clk_i)) then
      Rerror_o <= Ren_i and Empty_o;
      if (Ren_i = '1' and Empty_o = '0') then
        Dout_o <= s_fifo_mem(s_read_pnt);
        s_read_pnt <= incr_pnt(s_read_pnt);
      end if;
    end if;
  end process ReadP;


  FlagsP : process (Reset_n_i, Clk_i) is
  begin
    if (Reset_n_i = '0') then
      Full_o  <= '0';
      Empty_o <= '1';
    elsif (rising_edge(Clk_i)) then
      if (Wen_i = '1') then
        if (Ren_i = '0' and s_almost_full) then
          Full_o <= '1';
        end if;
        Empty_o <= '0';
      end if;
      if (Ren_i = '1') then
        if (Wen_i = '0' and s_almost_empty) then
          Empty_o <= '1';
        end if;
        Full_o <= '0';
      end if;
    end if;
  end process FlagsP;


  FormalG : if Formal generate

    attribute anyconst : boolean;
    signal s_data : std_logic_vector(Width-1 downto 0);
    attribute anyconst of s_data : signal is true;

    signal s_cnt : natural range 0 to Depth;

  begin


    default clock is rising_edge(Clk_i);


    -- Initial reset
    RESTRICT_RESET : restrict
      {not Reset_n_i[*3]; Reset_n_i[+]}[*1];

    -- Inputs are low during reset for simplicity
    ASSUME_INPUTS_DURING_RESET : assume always
      not Reset_n_i ->
      not Wen_i and not Ren_i;


    -- Asynchronous (unclocked) Reset asserts
    FULL_RESET : process (all) is
    begin
      if (not Reset_n_i) then
        RESET_FULL      : assert not Full_o;
        RESET_EMPTY     : assert Empty_o;
        RESET_WERROR    : assert not Werror_o;
        RESET_RERROR    : assert not Rerror_o;
        RESET_WRITE_PNT : assert s_write_pnt = 0;
        RESET_READ_PNT  : assert s_read_pnt = 0;
      end if;
    end process;


    -- No write pointer change when writing into full fifo
    WRITE_PNT_STABLE_WHEN_FULL : assert always
      Wen_i and Full_o ->
      next stable(s_write_pnt);

    -- No read pointer change when reading from empty fifo
    READ_PNT_STABLE_WHEN_EMPTY : assert always
      Ren_i and Empty_o ->
      next stable(s_read_pnt);

    -- Full when write and no read and write pointer ran up to read pointer
    FULL : assert always
      Wen_i and not Ren_i and
      (s_write_pnt = s_read_pnt - 1 or s_write_pnt = t_fifo_pnt'high and s_read_pnt = t_fifo_pnt'low) ->
      next Full_o;

    -- Not full when read
    NOT_FULL : assert always
      Ren_i ->
      next not Full_o;

    -- Empty when read and no write and read pointer ran up to write pointer
    EMPTY : assert always
      not Wen_i and Ren_i and
      (s_read_pnt = s_write_pnt - 1 or s_read_pnt = t_fifo_pnt'high and s_write_pnt = t_fifo_pnt'low) ->
      next Empty_o;

    -- Not empty when write
    NOT_EMPTY : assert always
      Wen_i ->
      next not Empty_o;

    -- Write error when writing into full fifo
    WERROR : assert always
      Wen_i and Full_o ->
        next Werror_o;

    -- No write error when fifo not full
    NO_WERROR : assert always
      not Full_o ->
        next not Werror_o;

    -- Read error when reading from empty fifo
    RERROR : assert always
      Ren_i and Empty_o ->
      next Rerror_o;

    -- No read error when fifo not empty
    NO_RERROR : assert always
      not Empty_o ->
      next not Rerror_o;

    -- Write pointer increment when writing into not full fifo
    -- and write pointer isn't at end value
    WRITE_PNT_INCR : assert always
      Wen_i and not Full_o and s_write_pnt /= t_fifo_pnt'high ->
      next s_write_pnt = prev(s_write_pnt) + 1;

    -- Write pointer wraparound when writing into not full fifo
    -- and write pointer is at end value
    WRITE_PNT_WRAP : assert always
      Wen_i and not Full_o and s_write_pnt = t_fifo_pnt'high ->
      next s_write_pnt = 0;

    -- Read pointer increment when reading from not empty fifo
    -- and read pointer isn't at end value
    READ_PNT_INCR  : assert always
      Ren_i and not Empty_o and s_read_pnt /= t_fifo_pnt'high ->
      next s_read_pnt = prev(s_read_pnt) + 1;

    -- Read pointer wraparound when reading from not empty fifo
    -- and read pointer is at end value
    READ_PNT_WRAP  : assert always
      Ren_i and not Empty_o and s_read_pnt = t_fifo_pnt'high ->
      next s_read_pnt = 0;

    -- Correct input data stored after valid write access
    DIN_VALID : assert always
      Wen_i and not Full_o ->
      next s_fifo_mem(s_write_pnt - 1) = prev(Din_i);

    -- Correct output data after valid read access
    DOUT_VALID : assert always
      Ren_i and not Empty_o ->
      next Dout_o = s_fifo_mem(s_read_pnt - 1);

    -- Fillstate calculation
    process (Clk_i) is
    begin
      if Reset_n_i = '0' then
        s_cnt <= 0;
      elsif rising_edge(Clk_i) then
        if Wen_i = '1' and Full_o = '0' and (Ren_i = '0' or Empty_o = '1') then
          s_cnt <= s_cnt + 1;
        elsif Ren_i = '1' and Empty_o = '0' and (Wen_i = '0' or Full_o = '1') then
          s_cnt <= s_cnt - 1;
        end if;
      end if;
    end process;

    -- Data flow checks
    -- GHDL only allows numerals in repetition operators
    -- so we have to use separate checks for each fill state 
    DATA_FLOW_0 : assert always
      {{s_cnt = 0 and Wen_i = '1' and Din_i = s_data} ; {Ren_i[->1]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_1 : assert always
      {{s_cnt = 1 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->2]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_2 : assert always
      {{s_cnt = 2 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->3]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_3 : assert always
      {{s_cnt = 3 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->4]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_4 : assert always
      {{s_cnt = 4 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->5]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_5 : assert always
      {{s_cnt = 5 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->6]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_6 : assert always
      {{s_cnt = 6 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->7]}}
      |=> {Dout_o = s_data};

    DATA_FLOW_7 : assert always
      {{s_cnt = 7 and Wen_i = '1' and Din_i = s_data} : {Ren_i[->8]}}
      |=> {Dout_o = s_data};


    -- An alternative for GHDL: Replacing the [->] goto operator
    -- by counting Ren_i starting when s_data is written into fifo.
    -- The properties have to be slightly modified only.
    -- Sadly proving these needs much more (engine dependend) time than
    -- the separate checks above. I assume the counters are the reason.
    gen_data_checks : for i in 0 to Depth-1 generate

    begin

      GEN : if i = 0 generate

        DATA_FLOW_GEN : assert always
          {{s_cnt = i and Wen_i = '1' and Din_i = s_data} ; {not Ren_i[*]; Ren_i}}
          |=> {Dout_o = s_data};

      else generate

        signal s_ren_cnt : integer range -1 to i+1 := -1;

      begin

        process (Reset_n_i, Clk_i) is
        begin
          if not Reset_n_i then
            s_ren_cnt <= -1;
          elsif (rising_edge(Clk_i)) then
            if s_cnt = i and Wen_i = '1' and Din_i = s_data then
              s_ren_cnt <= 1 when Ren_i else 0;
            else
              s_ren_cnt <= s_ren_cnt + 1 when Ren_i = '1' and s_ren_cnt >= 0;
            end if;
          end if;
        end process;

        DATA_FLOW_GEN : assert always
          {{s_cnt = i and Wen_i = '1' and Din_i = s_data} : {Ren_i[*]; s_ren_cnt = i+1}}
          |-> {Dout_o = s_data};

      end generate GEN;

    end generate gen_data_checks;

  end generate FormalG;


end architecture rtl;
