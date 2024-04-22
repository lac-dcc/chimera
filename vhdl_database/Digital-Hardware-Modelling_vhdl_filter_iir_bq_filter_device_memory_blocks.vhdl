library ieee;
use ieee.std_logic_1164.all;

entity device_ram_blocks is
	generic (	INTENDED_DEVICE_FAMILY : string  := "SmartFusion";  -- or "ZynqSoC"
				WIDTH_AD               : natural := 10;             -- WIDTH_RDAD = WIDTH_WRAD
				WIDTH_DATA             : natural := 66;             -- WIDTH_DATAIN = WIDTH_DATAOUT
				OUP_REG                : string  := "UNREGISTERED"  -- Set to "CLOCK0" if ouput data is to be registered
			);
	
    port( 	clock     : in  std_logic := '1';
    		aclr      : in  std_logic := '0';
    		rden      : in  std_logic := '1';
    		rdaddress : in  std_logic_vector(WIDTH_AD-1 downto 0);
    		data_in   : in  std_logic_vector(WIDTH_DATA-1 downto 0);
    		wren      : in  std_logic := '0';
    		wraddress : in  std_logic_vector(WIDTH_AD-1 downto 0);
    		data_out  : out std_logic_vector(WIDTH_DATA-1 downto 0)
    	);    
end entity device_ram_blocks;

architecture arch of device_ram_blocks is

begin

end arch;

