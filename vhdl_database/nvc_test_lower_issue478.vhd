package test_pkg is
  type    t_slv_array         is array (natural range <>) of bit_vector;
  subtype t_word              is bit_vector(15 downto 0);
  subtype t_word_array        is t_slv_array(open)(t_word'range);
  constant C_NULL_DATA : t_word_array(0 to -1) := (others => (others => '0'));
end package;
