------------------------------------------------------------------------
-- quadrature_controller.vhd
------------------------------------------------------------------------
-- Author : David Banks
--              Copyright 2016
--
------------------------------------------------------------------------
-- Based on mouse_controller.vhd
------------------------------------------------------------------------
-- Author : Ulrich Zolt�n
--              Copyright 2006 Digilent, Inc.
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity quadrature_controller is
port(
    clk         : in std_logic;
    rst         : in std_logic;
    -- Connections to PS/2 interface
    read        : in std_logic;
    err         : in std_logic;
    rx_data     : in std_logic_vector(7 downto 0);
    write       : out std_logic;
    tx_data     : out std_logic_vector(7 downto 0);
    x_a         : out std_logic;
    x_b         : out std_logic;
    y_a         : out std_logic;
    y_b         : out std_logic;
    left        : out std_logic;
    middle      : out std_logic;
    right       : out std_logic
);
end quadrature_controller;

architecture Behavioral of quadrature_controller is

------------------------------------------------------------------------
-- CONSTANTS
------------------------------------------------------------------------

-- constants defining commands to send or received from the mouse
constant FA: std_logic_vector(7 downto 0) := "11111010"; -- 0xFA(ACK)
constant FF: std_logic_vector(7 downto 0) := "11111111"; -- 0xFF(RESET)
constant AA: std_logic_vector(7 downto 0) := "10101010"; -- 0xAA(BAT_OK)
constant OO: std_logic_vector(7 downto 0) := "00000000"; -- 0x00(ID)
                                 -- (atention: name is 2 letters O not zero)

-- command to read id
constant READ_ID              : std_logic_vector(7 downto 0) := x"F2";

-- command to enable mouse reporting
-- after this command is sent, the mouse begins sending data packets
constant ENABLE_REPORTING : std_logic_vector(7 downto 0) := x"F4";

-- command to set the mouse resolution
constant SET_RESOLUTION   : std_logic_vector(7 downto 0) := x"E8";

-- the value of the resolution to send after sending SET_RESOLUTION
constant RESOLUTION       : std_logic_vector(7 downto 0) := x"02";
                                                                  -- (4 counts/mm)
-- command to set the mouse sample rate
constant SET_SAMPLE_RATE  : std_logic_vector(7 downto 0) := x"F3";

-- the value of the sample rate to send after sending SET_SAMPLE_RATE
constant SAMPLE_RATE          : std_logic_vector(7 downto 0) := x"28";
                                                                  -- (40 samples/s)

------------------------------------------------------------------------
-- SIGNALS
------------------------------------------------------------------------

-- after doing the enable scroll mouse procedure, if the ID returned by
-- the mouse is 03 (scroll mouse enabled) then this register will be set
-- If '1' then the mouse is in scroll mode, else mouse is in simple
-- mouse mode.
signal haswheel: std_logic := '0';

-- active when an overflow occurred on the x and y axis
-- bits 6 and 7 from the first byte received from the mouse
signal x_overflow,y_overflow: std_logic := '0';

-- active when the x,y movement is negative
-- bits 4 and 5 from the first byte received from the mouse
signal x_sign,y_sign: std_logic := '0';

-- active for one clock period, indicates new delta movement received
-- on x,y axis
signal x_new,y_new: std_logic := '0';

-- 2's complement value for incrementing the x_pos,y_pos
-- y_inc is the negated value from the mouse in the third byte
signal x_inc,y_inc: std_logic_vector(7 downto 0) := (others => '0');

-- active when left,middle,right mouse button is down
signal left_down,middle_down,right_down: std_logic := '0';

-- TODO - not currently used; remove?
signal new_event: std_logic := '0';

-- the FSM states
-- states that begin with "reset" are part of the reset procedure.
-- states that end in "_wait_ack" are states in which ack is waited
-- as response to sending a byte to the mouse.
-- read behavioral description above for details.
type fsm_state is
(
    reset,reset_wait_ack,reset_wait_bat_completion,reset_wait_id,
    reset_set_sample_rate_200,reset_set_sample_rate_200_wait_ack,
    reset_send_sample_rate_200,reset_send_sample_rate_200_wait_ack,
    reset_set_sample_rate_100,reset_set_sample_rate_100_wait_ack,
    reset_send_sample_rate_100,reset_send_sample_rate_100_wait_ack,
    reset_set_sample_rate_80,reset_set_sample_rate_80_wait_ack,
    reset_send_sample_rate_80,reset_send_sample_rate_80_wait_ack,
    reset_read_id,reset_read_id_wait_ack,reset_read_id_wait_id,
    reset_set_resolution,reset_set_resolution_wait_ack,
    reset_send_resolution,reset_send_resolution_wait_ack,
    reset_set_sample_rate_40,reset_set_sample_rate_40_wait_ack,
    reset_send_sample_rate_40,reset_send_sample_rate_40_wait_ack,
    reset_enable_reporting,reset_enable_reporting_wait_ack,
    read_byte_1,read_byte_2,read_byte_3,read_byte_4,mark_new_event
);

-- holds current state of the FSM
signal state: fsm_state := reset;

begin

    -- left output the state of the left_down register    
    left <= not left_down when rising_edge(clk);
    -- middle output the state of the middle_down register
    middle <= not middle_down when rising_edge(clk);
    -- right output the state of the right_down register
    right <= not right_down when rising_edge(clk);
    
    -- Instantiate seperate instances of the quadrature encoder state machine
    -- for X and Y directions
    quad_x_fsm: entity work.quadrature_fsm port map (clk, rst, x_new, x_inc, x_sign, x_a, x_b);
    quad_y_fsm: entity work.quadrature_fsm port map (clk, rst, y_new, y_inc, y_sign, y_a, y_b);
              
    -- Synchronous one process fsm to handle the communication
    -- with the mouse.
    -- When reset and at start-up it enters reset state
    -- where it begins the procedure of initializing the mouse.
    -- After initialization is complete, it waits packets from
    -- the mouse.
    -- Read at Behavioral decription for details.
    manage_fsm: process(clk,rst)
    begin
        -- when reset occurs, give signals default values.
        if (rst = '1') then
            state <= reset;
            haswheel <= '0';
            x_overflow <= '0';
            y_overflow <= '0';
            x_sign <= '0';
            y_sign <= '0';
            x_inc <= (others => '0');
            y_inc <= (others => '0');
            x_new <= '0';
            y_new <= '0';
            new_event <= '0';
            left_down <= '0';
            middle_down <= '0';
            right_down <= '0';

        elsif (rising_edge(clk)) then

            -- at every rising edge of the clock, this signals
            -- are reset, thus assuring that they are active
            -- for one clock period only if a state sets then
            -- because the fsm will transition from the state
            -- that set them on the next rising edge of clock.
            write <= '0';
            x_new <= '0';
            y_new <= '0';
            
            case state is

                -- if just powered-up, reset occurred or some error in
                -- transmision encountered, then fsm will transition to
                -- this state. Here the RESET command (FF) is sent to the
                -- mouse, and various signals receive their default values
                -- From here the FSM transitions to a series of states that
                -- perform the mouse initialization procedure. All this
                -- state are prefixed by "reset_". After sending a byte
                -- to the mouse, it respondes by sending ack (FA). All
                -- states that wait ack from the mouse are postfixed by
                -- "_wait_ack".
                -- Read at Behavioral decription for details.
                when reset =>
                    haswheel <= '0';
                    x_overflow <= '0';
                    y_overflow <= '0';
                    x_sign <= '0';
                    y_sign <= '0';
                    x_inc <= (others => '0');
                    y_inc <= (others => '0');
                    x_new <= '0';
                    y_new <= '0';
                    left_down <= '0';
                    middle_down <= '0';
                    right_down <= '0';
                    tx_data <= FF;
                    write <= '1';
                    state <= reset_wait_ack;

                -- wait ack for the reset command.
                -- when received transition to reset_wait_bat_completion.
                -- if error occurs go to reset state.
                when reset_wait_ack =>
                    if (read = '1') then
                        -- if received ack
                        if (rx_data = FA) then
                            state <= reset_wait_bat_completion;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_wait_ack;
                    end if;

                -- wait for bat completion test
                -- mouse should send AA if test is successful
                when reset_wait_bat_completion =>
                    if (read = '1') then
                        if (rx_data = AA) then
                            state <= reset_wait_id;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_wait_bat_completion;
                    end if;

                -- the mouse sends its id after performing bat test
                -- the mouse id should be 00
                when reset_wait_id =>
                    if (read = '1') then
                        if (rx_data = OO) then
                            state <= reset_set_sample_rate_200;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_wait_id;
                    end if;

                -- with this state begins the enable wheel mouse
                -- procedure. The procedure consists of setting
                -- the sample rate of the mouse first 200, then 100
                -- then 80. After this is done, the mouse id is
                -- requested and if the mouse id is 03, then
                -- mouse is in wheel mode and will send 4 byte packets
                -- when reporting is enabled.
                -- If the id is 00, the mouse does not have a wheel
                -- and will send 3 byte packets when reporting is enabled.
                -- This state issues the set_sample_rate command to the
                -- mouse.
                when reset_set_sample_rate_200 =>
                    tx_data <= SET_SAMPLE_RATE;
                    write <= '1';
                    state <= reset_set_sample_rate_200_wait_ack;

                -- wait ack for set sample rate command
                when reset_set_sample_rate_200_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_send_sample_rate_200;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_set_sample_rate_200_wait_ack;
                    end if;

                -- send the desired sample rate (200 = 0xC8)
                when reset_send_sample_rate_200 =>
                    tx_data <= "11001000"; -- 0xC8
                    write <= '1';
                    state <= reset_send_sample_rate_200_wait_ack;

                -- wait ack for sending the sample rate
                when reset_send_sample_rate_200_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_set_sample_rate_100;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_send_sample_rate_200_wait_ack;
                    end if;

                -- send the sample rate command
                when reset_set_sample_rate_100 =>
                    tx_data <= SET_SAMPLE_RATE;
                    write <= '1';
                    state <= reset_set_sample_rate_100_wait_ack;

                -- wait ack for sending the sample rate command
                when reset_set_sample_rate_100_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_send_sample_rate_100;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_set_sample_rate_100_wait_ack;
                    end if;

                -- send the desired sample rate (100 = 0x64)
                when reset_send_sample_rate_100 =>
                    tx_data <= "01100100"; -- 0x64
                    write <= '1';
                    state <= reset_send_sample_rate_100_wait_ack;

                -- wait ack for sending the sample rate
                when reset_send_sample_rate_100_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_set_sample_rate_80;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_send_sample_rate_100_wait_ack;
                    end if;             

                -- send set sample rate command
                when reset_set_sample_rate_80 =>
                    tx_data <= SET_SAMPLE_RATE;
                    write <= '1';
                    state <= reset_set_sample_rate_80_wait_ack;

                -- wait ack for sending the sample rate command
                when reset_set_sample_rate_80_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_send_sample_rate_80;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_set_sample_rate_80_wait_ack;
                    end if;

                -- send desired sample rate (80 = 0x50)
                when reset_send_sample_rate_80 =>
                    tx_data <= "01010000"; -- 0x50
                    write <= '1';
                    state <= reset_send_sample_rate_80_wait_ack;

                -- wait ack for sending the sample rate
                when reset_send_sample_rate_80_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_read_id;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_send_sample_rate_80_wait_ack;
                    end if;             

                -- now the procedure for enabling wheel mode is done
                -- the mouse id is read to determine is mouse is in
                -- wheel mode.
                -- Read ID command is sent to the mouse.
                when reset_read_id =>
                    tx_data <= READ_ID;
                    write <= '1';
                    state <= reset_read_id_wait_ack;

                -- wait ack for sending the read id command
                when reset_read_id_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_read_id_wait_id;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_read_id_wait_ack;
                    end if;

                -- received the mouse id
                -- if the id is 00, then the mouse does not have
                -- a wheel and haswheel is reset
                -- if the id is 03, then the mouse is in scroll mode
                -- and haswheel is set.
                -- if anything else is received or an error occurred
                -- then the FSM transitions to reset state.
                when reset_read_id_wait_id =>
                    if (read = '1') then
                        if (rx_data = "000000000") then
                            -- the mouse does not have a wheel
                            haswheel <= '0';
                            state <= reset_set_resolution;
                        elsif (rx_data = "00000011") then  -- 0x03
                            -- the mouse is in scroll mode
                            haswheel <= '1';
                            state <= reset_set_resolution;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_read_id_wait_id;
                    end if;

                -- send the set resolution command to the mouse
                when reset_set_resolution =>
                    tx_data <= SET_RESOLUTION;
                    write <= '1';
                    state <= reset_set_resolution_wait_ack;

                -- wait ack for sending the set resolution command
                when reset_set_resolution_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_send_resolution;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_set_resolution_wait_ack;
                    end if;

                -- send the desired resolution (0x03 = 8 counts/mm)
                when reset_send_resolution =>
                    tx_data <= RESOLUTION;
                    write <= '1';
                    state <= reset_send_resolution_wait_ack;

                
                -- wait ack for sending the resolution
                when reset_send_resolution_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_set_sample_rate_40;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_send_resolution_wait_ack;
                    end if;

                -- send the set sample rate command
                when reset_set_sample_rate_40 =>
                    tx_data <= SET_SAMPLE_RATE;
                    write <= '1';
                    state <= reset_set_sample_rate_40_wait_ack;

                -- wait ack for sending the set sample rate command
                when reset_set_sample_rate_40_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_send_sample_rate_40;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_set_sample_rate_40_wait_ack;
                    end if;

                -- send the desired sampele rate.
                -- 40 samples per second is sent.
                when reset_send_sample_rate_40 =>
                    tx_data <= SAMPLE_RATE;
                    write <= '1';
                    state <= reset_send_sample_rate_40_wait_ack;

                -- wait ack for sending the sample rate
                when reset_send_sample_rate_40_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= reset_enable_reporting;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_send_sample_rate_40_wait_ack;
                    end if;

                -- in this state enable reporting command is sent
                -- to the mouse. Before this point, the mouse
                -- does not send packets. Only after issuing this
                -- command, the mouse begins sending data packets,
                -- 3 byte packets if it doesn't have a wheel and
                -- 4 byte packets if it is in scroll mode.
                when reset_enable_reporting =>
                    tx_data <= ENABLE_REPORTING;
                    write <= '1';
                    state <= reset_enable_reporting_wait_ack;

                -- wait ack for sending the enable reporting command
                when reset_enable_reporting_wait_ack =>
                    if (read = '1') then
                        if (rx_data = FA) then
                            state <= read_byte_1;
                        else
                            state <= reset;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= reset_enable_reporting_wait_ack;
                    end if;

                -- this is idle state of the FSM after the
                -- initialization is complete.
                -- Here the first byte of a packet is waited.
                -- The first byte contains the state of the
                -- buttons, the sign of the x and y movement
                -- and overflow information about these movements
                -- First byte looks like this:
                --      7         6       5       4     3    2    1 0
                ------------------------------------------------------
                -- | Y OVF | X OVF | Y SIGN | X SIGN | 1 | M | R | L |
                ------------------------------------------------------
                when read_byte_1 =>
                    -- reset new_event when back in idle state.
                    new_event <= '0';
                    if (read = '1') then
                        -- mouse button states
                        left_down <= rx_data(0);
                        middle_down <= rx_data(2);
                        right_down <= rx_data(1);
                        -- sign of the movement data
                        x_sign <= rx_data(4);
                        y_sign <= rx_data(5);

                        -- overflow status of the x and y movement
                        x_overflow <= rx_data(6);
                        y_overflow <= rx_data(7);
                        
                        -- transition to state read_byte_2
                        state <= read_byte_2;
                    else
                        -- no byte received yet.
                        state <= read_byte_1;
                    end if;

                -- wait the second byte of the packet
                -- this byte contains the x movement counter.
                when read_byte_2 =>
                    if (read = '1') then
                        -- put the delta movement in x_inc
                        x_inc <= rx_data;
                        -- signal the arrival of new x movement data.
                        x_new <= '1';
                        -- go to state read_byte_3.
                        state <= read_byte_3;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        -- byte not received yet.
                        state <= read_byte_2;
                    end if;
                
                -- wait the third byte of the data, that
                -- contains the y data movement counter.
                -- negate its value, for the axis to be
                -- inverted.
                -- If mouse is in scroll mode, transition
                -- to read_byte_4, else go to mark_new_event
                when read_byte_3 =>
                    if (read = '1') then
                        -- when y movement is 0, then ignore
                        if (rx_data /= "00000000") then
                            y_inc <= rx_data;
                            y_new <= '1';           
                        end if;
                        -- if the mouse has a wheel then transition
                        -- to read_byte_4, else go to mark_new_event
                        if (haswheel = '1') then
                            state <= read_byte_4;
                        else
                            state <= mark_new_event;
                        end if;
                    elsif (err = '1') then
                        state <= reset;
                    else
                            state <= read_byte_3;
                    end if;

                -- only reached when mouse is in scroll mode
                -- wait for the fourth byte to arrive
                -- fourth byte contains the z movement counter
                -- only least significant 4 bits are relevant
                -- the rest are sign extension.
                when read_byte_4 =>
                    if (read = '1') then
                        -- packet completly received,
                        -- go to mark_new_event
                        state <= mark_new_event;
                    elsif (err = '1') then
                        state <= reset;
                    else
                        state <= read_byte_4;
                    end if;

                -- set new_event high
                -- it will be reset in next state
                -- informs client new packet received and processed
                when mark_new_event =>
                    new_event <= '1';
                    state <= read_byte_1;

                -- if invalid transition occurred, reset
                when others =>
                    state <= reset;
        
            end case;
        end if;
    end process manage_fsm;


end Behavioral;
