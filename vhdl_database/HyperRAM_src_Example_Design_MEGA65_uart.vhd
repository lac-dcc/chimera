library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart is
   port (
      clk_i       : in  std_logic;
      rst_i       : in  std_logic;
      s_valid_i   : in  std_logic;
      s_ready_o   : out std_logic;
      s_data_i    : in  std_logic_vector(7 downto 0);

      uart_tx_o   : out std_logic
   );
end entity uart;

architecture synthesis of uart is

   constant C_COUNTER_MAX : natural := 100000000/115200;

   type state_t is (
      IDLE_ST,
      BUSY_ST
   );

   signal data    : std_logic_vector(9 downto 0);
   signal state   : state_t := IDLE_ST;
   signal counter : natural range 0 to C_COUNTER_MAX;

begin

   s_ready_o <= '1' when state = IDLE_ST else '0';

   uart_tx_o <= data(0);

   p_fsm : process (clk_i)

   begin
      if rising_edge(clk_i) then
         if counter > 0 then
            counter <= counter - 1;
         else
            case state is
               when IDLE_ST =>
                  if s_valid_i = '1' then
                     data    <= "1" & s_data_i & "0";
                     counter <= C_COUNTER_MAX;
                     state   <= BUSY_ST;
                  end if;

               when BUSY_ST =>
                  if or(data(9 downto 1)) = '1' then
                     counter <= C_COUNTER_MAX;
                     data    <= "0" & data(9 downto 1);
                  else
                     data  <= (others => '1');
                     state <= IDLE_ST;
                  end if;
            end case;
         end if;

         if rst_i = '1' then
            data  <= (others => '1');
            state <= IDLE_ST;
         end if;
      end if;
   end process p_fsm;

end architecture synthesis;

