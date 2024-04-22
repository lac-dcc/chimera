------------------------------------------------------------------
-- This is the top-level of my simple "direct-to-VHDL" translation
-- of a Mandelbrot fractal computing engine.
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- The top-level needs to hook up with ZestSC1 connections:
entity Example3 is
    port (
        USB_StreamCLK : in std_logic;
        USB_StreamFIFOADDR : out std_logic_vector(1 downto 0);
        USB_StreamPKTEND_n : out std_logic;
        USB_StreamFlags_n : in std_logic_vector(2 downto 0);
        USB_StreamSLOE_n : out std_logic;
        USB_StreamSLRD_n : out std_logic;
        USB_StreamSLWR_n : out std_logic;
        USB_StreamFX2Rdy : in std_logic;
        USB_StreamData : inout std_logic_vector(15 downto 0);

        USB_RegCLK : in std_logic;
        USB_RegAddr : in std_logic_vector(15 downto 0);
        USB_RegData : inout std_logic_vector(7 downto 0);
        USB_RegOE_n : in std_logic;
        USB_RegRD_n : in std_logic;
        USB_RegWR_n : in std_logic;
        USB_RegCS_n : in std_logic;

        USB_Interrupt : out std_logic;

        User_Signals : inout std_logic_vector(7 downto 0);

        S_CLK : out std_logic;
        S_A : out std_logic_vector(22 downto 0);
        S_DA : inout std_logic_vector(8 downto 0);
        S_DB : inout std_logic_vector(8 downto 0);
        S_ADV_LD_N : out std_logic;
        S_BWA_N : out std_logic;
        S_BWB_N : out std_logic;
        S_OE_N : out std_logic;
        S_WE_N : out std_logic;

        IO_CLK_N : inout std_logic;
        IO_CLK_P : inout std_logic;
        IO : inout std_logic_vector(46 downto 0)
    );
end Example3;

architecture arch of Example3 is

    -- This is the actual fractal computing engine.
    -- Details about it are in "Mandelbrot.vhd";
    component Mandelbrot
        port (
          CLK               : in std_logic;
          RST               : in std_logic;

          -- These are the input coordinates on the complex plane
          -- for which the computation will take place.
          input_x, input_y  : in std_logic_vector(31 downto 0);
          -- And this is the screen offset where the returned
          -- color result will be written into:
          input_offset      : in unsigned(31 downto 0);
          -- When this is pulsed once (0->1->0) the engine "wakes up" and
          -- starts trying to store the inputs (x,y,ofs) in the pipeline
          new_input_arrived : in std_logic;
          -- as soon as it manages to do this, it pulses this:
          new_input_ack     : out std_logic;
          -- ...and starts processing.

          --  When it concludes computing, it stores the result here...
          output_number     : out unsigned(7 downto 0);
          output_offset     : out unsigned(31 downto 0);
          -- ...so the outer circuit can take this result and plot it.
          -- To wake it up, we pulse this, to signal completion.
          new_output_made   : out std_logic
          -- No ACK is needed, because we expect someone to be
          -- constantly waiting for this new_output signal, and 
          -- immediately store the output in some single-cycle buffer.
        );
    end component;

    -- In addition to a single instance of the computing engine
    -- (for now, no pipelining - yet) we also instantiate the ZestSC1 stuff.
    component ZestSC1_Interfaces
        port (
            -----------------------------------------------
            -- The deep dark magic of the ZestSC1 design.
            --     Don't mess with any of these.
            -----------------------------------------------
            USB_StreamCLK : in std_logic;
            USB_StreamFIFOADDR : out std_logic_vector(1 downto 0);
            USB_StreamPKTEND_n : out std_logic;
            USB_StreamFlags_n : in std_logic_vector(2 downto 0);
            USB_StreamSLOE_n : out std_logic;
            USB_StreamSLRD_n : out std_logic;
            USB_StreamSLWR_n : out std_logic;
            USB_StreamFX2Rdy : in std_logic;
            USB_StreamData : inout std_logic_vector(15 downto 0);

            USB_RegCLK : in std_logic;
            USB_RegAddr : in std_logic_vector(15 downto 0);
            USB_RegData : inout std_logic_vector(7 downto 0);
            USB_RegOE_n : in std_logic;
            USB_RegRD_n : in std_logic;
            USB_RegWR_n : in std_logic;
            USB_RegCS_n : in std_logic;

            USB_Interrupt : out std_logic;

            S_CLK: out std_logic;
            S_A: out std_logic_vector(22 downto 0);
            S_ADV_LD_N: out std_logic;
            S_BWA_N: out std_logic;
            S_BWB_N: out std_logic;
            S_DA: inout std_logic_vector(8 downto 0);
            S_DB: inout std_logic_vector(8 downto 0);
            S_OE_N: out std_logic;
            S_WE_N: out std_logic;

            -------------------------------------------------------
            -- The foundations of life, the universe and everything
            -------------------------------------------------------
            User_CLK : out std_logic;
            User_RST : out std_logic;

            ----------------------
            -- Streaming interface
            ----------------------

            -- size of USB transactions
            -- (bigger ==> faster speed, worse latency)
            User_StreamBusGrantLength : in std_logic_vector(11 downto 0);

            -- from the PC to the board
            User_StreamDataIn : out std_logic_vector(15 downto 0);
            User_StreamDataInWE : out std_logic;
            User_StreamDataInBusy : in std_logic;

            -- from the board to the PC.
            -- (actually used - to send the framebuffer data back)
            User_StreamDataOut : in std_logic_vector(15 downto 0);
            User_StreamDataOutWE : in std_logic;
            User_StreamDataOutBusy : out std_logic;

            ---------------------
            -- Register interface
            ---------------------

            -- This is used to send:
            --
            --  the topx, topy (in complex plane, so fixed point coordinates)
            --  the stepx, stepy (to move for each pixel - also fixed point)
            User_RegAddr : out std_logic_vector(15 downto 0);
            User_RegDataIn : out std_logic_vector(7 downto 0);
            User_RegDataOut : in std_logic_vector(7 downto 0);
            User_RegWE : out std_logic;
            User_RegRE : out std_logic;

            -------------------------
            -- Signals and interrupts
            -------------------------

            -- This is unused. The Linux implementation of ZestSC1's library
            -- doesn't deliver the interrupt.
            User_Interrupt : in std_logic;

            -----------------
            -- SRAM interface
            -----------------

            -- This is used to store the computed colors,
            User_SRAM_A: in std_logic_vector(22 downto 0);
            User_SRAM_W: in std_logic;
            User_SRAM_R: in std_logic;
            User_SRAM_DR_VALID: out std_logic;
            User_SRAM_DW: in std_logic_vector(17 downto 0);
            User_SRAM_DR: out std_logic_vector(17 downto 0)
        );
    end component;

    signal CLK : std_logic;
    signal RST : std_logic;
    signal LEDs : std_logic_vector(7 downto 0);

    -- Register interface
    signal Addr : std_logic_vector(15 downto 0);
    signal DataIn : std_logic_vector(7 downto 0);
    signal DataOut : std_logic_vector(7 downto 0);
    signal WE : std_logic;
    signal RE : std_logic;

    -- signals connected to the FPGA's USB inputs (coming from PC)
    signal USB_DataIn : std_logic_vector(15 downto 0);
    signal USB_DataInBusy : std_logic;
    signal USB_DataInWE : std_logic;

    -- signals connected to the FPGA's USB outputs (going to PC)
    signal USB_DataOut : std_logic_vector(15 downto 0);
    signal USB_DataOutBusy : std_logic;
    signal USB_DataOutWE : std_logic := '0';

    -- SRAM interface
    signal SRAMAddr : std_logic_vector(22 downto 0);
    signal SRAMDataOut : std_logic_vector(17 downto 0);
    signal SRAMDataIn : std_logic_vector(17 downto 0);
    signal SRAMWE : std_logic;
    signal SRAMRE : std_logic;
    signal SRAMValid : std_logic;

    -- Interrupt signal
    signal Interrupt : std_logic;

    -- The State Machine (TM)
    type state_type_main is (
        receiving_input,         -- waiting for X,Y of upper left corner
        feedRows,                -- outer loop (per row)
        feedPixels,              -- inner loop (per pixel)
        waitForMandelbrotAck,    -- wait for engine to ack receipt of input
        waitForAllOutputs,       --
        waitForDMAtoPC,          -- wait for PC to initiate USB burst read
        DMAing,                  -- ...and read from memory
        DMAwaitingSRAM,
        DMAwaitingSRAM2,         -- ...read two pixels, in fact
        DMAwaitingSRAM3,         -- since our USB bus is 16-bit big
        DMAwaitingForUSB         -- and then wait for USB to say it's ready
    );
    signal state : state_type_main;

    -- Auxiliary State Machine handling async outputs from Mandelbrot engine
    type state_type_aux is (
        waiting_for_outputs,
        writing_to_memory       -- engine reported new color computed
    );
    signal state_aux : state_type_aux;

    -- When debugging what is happening, these store additional info.
    signal debug1 : std_logic_vector(31 downto 0);
    signal debug2 : std_logic_vector(31 downto 0);

    -- Flag signalling we received all inputs and should start processing.
    signal startComputing : std_logic := '0';

    -- The size of the window (in pixels) that we are computing
    constant span_x : integer := 320;
    constant span_y : integer := 240;

    -- The two loop counters - outer (Y)
    signal RowsToCompute : natural range 0 to span_y;

    -- ...and inner (X)
    signal PixelsToCompute : natural range 0 to span_x;

    -- How many pixels remaining to output?
    signal PixelsOutputRemaining : natural range 0 to span_x*span_y;

    -- When we finish computing a color, we write it in this address in SRAM.
    signal AddressInSRAMtoWriteTheNextPixelTo : unsigned(22 downto 0);

    -- Flag indicating the PC asked to read the framebuffer
    signal ReadingActive : std_logic := '0';

    -- SendingData back to PC - how many pixels are left?
    signal ReadCount : natural;

    -- Signals used to interface with Mandelbrot engine
    signal input_x, input_y     : std_logic_vector(31 downto 0);
    signal dinput_x, dinput_y   : std_logic_vector(31 downto 0);
    signal input_x_orig         : std_logic_vector(31 downto 0);
    signal input_offset         : unsigned(31 downto 0);
    signal new_input_arrived    : std_logic;
    signal new_input_ack        : std_logic;
    signal output_number        : unsigned(7 downto 0);
    signal output_offset        : unsigned(31 downto 0);
    signal output_offset_slv    : std_logic_vector(31 downto 0);
    signal new_output_made      : std_logic;

    -- Since we deliver two 8-bit pixel colors in one 16-bit USB transaction,
    -- we need a "staging" place to store the 1st value read from SRAM
    -- before we go ahead and read the 2nd.
    signal USB_DataOutStaging : std_logic_vector(7 downto 0);
begin

    -- Tie unused signals.
    User_Signals <= "ZZZZZZZZ";
    LEDs(7 downto 1) <= "1111111";
    IO_CLK_N <= 'Z';
    IO_CLK_P <= 'Z';
    Interrupt <= '0';
    IO <= (0=>LEDs(0), 1=>LEDs(1), 41=>LEDs(2), 42=>LEDs(3), 43=>LEDs(4),
           44=>LEDs(5), 45=>LEDs(6), 46=>LEDs(7), others => 'Z');

    output_offset_slv <= std_logic_vector(output_offset);

    process (RST, CLK)
    begin
        if (RST='1') then
            input_x <= X"00000000";
            input_y <= X"00000000";
            input_offset <= (others => '0');
            dinput_x <= X"00000000";
            dinput_y <= X"00000000";
            state <= receiving_input;
            debug2 <= (others => '0');
            ReadingActive <= '0';
            USB_DataOutWE <= '0';
            USB_DataOut <= (others => '0');
            USB_DataInBusy <= '0';

            SRAMDataOut <= (others => '0');
            state_aux <= waiting_for_outputs;
            debug1 <= (others => '0');

        elsif rising_edge(CLK) then

            -- I am handling all "pulses" in a common way - the main clock
            -- just always sets them low, but if further below they
            -- are set high, due to the way processes work in VHDL,
            -- they will be set high for just once in the next cycle.
            --
            -- This allows me to not need to introduce states to "set high",
            -- "wait one cycle", "set low", etc.

            SRAMRE <= '0';
            USB_DataInBusy <= '0';
            startComputing <= '0';
            new_input_arrived <= '0';
            ReadingActive <= '0';
            USB_DataOutWE <= '0';

            -- Is the PC calling ZestSC1WriteRegister?
            if WE = '1' then

                -- It is! What address is it writing in?
                case Addr is

                    -- Top-left X coordinate (in fixed-point)
                    when X"2060" => input_x(7 downto 0) <= DataIn;
                    when X"2061" => input_x(15 downto 8) <= DataIn;
                    when X"2062" => input_x(23 downto 16) <= DataIn;
                    when X"2063" =>
                        input_x(31 downto 24) <= DataIn;
                        debug2 <= X"11111111";

                    -- Top-left Y coordinate (in fixed-point)
                    when X"2064" => input_y(7 downto 0) <= DataIn;
                    when X"2065" => input_y(15 downto 8) <= DataIn;
                    when X"2066" => input_y(23 downto 16) <= DataIn;
                    when X"2067" =>
                        input_y(31 downto 24) <= DataIn;
                        debug2 <= X"22222222";

                    -- Step in X-axis (in fixed-point)
                    when X"2068" => dinput_x(7 downto 0) <= DataIn;
                    when X"2069" => dinput_x(15 downto 8) <= DataIn;
                    when X"206A" => dinput_x(23 downto 16) <= DataIn;
                    when X"206B" =>
                        dinput_x(31 downto 24) <= DataIn;
                        debug2 <= X"33333333";

                    -- Step in Y-axis (in fixed-point)
                    when X"206C" => dinput_y(7 downto 0) <= DataIn;
                    when X"206D" => dinput_y(15 downto 8) <= DataIn;
                    when X"206E" => dinput_y(23 downto 16) <= DataIn;
                    when X"206F" =>
                        dinput_y(31 downto 24) <= DataIn;
                        debug2 <= X"44444444";
                        PixelsOutputRemaining <= span_x * span_y;
                        RowsToCompute <= span_y;
                        AddressInSRAMtoWriteTheNextPixelTo <= (others => '0');
                        startComputing <= '1';

                    when X"2080" => ReadingActive <= '1';
                                    ReadCount <= span_x*span_y;

                    when others =>
                end case;

            end if; -- WE='1'

            case state is
                when receiving_input =>
                    if startComputing = '1' then
                        -- we received all inputs.
                        -- Before starting, maintain a copy of the left X
                        -- since we need to revert back to it
                        -- everytime we start work on a new scanline.
                        input_x_orig <= input_x;
                        input_offset <= (others => '0');
                        state <= feedRows;
                    end if;

                when feedRows =>
                    -- Did we finish all rows?
                    if RowsToCompute /= 0 then
                        -- Nope.
                        RowsToCompute <= RowsToCompute - 1;
                        -- Keep a running counter (so the PC can progress bar)
                        debug2 <= std_logic_vector(
                            to_unsigned(RowsToCompute, debug2'length));
                        -- We will compute span_x pixels now.
                        PixelsToCompute <= span_x;
                        state <= feedPixels;
                    else
                        -- We're done! Go wait for the PC to read this.
                        state <= waitForAllOutputs;
                    end if;

                when feedPixels =>
                    -- Did we finish all pixels?
                    if PixelsToCompute /= 0 then
                        -- Nope.
                        PixelsToCompute <= PixelsToCompute - 1;
                        -- Signal the tiny engine to go compute
                        -- from the current values of (input_x,input_y)
                        new_input_arrived <= '1';
                        state <= waitForMandelbrotAck;
                    else
                        -- Yes! Time to move to next scanline.
                        -- Revert to the leftmost X co-ordinate...
                        input_x <= input_x_orig;
                        -- ...and go down by one step.
                        input_y <= std_logic_vector(
                            unsigned(input_y) - unsigned(dinput_y));
                        -- Now loop again!
                        state <= feedRows;
                    end if;

                when waitForMandelbrotAck =>
                    -- as long as we have not received an ACK,
                    -- this signal must stay high:
                    new_input_arrived <= '1';
                    if new_input_ack = '0' then
                        state <= waitForMandelbrotAck;
                    else
                        -- stop saying this.
                        new_input_arrived <= '0';
                        -- The Mandelbrot engine got the new input coordinates
                        -- so it is time to feed it the next pixel coordinates
                        state <= feedPixels;
                        input_offset <= input_offset+1;
                        -- Go right one step, to prepare for next pixel
                        input_x <= std_logic_vector(
                            unsigned(input_x) + unsigned(dinput_x));
                    end if;

                when waitForAllOutputs =>
                    -- wait for the other state machine (see below) to report
                    -- that all inputs have been processed (and outputs written
                    -- to SRAM)
                    if PixelsOutputRemaining /= 0 then
                        state <= waitForAllOutputs;
                    else
                        state <= waitForDMAtoPC;
                    end if;

                when waitForDMAtoPC =>
                    debug2 <= X"55555555";
                    -- Did the PC ask for the new framebuffer data?
                    if ReadingActive = '1' then
                        -- It did - time to DMA.
                        state <= DMAing;
                        SRAMAddr <= (others => '0');
                    else
                        state <= waitForDMAtoPC;
                    end if;

                when DMAing =>
                    -- Are we done?
                    if ReadCount /= 0 then
                        -- No - read one more pixel color
                        SRAMRE <= '1';
                        state <= DMAwaitingSRAM;
                    else
                        state <= receiving_input;
                    end if;

                when DMAwaitingSRAM =>
                    if SRAMValid = '1' then
                        -- Save the color - we need to read one more,
                        -- since the USB bus is 16 bit.
                        USB_DataOutStaging <= SRAMDataIn(7 downto 0);
                        ReadCount <= ReadCount - 1;
                        SRAMAddr <= std_logic_vector(unsigned(SRAMAddr) + 1);
                        state <= DMAwaitingSRAM2;
                    else
                        state <= DMAwaitingSRAM;
                    end if;

                when DMAwaitingSRAM2 =>
                    SRAMRE <= '1';
                    state <= DMAwaitingSRAM3;

                when DMAwaitingSRAM3 =>
                    if SRAMValid = '1' then
                        -- We've read both pixels - write the 16-bit value.
                        -- (8 bits for each pixel)
                        USB_DataOut <=
                            SRAMDataIn(7 downto 0) & USB_DataOutStaging;
                        ReadCount <= ReadCount - 1;
                        -- Move along, to prepare for next two pixels
                        SRAMAddr <= std_logic_vector(unsigned(SRAMAddr) + 1);
                        -- ...and go wait for USB bus to say it is ready.
                        state <= DMAwaitingForUSB;
                    else
                        state <= DMAwaitingSRAM2;
                    end if;

                when DMAwaitingForUSB =>
                    -- Wait until we can send the two pixel data over USB
                    if USB_DataOutBusy = '1' then
                        state <= DMAwaitingForUSB;
                    else
                        USB_DataOutWE <= '1';
                        state <= DMAing;
                    end if;

            end case; -- case state is ...

            SRAMWE <= '0';

            case state_aux is
                -- This is the state machine that collects the Mandelbrot
                -- outputs from the pipeline and writes them to SRAM.
                -- This is where I, erm, took a shortcut.
                --
                -- You see, the pipeline ideally emits new pixel values
                -- per cycle. I did not want to "stall" the pipeline with
                -- a handshake pulse - they way I do for the input signals.
                -- Why? Because I made a bet - which paid out - that my
                -- SRAM could tolerate me doing this:
                --
                --     new_output_color set into SRAMDataOut
                --     new_output_offset set into SRAMAddr
                --     wait one cycle
                --     SRAMWE set to 1
                --     *and within the same cycle, if new pixel made*
                --     new_output_color set into SRAMDataOut
                --     new_output_offset set into SRAMAddr
                --
                -- ..that is, I "pipeline" the outputs into my SRAM,
                -- keeping the WE high for as long as I have data.

                when waiting_for_outputs =>
                    -- Unnecessary, but makes the code clearer.
                    SRAMWE <= '0';
                    -- So: check if the engine reports a new output
                    if new_output_made = '1' then
                        -- It did! One less pixel to wait for...
                        PixelsOutputRemaining <= PixelsOutputRemaining - 1;
                        -- Keep a running counter (so the PC can progress bar)
                        debug1 <= std_logic_vector(
                            to_unsigned(PixelsOutputRemaining, debug1'length));
                        -- Prepare to write the new pixel color to SRAM:
                        SRAMDataOut <=
                            "0000000000" & std_logic_vector(output_number);
                        -- Setup target address in SRAM
                        SRAMAddr <= output_offset_slv(22 downto 0);
                        -- But you can't write yet - wait for next cycle
                        -- till address and databus stabilize.
                        state_aux <= writing_to_memory;
                    else
                        state_aux <= waiting_for_outputs;
                    end if;

                when writing_to_memory =>
                    -- we've already setup address and data bus, 
                    -- and they have stabilized by now. Write pulse!
                    SRAMWE <= '1';
                    -- Normally, return to waiting_for_outputs... 
                    state_aux <= waiting_for_outputs;
                    -- but if there's new data already generated
                    -- (which is possible, since my pipeline can emit one new pixel
                    --  per cycle), do exactly the same thing we did before,
                    -- and stay in this state!
                    if new_output_made = '1' then
                        PixelsOutputRemaining <= PixelsOutputRemaining - 1;
                        debug1 <= std_logic_vector(
                            to_unsigned(PixelsOutputRemaining, debug1'length));
                        SRAMDataOut <=
                            "0000000000" & std_logic_vector(output_number);
                        SRAMAddr <= output_offset_slv(22 downto 0);
                        state_aux <= writing_to_memory;
                    end if;

            end case; -- case state_aux is...;
        end if; -- if rising_edge(CLK) ...
    end process;

    -- Provide read-access to the two debugging information "carriers".
    process (Addr, debug1, debug2)
    begin
        case Addr is
            when X"2000" => DataOut <= debug1(7 downto 0);
            when X"2001" => DataOut <= debug1(15 downto 8);
            when X"2002" => DataOut <= debug1(23 downto 16);
            when X"2003" => DataOut <= debug1(31 downto 24);

            when X"2004" => DataOut <= debug2(7 downto 0);
            when X"2005" => DataOut <= debug2(15 downto 8);
            when X"2006" => DataOut <= debug2(23 downto 16);
            when X"2007" => DataOut <= debug2(31 downto 24);

            when others => DataOut <= X"AA";
        end case;
    end process;

    -- Instantiate components

    FractalEngine : Mandelbrot
        port map (
            CLK => CLK,
            RST => RST,
            input_x => input_x,
            input_y => input_y,
            input_offset => input_offset,
            new_input_arrived => new_input_arrived,
            new_input_ack => new_input_ack,
            output_number => output_number,
            output_offset => output_offset,
            new_output_made => new_output_made
        );

    Interfaces : ZestSC1_Interfaces
        port map (
            -- The deep dark magic of the ZestSC1 design.
            -- Don't mess with any of these.

            USB_StreamCLK => USB_StreamCLK,
            USB_StreamFIFOADDR => USB_StreamFIFOADDR,
            USB_StreamPKTEND_n => USB_StreamPKTEND_n,
            USB_StreamFlags_n => USB_StreamFlags_n,
            USB_StreamSLOE_n => USB_StreamSLOE_n,
            USB_StreamSLRD_n => USB_StreamSLRD_n,
            USB_StreamSLWR_n => USB_StreamSLWR_n,
            USB_StreamData => USB_StreamData,
            USB_StreamFX2Rdy => USB_StreamFX2Rdy,

            USB_RegCLK => USB_RegCLK,
            USB_RegAddr => USB_RegAddr,
            USB_RegData => USB_RegData,
            USB_RegOE_n => USB_RegOE_n,
            USB_RegRD_n => USB_RegRD_n,
            USB_RegWR_n => USB_RegWR_n,
            USB_RegCS_n => USB_RegCS_n,

            USB_Interrupt => USB_Interrupt,

            S_CLK => S_CLK,
            S_A => S_A,
            S_ADV_LD_N => S_ADV_LD_N,
            S_BWA_N => S_BWA_N,
            S_BWB_N => S_BWB_N,
            S_DA => S_DA,
            S_DB => S_DB,
            S_OE_N => S_OE_N,
            S_WE_N => S_WE_N,

            User_CLK => CLK,
            User_RST => RST,

            -- We don't care much about speed, do we?
            -- This should suffice anyway.
            User_StreamBusGrantLength => X"100",

            -- Unused - the streaming interface sending data from the PC
            User_StreamDataIn => USB_DataIn,
            User_StreamDataInWE => USB_DataInWE,
            User_StreamDataInBusy => USB_DataInBusy,

            -- The Streaming interface back to the PC (used to send frame)
            User_StreamDataOut => USB_DataOut,
            User_StreamDataOutWE => USB_DataOutWE,
            User_StreamDataOutBusy => USB_DataOutBusy,

            -- Register interface
            User_RegAddr => Addr,
            User_RegDataIn => DataIn,
            User_RegDataOut => DataOut,
            User_RegWE => WE,
            User_RegRE => RE,

            -- Interrupts
            User_Interrupt => Interrupt,

            -- SRAM interface
            User_SRAM_A => SRAMAddr,
            User_SRAM_W => SRAMWE,
            User_SRAM_R => SRAMRE,
            User_SRAM_DR_VALID => SRAMValid,
            User_SRAM_DW => SRAMDataOut,
            User_SRAM_DR => SRAMDataIn
        );

end arch;
