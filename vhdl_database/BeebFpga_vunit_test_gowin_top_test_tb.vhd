library vunit_lib;
context vunit_lib.vunit_context;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use std.textio.all;

library fmf;

library work;

entity test_tb is
   generic (
      runner_cfg : string;
      BOARD_CLOCK_FREQ : natural := 27000000;
      PRJ_ROOT : string := "../../../../";
      MOS_NAME : string := "vunit_test/sim_asm/simple_mos/build/simple-mos.rom.bit"
      );
end test_tb;

architecture rtl of test_tb is

    signal i_clk_27           : std_logic;

   signal i_btn1_n            : std_logic;
   signal i_btn2_n            : std_logic;
   signal i_ps2_clk           : std_logic;
   signal i_ps2_data          : std_logic;
   signal i_ps2_mouse_clk     : std_logic;
   signal i_ps2_mouse_data    : std_logic;
   signal i_audiol            : std_logic;
   signal i_audior            : std_logic;
   signal i_tf_miso           : std_logic;
   signal i_tf_cs             : std_logic;
   signal i_tf_sclk           : std_logic;
   signal i_tf_mosi           : std_logic;
   signal i_uart_rx           : std_logic;
   signal i_uart_tx           : std_logic;
   signal i_led               : std_logic_vector (5 downto 0);

   signal i_vga_r             : std_logic;
   signal i_vga_b             : std_logic;
   signal i_vga_g             : std_logic;
   signal i_vga_hs            : std_logic;
   signal i_vga_vs            : std_logic;

         -- Magic ports for PSRAM to be inferred
   signal i_O_psram_ck        : std_logic_vector(1 downto 0);
   signal i_O_psram_ck_n      : std_logic_vector(1 downto 0);
   signal i_IO_psram_rwds     : std_logic_vector(1 downto 0);
   signal i_IO_psram_dq       : std_logic_vector(15 downto 0);
   signal i_O_psram_reset_n   : std_logic_vector(1 downto 0);
   signal i_O_psram_cs_n      : std_logic_vector(1 downto 0);

   signal i_GSRI              : std_logic;

   signal i_FLASH_CS          : std_logic;
   signal i_FLASH_SI          : std_logic;
   signal i_FLASH_CK          : std_logic;
   signal i_FLASH_SO          : std_logic;

begin
   p_clk:process
   constant PER2 : time := 500000 us / BOARD_CLOCK_FREQ;
   begin
      i_clk_27 <= '0';
      wait for PER2;
      i_clk_27 <= '1';
      wait for PER2;
   end process;

   p_rst:process
   begin
      i_GSRI <= '0';
      wait for 1 us;
      i_GSRI <= '1';
      wait;
   end process;

   i_btn1_n <= 'H';
   i_btn2_n <= 'H';

   i_ps2_clk <= 'H';
   i_ps2_data <= 'H';
   i_ps2_mouse_clk <= 'H';
   i_ps2_mouse_data <= 'H';

   i_tf_miso <= 'H';
   i_uart_rx <= 'H';

   p_main:process
   begin

      test_runner_setup(runner, runner_cfg);


      while test_suite loop

         if run("write then read") then
   
            wait for 100000 us;

         end if;

      end loop;

      wait for 3 us;

      test_runner_cleanup(runner); -- Simulation ends here
   end process;

   e_dut:entity work.bbc_micro_tang9k
   generic map (
        IncludeAMXMouse    => false,
        IncludeSID         => false,
        IncludeMusic5000   => false,
        IncludeICEDebugger => false,
        IncludeCoPro6502   => false,
        IncludeCoProSPI    => false,
        IncludeCoProExt    => false,
        IncludeVideoNuLA   => false,
        IncludeMinimal     => true,
        IncludeBootStrap   => true,
        UseOrigKeyboard    => false,
        UseT65Core         => true,
        UseAlanDCore       => false,
        PRJ_ROOT           => PRJ_ROOT,
        MOS_NAME           => MOS_NAME,
        SIM                => true
   )
   port map (
         clock_27        => i_clk_27,
         btn1_n          => i_btn1_n,
         btn2_n          => i_btn2_n,
         ps2_clk         => i_ps2_clk,
         ps2_data        => i_ps2_data,
         ps2_mouse_clk   => i_ps2_mouse_clk,
         ps2_mouse_data  => i_ps2_mouse_data,
         audiol          => i_audiol,
         audior          => i_audior,
         tf_miso         => i_tf_miso,
         tf_cs           => i_tf_cs,
         tf_sclk         => i_tf_sclk,
         tf_mosi         => i_tf_mosi,
         uart_rx         => i_uart_rx,
         uart_tx         => i_uart_tx,
         led             => i_led,

         vga_r           => i_vga_r,
         vga_b           => i_vga_b,
         vga_g           => i_vga_g,
         vga_hs          => i_vga_hs,
         vga_vs          => i_vga_vs,

         O_psram_ck     => i_O_psram_ck,
         O_psram_ck_n   => i_O_psram_ck_n,
         IO_psram_rwds  => i_IO_psram_rwds,
         IO_psram_dq    => i_IO_psram_dq,
         O_psram_reset_n=> i_O_psram_reset_n,
         O_psram_cs_n   => i_O_psram_cs_n,

         FLASH_CS       => i_FLASH_CS,
         FLASH_SI       => i_FLASH_SI,
         FLASH_CK       => i_FLASH_CK,
         FLASH_SO       => i_FLASH_SO
    );


   e_psram:entity work.s27kl0642
   port map (
    DQ7      => i_IO_psram_dq(7),
    DQ6      => i_IO_psram_dq(6),
    DQ5      => i_IO_psram_dq(5),
    DQ4      => i_IO_psram_dq(4),
    DQ3      => i_IO_psram_dq(3),
    DQ2      => i_IO_psram_dq(2),
    DQ1      => i_IO_psram_dq(1),
    DQ0      => i_IO_psram_dq(0),
    RWDS     => i_IO_psram_rwds(0),

    CSNeg    => i_O_psram_cs_n(0),
    CK       => i_O_psram_ck(0),
   CKn       => i_O_psram_ck_n(0),
    RESETNeg => i_O_psram_reset_n(0)
    );

   GSR: entity work.GSR
   port map (
      GSRI => i_GSRI
      );


   e_flash:entity fmf.s25fl032a
   generic map (
        mem_file_name       => PRJ_ROOT & "roms/rom_image_64K_beeb.hex",

        UserPreload         => true,

        tdevice_PU => 1 us

    )
    port map(
        SCK             => i_FLASH_CK,
        SI              => i_FLASH_SI,
        CSNeg           => i_FLASH_CS,
        HOLDNeg         => '1',
        WNeg            => '0',
        SO              => i_FLASH_SO
    );

   i_FLASH_SO <= 'H';

end rtl;
