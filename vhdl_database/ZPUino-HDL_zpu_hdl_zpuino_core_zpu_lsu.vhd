library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.wishbonepkg.all;

entity zpuino_lsu is
  port (
    wb_clk_i:       in std_logic;
    wb_rst_i:       in std_logic;

    wb_ack_i:       in std_logic;
    wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    wb_adr_o:       out std_logic_vector(maxAddrBitIncIO downto 2);
    wb_cyc_o:       out std_logic;
    wb_stb_o:       out std_logic;
    wb_sel_o:       out std_logic_vector(3 downto 0);
    wb_we_o:        out std_logic;


    -- Connection to cpu
    req:            in std_logic;
    we:             in std_logic;
    busy:           out std_logic;

    data_read:      out std_logic_vector(wordSize-1 downto 0);
    data_write:     in std_logic_vector(wordSize-1 downto 0);
    data_sel:       in std_logic_vector(3 downto 0);
    address:        in std_logic_vector(maxAddrBitIncIO downto 0)
  );
end zpuino_lsu;

architecture behave of zpuino_lsu is


  type lsu_state is (
    lsu_idle,
    lsu_read,
    lsu_write
  );
  
  type regs is record
    state:  lsu_state;
    addr:   std_logic_vector(maxAddrBitIncIO downto 2);
    sel:    std_logic_vector(3 downto 0);
    data:   std_logic_vector(wordSize-1 downto 0);
  end record;
  
  signal r: regs;

begin

  data_read <= wb_dat_i;

  process(r,wb_clk_i, we, req, wb_ack_i, address, data_write, data_sel, wb_rst_i)
    variable w: regs;
  begin

    w:=r;

    wb_cyc_o <= '0';
    wb_stb_o <= 'X';
    wb_we_o <= 'X';
    wb_adr_o <= r.addr;
    wb_dat_o <= r.data;
    wb_sel_o <= r.sel;

    case r.state is
      when lsu_idle =>
        busy <= '0';
        w.addr := address(maxAddrBitIncIO downto 2);
        w.data := data_write;
        w.sel  := data_sel;

        if req='1' then
          if we='1' then
            w.state := lsu_write;
            busy <= address(maxAddrBitIncIO);
          else
            w.state := lsu_read;
            busy <= '1';
          end if;
        end if;

      when lsu_write =>
          wb_cyc_o <= '1';
          wb_stb_o <= '1';
          wb_we_o  <= '1';
          if req='1' then
            busy <= '1';
          else
            busy <= '0';
          end if;

          if wb_ack_i='1' then
            w.state := lsu_idle;
            if r.addr(maxAddrBitIncIO)='1' then
              busy <= '0';
            end if;
          end if;

      when lsu_read =>
          wb_cyc_o <= '1';
          wb_stb_o <= '1';
          wb_we_o  <= '0';

          busy <= not wb_ack_i;

          if wb_ack_i='1' then
            w.state := lsu_idle;
          end if;

      when others =>
    end case;

    if wb_rst_i='1' then
      w.state := lsu_idle;
      wb_cyc_o <= '0';
    end if;

    if rising_edge(wb_clk_i) then
      r <= w;
    end if;

  end process;

end behave;

