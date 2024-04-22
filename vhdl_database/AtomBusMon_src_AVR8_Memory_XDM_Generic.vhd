library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- For f_log2 definition
use WORK.SynthCtrlPack.all;

entity XDM is
    generic (
        WIDTH : integer;
        SIZE  : integer
    );
    port(
        cp2     : in  std_logic;
        ce      : in  std_logic;
        address : in  std_logic_vector(f_log2(SIZE) - 1 downto 0);
        din     : in  std_logic_vector(WIDTH - 1 downto 0);
        dout    : out std_logic_vector(WIDTH - 1 downto 0);
        we      : in  std_logic
    );
end;

architecture RTL of XDM is

    type ram_type is array (0 to SIZE - 1) of std_logic_vector (WIDTH - 1 downto 0);

    signal RAM : ram_type;

begin

    process (cp2)
    begin
        if rising_edge(cp2) then
            if ce = '1' then
                if (we = '1') then
                    RAM(conv_integer(address)) <= din;
                end if;
                dout <= RAM(conv_integer(address));
            end if;
        end if;
    end process;

end RTL;
