----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07/31/2014 
-- Design Name: 
-- Module Name:    Memory_Module - Behavioral This one uses the
-- external memory device
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory_Module is
    Port ( clk : in  STD_LOGIC;
           reset : in STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (11 downto 0);
           write_data : in  STD_LOGIC_VECTOR (11 downto 0);
           read_data : out  STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
           write_enable : in  STD_LOGIC; -- start write memory cycle, address and write data are valid
           read_enable : in  STD_LOGIC; -- start read cycle, address is valid
           mem_finished : out  STD_LOGIC; -- memory cycle is done OK to latch read data
-- Note that read_enable and write_enable may be asserted over many clock cycles but must
-- be released when mem_finished occurs. The address and write data are latched on the first
-- active clock edge when the enable is asserted. 
-- Mem_finished only lasts through one active clock edge.

   	        RamCLK : out STD_LOGIC;
		    RamADVn : out STD_LOGIC;
            RamCEn : out STD_LOGIC;
            RamCRE : out STD_LOGIC;
            RamOEn : out STD_LOGIC;
            RamWEn : out STD_LOGIC;
            RamLBn : out STD_LOGIC;
            RamUBn : out STD_LOGIC;
            RamWait : in STD_LOGIC;
            MemDB : inout STD_LOGIC_VECTOR (15 downto 0);
            MemAdr : out STD_LOGIC_VECTOR (22 downto 0)


                          );
end Memory_Module;

architecture Behavioral of Memory_Module is
COMPONENT corerom
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;

signal wea : std_logic_vector (0 downto 0);
type STATES is (SRESET, SCOPY1, SCOPY2, S0, S1, S1A, S2, S3, S3A,
    SDELAY0, SDELAY1, SDELAY2, SDELAY3, SDELAY4, SDELAY5, SDELAY6, SWAIT,
    SDELAY0A, SDELAY1A, SDELAY2A, SDELAY3A, SDELAY4A, SDELAY5A, SDELAY6A,
    SDELAY0B, SDELAY1B, SDELAY2B, SDELAY3B, SDELAY4B, SDELAY5B, SDELAY6B);
signal curr_state : STATES := SRESET;
signal next_state : STATES;
signal addr_buf, wdata_buf : std_logic_vector (11 downto 0) := (others => '0');
signal rdata_buf : std_logic_vector (11 downto 0);
signal load_rdata : std_logic;
signal addra, douta : std_logic_vector(11 downto 0); -- ROM interface
signal copying, driving : std_logic := '0';
signal writingn, outenablingn, chipenablen : std_logic := '1';
signal en_writing, en_driving, en_outenabling : std_logic;
signal start_copying, end_copying : std_logic;
signal mem_addr, mem_wdata : std_logic_vector (11 downto 0);
signal counter : std_logic_vector (11 downto 0) := (others => '0');
signal inc_counter, count7777 : std_logic;
begin

-- Constant driven signals in memory interface
RamCLK <= '0'; -- synchronous interface not used
RamADVn <= '0';
RamCRE <= '0';
RamLBn <= '0';
RamUBn <= '0';
MemAdr(22 downto 12) <= (others => '0');

RamWEn <= writingn;
RamOEn <= outenablingn;
RamCEn <= chipenablen;

process (clk) begin -- copying switch
        if rising_edge(clk) then
                if start_copying = '1' or reset = '1' then
                        copying <= '1';
                elsif end_copying = '1' then
                        copying <= '0';
                end if;
        end if;
end process;

process (clk) begin -- deglitching signals to external RAM
    if rising_edge(clk) then
	writingn <= not en_writing;
	driving <= en_driving;
	outenablingn <= not en_outenabling;
    chipenablen <= not (en_writing OR en_outenabling);
    end if;
end process;

-- Multiplexers to RAM inputs
MemAdr(11 downto 0) <= counter when copying = '1' else addr_buf;
MemDB <= "0000" & douta when copying = '1' else 
	     "0000" & wdata_buf when driving = '1'
	     else (others => 'Z');

addra <= counter; -- always connected

-- address counter
process (clk) begin
        if rising_edge(clk) then
                if reset = '1' then
                        counter <= (others => '0');
                elsif inc_counter = '1' then
                        counter <= counter + 1;
                end if;
        end if;
end process;

count7777 <= '1' when counter = "111111111111" else '0';

process (clk) begin -- current state register
        if rising_edge(clk) then
                if reset = '1' then
                        curr_state <= SRESET;
                else
                        curr_state <= next_state;
                end if;
        end if;
end process;

process (clk) begin -- address and write data buffers
        if rising_edge(clk) then
                if (read_enable = '1' or write_enable = '1') and curr_state = S0 then
                        addr_buf <= address;
                        wdata_buf <= write_data;
                end if;
        end if;
end process;

process (clk) begin -- read data buffer
        if rising_edge(clk) then
                if load_rdata = '1' then
                        read_data <= MemDB(11 downto 0);
                end if;
        end if;
end process;

process (read_enable, write_enable, curr_state, count7777) begin -- state machine combinatorial logic
        next_state <= curr_state; -- set defaults
        mem_finished <= '0';
        load_rdata <= '0';
        start_copying <= '0';
        end_copying <= '0';
        inc_counter <= '0';
	en_driving <= '0';
	en_outenabling <= '0';
	en_writing <= '0';
        case curr_state is
                when SRESET => start_copying <= '1'; next_state <= SCOPY1; -- read of ROM starts here
                when SCOPY1 => en_writing <= '1'; -- write the data (must be available)
                               en_driving <= '1';
                               next_state <= SDELAY0;
                when SDELAY0 => -- 10 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY1;
                when SDELAY1 => -- 20 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY2;
                when SDELAY2 => -- 30 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY3;
                when SDELAY3 => -- 40 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY4;
                when SDELAY4 => -- 50 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY5;
                when SDELAY5 => -- 60 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY6;
                when SDELAY6 => -- 70 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SWAIT;
					when SWAIT => -- write is over but we need a delay before incrementing the counter.
							next_state <= SCOPY2;
-- We need to insert wait states here
                when SCOPY2 => -- write is finished
                                                        inc_counter <= '1';
                                                        if count7777 = '1' then next_state <= S0;
                                                        else next_state <= SRESET; 
                                                        end if;
                when S0 =>
                                        end_copying <= '1';
                                        if read_enable = '1' then next_state <= S1; -- start read cycle
                                        elsif write_enable = '1' then next_state <= S3;
                                        end if;
-- Read command
                when S1 => en_outenabling <= '1';
                           next_state <= SDELAY0B; -- delay for operation
-- We need to insert wait states here
                when SDELAY0B => -- 10 ns
                    en_outenabling <= '1';
                    next_state <= SDELAY1B;
                when SDELAY1B => -- 20 ns
                    en_outenabling <= '1';
                    next_state <= SDELAY2B;
                when SDELAY2B => -- 30 ns
                    en_outenabling <= '1';
                    next_state <= SDELAY3B;
                when SDELAY3B => -- 40 ns
                    en_outenabling <= '1';
                    next_state <= SDELAY4B;
                when SDELAY4B => -- 50 ns
                    en_outenabling <= '1';
                    next_state <= SDELAY5B;
                when SDELAY5B => -- 60 ns
                    en_outenabling <= '1';
                    next_state <= SDELAY6B;
                when SDELAY6B => -- 70 ns
                    en_outenabling <= '1';
                    next_state <= S1A;
                when S1A => en_outenabling <= '1';
                            load_rdata <= '1'; next_state <= S2;
                when S2 => mem_finished <= '1'; next_state <= S0;
-- Write command
                when S3 => en_writing <= '1';
                           en_driving <= '1'; 
                           next_state <= SDELAY0A;
-- We need to insert wait states here
                when SDELAY0A => -- 10 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY1A;
                when SDELAY1A => -- 20 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY2A;
                when SDELAY2A => -- 30 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY3A;
                when SDELAY3A => -- 40 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY4A;
                when SDELAY4A => -- 50 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY5A;
                when SDELAY5A => -- 60 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= SDELAY6A;
                when SDELAY6A => -- 70 ns
                    en_writing <= '1';
                    en_driving <= '1';
                    next_state <= S3A;
                when S3A => en_driving <= '1'; mem_finished <= '1'; next_state <= S0;
                when others => next_state <= S0;
        end case;
end process;


your_instance_name2 : corerom
  PORT MAP (
    clka => clk,
    addra => addra,
    douta => douta
  );



end Behavioral;

