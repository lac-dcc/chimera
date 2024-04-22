-- Camera Tracking

-- Goal:


-- Change Log:

-- Import the definitions for standard logic
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.NUMERIC_BIT.all;

entity CameraTracking is 
	port(	VGA_R,VGA_G,VGA_B: out STD_logic_vector(7 downto 0);
			VGA_CLK,VGA_BLANK_N,VGA_HS,VGA_VS,VGA_SYNC_N: out STD_logic;
			SW: in STD_logic_vector(17 downto 0);
			CLOCK_50: in STD_logic;
			EXT_IO: out STD_lOGIC_VECTOR(6 downto 0);  -- this is how the pin mapping labels the external IOs
			LEDG: out STD_logic_vector(7 downto 0);
			KEY: in STD_logic_vector(3 downto 0);
			LEDR: out STD_LOGIC_VECTOR(17 downto 0);
			--GPIO: out STD_logic_vector(4 downto 0);
			IRDA_RXD: in std_logic;
			HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(0 TO 6);
			D5M_D: in STD_LOGIC_VECTOR(11 downto 0);
			D5M_LVAL: in STD_LOGIC;	
			D5M_FVAL: in STD_LOGIC;
			D5M_PIXLCLK: in STD_LOGIC;
			D5M_RESET_N: out STD_LOGIC;
			D5M_SCLK: out STD_LOGIC;
			D5M_SDATA: inout STD_LOGIC;
			D5M_XCLKIN: out STD_LOGIC;
			D5M_TRIGGER: out STD_LOGIC
	);
end;

architecture behavior of CameraTracking is 

	-- used for the PLL
	component 
		clock1 PORT(
			areset		: IN STD_LOGIC  := '0';
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC ;
			c1		: OUT STD_LOGIC ;
			c2		: OUT STD_LOGIC ;
			locked		: OUT STD_LOGIC);
	end component;	
	
	component TwoPortRam IS
	PORT(data		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		rdclock		: IN STD_LOGIC ;
		wraddress		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		wrclock		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (14 DOWNTO 0));
	END component;
		
--	component servo is 
--		port(clk: in STD_LOGIC;
--			Angle: in integer := 100;   -- 1.5 ms
--			servo_ctr: out STD_LOGIC
--		);
--	end component;
--	
	
	component IR_Servo is port(
		IRDA_RXD: in std_logic;
		key: in std_logic_vector(0 downto 0);
		CLOCK_50	:IN STD_LOGIC;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(0 TO 6);	
		EXT_IO: out std_LOGIC_VECTOR(2 downto 0);
		LEDR: out std_LOGIC_VECTOR(2 downto 0)
		);
	end component;

--	component ir_receiver is port ( 
--			iIRDA: in std_logic;
--			reset: in std_logic;
--			clk_50: in std_logic;
--			--Display the information about CUSTOM CODE bits __HEX7-HEX4
--			--and KEY CODE bits __HEX3-HEX0
--			data_ready : out std_logic ;
--			oData: out std_logic_vector(31 downto 0)
--			);
--	end component;
	
	component hexDisplay is port (
		S: in std_logic_vector(3 downto 0);  -- S is an intermediate signal (NOT A PHYSICAL INPUT)
      H: out std_logic_vector(0 to 6));           -- Storage signal for result
	end component; 
	
	
	component CCD_Capture is port(
					oDATA: out STD_lOGIC_VECTOR(11 downto 0);
					oDVAL: out STD_LOGIC;
					oX_Cont: out STD_LOGIC_VECTOR(15 downto 0);
					oY_Cont: out STD_LOGIC_VECTOR(15 downto 0);
					oFrame_Cont: out STD_LOGIC_VECTOR(31 downto 0);
					iDATA: in STD_LOGIC_VECTOR(11 downto 0);
					iFVAL: in STD_LOGIC;
					iLVAL: in STD_LOGIC;
					iSTART: in STD_LOGIC;
					iEND: in STD_LOGIC;
					iCLK: in STD_LOGIC;
					iRST: in STD_LOGIC
					);
	end component;
	
	component BayerToRGB is port(
					oDATA: out STD_lOGIC_VECTOR(14 downto 0);  -- 5 bit RGB
					oDVAL: out STD_LOGIC;
					oX_Cont: out STD_LOGIC_VECTOR(15 downto 0);
					oY_Cont: out STD_LOGIC_VECTOR(15 downto 0);
					iX_Cont: in STD_LOGIC_VECTOR(15 downto 0);
					iY_Cont: in STD_LOGIC_VECTOR(15 downto 0);
					iCLK: in STD_LOGIC;
					iDATA: in STD_lOGIC_VECTOR(11 downto 0));
	end component ;
	
	
	component vga_driver is port(
			VertAddress,HorAddress: out STD_logic_vector(11 downto 0);
			DataValid: out STD_logic;
			VGA_CLK: out STD_logic;				-- used by VGA DAC
			VGA_BLANK_N: out STD_logic;		-- Sent to VGA DAC to indicate blanking
			VGA_HS: 	out STD_logic;				-- The Horizontial Syc  
			VGA_VS: 	out STD_logic;				-- Vertical Syc
			VGA_SYNC_N: out STD_logic;			
			CLOCK_IN: in STD_logic);			-- The clock used by the VGA driver; This must be the correct frequency for the resolution
	end component;

	-- used for PLL
	signal clock_106MHz: STD_logic; 
	signal clock_1MHz: STD_LOGIC;
	signal clock_25MHz: STD_LOGIC;
	signal clock_96MHz: STD_LOGIC;
	
	signal locked: STD_logic;
	signal rst: STD_LOGIC := '0';
	
	
	-- used for the IR reciever and HEX displays
	signal display5, display4, display3, display2, display1, display0: std_logic_vector(0 to 6);
	signal iData: std_logic_vector(31 downto 0); 
	signal IRdata_ready: STD_LOGIC;
	
	signal DataValid: STD_LOGIC;
	signal VGA_HorAddress,VGA_VertAddress: STD_LOGIC_VECTOR(11 downto 0);
	
	
	signal VGAMemReadAddress: STD_logic_vector(16 downto 0);
	signal VGAMemWriteAddress: STD_logic_vector(16 downto 0);
	signal VGAMemWriteEnable: STD_LOGIC;
	signal VGAMemReadData: STD_logic_vector(14 downto 0);
	signal VGAMemWriteData: STD_logic_vector(14 downto 0);
	
	signal mup,mdown,mright,mleft: STD_LOGIC;
	signal horpos,verpos: integer; 
	
	
	-- CCD Camera Signals
	signal rCCD_DATA: STD_LOGIC_VECTOR(11 downto 0);
	signal rCCD_LVAL: STD_LOGIC;
	signal rCCD_FVAL: STD_LOGIC;
	
	signal oDATA: STD_lOGIC_VECTOR(11 downto 0);
	signal pixel: STD_LOGIC_VECTOR(14 downto 0);
	signal DVAL: STD_LOGIC :='0';
	signal oX_Cont: STD_LOGIC_VECTOR(15 downto 0);
	signal oY_Cont: STD_LOGIC_VECTOR(15 downto 0);
	signal RGB_X: STD_LOGIC_VECTOR(15 downto 0);
	signal RGB_Y: STD_LOGIC_VECTOR(15 downto 0);
	signal oFrame_Cont: STD_LOGIC_VECTOR(31 downto 0);
	signal Red, Green, Blue: STD_LOGIC_VECTOR(11 downto 0);
	signal RGB_DVAL: STD_LOGIC;
	
	signal InRawDATA: STD_LOGIC_VECTOR(11 downto 0);
	
begin
	
	LEDG(0) <= rst; --clock debuging 
	LEDG(1) <= locked;
	LEDG(2) <= D5M_PIXLCLK;
	LEDG(3) <= clock_96MHz;
	LEDG(6) <= DVAL;
	LEDG(7) <= RGB_DVAL;
		
	D5M_XCLKIN <= clock_96MHz;
	D5M_TRIGGER	<= '1';  -- TRIGGER
	D5M_RESET_N	<= KEY(0);
	
	--LEDR(15 downto 0) <= oY_Cont;
	
	Camera: CCD_Capture port map(
					oDATA => oDATA,
					oDVAL => DVAL,
					oX_Cont =>oX_Cont,
					oY_Cont => oY_Cont,
					oFrame_Cont => oFrame_Cont,
					iDATA => rCCD_DATA,
					iFVAL => rCCD_FVAL,
					iLVAL => rCCD_LVAL,
					iSTART => not KEY(3),
					iEND => not KEY(2),
					iCLK => D5M_PIXLCLK,
					iRST => KEY(1)    -- active low
					);
	
	
	process(SW(17 downto 16))begin
		case SW(17 downto 16) is
			when "00" => InRawDATA <= oDATA;
			when "01" => InRawDATA <= (oDATA(10 downto 0) & '1') or (oDATA(11) & "00000000000");  -- if MSB is set then deal with it the best we can
			when "10" => InRawDATA <= oDATA(9 downto 0) & "11";
			when "11" => InRawDATA <= oDATA(8 downto 0) & "111";
		end case;
	end process;
	
	
	BtoRGB: BayerToRGB port map(
					oDATA => pixel,  -- 5 bit RGB
					oDVAL => RGB_DVAL,
					oX_Cont => RGB_X,
					oY_Cont => RGB_Y,
					iX_Cont => oX_Cont,
					iY_Cont => oY_Cont,
					iCLK => D5M_PIXLCLK,
					iDATA => InRawDATA 
					);

				---Red(6 downto 2) & Green(6 downto 2) & Blue(6 downto 2), --VGAMemWriteData,
			
			
	VGAMemWriteAddress <=  VGA_HorAddress(9 downto 1) & VGA_VertAddress(8 downto 1);
	

	TwoPortRam_inst : TwoPortRam PORT MAP (
		data	 => pixel, 
		rdaddress	 => VGAMemReadAddress,
		rdclock	 => clock_25MHz,
		wraddress	 => RGB_X(11 downto 3) & RGB_Y(10 downto 3), --VGAMemWriteAddress,
		wrclock	 => D5M_PIXLCLK,
		wren	 => '1' and KEY(3) , 
		q	 => VGAMemReadData 
	);
	
	
	
	-- implement the clock PLL to create a 106 MHz clock
	clock1_inst : clock1 PORT MAP(
		areset	 => rst,  -- active high to Reset PLL
		inclk0	 => CLOCK_50,
		c0	 => clock_1MHz,
		c1	 => clock_106MHz,
		c2  => clock_96MHz,
		locked	 => locked
	);
	
	
	rCCD_DATA <= D5M_D;
	rCCD_FVAL <= D5M_LVAL;
	rCCD_LVAL <= D5M_LVAL;
	
	
	process (CLOCK_50)
	begin
		if(rising_edge(CLOCK_50)) then
			clock_25MHz <= not clock_25MHz;
		end if;
	end process;
	
--	
--	-- pan servo
--	Servo_0 : servo port map (
--		clk => CLOCK_50,
--		Angle => 100,
--		servo_ctr => EXT_IO(0)
--	);
--	
--	-- vertical servo
--	Servo_1 : servo port map (
--		clk => CLOCK_50,
--		Angle => 100,
--		servo_ctr => EXT_IO(1)
--	);
--	
	Cont: IR_Servo port map(
		IRDA_RXD => IRDA_RXD,
		key => KEY(0 downto 0), 
		CLOCK_50 => clock_50,
		HEX0 => HEX0,
		HEX1 => HEX1,
		HEX2 => HEX2,
		HEX3 => HEX3,
		HEX4 => HEX4,
		HEX5 => HEX5,
		EXT_IO => EXT_IO(2 downto 0),
		LEDR => LEDR(2 downto 0));


	
	vga_inst: vga_driver port map(
		VertAddress => VGA_VertAddress,
		HorAddress => VGA_HorAddress,
		DataValid => DataValid,
		VGA_CLK => VGA_CLK,
		VGA_BLANK_N => VGA_BLANK_N,
		VGA_HS => VGA_HS,
		VGA_VS => VGA_VS,
		VGA_SYNC_N => VGA_SYNC_N,
		CLOCK_IN => clock_25MHz
		);
	
	


	
	-- copy the video memory data to the VGA out lines for the corisponding address
	process (VGA_VertAddress,VGA_HorAddress)
	begin
		VGAMemReadAddress <= VGA_HorAddress(9 downto 1) & VGA_VertAddress(8 downto 1);
		VGA_R(7 downto 3) <= VGAMemReadData(14 downto 10);
		VGA_G(7 downto 3) <= VGAMemReadData(9 downto 5);
		VGA_B(7 downto 3) <= VGAMemReadData(4 downto 0);
		VGA_R(2 downto 0) <= "111"; 
		VGA_G(2 downto 0) <= "111";
		VGA_B(2 downto 0) <= "111";
	end process;
	
	

	
end behavior;
