entity start_ln is
  port(

    omega_ip : in bit_vector(1 downto 1);
    start_cp_ip : in bit_vector(32 downto 1);
    start_dp_ip : in bit_vector(26 downto 1);
    omega_op : out bit_vector(1 downto 1) := (others => '0');
    start_cp_op : out bit_vector(27 downto 1) := (others => '0');
    start_dp_op : out bit_vector(31 downto 1) := (others => '0');

    reset : in bit;
    clk   : in bit);
end start_ln;

architecture Behavioral of start_ln is 

begin

  omega_op(1) <= start_cp_ip(1);

  start_cp_op(1) <= omega_ip(1);
  start_cp_op(2) <= start_dp_ip(1);
  start_cp_op(3) <= start_dp_ip(2);
  start_cp_op(4) <= start_dp_ip(3);
  start_cp_op(5) <= start_dp_ip(4);
  start_cp_op(6) <= start_dp_ip(5);
  start_cp_op(7) <= start_dp_ip(6);
  start_cp_op(8) <= start_dp_ip(7);
  start_cp_op(9) <= start_dp_ip(8);
  start_cp_op(10) <= start_dp_ip(9);
  start_cp_op(11) <= start_dp_ip(10);
  start_cp_op(12) <= start_dp_ip(11);
  start_cp_op(13) <= start_dp_ip(12);
  start_cp_op(14) <= start_dp_ip(13);
  start_cp_op(15) <= start_dp_ip(14);
  start_cp_op(16) <= start_dp_ip(15);
  start_cp_op(17) <= start_dp_ip(16);
  start_cp_op(18) <= start_dp_ip(17);
  start_cp_op(19) <= start_dp_ip(18);
  start_cp_op(20) <= start_dp_ip(19);
  start_cp_op(21) <= start_dp_ip(20);
  start_cp_op(22) <= start_dp_ip(21);
  start_cp_op(23) <= start_dp_ip(22);
  start_cp_op(24) <= start_dp_ip(23);
  start_cp_op(25) <= start_dp_ip(24);
  start_cp_op(26) <= start_dp_ip(25);
  start_cp_op(27) <= start_dp_ip(26);

  start_dp_op(1) <= start_cp_ip(2);
  start_dp_op(2) <= start_cp_ip(3);
  start_dp_op(3) <= start_cp_ip(4);
  start_dp_op(4) <= start_cp_ip(6);
  start_dp_op(5) <= start_cp_ip(5);
  start_dp_op(6) <= start_cp_ip(8);
  start_dp_op(7) <= start_cp_ip(7);
  start_dp_op(8) <= start_cp_ip(10);
  start_dp_op(9) <= start_cp_ip(9);
  start_dp_op(10) <= start_cp_ip(12);
  start_dp_op(11) <= start_cp_ip(11);
  start_dp_op(12) <= start_cp_ip(13);
  start_dp_op(13) <= start_cp_ip(14);
  start_dp_op(14) <= start_cp_ip(16);
  start_dp_op(15) <= start_cp_ip(15);
  start_dp_op(16) <= start_cp_ip(18);
  start_dp_op(17) <= start_cp_ip(17);
  start_dp_op(18) <= start_cp_ip(20);
  start_dp_op(19) <= start_cp_ip(19);
  start_dp_op(20) <= start_cp_ip(21);
  start_dp_op(21) <= start_cp_ip(22);
  start_dp_op(22) <= start_cp_ip(23);
  start_dp_op(23) <= start_cp_ip(24);
  start_dp_op(24) <= start_cp_ip(25);
  start_dp_op(25) <= start_cp_ip(27);
  start_dp_op(26) <= start_cp_ip(26);
  start_dp_op(27) <= start_cp_ip(28);
  start_dp_op(28) <= start_cp_ip(30);
  start_dp_op(29) <= start_cp_ip(29);
  start_dp_op(30) <= start_cp_ip(31);
  start_dp_op(31) <= start_cp_ip(32);

end Behavioral;
