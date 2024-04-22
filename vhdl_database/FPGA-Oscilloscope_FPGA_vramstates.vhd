----------------------------------------------------------------------------
--
--  Oscilloscope VRAM State Machine
--
--  This is an implementation of a VRAM State machine for a digital scope in
--  VHDL.  There are three inputs to the system, one selects the trigger
--  slope and the other two determine the relationship between the trigger
--  level and the signal level.  The only output is a trigger signal which
--  indicates a trigger event has occurred.
--
--  The file contains multiple architectures for a Moore state machine
--  implementation to demonstrate the different ways of building a state
--  machine.
--
--
--  Revision History:
--     2014/02/23 Albert Gural      Created file and updated with VRAM
--                                  state machine.
--
----------------------------------------------------------------------------


-- bring in the necessary packages
library  ieee;
use  ieee.std_logic_1164.all;


--
--  Oscilloscope VRAM entity declaration
--

entity  ScopeVRAM  is
    port (
        clk        :  in  std_logic;      -- clock input
        reset      :  in  std_logic;      -- reset to idle state (active low)
        cs         :  in  std_logic;      -- whether CPU is requesting R/W (active low)
        rw         :  in  std_logic;      -- whether CPU is requesting R or W
        srt        :  in  std_logic;      -- display requesting serial row transfer
        RAS        :  out std_logic;      -- row address select output
        CAS        :  out std_logic;      -- col address select output
        TRG        :  out std_logic;      -- trigger output (active low)
        WE         :  out std_logic;      -- write enable output (active low)
        AS         :  out std_logic_vector(1 downto 0); -- address select
                                                        -- 00 = low 9 bits
                                                        -- 01 = high 9 bits
                                                        -- 10 = row transfer
                                                        -- 11 = col transfer (0)
        ACK        :  out std_logic;      -- send acknowledge back to display driver
        BUSY       :  out std_logic       -- busy signal to CPU for read/write
    );
end  ScopeVRAM;

--
--  Oscilloscope VRAM Moore State Machine
--     State Assignment Architecture
--
--  This architecture just shows the basic state machine syntax when the state
--  assignments are made manually.  This is useful for minimizing output
--  decoding logic and avoiding glitches in the output (due to the decoding
--  logic).
--

architecture  assign_statebits  of  ScopeVRAM  is

    subtype  states  is  std_logic_vector(12 downto 0);     -- state type

    -- define the actual states as constants
    -- bits: [RAS][CAS][TRG][WE][AS<2>][ACK][BUSY]
    --       [type <000 IDLE, 010 READ, 011 WRITE, 100 REFRESH, 101 TRANSFER>]
    --       [number <00, 01, ...>]
    constant  IDLE      : states := "1111001100000";  -- idle (can accept R/W)
    constant  READ1     : states := "0111011101000";  -- read cycle
    constant  READ2     : states := "0001001101000";  -- read cycle
    constant  READ3     : states := "0001001101001";  -- read cycle
    constant  READ4     : states := "0001001001010";  -- read cycle
    constant  READ5     : states := "1111001101000";  -- read cycle
    constant  READ6     : states := "1111001101001";  -- read cycle
    constant  READ7     : states := "1111001101010";  -- read cycle
    constant  WRITE1    : states := "0111011001100";  -- write cycle
    constant  WRITE2    : states := "0000001101100";  -- write cycle
    constant  WRITE3    : states := "0000001101101";  -- write cycle
    constant  WRITE4    : states := "0000001101110";  -- write cycle
    constant  WRITE5    : states := "1110001101100";  -- write cycle
    constant  WRITE6    : states := "1111001101100";  -- write cycle
    constant  WRITE7    : states := "1111001101101";  -- write cycle
    constant  TRANSFER1 : states := "1101101110100";  -- transfer cycle
    constant  TRANSFER2 : states := "0101101110100";  -- transfer cycle
    constant  TRANSFER3 : states := "0001111110100";  -- transfer cycle
    constant  TRANSFER4 : states := "0011111110100";  -- transfer cycle
    constant  TRANSFER5 : states := "1111110110100";  -- transfer cycle
    constant  REFRESH1  : states := "0111101110000";  -- refresh cycle
    constant  REFRESH2  : states := "0111101110001";  -- refresh cycle
    constant  REFRESH3  : states := "0111101110010";  -- refresh cycle
    constant  REFRESH4  : states := "1111001110000";  -- refresh cycle
    constant  REFRESH5  : states := "1111001110001";  -- refresh cycle
    constant  REFRESH6  : states := "1111001110010";  -- refresh cycle


    signal  CurrentState  :  states;    -- current state
    signal  NextState     :  states;    -- next state

begin


    -- the output is always the high bit of the state encoding
    RAS  <= CurrentState(12);
    CAS  <= CurrentState(11);
    TRG  <= CurrentState(10);
    WE   <= CurrentState(9);
    AS   <= CurrentState(8 downto 7);
    ACK  <= CurrentState(6);
    BUSY <= CurrentState(5);

    -- compute the next state (function of current state and inputs)

    transition:  process (reset, cs, rw, srt, CurrentState)
    begin

        case  CurrentState  is          -- do the state transition/output

            when  IDLE =>               -- in idle state, do transition
                if  (cs = '0' and rw = '1')  then
                    NextState <= READ1;         -- start read cycle
                elsif  (cs = '0' and rw = '0')  then
                    NextState <= WRITE1;        -- start write cycle
                elsif  (srt = '0')  then
                    NextState <= TRANSFER1;     -- start serial row transfer
                else
                    NextState <= REFRESH1;      -- start refresh cycle
                end if;

            when  READ1 =>              -- read cycle
                NextState <= READ2;     -- go to next part of read cycle

            when  READ2 =>              -- read cycle
                NextState <= READ3;     -- go to next part of read cycle

            when  READ3 =>              -- read cycle
                NextState <= READ4;     -- go to next part of read cycle

            when  READ4 =>              -- read cycle
                NextState <= READ5;     -- go to next part of read cycle

            when  READ5 =>              -- read cycle
                NextState <= READ6;     -- go to next part of read cycle

            when  READ6 =>              -- read cycle
                NextState <= READ7;     -- go to next part of read cycle

            when  READ7 =>              -- read cycle
                NextState <= IDLE;      -- go back to idle

            when  WRITE1 =>             -- write cycle
                NextState <= WRITE2;    -- go to next part of write cycle

            when  WRITE2 =>             -- write cycle
                NextState <= WRITE3;    -- go to next part of write cycle

            when  WRITE3 =>             -- write cycle
                NextState <= WRITE4;    -- go to next part of write cycle

            when  WRITE4 =>             -- write cycle
                NextState <= WRITE5;    -- go to next part of write cycle

            when  WRITE5 =>             -- write cycle
                NextState <= WRITE6;    -- go to next part of write cycle

            when  WRITE6 =>             -- write cycle
                NextState <= WRITE7;    -- go to next part of write cycle

            when  WRITE7 =>             -- write cycle
                NextState <= IDLE;      -- go back to idle

            when  TRANSFER1 =>          -- transfer cycle
                NextState <= TRANSFER2; -- go to next part of transfer cycle

            when  TRANSFER2 =>          -- transfer cycle
                NextState <= TRANSFER3; -- go to next part of transfer cycle

            when  TRANSFER3 =>          -- transfer cycle
                NextState <= TRANSFER4; -- go to next part of transfer cycle

            when  TRANSFER4 =>          -- transfer cycle
                NextState <= TRANSFER5; -- go to next part of transfer cycle

            when  TRANSFER5 =>          -- transfer cycle
                NextState <= IDLE;      -- go back to idle

            when  REFRESH1 =>           -- refresh cycle
                NextState <= REFRESH2;  -- go to next part of refresh cycle

            when  REFRESH2 =>           -- refresh cycle
                NextState <= REFRESH3;  -- go to next part of refresh cycle

            when  REFRESH3 =>           -- refresh cycle
                NextState <= REFRESH4;  -- go to next part of refresh cycle

            when  REFRESH4 =>           -- refresh cycle
                NextState <= REFRESH5;  -- go to next part of refresh cycle

            when  REFRESH5 =>           -- refresh cycle
                NextState <= REFRESH6;  -- go to next part of refresh cycle

            when  REFRESH6 =>           -- refresh cycle
                NextState <= IDLE;      -- go back to idle

            when others =>              -- default
                NextState <= IDLE;      -- go back to idle

        end case;

        if  reset = '1'  then           -- reset overrides everything
            NextState <= IDLE;          --   go to idle on reset
        end if;

    end process transition;


    -- storage of current state (loads the next state on the clock)

    process (clk)
    begin

        if  clk = '1'  then             -- only change on rising edge of clock
            CurrentState <= NextState;  -- save the new state information
        end if;

    end process;


end  assign_statebits;
