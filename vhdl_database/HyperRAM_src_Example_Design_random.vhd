library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity random is
   port (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      update_i : in  std_logic;
      output_o : out std_logic_vector(63 downto 0)
   );
end entity random;

architecture synthesis of random is

   pure function reverse(arg : std_logic_vector) return std_logic_vector is
      variable res : std_logic_vector(arg'range);
   begin
      for i in arg'low to arg'high loop
         res(arg'high - i) := arg(i);
      end loop;
      return res;
   end function reverse;

   signal random_s : std_logic_vector(63 downto 0);

begin

   i_lfsr : entity work.lfsr
      generic map (
         G_WIDTH => 64,
         G_TAPS  => X"80000000000019E2" -- See https://users.ece.cmu.edu/~koopman/lfsr/64.txt
      )
      port map (
         clk_i      => clk_i,
         rst_i      => rst_i,
         update_i   => update_i,
         load_i     => '0',
         load_val_i => (others => '1'),
         output_o   => random_s
      ); -- i_lfsr

   output_o <= random_s + reverse(random_s);

end architecture synthesis;

