library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

library work;
use work.psram_pack.all;

-- Generic top-level entity for Altera DE1 board
entity mem_tang_9k is
    generic (
        PRJ_ROOT             : string;
        MOS_NAME             : string;
        SIM                  : boolean;
        IncludeMonitor       : boolean := false;
        IncludeBootstrap     : boolean;
        IncludeMinimalMaster : boolean := false;  -- Creates a build to test 4x16K ROM Images
        IncludeMinimalBeeb   : boolean := false   -- Creates a build to test 4x16K ROM Images
        );
    port(
        CLK_96            : in  std_logic;
        CLK_96_P          : in  std_logic;
        CLK_48            : in  std_logic;
        rst_n             : in  std_logic;

        READY             : out std_logic;

        core_A_stb        : in    std_logic;
        core_A            : in    std_logic_vector (18 downto 0);
        core_Din          : in    std_logic_vector (7 downto 0);
        core_Dout         : out   std_logic_vector (7 downto 0);
        core_nCS          : in    std_logic;
        core_nWE          : in    std_logic;
        core_nWE_long     : in    std_logic;
        core_nOE          : in    std_logic;

        O_psram_ck        : out    std_logic_vector(1 downto 0);
        O_psram_ck_n      : out    std_logic_vector(1 downto 0);
        IO_psram_rwds     : inout  std_logic_vector(1 downto 0);
        IO_psram_dq       : inout  std_logic_vector(15 downto 0);
        O_psram_cs_n      : out    std_logic_vector(1 downto 0);
        O_psram_reset_n   : out    std_logic_vector(1 downto 0);

        m128_mode         : in     std_logic;

        led               : out   std_logic_vector(5 downto 0);

        FLASH_CS          : out   std_logic;                     -- Active low FLASH chip select
        FLASH_SI          : out   std_logic;                     -- Serial output to FLASH chip SI pin
        FLASH_CK          : out   std_logic;                     -- FLASH clock
        FLASH_SO          : in    std_logic                      -- Serial input from FLASH chip SO pin
        );
end mem_tang_9k;

architecture rtl of mem_tang_9k is

    constant ROMSIZE : natural := 32768;

    type mem_mos_t is array(0 to ROMSIZE) of std_logic_vector(7 downto 0);

    impure function MEM_INIT_FILE(file_name:STRING) return mem_mos_t is
        FILE infile : text is in file_name;
        variable arr : mem_mos_t := (others => (others => '0'));
        variable inl : line;
        variable count : integer;
    begin
        if not IncludeBootstrap then
            count := 0;
            while not(endfile(infile)) and count < ROMSIZE loop
                readline(infile, inl);
                read(inl, arr(count));
                count := count + 1;
            end loop;
        end if;

        return arr;
    end function;

    signal r_mem_rom : mem_mos_t := MEM_INIT_FILE(PRJ_ROOT & MOS_NAME);

    -- psram controller
    signal i_psram_cmd_read    : std_logic;
    signal i_psram_cmd_write   : std_logic;
    signal i_psram_addr        : std_logic_vector(21 downto 0);
    signal i_psram_din         : std_logic_vector(15 downto 0);
    signal i_psram_dout        : std_logic_vector(15 downto 0);
    signal i_psram_busy        : std_logic;

    -- from bootstrap to psram controller
    signal i_X_Din         : std_logic_vector(7 downto 0);
    signal i_X_Dout        : std_logic_vector(7 downto 0);
    signal i_X_A_stb       : std_logic;
    signal i_X_A           : std_logic_vector(18 downto 0);
    signal i_X_nWE_long    : std_logic;
    signal i_X_nOE         : std_logic;
    signal i_X_nCS         : std_logic;

-----------------------------------------------
-- Bootstrap ROM Image from SPI FLASH into SRAM
-----------------------------------------------

    -- These are settings for use with a minimal 64K ROM config
    --
    --        Beeb          Master
    -- 0 -> 4 MOS 1.20      4 MOS 3.20
    -- 1 -> 8 MMFS          9 MMFS
    -- 2 -> E Ram Master    C Basic II
    -- 3 -> F Basic II      F Terminal
    constant user_rom_map_beeb_minimal    : std_logic_vector(63 downto 0) := x"000000000000FE84";
    constant user_rom_map_master_minimal  : std_logic_vector(63 downto 0) := x"000000000000FC94";
    constant user_rom_map_full            : std_logic_vector(63 downto 0) := x"FEDCBA9876543210";
    signal   user_rom_map                 : std_logic_vector(63 downto 0);

    -- start address of user data in FLASH as obtained from bitmerge.py
    -- this mus be beyond the end of the bitstream

    constant user_address_beeb            : std_logic_vector(23 downto 0) := x"000000";
    constant user_address_master_minimal  : std_logic_vector(23 downto 0) := x"010000";
    constant user_address_master_full     : std_logic_vector(23 downto 0) := x"040000";
    signal   user_address                 : std_logic_vector(23 downto 0);
    signal   user_length                  : std_logic_vector(23 downto 0);

    -- length of user data in FLASH = 256KB (16x 16K ROM) images
    constant user_length_full             : std_logic_vector(23 downto 0) := x"040000";

    -- length of user data in FLASH = 64KB (4x 16K ROM) images
    constant user_length_minimal          : std_logic_vector(23 downto 0) := x"010000";

    -- high when FLASH is being copied to SRAM, can be used by user as active high reset
    signal   i_bootstrap_busy  : std_logic;

    signal   i_bootstrap_reset_n  : std_logic;


    -- Signals for the bootstrap health monitor
    signal ADDR_INS0 : std_logic_vector(18 downto 0);
    signal ADDR_INS1 : std_logic_vector(18 downto 0);
    signal ADDR_VEC0 : std_logic_vector(18 downto 0);
    signal ADDR_VEC1 : std_logic_vector(18 downto 0);

    signal DATA_INS0 : std_logic_vector(7 downto 0);
    signal DATA_INS1 : std_logic_vector(7 downto 0);
    signal DATA_VEC0 : std_logic_vector(7 downto 0);
    signal DATA_VEC1 : std_logic_vector(7 downto 0);

    -- Bit 5 is the error bit
    -- Bit 4 is the done bit
    -- Bit 3 is the write/read bit (0 = write, 1 = read)

    constant DBG_00 : std_logic_vector(5 downto 0) := "000000";
    constant DBG_01 : std_logic_vector(5 downto 0) := "000001";
    constant DBG_02 : std_logic_vector(5 downto 0) := "000010";
    constant DBG_03 : std_logic_vector(5 downto 0) := "000011";
    constant DBG_04 : std_logic_vector(5 downto 0) := "000100";
    constant DBG_05 : std_logic_vector(5 downto 0) := "000101";
    constant DBG_06 : std_logic_vector(5 downto 0) := "000110";
    constant DBG_07 : std_logic_vector(5 downto 0) := "000111";
    constant DBG_08 : std_logic_vector(5 downto 0) := "001000";
    constant DBG_09 : std_logic_vector(5 downto 0) := "001001";
    constant DBG_0A : std_logic_vector(5 downto 0) := "001010";
    constant DBG_0B : std_logic_vector(5 downto 0) := "001011";
    constant DBG_0C : std_logic_vector(5 downto 0) := "001100";
    constant DBG_0D : std_logic_vector(5 downto 0) := "001101";
    constant DBG_0E : std_logic_vector(5 downto 0) := "001110";
    constant DBG_0F : std_logic_vector(5 downto 0) := "001111";
    constant DBG_DONE : std_logic_vector(5 downto 0) := "011111";
    signal   state  : std_logic_vector(5 downto 0) := DBG_00;

begin

    e_psram:PsramController
        generic map (
            FREQ => 96000000,
            LATENCY => 4,
            CS_DELAY => false
            )
        port map (
            clk         => CLK_96,
            clk_p       => CLK_96_P,
            resetn      => rst_n,
            read        => i_psram_cmd_read,
            write       => i_psram_cmd_write,
            addr        => i_psram_addr,
            din         => i_PSRAM_Din,
            byte_write  => '1',
            dout        => i_psram_dout,
            busy        => i_psram_busy,

            O_psram_ck     => O_psram_ck,
            O_psram_ck_n   => O_psram_ck_n,
            IO_psram_rwds  => IO_psram_rwds,
            IO_psram_dq    => IO_psram_dq,
            O_psram_cs_n   => O_psram_cs_n

            );

    --DB: TODO: eliminate if possible for latency, this required for timing closure
    p_reg:process(CLK_96)
    begin
        if rising_edge(CLK_96) then
            i_psram_cmd_read  <= not(i_X_nCS) and i_X_A_stb and not i_X_nOE;
            i_psram_cmd_write <= not(i_X_nCS) and i_X_A_stb and not i_X_nWE_long;
            i_psram_addr <= "000" & i_X_A;
            i_psram_din <= i_X_Din & i_X_Din;
        end if;
    end process;


    p_reset:process(CLK_96, rst_n)
    begin
        if rst_n = '0' then
            READY <= '0';
            i_bootstrap_reset_n <= '0';
        elsif rising_edge(CLK_96) then
            if i_psram_busy = '0' then
                i_bootstrap_reset_n <= '1';
            end if;
            READY <= not i_bootstrap_busy;
        end if;
    end process;


--------------------------------------------------------
-- BOOTSTRAP SPI FLASH to SRAM
--------------------------------------------------------

    GenBootstrap: if IncludeBootstrap generate


        user_address <=   user_address_master_minimal when m128_mode = '1' and     IncludeMinimalMaster else
                          user_address_master_full    when m128_mode = '1' and not IncludeMinimalMaster else
                          user_address_beeb;

        user_length  <=   user_length_minimal         when m128_mode = '1' and     IncludeMinimalMaster else
                          user_length_minimal         when m128_mode = '0' and     IncludeMinimalBeeb   else
                          user_length_full;

        user_rom_map <=   user_rom_map_master_minimal when m128_mode = '1' and     IncludeMinimalMaster else
                          user_rom_map_beeb_minimal   when m128_mode = '0' and     IncludeMinimalBeeb   else
                          user_rom_map_full;

        inst_bootstrap: entity work.bootstrap
            port map(
                clock           => CLK_48,
                powerup_reset_n => i_bootstrap_reset_n,
                bootstrap_busy  => i_bootstrap_busy,
                user_address    => user_address,
                user_length     => user_length,
                user_rom_map    => user_rom_map,
                RAM_A_stb       => core_A_stb,
                RAM_nOE         => core_nOE,
                RAM_nWE         => core_nWE,
                RAM_nWE_long    => core_nWE_long,
                RAM_nCS         => core_nCS,
                RAM_A           => core_A,
                RAM_Din         => core_Din,
                RAM_Dout        => core_Dout,
                SRAM_A_stb      => i_X_A_stb,
                SRAM_nOE        => i_X_nOE,
                SRAM_nWE        => open,
                SRAM_nWE_long   => i_X_nWE_long,
                SRAM_nCS        => i_X_nCS,
                SRAM_A          => i_X_A,
                SRAM_D_out      => i_X_Din,
                SRAM_D_in       => i_X_Dout,
                FLASH_CS        => FLASH_CS,
                FLASH_SI        => FLASH_SI,
                FLASH_CK        => FLASH_CK,
                FLASH_SO        => FLASH_SO
                );

        i_X_Dout <= i_psram_dout( 7 downto 0) when i_X_a(0) = '0' else
                    i_psram_dout(15 downto 8);


    end generate;

    NotGenBootstrap: if not IncludeBootstrap generate

        i_bootstrap_busy <= '0';
        i_X_A_stb      <= core_A_stb;
        i_X_nOE        <= core_nOE;
        i_X_nWE_long   <= core_nWE_long;
        i_X_nCS        <= core_nCS;
        i_X_A          <= core_A;
        i_X_Din        <= core_Din;
        core_Dout      <= i_X_Dout;

        FLASH_CS       <= '1';
        FLASH_SI       <= '1';
        FLASH_CK       <= '1';

        -- Minimal Model B ROM set
        p_ram_rd:process(CLK_48)
        begin
            if rising_edge(CLK_48) then
                if core_A(18) = '0' then
                    i_X_Dout <= r_mem_rom(to_integer(unsigned(core_A(14 downto 0))));
                else
                    if core_A(0) = '0' then
                        i_X_Dout <= i_psram_dout(7 downto 0);
                    else
                        i_X_Dout <= i_psram_dout(15 downto 8);
                    end if;
                end if;
            end if;
        end process;
    end generate;

    O_psram_reset_n <= rst_n & rst_n;


    --------------------------------------------------------
    -- Statemachine for debugging bootstrap failures
    --------------------------------------------------------

    mon : if IncludeMonitor generate

        -- Note:
        --   The OS is always mapped into rom slot 4 10000-13FFF
        --   On the Beeb the reset address of D9CD becomed 119CD
        --   On the Master the reset address of E364 becomed 12364

        ADDR_INS0 <= "001" & x"2364" when m128_mode = '1' else  "001" & x"19CD";
        ADDR_INS1 <= "001" & x"2365" when m128_mode = '1' else  "001" & x"19CE";
        ADDR_VEC0 <= "001" & x"3FFC";
        ADDR_VEC1 <= "001" & x"3FFD";

        DATA_INS0 <= x"A9";
        DATA_INS1 <= x"40";
        DATA_VEC0 <= x"64" when m128_mode = '1' else x"CD";
        DATA_VEC1 <= x"E3" when m128_mode = '1' else x"D9";

        process(CLK_48)
            variable cmd_write1 : std_logic;
            variable cmd_write2 : std_logic;
            variable test_write : std_logic;
            variable cmd_read1  : std_logic;
            variable cmd_read2  : std_logic;
            variable test_read  : std_logic;
            variable test_Dout  : std_logic_vector(7 downto 0);
        begin
            if rising_edge(CLK_48) then
                case (state) is
                    when DBG_00 =>
                        if rst_n = '0' then
                            if IncludeBootstrap then
                                state <= DBG_01;
                            else
                                state <= DBG_08;
                            end if;
                        end if;
                    when DBG_01 =>
                        if rst_n = '1' then
                            state <= DBG_02;
                        end if;
                    when DBG_02 =>
                        if i_bootstrap_reset_n = '0' then
                            state <= DBG_03;
                        end if;
                    when DBG_03 =>
                        -- The i_X_A term skips over the bootstrap writing zeros
                        if i_bootstrap_reset_n = '1' and i_X_A = ADDR_VEC1 then
                            state <= DBG_04;
                        end if;
                    when DBG_04 =>
                        if test_write = '1' then
                            if i_X_A = ADDR_INS0 then
                                if i_X_Din = DATA_INS0 then
                                    state <= DBG_05;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_05 =>
                        if test_write = '1' then
                            if i_X_A = ADDR_INS1 then
                                if i_X_Din = DATA_INS1 then
                                    state <= DBG_06;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_06 =>
                        if test_write = '1' then
                            if i_X_A = ADDR_VEC0 then
                                if i_X_Din = DATA_VEC0 then
                                    state <= DBG_07;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_07 =>
                        if  test_write = '1' then
                            if i_X_A = ADDR_VEC1 then
                                if i_X_Din = DATA_VEC1 then
                                    state <= DBG_08;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_08 =>
                        if i_bootstrap_busy = '1' then
                            state <= DBG_09;
                        end if;
                    when DBG_09 =>
                        if i_bootstrap_busy = '0' then
                            state <= DBG_0A;
                        end if;
                    when DBG_0A =>
                        if test_read = '1' then
                            if i_X_A = ADDR_VEC0 then
                                if test_Dout = DATA_VEC0 then
                                    state <= DBG_0B;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_0B =>
                        if test_read = '1' then
                            if i_X_A = ADDR_VEC1 then
                                if test_Dout = DATA_VEC1 then
                                    state <= DBG_0C;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_0C =>
                        if test_read = '1' then
                            if i_X_A = ADDR_INS0 then
                                if test_Dout = DATA_INS0 then
                                    state <= DBG_0D;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when DBG_0D =>
                        if test_read = '1' then
                            if i_X_A = ADDR_INS1 then
                                if test_Dout = DATA_INS1 then
                                    state <= DBG_DONE;
                                else
                                    state(5) <= '1';
                                end if;
                            end if;
                        end if;
                    when others =>
                        if rst_n = '0' then
                            state <= DBG_00;
                        end if;
                end case;
                -- Check writes at the start of the write cycle
                test_write := cmd_write1 and not cmd_write2;
                cmd_write2 := cmd_write1;
                if i_X_nCS = '0' and i_X_A_stb = '1' and i_X_nWE_long = '0' then
                    cmd_write1 := i_psram_cmd_write;
                elsif i_psram_busy = '0' then
                    cmd_write1 := '0';
                end if;
                -- Check reads at the end of the read cycle
                test_read  := not cmd_read1 and cmd_read2;
                cmd_read2  := cmd_read1;
                if i_X_nCS = '0' and i_X_A_stb = '1' and i_X_nOE = '0' then
                    cmd_read1  := '1';
                elsif i_psram_busy = '0' then
                    cmd_read1 := '0';
                end if;
                -- Move dout back to 48MHz domain
                test_Dout := i_X_Dout;
            end if;
        end process;

        led <= state xor "111111";

    end generate;

    not_mon : if not IncludeMonitor generate

        led <= "111111";

    end generate;

end rtl;
