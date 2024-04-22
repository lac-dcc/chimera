library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- for f_log2 definition
use work.synthctrlpack.all;

library	unisim;
use unisim.vcomponents.all;

entity config_rom is
    generic (
        WIDTH : integer := 8;
        SIZE  : integer := 16384
    );
    port(
        clk     : in  std_logic;
        addr    : in  std_logic_vector(f_log2(SIZE) - 1 downto 0);
        data    : out std_logic_vector(WIDTH - 1 downto 0)
    );
end;

architecture rtl of config_rom is

-- number of bits in the RAMB16_S18
constant ramb16_size : integer := 16384;

-- determine shape of memory
constant block_size  : integer := ramb16_size / WIDTH;
constant block_bits  : integer := f_log2(block_size);
constant num_blocks  : integer := (SIZE + block_size - 1) / block_size;

type RAMBlDOut_Type is array(0 to num_blocks - 1) of std_logic_vector(data'range);

signal RAMBlDOut : RAMBlDOut_Type;

begin

RAM_Inst:for i in 0 to num_blocks - 1 generate
    Ram : RAMB16_S9
    generic map (
        INIT => X"00000", -- Value of output RAM registers at startup
        SRVAL => X"00000", -- Ouput value upon SSR assertion
        WRITE_MODE => "WRITE_FIRST" -- WRITE_FIRST, READ_FIRST or NO_CHANGE
    )
    port map(
        DO   => RAMBlDOut(i),
        ADDR => addr(block_bits - 1 downto 0),
        DI   => (others => '0'),
        DIP  => "1",
        EN   => '1',
        SSR  => '0',
        CLK  => clk,
        WE   => '0'
    );
end generate;

data <= RAMBlDOut(CONV_INTEGER(addr(addr'high downto block_bits)));

end rtl;
