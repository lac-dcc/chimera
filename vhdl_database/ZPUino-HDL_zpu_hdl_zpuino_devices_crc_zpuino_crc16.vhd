library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_crc16 is
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIOBit downto minIOBit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    id:       out slot_id
  );
end entity zpuino_crc16;

architecture behave of zpuino_crc16 is

signal crc_q: std_logic_vector(15 downto 0);
signal crcA_q: std_logic_vector(15 downto 0);
signal crcB_q: std_logic_vector(15 downto 0);
signal poly_q: std_logic_vector(15 downto 0);
signal data_q: std_logic_vector(7 downto 0);
signal count_q: integer range 0 to 7;
signal ready_q: std_logic;

begin

id <= x"08" & x"15"; -- Vendor: ZPUino  Device: CRC16 Engine
wb_ack_o<='1' when ready_q='1' and ( wb_cyc_i='1' and wb_stb_i='1') else '0';
wb_inta_o <= '0';

process(wb_adr_i,crc_q,poly_q, crcA_q, crcB_q)
begin
  case wb_adr_i(4 downto 2) is
    when "000" =>
      wb_dat_o(31 downto 16) <= (others => Undefined);
      wb_dat_o(15 downto 0) <= crc_q;
    when "001" =>
      wb_dat_o(31 downto 16) <= (others => Undefined);
      wb_dat_o(15 downto 0) <= poly_q;
    when "100" =>
      wb_dat_o(31 downto 16) <= (others => Undefined);
      wb_dat_o(15 downto 0) <= crcA_q;
    when "101" =>
      wb_dat_o(31 downto 16) <= (others => Undefined);
      wb_dat_o(15 downto 0) <= crcB_q;
    when others =>
      wb_dat_o <= (others => DontCareValue);
  end case;
end process;

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      poly_q <= x"A001";
      crc_q <= x"FFFF";
      ready_q <= '1';

    else
      if wb_cyc_i='1' and wb_stb_i='1' and wb_we_i='1' and ready_q='1' then
        case wb_adr_i(4 downto 2) is
          when "000" =>
            crc_q <= wb_dat_i(15 downto 0);
          when "001" =>
            poly_q <= wb_dat_i(15 downto 0);
          when "010" =>
            ready_q <= '0';
            count_q <= 0;
            data_q <= wb_dat_i(7 downto 0);
            crcA_q <= crc_q;
            crcB_q <= crcA_q;
          when others =>
        end case;
      end if;

      if ready_q='0' then
        if (crc_q(0) xor data_q(0))='1' then
          crc_q <= ( '0' & crc_q(15 downto 1)) xor poly_q;  
        else
          crc_q <= '0' & crc_q(15 downto 1);
        end if;
        data_q <= '0' & data_q(7 downto 1);
        if count_q=7 then
          count_q <= 0;
          ready_q <= '1';
        else
          count_q <= count_q + 1;
        end if;
      end if;

    end if;
  end if;
end process;

end behave;
