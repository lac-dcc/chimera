library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

use work.constants.all;
use work.types.all;


entity pipeline_process is
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
end entity;


architecture Behavioral of pipeline_process is
    component divider_gen is
        PORT (
            -- aclk: in std_logic;
            s_axis_divisor_tvalid: in std_logic;
            s_axis_divisor_tdata: in std_logic_vector(23 downto 0);
            s_axis_dividend_tvalid: in std_logic;
            s_axis_dividend_tdata: in std_logic_vector(23 downto 0);
            m_axis_dout_tvalid: out std_logic;
            m_axis_dout_tdata: out std_logic_vector(47 downto 0)
        );
    end component;

    -- Stage 0
    signal idle_0, idle_0_next: std_logic;
    signal pixel_addr_0, pixel_addr_0_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_0, color_acc_0_next: color_t;
    signal from_dir_0, from_dir_0_next: dir_t;
    signal block_p_0, block_p_0_next: vec3i_t;
    signal hit_p_0, hit_p_0_next: vec3i_t;
    signal start_p_0, start_p_0_next: vec3i_t;
    signal end_p_0, end_p_0_next: vec3i_t;
    signal is_behind_0, is_behind_0_next: std_logic;

    -- Stage 1
    signal idle_1, idle_1_next: std_logic;
    signal pixel_addr_1, pixel_addr_1_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_1, color_acc_1_next: color_t;
    signal from_dir_1, from_dir_1_next: dir_t;
    signal block_p_1, block_p_1_next: vec3i_t;
    signal block_addr_1, block_addr_1_next: std_logic_vector(MAP_ADDR_RADIX - 1 downto 0);
    signal edges_n_1, edges_n_1_next: vec3i_t;
    signal hit_p_1, hit_p_1_next: vec3i_t;
    signal start_p_1, start_p_1_next: vec3i_t;
    signal general_dir_1, general_dir_1_next: std_logic_vector(2 downto 0);
    signal end_p_1, end_p_1_next: vec3i_t;
    signal is_behind_1, is_behind_1_next: std_logic;

    -- Stage 2
    constant TMAX: int := TEXTURE_RES - 1;
    signal hit_p_rel_n_2: vec3i_t;
    
    signal idle_2, idle_2_next: std_logic;
    signal pixel_addr_2, pixel_addr_2_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_2, color_acc_2_next: color_t;
    signal hit_surface_2, hit_surface_2_next: surface_t;
    signal block_p_2, block_p_2_next: vec3i_t;
    signal block_idx_2: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal uv_coord_xn_2, uv_coord_xn_2_next: vec2i_t;
    signal uv_coord_xp_2, uv_coord_xp_2_next: vec2i_t;
    signal uv_coord_yn_2, uv_coord_yn_2_next: vec2i_t;
    signal uv_coord_yp_2, uv_coord_yp_2_next: vec2i_t;
    signal uv_coord_zn_2, uv_coord_zn_2_next: vec2i_t;
    signal uv_coord_zp_2, uv_coord_zp_2_next: vec2i_t;
    signal edges_2, edges_2_next: vec3i_t;
    signal start_p_2, start_p_2_next: vec3i_t;
    signal end_p_2, end_p_2_next: vec3i_t;
    signal delta_2, delta_2_next: vec3i_t;
    signal is_behind_2, is_behind_2_next: std_logic;

    -- Stage 3
    signal occ_3: vec3i_t;

    signal idle_3, idle_3_next: std_logic;
    signal pixel_addr_3, pixel_addr_3_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_3, color_acc_3_next: color_t;
    signal hit_surface_3, hit_surface_3_next: surface_t;
    signal txt_idx_addr_3, txt_idx_addr_3_next: std_logic_vector(TEXTURE_IDX_ADDR_RADIX - 1 downto 0);
    signal block_p_3, block_p_3_next: vec3i_t;
    signal block_idx_3, block_idx_3_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal uv_coord_3, uv_coord_3_next: vec2i_t;
    signal delta_mul_occ_yx_3, delta_mul_occ_yx_3_next: int;
    signal delta_mul_occ_zx_3, delta_mul_occ_zx_3_next: int;
    signal delta_mul_occ_xy_3, delta_mul_occ_xy_3_next: int;
    signal delta_mul_occ_zy_3, delta_mul_occ_zy_3_next: int;
    signal delta_mul_occ_xz_3, delta_mul_occ_xz_3_next: int;
    signal delta_mul_occ_yz_3, delta_mul_occ_yz_3_next: int;
    signal edges_3, edges_3_next: vec3i_t;
    signal start_p_3, start_p_3_next: vec3i_t;
    signal end_p_3, end_p_3_next: vec3i_t;
    signal delta_3, delta_3_next: vec3i_t;
    signal div_zero_3, div_zero_3_next: std_logic_vector(2 downto 0);
    signal is_behind_3, is_behind_3_next: std_logic;

    -- Stage 4
    signal idle_4, idle_4_next: std_logic;
    signal pixel_addr_4, pixel_addr_4_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_4, color_acc_4_next: color_t;
    signal hit_surface_4, hit_surface_4_next: surface_t;
    signal txt_idx_4: std_logic_vector(TEXTURE_TYPE_RADIX - 1 downto 0);
    signal block_p_4, block_p_4_next: vec3i_t;
    signal block_idx_4, block_idx_4_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal uv_coord_addr_4, uv_coord_addr_4_next: int;
    signal floor_cond_yx_4, floor_cond_yx_4_next: std_logic;
    signal floor_cond_zx_4, floor_cond_zx_4_next: std_logic;
    signal floor_cond_xy_4, floor_cond_xy_4_next: std_logic;
    signal floor_cond_zy_4, floor_cond_zy_4_next: std_logic;    
    signal floor_cond_xz_4, floor_cond_xz_4_next: std_logic;
    signal floor_cond_yz_4, floor_cond_yz_4_next: std_logic;
    signal mul_div_delta_yx_rem_4, mul_div_delta_yx_rem_4_next: int;
    signal mul_div_delta_zx_rem_4, mul_div_delta_zx_rem_4_next: int;    
    signal mul_div_delta_xy_rem_4, mul_div_delta_xy_rem_4_next: int;
    signal mul_div_delta_zy_rem_4, mul_div_delta_zy_rem_4_next: int;
    signal mul_div_delta_xz_rem_4, mul_div_delta_xz_rem_4_next: int;
    signal mul_div_delta_yz_rem_4, mul_div_delta_yz_rem_4_next: int;
    signal mul_div_delta_yx_res_4, mul_div_delta_yx_res_4_next: int;
    signal mul_div_delta_zx_res_4, mul_div_delta_zx_res_4_next: int;
    signal mul_div_delta_xy_res_4, mul_div_delta_xy_res_4_next: int;
    signal mul_div_delta_zy_res_4, mul_div_delta_zy_res_4_next: int;
    signal mul_div_delta_xz_res_4, mul_div_delta_xz_res_4_next: int;
    signal mul_div_delta_yz_res_4, mul_div_delta_yz_res_4_next: int;
    signal sp_eq_edges_4, sp_eq_edges_4_next: std_logic_vector(2 downto 0);
    signal edges_4, edges_4_next: vec3i_t;
    signal start_p_4, start_p_4_next: vec3i_t;
    signal end_p_4, end_p_4_next: vec3i_t;
    signal div_zero_4, div_zero_4_next: std_logic_vector(2 downto 0);
    signal is_behind_4, is_behind_4_next: std_logic;
    signal mul_div_delta_yx_raw_4_i: std_logic_vector(47 downto 0);
    signal mul_div_delta_zx_raw_4_i: std_logic_vector(47 downto 0);
    signal mul_div_delta_xy_raw_4_i: std_logic_vector(47 downto 0);
    signal mul_div_delta_zy_raw_4_i: std_logic_vector(47 downto 0);
    signal mul_div_delta_xz_raw_4_i: std_logic_vector(47 downto 0);
    signal mul_div_delta_yz_raw_4_i: std_logic_vector(47 downto 0);

    -- Stage 5
    signal idle_5, idle_5_next: std_logic;
    signal pixel_addr_5, pixel_addr_5_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_5, color_acc_5_next: color_t;
    signal hit_surface_5, hit_surface_5_next: surface_t;
    signal block_p_5, block_p_5_next: vec3i_t;
    signal block_idx_5, block_idx_5_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal texture_addr_5, texture_addr_5_next: std_logic_vector(TEXTURE_ADDR_RADIX - 1 downto 0);
    signal mul_div_delta_yx_5, mul_div_delta_yx_5_next: int;
    signal mul_div_delta_zx_5, mul_div_delta_zx_5_next: int;
    signal mul_div_delta_xy_5, mul_div_delta_xy_5_next: int;
    signal mul_div_delta_zy_5, mul_div_delta_zy_5_next: int;
    signal mul_div_delta_xz_5, mul_div_delta_xz_5_next: int;
    signal mul_div_delta_yz_5, mul_div_delta_yz_5_next: int;
    signal sp_eq_edges_5, sp_eq_edges_5_next: std_logic_vector(2 downto 0);
    signal edges_5, edges_5_next: vec3i_t;
    signal start_p_5, start_p_5_next: vec3i_t;
    signal end_p_5, end_p_5_next: vec3i_t;
    signal div_zero_5, div_zero_5_next: std_logic_vector(2 downto 0);
    signal is_behind_5, is_behind_5_next: std_logic;

    -- Stage 6
    signal idle_6, idle_6_next: std_logic;
    signal pixel_addr_6, pixel_addr_6_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_6, color_acc_6_next: color_t;
    signal hit_surface_6, hit_surface_6_next: surface_t;
    signal block_p_6, block_p_6_next: vec3i_t;
    signal block_idx_6, block_idx_6_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal color_6: color_t;
    signal is_air_6, is_air_6_next: std_logic;
    signal start_block_p_6, start_block_p_6_next: vec3i_t;
    signal to_hit_p_x_6, to_hit_p_x_6_next: vec3i_t;
    signal to_hit_p_y_6, to_hit_p_y_6_next: vec3i_t;
    signal to_hit_p_z_6, to_hit_p_z_6_next: vec3i_t;
    signal to_hit_p_x_mht_6, to_hit_p_x_mht_6_next: int;
    signal to_hit_p_y_mht_6, to_hit_p_y_mht_6_next: int;
    signal to_hit_p_z_mht_6, to_hit_p_z_mht_6_next: int;
    signal start_p_6, start_p_6_next: vec3i_t;
    signal end_p_6, end_p_6_next: vec3i_t;
    signal div_zero_6, div_zero_6_next: std_logic_vector(2 downto 0);
    signal is_behind_6, is_behind_6_next: std_logic;

    -- Stage 7
    signal idle_7, idle_7_next: std_logic;
    signal pixel_addr_7, pixel_addr_7_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal color_acc_7, color_acc_7_next: color_t;
    signal hit_surface_7, hit_surface_7_next: surface_t;
    signal block_p_7, block_p_7_next: vec3i_t;
    signal block_idx_7, block_idx_7_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal color_7, color_7_next: color_t;
    signal is_air_7, is_air_7_next: std_logic;
    signal dist_block_p_7, dist_block_p_7_next: int;
    signal to_hit_p_x_7, to_hit_p_x_7_next: vec3i_t;
    signal to_hit_p_y_7, to_hit_p_y_7_next: vec3i_t;
    signal to_hit_p_z_7, to_hit_p_z_7_next: vec3i_t;
    signal leq_xy_7, leq_xy_7_next: std_logic;
    signal leq_xz_7, leq_xz_7_next: std_logic;
    signal leq_yz_7, leq_yz_7_next: std_logic;
    signal start_p_7, start_p_7_next: vec3i_t;
    signal end_p_7, end_p_7_next: vec3i_t;
    signal div_zero_7, div_zero_7_next: std_logic_vector(2 downto 0);
    signal is_behind_7, is_behind_7_next: std_logic;

    -- Stage 8
    signal idle_8, idle_8_next: std_logic;
    signal pixel_addr_8, pixel_addr_8_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal hit_surface_8, hit_surface_8_next: surface_t;
    signal block_p_8, block_p_8_next: vec3i_t;
    signal block_idx_8, block_idx_8_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal to_color_acc_8, to_color_acc_8_next: color_t;
    signal is_air_8, is_air_8_next: std_logic;
    signal is_in_bound_8, is_in_bound_8_next: std_logic;
    signal blend_color_sky_8, blend_color_sky_8_next: color_t;
    signal to_dir_8, to_dir_8_next: dir_t;
    signal to_hit_p_8, to_hit_p_8_next: vec3i_t;
    signal general_dir_8, general_dir_8_next: std_logic_vector(2 downto 0);
    signal start_p_8, start_p_8_next: vec3i_t;
    signal end_p_8, end_p_8_next: vec3i_t;
    signal is_behind_8, is_behind_8_next: std_logic;

    -- Stage 9
    signal next_pixel_9, next_pixel_9_next: std_logic;
    signal write_disp_buf_9, write_disp_buf_9_next: std_logic;
    signal pixel_addr_9, pixel_addr_9_next: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0);
    signal is_crosshair_9, is_crosshair_9_next: std_logic;
    signal hit_surface_9, hit_surface_9_next: surface_t;
    signal block_p_9, block_p_9_next: vec3i_t;
    signal block_idx_9, block_idx_9_next: std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0);
    signal to_color_acc_9, to_color_acc_9_next: color_t;
    signal is_air_9, is_air_9_next: std_logic;
    signal continue_9, continue_9_next: std_logic;
    signal is_in_bound_9, is_in_bound_9_next: std_logic;
    signal is_sky_9, is_sky_9_next: std_logic;
    signal to_block_p_9, to_block_p_9_next: vec3i_t;
    signal to_dir_9, to_dir_9_next: dir_t;
    signal to_hit_p_9, to_hit_p_9_next: vec3i_t;
    signal start_p_9, start_p_9_next: vec3i_t;
    signal end_p_9, end_p_9_next: vec3i_t;
    signal is_behind_9, is_behind_9_next: std_logic;
    signal to_is_behind_9, to_is_behind_9_next: std_logic;
begin
    process (clk_ppl, rst) is
    begin
        if rst = '1' then
            -- Stage 0
            idle_0 <= '1';
            pixel_addr_0 <= (others => '0');
            color_acc_0 <= (others => 0);
            from_dir_0 <= 3;
            block_p_0 <= (others => 0);
            hit_p_0 <= (others => 0);
            start_p_0 <= (others => 0);
            end_p_0 <= (others => 0);
            is_behind_0 <= '0';

            -- Stage 1
            idle_1 <= '1';
            pixel_addr_1 <= (others => '0');
            color_acc_1 <= (others => 0);
            from_dir_1 <= 3;
            block_p_1 <= (others => 0);
            block_addr_1 <= (others => '0');
            edges_n_1 <= (others => 0);
            hit_p_1 <= (others => 0);
            start_p_1 <= (others => 0);
            general_dir_1 <= (others => '0');
            end_p_1 <= (others => 0);
            is_behind_1 <= '0';

            -- Stage 2
            idle_2 <= '1';
            pixel_addr_2 <= (others => '0');
            color_acc_2 <= (others => 0);
            hit_surface_2 <= 6;
            block_p_2 <= (others => 0);
            uv_coord_xn_2 <= (others => 0);
            uv_coord_xp_2 <= (others => 0);
            uv_coord_yn_2 <= (others => 0);
            uv_coord_yp_2 <= (others => 0);
            uv_coord_zn_2 <= (others => 0);
            uv_coord_zp_2 <= (others => 0);
            edges_2 <= (others => 0);
            start_p_2 <= (others => 0);
            end_p_2 <= (others => 0);
            delta_2 <= (others => 0);
            is_behind_2 <= '0';

            -- Stage 3
            idle_3 <= '1';
            pixel_addr_3 <= (others => '0');
            color_acc_3 <= (others => 0);
            hit_surface_3 <= 6;
            txt_idx_addr_3 <= (others => '0');
            block_p_3 <= (others => 0);
            block_idx_3 <= (others => '0');
            uv_coord_3 <= (others => 0);
            delta_mul_occ_yx_3 <= 0;
            delta_mul_occ_zx_3 <= 0;
            delta_mul_occ_xy_3 <= 0;
            delta_mul_occ_zy_3 <= 0;
            delta_mul_occ_xz_3 <= 0;
            delta_mul_occ_yz_3 <= 0;
            edges_3 <= (others => 0);
            start_p_3 <= (others => 0);
            end_p_3 <= (others => 0);
            delta_3 <= (others => 0);
            div_zero_3 <= (others => '0');
            is_behind_3 <= '0';

            -- Stage 4
            idle_4 <= '1';
            pixel_addr_4 <= (others => '0');
            color_acc_4 <= (others => 0);
            hit_surface_4 <= 6;
            block_p_4 <= (others => 0);
            block_idx_4 <= (others => '0');
            uv_coord_addr_4 <= 0;
            floor_cond_yx_4 <= '0';
            floor_cond_zx_4 <= '0';
            floor_cond_xy_4 <= '0';
            floor_cond_zy_4 <= '0';
            floor_cond_xz_4 <= '0';
            floor_cond_yz_4 <= '0';
            mul_div_delta_yx_rem_4 <= 0;
            mul_div_delta_zx_rem_4 <= 0;
            mul_div_delta_xy_rem_4 <= 0;
            mul_div_delta_zy_rem_4 <= 0;
            mul_div_delta_xz_rem_4 <= 0;
            mul_div_delta_yz_rem_4 <= 0;
            mul_div_delta_yx_res_4 <= 0;
            mul_div_delta_zx_res_4 <= 0;
            mul_div_delta_xy_res_4 <= 0;
            mul_div_delta_zy_res_4 <= 0;
            mul_div_delta_xz_res_4 <= 0;
            mul_div_delta_yz_res_4 <= 0;
            sp_eq_edges_4 <= (others => '0');
            edges_4 <= (others => 0);
            start_p_4 <= (others => 0);
            end_p_4 <= (others => 0);
            div_zero_4 <= (others => '0');
            is_behind_4 <= '0';

            -- Stage 5
            idle_5 <= '1';
            pixel_addr_5 <= (others => '0');
            color_acc_5 <= (others => 0);
            hit_surface_5 <= 6;
            block_p_5 <= (others => 0);
            block_idx_5 <= (others => '0');
            texture_addr_5 <= (others => '0');
            mul_div_delta_yx_5 <= 0;
            mul_div_delta_zx_5 <= 0;
            mul_div_delta_xy_5 <= 0;
            mul_div_delta_zy_5 <= 0;
            mul_div_delta_xz_5 <= 0;
            mul_div_delta_yz_5 <= 0;
            sp_eq_edges_5 <= (others => '0');
            edges_5 <= (others => 0);
            start_p_5 <= (others => 0);
            end_p_5 <= (others => 0);
            div_zero_5 <= (others => '0');
            is_behind_5 <= '0';

            -- Stage 6
            idle_6 <= '1';
            pixel_addr_6 <= (others => '0');
            color_acc_6 <= (others => 0);
            hit_surface_6 <= 6;
            block_p_6 <= (others => 0);
            block_idx_6 <= (others => '0');
            is_air_6 <= '0';
            start_block_p_6 <= (others => 0);
            to_hit_p_x_6 <= (others => 0);
            to_hit_p_y_6 <= (others => 0);
            to_hit_p_z_6 <= (others => 0);
            to_hit_p_x_mht_6 <= 0;
            to_hit_p_y_mht_6 <= 0;
            to_hit_p_z_mht_6 <= 0;
            start_p_6 <= (others => 0);
            end_p_6 <= (others => 0);
            div_zero_6 <= (others => '0');
            is_behind_6 <= '0';

            -- Stage 7
            idle_7 <= '1';
            pixel_addr_7 <= (others => '0');
            color_acc_7 <= (others => 0);
            hit_surface_7 <= 6;
            block_p_7 <= (others => 0);
            block_idx_7 <= (others => '0');
            color_7 <= (others => 0);
            is_air_7 <= '0';
            dist_block_p_7 <= 0;
            to_hit_p_x_7 <= (others => 0);
            to_hit_p_y_7 <= (others => 0);
            to_hit_p_z_7 <= (others => 0);
            leq_xy_7 <= '0';
            leq_xz_7 <= '0';
            leq_yz_7 <= '0';
            start_p_7 <= (others => 0);
            end_p_7 <= (others => 0);
            div_zero_7 <= (others => '0');
            is_behind_7 <= '0';

            -- Stage 8
            idle_8 <= '1';
            pixel_addr_8 <= (others => '0');
            hit_surface_8 <= 6;
            block_p_8 <= (others => 0);
            block_idx_8 <= (others => '0');
            to_color_acc_8 <= (others => 0);
            is_air_8 <= '0';
            is_in_bound_8 <= '0';
            blend_color_sky_8 <= (others => 0);
            to_dir_8 <= 3;
            to_hit_p_8 <= (others => 0);
            general_dir_8 <= (others => '0');
            start_p_8 <= (others => 0);
            end_p_8 <= (others => 0);
            is_behind_8 <= '0';

            -- Stage 9
            next_pixel_9 <= '0';
            write_disp_buf_9 <= '0';
            pixel_addr_9 <= (others => '0');
            is_crosshair_9 <= '0';  
            hit_surface_9 <= 6;
            block_p_9 <= (others => 0);
            block_idx_9 <= (others => '0');
            to_color_acc_9 <= (others => 0);
            is_air_9 <= '0';
            continue_9 <= '0';
            is_in_bound_9 <= '0';
            is_sky_9 <= '0';
            to_block_p_9 <= (others => 0);
            to_dir_9 <= 3;
            to_hit_p_9 <= (others => 0);
            start_p_9 <= (others => 0);
            end_p_9 <= (others => 0);
            is_behind_9 <= '0';
            to_is_behind_9 <= '0';
        elsif rising_edge(clk_ppl) and enable = '1' then
            -- Stage 0
            idle_0 <= idle_0_next;
            pixel_addr_0 <= pixel_addr_0_next;
            color_acc_0 <= color_acc_0_next;
            from_dir_0 <= from_dir_0_next;
            block_p_0 <= block_p_0_next;
            hit_p_0 <= hit_p_0_next;
            start_p_0 <= start_p_0_next;
            end_p_0 <= end_p_0_next;
            is_behind_0 <= is_behind_0_next;

            -- Stage 1
            idle_1 <= idle_1_next;
            pixel_addr_1 <= pixel_addr_1_next;
            color_acc_1 <= color_acc_1_next;
            from_dir_1 <= from_dir_1_next;
            block_p_1 <= block_p_1_next;
            block_addr_1 <= block_addr_1_next;
            edges_n_1 <= edges_n_1_next;
            hit_p_1 <= hit_p_1_next;
            start_p_1 <= start_p_1_next;
            general_dir_1 <= general_dir_1_next;
            end_p_1 <= end_p_1_next;
            is_behind_1 <= is_behind_1_next;

            -- Stage 2
            idle_2 <= idle_2_next;
            pixel_addr_2 <= pixel_addr_2_next;
            color_acc_2 <= color_acc_2_next;
            hit_surface_2 <= hit_surface_2_next;
            block_p_2 <= block_p_2_next;
            uv_coord_xn_2 <= uv_coord_xn_2_next;
            uv_coord_xp_2 <= uv_coord_xp_2_next;
            uv_coord_yn_2 <= uv_coord_yn_2_next;
            uv_coord_yp_2 <= uv_coord_yp_2_next;
            uv_coord_zn_2 <= uv_coord_zn_2_next;
            uv_coord_zp_2 <= uv_coord_zp_2_next;
            edges_2 <= edges_2_next;
            start_p_2 <= start_p_2_next;
            end_p_2 <= end_p_2_next;
            delta_2 <= delta_2_next;
            is_behind_2 <= is_behind_2_next;

            -- Stage 3
            idle_3 <= idle_3_next;
            pixel_addr_3 <= pixel_addr_3_next;
            color_acc_3 <= color_acc_3_next;
            hit_surface_3 <= hit_surface_3_next;
            txt_idx_addr_3 <= txt_idx_addr_3_next;
            block_p_3 <= block_p_3_next;
            block_idx_3 <= block_idx_3_next;
            uv_coord_3 <= uv_coord_3_next;
            delta_mul_occ_yx_3 <= delta_mul_occ_yx_3_next;
            delta_mul_occ_zx_3 <= delta_mul_occ_zx_3_next;
            delta_mul_occ_xy_3 <= delta_mul_occ_xy_3_next;
            delta_mul_occ_zy_3 <= delta_mul_occ_zy_3_next;
            delta_mul_occ_xz_3 <= delta_mul_occ_xz_3_next;
            delta_mul_occ_yz_3 <= delta_mul_occ_yz_3_next;
            edges_3 <= edges_3_next;
            start_p_3 <= start_p_3_next;
            end_p_3 <= end_p_3_next;
            delta_3 <= delta_3_next;
            div_zero_3 <= div_zero_3_next;
            is_behind_3 <= is_behind_3_next;

            -- Stage 4
            idle_4 <= idle_4_next;
            pixel_addr_4 <= pixel_addr_4_next;
            color_acc_4 <= color_acc_4_next;
            hit_surface_4 <= hit_surface_4_next;
            block_p_4 <= block_p_4_next;
            block_idx_4 <= block_idx_4_next;
            uv_coord_addr_4 <= uv_coord_addr_4_next;
            floor_cond_yx_4 <= floor_cond_yx_4_next;
            floor_cond_zx_4 <= floor_cond_zx_4_next;
            floor_cond_xy_4 <= floor_cond_xy_4_next;
            floor_cond_zy_4 <= floor_cond_zy_4_next;
            floor_cond_xz_4 <= floor_cond_xz_4_next;
            floor_cond_yz_4 <= floor_cond_yz_4_next;
            mul_div_delta_yx_rem_4 <= mul_div_delta_yx_rem_4_next;
            mul_div_delta_zx_rem_4 <= mul_div_delta_zx_rem_4_next;
            mul_div_delta_xy_rem_4 <= mul_div_delta_xy_rem_4_next;
            mul_div_delta_zy_rem_4 <= mul_div_delta_zy_rem_4_next;
            mul_div_delta_xz_rem_4 <= mul_div_delta_xz_rem_4_next;
            mul_div_delta_yz_rem_4 <= mul_div_delta_yz_rem_4_next;
            mul_div_delta_yx_res_4 <= mul_div_delta_yx_res_4_next;
            mul_div_delta_zx_res_4 <= mul_div_delta_zx_res_4_next;
            mul_div_delta_xy_res_4 <= mul_div_delta_xy_res_4_next;
            mul_div_delta_zy_res_4 <= mul_div_delta_zy_res_4_next;
            mul_div_delta_xz_res_4 <= mul_div_delta_xz_res_4_next;
            mul_div_delta_yz_res_4 <= mul_div_delta_yz_res_4_next;
            sp_eq_edges_4 <= sp_eq_edges_4_next;
            edges_4 <= edges_4_next;
            start_p_4 <= start_p_4_next;
            end_p_4 <= end_p_4_next;
            div_zero_4 <= div_zero_4_next;
            is_behind_4 <= is_behind_4_next;

            -- Stage 5
            idle_5 <= idle_5_next;
            pixel_addr_5 <= pixel_addr_5_next;
            color_acc_5 <= color_acc_5_next;
            hit_surface_5 <= hit_surface_5_next;
            block_p_5 <= block_p_5_next;
            block_idx_5 <= block_idx_5_next;
            texture_addr_5 <= texture_addr_5_next;
            mul_div_delta_yx_5 <= mul_div_delta_yx_5_next;
            mul_div_delta_zx_5 <= mul_div_delta_zx_5_next;
            mul_div_delta_xy_5 <= mul_div_delta_xy_5_next;
            mul_div_delta_zy_5 <= mul_div_delta_zy_5_next;
            mul_div_delta_xz_5 <= mul_div_delta_xz_5_next;
            mul_div_delta_yz_5 <= mul_div_delta_yz_5_next;
            sp_eq_edges_5 <= sp_eq_edges_5_next;
            edges_5 <= edges_5_next;
            start_p_5 <= start_p_5_next;
            end_p_5 <= end_p_5_next;
            div_zero_5 <= div_zero_5_next;
            is_behind_5 <= is_behind_5_next;
            
            -- Stage 6
            idle_6 <= idle_6_next;
            pixel_addr_6 <= pixel_addr_6_next;
            color_acc_6 <= color_acc_6_next;
            hit_surface_6 <= hit_surface_6_next;
            block_p_6 <= block_p_6_next;
            block_idx_6 <= block_idx_6_next;
            is_air_6 <= is_air_6_next;
            start_block_p_6 <= start_block_p_6_next;
            to_hit_p_x_6 <= to_hit_p_x_6_next;
            to_hit_p_y_6 <= to_hit_p_y_6_next;
            to_hit_p_z_6 <= to_hit_p_z_6_next;
            to_hit_p_x_mht_6 <= to_hit_p_x_mht_6_next;
            to_hit_p_y_mht_6 <= to_hit_p_y_mht_6_next;
            to_hit_p_z_mht_6 <= to_hit_p_z_mht_6_next;
            start_p_6 <= start_p_6_next;
            end_p_6 <= end_p_6_next;
            div_zero_6 <= div_zero_6_next;
            is_behind_6 <= is_behind_6_next;
            
            -- Stage 7
            idle_7 <= idle_7_next;
            pixel_addr_7 <= pixel_addr_7_next;
            color_acc_7 <= color_acc_7_next;
            hit_surface_7 <= hit_surface_7_next;
            block_p_7 <= block_p_7_next;
            block_idx_7 <= block_idx_7_next;
            color_7 <= color_7_next;
            is_air_7 <= is_air_7_next;
            dist_block_p_7 <= dist_block_p_7_next;
            to_hit_p_x_7 <= to_hit_p_x_7_next;
            to_hit_p_y_7 <= to_hit_p_y_7_next;
            to_hit_p_z_7 <= to_hit_p_z_7_next;
            leq_xy_7 <= leq_xy_7_next;
            leq_xz_7 <= leq_xz_7_next;
            leq_yz_7 <= leq_yz_7_next;
            start_p_7 <= start_p_7_next;
            end_p_7 <= end_p_7_next;
            div_zero_7 <= div_zero_7_next;
            is_behind_7 <= is_behind_7_next;
            
            -- Stage 8
            idle_8 <= idle_8_next;
            pixel_addr_8 <= pixel_addr_8_next;
            hit_surface_8 <= hit_surface_8_next;
            block_p_8 <= block_p_8_next;
            block_idx_8 <= block_idx_8_next;
            to_color_acc_8 <= to_color_acc_8_next;
            is_air_8 <= is_air_8_next;
            is_in_bound_8 <= is_in_bound_8_next;
            blend_color_sky_8 <= blend_color_sky_8_next;
            to_dir_8 <= to_dir_8_next;
            to_hit_p_8 <= to_hit_p_8_next;
            general_dir_8 <= general_dir_8_next;
            start_p_8 <= start_p_8_next;
            end_p_8 <= end_p_8_next;
            is_behind_8 <= is_behind_8_next;

            -- Stage 9
            next_pixel_9 <= next_pixel_9_next;
            write_disp_buf_9 <= write_disp_buf_9_next;
            pixel_addr_9 <= pixel_addr_9_next;
            is_crosshair_9 <= is_crosshair_9_next;
            hit_surface_9 <= hit_surface_9_next;
            block_p_9 <= block_p_9_next;
            block_idx_9 <= block_idx_9_next;
            to_color_acc_9 <= to_color_acc_9_next;
            is_air_9 <= is_air_9_next;
            continue_9 <= continue_9_next;
            is_in_bound_9 <= is_in_bound_9_next;
            is_sky_9 <= is_sky_9_next;
            to_block_p_9 <= to_block_p_9_next;
            to_dir_9 <= to_dir_9_next;
            to_hit_p_9 <= to_hit_p_9_next;
            start_p_9 <= start_p_9_next;
            end_p_9 <= end_p_9_next;
            is_behind_9 <= is_behind_9_next;
            to_is_behind_9 <= to_is_behind_9_next;
        end if;
    end process;


    -- Stage 0
    idle_0_next <= idle_in;
    pixel_addr_0_next <= pixel_addr_in;
    color_acc_0_next <= color_acc_in;
    from_dir_0_next <= from_dir_in;
    block_p_0_next <= block_p_in;
    hit_p_0_next <= hit_p_in;
    start_p_0_next <= start_p_in;
    end_p_0_next <= end_p_in;
    is_behind_0_next <= is_behind_in;


    -- Stage 1
    idle_1_next <= idle_0;
    pixel_addr_1_next <= pixel_addr_0;
    color_acc_1_next <= color_acc_0;
    from_dir_1_next <= from_dir_0;
    block_p_1_next <= block_p_0;
    block_addr_1_next <=
        (others => '0') when is_in_map(block_p_0) = false else
        std_logic_vector(to_unsigned(block_p_0.x * MAPSIZE_Y * MAPSIZE_Z + block_p_0.y * MAPSIZE_Z + block_p_0.z, MAP_ADDR_RADIX));
    edges_n_1_next <= block_p_0 * TEXTURE_RES;
    hit_p_1_next <= hit_p_0;
    start_p_1_next <= start_p_0;
    general_dir_1_next(0) <= '1' when end_p_0.x > start_p_0.x else '0';
    general_dir_1_next(1) <= '1' when end_p_0.y > start_p_0.y else '0';
    general_dir_1_next(2) <= '1' when end_p_0.z > start_p_0.z else '0';
    end_p_1_next <= end_p_0;
    is_behind_1_next <= is_behind_0;


    -- Stage 2
    hit_p_rel_n_2 <= hit_p_1 - edges_n_1;

    idle_2_next <= idle_1;
    pixel_addr_2_next <= pixel_addr_1;
    color_acc_2_next <= color_acc_1;
    hit_surface_2_next <=
        0 when from_dir_1 = 0 and general_dir_1(0) = '1' else
        1 when from_dir_1 = 0 and general_dir_1(0) = '0' else
        2 when from_dir_1 = 1 and general_dir_1(1) = '1' else
        3 when from_dir_1 = 1 and general_dir_1(1) = '0' else
        4 when from_dir_1 = 2 and general_dir_1(2) = '1' else
        5 when from_dir_1 = 2 and general_dir_1(2) = '0' else
        6;
    block_p_2_next <= block_p_1;
    block_idx_2 <= block_idx_in;
    uv_coord_xn_2_next <= (TMAX - hit_p_rel_n_2.y, TMAX - hit_p_rel_n_2.z);
    uv_coord_xp_2_next <= (hit_p_rel_n_2.y, TMAX - hit_p_rel_n_2.z);
    uv_coord_yn_2_next <= (hit_p_rel_n_2.x, TMAX - hit_p_rel_n_2.z);
    uv_coord_yp_2_next <= (TMAX - hit_p_rel_n_2.x, TMAX - hit_p_rel_n_2.z);
    uv_coord_zn_2_next <= (hit_p_rel_n_2.x, hit_p_rel_n_2.y);
    uv_coord_zp_2_next <= (TMAX - hit_p_rel_n_2.x, hit_p_rel_n_2.y);
    edges_2_next.x <= edges_n_1.x when general_dir_1(0) = '0' else edges_n_1.x + TEXTURE_RES;
    edges_2_next.y <= edges_n_1.y when general_dir_1(1) = '0' else edges_n_1.y + TEXTURE_RES;
    edges_2_next.z <= edges_n_1.z when general_dir_1(2) = '0' else edges_n_1.z + TEXTURE_RES;
    start_p_2_next <= start_p_1;
    end_p_2_next <= end_p_1;
    delta_2_next <= end_p_1 - start_p_1;
    is_behind_2_next <= is_behind_1;


    -- Stage 3
    occ_3 <= edges_2 - start_p_2;

    idle_3_next <= idle_2;
    pixel_addr_3_next <= pixel_addr_2;
    color_acc_3_next <= color_acc_2;
    hit_surface_3_next <= hit_surface_2;
    txt_idx_addr_3_next <=
        (others => '0') when hit_surface_2 = 6 else
        std_logic_vector(to_unsigned(hit_surface_2 + to_integer(unsigned(block_idx_2)) * 6, TEXTURE_IDX_ADDR_RADIX));
    block_p_3_next <= block_p_2;
    block_idx_3_next <= block_idx_2;
    uv_coord_3_next <=
        uv_coord_xn_2 when hit_surface_2 = 0 else
        uv_coord_xp_2 when hit_surface_2 = 1 else
        uv_coord_yn_2 when hit_surface_2 = 2 else
        uv_coord_yp_2 when hit_surface_2 = 3 else
        uv_coord_zn_2 when hit_surface_2 = 4 else
        uv_coord_zp_2 when hit_surface_2 = 5 else
        (others => 0);
    delta_mul_occ_yx_3_next <= delta_2.y * occ_3.x;
    delta_mul_occ_zx_3_next <= delta_2.z * occ_3.x;
    delta_mul_occ_xy_3_next <= delta_2.x * occ_3.y;
    delta_mul_occ_zy_3_next <= delta_2.z * occ_3.y;
    delta_mul_occ_xz_3_next <= delta_2.x * occ_3.z;
    delta_mul_occ_yz_3_next <= delta_2.y * occ_3.z;
    edges_3_next <= edges_2;
    start_p_3_next <= start_p_2;
    end_p_3_next <= end_p_2;
    delta_3_next <= delta_2;
    div_zero_3_next(0) <= '1' when delta_2.x = 0 else '0';
    div_zero_3_next(1) <= '1' when delta_2.y = 0 else '0';
    div_zero_3_next(2) <= '1' when delta_2.z = 0 else '0';
    is_behind_3_next <= is_behind_2;


    -- Stage 4
    idle_4_next <= idle_3;
    pixel_addr_4_next <= pixel_addr_3;
    color_acc_4_next <= color_acc_3;
    hit_surface_4_next <= hit_surface_3;
    txt_idx_4 <= txt_idx_in;
    block_p_4_next <= block_p_3;
    block_idx_4_next <= block_idx_3;
    uv_coord_addr_4_next <= uv_coord_3.y * TEXTURE_RES + uv_coord_3.x;
    floor_cond_yx_4_next <= '1' when (delta_mul_occ_yx_3 > 0 and delta_3.x < 0) or (delta_mul_occ_xy_3 < 0 and delta_3.x > 0) else '0';
    floor_cond_zx_4_next <= '1' when (delta_mul_occ_zx_3 > 0 and delta_3.x < 0) or (delta_mul_occ_xz_3 < 0 and delta_3.x > 0) else '0';
    floor_cond_xy_4_next <= '1' when (delta_mul_occ_xy_3 > 0 and delta_3.y < 0) or (delta_mul_occ_yx_3 < 0 and delta_3.y > 0) else '0';
    floor_cond_zy_4_next <= '1' when (delta_mul_occ_zy_3 > 0 and delta_3.y < 0) or (delta_mul_occ_yz_3 < 0 and delta_3.y > 0) else '0';
    floor_cond_xz_4_next <= '1' when (delta_mul_occ_xz_3 > 0 and delta_3.z < 0) or (delta_mul_occ_zx_3 < 0 and delta_3.z > 0) else '0';
    floor_cond_yz_4_next <= '1' when (delta_mul_occ_yz_3 > 0 and delta_3.z < 0) or (delta_mul_occ_zy_3 < 0 and delta_3.z > 0) else '0';
    div_yx: divider_gen
        port map (
            -- aclk => clk_ppl,
            s_axis_divisor_tvalid => not div_zero_3(0),
            s_axis_divisor_tdata => std_logic_vector(to_signed(delta_3.x, 24)),
            s_axis_dividend_tvalid => not div_zero_3(0),
            s_axis_dividend_tdata => std_logic_vector(to_signed(delta_mul_occ_yx_3, 24)),
            m_axis_dout_tvalid => open,
            m_axis_dout_tdata => mul_div_delta_yx_raw_4_i
        );
    div_zx: divider_gen
        port map (
            -- aclk => clk_ppl,
            s_axis_divisor_tvalid => not div_zero_3(0),
            s_axis_divisor_tdata => std_logic_vector(to_signed(delta_3.x, 24)),
            s_axis_dividend_tvalid => not div_zero_3(0),
            s_axis_dividend_tdata => std_logic_vector(to_signed(delta_mul_occ_zx_3, 24)),
            m_axis_dout_tvalid => open,
            m_axis_dout_tdata => mul_div_delta_zx_raw_4_i
        );
    div_xy: divider_gen
        port map (
            -- aclk => clk_ppl,
            s_axis_divisor_tvalid => not div_zero_3(1),
            s_axis_divisor_tdata => std_logic_vector(to_signed(delta_3.y, 24)),
            s_axis_dividend_tvalid => not div_zero_3(1),
            s_axis_dividend_tdata => std_logic_vector(to_signed(delta_mul_occ_xy_3, 24)),
            m_axis_dout_tvalid => open,
            m_axis_dout_tdata => mul_div_delta_xy_raw_4_i
        );
    div_zy: divider_gen
        port map (
            -- aclk => clk_ppl,
            s_axis_divisor_tvalid => not div_zero_3(1),
            s_axis_divisor_tdata => std_logic_vector(to_signed(delta_3.y, 24)),
            s_axis_dividend_tvalid => not div_zero_3(1),
            s_axis_dividend_tdata => std_logic_vector(to_signed(delta_mul_occ_zy_3, 24)),
            m_axis_dout_tvalid => open,
            m_axis_dout_tdata => mul_div_delta_zy_raw_4_i
        );
    div_xz: divider_gen
        port map (
            -- aclk => clk_ppl,
            s_axis_divisor_tvalid => not div_zero_3(2),
            s_axis_divisor_tdata => std_logic_vector(to_signed(delta_3.z, 24)),
            s_axis_dividend_tvalid => not div_zero_3(2),
            s_axis_dividend_tdata => std_logic_vector(to_signed(delta_mul_occ_xz_3, 24)),
            m_axis_dout_tvalid => open,
            m_axis_dout_tdata => mul_div_delta_xz_raw_4_i
        );
    div_yz: divider_gen
        port map (
            -- aclk => clk_ppl,
            s_axis_divisor_tvalid => not div_zero_3(2),
            s_axis_divisor_tdata => std_logic_vector(to_signed(delta_3.z, 24)),
            s_axis_dividend_tvalid => not div_zero_3(2),
            s_axis_dividend_tdata => std_logic_vector(to_signed(delta_mul_occ_yz_3, 24)),
            m_axis_dout_tvalid => open,
            m_axis_dout_tdata => mul_div_delta_yz_raw_4_i
        );
    mul_div_delta_yx_res_4_next <= to_integer(signed(mul_div_delta_yx_raw_4_i(47 downto 24)));
    mul_div_delta_zx_res_4_next <= to_integer(signed(mul_div_delta_zx_raw_4_i(47 downto 24)));
    mul_div_delta_xy_res_4_next <= to_integer(signed(mul_div_delta_xy_raw_4_i(47 downto 24)));
    mul_div_delta_zy_res_4_next <= to_integer(signed(mul_div_delta_zy_raw_4_i(47 downto 24)));
    mul_div_delta_xz_res_4_next <= to_integer(signed(mul_div_delta_xz_raw_4_i(47 downto 24)));
    mul_div_delta_yz_res_4_next <= to_integer(signed(mul_div_delta_yz_raw_4_i(47 downto 24)));
    mul_div_delta_yx_rem_4_next <= to_integer(signed(mul_div_delta_yx_raw_4_i(23 downto 0)));
    mul_div_delta_zx_rem_4_next <= to_integer(signed(mul_div_delta_zx_raw_4_i(23 downto 0)));
    mul_div_delta_xy_rem_4_next <= to_integer(signed(mul_div_delta_xy_raw_4_i(23 downto 0)));
    mul_div_delta_zy_rem_4_next <= to_integer(signed(mul_div_delta_zy_raw_4_i(23 downto 0)));
    mul_div_delta_xz_rem_4_next <= to_integer(signed(mul_div_delta_xz_raw_4_i(23 downto 0)));
    mul_div_delta_yz_rem_4_next <= to_integer(signed(mul_div_delta_yz_raw_4_i(23 downto 0)));
    sp_eq_edges_4_next(0) <= '1' when start_p_3.x = edges_3.x else '0';
    sp_eq_edges_4_next(1) <= '1' when start_p_3.y = edges_3.y else '0';
    sp_eq_edges_4_next(2) <= '1' when start_p_3.z = edges_3.z else '0';
    edges_4_next <= edges_3;
    start_p_4_next <= start_p_3;
    end_p_4_next <= end_p_3;
    div_zero_4_next <= div_zero_3;
    is_behind_4_next <= is_behind_3;


    -- Stage 5
    idle_5_next <= idle_4;
    pixel_addr_5_next <= pixel_addr_4;
    color_acc_5_next <= color_acc_4;
    hit_surface_5_next <= hit_surface_4;
    block_p_5_next <= block_p_4;
    block_idx_5_next <= block_idx_4;
    texture_addr_5_next <= std_logic_vector(to_unsigned(to_integer(unsigned(txt_idx_4)) * TEXTURE_RES * TEXTURE_RES + uv_coord_addr_4, TEXTURE_ADDR_RADIX));
    mul_div_delta_yx_5_next <= mul_div_delta_yx_res_4 - 1 when floor_cond_yx_4 = '1' and mul_div_delta_yx_rem_4 /= 0 else mul_div_delta_yx_res_4;
    mul_div_delta_zx_5_next <= mul_div_delta_zx_res_4 - 1 when floor_cond_zx_4 = '1' and mul_div_delta_zx_rem_4 /= 0 else mul_div_delta_zx_res_4;
    mul_div_delta_xy_5_next <= mul_div_delta_xy_res_4 - 1 when floor_cond_xy_4 = '1' and mul_div_delta_xy_rem_4 /= 0 else mul_div_delta_xy_res_4;
    mul_div_delta_zy_5_next <= mul_div_delta_zy_res_4 - 1 when floor_cond_zy_4 = '1' and mul_div_delta_zy_rem_4 /= 0 else mul_div_delta_zy_res_4;
    mul_div_delta_xz_5_next <= mul_div_delta_xz_res_4 - 1 when floor_cond_xz_4 = '1' and mul_div_delta_xz_rem_4 /= 0 else mul_div_delta_xz_res_4;
    mul_div_delta_yz_5_next <= mul_div_delta_yz_res_4 - 1 when floor_cond_yz_4 = '1' and mul_div_delta_yz_rem_4 /= 0 else mul_div_delta_yz_res_4;
    sp_eq_edges_5_next <= sp_eq_edges_4;
    edges_5_next <= edges_4;
    start_p_5_next <= start_p_4;
    end_p_5_next <= end_p_4;
    div_zero_5_next <= div_zero_4;
    is_behind_5_next <= is_behind_4;


    -- Stage 6
    idle_6_next <= idle_5;
    pixel_addr_6_next <= pixel_addr_5;
    color_acc_6_next <= color_acc_5;
    hit_surface_6_next <= hit_surface_5;
    block_p_6_next <= block_p_5;
    block_idx_6_next <= block_idx_5;
    color_6 <= to_color(color_in);
    is_air_6_next <= '1' when block_idx_5 = 0 else '0';
    start_block_p_6_next <= start_p_5 / TEXTURE_RES;
    to_hit_p_x_6_next <=
        (edges_5.x, start_p_5.y + mul_div_delta_yx_5, start_p_5.z + mul_div_delta_zx_5) when div_zero_5(0) = '0' else
        start_p_5 when sp_eq_edges_5(0) = '1' else
        (MAXD, MAXD, MAXD);
    to_hit_p_y_6_next <=
        (start_p_5.x + mul_div_delta_xy_5, edges_5.y, start_p_5.z + mul_div_delta_zy_5) when div_zero_5(1) = '0' else
        start_p_5 when sp_eq_edges_5(1) = '1' else
        (MAXD, MAXD, MAXD);
    to_hit_p_z_6_next <=
        (start_p_5.x + mul_div_delta_xz_5, start_p_5.y + mul_div_delta_yz_5, edges_5.z) when div_zero_5(2) = '0' else
        start_p_5 when sp_eq_edges_5(2) = '1' else
        (MAXD, MAXD, MAXD);
    to_hit_p_x_mht_6_next <=
        length_mht((edges_5.x - start_p_5.x, mul_div_delta_yx_5, mul_div_delta_zx_5)) when div_zero_5(0) = '0' else
        0 when sp_eq_edges_5(0) = '1' else
        MAXD;
    to_hit_p_y_mht_6_next <=
        length_mht((mul_div_delta_xy_5, edges_5.y - start_p_5.y, mul_div_delta_zy_5)) when div_zero_5(1) = '0' else
        0 when sp_eq_edges_5(1) = '1' else
        MAXD;
    to_hit_p_z_mht_6_next <=
        length_mht((mul_div_delta_xz_5, mul_div_delta_yz_5, edges_5.z - start_p_5.z)) when div_zero_5(2) = '0' else
        0 when sp_eq_edges_5(2) = '1' else
        MAXD;
        -- TODO: reuse the conditions.
    start_p_6_next <= start_p_5;
    end_p_6_next <= end_p_5;
    div_zero_6_next <= div_zero_5;
    is_behind_6_next <= is_behind_5;


    -- Stage 7
    idle_7_next <= idle_6;
    pixel_addr_7_next <= pixel_addr_6;
    color_acc_7_next <= color_acc_6;
    hit_surface_7_next <= hit_surface_6;
    block_p_7_next <= block_p_6;
    block_idx_7_next <= block_idx_6;
    color_7_next <= color_6;
    is_air_7_next <= is_air_6;
    dist_block_p_7_next <= length_2(block_p_6 - start_block_p_6);
    to_hit_p_x_7_next <= to_hit_p_x_6;
    to_hit_p_y_7_next <= to_hit_p_y_6;
    to_hit_p_z_7_next <= to_hit_p_z_6;
    leq_xy_7_next <= '1' when (to_hit_p_x_mht_6 <= to_hit_p_y_mht_6 and div_zero_6(0) = '0') or (div_zero_6(1) = '1') else '0';
    leq_xz_7_next <= '1' when (to_hit_p_x_mht_6 <= to_hit_p_z_mht_6 and div_zero_6(0) = '0') or (div_zero_6(2) = '1') else '0';
    leq_yz_7_next <= '1' when (to_hit_p_y_mht_6 <= to_hit_p_z_mht_6 and div_zero_6(1) = '0') or (div_zero_6(2) = '1') else '0';
    start_p_7_next <= start_p_6;
    end_p_7_next <= end_p_6;
    div_zero_7_next <= div_zero_6;
    is_behind_7_next <= is_behind_6;


    -- Stage 8
    idle_8_next <= idle_7;
    pixel_addr_8_next <= pixel_addr_7;
    hit_surface_8_next <= hit_surface_7;
    block_p_8_next <= block_p_7;
    block_idx_8_next <= block_idx_7;
    to_color_acc_8_next <= color_acc_7 when is_air_7 = '1' else blend_color(color_acc_7, color_7);
    is_air_8_next <= is_air_7;
    is_in_bound_8_next <= '1' when dist_block_p_7 < TRACE_DIST_RAD_SQUARED and is_in_map(block_p_7) = true else '0';
    blend_color_sky_8_next <= blend_color(color_acc_7, SKY_COLOR);
    to_dir_8_next <=
        0 when div_zero_7(0) = '0' and leq_xy_7 = '1' and leq_xz_7 = '1' else
        1 when div_zero_7(1) = '0' and leq_xy_7 = '0' and leq_yz_7 = '1' else
        2 when div_zero_7(2) = '0' and leq_xz_7 = '0' and leq_yz_7 = '0' else
        3;
        -- TODO: judge the INVALID.
    to_hit_p_8_next <=
        to_hit_p_x_7 when to_dir_8_next = 0 else
        to_hit_p_y_7 when to_dir_8_next = 1 else
        to_hit_p_z_7;
        -- TODO: reuse the conditions.
    general_dir_8_next(0) <= '1' when end_p_7.x > start_p_7.x else '0';
    general_dir_8_next(1) <= '1' when end_p_7.y > start_p_7.y else '0';
    general_dir_8_next(2) <= '1' when end_p_7.z > start_p_7.z else '0';
    start_p_8_next <= start_p_7;
    end_p_8_next <= end_p_7;
    is_behind_8_next <= is_behind_7;


    -- Stage 9
    next_pixel_9_next <= '0' when idle_8 = '0' and continue_9_next = '1' else '1';
    write_disp_buf_9_next <= '1' when idle_8 = '0' and continue_9_next = '0' else '0';
    pixel_addr_9_next <= pixel_addr_8;
    is_crosshair_9_next <= '1' when pixel_addr_8 = CENTER_ADDR else '0';
    hit_surface_9_next <= hit_surface_8;
    block_p_9_next <= block_p_8;
    block_idx_9_next <= block_idx_8;
    to_color_acc_9_next <= to_color_acc_8 when is_in_bound_8 = '1' else blend_color_sky_8;
    is_air_9_next <= is_air_8;
    continue_9_next <= '1' when is_in_bound_8 = '1' and is_opaque(to_color_acc_8) = false else '0';
        -- TIPS:
        -- idle = '1' <=> offer new block.
        -- idle = '0' and continue = '0' <=> write display ram and offer new block.
            -- need to determine the color:
                -- a. special points, like UI, crosshair, etc.
                -- b. have been opaque => to_color_acc.
                -- c. have not been opaque => to_color_sky.
        -- idle = '0' and continue = '1' <=> only offer next block.
    is_in_bound_9_next <= is_in_bound_8;
    is_sky_9_next <= '1' when write_disp_buf_9_next = '1' and is_opaque(to_color_acc_8) = false else '0';
    to_block_p_9_next.x <=
        block_p_8.x + 1 when to_dir_8 = 0 and general_dir_8(0) = '1' else
        block_p_8.x - 1 when to_dir_8 = 0 and general_dir_8(0) = '0' else
        block_p_8.x;
    to_block_p_9_next.y <=
        block_p_8.y + 1 when to_dir_8 = 1 and general_dir_8(1) = '1' else
        block_p_8.y - 1 when to_dir_8 = 1 and general_dir_8(1) = '0' else
        block_p_8.y;
    to_block_p_9_next.z <=
        block_p_8.z + 1 when to_dir_8 = 2 and general_dir_8(2) = '1' else
        block_p_8.z - 1 when to_dir_8 = 2 and general_dir_8(2) = '0' else
        block_p_8.z;
    to_dir_9_next <= to_dir_8;
    to_hit_p_9_next <= to_hit_p_8;
    start_p_9_next <= start_p_8;
    end_p_9_next <= end_p_8;
    is_behind_9_next <= is_behind_8;
    to_is_behind_9_next <= '1' when is_air_8 = '0' else is_behind_8;


    -- Address Outputs
    block_addr_out <= block_addr_1;
    txt_idx_addr_out <= txt_idx_addr_3;
    texture_addr_out <= texture_addr_5;

    -- Final Stage Outputs
    next_pixel_out <= next_pixel_9;
    write_disp_buf_out <= write_disp_buf_9;
    pixel_addr_out <= pixel_addr_9;
    is_crosshair_out <= is_crosshair_9;
    hit_surface_out <= hit_surface_9;
    block_p_out <= block_p_9;
    block_idx_out <= block_idx_9;
    to_color_acc_out <= to_color_acc_9;
    is_air_out <= is_air_9;
    continue_out <= continue_9;
    is_in_bound_out <= is_in_bound_9;
    is_sky_out <= is_sky_9;
    to_block_p_out <= to_block_p_9;
    to_dir_out <= to_dir_9;
    to_hit_p_out <= to_hit_p_9;
    start_p_out <= start_p_9;
    end_p_out <= end_p_9;
    is_behind_out <= is_behind_9;
    to_is_behind_out <= to_is_behind_9;
end architecture;
