-- Felipe Machado
-- Departamento de Teconologia Electronica
-- Universidad Rey Juan Carlos
-- http://gtebim.es

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


library WORK;
use WORK.GRAL_PKG.ALL;
use WORK.VGA_PKG.ALL;
use WORK.OSC_PKG.ALL;

-- el raton va como entre 20 y 30 kHz, lo ponemos a 250 kHz -> 4 us.
-- cada 32 pixeles son 128 us. | 256 pixeles -> ~ 1 ms (1024 us)

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTROL_OSCILOS is
  generic (
    g_clk_freq        : natural := 100000000;
    g_sample_freq     : natural :=    250000  -- 250kHz
    -- bits de la profundidad de la RAM (bits del bus de direcciones)
  );
  Port (
    rst              : in  std_logic;
    clk               : in  std_logic;
    -- senal con la que se va a parar la captura
    trigger           : in  std_logic;
    -- senal con la que se continua la captura despues de pararse
    restart_capture   : in  std_logic;
    -- orden de capturar un nuevo dato
    capture_data_o    : out  std_logic;
    -- direccion de memoria donde se guardan los datos capturados
    addr_capture_o    : out  std_logic_vector(c_bt_ramdepth-1 downto 0)
    -- en que direccion esta el ultimo dato capturado (el que se va a borrar
    -- cuando llegue uno nuevo
    --last_addr_o       : out  std_logic_vector(c_bt_ramdepth-1 downto 0)
  );
end CONTROL_OSCILOS;

architecture Behavioral of CONTROL_OSCILOS is

  --signal last_addr          : unsigned (c_bt_ramdepth-1 downto 0); 
  signal addr_capture       : unsigned (c_bt_ramdepth-1 downto 0); 
  signal cont_stopping_capt : unsigned (c_bt_ramdepth-1 downto 0); 
  signal trig_reg           : std_logic;
  signal trig_detec         : std_logic;
  signal capture_data       : std_logic;
  signal fullmemo_stopping  : std_logic;

  constant c_cont_freq_end : natural := g_clk_freq/g_sample_freq;
  constant c_bt_cont_freq : natural := log2(c_cont_freq_end)+1;
  signal cont_capt_freq : unsigned (c_bt_cont_freq-1 downto 0);

  type   t_state_capture is (e_capturing, e_capt_stopping, e_capt_stopped);
  signal state_capture_act, state_capture_nxt : t_state_capture;

begin

  --last_addr_o    <= std_logic_vector(last_addr);
  addr_capture_o <= std_logic_vector(addr_capture);
  capture_data_o <= capture_data;

-- trigger event detect

  P_trigger_reg: Process (rst, clk)
  begin
    if rst = c_on then
      trig_reg <= c_trig_off;
    elsif clk'event and clk='1' then
      trig_reg <= trigger;
    end if;
  end process;

  trig_detec <= '1' when (trig_reg = c_trig_off and 
                          trigger  = not (c_trig_off))
                 else '0';


-- Finite state machine (FSM) for the 3 states of the sampling

  P_capture_fsm_seq: Process (rst, clk)
  begin
    if rst = c_on then
      state_capture_act <= e_capturing;
    elsif clk'event and clk='1' then
      state_capture_act <= state_capture_nxt;
    end if;
  end process;

  P_capture_fsm_comb: Process (state_capture_act, trig_detec,
                               fullmemo_stopping, restart_capture)
  begin
    state_capture_nxt <= state_capture_act;
    case state_capture_act is
      when e_capturing =>
        if trig_detec = '1' then
          state_capture_nxt <= e_capt_stopping;
        end if;
      when e_capt_stopping =>
        if fullmemo_stopping = '1' then
          state_capture_nxt <= e_capt_stopped;
        end if;
      when e_capt_stopped =>
        if restart_capture = '1' then
          state_capture_nxt <= e_capturing;
        end if;
    end case;
  end process;

--- frequency divider for sampling
-- it doesn't count when e_capt_stopped

  P_capture_freq: Process (rst, clk)
  begin
    if rst = c_on then
      cont_capt_freq <= (others => '0');
      capture_data <= '0';
    elsif clk'event and clk='1' then
      capture_data <= '0';
      if state_capture_act = e_capt_stopped then
        cont_capt_freq <= (others => '0');
      else
        if cont_capt_freq = c_cont_freq_end-1 then
          cont_capt_freq <= (others => '0');
          capture_data <= '1';
        else
          cont_capt_freq <= cont_capt_freq + 1;
        end if;
      end if;
    end if;
  end process;
    
-- generate the address for the next capture
-- doesn't matter the state, because, otherwise capture_data won't be
-- generated

  P_gen_capture_address: Process (rst, clk)
  begin
    if rst = c_on then
      addr_capture <= (others=>'0');
    elsif clk'event and clk='1' then
      if capture_data = '1' then
        if addr_capture = c_numsamples -1 then
          addr_capture <= (others=> '0');
        else
          addr_capture <= addr_capture + 1;
        end if;
      end if;
    end if;
  end process;

-- after the trigger event detected, captures c_numsamples samples and then 
-- it will stop sampling

  P_count_stopping_captures: Process (rst, clk)
  begin
    if rst = c_on then
      cont_stopping_capt <= (others=>'0');
      fullmemo_stopping <= '0';
    elsif clk'event and clk='1' then
      fullmemo_stopping <= '0';
      if state_capture_act = e_capt_stopping then
        if capture_data = '1' then
          -- 8: don't take all the captures, to avoid to lose the trigger event
          if cont_stopping_capt = c_numsamples - 8 then
            fullmemo_stopping <= '1';
          else
            cont_stopping_capt <= cont_stopping_capt + 1;
          end if;
        end if; 
      else
        cont_stopping_capt <= (others=>'0');
      end if;
    end if;
  end process;
  
end Behavioral;

