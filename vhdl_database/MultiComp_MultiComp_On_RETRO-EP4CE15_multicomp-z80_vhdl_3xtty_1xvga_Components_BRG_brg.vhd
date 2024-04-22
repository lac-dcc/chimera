-- Baudrate Generator  - Max Scane August 2015
--
-- This component will generate any standard baud rate based on
-- an auto reload decrementing counter.  At the end of the count
-- a signal is toggled and the counter is reloaded.  This gives a
-- square wave output.  The starting count controls the frequency
-- of the output.  Each count cycle produces half of signal, two count
-- cycles are required for a full cycles.
-- Note: Baud rate is x16 as required for UART
--

library ieee;
        use ieee.std_logic_1164.all;
        use ieee.numeric_std.all;
        use ieee.std_logic_unsigned.all;

entity BRG is
        port (
                clk     : in  std_logic;        -- assume 50 MHz input clock
                n_wr    : in  std_logic;
                n_rd    : in  std_logic;
                n_cs    : in  std_logic;
                n_reset : in  std_logic;
                dataIn  : in  std_logic_vector(7 downto 0);
                dataOut : out std_logic_vector(7 downto 0);

                baud_clk: buffer std_logic
   );
end BRG;


architecture rtl of BRG is

        -- reload values for the various baud rates         old values:     new values:
        constant B1200    : std_logic_vector(15 downto 0)   := x"0515";  -- := x"028A";
        constant B2400    : std_logic_vector(15 downto 0)   := x"028A";  -- := x"0144";
        constant B4800    : std_logic_vector(15 downto 0)   := x"0144";  -- := x"00A1";
        constant B9600    : std_logic_vector(15 downto 0)   := x"00A1";  -- := x"0050";
        constant B19200   : std_logic_vector(15 downto 0)   := x"0050";  -- := x"0027";
        constant B38400   : std_logic_vector(15 downto 0)   := x"0027";  -- := x"001A";
        constant B57600   : std_logic_vector(15 downto 0)   := x"001A";  -- := x"000C";
        constant B115200  : std_logic_vector(15 downto 0)   := x"000C";  -- := x"0006";

        signal counter    : std_logic_vector(15 downto 0);
        signal reload     : std_logic_vector(15 downto 0)   := B115200; -- powerup default
        signal BaudReg    : std_logic_vector( 2 downto 0)   := "111";

begin

-- This is the main countdown process
process(clk,n_reset,counter)
begin

        if rising_edge(clk) then

           if (n_reset = '0') then           -- Handle reset condition
               counter <= x"0000";           -- set default speed
               baud_clk <='0';               -- reset clock signal

           elsif counter = x"0000" then      -- counter has decremented to 0  (or reset)
               baud_clk <= not baud_clk;     --toggle output signal
               counter <= reload;            -- and reload counter

           else counter <= counter -1;       -- otherwise decrement the counter
           end if;
        end if;

end process;




process(clk,n_cs,n_wr,dataIn)  -- Baud rate selection register
begin
        if rising_edge(clk) then

           if (n_reset = '0') then
              BaudReg <= "111";
              reload <= B115200;

           elsif (n_cs = '0' and n_wr = '0') then
              BaudReg <= dataIn(2 downto 0);

              if    (BaudReg = "000") then reload <= B1200;
              elsif (BaudReg = "001") then reload <= B2400;
              elsif (BaudReg = "010") then reload <= B4800;
              elsif (BaudReg = "011") then reload <= B9600;
              elsif (BaudReg = "100") then reload <= B19200;
              elsif (BaudReg = "101") then reload <= B38400;
              elsif (BaudReg = "110") then reload <= B57600;
              else  reload <= B115200;
              end if;

           end if;
        end if;
end process;


process(clk,n_cs,n_rd)  -- Baud rate selection register read-back
begin
      if rising_edge(clk) then

         if (n_cs = '0' and n_rd = '0') then

            if    reload = B1200 then dataOut   <= "00000000";
            elsif reload = B2400 then dataOut   <= "00000001";
            elsif reload = B4800 then dataOut   <= "00000010";
            elsif reload = B9600 then dataOut   <= "00000011";
            elsif reload = B19200 then dataOut  <= "00000100";
            elsif reload = B38400 then dataOut  <= "00000101";
            elsif reload = B57600 then dataOut  <= "00000110";
            elsif reload = B115200 then dataOut <= "00000111";
            end if;

         end if;
      end if;
end process;



end rtl;
