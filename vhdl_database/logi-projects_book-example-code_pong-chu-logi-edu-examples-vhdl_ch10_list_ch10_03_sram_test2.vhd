--Listing 10.3
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sram_test is
  port(
      clk, reset: in std_logic;
      sw: in std_logic_vector(7 downto 0);
      btn: in std_logic_vector(2 downto 0);
      led: out std_logic_vector(7 downto 0);
      an: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0);
      ad: out std_logic_vector(17 downto 0);
      we_n, oe_n: out std_logic;
      dio_a: inout std_logic_vector(15 downto 0);
      ce_a_n, ub_a_n, lb_a_n: out std_logic
  );
end sram_test;

architecture arch of sram_test is
   constant ADDR_W: integer:=18;
   constant DATA_W: integer:=16;
   signal addr: std_logic_vector(ADDR_W-1 downto 0);
   signal data_f2s, data_s2f:
          std_logic_vector(DATA_W-1 downto 0);
   signal mem, rw: std_logic;
   type state_type is (test_init, rd_clk1, rd_clk2, rd_clk3,
                       wr_err, wr_clk1, wr_clk2, wr_clk3);
   signal state_reg, state_next: state_type;
   signal c_next, c_reg: unsigned(ADDR_W-1 downto 0);
   signal c_std: std_logic_vector(ADDR_W-1 downto 0);
   signal inj_next, inj_reg: unsigned(7 downto 0);
   signal err_next, err_reg: unsigned(15 downto 0);
   signal db_btn: std_logic_vector(2 downto 0);

begin
   --===============================================
   -- component instantiation
   --===============================================
   ctrl_unit: entity work.sram_ctrl
   port map(
      clk=>clk, reset=>reset,
      mem=>mem, rw =>rw, addr=>addr,
      data_f2s=>data_f2s, ready=>open,
      data_s2f_r=>open, data_s2f_ur=>data_s2f,
      ad=>ad,  dio_a=>dio_a,
      we_n=>we_n, oe_n=>oe_n,
      ce_a_n=>ce_a_n, ub_a_n=>ub_a_n, lb_a_n=>lb_a_n);

    debounce_unit0: entity work.debounce
       port map(
          clk=>clk, reset=>reset, sw=>btn(0),
          db_level=>open, db_tick=>db_btn(0));
    debounce_unit1: entity work.debounce
       port map(
          clk=>clk, reset=>reset, sw=>btn(1),
          db_level=>open, db_tick=>db_btn(1));
    debounce_unit2: entity work.debounce
       port map(
          clk=>clk, reset=>reset, sw=>btn(2),
          db_level=>open, db_tick=>db_btn(2));
    disp_unit: entity work.disp_hex_mux
      port map(
         clk=>clk, reset=>'0',dp_in=>"1111",
         hex3=>std_logic_vector(err_reg(15 downto 12)),
         hex2=>std_logic_vector(err_reg(11 downto 8)),
         hex1=>std_logic_vector(err_reg(7 downto 4)),
         hex0=>std_logic_vector(err_reg(3 downto 0)),
         an=>an, sseg=>sseg);

   --===============================================
   --   FSMD
   --===============================================
   -- state & data registers
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= test_init;
         c_reg <= (others=>'0');
         inj_reg <= (others=>'0');
         err_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
         c_reg <= c_next;
         inj_reg <= inj_next;
         err_reg <= err_next;
     end if;
   end process;
   c_std <= std_logic_vector(c_reg);
   -- next-state logic
   process(state_reg,sw,db_btn,c_reg,c_std,
           c_next,inj_reg,err_reg,data_s2f)
   begin
      c_next <= c_reg;
      inj_next <= inj_reg;
      err_next <= err_reg;
      addr <= (others=>'0');
      rw <= '1';
      mem <= '0';
      data_f2s <= (others=>'0');
      case state_reg is
         when test_init =>
            if db_btn(0)='1' then
               state_next <= rd_clk1;
               c_next <=(others=>'0');
               err_next <=(others=>'0');
            elsif db_btn(1)='1' then
               state_next <= wr_clk1;
               c_next <=(others=>'0');
               inj_next <=(others=>'0'); -- clear injected err
            elsif db_btn(2)='1' then
               state_next <= wr_err;
               inj_next <= inj_reg + 1;
            else
               state_next <= test_init;
            end if;
         when wr_err => -- write 1 error; done in next 2 clocks
            state_next <= test_init;
            mem <= '1';
            rw <= '0';
            addr <= "0000000000" & sw;
            data_f2s <= (others=>'1');
         when wr_clk1 => -- in idle state of sram_ctrl
            state_next <= wr_clk2;
            mem <= '1';
            rw <= '0';
            addr <= c_std;
            data_f2s <= not c_std(DATA_W-1 downto 0);
         when wr_clk2 => -- in wr1 state of sram_ctrl
            state_next <= wr_clk3;
         when wr_clk3 => -- in wr2 state of sram_ctrl
            c_next <= c_reg + 1;
            if c_next=0 then
               state_next <= test_init;
            else
               state_next <= wr_clk1;
            end if;
         when rd_clk1 => -- in idle state of sram_ctrl
            state_next <= rd_clk2;
            mem <= '1';
            rw <= '1';
            addr <= c_std;
         when rd_clk2 => -- in rd1 state of sram_ctrl
            state_next <= rd_clk3;
         when rd_clk3 => -- in rd2 state of sram_ctrl
            -- compare readout; must use unregistered output
            if (not c_std(DATA_W-1 downto 0))/=data_s2f then
               err_next <= err_reg + 1;
            end if;
            c_next <= c_reg + 1;
            if c_next=0 then
               state_next <= test_init;
            else
               state_next <= rd_clk1;
            end if;
     end case;
   end process;
   led <= std_logic_vector(inj_reg);
end arch;