library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity jtag_chain is
  generic (
    size_bits: natural
  );
  port (
    TCK:        in std_logic;
--    RESET:      in std_logic;
    SHIFT:      in std_logic;
    UPDATE:     in std_logic;

    DATAIN:     in std_logic_vector(size_bits-1 downto 0);
    DATAOUT:    out std_logic_vector(size_bits-1 downto 0);
    TDI:        in std_logic;
    TDO:        out std_logic;
    SEL:        in std_logic;
    ENABLE:     in std_logic
  );
end entity;

architecture behave of jtag_chain is

  signal data_shift_q, data_q: std_logic_vector(size_bits-1 downto 0) := (others => '0');

begin
--  process(TCK)
--  begin
--    if falling_edge(TCK) then
      TDO <= data_shift_q(0);
--    end if;
--  end process;

  process(TCK)
  begin
    if rising_edge(TCK) then
      if ENABLE='1' and SEL='1' then
        if SHIFT='1' then
          data_shift_q(size_bits-2 downto 0) <= data_shift_q(size_bits-1 downto 1);
          data_shift_q(size_bits-1) <= TDI;
        else
          -- Capture
          data_shift_q <= DATAIN;
        end if;
      end if;
    end if;
  end process;

  process(UPDATE)
  begin
    if rising_edge(UPDATE) then
      if ENABLE='1' and SEL='1' then
        data_q <= data_shift_q;
      end if;
    end if;
  end process;

  DATAOUT <= data_q;

end behave;

