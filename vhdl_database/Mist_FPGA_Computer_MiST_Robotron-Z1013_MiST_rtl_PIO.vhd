------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       :  redzombie.vhd
-- Author     :  fpgakuechle
-- Company    : hobbyist
-- Created    : 2012-12
-- Last update: 2013-04-02
-- Lizenz     : GNU General Public License (http://www.gnu.de/documents/gpl.de.html)
------------------------------------------------------------------------------
-- Description: 
--parallel io unit
--Zilog Z80 PIO - U855
------------------------------------------------------------------------------
--Status: UNDER CONSTRUCTION: 2013-03-03
--missing: IRQ-control
--control register/data path under test now
--last change: fixed: mixed up mask and mode register; add single bit mode
--             fixed: outputs *_rdy at single bit mode
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity pio is
  port(
    clk      : in  std_logic;
    ce_ni    : in  std_logic;
    IOREQn_i : in  std_logic;
    data_o   : out std_logic_vector(7 downto 0);
    data_i   : in  std_logic_vector(7 downto 0);
    RD_n     : in  std_logic;
    M1_n     : in  std_logic;

    sel_b_nA : in  std_logic;
    sel_c_nD : in  std_logic;
    --
    IRQEna_i : in  std_logic;
    IRQEna_o : out std_logic;

    INTn_o : out std_logic;

    astb_n  : in  std_logic;  --Data strobe in, is able to generate IREQ  
    ardy_n  : out std_logic;            -- 
    porta_o : out std_logic_vector(7 downto 0);
    porta_i : in  std_logic_vector(7 downto 0);

    bstb_n  : in  std_logic;
    brdy_n  : out std_logic;
    portb_o : out std_logic_vector(7 downto 0);
    portb_i : in  std_logic_vector(7 downto 0));  
end entity pio;

architecture behave of pio is
  signal ctrl_selected : boolean;
  signal data_selected : boolean;

  type T_ALL_REGS_INDEX is (
    IRQ_VEC, MODE, PORTDIR, IRQ_CTRL, MASK, ERR);
  type T_PORT_INDEX is (PORT_A, PORT_B);

  subtype T_REG is std_logic_vector(7 downto 0);
  type    T_ALL_REGS is array (T_ALL_REGS_INDEX) of T_REG;

  signal reg_index : T_ALL_REGS_INDEX;

  type T_2P_SL is array (T_PORT_INDEX'left to T_PORT_INDEX'right) of std_logic;
  type T_2P_REG_7b is array (T_PORT_INDEX) of std_logic_vector(7 downto 1);
  type T_2P_REG_8b is array (T_PORT_INDEX) of std_logic_vector(7 downto 0);
  type T_2P_REG_2b is array (T_PORT_INDEX) of std_logic_vector(7 downto 6);

  --default mode: Byte - Out
  signal mode_reg    : T_2P_REG_2b := (others => "01");
  signal portdir_reg : T_2P_REG_8b := (others => x"00");
  signal mask_reg    : T_2P_REG_8b := (others => x"00");
  signal irq_vec_reg : T_2P_REG_7b := (others => "0000000");

  signal irq_ctrl_reg : std_logic_vector(7 downto 4) := (others => '0');
  signal err_reg      : std_logic_vector(7 downto 0) := (others => '0');

  signal wr_dir_reg_q  : boolean := false;
  signal wr_mask_reg_q : boolean := false;

  signal data_oq          : std_logic_vector(7 downto 0);
  signal port_sel         : T_PORT_INDEX;
  --ports as vectors
  signal port_indata      : T_2P_REG_8b;
  signal port_outdata     : T_2P_REG_8b;
  --ports regs
  signal port_indata_reg  : T_2P_REG_8b;
  signal port_outdata_reg : T_2P_REG_8b;

  signal strb_in : T_2P_SL;
  signal rdy_out : T_2P_SL;

begin
  port_sel <= PORT_B when sel_b_nA = '1' else
              PORT_A;

  strb_in(PORT_A) <= astb_n;
  strb_in(PORT_B) <= bstb_n;

  ardy_n <= rdy_out(PORT_A);
  brdy_n <= rdy_out(PORT_B);

  port_indata(PORT_A) <= porta_i;
  port_indata(PORT_B) <= portb_i;

  porta_o <= port_outdata(PORT_A);
  portb_o <= port_outdata(PORT_B);

  --built enables for control register
  process(data_i(3 downto 0), wr_dir_reg_q, wr_mask_reg_q) is
  begin
    if wr_dir_reg_q then
      reg_index <= PORTDIR;
    elsif wr_mask_reg_q then
      reg_index <= MASK;
    elsif data_i(0) = '0' then
      reg_index <= IRQ_VEC;
    elsif data_i(3 downto 0) = x"F" then
      reg_index <= MODE;
    elsif data_i(3 downto 0) = x"7" then
      reg_index <= IRQ_CTRL;
    else
      reg_index <= ERR;
    end if;
  end process;

  ctrl_selected <= ce_ni = '0' and IOREQn_i = '0' and sel_c_nD = '1';  --access controlregs
  data_selected <= ce_ni = '0' and IOREQn_i = '0' and sel_c_nD = '0';  --access ports

  --read/write control register
  process(clk)
  begin
    if falling_edge(clk) then
      if ctrl_selected then
        if rd_n = '1' then
          wr_dir_reg_q  <= false;
          wr_mask_reg_q <= false;
          --write control reg
          case reg_index is
            when IRQ_VEC => irq_vec_reg(port_sel) <= data_i(7 downto 1);
            when MODE    => mode_reg(port_sel)    <= data_i(7 downto 6);
                            if data_i(7 downto 6) = "11" then
                              wr_dir_reg_q <= true;
                            end if;

            when PORTDIR  => portdir_reg(port_sel) <= data_i(7 downto 0);
            when IRQ_CTRL => irq_ctrl_reg          <= data_i(7 downto 4);
                             if data_i(4) = '1' then
                               wr_mask_reg_q <= true;
                             end if;
            when MASK   => mask_reg(port_sel) <= data_i(7 downto 0);
            when ERR    => err_reg            <= data_i(7 downto 0);
            when others => err_reg            <= data_i(7 downto 0);
          end case;
        else
          --read control reg ?How to select control register while reading?
          case reg_index is
            when IRQ_VEC  => data_oq <= irq_vec_reg(port_sel) & '0';
            when MODE     => data_oq <= mode_reg(port_sel) & "000000";
            when PORTDIR  => data_oq <= portdir_reg(port_sel);
            when IRQ_CTRL => data_oq <= irq_ctrl_reg & x"0";

            when MASK   => data_oq <= mask_reg(port_sel);
            when ERR    => data_oq <= err_reg;
            when others => data_oq <= x"00";
          end case;
        end if;
        --port_regs <> CPU
      elsif data_selected then
        if rd_n = '0' then
          data_oq <= port_indata_reg(port_sel);
        else
          port_outdata_reg(port_sel) <= data_i;
        end if;
      end if;
    end if;
  end process;

  g_portCPU : for pchan in T_PORT_INDEX generate
    --real port access
    process(clk)
    begin
      if falling_edge(clk) then
        if mode_reg(pchan) = "00" then     --output mode
          port_outdata(pchan) <= port_outdata_reg(pchan);
        elsif mode_reg(pchan) = "01" then  --input mode
          port_indata_reg(pchan) <= port_indata(pchan);
        elsif mode_reg(pchan) = "10" then  --bidir
          for i in 0 to 7 loop        --strb contrl mot implemented yet 
            if portdir_reg(pchan)(i) = '0' then  --output
              port_outdata(pchan)(i) <= port_outdata_reg(pchan)(i);
            else
              port_indata_reg(pchan)(i) <= port_indata(pchan)(i);
            end if;
          end loop;
        elsif mode_reg(pchan) = "11" then  --bit mode
          for i in 0 to 7 loop
            if portdir_reg(pchan)(i) = '0' then --output port
              port_outdata(pchan)(i) <= port_outdata_reg(pchan)(i);
            else                          --input port 
              port_indata_reg(pchan)(i) <= port_indata(pchan)(i);
            end if;
          end loop;
        end if;
      end if;
    end process;
  end generate g_portCPU;
  data_o <= data_oq;
  --unused output yet    

  IRQEna_o <= '1';
  INTn_o   <= '1';

  rdy_out(PORT_A) <= '0' when mode_reg(PORT_A) = "11" else '1'; --other modes
                                                                --not implemented
  rdy_out(PORT_B) <= '0' when mode_reg(PORT_B) = "11" and mode_reg(PORT_A) /= "10" else '1';
end architecture;
