----------------------------------------------------------------------------------
-- Richie Harris
-- rkharris12@gmail.com
-- 5/23/2021
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sha256_transform is
    generic (
      G_ROLL_FACTOR : integer -- 1=fully unrolled, 64=fully rolled
    );
    port (
        CLK      : in  std_logic;
        ARST_N   : in  std_logic;
        FEEDBACK : in  std_logic;
        COUNT    : in  unsigned(5 downto 0);
        STATE    : in  std_logic_vector(255 downto 0);
        DATA     : in  std_logic_vector(511 downto 0);
        HASH     : out std_logic_vector(255 downto 0)
    );
end sha256_transform;

architecture rtl of sha256_transform is

    component sha256_digester is
        port (
            CLK       : in  std_logic;
            ARST_N    : in  std_logic;
            K         : in  std_logic_vector(31 downto 0);
            STATE_IN  : in  std_logic_vector(255 downto 0);
            DATA_IN   : in  std_logic_vector(511 downto 0);
            STATE_OUT : out std_logic_vector(255 downto 0);
            DATA_OUT  : out std_logic_vector(511 downto 0)
            );
    end component;

    constant C_NUM_DIGESTERS : integer := 64/G_ROLL_FACTOR;
    constant C_WORD_SIZE     : integer := 32;
    type slv_array_type is array (natural range <>) of std_logic_vector;
    
    constant C_SHA_CONSTS : slv_array_type(63 downto 0)(C_WORD_SIZE - 1 downto 0) :=
    (
        63 => X"428a2f98",
        62 => X"71374491",
        61 => X"b5c0fbcf", 
        60 => X"e9b5dba5",
        59 => X"3956c25b",
        58 => X"59f111f1",
        57 => X"923f82a4",
        56 => X"ab1c5ed5",
        55 => X"d807aa98",
        54 => X"12835b01",
        53 => X"243185be", 
        52 => X"550c7dc3",
        51 => X"72be5d74",
        50 => X"80deb1fe",
        49 => X"9bdc06a7", 
        48 => X"c19bf174",
        47 => X"e49b69c1", 
        46 => X"efbe4786",
        45 => X"0fc19dc6",
        44 => X"240ca1cc",
        43 => X"2de92c6f",
        42 => X"4a7484aa", 
        41 => X"5cb0a9dc", 
        40 => X"76f988da",
        39 => X"983e5152",
        38 => X"a831c66d", 
        37 => X"b00327c8", 
        36 => X"bf597fc7",
        35 => X"c6e00bf3", 
        34 => X"d5a79147", 
        33 => X"06ca6351", 
        32 => X"14292967",
        31 => X"27b70a85", 
        30 => X"2e1b2138", 
        29 => X"4d2c6dfc",
        28 => X"53380d13",
        27 => X"650a7354", 
        26 => X"766a0abb", 
        25 => X"81c2c92e", 
        24 => X"92722c85",
        23 => X"a2bfe8a1",
        22 => X"a81a664b", 
        21 => X"c24b8b70", 
        20 => X"c76c51a3",
        19 => X"d192e819", 
        18 => X"d6990624", 
        17 => X"f40e3585", 
        16 => X"106aa070",
        15 => X"19a4c116", 
        14 => X"1e376c08", 
        13 => X"2748774c", 
        12 => X"34b0bcb5",
        11 => X"391c0cb3",
        10 => X"4ed8aa4a", 
        9  => X"5b9cca4f", 
        8  => X"682e6ff3",
        7  => X"748f82ee", 
        6  => X"78a5636f", 
        5  => X"84c87814", 
        4  => X"8cc70208",
        3  => X"90befffa", 
        2  => X"a4506ceb", 
        1  => X"bef9a3f7", 
        0  => X"c67178f2"
    );

    signal state_in_slv      : slv_array_type(C_NUM_DIGESTERS - 1 downto 0)(255 downto 0);
    signal state_out_slv     : slv_array_type(C_NUM_DIGESTERS - 1 downto 0)(255 downto 0);
    signal data_in_slv       : slv_array_type(C_NUM_DIGESTERS - 1 downto 0)(511 downto 0);
    signal data_out_slv      : slv_array_type(C_NUM_DIGESTERS - 1 downto 0)(511 downto 0);

begin

    -- choose to feed in or feedback data and state
    process(all) begin
        if (feedback = '1') then
            for i in 0 to C_NUM_DIGESTERS - 1 loop
                state_in_slv(i) <= state_out_slv(i);
                data_in_slv(i)  <= data_out_slv(i);
            end loop;
        else
            for i in 0 to C_NUM_DIGESTERS - 1 loop
                if (i = 0) then
                    state_in_slv(i) <= STATE;
                    data_in_slv(i)  <= DATA;
                else
                    state_in_slv(i) <= state_out_slv(i - 1);
                    data_in_slv(i)  <= data_out_slv(i - 1);
                end if;
            end loop;
        end if;
    end process;

    -- instantiate the number of parallel digesters we want
    GEN_DIGESTERS : for i in 0 to C_NUM_DIGESTERS - 1 generate
        sha256_digester_x : sha256_digester
            port map (
                CLK       => CLK,
                ARST_N    => ARST_N,
                K         => C_SHA_CONSTS(63 - G_ROLL_FACTOR*i - to_integer(COUNT)),
                STATE_IN  => state_in_slv(i),
                DATA_IN   => data_in_slv(i),
                STATE_OUT => state_out_slv(i),
                DATA_OUT  => data_out_slv(i)
            );
    end generate;

    -- assign output
    process(CLK, ARST_N) begin
        if (ARST_N = '0') then
            HASH <= (others => '0');
        elsif rising_edge(CLK) then
            if (feedback = '0') then
                HASH(C_WORD_SIZE - 1 downto 0)               <= std_logic_vector(unsigned(STATE(C_WORD_SIZE - 1 downto 0))               + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(C_WORD_SIZE - 1 downto 0)));
                HASH(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)   <= std_logic_vector(unsigned(STATE(2*C_WORD_SIZE - 1 downto C_WORD_SIZE))   + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)));
                HASH(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE)) + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE)));
                HASH(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE)) + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE)));
                HASH(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE)) + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE)));
                HASH(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE)) + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE)));
                HASH(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE)) + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE)));
                HASH(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE) <= std_logic_vector(unsigned(STATE(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE)) + unsigned(state_out_slv(C_NUM_DIGESTERS - 1)(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE)));
            end if;
        end if;
    end process;

end rtl;
