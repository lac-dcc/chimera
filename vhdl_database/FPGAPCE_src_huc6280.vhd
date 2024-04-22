library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity huc6280 is
	port (
		CLK 	: in std_logic;
		RESET_N	: in std_logic;

		NMI_N	: in std_logic;
		IRQ1_N	: in std_logic;
		IRQ2_N	: in std_logic;
		
		DI		: in std_logic_vector(7 downto 0);
		DO 		: out std_logic_vector(7 downto 0);
		
		HSM		: out std_logic;
		
		A 		: out std_logic_vector(20 downto 0);
		WR_N 	: out std_logic;
		RD_N	: out std_logic;
		
		RDY		: in std_logic;
		ROM_RDY	: in std_logic;
		CLKOUT	: out std_logic;
		CLKRST	: out std_logic;
		
		CEK_N	: out std_logic; -- VCE
		CE7_N	: out std_logic; -- VDC
		CER_N	: out std_logic; -- RAM
		
		K		: in std_logic_vector(7 downto 0);
		O		: out std_logic_vector(7 downto 0);
		
		AUD_XCK		: out std_logic;
		AUD_BCLK	: out std_logic;
		AUD_DACDAT	: out std_logic;
		AUD_DACLRCK	: out std_logic;
		I2C_SDAT	: out std_logic;
		I2C_SCLK	: out std_logic
	);
end huc6280;

architecture rtl of huc6280 is

signal RESET		: std_logic;

signal CPU_ADDR_U 	: unsigned(20 downto 0);
signal CPU_DI_U 	: unsigned(7 downto 0);
signal CPU_DO_U 	: unsigned(7 downto 0);

signal CPU_A		: std_logic_vector(20 downto 0);
signal CPU_DI		: std_logic_vector(7 downto 0);
signal CPU_DO		: std_logic_vector(7 downto 0);

signal CPU_HSM		: std_logic;
signal CPU_BLK		: std_logic;

signal CPU_WE		: std_logic;
signal CPU_OE		: std_logic;

signal CPU_NMI_N	: std_logic;
signal CPU_IRQ1_N	: std_logic;
signal CPU_IRQ2_N	: std_logic;
signal CPU_TIQ_N	: std_logic;

signal D_OPCODE 	: unsigned(7 downto 0);
signal D_PC 		: unsigned(15 downto 0);
signal D_A 			: unsigned(7 downto 0);
signal D_X 			: unsigned(7 downto 0);
signal D_Y 			: unsigned(7 downto 0);
signal D_S 			: unsigned(7 downto 0);

signal CPU_RDY		: std_logic;
signal CPU_EN		: std_logic;

-- Clock dividers
signal CLKDIV_HI	: std_logic_vector(2 downto 0) := (others => '0');
signal CLKDIV_LO	: std_logic_vector(1 downto 0) := (others => '0');
signal CPU_CLKEN	: std_logic := '0';
signal TMR_CLKEN	: std_logic := '0';
signal PSG_CLKEN	: std_logic := '0';

-- Address decoding
signal ROM_SEL_N	: std_logic;
signal RAM_SEL_N	: std_logic;
signal VDC_SEL_N	: std_logic;
signal VCE_SEL_N	: std_logic;
signal PSG_SEL_N	: std_logic; -- PSG
signal TMR_SEL_N	: std_logic; -- Timer
signal IOP_SEL_N	: std_logic; -- I/O Port
signal INT_SEL_N	: std_logic; -- Interrupt controller

signal PSG_DO		: std_logic_vector(7 downto 0);
signal TMR_DO		: std_logic_vector(7 downto 0);
signal IOP_DO		: std_logic_vector(7 downto 0);
signal INT_DO		: std_logic_vector(7 downto 0);

signal PSG_WE		: std_logic;

-- Internal data buffer
signal DATA_BUF		: std_logic_vector(7 downto 0);

-- Timer
signal TMR_LATCH	: std_logic_vector(6 downto 0);
signal TMR_VALUE	: std_logic_vector(16 downto 0);
signal TMR_EN		: std_logic;
signal TMR_RELOAD	: std_logic;
signal TMR_IRQ		: std_logic;
signal TMR_IRQ_REQ	: std_logic;
signal TMR_IRQ_ACK	: std_logic;

-- Interrupt controller
signal INT_MASK		: std_logic_vector(2 downto 0);

-- Output port buffer
signal O_FF			: std_logic_vector(7 downto 0);

signal CLKOUT_FF	: std_logic;


signal DAC_CLKEN	: std_logic;
signal DAC_INIT		: std_logic;
signal DAC_INIT_CNT	: std_logic_vector(3 downto 0);
signal DAC_LDATA	: std_logic_vector(23 downto 0);
signal DAC_RDATA	: std_logic_vector(23 downto 0);
signal DAC_LATCH	: std_logic;

signal clockDone	: std_logic := '0';
signal romHCycles	: integer range 0 to 32767 := 0;
signal lateHCycles	: integer range 0 to 32767 := 0;

signal CLKRST_FF	: std_logic := '0';

begin

CPU: entity work.cpu65xx(fast)
	generic map (
		pipelineOpcode 	=> false,
		pipelineAluMux 	=> false,
		pipelineAluOut 	=> false
	)
	port map (
		clk 		=> CLK,
		enable 		=> CPU_EN,
		reset 		=> RESET,
		nmi_n 		=> CPU_NMI_N,
		irq1_n 		=> CPU_IRQ1_N,
		irq2_n 		=> CPU_IRQ2_N,
		tiq_n		=> CPU_TIQ_N,

		di 			=> CPU_DI_U,
		do 			=> CPU_DO_U,
		addr 		=> CPU_ADDR_U,
		we 			=> CPU_WE,
		oe			=> CPU_OE,
		
		hsm			=> CPU_HSM,
		blk			=> CPU_BLK,
		
		debugOpcode	=> D_OPCODE,
		debugPc		=> D_PC,
		debugA		=> D_A,
		debugX		=> D_X,
		debugY		=> D_Y,
		debugS		=> D_S
	);

RESET <= not RESET_N;

-- Unsigned / std_logic_vector conversion
CPU_A <= std_logic_vector(CPU_ADDR_U);
CPU_DO <= std_logic_vector(CPU_DO_U);
CPU_DI_U <= unsigned(CPU_DI);

-- Output wires
WR_N <= not CPU_WE;
RD_N <= not CPU_OE;
A <= CPU_A;
HSM <= CPU_HSM;
DO <= CPU_DO;
CEK_N <= VCE_SEL_N;
CE7_N <= VDC_SEL_N;
CER_N <= RAM_SEL_N;

O <= O_FF;
CLKOUT <= CLKOUT_FF;
CLKRST <= CLKRST_FF;

-- Input wires
CPU_NMI_N <= NMI_N;

-- Clock dividers
process( CLK, CPU_RDY )
begin
	if rising_edge( CLK ) then
        -- CPU_CLKEN <= '0';
		CLKRST_FF <= '0';
        TMR_CLKEN <= '0';
        PSG_CLKEN <= '0';
        CPU_EN <= '0';
        CLKDIV_HI <= CLKDIV_HI + 1;

		if RESET_N = '0' then
			romHCycles <= 0;
			lateHCycles <= 0;
			if CLKDIV_HI = "101" then
				CPU_EN <= '1';
			end if;
		end if;
		
		if CLKDIV_HI = "000" then
			CLKRST_FF <= '1';
		end if;
		
        if CLKDIV_HI = "010" or CLKDIV_HI = "101" then
            -- if CPU_HSM = '1' then
                if ROM_RDY = '0' then
                    romHCycles <= romHCycles + 1;
                else
                    romHCycles <= 0;
                    if romHCycles > 0 then
						-- ROM Read
						if romHCycles > 1 or lateHCycles > 0 then
							if clockDone = '1' then
								lateHCycles <= lateHCycles + romHCycles - 1;
							else
								lateHCycles <= lateHCycles + romHCycles;
							end if;
							CPU_EN <= '1';
							clockDone <= '1';
						else
							CPU_EN <= not clockDone;
							clockDone <= not clockDone;
						end if;
					else
						if lateHCycles > 0 and CPU_RDY = '1' then
							if clockDone = '1' then
								lateHCycles <= lateHCycles - 1;
							end if;
							CPU_EN <= '1';
							clockDone <= '1';
						else
							if CPU_RDY = '1' then
								CPU_EN <= not clockDone;
							end if;
							clockDone <= not clockDone;
						end if;
					end if;
				end if;
			-- end if;
		end if;

        if CLKDIV_HI = "101" then
            TMR_CLKEN <= '1';
            PSG_CLKEN <= '1';
            CLKDIV_HI <= "000";
            CLKDIV_LO <= CLKDIV_LO + 1;
 
            -- if CLKDIV_LO = "11" then
                -- -- CPU_CLKEN <= '1';
                -- if CPU_RDY = '1' then
                    -- CPU_EN <= '1';
                -- end if;                     
            -- end if;
        end if;
    end if;
end process;

 

-- XOUT signal is probably set that way
-- Here it will be used to drive the WE signal of the synchronous BRAM
process( CLK )
begin
    if rising_edge( CLK ) then
        -- CLKOUT_FF <= CPU_CLKEN;
        CLKOUT_FF <= CPU_EN;
    end if;
end process;


-- Address decoding
process( CPU_A )
begin	
	ROM_SEL_N <= '1';
	RAM_SEL_N <= '1';
	VDC_SEL_N <= '1';
	VCE_SEL_N <= '1';
	PSG_SEL_N <= '1';
	TMR_SEL_N <= '1';
	IOP_SEL_N <= '1';
	INT_SEL_N <= '1';
	
	-- ROM : Page $00 - $7F (0000 0000 - 0111 1111)
	if CPU_A(20) = '0' then
		ROM_SEL_N <= '0';
	end if;
	
	-- RAM : Page $F8 - $FB (1111 1000 - 1111 1011)
	if CPU_A(20 downto 15) = "111110" then
		RAM_SEL_N <= '0';
	end if;
	
	-- VDC : Page $FF $0000 - $03FF  (1111 1111 0 0000 0000 0000)
	--                               (1111 1111 0 0011 1111 1111)
	-- VCE : Page $FF $0400 - $07FF  (1111 1111 0 0100 0000 0000)
	--                               (1111 1111 0 0111 1111 1111)
	-- PSG : Page $FF $0800 - $0BFF  (1111 1111 0 1000 0000 0000)
	--                               (1111 1111 0 1011 1111 1111)
	-- TMR : Page $FF $0C00 - $0FFF  (1111 1111 0 1100 0000 0000)
	--                               (1111 1111 0 1111 1111 1111)
	-- IOP : Page $FF $1000 - $13FF  (1111 1111 1 0000 0000 0000)
	--                               (1111 1111 1 0011 1111 1111)
	-- INT : Page $FF $1400 - $17FF  (1111 1111 1 0100 0000 0000)
	--                               (1111 1111 1 0111 1111 1111)
	
	if CPU_A(20 downto 13) = x"FF" then
		case CPU_A(12 downto 10) is
		when "000" => VDC_SEL_N <= '0';
		when "001" => VCE_SEL_N <= '0';
		when "010" => PSG_SEL_N <= '0';
		when "011" => TMR_SEL_N <= '0';
		when "100" => IOP_SEL_N <= '0';
		when "101" => INT_SEL_N <= '0';
		when others => null;
		end case;
	end if;
end process;

-- On-chip hardware CPU interface
process( CLK )
begin
	if rising_edge( CLK ) then
		
		TMR_RELOAD <= '0';
		TMR_IRQ_ACK <= '0';
		
		PSG_WE <= '0';
		
		if RESET_N = '0' then
			DATA_BUF <= (others => '0');
			
			TMR_LATCH <= (others => '0');
			TMR_EN <= '0';
			
			INT_MASK <= (others => '0');
			O_FF <= (others => '0');
		else
			-- if CPU_EN = '1' and CPU_WE = '1' then
			if CLKOUT_FF = '1' and CPU_WE = '1' then
				-- CPU Write
				if PSG_SEL_N = '0' then
					DATA_BUF <= CPU_DO;
					PSG_WE <= '1';
				elsif TMR_SEL_N = '0' then
					DATA_BUF <= CPU_DO;
					if CPU_A(0) = '0' then
						-- Timer latch
						TMR_LATCH <= CPU_DO(6 downto 0);
					else
						-- Timer enable
						TMR_EN <= CPU_DO(0);
						if TMR_EN = '0' and CPU_DO(0) = '1' then
							TMR_RELOAD <= '1';
						end if;
					end if;				
				elsif IOP_SEL_N = '0' then
					DATA_BUF <= CPU_DO;
					O_FF <= CPU_DO;
				elsif INT_SEL_N = '0' then
					DATA_BUF <= CPU_DO;
					case CPU_A(1 downto 0) is
					when "10" =>
						INT_MASK <= CPU_DO(2 downto 0);
					when "11" =>
						TMR_IRQ_ACK <= '1';
					when others =>
						null;
					end case;
				end if;
			-- elsif CPU_EN = '1' and CPU_OE = '1' then
			elsif CLKOUT_FF = '1' and CPU_OE = '1' then
				-- CPU Read
				if PSG_SEL_N = '0' then
					if CPU_BLK = '1' then
						PSG_DO <= (others => '0');
					else
						PSG_DO <= DATA_BUF;
					end if;
				elsif TMR_SEL_N = '0' then
					if CPU_BLK = '1' then
						TMR_DO <= (others => '0');
					else
						DATA_BUF <= DATA_BUF(7) & TMR_VALUE(16 downto 10);
						TMR_DO <= DATA_BUF(7) & TMR_VALUE(16 downto 10);
					end if;
				elsif IOP_SEL_N = '0' then
					if CPU_BLK = '1' then
						IOP_DO <= (others => '0');
					else	
						IOP_DO <= K;
					end if;
				elsif INT_SEL_N = '0' then
					if CPU_BLK = '1' then
						INT_DO <= (others => '0');
					else					
						DATA_BUF <= DATA_BUF(7 downto 3) & TMR_IRQ & not( IRQ1_N ) & not( IRQ2_N );
						INT_DO <= DATA_BUF(7 downto 3) & TMR_IRQ & not( IRQ1_N ) & not( IRQ2_N );
					end if;
				end if;
			end if;
		end if;
		
	end if;
end process;

-- Timer Interrupt
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			TMR_IRQ <= '0';
		elsif TMR_IRQ_REQ = '1' then
			TMR_IRQ <= '1';
		elsif TMR_IRQ_ACK = '1' then
			TMR_IRQ <= '0';
		end if;
	end if;
end process;

-- Timer
process( CLK )
begin
	if rising_edge( CLK ) then
		TMR_IRQ_REQ <= '0';
	
		if RESET_N = '0' then
			TMR_VALUE <= (others => '0');
		elsif TMR_RELOAD = '1' then
			TMR_VALUE <= TMR_LATCH & "1111111111";
		elsif TMR_CLKEN = '1' and TMR_EN = '1' then
			TMR_VALUE <= TMR_VALUE - 1;
			if TMR_VALUE = "0000000" & "0000000000" then
				TMR_VALUE <= TMR_LATCH & "1111111111";
				TMR_IRQ_REQ <= '1';
			end if;
		end if;
	end if;
end process;

-- CPU data bus
CPU_DI <= DI when ROM_SEL_N = '0' or RAM_SEL_N = '0' or VDC_SEL_N = '0' or VCE_SEL_N = '0'
	else PSG_DO when PSG_SEL_N = '0'
	else TMR_DO when TMR_SEL_N = '0'
	else IOP_DO when IOP_SEL_N = '0'
	else INT_DO when INT_SEL_N = '0'
	else x"FF";

CPU_RDY <= RDY when ROM_SEL_N = '0' or RAM_SEL_N = '0' or VDC_SEL_N = '0' or VCE_SEL_N = '0'
	else '1' when PSG_SEL_N = '0'
	else '1' when TMR_SEL_N = '0'
	else '1' when IOP_SEL_N = '0'
	else '1' when INT_SEL_N = '0'
	else '1';

CPU_TIQ_N <= not( TMR_IRQ ) or INT_MASK(2);
CPU_IRQ1_N <= IRQ1_N or INT_MASK(1) ;
CPU_IRQ2_N <= IRQ2_N or INT_MASK(0);

-- PSG
PSG : entity work.psg port map (
	CLK		=> CLK,
	CLKEN	=> PSG_CLKEN,	-- 7.16 Mhz clock
	RESET_N	=> RESET_N,
	
	DI		=> CPU_DO(7 downto 0),
	A		=> CPU_A(3 downto 0),
	WE		=> PSG_WE,
	
	DAC_LATCH	=> DAC_LATCH,
	LDATA		=> DAC_LDATA,
	RDATA		=> DAC_RDATA
);

-- Audio DAC
DAC : entity work.g00_audio_interface port map(
	LDATA	=> DAC_LDATA,
	RDATA	=> DAC_RDATA,
	
	clk		=> CLK,
	rst		=> RESET,
	INIT	=> DAC_INIT,
	W_EN	=> '1',
	CLKEN	=> DAC_CLKEN,
	
	pulse_48KHz	=> DAC_LATCH,
	AUD_MCLK	=> AUD_XCK,
	AUD_BCLK	=> AUD_BCLK,
	AUD_DACDAT	=> AUD_DACDAT,
	AUD_DACLRCK	=> AUD_DACLRCK,
	I2C_SDAT	=> I2C_SDAT,
	I2C_SCLK	=> I2C_SCLK
);

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			DAC_CLKEN <= '0';
			DAC_INIT <= '0';
			DAC_INIT_CNT <= (others => '0');
		else
			DAC_CLKEN <= not DAC_CLKEN;
			if DAC_CLKEN = '1' then
				if DAC_INIT_CNT = "1111" then
					DAC_INIT <= '1';
				else
					DAC_INIT_CNT <= DAC_INIT_CNT + 1;
				end if;
			end if;
		end if;
	end if;
end process;


end rtl;
