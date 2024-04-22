----------------------------------------------------------------------------------
-- Generates User Interrput on completion of ipbus packet from transactor
-- Raghunandan Shukla, TIFR
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pcie_int_gen_msix is
  port (
    pcie_usr_clk     : in std_logic;
    pcie_sys_rst_n   : in std_logic;
    pcie_usr_int_req : out std_logic;
    pcie_usr_int_ack : in std_logic;
    pcie_event0      : in std_logic
  );
end pcie_int_gen_msix;

architecture rtl of pcie_int_gen_msix is
  signal event0_i: std_logic;

begin

  -- sync input event
  process(pcie_usr_clk)
  begin
    if rising_edge(pcie_usr_clk) then
      event0_i <= pcie_event0;
    end if;
  end process;

  process (pcie_usr_clk)
    variable state: std_logic_vector(2 downto 0):= "000";
    variable clk_count: integer := 0;
  begin
    if rising_edge (pcie_usr_clk) then
      if (pcie_sys_rst_n = '0' ) then
        pcie_usr_int_req <= '0';
        state := "000";
      else
        case (state) is
          when "000" => if(event0_i = '1') then
                          state := "001";
                          pcie_usr_int_req <= '1';
                          clk_count := 0;
                        else
                          state := "000";
                        end if;
          -- msix gives two acks
          when "001" => if( pcie_usr_int_ack = '1') then
                          state := "010";
                          pcie_usr_int_req <= '0';
                        else
                          state := "001";
                        end if;

          -- avoide repeat assertion for same event               
          when "010" => if(event0_i = '0') then
                          state := "000";
                        else
                          state := "010";
                        end if;

          -- wait for deassertion  -- may be include c2h0_dsc flag ?
          -- when "010" => if( pcie_usr_int_ack = '1') then
          --                state := "000";
          --              else
          --                state := "010";
          --             end if;

          when "011" => pcie_usr_int_req <= '1';
                        state := "001";
                        
          when others => state := "000";
        end case;
   
      end if;
    end if;
  end process;

end rtl;
