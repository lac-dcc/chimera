-- This module provides a work-around for a bug in some newer HyperRAM devices,
-- specifically ISSI revision D dies.
--
-- See errata here: https://issi.com/WW/pdf/appnotes/sram/AN66WX001_VariableMode_MinimumDataSize.pdf
--
-- Created by Michael Jørgensen in 2023

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.numeric_std_unsigned.all;

entity hyperram_errata is
  port (
    clk_i                 : in    std_logic;
    rst_i                 : in    std_logic;
    s_avm_waitrequest_o   : out   std_logic;
    s_avm_write_i         : in    std_logic;
    s_avm_read_i          : in    std_logic;
    s_avm_address_i       : in    std_logic_vector(31 downto 0);
    s_avm_writedata_i     : in    std_logic_vector(15 downto 0);
    s_avm_byteenable_i    : in    std_logic_vector(1 downto 0);
    s_avm_burstcount_i    : in    std_logic_vector(7 downto 0);
    s_avm_readdata_o      : out   std_logic_vector(15 downto 0);
    s_avm_readdatavalid_o : out   std_logic;
    m_avm_waitrequest_i   : in    std_logic;
    m_avm_write_o         : out   std_logic;
    m_avm_read_o          : out   std_logic;
    m_avm_address_o       : out   std_logic_vector(31 downto 0);
    m_avm_writedata_o     : out   std_logic_vector(15 downto 0);
    m_avm_byteenable_o    : out   std_logic_vector(1 downto 0);
    m_avm_burstcount_o    : out   std_logic_vector(7 downto 0);
    m_avm_readdata_i      : in    std_logic_vector(15 downto 0);
    m_avm_readdatavalid_i : in    std_logic
  );
end entity hyperram_errata;

architecture synthesis of hyperram_errata is

  type   t_state is (NORMAL_ST, ERRATA_ST);
  signal state : t_state := NORMAL_ST;

begin

  s_avm_waitrequest_o   <= '1' when state = ERRATA_ST else
                           m_avm_waitrequest_i;
  s_avm_readdata_o      <= m_avm_readdata_i;
  s_avm_readdatavalid_o <= m_avm_readdatavalid_i;

  m_avm_write_o         <= '1' when state = ERRATA_ST else
                           s_avm_write_i;
  m_avm_read_o          <= '0' when state = ERRATA_ST else
                           s_avm_read_i;
  m_avm_address_o       <= s_avm_address_i;
  m_avm_writedata_o     <= s_avm_writedata_i;
  m_avm_byteenable_o    <= "00" when state = ERRATA_ST else
                           s_avm_byteenable_i;
  m_avm_burstcount_o    <= X"02" when s_avm_waitrequest_o = '0' and
                                      s_avm_write_i       = '1' and
                                      s_avm_burstcount_i = X"01" and
                                      state = NORMAL_ST else
                           s_avm_burstcount_i;



  fsm_proc : process (clk_i)
  begin
    if rising_edge(clk_i) then

      case state is

        when NORMAL_ST =>
          if s_avm_waitrequest_o = '0' and
             s_avm_write_i = '1' and
             s_avm_burstcount_i = X"01" then
            state <= ERRATA_ST;
          end if;

        when ERRATA_ST =>
          if m_avm_waitrequest_i = '0' then
            state <= NORMAL_ST;
          end if;

      end case;

      if rst_i = '1' then
        state <= NORMAL_ST;
      end if;
    end if;
  end process fsm_proc;

end architecture synthesis;

