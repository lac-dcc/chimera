----------------------------------------------------------------------------------
-- Richie Harris
-- rkharris12@gmail.com
-- 5/23/2021
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity miner_top is
    port (
        CLK_125M : in std_logic
    );
end miner_top;

architecture rtl of miner_top is
    
    component soc_wrapper is
        port (
            ARST_AVL_N             : out std_logic_vector(0 to 0);
            CLK_AVL                : out std_logic;
            M_AVALON_ADDRESS       : out std_logic_vector(31 downto 0);
            M_AVALON_BYTEENABLE    : out std_logic_vector(3 downto 0);
            M_AVALON_READ          : out std_logic;
            M_AVALON_READDATA      : in  std_logic_vector(31 downto 0);
            M_AVALON_READDATAVALID : in  std_logic;
            M_AVALON_WAITREQUEST   : in  std_logic;
            M_AVALON_WRITE         : out std_logic;
            M_AVALON_WRITEDATA     : out std_logic_vector(31 downto 0)
        );
    end component;

    component sha256d_wrapper is
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
    end component;

    component pulse_cdc is
        port (
            CLK_IN     : in  std_logic;
            ARST_IN_N  : in  std_logic;
            CLK_OUT    : in  std_logic;
            ARST_OUT_N : in  std_logic;
            DIN        : in  std_logic;
            DOUT       : out std_logic
        );
    end component;

    component clk_wiz_0 is
        port ( 
            clk_out1 : out std_logic;
            resetn   : in  std_logic;
            locked   : out std_logic;
            clk_in1  : in  std_logic
        );  
    end component;

    -- constants
    constant C_ROLL_FACTOR_LOG2    : integer := 1;
    constant C_WORD_SIZE           : integer := 32;

    -- register interface
    signal arst_avl_n              : std_logic;
    signal clk_avl                 : std_logic;
    signal avl_address             : std_logic_vector(31 downto 0);
    signal avl_byteenable          : std_logic_vector(3 downto 0);
    signal avl_read                : std_logic;
    signal avl_readdata            : std_logic_vector(31 downto 0);
    signal avl_readdatavalid       : std_logic;
    signal avl_waitrequest         : std_logic;
    signal avl_write               : std_logic;
    signal avl_writedata           : std_logic_vector(31 downto 0);

    -- address decoding
    signal address_bank            : std_logic_vector(7 downto 0);
    signal address_offset          : std_logic_vector(7 downto 0);

    -- sha256d
    signal srst                    : std_logic;
    signal start                   : std_logic;
    signal mid_state               : std_logic_vector(255 downto 0);
    signal residual_data           : std_logic_vector(95 downto 0);
    signal target                  : std_logic_vector(255 downto 0);
    signal found                   : std_logic;
    signal not_found               : std_logic;
    signal found_reg               : std_logic;
    signal not_found_reg           : std_logic;
    signal golden_nonce            : std_logic_vector(31 downto 0);
    signal current_hash_req        : std_logic;
    signal current_nonce           : std_logic_vector(31 downto 0);
    signal current_nonce_latched   : std_logic_vector(31 downto 0);

    -- CDC
    signal clk_hash                : std_logic;
    signal arst_hash_n             : std_logic;
    signal arst_hash_sr            : std_logic_vector(3 downto 0);
    signal srst_resync             : std_logic;
    signal start_resync            : std_logic;
    signal found_resync            : std_logic;
    signal not_found_resync        : std_logic;
    signal current_hash_req_resync : std_logic;

begin

    -- clock generation --------------------------------------------
    mmcm_clk_hash : clk_wiz_0
        port map ( 
            clk_out1 => clk_hash,
            resetn   => '1',
            locked   => open,
            clk_in1  => CLK_125M
        );

    -- register interface ------------------------------------------
    process(clk_avl, arst_avl_n) begin
        if (arst_avl_n = '0') then
            avl_readdata      <= (others => '0');
            avl_readdatavalid <= '0';
            srst              <= '0';
            start             <= '0';
            found_reg         <= '0';
            not_found_reg     <= '0';
            current_hash_req  <= '0';
            mid_state         <= (others => '0');
            residual_data     <= (others => '0');
            target            <= (others => '0');
        elsif rising_edge(clk_avl) then
            --pulse generation
            avl_readdatavalid <= '0';
            avl_readdata      <= (others => '0');
            srst              <= '0';
            start             <= '0';
            current_hash_req  <= '0';
            -- register pulses from sha256d_wrapper
            if (found_resync = '1') then
                found_reg <= '1';
            end if;
            if (not_found_resync = '1') then
                not_found_reg <= '1';
            end if;
            -- read
            if (avl_read = '1') then
                avl_readdatavalid <= '1';
                if (to_integer(unsigned(address_bank)) = 0) then
                    case to_integer(unsigned(address_offset)) is
                        when 2 =>
                            avl_readdata(0) <= found_reg;
                            avl_readdata(1) <= not_found_reg;
                            -- clear status on read
                            found_reg     <= '0';
                            not_found_reg <= '0';
                        when 3 =>
                            avl_readdata <= golden_nonce;
                        when 5 =>
                            avl_readdata <= current_nonce_latched;
                        when others =>
                            null;
                    end case;
                end if;
                if (to_integer(unsigned(address_bank)) = 1) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            avl_readdata <= mid_state(C_WORD_SIZE - 1 downto 0);
                        when 1 =>
                            avl_readdata <= mid_state(2*C_WORD_SIZE - 1 downto C_WORD_SIZE);
                        when 2 =>
                            avl_readdata <= mid_state(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE);
                        when 3 =>
                            avl_readdata <= mid_state(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE);
                        when 4 =>
                            avl_readdata <= mid_state(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE);
                        when 5 =>
                            avl_readdata <= mid_state(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE);
                        when 6 =>
                            avl_readdata <= mid_state(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE);
                        when 7 =>
                            avl_readdata <= mid_state(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE);
                        when others =>
                            null;
                    end case;
                end if;
                if (to_integer(unsigned(address_bank)) = 2) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            avl_readdata <= residual_data(C_WORD_SIZE - 1 downto 0);
                        when 1 =>
                            avl_readdata <= residual_data(2*C_WORD_SIZE - 1 downto C_WORD_SIZE);
                        when 2 =>
                            avl_readdata <= residual_data(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE);
                        when others =>
                            null;
                    end case;
                end if;
                if (to_integer(unsigned(address_bank)) = 3) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            avl_readdata <= target(C_WORD_SIZE - 1 downto 0);
                        when 1 =>
                            avl_readdata <= target(2*C_WORD_SIZE - 1 downto C_WORD_SIZE);
                        when 2 =>
                            avl_readdata <= target(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE);
                        when 3 =>
                            avl_readdata <= target(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE);
                        when 4 =>
                            avl_readdata <= target(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE);
                        when 5 =>
                            avl_readdata <= target(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE);
                        when 6 =>
                            avl_readdata <= target(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE);
                        when 7 =>
                            avl_readdata <= target(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE);
                        when others =>
                            null;
                    end case;
                end if;
            -- write
            elsif (avl_write = '1') then
                if (to_integer(unsigned(address_bank)) = 0) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            srst             <= avl_writedata(0);
                        when 1 =>
                            start            <= avl_writedata(0);
                        when 4 =>
                            current_hash_req <= avl_writedata(0);
                        when others =>
                            null;
                    end case;
                end if;
                if (to_integer(unsigned(address_bank)) = 1) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            mid_state(C_WORD_SIZE - 1 downto 0)               <= avl_writedata;
                        when 1 =>
                            mid_state(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)   <= avl_writedata;
                        when 2 =>
                            mid_state(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE) <= avl_writedata;
                        when 3 =>
                            mid_state(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE) <= avl_writedata;
                        when 4 =>
                            mid_state(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE) <= avl_writedata;
                        when 5 =>
                            mid_state(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE) <= avl_writedata;
                        when 6 =>
                            mid_state(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE) <= avl_writedata;
                        when 7 =>
                            mid_state(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE) <= avl_writedata;
                        when others =>
                            null;
                    end case;
                end if;
                if (to_integer(unsigned(address_bank)) = 2) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            residual_data(C_WORD_SIZE - 1 downto 0)               <= avl_writedata;
                        when 1 =>
                            residual_data(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)   <= avl_writedata;
                        when 2 =>
                            residual_data(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE) <= avl_writedata;
                        when others =>
                            null;
                    end case;
                end if;
                if (to_integer(unsigned(address_bank)) = 3) then
                    case to_integer(unsigned(address_offset)) is 
                        when 0 =>
                            target(C_WORD_SIZE - 1 downto 0)               <= avl_writedata;
                        when 1 =>
                            target(2*C_WORD_SIZE - 1 downto C_WORD_SIZE)   <= avl_writedata;
                        when 2 =>
                            target(3*C_WORD_SIZE - 1 downto 2*C_WORD_SIZE) <= avl_writedata;
                        when 3 =>
                            target(4*C_WORD_SIZE - 1 downto 3*C_WORD_SIZE) <= avl_writedata;
                        when 4 =>
                            target(5*C_WORD_SIZE - 1 downto 4*C_WORD_SIZE) <= avl_writedata;
                        when 5 =>
                            target(6*C_WORD_SIZE - 1 downto 5*C_WORD_SIZE) <= avl_writedata;
                        when 6 =>
                            target(7*C_WORD_SIZE - 1 downto 6*C_WORD_SIZE) <= avl_writedata;
                        when 7 =>
                            target(8*C_WORD_SIZE - 1 downto 7*C_WORD_SIZE) <= avl_writedata;
                        when others =>
                            null;
                    end case;
                end if;
            end if;
        end if;
    end process;

    avl_waitrequest <= '0'; -- always ready
  
    -- decode register address
    address_bank   <= avl_address(15 downto 8);
    address_offset <= avl_address(7 downto 0);
    
    -- instantiate processor interface --------------------------------
    u_soc_wrapper : soc_wrapper
        port map (
            ARST_AVL_N(0)          => arst_avl_n,
            CLK_AVL                => clk_avl,
            M_AVALON_ADDRESS       => avl_address,
            M_AVALON_BYTEENABLE    => avl_byteenable,
            M_AVALON_READ          => avl_read,
            M_AVALON_READDATA      => avl_readdata,
            M_AVALON_READDATAVALID => avl_readdatavalid,
            M_AVALON_WAITREQUEST   => avl_waitrequest,
            M_AVALON_WRITE         => avl_write,
            M_AVALON_WRITEDATA     => avl_writedata
        );

    -- CDC logic ------------------------------------------------------
    -- don't bother CDC'ing mid_state, residual_data, target, and golden_nonce because
    -- they should be stable and unchanging when they will be used

    -- create async assertion, sync release reset_n for sha256d hasher
    process(clk_hash, arst_avl_n) begin
        if (arst_avl_n = '0') then
            arst_hash_sr <= (others => '0');
        elsif rising_edge(clk_hash) then
            arst_hash_sr <= arst_hash_sr(arst_hash_sr'high - 1 downto 0) & '1';
        end if;
    end process;

    arst_hash_n <= arst_hash_sr(arst_hash_sr'high);

    -- pulse CDCs
    srst_cdc : pulse_cdc
        port map (
            CLK_IN     => clk_avl,
            ARST_IN_N  => arst_avl_n,
            CLK_OUT    => clk_hash,
            ARST_OUT_N => arst_hash_n,
            DIN        => srst,
            DOUT       => srst_resync
        );

    start_cdc : pulse_cdc
        port map (
            CLK_IN     => clk_avl,
            ARST_IN_N  => arst_avl_n,
            CLK_OUT    => clk_hash,
            ARST_OUT_N => arst_hash_n,
            DIN        => start,
            DOUT       => start_resync
        );

    found_cdc : pulse_cdc
        port map (
            CLK_IN     => clk_hash,
            ARST_IN_N  => arst_hash_n,
            CLK_OUT    => clk_avl,
            ARST_OUT_N => arst_avl_n,
            DIN        => found,
            DOUT       => found_resync
        );
    
    not_found_cdc : pulse_cdc
        port map (
            CLK_IN     => clk_hash,
            ARST_IN_N  => arst_hash_n,
            CLK_OUT    => clk_avl,
            ARST_OUT_N => arst_avl_n,
            DIN        => not_found,
            DOUT       => not_found_resync
        );

    current_hash_req_cdc : pulse_cdc
        port map (
            CLK_IN     => clk_avl,
            ARST_IN_N  => arst_avl_n,
            CLK_OUT    => clk_hash,
            ARST_OUT_N => arst_hash_n,
            DIN        => current_hash_req,
            DOUT       => current_hash_req_resync
        );

    -- latch current_nonce when requested, current_nonce_latched should be stable
    -- when we read it on clk_avl so don't bother registering it on clk_avl
    process(clk_hash, arst_hash_n) begin
        if (arst_hash_n = '0') then
            current_nonce_latched <= (others => '0');
        elsif rising_edge(clk_hash) then
            if (current_hash_req_resync = '1') then
                current_nonce_latched <= current_nonce;
            end if;
        end if;
    end process;

    -- instantiate sha256d hasher -------------------------------------
    u_sha256d_wrapper : sha256d_wrapper
        generic map (
            G_ROLL_FACTOR_LOG2 => C_ROLL_FACTOR_LOG2 -- 0=fully unrolled, 6=fully rolled
        )
        port map (
            CLK           => clk_hash,
            ARST_N        => arst_hash_n,
            SRST          => srst_resync,
            START         => start_resync,
            MID_STATE     => mid_state,
            RESIDUAL_DATA => residual_data,
            TARGET        => unsigned(target),
            FOUND         => found,
            NOT_FOUND     => not_found,
            GOLDEN_NONCE  => golden_nonce,
            CURRENT_NONCE => current_nonce
        );

end rtl;
