library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity Regfile is
port(
	Data_In : in std_logic_vector(31 downto 0); -- Input Data

	Addrs_In : in unsigned(3 downto 0);		-- Input Address
	Addrs1_Out : in unsigned(3 downto 0); 	-- Output Address 1
	Addrs2_Out : in unsigned(3 downto 0); 	-- Output Address 2
	Wr_En : in std_logic; -- Write Enable
	Clk : in std_logic; -- Global Clk

	Data1_Out : out std_logic_vector(31 downto 0);	-- Output Data 1
	Data2_Out : out std_logic_vector(31 downto 0)	-- Output Data 2
);
end entity Regfile;

architecture Regfile_Arch of Regfile is
	-- Declarations of Register File type & signal
	type Regfile_type is array (natural range<>) of std_logic_vector(31 downto 0);
	signal Regfile_Coff : Regfile_type(0 to 15);
	
	--attribute syn_ramstyle : string;
	--attribute syn_ramstyle of Regfile_Coff : signal is "block_ram";
		
begin
--------------------------------------------------------
-- Concurrent Statements

-- Regfile_Read Assignments
Data1_Out <= Regfile_Coff(TO_INTEGER(Addrs1_Out));
Data2_Out <= Regfile_Coff(TO_INTEGER(addrs2_Out));
--------------------------------------------------------
-- Sequential Process
-- Register File Write Process

Regfile_Write: process(Clk)

begin
	if(RISING_EDGE(Clk))then
		if(Wr_En = '1')then
			Regfile_Coff(TO_INTEGER(Addrs_In)) <= Data_In;
		end if;
	end if;
end process Regfile_Write;
--------------------------------------------------------
end architecture Regfile_Arch;
