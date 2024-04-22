library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lfsr is
   generic (
      G_TAPS  : std_logic_vector(63 downto 0);
      G_WIDTH : natural
   );
   port (
      clk_i      : in  std_logic;
      rst_i      : in  std_logic;
      update_i   : in  std_logic;
      load_i     : in  std_logic;
      load_val_i : in  std_logic_vector(G_WIDTH-1 downto 0);
      output_o   : out std_logic_vector(G_WIDTH-1 downto 0)
   );
end entity lfsr;

architecture synthesis of lfsr is

   constant C_UPDATE : std_logic_vector(G_WIDTH-1 downto 0) := G_TAPS(G_WIDTH-2 downto 0) & "1";

   signal lfsr_s : std_logic_vector(G_WIDTH-1 downto 0) := (others => '1');

begin

   p_lfsr : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if update_i = '1' then
            lfsr_s <= lfsr_s(G_WIDTH-2 downto 0) & "0";
            if lfsr_s(G_WIDTH-1) = '1' then
               lfsr_s <= (lfsr_s(G_WIDTH-2 downto 0) & "0") xor C_UPDATE;
            end if;
         end if;

         if load_i = '1' then
            lfsr_s <= load_val_i;
         end if;

         if rst_i = '1' then
            lfsr_s <= (others => '1');
            for i in 0 to (G_WIDTH-1)/3 loop
               if i/2 = (i+1)/2 then
                  lfsr_s(3*i) <= '0';
               else
                  lfsr_s(2*i+1) <= '0';
               end if;
            end loop;
         end if;
      end if;
   end process p_lfsr;

   output_o <= lfsr_s;

end architecture synthesis;

