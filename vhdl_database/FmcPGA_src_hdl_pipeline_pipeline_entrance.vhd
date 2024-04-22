library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.constants.all;
use work.types.all;


entity pipeline_entrance is
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
end entity;


architecture Behavioral of pipeline_entrance is
    component viewport_scanner is
        port (
            clk_ppl, rst, enable: in std_logic;
            fragment_uv: out vec2i_t
        );
    end component;

    component viewport_params is
        port (
            p_pos: in vec3i_t;
            p_angle: in vec2i_t;
            vp_origin, vp_u, vp_v: out vec3i_t;
            towards_h: out vec2i_t
        );
    end component;

    type state_t is (BEFORE_PREPARE, PREPARING, RUNNING);

    constant PREPARE_CYCLES: int := 4;

    signal state, state_next: state_t;
    signal prepare_cnt, prepare_cnt_next: int;
    signal is_eof_i, is_preparing_i: std_logic;
    signal fragment_uv: vec2i_t;
    signal vp_origin, vp_u, vp_v, vp_target: vec3i_t;
begin
    -- State Machine
    process (clk_ppl, rst) is
    begin
        if rst = '1' then
            state <= BEFORE_PREPARE;
            prepare_cnt <= 0;
        elsif rising_edge(clk_ppl) then
            state <= state_next;
            prepare_cnt <= prepare_cnt_next;
        end if;
    end process;

    is_eof_i <= '1' when pixel_addr_pplout = EOF_ADDR and next_pixel_pplout = '1' else '0';
    is_eof <= is_eof_i;

    is_preparing_i <= '1' when state /= RUNNING else '0';
    is_preparing <= is_preparing_i;

    process (state, prepare_cnt, is_eof_i) is
    begin
        state_next <= state;
        prepare_cnt_next <= prepare_cnt;
        case state is
            when BEFORE_PREPARE =>
                state_next <= PREPARING;
                prepare_cnt_next <= 0;
            when PREPARING =>
                if prepare_cnt = PREPARE_CYCLES - 1 then
                    state_next <= RUNNING;
                end if;
                prepare_cnt_next <= prepare_cnt + 1;
            when RUNNING =>
                if is_eof_i = '1' then
                    state_next <= BEFORE_PREPARE;
                end if;
                prepare_cnt_next <= 0;
        end case;
    end process;

    -- Viewport
    vp_scan: viewport_scanner
        port map (
            clk_ppl => clk_ppl,
            rst => rst,
            enable => next_pixel_pplout and (not is_preparing_i),
            fragment_uv => fragment_uv
        );
    
    vp_param: viewport_params
        port map (
            p_pos => p_pos,
            p_angle => p_angle,
            vp_origin => vp_origin,
            vp_u => vp_u,
            vp_v => vp_v,
            towards_h => towards_h
        );
    vp_target <= vp_origin + vp_u * fragment_uv.x * LOOKAT_REL_FAC / ANGLE_RADIUS - vp_v * fragment_uv.y * LOOKAT_REL_FAC / ANGLE_RADIUS; -- update when p_state updates, i.e., when preparing.

    -- Output Multiplexer
    idle <= '0';
    pixel_addr <= pixel_addr_pplout when next_pixel_pplout = '0' else std_logic_vector(to_unsigned(fragment_uv.y * H_REAL + fragment_uv.x, DISP_RAM_ADDR_RADIX));
    color_acc <= to_color_acc_pplout when next_pixel_pplout = '0' else (others => 0);
    from_dir <= to_dir_pplout when next_pixel_pplout = '0' else 0;
    block_p <= to_block_p_pplout when next_pixel_pplout = '0' else p_pos / TEXTURE_RES;
    hit_p <= to_hit_p_pplout when next_pixel_pplout = '0' else p_pos;
    start_p <= start_p_pplout when next_pixel_pplout = '0' else p_pos;
    end_p <= end_p_pplout when next_pixel_pplout = '0' else vp_target;
    is_behind <= to_is_behind_pplout when next_pixel_pplout = '0' else '0';
end architecture;
