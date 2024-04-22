----------------------------------------------------------------------------------
-- Richie Harris
-- rkharris12@gmail.com
-- 5/23/2021
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sha256d_wrapper is
    generic (
        G_ROLL_FACTOR_LOG2 : integer -- 0=fully unrolled, 6=fully rolled
    );
    port (
        CLK           : in  std_logic;
        ARST_N        : in  std_logic;
        SRST          : in  std_logic;
        START         : in  std_logic;
        MID_STATE     : in  std_logic_vector(255 downto 0);
        RESIDUAL_DATA : in  std_logic_vector(95 downto 0);
        TARGET        : in  unsigned(255 downto 0);
        FOUND         : out std_logic;
        NOT_FOUND     : out std_logic;
        GOLDEN_NONCE  : out std_logic_vector(31 downto 0);
        CURRENT_NONCE : out std_logic_vector(31 downto 0)
    );
end sha256d_wrapper;

architecture rtl of sha256d_wrapper is

    function rev_byte_order_in_words(
        rev_input : std_logic_vector)
        return std_logic_vector is
        variable temp        : std_logic_vector(rev_input'length - 1 downto 0);
        constant c_num_words : integer := rev_input'length/32;
    begin
        for word in 0 to c_num_words-1 loop -- for each 32 bit word
            for byte in 0 to 3 loop -- for each byte in the word
                temp(32*word+8*(3-byte+1)-1 downto 32*word+8*(3-byte)) := rev_input(32*word+8*(byte+1)-1 downto 32*word+8*(byte));
            end loop;
        end loop;
        return temp;
    end rev_byte_order_in_words;

    component sha256_transform is
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
    end component;

    constant C_ROLL_FACTOR          : integer := 2**G_ROLL_FACTOR_LOG2;
    constant C_NUM_STARTUP_ROUNDS   : integer := 2*(64/C_ROLL_FACTOR) + 1;
    constant C_GOLDEN_NONCE_OFFSET  : integer := 2**(7 - G_ROLL_FACTOR_LOG2) + 1;
    constant C_MAX_NONCE            : std_logic_vector := X"FFFFFFFF";

    constant C_STATE_INIT           : std_logic_vector := X"5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667";
    constant C_FIRST_HASH_PAD       : std_logic_vector := X"000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000";
    constant C_SECOND_HASH_PAD      : std_logic_vector := X"0000010000000000000000000000000000000000000000000000000080000000";

    type state_type is (E_IDLE, E_HASH);
    signal state                    : state_type;

    signal nonce                    : unsigned(31 downto 0);
    signal feedback                 : std_logic;
    signal count                    : unsigned(5 downto 0);
    signal valid                    : std_logic;
    signal startup_rounds_count     : unsigned(7 downto 0);

    signal hash1                    : std_logic_vector(255 downto 0);
    signal hash2                    : std_logic_vector(255 downto 0);
    signal found_i                  : std_logic;

begin

    -- control logic
    process(clk, arst_n) begin
        if (arst_n = '0') then
            state                <= E_IDLE;
            feedback             <= '0';
            count                <= (others => '0');
            nonce                <= (others => '0');
            startup_rounds_count <= (others => '0');
            valid                <= '0';
            NOT_FOUND            <= '0';
        elsif rising_edge(clk) then
            NOT_FOUND <= '0'; -- pulse generation
            if (SRST = '1') then
                state                <= E_IDLE;
                feedback             <= '0';
                count                <= (others => '0');
                nonce                <= (others => '0');
                startup_rounds_count <= (others => '0');
                valid                <= '0';
            else
                case (state) is
                    -- wait for driver to configure registers and send start signal
                    when E_IDLE =>
                        if (START = '1') then
                            state                <= E_HASH;
                            nonce                <= (others => '0');
                            count                <= (others => '0');
                            feedback             <= '0';
                            startup_rounds_count <= (others => '0');
                        end if;
                    
                    -- iterate through all nonce values until golden nonce is found or the end is reached
                    when E_HASH =>
                        if (found_i = '1') then
                            state <= E_IDLE;
                        else
                            count    <= count + 1;
                            feedback <= '1';
                            valid    <= '0';
                            -- control feedback to digesters
                            if (count = C_ROLL_FACTOR - 1) then
                                count    <= (others => '0');
                                feedback <= '0';
                                nonce    <= nonce + 1;
                                if (nonce = unsigned(C_MAX_NONCE)) then
                                    state     <= E_IDLE;
                                    NOT_FOUND <= '1';
                                end if;
                                if (startup_rounds_count < C_NUM_STARTUP_ROUNDS) then
                                    startup_rounds_count <= startup_rounds_count + 1;
                                end if;
                            end if;
                            -- account for initial pipeline delay
                            if (startup_rounds_count = C_NUM_STARTUP_ROUNDS) then
                                valid <= not feedback;
                            end if;
                        end if;
                        
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    -- instantiate hashers
    sha1 : sha256_transform
        generic map (
          G_ROLL_FACTOR => C_ROLL_FACTOR -- 1=fully unrolled, 64=fully rolled
        )
        port map (
            CLK      => clk,
            ARST_N   => arst_n,
            FEEDBACK => feedback,
            COUNT    => count,
            STATE    => MID_STATE,
            DATA     => C_FIRST_HASH_PAD & rev_byte_order_in_words(std_logic_vector(nonce)) & RESIDUAL_DATA,
            HASH     => hash1
        );
    
    sha2 : sha256_transform
        generic map (
          G_ROLL_FACTOR => C_ROLL_FACTOR -- 1=fully unrolled, 64=fully rolled
        )
        port map (
            CLK      => clk,
            ARST_N   => arst_n,
            FEEDBACK => feedback,
            COUNT    => count,
            STATE    => C_STATE_INIT,
            DATA     => C_SECOND_HASH_PAD & hash1,
            HASH     => hash2
        );

    -- see if we found the golden nonce
    process(clk, arst_n) 
        variable hash2_rev : std_logic_vector(255 downto 0);
    begin
        if (arst_n = '0') then
            found_i      <= '0';
            GOLDEN_NONCE <= (others => '0');
        elsif rising_edge(clk) then
            found_i   <= '0';
            hash2_rev := rev_byte_order_in_words(hash2);
            if ((valid = '1') and (unsigned(hash2_rev) < TARGET)) then
                found_i <= '1';
                -- account for offset from current nonce, no clean way for C_ROLL_FACTOR = 1
                if (C_ROLL_FACTOR = 1) then
                    GOLDEN_NONCE <= std_logic_vector(nonce - 130);
                else
                    GOLDEN_NONCE <= std_logic_vector(nonce - C_GOLDEN_NONCE_OFFSET);
                end if;
            end if;
        end if;
    end process;

    FOUND         <= found_i;
    CURRENT_NONCE <= std_logic_vector(nonce);

end rtl;
