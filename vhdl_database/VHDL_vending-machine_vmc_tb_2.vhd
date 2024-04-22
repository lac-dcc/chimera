

selection : process 
begin
  in_a <= '1';
  in_b <= '0';
  in_c <= '0';
  in_d <= '0';
  in_e <= '0';
  in_f <= '0';
  in_0 <= '0';
  in_1 <= '0';
  in_2 <= '0';
  in_3 <= '0';
  in_4 <= '0';
  in_5 <= '0';
  in_6 <= '0';
  in_7 <= '0';
  in_8 <= '0';
  in_9 <= '0';
  wait for clk_period;
  in_a <= '0';
  in_b <= '0';
  in_c <= '0';
  in_d <= '0';
  in_e <= '0';
  in_f <= '0';
  in_0 <= '0';
  in_1 <= '0';
  in_2 <= '1';
  in_3 <= '0';
  in_4 <= '0';
  in_5 <= '0';
  in_6 <= '0';
  in_7 <= '0';
  in_8 <= '0';
  in_9 <= '0';
  wait for clk_period;
end process;  

money : process
begin
  nickle_in  <= 
  dime_in 
  quarter_in
end process; 

-- vim: ts=2:sts=2:sw=2:    
