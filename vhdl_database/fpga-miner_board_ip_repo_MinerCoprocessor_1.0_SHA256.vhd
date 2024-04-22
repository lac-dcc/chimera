library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sha256_functions.all;

entity SHA256 is
    generic (
		INPUT_MESSAGE_LENGTH    : integer   := 512;
		INPUT_BLOCK_DIVISION    : integer   := 512;
        HASH_LENGTH             : integer   := 256;
        BLOCK_LENGTH            : integer   := 32
	);
	port(
	    clk             : in std_logic;
	    reset           : in std_logic;
        enable          : in std_logic;
        update          : in std_logic;
        input_word      : in std_logic_vector(INPUT_MESSAGE_LENGTH-1 downto 0);
        done            : out std_logic;
        hashes          : inout std_logic_vector(HASH_LENGTH-1 downto 0)
    );
end SHA256;

architecture Behavioral of SHA256 is
    -- Sha256 signals
    --signal Hashes                 : std_logic_vector( 255 downto 0 ) := ( others => '0' ); -- A generic 256-bit register. Holds H(7-0) values.
    signal W                      : wordArray;
    signal M                      : BlockM ((kCalculator(INPUT_BLOCK_DIVISION) + INPUT_BLOCK_DIVISION + 1 + 64 )/ 512 - 1 downto 0 ) := ( (others => ( others => '0' ) ) );
    signal a, b, c, d, e, f, g, h : std_logic_vector( 31 downto 0 );       -- Working registers.
    signal init, ready, padded, schedulled, hashed : std_logic := '0';     -- Main process flags.
begin
    
    ------------------------------------------------
    -----           SHA256 code               ------
    ------------------------------------------------
    sha256: process(clk, reset, enable, update, Hashes)
        variable i, t, hashIt : integer := 0; -- Iterators.
        variable N : integer := 0; -- Holds total number of Message blocks.
        variable T1, T2 : std_logic_vector( 31 downto 0 ); -- Hold temporary values.
    begin
        if (reset = '0' or update = '1') then
            -- Reset flags.
            done <= '0';
            ready <= '0'; 
            padded <= '0';
            schedulled <= '0';
            hashed <= '0';
            init <= '1';
            M <= ((others =>( others => '0' )));
            -- Reset variables
            i := 0;
            t := 0;
            hashIt := 0;
            N := 0;
        elsif (rising_edge(clk) and enable = '1') then
            -- If diggest is not estimated yet and input message is not padded.
            if (ready = '0' and padded = '0') then
                N := (kCalculator(INPUT_BLOCK_DIVISION) + INPUT_BLOCK_DIVISION + 1 + 64)/512; -- Count total (512-bit) blocks in the padded message.
                M <= messagePadding(input_word, INPUT_BLOCK_DIVISION); -- Get padded message to M(N) blocks.
                i := 0; -- Clear M block's pointer.
                padded <= '1'; -- Update current flag.
                -- If diggest is not estimated yet and padded message is not schedulled for the i'th message block.
            elsif (ready = '0' and padded = '1' and schedulled = '0') then
                -- Prepare the message schedule.
                if (t >= 0 and t <= 15) then 
                    W(15 - t) <= M (i) (((32*(t + 1)) - 1) downto (32*t));
                elsif (t >= 16 and t <= 63) then
                    W(t) <= std_logic_vector(unsigned(sigma1(W(t - 2))) + unsigned(W(t - 7)) + unsigned(sigma0(W(t - 15))) + unsigned(W(t - 16)));
                else
                    schedulled <= '1'; -- Update current flag.
                    initializeWork(a, b, c , d, e, f, g, h, hashes); -- Initialize working registers.
                    hashIt := 0; -- Set hash iterator to 0.
                    hashed <= '0'; -- Update hash flag.
                end if;
                t := t + 1; 
            -- If current M block has not been hashed.
            elsif (ready = '0' and padded = '1' and schedulled = '1' and hashed = '0') then                 
                if hashIt < 64 then
                    -- The current M block is hashed as defined in 6.2.2.
                    T1 := std_logic_vector(unsigned(h) + unsigned(capSigma1(e)) + unsigned(ch(e, f, g)) + unsigned(constK(hashIt)) + unsigned(W(hashIt)));
                    T2 := std_logic_vector(unsigned(maj(a, b, c)) + unsigned(capSigma0(a)));
                    h <= g;
                    g <= f;
                    f <= e;
                    e <= std_logic_vector(unsigned(d) + unsigned(T1));
                    d <= c;
                    c <= b;
                    b <= a;
                    a <= std_logic_vector(unsigned(T1) + unsigned(T2));
                    hashIt := hashIt + 1; -- Increase hash iterator.
                else
                    hashed <= '1'; -- Update current flag.
                end if;
            -- Check for remaining M blocks to be hashed.
            elsif (ready = '0' and padded = '1' and schedulled = '1' and hashed = '1') then
                updateHashes(hashes, a, b, c , d, e, f, g, h); -- Update hash register values.
                if (i + 1 < N) then 
                    i := i + 1; -- Point to next Message block.
                    t := 0; -- Clear schedulle iterator.
                    schedulled <= '0'; -- Update Schedulle flag. 
                else -- All Message block have been hashed.
                    ready <= '1'; -- Update ready flag.
                end if;
            -- Hash process is over.
            else
                -- Update output register with the final hash value.
                --s_hash <= setDigest (Hashes);
                done <= '1';
            end if;     
        end if;
    end process sha256;
    
end Behavioral;
