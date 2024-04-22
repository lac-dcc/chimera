----------------------------------------------------------------------------------
-- Engineer: github.com/YetAnotherElectronicsChannel
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity UpSampler is
port (
    clk  : in std_logic;
    
    upsample_in : in signed (31 downto 0);
    sample_valid_in  : in std_logic;
    
    upsample_out : out signed(31 downto 0) := (others=>'0');
    sample_valid_out : out std_logic := '0'
    );

end UpSampler;

architecture Behavioral of UpSampler is




--FIR filter designed with
--http://t-filter.appspot.com
--sampling frequency: 384000 Hz
--fixed point precision: 16 bits

-- 0 Hz - 20000 Hz
--  gain = 1
--  desired ripple = 2 dB
--  actual ripple = n/a

-- 30000 Hz - 192000 Hz
--  gain = 0
--  desired attenuation = -100 dB
--  actual attenuation = n/a

type t_FirArray is array (0 to 123) of integer;
signal FirCoeffs : t_FirArray := (-1,  -1,  -3,  -5,  -9,  -14,  -20,  -26,  -32,  -38,  -41,  -40,  -3,  -22,  -2,  26,  60,  99,  140,
 180,  213,  236,  244,  233,  203,  154,  89,  13,  -65,  -136,  -192,  -224,  -224,  -191,  -124,  -29,  83,  200,  304,  380,  413,  392,
 312,  175,  -7,  -217,  -429,  -614,  -741,  -782,  -713,  -520,  -199,  239,  772,  1369,  1986,  2579,  3099,  3505,  3764,  3852,  3764,
 3505,  3099,  2579,  1986,  1369,  772,  239,  -199,  -520,  -713,  -782,  -741,  -614,  -429,  -217,  -7,  175,  312,  392,  413,  380,  304,
 200,  83,  -29,  -124,  -191,  -224,  -224,  -192,  -136,  -65,  13,  89,  154,  203,  233,  244,  236,  213,  180,  140,  99,  60,  26,  -2,
 -22,  -34,  -40,  -41,  -38,  -32,  -26,  -20,  -14,  -9,  -5,  -3,  -1,  -1, 0);

type t_FirDataArray is array (0 to 31) of signed(31 downto 0);
signal FirData : t_FirDataArray := (others => (others => '0'));

type t_FirPtr is array (0 to 31) of integer;
signal FirPTRs : t_FirPtr := (others => 0);
signal FIR_W_Ptr : integer := 0;
signal FirState : integer := 0;
signal FirTemp : signed(31 downto 0):= (others => '0');
signal FirLoopCount : integer := 0;

signal DataToFIR : signed(31 downto 0):= (others => '0');
signal FIREnable, FIRIsNull : std_logic := '0';

signal timer : unsigned (7 downto 0):= (others => '0');
signal state : integer := 0;

signal mul_inp_2 : signed(15 downto 0) := (others=>'0');
signal mul_inp_1 : signed(31 downto 0) := (others=>'0');
signal mul_result : signed(31 downto 0) := (others=>'0');

begin

process (mul_inp_1, mul_inp_2)
begin
    mul_result <= resize(shift_right(mul_inp_1*mul_inp_2,15),32);
end process;



--this is the FIR filter
--as shown in the block diagram, incoming null-samples must not be cosidered because result would be anyway 0 for this tab
--fill only real samples into incoming structure and save their position in the FIRPTR array. FIRPTR array is upcountin with the real 384 kHz.
--FirPTR and FirData is working like a ringbuffer

process (clk)
begin
if (rising_edge(clk)) then
 
	if (FirState=0) then
		sample_valid_out <= '0';
		if (FIREnable = '1' ) then
			FirState <= 1;
			FirLoopCount <= 0;
			FirTemp <= (others=>'0');
			mul_inp_1 <= (others=>'0');
			mul_inp_2 <= (others=>'0');
		end if;
		
	elsif (FirState=1) then        
		if (FirLoopCount < 32) then 
			FirTemp <= FirTemp + mul_result;
			mul_inp_1 <= FirData(FirLoopCount);
			mul_inp_2 <= to_signed(FirCoeffs(FirPTRs(FirLoopCount)),16);
			
			FirLoopCount <= FirLoopCount + 1;
			if (FirPTRs(FirLoopCount) < 123) then
				FirPTRs(FirLoopCount) <= FirPTRs(FirLoopCount) + 1;
			end if;
		else   
			FirTemp <= FirTemp + mul_result;
			if (FIRIsNull = '0') then
			--multiply by 4 (shift 2 left)
				FirData(FIR_W_Ptr) <= shift_left(DataToFIR,2);
				FirPTRs(FIR_W_Ptr) <= 0;
				if (FIR_W_Ptr < 31) then
					FIR_W_Ptr <= FIR_W_Ptr +1;
				else
					FIR_W_Ptr <= 0;
				end if;                    
			end if;			
			FirState <= 2;                
		end if;
	elsif (FirState=2) then
		upsample_out <= FirTemp;
		sample_valid_out <= '1';
		FirState<=0;
	end if;
    
    

end if;
end process;


process (clk)
begin
if (rising_edge(clk)) then
   
	if (state = 0 and sample_valid_in = '1') then
		timer <= (others=>'0');
	else
		timer <= timer + to_unsigned(1,8);
	end if;
	
	--here is the upsampling done. between every incoming sample, three null-samples are filled in with 64 clock cycles delay each to get exactly from 96 kHz -> 384 kHz
	--trigger the FIR filter with every new sample and signal to FIR if it is null-sample or "real-sample"
	if (state = 0 and sample_valid_in = '1') then
		state <= 1;
		DataToFIR <= upsample_in;
		FIREnable <= '1';
		FIRIsNull <= '0';
		
	elsif (state = 1) then
		FIREnable <= '0';
		state <= 0;
	
	elsif (state = 0 and timer = to_unsigned(63, 8)) then
		DataToFIR <= to_signed(0,32);
		FIREnable <= '1';
		FIRIsNull <= '1';
		state <= 1;
		
	elsif (state = 0 and timer = to_unsigned(127, 8)) then
		DataToFIR <= to_signed(0,32);
		FIREnable <= '1';
		FIRIsNull <= '1';
		state <= 1;
		
	elsif (state = 0 and timer = to_unsigned(191, 8)) then
		DataToFIR <= to_signed(0,32);
		FIREnable <= '1';
		FIRIsNull <= '1';
		state <= 1;
	end if;
                          
    
    
end if;
end process;

end Behavioral;