entity sqroot_ln is
  port(

    omega_ip : in bit_vector(1 downto 1);
    sqroot_cp_ip : in bit_vector(32 downto 1);
    sqroot_dp_ip : in bit_vector(26 downto 1);
    omega_op : out bit_vector(1 downto 1) := (others => '0');
    sqroot_cp_op : out bit_vector(27 downto 1) := (others => '0');
    sqroot_dp_op : out bit_vector(31 downto 1) := (others => '0');

    reset : in bit;
    clk   : in bit);
end sqroot_ln;

architecture Behavioral of sqroot_ln is 

begin

  omega_op(1) <= sqroot_cp_ip(1);

  sqroot_cp_op(1) <= omega_ip(1);
  sqroot_cp_op(2) <= sqroot_dp_ip(1);
  sqroot_cp_op(3) <= sqroot_dp_ip(2);
  sqroot_cp_op(4) <= sqroot_dp_ip(3);
  sqroot_cp_op(5) <= sqroot_dp_ip(4);
  sqroot_cp_op(6) <= sqroot_dp_ip(5);
  sqroot_cp_op(7) <= sqroot_dp_ip(6);
  sqroot_cp_op(8) <= sqroot_dp_ip(7);
  sqroot_cp_op(9) <= sqroot_dp_ip(8);
  sqroot_cp_op(10) <= sqroot_dp_ip(9);
  sqroot_cp_op(11) <= sqroot_dp_ip(10);
  sqroot_cp_op(12) <= sqroot_dp_ip(11);
  sqroot_cp_op(13) <= sqroot_dp_ip(12);
  sqroot_cp_op(14) <= sqroot_dp_ip(13);
  sqroot_cp_op(15) <= sqroot_dp_ip(14);
  sqroot_cp_op(16) <= sqroot_dp_ip(15);
  sqroot_cp_op(17) <= sqroot_dp_ip(16);
  sqroot_cp_op(18) <= sqroot_dp_ip(17);
  sqroot_cp_op(19) <= sqroot_dp_ip(18);
  sqroot_cp_op(20) <= sqroot_dp_ip(19);
  sqroot_cp_op(21) <= sqroot_dp_ip(20);
  sqroot_cp_op(22) <= sqroot_dp_ip(21);
  sqroot_cp_op(23) <= sqroot_dp_ip(22);
  sqroot_cp_op(24) <= sqroot_dp_ip(23);
  sqroot_cp_op(25) <= sqroot_dp_ip(24);
  sqroot_cp_op(26) <= sqroot_dp_ip(25);
  sqroot_cp_op(27) <= sqroot_dp_ip(26);

  sqroot_dp_op(1) <= sqroot_cp_ip(2);
  sqroot_dp_op(2) <= sqroot_cp_ip(3);
  sqroot_dp_op(3) <= sqroot_cp_ip(4);
  sqroot_dp_op(4) <= sqroot_cp_ip(6);
  sqroot_dp_op(5) <= sqroot_cp_ip(5);
  sqroot_dp_op(6) <= sqroot_cp_ip(8);
  sqroot_dp_op(7) <= sqroot_cp_ip(7);
  sqroot_dp_op(8) <= sqroot_cp_ip(10);
  sqroot_dp_op(9) <= sqroot_cp_ip(9);
  sqroot_dp_op(10) <= sqroot_cp_ip(12);
  sqroot_dp_op(11) <= sqroot_cp_ip(11);
  sqroot_dp_op(12) <= sqroot_cp_ip(13);
  sqroot_dp_op(13) <= sqroot_cp_ip(14);
  sqroot_dp_op(14) <= sqroot_cp_ip(16);
  sqroot_dp_op(15) <= sqroot_cp_ip(15);
  sqroot_dp_op(16) <= sqroot_cp_ip(18);
  sqroot_dp_op(17) <= sqroot_cp_ip(17);
  sqroot_dp_op(18) <= sqroot_cp_ip(20);
  sqroot_dp_op(19) <= sqroot_cp_ip(19);
  sqroot_dp_op(20) <= sqroot_cp_ip(21);
  sqroot_dp_op(21) <= sqroot_cp_ip(22);
  sqroot_dp_op(22) <= sqroot_cp_ip(23);
  sqroot_dp_op(23) <= sqroot_cp_ip(24);
  sqroot_dp_op(24) <= sqroot_cp_ip(25);
  sqroot_dp_op(25) <= sqroot_cp_ip(27);
  sqroot_dp_op(26) <= sqroot_cp_ip(26);
  sqroot_dp_op(27) <= sqroot_cp_ip(28);
  sqroot_dp_op(28) <= sqroot_cp_ip(30);
  sqroot_dp_op(29) <= sqroot_cp_ip(29);
  sqroot_dp_op(30) <= sqroot_cp_ip(31);
  sqroot_dp_op(31) <= sqroot_cp_ip(32);

end Behavioral;
