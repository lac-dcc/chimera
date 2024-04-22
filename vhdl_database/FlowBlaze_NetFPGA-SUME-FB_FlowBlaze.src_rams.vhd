library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.salutil.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity ram32x32dp is
	  generic (init_file: string:="");
      port ( 
             --AXI interface
			 axi_clock : in std_logic;
			 we: in std_logic;
             axi_addr : in std_logic_vector(4 downto 0); 
             axi_data_in : in std_logic_vector(31 downto 0);
             axi_data_out : out std_logic_vector(31 downto 0);
             
             -- AXIS interface
             clock : in std_logic;
 			 addr  : in std_logic_vector(4 downto 0);
 			 data_out : out std_logic_vector(31 downto 0)
		);
end ram32x32dp;

architecture behavioral of ram32x32dp is

type mem_type_32_32 is array (0 to 31) of std_logic_vector(31 downto 0);

impure function InitRamFromFile (RamFileName : in string) return mem_type_32_32 is
    FILE ramfile : text is in RamFileName;
    variable RamFileLine : line;
    variable ram : mem_type_32_32;
        begin
            for i in mem_type_32_32'range loop
                readline(ramfile, RamFileLine);
                hread(RamFileLine, ram(i));
            end loop;
    return ram;
end function;

signal mem1: mem_type_32_32:=InitRamFromFile(init_file);

begin


--dual port ram

process(axi_clock)
    begin
	if axi_clock'event and axi_clock = '1' then
			if (we = '1') then
			    mem1(conv_integer(axi_addr)) <= axi_data_in;
			else
			   axi_data_out <= mem1(conv_integer(axi_addr));
            end if;
	end if;			
end process;

process(clock)
    begin
	if clock'event and clock = '1' then
			data_out <= mem1(conv_integer(addr));
    end if;			
end process;


end behavioral;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.salutil.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity ram256x512 is
	  generic (init_file: string:="");
      port ( clock : in std_logic;
	         we: in std_logic;
             addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
             dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
             addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
             doutb : OUT STD_LOGIC_VECTOR(511 DOWNTO 0)
		);
end ram256x512;

architecture behavioral of ram256x512 is

type mem_type_256_512 is array (0 to 255) of std_logic_vector(511 downto 0);

impure function InitRamFromFile (RamFileName : in string) return mem_type_256_512 is
    FILE ramfile : text is in RamFileName;
    variable RamFileLine : line;
    variable ram : mem_type_256_512;
        begin
            for i in mem_type_256_512'range loop
                readline(ramfile, RamFileLine);
                hread(RamFileLine, ram(i));
            end loop;
    return ram;
end function;

signal mem1: mem_type_256_512:=InitRamFromFile(init_file);
signal int_addr,int_addr_b:STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

int_addr<=addra(11 downto 4);
int_addr_b<=addrb;
process(clock)
    begin
	if clock'event and clock = '1' then
                    doutb <= mem1(conv_integer(int_addr_b))(511 downto 0);
		    if (we = '1') then
                        case addra(3 downto 0) is
                            when "0000" => mem1(conv_integer(int_addr))(31 downto 0) <= dina;
                            when "0001" => mem1(conv_integer(int_addr))(63 downto 32) <= dina;
                            when "0010" => mem1(conv_integer(int_addr))(95 downto 64) <= dina;
                            when "0011" => mem1(conv_integer(int_addr))(127 downto 96) <= dina;
                            when "0100" => mem1(conv_integer(int_addr))(159 downto 128) <= dina;
                            when "0101" => mem1(conv_integer(int_addr))(191 downto 160) <= dina;
                            when "0110" => mem1(conv_integer(int_addr))(223 downto 192) <= dina;
                            when "0111" => mem1(conv_integer(int_addr))(255 downto 224) <= dina;
                            when "1000" => mem1(conv_integer(int_addr))(287 downto 256) <= dina;
                            when "1001" => mem1(conv_integer(int_addr))(319 downto 288) <= dina;
                            when "1010" => mem1(conv_integer(int_addr))(351 downto 320) <= dina;
                            when "1011" => mem1(conv_integer(int_addr))(383 downto 352) <= dina;
                            when "1100" => mem1(conv_integer(int_addr))(415 downto 384) <= dina;
                            when "1101" => mem1(conv_integer(int_addr))(447 downto 416) <= dina;
                            when "1110" => mem1(conv_integer(int_addr))(479 downto 448) <= dina;
                            when "1111" => mem1(conv_integer(int_addr))(511 downto 480) <= dina;
                            when others => null;
                        end case;
                    end if;
            end if;			
    end process;
end behavioral;