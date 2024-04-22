------------------------------------------------------
-- Instruction Memory Block
-- 
-- Contains all the instructions to be run.
-- 
-- Memory is kept in rows of 32 bits to represent 32-bit
-- registers.
-- 
-- This component initially reads from the file
-- 'instructions.txt' and saves it into a 2d array.
-- 
-- This component takes in a 32-bit address and returns
-- the instruction at that address.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use STD.textio.all; -- Required for freading a file

entity instruction_memory is
	port (
		read_address: in STD_LOGIC_VECTOR (31 downto 0);
		instruction, last_instr_address: out STD_LOGIC_VECTOR (31 downto 0)
	);
end instruction_memory;


architecture behavioral of instruction_memory is	  

    -- 128 byte instruction memory (32 rows * 4 bytes/row)
    type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
    signal data_mem: mem_array := (
        "00000000000000000000000000000000", -- initialize data memory
        "00000000000000000000000000000000", -- mem 1
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- mem 10 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", -- mem 20
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", -- mem 30
        "00000000000000000000000000000000"
    );

    begin

    -- The process for reading the instructions into memory
    process 
        file file_pointer : text;
        variable line_content : string(1 to 32);
        variable line_num : line;
        variable i: integer := 0;
        variable j : integer := 0;
        variable char : character:='0'; 
    
        begin
        -- Open instructions.txt and only read from it
        file_open(file_pointer, "instructions.txt", READ_MODE);
        -- Read until the end of the file is reached  
        while not endfile(file_pointer) loop
            readline(file_pointer,line_num); -- Read a line from the file
            READ(line_num,line_content); -- Turn the string into a line (looks wierd right? Thanks Obama)
            -- Convert each character in the string to a bit and save into memory
            for j in 1 to 32 loop        
                char := line_content(j);
                if(char = '0') then
                    data_mem(i)(32-j) <= '0';
                else
                    data_mem(i)(32-j) <= '1';
                end if; 
            end loop;
            i := i + 1;
        end loop;
        if i > 0 then
            last_instr_address <= std_logic_vector(to_unsigned((i-1)*4, last_instr_address'length));
        else
            last_instr_address <= "00000000000000000000000000000000";
        end if;

        file_close(file_pointer); -- Close the file 
        wait; -- ( ͡° ͜ʖ ͡°)
    end process;

    -- Since the registers are in multiples of 4 bytes, we can ignore the last two bits
    instruction <= data_mem(to_integer(unsigned(read_address(31 downto 2))));

end behavioral;