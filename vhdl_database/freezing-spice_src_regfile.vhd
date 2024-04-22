library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

entity regfile is
    port (clk   : in  std_logic;
          addra : in  std_logic_vector(4 downto 0);
          addrb : in  std_logic_vector(4 downto 0);
          rega  : out word;
          regb  : out word;
          addrw : in  std_logic_vector(4 downto 0);
          dataw : in  word;
          we    : in  std_logic);
end entity regfile;

--
-- Note: Because this core is FPGA-targeted, the idea is that these registers
--   will get implemented as dual-port Distributed RAM.  Because there is no
--   such thing as triple-port memory in an FPGA (that I know of), and we
--   need 3 ports to support 2 reads and 1 write per cycle, the easiest way
--   to implement that is to have two identical banks of registers that contain
--   the same data.  Each uses 2 ports and everybody's happy.
--
architecture rtl of regfile is
    type regbank_t is array (0 to 31) of word;

    signal regbank0 : regbank_t := (others => (others => '0'));
    signal regbank1 : regbank_t := (others => (others => '0'));
begin  -- architecture Behavioral

    -- purpose: create registers
    -- type   : sequential
    -- inputs : clk
    -- outputs: 
    registers_proc : process (clk) is
    begin  -- process registers_proc
        if rising_edge(clk) then
            if (we = '1') then
                regbank0(to_integer(unsigned(addrw))) <= dataw;
                regbank1(to_integer(unsigned(addrw))) <= dataw;
            end if;
        end if;
    end process registers_proc;

    -- asynchronous read
    rega <= regbank0(to_integer(unsigned(addra)));
    regb <= regbank1(to_integer(unsigned(addrb)));
    
end architecture rtl;
