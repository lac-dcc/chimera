--**********************************************************************************************
--  Stepper Controller Peripheral for the AVR Core
--  Version 0.1
--  Designed by Girish Pundlik and Jack Gassett.
--
--
-- License Creative Commons Attribution
-- Please give attribution to the original author and Gadget Factory (www.gadgetfactory.net)
-- This work is licensed under the Creative Commons Attribution 3.0 United States License. To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/us/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
----------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;
library work;
--  use work.zpuino_config.all;
--  use work.zpu_config.all;
--  use work.zpupkg.all;

entity papilio_stepper is
	Generic (
		timebase_g	: std_logic_vector(15 downto 0) := (others => '0');
		period_g		: std_logic_vector(15 downto 0) := (others => '0')
	);
  port (
    wb_clk_i:   in  std_logic;                     -- Wishbone clock
    wb_rst_i:   in  std_logic;                     -- Wishbone reset (synchronous)
    wb_dat_o:   out std_logic_vector(31 downto 0); -- Wishbone data output (32 bits)
    wb_dat_i:   in  std_logic_vector(31 downto 0); -- Wishbone data input  (32 bits)
    wb_adr_i:   in  std_logic_vector(26 downto 2); -- Wishbone address input  (32 bits)
    wb_we_i:    in  std_logic;                     -- Wishbone write enable signal
    wb_cyc_i:   in  std_logic;                     -- Wishbone cycle signal
    wb_stb_i:   in  std_logic;                     -- Wishbone strobe signal
    wb_ack_o:   out std_logic;                      -- Wishbone acknowledge out signal
	
	-- External connections
	st_home		: in  std_logic;
	st_dir		: out std_logic;
	st_ms2		: out std_logic;
	st_ms1		: out std_logic;
	st_rst		: out std_logic;
	st_step		: out std_logic;
	st_enable	: out std_logic;
	st_sleep	: out std_logic;
	-- IRQ
	st_irq     	: out std_logic	
  );
end entity papilio_stepper;



architecture rtl of papilio_stepper is

  
	signal prescale_o : std_logic;
	signal halfperiod_o 	: std_logic;
	signal step_o 		: std_logic;
	signal irq_o		: std_logic;

	signal Control_reg	: std_logic_vector(15 downto 0) := (others => '0');
	signal Timebase_reg	: std_logic_vector(15 downto 0) := timebase_g;
	signal Period_reg		: std_logic_vector(15 downto 0) := period_g;
	signal StepCnt_reg	: std_logic_vector(15 downto 0) := (others => '0');
	signal Steps_reg		: std_logic_vector(15 downto 0) := (others => '0'); 
	signal PrescaleCnt	: std_logic_vector(15 downto 0);
	signal HalfPeriodCnt	: std_logic_vector(15 downto 0);	

	signal ack_i:     std_logic;  -- Internal ACK signal (flip flop)

begin

  -- This example uses fully synchronous outputs.
  
	-- General Output signals
	st_dir	<= Control_reg(3);
	st_ms2	<= Control_reg(1); 
	st_ms1	<= Control_reg(0);
	st_rst	<= Control_reg(4);
	st_step	<= step_o;
	st_sleep	<= Control_reg(7);
	st_enable <= not Control_reg(8);
	st_irq <= irq_o;  

	wb_ack_o <= ack_i; -- Tie ACK output to our flip flop

	process(wb_clk_i)
	begin

	if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock

	  -- Always set output data on rising edge, even if reset is set.

	  Control_reg(14) <= st_home;
	  Control_reg(15) <= irq_o;
		wb_dat_o <= (others => 'X'); -- Return undefined by omission

	  case wb_adr_i(4 downto 2) is
		when "000" =>
		  wb_dat_o(Control_reg'RANGE) <= Control_reg;
		when "001" =>
		  wb_dat_o(Timebase_reg'RANGE) <= Timebase_reg;
		when "010" =>
		  wb_dat_o(Period_reg'RANGE) <= Period_reg;
		when "011" =>
		  wb_dat_o(StepCnt_reg'RANGE) <= StepCnt_reg;
		when "100" =>
		  wb_dat_o(Steps_reg'RANGE) <= Steps_reg;
		when others =>
	  end case;

	  ack_i <= '0'; -- Reset ACK value by default

	  if wb_rst_i='1' then
		Control_reg <= "0000000010010000";
		Timebase_reg <= timebase_g;
		Period_reg <= period_g;
		StepCnt_reg <= (others => '0');

	  else -- Not reset

		-- See if we did not acknowledged a cycle, otherwise we need to ignore
		-- the apparent request, because wishbone signals are still set

		if ack_i='0' then
		  -- Check if someone is accessing

		  if wb_cyc_i='1' and wb_stb_i='1' then

			ack_i<='1'; -- Acknowledge the read/write. Actual read data was set above.

			if wb_we_i='1' then

			  -- It's a write. See for which register based on address

			  case wb_adr_i(4 downto 2) is
				when "000" =>
				  Control_reg(8 downto 0) <= wb_dat_i(8 downto 0);  -- Set register
				when "001" =>
				  Timebase_reg <= wb_dat_i(Timebase_reg'RANGE);
				when "010" =>
				  Period_reg <= wb_dat_i(Period_reg'RANGE);
				when "011" =>
				  StepCnt_reg <= wb_dat_i(StepCnt_reg'RANGE);
				when others =>
				  null; -- Nothing to do for other addresses
			  end case;

			end if;  -- if wb_we_i='1'

		  end if; -- if wb_cyc_i='1' and wb_stb_i='1'

		end if; -- if ack_i='0'

	  end if; -- if wb_rst_i='1'

	end if; -- if rising_edge(wb_clk_i)

	end process;
	
	-- Prescaler
	Prescaler:process(wb_clk_i,wb_rst_i)
	begin
	 if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock
		if(wb_rst_i='1') then
			PrescaleCnt <= (others => '0');
		else
			if (Control_reg(8)='1') then
				if (PrescaleCnt=Timebase_reg) then
					PrescaleCnt <= "0000000000000001";
				else
					PrescaleCnt <= PrescaleCnt+1;
				end if;
			end if;
		end if; 
	 end if; -- if rising_edge(wb_clk_i)
	end process;

	-- Half period counter
	Halfperiod:process(wb_clk_i,prescale_o,wb_rst_i)
	begin
	 if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock
		if  (wb_rst_i='1') then
			HalfPeriodCnt <= (others => '0');
		elsif (PrescaleCnt="0000000000000001") then
			if (Control_reg(8)='1') then
				if (HalfPeriodCnt=('0'&Period_reg(15 downto 1))) then
					HalfPeriodCnt <= "0000000000000001";
				else
					HalfPeriodCnt <= HalfPeriodCnt+1;
				end if;
			end if; 
		end if;
	 end if; -- if rising_edge(wb_clk_i)
	end process;

	-- Step output
	Step_out:process(wb_clk_i,halfperiod_o,wb_rst_i)
	begin
	 if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock
		if (wb_rst_i='1') then
			step_o <= '1';
			Steps_reg <= (others => '0');
		elsif  (HalfPeriodCnt="0000000000000001" and PrescaleCnt="0000000000000001") then
			if (Control_reg(8)='1') then
				step_o <= not step_o;
				if (step_o = '1') then
					Steps_reg <= Steps_reg+1;
				end if;
			end if;
		end if;
	 end if; -- if rising_edge(wb_clk_i)
	end process;

	-- Stepper interrupt
	Int_out:process(wb_clk_i,wb_rst_i)
	begin
	 if rising_edge(wb_clk_i) then  -- Synchronous to the rising edge of the clock
		irq_o <= '0';
		if (wb_rst_i='1') then
			irq_o <= '0';
		else
		--elsif  (wb_clk_i='1' and wb_clk_i'event) then
				case (Control_reg(6 downto 5)) is
					when "01" =>
						--if (halfperiod_o='1') then
						if (HalfPeriodCnt="0000000000000001" and PrescaleCnt="0000000000000001") then
							irq_o <= '1';
						end if;
					when "10" =>
						if (Control_reg(14)='1') then
							irq_o <= '1';
						end if;
					when "11" =>
						if (Steps_reg = StepCnt_reg) then
							irq_o <= '1';
						end if;
					when others =>
						--irq_o <= '0';
				end case;
		end if;
	 end if; -- if rising_edge(wb_clk_i)
	end process;	

end rtl;
