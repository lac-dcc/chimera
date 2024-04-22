library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
library unisim;
use unisim.vcomponents.all;



entity pico_s6_top is
  Port (       
			OSC_FPGA: in std_logic;
			LED_OUT: out std_logic_vector(1 downto 0);
			PB_IN: in std_logic_vector(1 downto 0);
			SW_IN: in std_logic_vector(1 downto 0)
			);
			
  end pico_s6_top;


architecture Behavioral of pico_s6_top is
-- Declaration of the KCPSM6 component including default values for generics.
  component kcpsm6 
    generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";
                    interrupt_vector : std_logic_vector(11 downto 0) := X"3FF";
             scratch_pad_memory_size : integer := 64);
    port (                   address : out std_logic_vector(11 downto 0);
                         instruction : in std_logic_vector(17 downto 0);
                         bram_enable : out std_logic;
                             in_port : in std_logic_vector(7 downto 0);
                            out_port : out std_logic_vector(7 downto 0);
                             port_id : out std_logic_vector(7 downto 0);
                        write_strobe : out std_logic;
                      k_write_strobe : out std_logic;
                         read_strobe : out std_logic;
                           interrupt : in std_logic;
                       interrupt_ack : out std_logic;
                               sleep : in std_logic;
                               reset : in std_logic;
                                 clk : in std_logic);
  end component;
-- Declaration of the default Program Memory recommended for development.
--
-- The name of this component should match the name of your PSM file.
  --component pb_test_program         
	component pico_io_rom 
    generic(             C_FAMILY : string := "S6"; 
                C_RAM_SIZE_KWORDS : integer := 1;
             C_JTAG_LOADER_ENABLE : integer := 0);
    Port (      address : in std_logic_vector(11 downto 0);
            instruction : out std_logic_vector(17 downto 0);
                 enable : in std_logic;                    
                    clk : in std_logic);
  end component;
-------------------------------------------------------------------------------------------
-- Signals
-------------------------------------------------------------------------------------------
-- Signals for connection of KCPSM6 and Program Memory.

signal         address : std_logic_vector(11 downto 0);
signal     instruction : std_logic_vector(17 downto 0);
signal     bram_enable : std_logic;
signal         in_port : std_logic_vector(7 downto 0);
signal        out_port : std_logic_vector(7 downto 0);
signal         port_id : std_logic_vector(7 downto 0);
signal    write_strobe : std_logic;
signal  k_write_strobe : std_logic;
signal     read_strobe : std_logic;
signal       interrupt : std_logic;
signal   interrupt_ack : std_logic;
signal    kcpsm6_sleep : std_logic;
signal    kcpsm6_reset : std_logic;

--
-- Some additional signals are required if your system also needs to reset KCPSM6. 
--
signal       cpu_reset : std_logic;
--
-- When interrupt is to be used then the recommended circuit included below requires 
-- the following signal to represent the request made from your system.
--
signal     int_request : std_logic;
signal led_reg: std_logic_vector(7 downto 0);
signal clk: std_logic := '1';
signal sw, led: std_logic_vector(7 downto 0);
-------------------------------------------------------------------------------------------
-- Circuit Descriptions (used after 'begin') 
-------------------------------------------------------------------------------------------
begin
	
	clk <= OSC_FPGA;
	sw <= "0000"  & SW_IN & not(PB_IN);	--logi only has 2 sw and 2pb, using these.
	LED_OUT <= led_reg(1 downto 0) or led_reg(3 downto 2);  --pb or leds will be output onto the leds

  -----------------------------------------------------------------------------------------
  -- Instantiate KCPSM6 and connect to Program Memory
  -----------------------------------------------------------------------------------------
  --
  -- The KCPSM6 generics can be defined as required but the default values are shown below
  -- and these would be adequate for most designs.
  processor: kcpsm6
    generic map (  hwbuild => X"00", 
                  interrupt_vector => X"3FF",
                  scratch_pad_memory_size => 64)
    port map(      address => address,
               instruction => instruction,
               bram_enable => bram_enable,
                   port_id => port_id,
              write_strobe => write_strobe,
            k_write_strobe => k_write_strobe,
                  out_port => out_port,
               read_strobe => read_strobe,
                   in_port => in_port,
                 interrupt => interrupt,
             interrupt_ack => interrupt_ack,
                     sleep => kcpsm6_sleep,
                     reset => kcpsm6_reset,
                       clk => clk  
					);

  -- In many designs (especially your first) interrupt and sleep are not used.
  -- Tie these inputs Low until you need them. Tying 'interrupt' to 'interrupt_ack' 
  -- preserves both signals for future use and avoids a warning message.

  kcpsm6_sleep <= '0';
  interrupt <= interrupt_ack;
	
  -- The default Program Memory recommended for development.
  -- 
  -- The generics should be set to define the family, program size and enable the JTAG
  -- Loader. As described in the documentation the initial recommended values are.  
  --    'S6', '1' and '1' for a Spartan-6 design.
  --    'V6', '2' and '1' for a Virtex-6 design.
  --    '7S', '2' and '1' for a Artix-7, Kintex-7 or Virtex-7 design.
  -- Note that all 12-bits of the address are connected regardless of the program size
  -- specified by the generic. Within the program memory only the appropriate address bits
  -- will be used (e.g. 10 bits for 1K memory). This means it that you only need to modify 
  -- the generic when changing the size of your program.   
  --
  -- When JTAG Loader updates the contents of the program memory KCPSM6 should be reset 
  -- so that the new program executes from address zero. The Reset During Load port 'rdl' 
  -- is therefore connected to the reset input of KCPSM6.
  --


 -- program_rom: pb_test_program                    --Name to match your PSM file
	program_rom: pico_io_rom 
    generic map( C_FAMILY => "S6",   --Family 'S6', 'V6' or '7S'
                 C_RAM_SIZE_KWORDS => 1,      --Program size '1', '2' or '4'
                 C_JTAG_LOADER_ENABLE => 1)      --Include JTAG Loader when set to '1' 
    port map(      
					address => address,      
               instruction => instruction,
               enable => bram_enable,
               --rdl => kcpsm6_reset,
               clk => clk
							  
					);


  --
  -- If your design also needs to be able to reset KCPSM6 the arrangement below should be 
  -- used to 'OR' your signal with 'rdl' from the program memory.
  -- 

   kcpsm6_reset <= cpu_reset;

  -----------------------------------------------------------------------------------------
  -- Example of General Purose I/O Ports.
  -----------------------------------------------------------------------------------------
  --
  -- The following code corresponds with the circuit diagram shown on page 72 of the 
  -- KCPSM6 Guide and includes additional advice and recommendations.
  --
  --

  --
  -----------------------------------------------------------------------------------------
  -- General Purpose Input Ports. 
  -----------------------------------------------------------------------------------------

    -- =====================================================
   --  output interface
   -- =====================================================
   --output register
   process (clk)
   begin
      if (clk'event and clk='1') then
         if write_strobe='1' then
            led_reg <= out_port;
         end if;
      end if;
   end process;
   --led <= led_reg;
	-- =====================================================
   --  input interface
   -- =====================================================
   in_port <= sw;


  -- The inputs connect via a pipelined multiplexer. For optimum implementation, the input
  -- selection control of the multiplexer is limited to only those signals of 'port_id' 
  -- that are necessary. In this case, only 2-bits are required to identify each of  
  -- four input ports to be read by KCPSM6.
  --
  -- Note that 'read_strobe' only needs to be used when whatever supplying information to
  -- KPPSM6 needs to know when that information has been read. For example, when reading 
  -- a FIFO a read signal would need to be generated when that port is read such that the 
  -- FIFO would know to present the next oldest information.
  --

--  input_ports: process(clk)
--  begin
--    if clk'event and clk = '1' then
--
--      case port_id(1 downto 0) is
--
--        -- Read input_port_a at port address 00 hex
--        when "00" =>    in_port <= input_port_a;
--
--        -- Read input_port_b at port address 01 hex
--        when "01" =>    in_port <= input_port_b;
--
--        -- Read input_port_c at port address 02 hex
--        when "10" =>    in_port <= input_port_c;
--
--        -- Read input_port_d at port address 03 hex
--        when "11" =>    in_port <= input_port_d;
--
--        -- To ensure minimum logic implementation when defining a multiplexer always
--        -- use don't care for any of the unused cases (although there are none in this 
--        -- example).
--
--        when others =>    in_port <= "XXXXXXXX";  
--
--      end case;
--
--    end if;
--
--  end process input_ports;


  --
  -----------------------------------------------------------------------------------------
  -- General Purpose Output Ports 
  -----------------------------------------------------------------------------------------
  --
  --
  -- Output ports must capture the value presented on the 'out_port' based on the value of 
  -- 'port_id' when 'write_strobe' is High.
  --
  -- For an optimum implementation the allocation of output ports should be made in a way 
  -- that means that the decoding of 'port_id' is minimised. Whilst there is nothing 
  -- logically wrong with decoding all 8-bits of 'port_id' it does result in a function 
  -- that can not fit into a single 6-input look up table (LUT6) and requires all signals 
  -- to be routed which impacts size, performance and power consumption of your design.
  -- So unless you really have a lot of output ports it is best practice to use 'one-hot'
  -- allocation of addresses as used below or to limit the number of 'port_id' bits to 
  -- be decoded to the number required to cover the ports.
  -- 
  -- Code examples in which the port address is 04 hex. 
  --
  -- Best practice in which one-hot allocation only requires a single bit to be tested.
  -- Supports up to 8 output ports with each allocated a different bit of 'port_id'.
  --
  --   if port_id(2) = '1' then output_port_x <= out_port;  
  --
  --
  -- Limited decode in which 5-bits of 'port_id' are used to identify up to 32 ports and 
  -- the decode logic can still fit within a LUT6 (the 'write_strobe' requiring the 6th 
  -- input to complete the decode).
  -- 
  --   if port_id(4 downto 0) = '00100' then output_port_x <= out_port;
  -- 
  --
  -- The 'generic' code may be the easiest to write with the minimum of thought but will 
  -- result in two LUT6 being used to implement each decoder. This will also impact
  -- performance and power. This is not generally a problem and hence it is reasonable to 
  -- consider this as over attention to detail but good design practice will often bring 
  -- rewards in the long term. When a large design struggles to fit into a given device 
  -- and/or meet timing closure then it is often the result of many small details rather 
  -- that one big cause. PicoBlaze is extremely efficient so it would be a shame to 
  -- spoil that efficiency with unnecessarily large and slow peripheral logic.
  --
  --   if port_id = X"04" then output_port_x <= out_port;  
  --

--  output_ports: process(clk)
--  begin
--
--    if clk'event and clk = '1' then
--
--      -- 'write_strobe' is used to qualify all writes to general output ports.
--      if write_strobe = '1' then
--
--        -- Write to output_port_w at port address 01 hex
--        if port_id(0) = '1' then
--          output_port_w <= out_port;
--        end if;
--
--        -- Write to output_port_x at port address 02 hex
--        if port_id(1) = '1' then
--          output_port_x <= out_port;
--        end if;
--
--        -- Write to output_port_y at port address 04 hex
--        if port_id(2) = '1' then
--          output_port_y <= out_port;
--        end if;
--
--        -- Write to output_port_z at port address 08 hex
--        if port_id(3) = '1' then
--          output_port_z <= out_port;
--        end if;
--
--      end if;
--
--    end if; 
--
--  end process output_ports;

  --
  -----------------------------------------------------------------------------------------
  -- Constant-Optimised Output Ports 
  -----------------------------------------------------------------------------------------
  --
  --
  -- Implementation of the Constant-Optimised Output Ports should follow the same basic 
  -- concepts as General Output Ports but remember that only the lower 4-bits of 'port_id'
  -- are used and that 'k_write_strobe' is used as the qualifier.
  --

--  constant_output_ports: process(clk)
--  begin
--
--    if clk'event and clk = '1' then
--
--      -- 'k_write_strobe' is used to qualify all writes to constant output ports.
--      if k_write_strobe = '1' then
--
--        -- Write to output_port_k at port address 01 hex
--        if port_id(0) = '1' then
--          output_port_k <= out_port;
--        end if;
--
--        -- Write to output_port_c at port address 02 hex
--        if port_id(1) = '1' then
--          output_port_c <= out_port;
--        end if;
--
--      end if;
--
--    end if; 
--
--  end process constant_output_ports;





  --
  -----------------------------------------------------------------------------------------
  -- Recommended 'closed loop' interrupt interface (when required).
  -----------------------------------------------------------------------------------------
  --
  -- Interrupt becomes active when 'int_request' is observed and then remains active until 
  -- acknowledged by KCPSM6. Please see description and waveforms in documentation.
  --

--  interrupt_control: process(clk)
--  begin
--    if clk'event and clk='1' then
--      if interrupt_ack = '1' then
--         interrupt <= '0';
--        else
--         if int_request = '1' then
--          interrupt <= '1';
--         else
--          interrupt <= interrupt;
--        end if;
--      end if;
--    end if; 
--  end process interrupt_control;

  --
  -----------------------------------------------------------------------------------------

end Behavioral;
-------------------------------------------------------------------------------------------
--
-- END OF FILE kcpsm6_design_template.vhd
--
-------------------------------------------------------------------------------------------

