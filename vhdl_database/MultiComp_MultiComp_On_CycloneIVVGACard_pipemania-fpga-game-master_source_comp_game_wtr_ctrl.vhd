--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    WTR_CTRL
-- AUTHORS: Ondřej Dujíček  <xdujic02@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity WTR_CTRL is
   Port (
		CLK         : in  STD_LOGIC;
		RST         : in  STD_LOGIC;
		ADR         : out STD_LOGIC_VECTOR(7 downto 0) :=(others=>'0');
		CELL_IN     : in  STD_LOGIC_VECTOR(31 downto 0);
		CELL_OUT    : out STD_LOGIC_VECTOR(31 downto 0) :=(others=>'0');
		WE_OUT      : out STD_LOGIC := '0';
		RE_OUT      : out STD_LOGIC := '0';
		WIN_BIT     : out STD_LOGIC := '0';
		KNLG_next   : in  STD_LOGIC;
		START       : in  STD_LOGIC;
		FAIL_OUT    : out STD_LOGIC
	);
end WTR_CTRL;

architecture Behavioral of WTR_CTRL is

   -- casovac
   signal rst_clk         : STD_LOGIC;
   signal start2          : STD_LOGIC;

   -- I/O data
   signal s_cell_in       : STD_LOGIC_VECTOR(31 downto 0) := (others=>'0');
   signal s_cell_in_next  : STD_LOGIC_VECTOR(31 downto 0) := (others=>'0');
   signal s_cell_out      : STD_LOGIC_VECTOR(31 downto 0) := (others=>'0');
   signal s_cell_out_next : STD_LOGIC_VECTOR(31 downto 0) := (others=>'0');

   -- data o trubkach
   signal typ_tr          : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0'); -- typ trubky
   signal rot_tr          : STD_LOGIC_VECTOR(1 downto 0) := (others=>'0'); -- natoèení trubky
   signal r,l,up,down     : STD_LOGIC := '0';
   signal bit_check       : STD_LOGIC_VECTOR(1 downto 0) := "00";
   signal bit_check_next  : STD_LOGIC_VECTOR(1 downto 0) := "00";
   signal cesta_vody      : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
   signal cesta_vody_next : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');

   -- adresy
   signal adr_x_next      : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
   signal adr_y_next      : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
   signal adr_x           : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
   signal adr_y           : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
   signal s_adr           : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
   signal now_addr        : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0'); -- adresa aktualni bunky, pouziva se ke cteni a zapisu
   signal now_addr_next   : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0'); -- adresa aktualni bunky, pouziva se ke cteni a zapisu
   signal adr_xn_1_next   : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_yn_1_next   : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_xn_1        : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_yn_1        : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_xn_2_next   : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_yn_2_next   : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_xn_2        : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy
   signal adr_yn_2        : STD_LOGIC_VECTOR(3 downto 0); --pøedchozí adresy

   -- win, lose signaly
   signal fail_bit_next   : STD_LOGIC := '0';
   signal WIN_BIT_next    : STD_LOGIC := '0';

   -- ostatni signaly
   signal tmp1            : STD_LOGIC_VECTOR(4 downto 0) := (others=>'0'); --- counter na trubky
   signal tmp1_next       : STD_LOGIC_VECTOR(4 downto 0) := (others=>'0'); --- counter na trubky
   signal knlg            : STD_LOGIC;

   type state_type0 is (m1,m2,m3,m4,m5,m6,m0,m7,m8,m9,m10,m11,m12,m13,m16,m17,m18,m19); -- mody prace s bunkou
   signal next_state, present_state : state_type0 := m0; -- vnitrni signaly typu state

   -- konstanty
   constant clock_defi : STD_LOGIC_VECTOR(25 downto 0) := "00001101111111011110000100"; -- cim vetsi tim pomalejsi

begin

   -- zapojeni podkomponenty
   -- casovani 10 - 14 to je 5 bit 00001 voda ma tect 00011 voda tece a je v prvnim policku casovac na 0.2s az 0.5s
   wtr_clk_unit : entity work.WTR_CLK
   generic map (
      Flip_flops => 26 -- odpovída nastavenemu clock defi
   )
   port map (
      CLK        => CLK,
      RST        => rst_clk,
      CLOCK_DEFI => clock_defi, -- nastavuje hodnotu casovace
      ENABLE_OUT => start2
   );

   -- rozdeleni ulozenych dat
   up       <= s_cell_in(6);
   r        <= s_cell_in(7);
   down     <= s_cell_in(8);
   l        <= s_cell_in(9);
   typ_tr   <= s_cell_in(3 downto 0);
   rot_tr   <= s_cell_in(5 downto 4);

   s_adr    <= std_logic_vector(unsigned(adr_y) & unsigned(adr_x));

   ADR      <= now_addr;
   CELL_OUT <= s_cell_out_next;
   WIN_BIT  <= win_bit_next;
   FAIL_OUT <= fail_bit_next;
-----------------------------------------------------------------------------------------------------
-- STAVOVY AUTOMAT - THE DUJDA SYSTEM
-----------------------------------------------------------------------------------------------------

process (CLK)
begin
   if (rising_edge(CLK)) then
      if (RST = '1') then -- synchronni reset
         present_state <= m0;
         now_addr      <= (others=>'0');
         s_cell_out    <= (others=>'0');
         s_cell_in     <= (others=>'0');
         tmp1          <= (others=>'0');
         bit_check     <= (others=>'0');
         adr_xn_1      <= (others=>'0');
         adr_yn_1      <= (others=>'0');
         adr_xn_2      <= (others=>'0');
         adr_yn_2      <= (others=>'0');
         adr_x         <= (others=>'0');
         adr_y         <= (others=>'0');
         knlg          <= '0';
         cesta_vody    <= (others=>'0');
      else
         present_state <= next_state;
         now_addr      <= now_addr_next;
         s_cell_out    <= s_cell_out_next;
         s_cell_in     <= s_cell_in_next;
         tmp1          <= tmp1_next;
         bit_check     <= bit_check_next;
         adr_xn_1      <= adr_xn_1_next;
         adr_yn_1      <= adr_yn_1_next;
         adr_xn_2      <= adr_xn_2_next;
         adr_yn_2      <= adr_yn_2_next;
         adr_x         <= adr_x_next;
         adr_y         <= adr_y_next;
         knlg          <= knlg_next;
         cesta_vody    <= cesta_vody_next;
      end if;
   end if;
end process;

process(present_state,up,l,r,down,start,adr_x,adr_y,typ_tr,rot_tr, adr_xn_1, adr_yn_1, bit_check,
        KNLG_next, knlg, s_adr, start2, tmp1, s_cell_in, s_cell_out, now_addr, CELL_IN, cesta_vody, adr_xn_2, adr_yn_2)
begin

   bit_check_next  <= bit_check;
   adr_xn_1_next   <= adr_xn_1;
   adr_yn_1_next   <= adr_yn_1;
   adr_xn_2_next   <= adr_xn_2;
   adr_yn_2_next   <= adr_yn_2;
   adr_x_next      <= adr_x;
   adr_y_next      <= adr_y;
   now_addr_next   <= now_addr;
   s_cell_out_next <= s_cell_out;
   s_cell_in_next  <= s_cell_in;
   tmp1_next       <= tmp1;
   rst_clk         <= '0';
   cesta_vody_next <= cesta_vody;

case present_state is

   -- startovni stav
   when m0=>
   	fail_bit_next <= '0';
      win_bit_next  <= '0';
   	RE_OUT <= '0';
   	WE_OUT <= '0';

      adr_x_next <= (others=>'0');
      adr_y_next <= (others=>'0');
      now_addr_next <= (others=>'0'); -- nastaveni adresy startovniho policka

   	if (start = '1') then
   		next_state<= m1;
   	else
   		next_state<= m0;
   	end if;
------------------------------------------------------------
   -- cteni dat o aktualni bunce
   when m1 =>
   	fail_bit_next <= '0';
   	win_bit_next  <= '0';
   	WE_OUT <= '0';


      if (knlg = '1') then
         RE_OUT <= '0';
         s_cell_in_next <= CELL_IN;
   		next_state <= m17;
   	else
         RE_OUT <= '1';
   		next_state <= m1;
   	end if;
------------------------------------------------------------
   -- kontrola zdali jsme na startovnim policku
   when m17 =>
      RE_OUT <= '0';
      WE_OUT <= '0';
      fail_bit_next <= '0';
      win_bit_next  <= '0';

      s_cell_out_next  <= s_cell_in;

      if (s_adr = "00000000") then
         next_state <= m8;
      else
         next_state <= m16;
      end if;
------------------------------------------------------------
    -- kontrola jestli je spravne zapojena prvni trubka
    when m8 =>
      RE_OUT <= '0';
      WE_OUT <= '0';
      fail_bit_next <= '0';
      win_bit_next  <= '0';

      if (l='1') then -- kontrola pripojení první trubky
         next_state<= m2;
      else
         next_state<= m3;
      end if;
------------------------------------------------------------
   -- kontrola pripojeni druhe trubky
   when m16=>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      case bit_check is
         when "00" =>
            if (l='1') then
               next_state <= m2;
            else
               next_state <= m3;
            end if;

         when "01" =>
            if (r='1') then
               next_state <= m2;
            else
               next_state <= m3;
            end if;

         when "10" =>
            if (down='1') then
               next_state <= m2;
            else
               next_state <= m3;
            end if;

         when "11" =>
            if (up='1') then
               next_state <= m2;
            else
               next_state <= m3;
            end if;

         when others =>
            next_state <= m3;
      end case;
------------------------------------------------------------
   -- zjisteni typu trubky
   when m2=>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      case typ_tr is
         when "0000" =>
         next_state <= m3; -- prazdne pole

         when "0010" =>
         next_state <= m4; -- trubka L-ko

         when "0001" =>
         next_state <= m5; -- rovna trubka

         when "0011" =>
         next_state <= m6; -- krizova trubka

         when others =>
         next_state <= m3; -- zed nebo jine
      end case;
------------------------------------------------------------
   -- trubka L, zjistovani natoceni
   when m4 =>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      case rot_tr is
         when "10" => -- L = z hora do prava
            if (adr_yn_1<adr_y) then
               next_state<= m10; -- doprava
               cesta_vody_next <= "1011"; -- zhora doprava
            else
               next_state<= m12; -- nahoru
               cesta_vody_next <= "0111"; -- zprava nahoru
            end if;

         when "11" => -- P z prava dolu
            if (adr_yn_1>adr_y) then
               next_state<= m10; -- doprava
               cesta_vody_next <= "1001"; -- zdola doprava
            else
               next_state<= m13; -- dolu
               cesta_vody_next <= "1000"; -- zprava dolu
            end if;

         when "00" => -- 7 z dola do leva + osetreny prvni stav
            if (adr_yn_1>adr_y) then
               next_state<= m11; -- doleva
               cesta_vody_next <= "1010"; -- zdola doleva
            else
               next_state<= m13; -- dolu
               cesta_vody_next <= "0110"; -- zleva dolu
            end if;

         when "01" => -- d z leva nahoru
            if (adr_yn_1<adr_y) then
               next_state<= m11; -- doleva
               cesta_vody_next <= "1100"; -- zhora doleva
            else
               next_state<= m12; -- nahoru
               cesta_vody_next <= "0101"; -- zleva nahoru
            end if;

         when others => -- kdyby se neco posralo
            next_state <= m3;
      end case;
------------------------------------------------------------
   -- rovna trubka, zjistovani natoceni
   when m5 =>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      case rot_tr is
         when "00" =>
            if (adr_xn_1>adr_x) then
               next_state<= m11; -- doleva
               cesta_vody_next <= "0010";
            else
               next_state<= m10; -- doprava
               cesta_vody_next <= "0001";
            end if;

         when "01" =>
            if (adr_yn_1<adr_y) then
               next_state<= m13; -- dolu
               cesta_vody_next <= "0100";
            else
               next_state<= m12; -- nahoru
               cesta_vody_next <= "0011";
            end if;

         when others =>
            next_state <= m3;
      end case;
------------------------------------------------------------
   -- krizova trubka, zjistovani natoceni
   when m6 =>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      if (adr_xn_1<adr_x) then
         next_state<= m10; -- tece doprava
         cesta_vody_next <= "0001";
      elsif (adr_xn_1>adr_x) then
         next_state<= m11; -- tece doleva
         cesta_vody_next <= "0010";
      elsif (adr_yn_1<adr_y) then
         next_state<= m13; -- tece dolu
         cesta_vody_next <= "0100";
      elsif (adr_yn_1>adr_y) then
         next_state<= m12; -- tece nahoru
         cesta_vody_next <= "0011";
      elsif (s_adr="00000000") then
         next_state<=m10; -- tece doprava
         cesta_vody_next <= "0001";
      else
         next_state<=m3;
      end if;
------------------------------------------------------------
   -- voda potece doprava
   when m10 =>		 --- ptam se do prava
      adr_x_next<= std_logic_vector(unsigned(adr_x) + 1);
      bit_check_next<="00";
      adr_xn_1_next <= adr_x;
      adr_yn_1_next <= adr_y;
      adr_xn_2_next <= adr_xn_1;
      adr_yn_2_next <= adr_yn_1;

      next_state<= m18;

      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';
      rst_clk<='1';
------------------------------------------------------------
   -- voda potece doleva
   when m11 => 	--- ptam se do leva
      adr_x_next<= std_logic_vector(unsigned(adr_x) - 1);
      bit_check_next<="01";
      adr_xn_1_next <= adr_x;
      adr_yn_1_next <= adr_y;
      adr_xn_2_next <= adr_xn_1;
      adr_yn_2_next <= adr_yn_1;

      next_state<= m18;

      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';
      rst_clk<='1';
------------------------------------------------------------
   -- voda potece nahoru
   when m12 =>		--- ptam se nahoru
      adr_y_next<= std_logic_vector(unsigned(adr_y) - 1);
      bit_check_next<="10";
      adr_xn_1_next <= adr_x;
      adr_yn_1_next <= adr_y;
      adr_xn_2_next <= adr_xn_1;
      adr_yn_2_next <= adr_yn_1;

      next_state<= m18;

      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';
      rst_clk<='1';
------------------------------------------------------------
   -- voda potece dolu
   when m13 =>		--- ptam se dolu
      adr_y_next<= std_logic_vector(unsigned(adr_y) + 1);
      bit_check_next<="11";
      adr_xn_1_next <= adr_x;
      adr_yn_1_next <= adr_y;
      adr_xn_2_next <= adr_xn_1;
      adr_yn_2_next <= adr_yn_1;

      next_state<= m18;

      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';
      rst_clk<='1';
------------------------------------------------------------
   -- kontrola jestli voda prosla celou trubkou
   when m18=>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      if (start2='1') then
         if (tmp1="11111") then
            --tmp1_next <= "00000";
            next_state <= m7;
            --now_addr_next <= s_adr; -- nastaveni adresy noveho policka
         else
            tmp1_next<=std_logic_vector(unsigned(tmp1)+1);
            next_state<=m19;
         end if;
      else
         next_state <= m18;
      end if;
------------------------------------------------------------
   -- zapis vody, zapne casovani a pricte vodu
   when m19=>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '1';
      WE_OUT <= '1';

      if ((cesta_vody = "0011") OR (cesta_vody = "0100")) then
         s_cell_out_next(15 downto 10) <= s_cell_in(15 downto 10);
         s_cell_out_next(21 downto 16) <= tmp1 & '1';
         s_cell_out_next(25 downto 22) <= s_cell_in(25 downto 22);
         s_cell_out_next(29 downto 26) <= cesta_vody;
      else
         s_cell_out_next(15 downto 10) <= tmp1 & '1';
         s_cell_out_next(21 downto 16) <= s_cell_in(21 downto 16);
         s_cell_out_next(25 downto 22) <= cesta_vody;
         s_cell_out_next(29 downto 26) <= s_cell_in(29 downto 26);
      end if;

   	if (KNLG_next = '1') then
   		next_state <= m18;
   	else
   		next_state <= m19;
   	end if;

------------------------------------------------------------
   -- kontrola jestli trubka neni zapojena do cile nebo do zdi
   when m7 =>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';
            tmp1_next <= "00000";
            now_addr_next <= s_adr; -- nastaveni adresy noveho policka

      if ((adr_yn_1="0000")and (up='1') and (typ_tr/="0011")) then
         next_state<=m3;
      elsif((adr_yn_1="1100")and (down='1')and (typ_tr/="0011")) then
         next_state<=m3;
      elsif((adr_xn_1="1101")and (r='1') and (adr_yn_1/="1100")and (typ_tr/="0011")) then
         next_state<=m3;
      elsif((adr_xn_1="1101")and (r='1') and (adr_yn_1="1100") and (typ_tr/="0011")) then -- win
         next_state<=m9;
      elsif((adr_xn_1="0000")and (l='1')and(adr_yn_1/="0000") and (typ_tr/="0011")) then
         next_state<=m3;
      -- krizova --- fix
      elsif (typ_tr="0011") then
         if (adr_xn_2<adr_xn_1) then
            if ((adr_xn_1="1101") and (adr_yn_1/="1100")) then
               next_state <= m3;
            elsif ((adr_xn_1="1101") and (adr_yn_1="1100")) then
               next_state <= m9;
            else
               next_state<=m1;
            end if;
         elsif ((adr_xn_2>adr_xn_1) and (adr_xn_1="0000")) then
            next_state<= m3;
         elsif ((adr_yn_2<adr_yn_1) and (adr_yn_1="1100")) then
            next_state<= m3;
         elsif ((adr_yn_2>adr_yn_1) and (adr_yn_1="0000")) then
            next_state<= m3;
         else
            next_state<=m1;
         end if;
      else
         next_state<=m1;
      end if;
------------------------------------------------------------
   -- Prohra
   when m3 =>
      fail_bit_next <= '1';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      next_state<=m3;
------------------------------------------------------------
   -- Vyhra
   when m9 =>
      fail_bit_next <= '0';
      win_bit_next  <= '1';
      RE_OUT <= '0';
      WE_OUT <= '0';

      next_state <= m9;
------------------------------------------------------------
   -- ostatni stavy
   when others =>
      fail_bit_next <= '0';
      win_bit_next  <= '0';
      RE_OUT <= '0';
      WE_OUT <= '0';

      next_state <= m0;

end case;
end process;

end Behavioral;
