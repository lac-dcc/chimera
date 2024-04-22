library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity GENERIC_FIFO is
    generic (
        FIFO_WIDTH : positive := 32;
        FIFO_DEPTH : positive := 1024
    );
    port (
        clock       : in std_logic;
        reset       : in std_logic;
        write_data  : in std_logic_vector(FIFO_WIDTH-1 downto 0);
        read_data   : out std_logic_vector(FIFO_WIDTH-1 downto 0);
        write_en    : in std_logic;
        read_en     : in std_logic;
        full        : out std_logic;
        empty       : out std_logic;
        level       : out std_logic_vector(
            integer(ceil(log2(real(FIFO_DEPTH))))-1 downto 0
        )
    );
end entity;

architecture RTL of GENERIC_FIFO is
    ---------------------------------------------------------------------------
    -- Functions
    ---------------------------------------------------------------------------
    function get_fifo_level(
        write_pointer   : unsigned;
        read_pointer    : unsigned;
        depth           : positive) return integer is
    begin
        if write_pointer > read_pointer then
            return to_integer(write_pointer - read_pointer);
        elsif write_pointer = read_pointer then
            return 0;
        else
            return (
                ((depth) - to_integer(read_pointer)) + 
                to_integer(write_pointer)
            );
        end if;
    end function get_fifo_level;
    ---------------------------------------------------------------------------
    -- Types
    ---------------------------------------------------------------------------
    type memory is array (0 to FIFO_DEPTH-1) of std_logic_vector(
        FIFO_WIDTH-1 downto 0
    );
    ---------------------------------------------------------------------------
    -- Signals
    ---------------------------------------------------------------------------
    signal fifo_memory : memory := (others => (others => '0'));
    signal read_pointer, write_pointer : unsigned(
        integer(ceil(log2(real(FIFO_DEPTH))))-1 downto 0
    ) := (others => '0');
    signal fifo_empty : std_logic := '1';
    signal fifo_full : std_logic := '0';
begin
    full <= fifo_full;
    empty <= fifo_empty;
    FIFO_FLAGS : process(write_pointer, read_pointer) is
        variable lev : integer range 0 to FIFO_DEPTH - 1;
    begin
        lev := get_fifo_level(write_pointer, read_pointer, FIFO_DEPTH);
        level <= std_logic_vector(to_unsigned(lev, level'length));
        if lev = FIFO_DEPTH - 1 then
            fifo_full <= '1';
        else
            fifo_full <= '0';
        end if;
        if lev = 0 then
            fifo_empty <= '1';
        else
            fifo_empty <= '0';
        end if;
    end process;
    FIFO_LOGIC : process(clock) is
    begin
        if rising_edge(clock) then
            if reset = '1' then
                write_pointer   <= (others => '0');
                read_pointer    <= (others => '0');
            else
                -- FIFO WRITE
                if write_en = '1' and fifo_full = '0' then
                    fifo_memory(to_integer(write_pointer)) <= write_data;
                    if write_pointer < FIFO_DEPTH - 1 then
                        write_pointer <= write_pointer + 1;
                    else
                        write_pointer <= (others => '0');
                    end if;
                end if;
                -- FIFO READ
                if read_en = '1' and fifo_empty = '0' then
                    if read_pointer < FIFO_DEPTH - 1 then
                        read_pointer <= read_pointer + 1;
                    else
                        read_pointer <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    read_data <= fifo_memory(to_integer(read_pointer));
    
end RTL;