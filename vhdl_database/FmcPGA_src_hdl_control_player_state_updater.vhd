library IEEE;
use IEEE.std_logic_1164.all;

use work.types.all;
use work.constants.all;


-- This module is used to accept resolved peripheral inputs and update the player state at a appropriate frequency.
entity player_state_updater is
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
end entity;


architecture Behavioral of player_state_updater is
    component frequency_divider is
        generic (
            PERIOD: integer := 100000
        );
        port (
            clk, rst: in std_logic;
            en: in std_logic;
            pulse: out std_logic
        );
    end component;

    component inventory_register is
        port (
            clk, rst, enable: in std_logic;
            last_item, next_item: in std_logic;
            current_item: out int
        );
    end component;

    constant BTN_UPDATE_FREQ: integer := 8;
    constant CONT_UPDATE_FREQ: integer := 75;

    signal btn_pulse: std_logic;
    signal ctrl_pulse: std_logic;

    signal current_item_reg: int;

    signal front_vec, right_vec: vec3i_t;
    signal current_pos_reg, current_pos_next: vec3i_t;
    signal current_angle_reg, current_angle_next: vec2i_t;
begin
    btn_freq_div: frequency_divider
        generic map (
            PERIOD => PPL_FREQ / BTN_UPDATE_FREQ
        )
        port map (
            clk => clk,
            rst => rst,
            en => enable,
            pulse => btn_pulse
        );

    ctrl_freq_div: frequency_divider
        generic map (
            PERIOD => PPL_FREQ / CONT_UPDATE_FREQ
        )
        port map (
            clk => clk,
            rst => rst,
            en => enable,
            pulse => ctrl_pulse
        );

    -- Manipulation
    mani_enable <= btn_pulse and (left_click or right_click);
    block_p_target <= block_p_inc when right_click = '1' else block_p_sel;
    idx_target <= current_item when right_click = '1' else 0;

    -- Inventory
    inventory_reg: inventory_register
        port map (
            clk => clk,
            rst => rst,
            enable => btn_pulse,
            last_item => last_item_click,
            next_item => next_item_click,
            current_item => current_item_reg
        );
    current_item <= current_item_reg;

    -- Movement
    process (clk, rst) is
    begin
        if rst = '1' then
            current_pos_reg <= (470 * 16, 470 * 16, 280 * 16);
            current_angle_reg <= (30, -120);
        elsif rising_edge(clk) and ctrl_pulse = '1' then
            current_pos_reg <= current_pos_next;
            current_angle_reg <= current_angle_next;
        end if;
    end process;

    front_vec <= vec3i_t'(towards_h.x, towards_h.y, 0);
    right_vec <= vec3i_t'(towards_h.y, -towards_h.x, 0);
    process (clk, rst) is
    begin
        current_pos_next <= current_pos + front_vec * move_fb_offset * POS_STEP / PSS_MIDDLE / ANGLE_RADIUS + right_vec * move_lr_offset * POS_STEP / PSS_MIDDLE / ANGLE_RADIUS + vec3i_t'(0, 0, move_ud_offset * POS_STEP / PSS_MIDDLE);
        current_angle_next.x <= current_angle.x - angle_lr_offset * ANGLE_STEP / PSS_MIDDLE;
        current_angle_next.y <= current_angle.y + angle_ud_offset * ANGLE_STEP / PSS_MIDDLE;
    end process;
    current_pos <= current_pos_reg;
    current_angle <= current_angle_reg;
end architecture;
