library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

use work.constants.all;
use work.types.all;


entity top_module is
    port (
        clk_sys, rst: in std_logic;

        btn_front_in, btn_back_in, btn_left_in, btn_right_in, btn_up_in, btn_down_in: in std_logic;

        spi_cs, spi_clk, spi_mosi: out std_logic;
        spi_miso: in std_logic;

        vgaout: out vga_t;
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of top_module is
    component clk_vga_generator is
        port (
            clk_sys, reset: in std_logic;
            clk_vga, locked: out std_logic
        );
    end component;

    component vga_scanner is
        port (
            clk_vga, rst, enable: in std_logic;
            hsync_n, vsync_n: out std_logic;
            disp_buf_read_tick: out std_logic;
            disp_buf_read_addr: out std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
            pixel_valid: out std_logic
        );
    end component;

    component display_buffers is
        port (
            clk_write: in std_logic;
            en_write: in std_logic;
            we_write: in std_logic_vector(0 downto 0);
            addr_write: in std_logic_vector(16 downto 0);
            din_write: in std_logic_vector(11 downto 0);
            clk_read: in std_logic;
            en_read: in std_logic;
            addr_read: in std_logic_vector(16 downto 0);
            dout_read: out std_logic_vector(11 downto 0);
            clk_ppl, rst, enable: in std_logic;
            swap_sync: in std_logic
        );
    end component;

    component clk_ppl_generator is
        port (
            clk_sys, reset: in std_logic;
            clk_ppl, locked: out std_logic
        );
    end component;

    component pipeline_entrance is
        port (
            clk_ppl, rst, enable: in std_logic;
            p_pos: in vec3i_t;
            p_angle: in vec2i_t;
            is_preparing, is_eof: out std_logic;
            towards_h: out vec2i_t;
            -- Pipeline Final States
            next_pixel_pplout: in std_logic;
            pixel_addr_pplout: in std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
            to_color_acc_pplout: in color_t;
            to_block_p_pplout: in vec3i_t;
            to_dir_pplout: in dir_t;
            to_hit_p_pplout: in vec3i_t;
            start_p_pplout: in vec3i_t;
            end_p_pplout: in vec3i_t;
            to_is_behind_pplout: in std_logic;
            -- Pipeline Entrances
            idle: out std_logic;
            pixel_addr: out std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
            color_acc: out color_t;
            from_dir: out dir_t;
            block_p: out vec3i_t;
            hit_p: out vec3i_t;
            start_p: out vec3i_t;
            end_p: out vec3i_t;
            is_behind: out std_logic
        );
    end component;

    component pipeline_process is
        port (
            clk_ppl, rst, enable: in std_logic;
            -- Storage Interface
            block_addr_out: out std_logic_vector(MAP_ADDR_RADIX - 1 downto 0);
            block_idx_in: in std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
            txt_idx_addr_out: out std_logic_vector(TEXTURE_IDX_ADDR_RADIX - 1 downto 0);
            txt_idx_in: in std_logic_vector(TEXTURE_TYPE_RADIX - 1 downto 0);
            texture_addr_out: out std_logic_vector(TEXTURE_ADDR_RADIX - 1 downto 0);
            color_in: in std_logic_vector(31 downto 0);
            -- Input Interface
            idle_in: in std_logic;
            pixel_addr_in: in std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
            color_acc_in: in color_t;
            from_dir_in: in dir_t;
            block_p_in: in vec3i_t;
            hit_p_in: in vec3i_t;
            start_p_in: in vec3i_t;
            end_p_in: in vec3i_t;
            is_behind_in: in std_logic;
            -- Output Interface
            next_pixel_out: out std_logic;
            write_disp_buf_out: out std_logic;
            pixel_addr_out: out std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
            is_crosshair_out: out std_logic;
            hit_surface_out: out surface_t;
            block_p_out: out vec3i_t;
            block_idx_out: out std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
            to_color_acc_out: out color_t;
            is_air_out: out std_logic;
            continue_out: out std_logic;
            is_in_bound_out: out std_logic;
            is_sky_out: out std_logic;
            to_block_p_out: out vec3i_t;
            to_dir_out: out dir_t;
            to_hit_p_out: out vec3i_t;
            start_p_out: out vec3i_t;
            end_p_out: out vec3i_t;
            is_behind_out: out std_logic;
            to_is_behind_out: out std_logic
        );
    end component;

    component map_ram is
        port (
            clka: in std_logic;
            ena: in std_logic;
            wea: in std_logic_vector(0 downto 0);
            addra: in std_logic_vector(16 downto 0);
            dina: in std_logic_vector(4 downto 0);
            douta: out std_logic_vector(4 downto 0);
            clkb: in std_logic;
            enb: in std_logic;
            web: in std_logic_vector(0 downto 0);
            addrb: in std_logic_vector(16 downto 0);
            dinb: in std_logic_vector(4 downto 0);
            doutb: out std_logic_vector(4 downto 0)
        );
    end component;

    component texture_rom is
        port (
            clka: in std_logic;
            ena: in std_logic;
            addra: in std_logic_vector(12 downto 0);
            douta: out std_logic_vector(31 downto 0)
        );
    end component;

    component txt_idx_map_rom is
        port (
            clka: in std_logic;
            ena: in std_logic;
            addra: in std_logic_vector(7 downto 0);
            douta: out std_logic_vector(4 downto 0)
        );
    end component;

    component player_pose_register is
        port (
            clk, rst: in std_logic;
            update_sync: in std_logic;
            p_pos_in: in vec3i_t;
            p_angle_in: in vec2i_t;
            p_pos: out vec3i_t;
            p_angle: out vec2i_t
        );
    end component;

    component crosshair_object_register is
        port (
        clk, rst: in std_logic;
        update_sync: in std_logic;
        valid_in: in std_logic;
        block_p_sel_in: in vec3i_t;
        hit_surface_sel_in: in surface_t;
        valid_sel: out std_logic;
        block_p_sel: out vec3i_t;
        hit_surface_sel: out surface_t;
        block_p_inc: out vec3i_t
        );
    end component;

    component map_modifier is
        port (
            clk, rst: in std_logic;
            valid_target: in std_logic;
            block_p_target: in vec3i_t;
            idx_target: in int;
            write_enable: out std_logic;
            write_addr: out std_logic_vector(MAP_ADDR_RADIX - 1 downto 0);
            write_data: out std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0)
        );
    end component;

    component debounced_button is
        generic (
            PERIOD: integer := 2000 -- 20 us
        );
        port (
            clk, rst: in std_logic;
            btn_in: in std_logic;
            btn_out: out std_logic
        );
    end component;

    component gamepad is
        port (
            clk, rst: in std_logic;
            spi_cs: out std_logic;
            spi_clk: out std_logic;
            spi_mosi: out std_logic;
            spi_miso: in std_logic;
            data_valid: out std_logic;
            data_out: out gamepad_data_t
        );
    end component;

    component seven_segments_display_driver is
        port (
            clk_sys, rst: in std_logic;
            nums: in bcd_array_t(7 downto 0);
            anodes_n: out std_logic_vector(7 downto 0);
            segs_n: out std_logic_vector(0 to 7)
        );
    end component;

    component player_state_updater is
        port (
            clk, rst, enable: in std_logic;
            -- Manipulation
            left_click, right_click: in std_logic;
            block_p_sel, block_p_inc: in vec3i_t;
            mani_enable: out std_logic;
            block_p_target: out vec3i_t;
            idx_target: out int;
            -- Inventory
            last_item_click, next_item_click: in std_logic;
            current_item: out int;
            -- Movement
            move_lr_offset, move_fb_offset, move_ud_offset: in int;
            angle_lr_offset, angle_ud_offset: in int;
            towards_h: in vec2i_t;
            current_pos: out vec3i_t;
            current_angle: out vec2i_t
        );
    end component;

    signal clk_vga, clk_vga_locked: std_logic;
    signal vga_pixel_valid: std_logic;

    signal disp_buf_write_enable: std_logic;
    signal disp_buf_write_addr: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal disp_buf_write_data: std_logic_vector(11 downto 0);
    signal disp_buf_read_tick: std_logic;
    signal disp_buf_read_addr: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal disp_buf_read_data: std_logic_vector(11 downto 0);
    
    signal bake_ppl_enable: std_logic;
    signal color_pass_0: color_t;
    signal color_pass_1, color_pass_1_next: color_t;
    signal color_pass_2, color_pass_2_next: color_t;
    signal color_baked: color_t;
    signal write_enable_0: std_logic;
    signal write_enable_1, write_enable_1_next: std_logic;
    signal write_enable_2, write_enable_2_next: std_logic;
    signal write_enable_baked: std_logic;
    signal write_addr_0: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal write_addr_1, write_addr_1_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal write_addr_2, write_addr_2_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal write_addr_baked: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);

    signal p_pos_raw, p_pos: vec3i_t;
    signal p_angle: vec2i_t;
    signal towards_h: vec2i_t;

    signal clk_ppl, clk_ppl_locked: std_logic;
    signal end_of_frame, is_preparing, pipeline_enable: std_logic;

    signal idle_in: std_logic;
    signal pixel_addr_in: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_in: color_t;
    signal from_dir_in: dir_t;
    signal block_p_in: vec3i_t;
    signal hit_p_in: vec3i_t;
    signal start_p_in: vec3i_t;
    signal end_p_in: vec3i_t;
    signal is_behind_in: std_logic;

    signal next_pixel_out: std_logic;
    signal write_disp_buf_out: std_logic;
    signal pixel_addr_out: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal is_crosshair_out: std_logic;
    signal hit_surface_out: surface_t;
    signal block_p_out: vec3i_t;
    signal block_idx_out: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal to_color_acc_out: color_t;
    signal is_air_out: std_logic;
    signal continue_out: std_logic;
    signal is_in_bound_out: std_logic;
    signal is_sky_out: std_logic;
    signal to_block_p_out: vec3i_t;
    signal to_dir_out: dir_t;
    signal to_hit_p_out: vec3i_t;
    signal start_p_out: vec3i_t;
    signal end_p_out: vec3i_t;
    signal is_behind_out: std_logic;
    signal to_is_behind_out: std_logic;

    signal obj_sel_update: std_logic;
    signal valid_sel: std_logic;
    signal block_p_sel, block_p_inc: vec3i_t;
    signal hit_surface_sel: surface_t;

    signal map_ram_write_enable: std_logic;
    signal map_ram_write_addr: std_logic_vector(MAP_ADDR_RADIX - 1 downto 0);
    signal map_ram_write_data: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal map_ram_read_enable: std_logic;
    signal map_ram_read_addr: std_logic_vector(MAP_ADDR_RADIX - 1 downto 0);
    signal map_ram_read_data: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);

    signal texture_read_enable: std_logic;
    signal texture_read_addr: std_logic_vector(TEXTURE_ADDR_RADIX - 1 downto 0);
    signal texture_read_data: std_logic_vector(31 downto 0);

    signal txt_idx_map_read_enable: std_logic;
    signal txt_idx_map_read_addr: std_logic_vector(TEXTURE_IDX_ADDR_RADIX - 1 downto 0);
    signal txt_idx_map_read_data: std_logic_vector(TEXTURE_TYPE_RADIX - 1 downto 0);

    signal time_cnt, time_cnt_next: integer;
    signal fps_cnt, fps_cnt_next: integer;
    signal fps, fps_next: integer;

    signal btn_front, btn_back, btn_left, btn_right, btn_up, btn_down: std_logic;
    signal gp_data_valid: std_logic;
    signal gp_data_out: gamepad_data_t;
    signal bcd_nums: bcd_array_t(7 downto 0);
    
    signal mani_lr_valid: std_logic;
    signal valid_target: std_logic;
    signal block_p_target: vec3i_t;
    signal idx_target: int;

    signal current_pos: vec3i_t;
    signal current_angle: vec2i_t;
    signal current_item: int;
    signal move_ud_offset: int;
begin
    -- Display Controller
        clk_vga_gen: clk_vga_generator
            port map (
                clk_sys => clk_sys,
                reset => rst,
                clk_vga => clk_vga,
                locked => clk_vga_locked
            );
        
        vga_scan: vga_scanner
            port map (
                clk_vga => clk_vga,
                rst => rst,
                enable => clk_vga_locked,
                hsync_n => vgaout.hsync_n,
                vsync_n => vgaout.vsync_n,
                disp_buf_read_tick => disp_buf_read_tick,
                disp_buf_read_addr => disp_buf_read_addr,
                pixel_valid => vga_pixel_valid
            );

        disp_bufs: display_buffers
            port map (
                clk_write => not clk_ppl,
                en_write => disp_buf_write_enable,
                we_write => "1",
                addr_write => disp_buf_write_addr,
                din_write => disp_buf_write_data,
                clk_read => disp_buf_read_tick,
                en_read => '1',
                addr_read => disp_buf_read_addr,
                dout_read => disp_buf_read_data,
                clk_ppl => clk_ppl,
                rst => rst,
                enable => clk_ppl_locked,
                swap_sync => end_of_frame
            );
        vgaout.color.r <= disp_buf_read_data(11 downto 8) when vga_pixel_valid = '1' else "0000";
        vgaout.color.g <= disp_buf_read_data(7 downto 4) when vga_pixel_valid = '1' else "0000";
        vgaout.color.b <= disp_buf_read_data(3 downto 0) when vga_pixel_valid = '1' else "0000";

        disp_buf_write_enable <= write_enable_baked;
        disp_buf_write_addr <= write_addr_baked;
        disp_buf_write_data <= std_logic_vector(to_unsigned(color_baked.r / 16, 4)) & std_logic_vector(to_unsigned(color_baked.g / 16, 4)) & std_logic_vector(to_unsigned(color_baked.b / 16, 4));
        
    -- Player pose synchronization
        p_pose_reg: player_pose_register
            port map (
                clk => clk_sys,
                rst => rst,
                update_sync => end_of_frame,
                p_pos_in => current_pos,
                p_angle_in => current_angle,
                p_pos => p_pos_raw,
                p_angle => p_angle
            );
        p_pos <= p_pos_raw / 16;

    -- Post-tracing pipeline
        process (clk_ppl, rst) is
        begin
            if rst = '1' then
                color_pass_1 <= (others => 0);
                color_pass_2 <= (others => 0);
                write_enable_1 <= '0';
                write_enable_2 <= '0';
                write_addr_1 <= (others => '0');
                write_addr_2 <= (others => '0');
            elsif rising_edge(clk_ppl) and bake_ppl_enable = '1' then
                color_pass_1 <= color_pass_1_next;
                color_pass_2 <= color_pass_2_next;
                write_enable_1 <= write_enable_1_next;
                write_enable_2 <= write_enable_2_next;
                write_addr_1 <= write_addr_1_next;
                write_addr_2 <= write_addr_2_next;
            end if;
        end process;
        bake_ppl_enable <= pipeline_enable;

        -- Stage 0
        color_pass_0 <= to_color_acc_out;
        write_enable_0 <= '1' when write_disp_buf_out = '1' and pipeline_enable = '1' else '0';
        write_addr_0 <= pixel_addr_out;

        -- Stage 1: select mask
        color_pass_1_next <=
            color_pass_0 when valid_sel = '0' or block_p_out /= block_p_sel or hit_surface_out /= hit_surface_sel else
            color_pass_0 * 120 / 255 + color_t'(1, 1, 1, 1) * 125;
        write_enable_1_next <= write_enable_0;
        write_addr_1_next <= write_addr_0;

        -- Stage 2: crosshair inverse
        color_pass_2_next <=
            color_t'(255, 255, 255, 255) - color_pass_1 when
                (write_addr_1 >= CENTER_ADDR - 3 and write_addr_1 <= CENTER_ADDR + 3) or
                (write_addr_1 = CENTER_ADDR - 3 * H_REAL) or
                (write_addr_1 = CENTER_ADDR - 2 * H_REAL) or
                (write_addr_1 = CENTER_ADDR - 1 * H_REAL) or
                (write_addr_1 = CENTER_ADDR + 1 * H_REAL) or
                (write_addr_1 = CENTER_ADDR + 2 * H_REAL) or
                (write_addr_1 = CENTER_ADDR + 3 * H_REAL)
            else color_pass_1;
        write_enable_2_next <= write_enable_1;
        write_addr_2_next <= write_addr_1;
        
        -- Output Stage
        color_baked <= color_pass_2;
        write_enable_baked <= write_enable_2;
        write_addr_baked <= write_addr_2;

    -- Pipeline
        clk_ppl_gen: clk_ppl_generator
            port map (
                clk_sys => clk_sys,
                reset => rst,
                clk_ppl => clk_ppl,
                locked => clk_ppl_locked
            );

        ppl_enter: pipeline_entrance
            port map (
                clk_ppl => clk_ppl,
                rst => rst,
                enable => clk_ppl_locked,
                p_pos => p_pos,
                p_angle => p_angle,
                is_preparing => is_preparing,
                is_eof => end_of_frame,
                towards_h => towards_h,
                -- Pipeline Final States
                next_pixel_pplout => next_pixel_out,
                pixel_addr_pplout => pixel_addr_out,
                to_color_acc_pplout => to_color_acc_out,
                to_block_p_pplout => to_block_p_out,
                to_dir_pplout => to_dir_out,
                to_hit_p_pplout => to_hit_p_out,
                start_p_pplout => start_p_out,
                end_p_pplout => end_p_out,
                to_is_behind_pplout => to_is_behind_out,
                -- Pipeline Entrances
                idle => idle_in,
                pixel_addr => pixel_addr_in,
                color_acc => color_acc_in,
                from_dir => from_dir_in,
                block_p => block_p_in,
                hit_p => hit_p_in,
                start_p => start_p_in,
                end_p => end_p_in,
                is_behind => is_behind_in
            );
        pipeline_enable <= not is_preparing and clk_ppl_locked;
        
        ppl_proc: pipeline_process
            port map (
                clk_ppl => clk_ppl,
                rst => rst,
                enable => pipeline_enable,
                -- Storage Interface
                block_addr_out => map_ram_read_addr,
                block_idx_in => map_ram_read_data,
                txt_idx_addr_out => txt_idx_map_read_addr,
                txt_idx_in => txt_idx_map_read_data,
                texture_addr_out => texture_read_addr,
                color_in => texture_read_data,
                -- Input Interface
                idle_in => idle_in,
                pixel_addr_in => pixel_addr_in,
                color_acc_in => color_acc_in,
                from_dir_in => from_dir_in,
                block_p_in => block_p_in,
                hit_p_in => hit_p_in,
                start_p_in => start_p_in,
                end_p_in => end_p_in,
                is_behind_in => is_behind_in,
                -- Output Interface
                next_pixel_out => next_pixel_out,
                write_disp_buf_out => write_disp_buf_out,
                pixel_addr_out => pixel_addr_out,
                is_crosshair_out => is_crosshair_out,
                hit_surface_out => hit_surface_out,
                block_p_out => block_p_out,
                block_idx_out => block_idx_out,
                to_color_acc_out => to_color_acc_out,
                is_air_out => is_air_out,
                continue_out => continue_out,
                is_in_bound_out => is_in_bound_out,
                is_sky_out => is_sky_out,
                to_block_p_out => to_block_p_out,
                to_dir_out => to_dir_out,
                to_hit_p_out => to_hit_p_out,
                start_p_out => start_p_out,
                end_p_out => end_p_out,
                is_behind_out => is_behind_out,
                to_is_behind_out => to_is_behind_out
            );

        ch_obj_reg: crosshair_object_register
            port map (
                clk => clk_ppl,
                rst => rst,
                update_sync => obj_sel_update,
                valid_in => not is_sky_out,
                block_p_sel_in => block_p_out,
                hit_surface_sel_in => hit_surface_out,
                valid_sel => valid_sel,
                block_p_sel => block_p_sel,
                hit_surface_sel => hit_surface_sel,
                block_p_inc => block_p_inc
            );
        obj_sel_update <= '1' when is_crosshair_out = '1' and ((is_air_out = '0' and is_behind_out = '0') or is_sky_out = '1') else '0';
        
        map_mod: map_modifier
            port map (
                clk => clk_ppl,
                rst => rst,
                valid_target => valid_target,
                block_p_target => block_p_target,
                idx_target => idx_target,
                write_enable => map_ram_write_enable,
                write_addr => map_ram_write_addr,
                write_data => map_ram_write_data
            );
        valid_target <= valid_sel and mani_lr_valid;

    -- Storage
        mp_ram: map_ram
            port map (
                clka => clk_ppl,            -- write
                ena => map_ram_write_enable,
                wea => "1",
                addra => map_ram_write_addr,
                dina => map_ram_write_data,
                douta => open,                  -- useless
                clkb => clk_ppl,            -- read
                enb => map_ram_read_enable,
                web => "0",                     -- useless
                addrb => map_ram_read_addr,
                dinb => (others => '0'),        -- useless
                doutb => map_ram_read_data
            );
        map_ram_read_enable <= '1';
    
        txt_rom: texture_rom
            port map (
                clka => clk_ppl,
                ena => texture_read_enable,
                addra => texture_read_addr,
                douta => texture_read_data
            );
        texture_read_enable <= '1';

        txt_idx_rom: txt_idx_map_rom
            port map (
                clka => clk_ppl,
                ena => txt_idx_map_read_enable,
                addra => txt_idx_map_read_addr,
                douta => txt_idx_map_read_data
            );
        txt_idx_map_read_enable <= '1';
    
    -- Monitoring
        process (clk_ppl, rst) is
        begin
            if rst = '1' then
                time_cnt <= 0;
                fps_cnt <= 0;
                fps <= 0;
            elsif rising_edge(clk_ppl) then
                time_cnt <= time_cnt_next;
                fps_cnt <= fps_cnt_next;
                fps <= fps_next;
            end if;
        end process;
        time_cnt_next <= 0 when time_cnt = PPL_FREQ - 1 else time_cnt + 1;
        fps_cnt_next <=
            0 when time_cnt = PPL_FREQ - 1 else
            fps_cnt + 1 when end_of_frame = '1' else
            fps_cnt;
        fps_next <=
            fps_cnt when time_cnt = PPL_FREQ - 1 else
            fps;

    -- Peripherals
        btn_front_state: debounced_button port map (clk => clk_sys, rst => rst, btn_in => btn_front_in, btn_out => btn_front);
        btn_back_state: debounced_button port map (clk => clk_sys, rst => rst, btn_in => btn_back_in, btn_out => btn_back);
        btn_left_state: debounced_button port map (clk => clk_sys, rst => rst, btn_in => btn_left_in, btn_out => btn_left);
        btn_right_state: debounced_button port map (clk => clk_sys, rst => rst, btn_in => btn_right_in, btn_out => btn_right);
        btn_up_state: debounced_button port map (clk => clk_sys, rst => rst, btn_in => btn_up_in, btn_out => btn_up);
        btn_down_state: debounced_button port map (clk => clk_sys, rst => rst, btn_in => btn_down_in, btn_out => btn_down);

        gp_ps2: gamepad
            port map (
                clk => clk_sys,
                rst => rst,
                spi_cs => spi_cs,
                spi_clk => spi_clk,
                spi_mosi => spi_mosi,
                spi_miso => spi_miso,
                data_valid => gp_data_valid,
                data_out => gp_data_out
            );
        
        seven_segs_driver: seven_segments_display_driver port map (clk_sys => clk_sys, rst => rst, nums => bcd_nums, anodes_n => anodes_n, segs_n => segs_n);
        bcd_nums(7) <= std_logic_vector(to_unsigned(fps / 100 mod 10, 4));
        bcd_nums(6) <= std_logic_vector(to_unsigned(fps / 10 mod 10, 4));
        bcd_nums(5) <= std_logic_vector(to_unsigned(fps mod 10, 4));
        bcd_nums(4) <= "0000";
        bcd_nums(3) <= "0000";
        bcd_nums(2) <= "0000";
        bcd_nums(1) <= std_logic_vector(to_unsigned(current_item / 10 mod 10, 4));
        bcd_nums(0) <= std_logic_vector(to_unsigned(current_item mod 10, 4));

    -- Controlling
        p_state_update: player_state_updater
            port map (
                clk => clk_ppl,
                rst => rst,
                enable => gp_data_valid,
                -- Manipulation
                left_click => gp_data_out.R2,
                right_click => gp_data_out.L2,
                block_p_sel => block_p_sel,
                block_p_inc => block_p_inc,
                mani_enable => mani_lr_valid,
                block_p_target => block_p_target,
                idx_target => idx_target,
                -- Inventory
                last_item_click => gp_data_out.L1,
                next_item_click => gp_data_out.R1,
                current_item => current_item,
                -- Movement
                move_lr_offset => gp_data_out.pss_lx,
                move_fb_offset => -gp_data_out.pss_ly,
                move_ud_offset => move_ud_offset,
                angle_lr_offset => gp_data_out.pss_rx,
                angle_ud_offset => -gp_data_out.pss_ry,
                towards_h => towards_h,
                current_pos => current_pos,
                current_angle => current_angle
            );
        move_ud_offset <=
            127 when gp_data_out.cross = '1' else
            -128 when gp_data_out.circle = '1' else
            0;
end architecture;
 