------------------------------------------------------------------
-- This is my simple "direct-to-VHDL" translation
-- of a Mandelbrot fractal computing engine.
------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.fixed_pkg.all;
use work.custom_fixed_point_types.all;
use work.pipeline_types.all;

use std.textio.all;
use work.test_data.all;

entity Mandelbrot is
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
end Mandelbrot;


architecture arch of Mandelbrot is

  -- Quick reminder, the Mandelbrot algorithm is this:
  --
  --   loop
  --     X_new = X_old^2 - Y_old^2 + Xc
  --     Y_new = 2*X_old*Y_old + Yc
  --     color = color + 1
  --     exit when X_old^2 + Y_old^2 > 4.0   [1]
  --
  -- We now build a pipeline of 'depth' thingies
  -- (the thingies are declared below :-)
  -- All of them "rotate" around in the pipeline,
  -- shifted on each cycle to the right
  -- (1->2, 2-3, ... depth->1)
  --
  --  +-----------------------+
  --  | The pipelined signals |
  --  +-----------------------+
  --
  -- Is this slot "occupied"?
  -- i.e. have we placed some input value inside it,
  -- that the pipeline is currently processing?
  signal is_used_slot : std_logic_vector(1 to depth) := (others => '0');

  -- The Xc and Yc constants - i.e. the original inputs given
  -- at the entry point of the pipeline.
  signal Xc_pipe_reg : coord_array_type(1 to depth) := (others => (others => '0'));
  signal Yc_pipe_reg : coord_array_type(1 to depth) := (others => (others => '0'));

  -- The current X (i.e both X_old and X_new in the algorithm above)
  signal X_pipe_reg : coord_array_type(1 to depth) := (others => (others => '0'));
  -- The current Y (i.e both Y_old and Y_new in the algorithm above)
  signal Y_pipe_reg : coord_array_type(1 to depth) := (others => (others => '0'));

  -- In a pipelined world, as soon as an output is generated
  -- (i.e. as soon as we reach the 'exit' [1] above) we need
  -- to not only emit the color computed; but also which input
  -- it corresponds to!
  --
  -- To that end, upon entry of Xc and Yc, we also store the
  -- "target offset" in our screen memory.
  signal offst_pipe_reg : offst_array_type(1 to depth) := (others => (others => '0'));

  -- The color value incremented in each iteration of the Mandelbrot loop
  signal iter_pipe_reg  : iterations_array(1 to depth) := (others => (others => '0'));

  -- The color will be incremented by this much "delta".
  -- This will normaly be '1' - until it becomes '0' when we
  -- reach the exit condition (so the color stays stable
  -- until we emit it out)
  signal iter_pipe_delta : iterations_array(1 to depth) := (others => (others => '0'));

  -- The X,Y coordinates in the first slot of the pipeline.
  -- When we get a new input and the first slot would be
  -- empty in the next cycle (i.e. the last slot is currently
  -- empty) then these two get the Xc, Yc that were just input.
  --
  -- Otherwise, they get the last slot values
  -- (that wrap-around into them).
  signal X_reg : custom_fixed_point_type;
  signal Y_reg : custom_fixed_point_type;

  -- The x^2, y^2 and x*y (and 2*x*y eventually) signals
  signal XX_reg : custom_fixed_point_type;
  signal YY_reg : custom_fixed_point_type;
  signal XY_reg : custom_fixed_point_type;

  -- The X^2+y^2 used to detect it's time to exit
  signal XXpYY_reg : custom_fixed_point_type;

  -- The X^2-Y^2 used in computing X_new
  signal XXmYY_reg : custom_fixed_point_type;
  -- The 2*X*Y used in computing Y_new
  signal XYpXY_reg : custom_fixed_point_type;

  -- Did we overflow in the previous phase?
  -- That is, did the XXpYY_reg of the next slot
  -- became larger than 4.0 ?
  signal overflow  : std_logic := '0';

  -- When you need to set an out signal, but also read it somewhere else,
  -- GHDL will be fine with it - but synthesizeable VHDL won't :-)
  -- You therefore define an internal signal (that you can do this on)
  -- and connect it to the output.
  signal new_input_ack_internal : std_logic;

  ---------------------------------------------------------
  -- Debugging what happens at each cycle with all these
  -- signals was very hard. GHDL helped me immensely,
  -- by allowing me to use this debugging helper.
  ---------------------------------------------------------
  procedure debug_log(msg: string) is 
    variable l : line;
  begin
    writeline(OUTPUT, l);

    write(l, msg);
    writeline(OUTPUT, l);

    write(l, string'("new_input_arrived:"));
    write(l, new_input_arrived);
    writeline(OUTPUT, l);

    write(l, string'("new_input_ack:"));
    write(l, new_input_ack);
    writeline(OUTPUT, l);

    write(l, string'("overflow:"));
    write(l, overflow);
    writeline(OUTPUT, l);

    write(l, string'("is_used_slot:"));
    for i in is_used_slot'range loop
      write(l, is_used_slot(i));
      write(l, string'(","));
    end loop;
    writeline(OUTPUT, l);

    write(l, string'("Xc_pipe_reg:"));
    writeline(OUTPUT, l);
    for i in Xc_pipe_reg'range loop
      write(l, to_hex(to_slv(Xc_pipe_reg(i))));
      write(l, string'(","));
    end loop;
    writeline(OUTPUT, l);

    write(l, string'("offst_pipe_reg:"));
    writeline(OUTPUT, l);
    for i in offst_pipe_reg'range loop
      write(l, to_hex(offst_pipe_reg(i)));
      write(l, string'(","));
    end loop;
    writeline(OUTPUT, l);

    write(l, string'("iter_pipe_reg:   "));
    for i in iter_pipe_reg'range loop
      write(l, to_hex(iter_pipe_reg(i)));
      write(l, string'(","));
    end loop;
    writeline(OUTPUT, l);

    write(l, string'("iter_pipe_delta: "));
    for i in iter_pipe_delta'range loop
      write(l, to_hex(iter_pipe_delta(i)));
      write(l, string'(","));
    end loop;
    writeline(OUTPUT, l);

    writeline(OUTPUT, l);
  end procedure;

begin

  -- See above:
  -- "You therefore define an internal signal...and connect it to the output"
  -- This is exactly what we do here:
  new_input_ack <= new_input_ack_internal;

-------------------------------------------------------------------------------
-- STAGE 0 (INPUT)
-------------------------------------------------------------------------------

  -------------------------------------------------------------
  -- register inputs and move things up the pipeline
  -------------------------------------------------------------

  process(clk, rst,
          is_used_slot, Xc_pipe_reg, Yc_pipe_reg,
          X_pipe_reg, Y_pipe_reg, offst_pipe_reg, XXmYY_reg,
          iter_pipe_reg, new_input_arrived, overflow)
  begin
    if (rst='1') then

      -- Values upon reset.
      -- Prior to writing this part, GHDL was reporting
      -- a lot of 'X' (which showed up in GTKWave in red)
      -- and in so doing, helped me realize I was using
      -- "uninitialised variables", to use an equivalent SW term :-)
      is_used_slot   <= (others => '0');
      Xc_pipe_reg    <= (others => (others => '0'));
      Yc_pipe_reg    <= (others => (others => '0'));
      X_pipe_reg     <= (others => (others => '0'));
      Y_pipe_reg     <= (others => (others => '0'));
      offst_pipe_reg <= (others => (others => '0'));
      iter_pipe_reg  <= (others => (others => '0'));
      X_reg <= (others => '0');
      Y_reg <= (others => '0');
      new_input_ack_internal <= '0';

    elsif rising_edge(clk) then
    
      -- Uncomment this to see what happens per cycle
      -- debug_log("CLOCKED");

      -- New inputs are only accepted when:
      -- - The outside world just provided them (new_input_arrived)
      -- - The first slot would be empty in the next cycle (i.e. last slot is currently empty)
      -- - And we haven't already raised an ack in the previous cycle
      if new_input_arrived = '1' and is_used_slot(depth) = '0' and new_input_ack_internal = '0' then

        new_input_ack_internal <= '1';
        is_used_slot(1) <= '1';
        Xc_pipe_reg(1) <= to_sfixed_custom(input_x);
        Yc_pipe_reg(1) <= to_sfixed_custom(input_y);
        X_pipe_reg(1) <= to_sfixed_custom(input_x);
        Y_pipe_reg(1) <= to_sfixed_custom(input_y);
        X_reg <= to_sfixed_custom(input_x);
        Y_reg <= to_sfixed_custom(input_y);
        offst_pipe_reg(1) <= input_offset;
        iter_pipe_reg(1) <= X"00";
        iter_pipe_delta(1) <= X"01";

      else

        -- No new input: we just iterate, rolling everything...
        new_input_ack_internal <= '0';
        -- ...one slot to the right: 1->2, 2-3, ... depth->1
        -- These are the depth->1 parts:
        is_used_slot(1) <= is_used_slot(depth);
        Xc_pipe_reg(1) <= Xc_pipe_reg(depth);
        Yc_pipe_reg(1) <= Yc_pipe_reg(depth);
        X_pipe_reg(1) <= X_pipe_reg(depth);
        Y_pipe_reg(1) <= Y_pipe_reg(depth);
        X_reg <= X_pipe_reg(depth);
        Y_reg <= Y_pipe_reg(depth);
        offst_pipe_reg(1) <= offst_pipe_reg(depth);
        iter_pipe_reg(1) <= iter_pipe_reg(depth);
        iter_pipe_delta(1) <= iter_pipe_delta(depth);

      end if;

      -- and these are the 1->2, 2->3 ... depth-1 -> depth) parts
      Xc_pipe_reg(2 to depth) <= Xc_pipe_reg(1 to depth-1);
      Yc_pipe_reg(2 to depth) <= Yc_pipe_reg(1 to depth-1);

      X_pipe_reg(2 to depth) <= X_pipe_reg(1 to depth-1);
      Y_pipe_reg(2 to depth) <= Y_pipe_reg(1 to depth-1);

      -- In VHDL, subsequent assignments override previous ones
      -- That is, what happens in each clock cycle is determined
      -- by the last assignment to the same target.
      --
      -- We just did a massive 2..depth assignment of X_pipe_reg
      -- and Y_pipe_reg above; but actually, in the 4th phase
      -- the "ingredients" for the final assignment of X_new
      -- and Y_new are there - the multipliers (see below)
      -- have finished their job; so we override the assignments
      -- here to set the X_new and Y_new in the 4th slot:

      -- X_new = X_old^2 - Y_old^2 + Xc
      X_pipe_reg(4) <= resize(XXmYY_reg + Xc_pipe_reg(3), X_pipe_reg(3));

      -- Y_new = 2*X_old*Y_old + Yc
      Y_pipe_reg(4) <= resize(XYpXY_reg + Yc_pipe_reg(3), Y_pipe_reg(3));

      -- More 2->depth assignments; this time, for the offsets.
      -- Note that these are never assigned beyond the input phase;
      -- they are just constantly "rolled" until they are emitted
      -- in the final step.
      offst_pipe_reg(2 to depth) <= offst_pipe_reg(1 to depth-1);

      -- The color counters.
      -- We begin with the roll: 2->3, ... depth-1 -> depth assignment
      iter_pipe_reg(2 to depth) <= iter_pipe_reg(1 to depth-1);

      -- But override the color of the last slot: it should actually
      -- be updated based on the delta (0 or 1).
      --
      -- Why are we doing this on the last slot? Well, by this time
      -- the delta has been set to 0 or 1 for sure; (see below)
      -- so it's the "safest" place to do this knowing there's
      -- no "race" :-)
      iter_pipe_reg(depth) <= iter_pipe_reg(depth-1) + iter_pipe_delta(depth-1);

      -- The color deltas are easy - just roll
      -- (1->2, 2->3, ... , depth-1 -> depth assignment)
      iter_pipe_delta(2 to depth) <= iter_pipe_delta(1 to depth-1);

      -- ...as is the "whether the slot is used or not":
      is_used_slot(2 to depth) <= is_used_slot(1 to depth-1);

      -- Now for some harder stuff: the 'overflow' is set when
      -- we have a fully computed x^2+y^2. This happens in the
      -- 4th phase (see below), which is where 'overflow' has
      -- stabilised (it was set in phase 3). We can therefore
      -- decide what to write in slot 5, based on overflow!
      --
      -- If no overflow has been detected, then the previous
      -- "mass copies into is_used_slot and iter_pipe_delta
      -- suffice; slot 5 will get the values of slot 4.
      if overflow = '1' then
        -- ...but if we just overflowed, then the slot should be
        -- marked as "free" (so that when it reaches the last slot,
        -- new input will be allowed in)
        is_used_slot(5) <= '0';

        -- In addition, no more delta! The color must stay put
        -- so that we can emit it out
        iter_pipe_delta(5) <= X"00";

        -- Might as well reset the Xc and Yc. It's not necessary
        -- (since we won't use them anymore) but it helps 
        -- debugging (the unused slots have zeroes in their Xc/Yc).
        Xc_pipe_reg(5) <= (others => '0');
        Yc_pipe_reg(5) <= (others => '0');

        debug_log("[-] Marked slot 5 as unused");
      end if;
    end if;
  end process;

  -------------------------------------------------------------
  -- Phase 1: input currently in slot 1 (and X_reg, Y_reg)
  -------------------------------------------------------------

  -- Easy: the x^2, y^2 and x*y multipliers

  process(clk, rst, X_reg)
  begin
    if (rst='1') then
       XX_reg <= (others => '0');
    elsif rising_edge(clk) then
       XX_reg <= resize(X_reg*X_reg, XX_reg);
    end if;
  end process;

  process(clk, rst, Y_reg)
  begin
    if (rst='1') then
       YY_reg <= (others => '0');
    elsif rising_edge(clk) then
       YY_reg <= resize(Y_reg*Y_reg, YY_reg);
    end if;
  end process;

  process(clk, rst, X_reg, Y_reg)
  begin
    if (rst='1') then
       XY_reg <= (others => '0');
    elsif rising_edge(clk) then
       XY_reg <= resize(X_reg*Y_reg, XY_reg);
    end if;
  end process;

  -------------------------------------------------------------
  -- Phase 2: input is in slot 2, x^2, y^2, x*y already done
  -------------------------------------------------------------

  -- Still easy: the x^2+y^2, x^2-y^2 and 2*x*y computations

  process(clk, rst, XX_reg, YY_reg, XY_reg)
    -- variable l : line;
  begin
    if (rst='1') then
      XXpYY_reg <= (others => '0'); 
      XXmYY_reg <= (others => '0');
      XYpXY_reg <= (others => '0');
    elsif rising_edge(clk) then
      -- (x^2 + y^2)
      XXpYY_reg <= resize((XX_reg + YY_reg), XXpYY_reg);
      -- (x^2 - y^2)
      XXmYY_reg <= resize(XX_reg - YY_reg, XXmYY_reg);
      -- (2xy)
      XYpXY_reg <= resize(scalb(XY_reg, 1), XYpXY_reg);

      -- Debugging the computations.
      -- if is_used_slot(2) = '1' then
      --   write(l, string'("[-] XX_reg:"));
      --   write(l, to_hex(to_slv(XX_reg)));
      --   write(l, string'(" YY_reg:"));
      --   write(l, to_hex(to_slv(YY_reg)));
      --   write(l, string'(" => XXpYY_reg:"));
      --   write(l, to_hex(to_slv(XX_reg + YY_reg)));
      --   write(l, string'(" ("));
      --   -- we know that at this phase,
      --   -- the corresponding input is at slot 2
      --   write(l, to_hex(to_slv(Xc_pipe_reg(2))));
      --   write(l, string'(")"));
      --   writeline(OUTPUT, l);
      -- end if;
    end if;
  end process;

  -------------------------------------------------------------
  -- Phase 3: input is in slot 3, all "ingredients" are done
  -------------------------------------------------------------

  -- The overflow phase: "ingredients" for the final assignment of
  -- X_new and Y_new are there (the multipliers and adders
  -- have finished their job). It's time to check the x^2+Y^2
  -- against 4.0! And since we are using fixed-point with
  -- 6 non-fractional bits, anything larger than 4.0 would 
  -- have top bits ZZZZXX with at least one of Z being a '1'!
  --            (32, 16, 8, 4, 2, 1)
  --             ^^^^^^^^^^^^
  process(clk, rst, XXpYY_reg, is_used_slot)
    variable l : line;
  begin
    if (rst='1') then
      overflow <= '0';
    elsif rising_edge(clk) then
      -- detect overflow of (x^2 + y^2) by checking top 4 bits
      overflow <= '0';
      -- We must only set the overflow signal if the 
      -- corresponding slot is NOT empty.
      -- At this phase, the corresponding input is at slot 3.
      if is_used_slot(3) = '1' then
        if  to_slv(XXpYY_reg)(31) = '1' or
            to_slv(XXpYY_reg)(30) = '1' or
            to_slv(XXpYY_reg)(29) = '1' or
            to_slv(XXpYY_reg)(28) = '1' then
          overflow <= '1';
          -- Debugging the overflows
          writeline(OUTPUT, l);
          write(l, string'("[!] Detected overflow via 4.0! "));
          write(l, string'("XXpYY_reg: "));
          write(l, to_hex(to_slv(XXpYY_reg)));
          write(l, string'(" for X:"));
          write(l, to_hex(to_slv(Xc_pipe_reg(3))));
          writeline(OUTPUT, l);
        elsif iter_pipe_reg(3) > 239 then
          overflow <= '1';
          -- Debugging the overflows
          writeline(OUTPUT, l);
          write(l, string'("[!] Detected overflow via 240! "));
          write(l, string'("XXpYY_reg: "));
          write(l, to_hex(to_slv(XXpYY_reg)));
          write(l, string'(" for X:"));
          write(l, to_hex(to_slv(Xc_pipe_reg(3))));
          writeline(OUTPUT, l);
        end if;
      end if;
    end if;
  end process;

  -------------------------------------------------------------
  -- Phase 4: 'overflow' has been assigned, input is in slot 4)
  -------------------------------------------------------------

  process(clk, rst,
          overflow, iter_pipe_reg, offst_pipe_reg, 
          XXmYY_reg, XYpXY_reg,
          Xc_pipe_reg, Yc_pipe_reg)
    variable l : line;
  begin
    if (rst='1') then
      new_output_made <= '0';
      output_offset <= (others => '0');
      output_number <= X"00";
    elsif rising_edge(clk) then
      -- In the previous phase, we've set the 'overflow' flag.
      -- By this cycle, we can check it and decide whether
      -- to emit output or not.
      if overflow = '0' then
        new_output_made <= '0';
      else
        -- Time to give our computed color to the world!
        output_number <= iter_pipe_reg(4);
        output_offset <= offst_pipe_reg(4);
        new_output_made <= '1';
        -- Debugging output color
        writeline(OUTPUT, l);
        write(l, string'("[!] Outputing pixel "));
        write(l, to_hex(iter_pipe_reg(4)));
        write(l, string'(" for offset "));
        write(l, to_hex(offst_pipe_reg(4)));
        debug_log("[!] NEW PIXEL OUT...");
        writeline(OUTPUT, l);
      end if;
    end if;
  end process;

end arch;
