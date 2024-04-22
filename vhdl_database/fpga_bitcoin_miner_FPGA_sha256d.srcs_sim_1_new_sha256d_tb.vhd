----------------------------------------------------------------------------------
-- Richie Harris
-- rkharris12@gmail.com
-- 5/23/2021
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sha256d_tb is

end sha256d_tb;

architecture sim of sha256d_tb is

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

    constant C_CLK_PERIOD           : time := 10 ns; -- 100 MHz

    constant C_ROLL_FACTOR_LOG2     : integer := 0;
    constant C_ROLL_FACTOR          : integer := 2**C_ROLL_FACTOR_LOG2;
    constant C_NUM_STARTUP_ROUNDS   : integer := 2*(64/C_ROLL_FACTOR) + 1;
    constant C_GOLDEN_NONCE_OFFSET  : integer := 2**(7 - C_ROLL_FACTOR_LOG2) + 1;

    constant C_STATE_INIT           : std_logic_vector := X"5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667";
    constant C_FIRST_HASH_PAD       : std_logic_vector := X"000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000";
    constant C_SECOND_HASH_PAD      : std_logic_vector := X"0000010000000000000000000000000000000000000000000000000080000000";

    signal clk                      : std_logic := '1';
    signal arst_n                   : std_logic := '0';

    signal start                    : std_logic;
    signal residual_data            : std_logic_vector(95 downto 0);
    signal mid_state                : std_logic_vector(255 downto 0);
    signal target                   : unsigned(255 downto 0);
    signal true_golden_nonce        : std_logic_vector(31 downto 0);

    signal nonce                    : unsigned(31 downto 0);
    signal feedback                 : std_logic;
    signal count                    : unsigned(5 downto 0);
    signal valid                    : std_logic;
    signal startup_rounds_count     : unsigned(7 downto 0);

    signal hash1                    : std_logic_vector(255 downto 0);
    signal hash2                    : std_logic_vector(255 downto 0);

    signal done                     : std_logic;
    signal golden_nonce             : std_logic_vector(31 downto 0);
    signal golden_hash              : std_logic_vector(255 downto 0);

begin

    -- clk and arst_n
    clk    <= not clk after C_CLK_PERIOD/2;
    arst_n <= '1' after 10*C_CLK_PERIOD;

    -- send input data
    process begin
        start             <= '0';
        mid_state         <= (others => '0');
        residual_data     <= (others => '0');
        target            <= (others => '0');
        true_golden_nonce <= (others => '0');

        wait for 20*C_CLK_PERIOD;

        start             <= '1';
        mid_state         <= X"74b4c79dbf5de76d0815e94b0d66604341602d39063461d5faf888259fd47d57";
        residual_data     <= X"b3936a1aa6c8cb4d1a65600e";
        target            <= X"0000000000006a93b30000000000000000000000000000000000000000000000";
        true_golden_nonce <= X"913914e3";
        
        wait for C_CLK_PERIOD;

        start <= '0';

        wait until (done = '1');
        report "golden nonce found!";
        report "nonce:  0x" & to_hstring(golden_nonce);
        report "hash2:  0x" & to_hstring(golden_hash);
        report "target: 0x" & to_hstring(target);
        wait;
    end process;

    -- control logic
    process(clk, arst_n) begin
        if (arst_n = '0') then
            feedback             <= '0';
            count                <= (others => '0');
            nonce                <= (others => '0');
            startup_rounds_count <= (others => '0');
            valid                <= '0';
        elsif rising_edge(clk) then
            count    <= count + 1;
            feedback <= '1';
            valid    <= '0';
            if (count = C_ROLL_FACTOR - 1) then
                count    <= (others => '0');
                feedback <= '0';
                nonce    <= nonce + 1;
                if (startup_rounds_count < C_NUM_STARTUP_ROUNDS) then
                    startup_rounds_count <= startup_rounds_count + 1;
                end if;
            end if;
            if (start = '1') then
                nonce                <= unsigned(true_golden_nonce) - 5; -- exercise the code a little
                count                <= (others => '0');
                feedback             <= '0';
                startup_rounds_count <= (others => '0');
            end if;
            if (startup_rounds_count = C_NUM_STARTUP_ROUNDS) then
                valid <= not feedback;
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
            STATE    => mid_state,
            DATA     => C_FIRST_HASH_PAD & rev_byte_order_in_words(std_logic_vector(nonce)) & residual_data,
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
            done         <= '0';
            golden_nonce <= (others => '0');
            golden_hash  <= (others => '0');
        elsif rising_edge(clk) then
            done      <= '0';
            hash2_rev := rev_byte_order_in_words(hash2);
            if ((valid = '1') and (unsigned(hash2_rev) < target)) then
                done        <= '1';
                golden_hash <= hash2_rev;
                if (C_ROLL_FACTOR = 1) then
                    golden_nonce <= std_logic_vector(nonce - 130);
                else
                    golden_nonce <= std_logic_vector(nonce - C_GOLDEN_NONCE_OFFSET);
                end if;
            end if;
        end if;
    end process;

end sim;
