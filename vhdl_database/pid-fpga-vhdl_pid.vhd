----------------------------------------------------------------------------------
-- Company: MIT Manipal
-- Engineer: Deep Chakraborty
-- 			 Reg: 120907292, Section D, 5th Sem, Roll-21	
-- Create Date:    23:58:04 11/02/2014 
-- Design Name: 	 FPGA based PID controller 	
-- Module Name:    pid - Behavioral 
-- Project Name: 	FPGA based PID controller	
-- Target Devices: Spartan 3E XC3S400
-- Tool versions: ISE Design Suite 14.7
-- Description: This code takes the 16 bit input from an ADC, calculates the error 
--					 (deviation from the setpoint), and feeds it into the discrete PID
--					 equation to generate the control input.					
--
-- Dependencies: None
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: This code is a result of the VLSI lab case study for 5th 
--								Semester students. 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pid is
    Port ( ADC_DATA : in  STD_LOGIC_VECTOR (15 downto 0); --16 bit unsigned PID input
           DAC_DATA : out  STD_LOGIC_VECTOR (15 downto 0); --16 bit unsigned PID output 
           CLK1 : in STD_LOGIC);
end pid;
architecture Behavioral of pid is
    type statetypes is (Reset,		--user defined type to determine the flow of the system
			CalculateNewError,
			CalculatePID,
			DivideKg,
			Write2DAC,                              
			SOverload,
			ConvDac);	                             
    
    signal state,next_state : statetypes := Reset;     
    signal Kp : integer := 10;		--proportional constant
    signal Kd : integer :=20;		--differential constant
    signal Ki : integer :=1;		--integral constant
    signal Output : integer := 1;	--intermediate output
    signal inter: integer := 0;		--intermediate signal
    signal SetVal : integer := 33259;  	--set point, this is what the PID loop tries to achieve
    signal sAdc : integer := 0 ;	--stores the integer converted value of the ADC input
    signal Error: integer := 0;		--Stores the deviation of the input from the set point
    signal p,i,d : integer := 0;	--Contain the proportional, derivative and integral errors respectively
    signal DacDataCarrier : std_logic_vector (15 downto 0); --contains the binary converted value to be output to the DAC
    
begin
PROCESS(CLK1,state)		--sensitive to Clock and current state
      variable Output_Old : integer := 0;   
      variable Error_Old : integer := 0;
     BEGIN	 
         IF CLK1'EVENT AND CLK1='1' THEN  
				state <= next_state;
         END IF;
         case state is
		 when Reset =>
			sAdc <= to_integer(unsigned(ADC_DATA));  --Get the input for PID
			next_state <= CalculateNewError;
			Error_Old := Error;  --Capture old error
			Output_Old := Output;    --Capture old PID output
			
		  when CalculateNewError =>  
			next_state <= CalculatePID;
			inter <= (SetVal-sAdc); --Calculate Error
			Error <= to_integer(to_unsigned(inter,32));
		  
		  when CalculatePID =>
			next_state <= DivideKg;
			p <= Kp*(Error);              --Calculate PID 
			i <= Ki*(Error+Error_Old);
			d <= Kd *(Error-Error_Old);                     
				
		  when DivideKg =>
			next_state <= SOverload;
			Output <=  Output_Old+(p+i+d)/2048; --Calculate new output (/2048 to scale the output correctly)
		  
		  when SOverload =>
			next_state <=ConvDac;	--done to keep output within 16 bit range
			if Output > 65535 then
				 Output <= 65535 ;
			end if;     
			if Output < 1 then 
				 Output <= 1;
			end if;
				
		  when ConvDac =>        		--Send the output to port
			DacDataCarrier <= std_logic_vector(to_unsigned(Output ,16));
			next_state <=Write2DAC;
			
		  when Write2DAC =>				--send output to the DAC
			next_state <= Reset;
			DAC_DATA <= DacDataCarrier;
	 end case;

                        
END PROCESS;	--end of process
end Behavioral;		--end of Architecture
