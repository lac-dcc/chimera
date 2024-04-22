library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.types.all;
use work.constants.all;


entity vga_scanner is
    port (
        clk_vga, rst, enable: in std_logic;
        hsync_n, vsync_n: out std_logic;
        disp_buf_read_tick: out std_logic;
        disp_buf_read_addr: out std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
        pixel_valid: out std_logic
    );
end entity;


architecture Behavioral of vga_scanner is
    signal h_cnt_reg, h_cnt_next: int;
	signal v_cnt_reg, v_cnt_next: int;
    signal buf_tick_reg, buf_tick_next: std_logic;
    signal buf_addr_reg, buf_addr_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal scan_x, scan_y: int;
begin
    process (clk_vga, rst) is
    begin
        if rst = '1' then
            h_cnt_reg <= 0;
            v_cnt_reg <= 0;
            buf_tick_reg <= '1';
        elsif rising_edge(clk_vga) then
            h_cnt_reg <= h_cnt_next;
            v_cnt_reg <= v_cnt_next;
            buf_tick_reg <= buf_tick_next;
        end if;
    end process;
    h_cnt_next <= h_cnt_reg         when enable = '0' else
                  0                 when h_cnt_reg = H_LINE_PERIOD - 1 else
                  h_cnt_reg + 1;
    v_cnt_next <= v_cnt_reg         when enable = '0' or h_cnt_reg < H_LINE_PERIOD - 1 else
                  0                 when v_cnt_reg = V_FRAME_PERIOD - 1 else
                  v_cnt_reg + 1;
    buf_tick_next <= buf_tick_reg   when enable = '0' else
                     '1'            when (h_cnt_reg <= H_SYNC_PULSE + H_BACK_PORCH - 2) or (h_cnt_reg >= H_SYNC_PULSE + H_BACK_PORCH + H_ACTIVE - 2) else
                     not buf_tick_reg;

    process (buf_tick_reg, rst) is
    begin
        if rst = '1' then
            buf_addr_reg <= (others => '0');
        elsif falling_edge(buf_tick_reg) then
            buf_addr_reg <= buf_addr_next;
        end if;
    end process;
    scan_x <= (h_cnt_reg - H_SYNC_PULSE - H_BACK_PORCH + 1) / 2; -- next.
    scan_y <= (v_cnt_reg - V_SYNC_PULSE - V_BACK_PORCH) / 2;
    buf_addr_next <= buf_addr_reg when enable = '0' else
                     std_logic_vector(to_unsigned(scan_y * H_REAL + scan_x, DISP_RAM_ADDR_RADIX));


    hsync_n <= '0' when h_cnt_reg < H_SYNC_PULSE else '1';
    vsync_n <= '0' when v_cnt_reg < V_SYNC_PULSE else '1';

    disp_buf_read_tick <= buf_tick_reg;
    disp_buf_read_addr <= buf_addr_reg;
    
    pixel_valid <= '1' when (h_cnt_reg >= H_SYNC_PULSE + H_BACK_PORCH) and (h_cnt_reg < H_SYNC_PULSE + H_BACK_PORCH + H_ACTIVE) and
                           (v_cnt_reg >= V_SYNC_PULSE + V_BACK_PORCH) and (v_cnt_reg < V_SYNC_PULSE + V_BACK_PORCH + V_ACTIVE) else '0';
end architecture;
