library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- For f_log2 definition
use WORK.SynthCtrlPack.all;

library	unisim;
use unisim.vcomponents.all;

entity XPM is
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

architecture RTL of XPM is

-- number of bits in the RAMB16_S18
constant ramb16_size : integer := 16384;

-- determine shape of memory
constant block_size  : integer := ramb16_size / WIDTH;
constant block_bits  : integer := f_log2(block_size);
constant num_blocks  : integer := (SIZE + block_size - 1) / block_size;

type RAMBlDOut_Type is array(0 to num_blocks - 1) of std_logic_vector(dout'range);

signal RAMBlDOut : RAMBlDOut_Type;

begin

RAM_Inst:for i in 0 to num_blocks - 1 generate
    Ram : RAMB16_S18 
    generic map (
        INIT => X"00000", -- Value of output RAM registers at startup
        SRVAL => X"00000", -- Ouput value upon SSR assertion
        WRITE_MODE => "WRITE_FIRST" -- WRITE_FIRST, READ_FIRST or NO_CHANGE
    )
    port map(
        DO   => RAMBlDOut(i),
        ADDR => address(block_bits - 1 downto 0),
        DI   => din,
        DIP  => "11",
        EN   => ce,
        SSR  => '0',
        CLK  => cp2,
        WE   => '0'
    );									  
end generate;

dout <= RAMBlDOut(CONV_INTEGER(address(address'high downto block_bits)));

end RTL;
