library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.filter_shared_package.all;

entity filter_in_data_controller is
    generic
        (
            MAC_FILTER_CH : natural := MC;    -- MAC operations per channel for Main filter operation
            RMS_CH_EN     : natural := RMS;   -- Enable flag for RMS function.     0-disabled 1- enabled.
            MEAN_CH_EN    : natural := MEAN;  -- Enable flag for MEAN function.    0-disabled 1- enabled.
            CHANNELS      : natural := C
            );
    port
        (
            clk                : in    std_logic;
            rstn               : in    std_logic;
            cnt_mac            : in    std_logic_vector(natural(ceil(log2(real(MAC_FILTER_CH+RMS_CH_EN+MEAN_CH_EN))))-1 downto 0);
            cnt_ch             : in    std_logic_vector(natural(ceil(log2(real(CHANNELS))))-1 downto 0);
            x_input            : in    std_logic;
            valid              : in    std_logic;
            sink_valid         : in    std_logic;
            sink_endofpacket   : in    std_logic;
            sink_startofpacket : in    std_logic;
            input_ack          : in    std_logic;
            sink_ready         : out   std_logic;
            input_ok           : out   std_logic;
            x_rdaddr           : out   X_ADD_T;
            x_rden             : out   std_logic;
            x_wraddr           : out   X_ADD_T;
            x_wren             : out   std_logic
            );
end filter_in_data_controller;


architecture behaviour of filter_in_data_controller is
    
    type STATE_TYPE is (
        IDLE_STATE,
        START_STATE,
        WRITE_STATE,
        DONE_STATE);

    signal cs_s         : STATE_TYPE;
    signal ns_s         : STATE_TYPE;
    signal x_cur_page_s : std_logic_vector(1 downto 0);
    signal x_nxt_page_s : std_logic_vector(1 downto 0);
    signal x_mod_page_s : std_logic_vector(1 downto 0);
    signal int_cnt_ch_s : unsigned(cnt_ch'range);
    signal wren_s       : std_logic;
    signal select_s     : std_logic_vector(3 downto 0);
    signal input_ok_s   : std_logic;
    
begin

    process (clk, rstn) is
    begin
        if (rstn = '0') then
            x_cur_page_s <= (others => '0');
        elsif (clk = '1' and clk'event) then
            if (input_ok_s = '1') then
                -- flip pages (shift register emulation)
                x_cur_page_s <= x_nxt_page_s;
            end if;
        end if;
    end process;

    -- read interface    
    select_s <= x_cur_page_s(1 downto 0) & cnt_mac(1 downto 0);
    with (select_s) select
        x_mod_page_s <=
        "00" when "0000",
        "01" when "0100",
        "10" when "1000",
        "01" when "0001",
        "10" when "0101",
        "00" when "1001",
        "10" when "0010",
        "00" when "0110",
        "01" when "1010",
        -- TODO: was "XX"
        "00" when others;
    x_rdaddr <= std_logic_vector(resize(unsigned(x_mod_page_s) * to_unsigned(CHANNELS,cnt_ch'length), x_rdaddr'length) + unsigned(cnt_ch));  -- p*C + c
    x_rden   <= x_input;

    -- write interface
    x_nxt_page_s(1) <= x_cur_page_s(0) nor x_cur_page_s(1);
    x_nxt_page_s(0) <= x_cur_page_s(1);
    x_wraddr        <= std_logic_vector(resize(unsigned(x_nxt_page_s) * to_unsigned(CHANNELS,cnt_ch'length), x_wraddr'length) + int_cnt_ch_s);  -- p*C + c
    x_wren          <= wren_s;

    -- counter process
    process (clk, rstn) is
    begin
        if (rstn = '0') then
            int_cnt_ch_s <= (others => '0');
            
        elsif (clk = '1' and clk'event) then
            if (cs_s = IDLE_STATE) then
                int_cnt_ch_s <= (others => '0');
            end if;
            
            if (((cs_s = WRITE_STATE) and (sink_valid = '1')) or
                ((cs_s = START_STATE) and (sink_valid = '1') and (sink_startofpacket = '1'))) then

                int_cnt_ch_s <= int_cnt_ch_s + 1;
            end if;
        end if;
    end process;

    -- state memory
    process (clk, rstn) is
    begin
        if (rstn = '0') then
            cs_s <= IDLE_STATE;
        elsif (clk = '1' and clk'event) then
            cs_s <= ns_s;
        end if;
    end process;

    -- next state logic
    process (cs_s, x_input, valid, sink_valid, sink_endofpacket, sink_startofpacket, input_ack) is
    begin
        case cs_s is
            when IDLE_STATE =>
                if ((x_input = '0') or (valid = '0')) then
                    ns_s <= START_STATE;  -- TODO: was WAIT_STATE
                else
                    ns_s <= IDLE_STATE;
                end if;
                
            when START_STATE =>
                if ((sink_valid = '1') and (sink_startofpacket = '1')) then
                    ns_s <= WRITE_STATE;
                else
                    ns_s <= START_STATE;
                end if;
                
            when WRITE_STATE =>
                if ((sink_valid = '1') and (sink_endofpacket = '1')) then
                    ns_s <= DONE_STATE;
                else
                    ns_s <= WRITE_STATE;
                end if;
                
            when DONE_STATE =>
                if (input_ack = '1') then
                    ns_s <= IDLE_STATE;
                else
                    ns_s <= DONE_STATE;
                end if;
                
            when others =>
                ns_s <= IDLE_STATE;
        end case;
    end process;

    -- state machine output values based on state
    with cs_s select
        input_ok_s <=
        '1' when DONE_STATE,
        '0' when others;
    
    input_ok <= input_ok_s;
    
    with cs_s select
        sink_ready <=
        '1' when START_STATE,
        '1' when WRITE_STATE,
        '0' when others;

    with cs_s select
        wren_s <=
        sink_valid when WRITE_STATE,
        sink_valid when START_STATE,
        '0'        when others;
    
end behaviour;
