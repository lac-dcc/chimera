entity divide_ln is
  port(

    divide_cp_ip : in bit_vector(51 downto 1);
    divide_dp_ip : in bit_vector(44 downto 1);
    omega_ip : in bit_vector(1 downto 1);
    divide_cp_op : out bit_vector(45 downto 1) := (others => '0');
    divide_dp_op : out bit_vector(50 downto 1) := (others => '0');
    omega_op : out bit_vector(1 downto 1) := (others => '0');

    reset : in bit;
    clk   : in bit);
end divide_ln;

architecture Behavioral of divide_ln is 

begin

  divide_cp_op(1) <= omega_ip(1);
  divide_cp_op(2) <= divide_dp_ip(1);
  divide_cp_op(3) <= divide_dp_ip(2);
  divide_cp_op(4) <= divide_dp_ip(3);
  divide_cp_op(5) <= divide_dp_ip(4);
  divide_cp_op(6) <= divide_dp_ip(5);
  divide_cp_op(7) <= divide_dp_ip(6);
  divide_cp_op(8) <= divide_dp_ip(7);
  divide_cp_op(9) <= divide_dp_ip(8);
  divide_cp_op(10) <= divide_dp_ip(9);
  divide_cp_op(11) <= divide_dp_ip(10);
  divide_cp_op(12) <= divide_dp_ip(11);
  divide_cp_op(13) <= divide_dp_ip(12);
  divide_cp_op(14) <= divide_dp_ip(13);
  divide_cp_op(15) <= divide_dp_ip(14);
  divide_cp_op(16) <= divide_dp_ip(15);
  divide_cp_op(17) <= divide_dp_ip(16);
  divide_cp_op(18) <= divide_dp_ip(17);
  divide_cp_op(19) <= divide_dp_ip(18);
  divide_cp_op(20) <= divide_dp_ip(19);
  divide_cp_op(21) <= divide_dp_ip(20);
  divide_cp_op(22) <= divide_dp_ip(21);
  divide_cp_op(23) <= divide_dp_ip(22);
  divide_cp_op(24) <= divide_dp_ip(23);
  divide_cp_op(25) <= divide_dp_ip(24);
  divide_cp_op(26) <= divide_dp_ip(25);
  divide_cp_op(27) <= divide_dp_ip(26);
  divide_cp_op(28) <= divide_dp_ip(27);
  divide_cp_op(29) <= divide_dp_ip(28);
  divide_cp_op(30) <= divide_dp_ip(29);
  divide_cp_op(31) <= divide_dp_ip(30);
  divide_cp_op(32) <= divide_dp_ip(31);
  divide_cp_op(33) <= divide_dp_ip(32);
  divide_cp_op(34) <= divide_dp_ip(33);
  divide_cp_op(35) <= divide_dp_ip(34);
  divide_cp_op(36) <= divide_dp_ip(35);
  divide_cp_op(37) <= divide_dp_ip(36);
  divide_cp_op(38) <= divide_dp_ip(37);
  divide_cp_op(39) <= divide_dp_ip(38);
  divide_cp_op(40) <= divide_dp_ip(39);
  divide_cp_op(41) <= divide_dp_ip(40);
  divide_cp_op(42) <= divide_dp_ip(41);
  divide_cp_op(43) <= divide_dp_ip(42);
  divide_cp_op(44) <= divide_dp_ip(43);
  divide_cp_op(45) <= divide_dp_ip(44);

  divide_dp_op(1) <= divide_cp_ip(2);
  divide_dp_op(2) <= divide_cp_ip(3);
  divide_dp_op(3) <= divide_cp_ip(4);
  divide_dp_op(4) <= divide_cp_ip(5);
  divide_dp_op(5) <= divide_cp_ip(7);
  divide_dp_op(6) <= divide_cp_ip(6);
  divide_dp_op(7) <= divide_cp_ip(9);
  divide_dp_op(8) <= divide_cp_ip(8);
  divide_dp_op(9) <= divide_cp_ip(10);
  divide_dp_op(10) <= divide_cp_ip(11);
  divide_dp_op(11) <= divide_cp_ip(12);
  divide_dp_op(12) <= divide_cp_ip(13);
  divide_dp_op(13) <= divide_cp_ip(15);
  divide_dp_op(14) <= divide_cp_ip(14);
  divide_dp_op(15) <= divide_cp_ip(17);
  divide_dp_op(16) <= divide_cp_ip(16);
  divide_dp_op(17) <= divide_cp_ip(18);
  divide_dp_op(18) <= divide_cp_ip(19);
  divide_dp_op(19) <= divide_cp_ip(21);
  divide_dp_op(20) <= divide_cp_ip(20);
  divide_dp_op(21) <= divide_cp_ip(23);
  divide_dp_op(22) <= divide_cp_ip(22);
  divide_dp_op(23) <= divide_cp_ip(24);
  divide_dp_op(24) <= divide_cp_ip(25);
  divide_dp_op(25) <= divide_cp_ip(26);
  divide_dp_op(26) <= divide_cp_ip(27);
  divide_dp_op(27) <= divide_cp_ip(29);
  divide_dp_op(28) <= divide_cp_ip(28);
  divide_dp_op(29) <= divide_cp_ip(31);
  divide_dp_op(30) <= divide_cp_ip(30);
  divide_dp_op(31) <= divide_cp_ip(32);
  divide_dp_op(32) <= divide_cp_ip(33);
  divide_dp_op(33) <= divide_cp_ip(34);
  divide_dp_op(34) <= divide_cp_ip(35);
  divide_dp_op(35) <= divide_cp_ip(36);
  divide_dp_op(36) <= divide_cp_ip(38);
  divide_dp_op(37) <= divide_cp_ip(37);
  divide_dp_op(38) <= divide_cp_ip(40);
  divide_dp_op(39) <= divide_cp_ip(39);
  divide_dp_op(40) <= divide_cp_ip(42);
  divide_dp_op(41) <= divide_cp_ip(41);
  divide_dp_op(42) <= divide_cp_ip(43);
  divide_dp_op(43) <= divide_cp_ip(44);
  divide_dp_op(44) <= divide_cp_ip(45);
  divide_dp_op(45) <= divide_cp_ip(46);
  divide_dp_op(46) <= divide_cp_ip(47);
  divide_dp_op(47) <= divide_cp_ip(48);
  divide_dp_op(48) <= divide_cp_ip(50);
  divide_dp_op(49) <= divide_cp_ip(49);
  divide_dp_op(50) <= divide_cp_ip(51);

  omega_op(1) <= divide_cp_ip(1);

end Behavioral;
