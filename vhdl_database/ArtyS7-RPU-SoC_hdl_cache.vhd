----------------------------------------------------------------------------------
-- Project Name: RPU
-- Description: DDR3 cache unit
--
--  Sits in front of DDR3 reads, and snoops alognside DDR3 writes.
-- 
----------------------------------------------------------------------------------
-- Copyright 2020 Colin Riley
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cache is
    port (
        I_CLK : in STD_LOGIC;
        I_RST : in STD_LOGIC;
        I_CMD : in STD_LOGIC_VECTOR (1 downto 0);
        I_EXEC : in STD_LOGIC;
        I_ADDR : in STD_LOGIC_VECTOR (31 downto 0);
        I_WRITESIZE : in STD_LOGIC_VECTOR (1 downto 0);
        I_WRITEDATA : in STD_LOGIC_VECTOR (31 downto 0);
        I_DATA : in STD_LOGIC_VECTOR (255 downto 0);
        O_ADDR : out STD_LOGIC_VECTOR (31 downto 0);
        O_DATA : out STD_LOGIC_VECTOR (31 downto 0);
        O_REQ : out STD_LOGIC;
        I_REQRDY : in STD_LOGIC;
        O_CMDDONE : out STD_LOGIC;
        O_READY : out STD_LOGIC;
        O_PC_requests : out STD_LOGIC_VECTOR (63 downto 0);
        O_PC_misses : out STD_LOGIC_VECTOR (63 downto 0)
    );
end cache;

-- 32-byte wide cache lines. Number of lines set using CACHE_DEPTH.
-- Read-only, fully-associative, round robin replacement with invalidate priority.
-- Line invalidation on write - setting the next round robin replacement victim to that line.
--    Update: "Write-through" occurs if write is 32-bit in size

architecture Behavioral of cache is

    type tag is record
        addr : std_logic_vector(26 downto 0);
        valid : std_logic;
    end record;

    constant CACHE_DEPTH : integer := 128;

    type cache_data is array ((CACHE_DEPTH - 1) downto 0) of STD_LOGIC_VECTOR (255 downto 0);
    type cache_tags is array ((CACHE_DEPTH - 1) downto 0) of tag;

    signal data : cache_data := (others => (others => '0'));
    signal tags : cache_tags := (others => ((others => '0'), '0'));

    signal S_ADDR : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal S_ADDR_BITS : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal S_DATA : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

    signal S_RWDATA : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal S_REQ : STD_LOGIC := '0';
    signal S_CMDDONE : STD_LOGIC := '0';
    signal S_READY : STD_LOGIC := '1';

    signal S_NEWDATA : STD_LOGIC_VECTOR (255 downto 0) := (others => '0');

    signal S_ADDR_TAG : STD_LOGIC_VECTOR (26 downto 0) := (others => '0');
    signal S_REQ_TAG_ID : integer := 0;

    signal S_nextTag : integer := 0;

    signal state : integer := 0;

    signal pc_requests : STD_LOGIC_VECTOR(63 downto 0) := X"0000000000000000";
    signal pc_misses : STD_LOGIC_VECTOR(63 downto 0) := X"0000000000000000";

    constant STATE_IDLE : integer := 0;
    constant STATE_COMPLETE : integer := 1;
    constant STATE_READDATA : integer := 2;
    constant STATE_REQDATA_INIT : integer := 3;
    constant STATE_REQDATA_WAIT : integer := 4;
    constant STATE_REQDATA_DONE : integer := 5;

    constant STATE_WT_WRITE : integer := 6;
    constant STATE_WT_READ : integer := 7;
    constant STATE_WT_MODIFY : integer := 8;

    constant CMD_READ : std_logic_vector (1 downto 0) := "01";
    constant CMD_WRITEINVAL : std_logic_vector (1 downto 0) := "10";
    constant CMD_ALLINVAL : std_logic_vector (1 downto 0) := "11";
begin

    cmd_handler : process (I_CLK)
        variable var_tag_found : std_logic := '0';
        variable var_tag_found_i : integer := 0;
    begin
        if rising_edge(I_CLK) then
            if I_RST = '1' then
                S_ADDR <= (others => '0');
                S_DATA <= (others => '0');
                S_REQ <= '0';
                S_CMDDONE <= '0';
                S_READY <= '1';
                state <= STATE_IDLE;
                pc_misses <= X"0000000000000000";
                pc_requests <= X"0000000000000000";
            else
                if state = STATE_IDLE then
                    if I_EXEC = '1' then
                        S_ADDR_BITS <= I_ADDR(4 downto 0);
                        S_ADDR <= I_ADDR(31 downto 5) & "00000";
                        S_CMDDONE <= '0';
                        S_READY <= '0';
                        S_RWDATA <= I_WRITEDATA;

                        if I_CMD = CMD_READ then
                            var_tag_found := '0';
                            -- read
                            -- check tags for I_ADDR
                            for I in 0 to (CACHE_DEPTH - 1) loop
                                if tags(I).addr = I_ADDR(31 downto 5) and tags(I).valid = '1' then
                                    S_REQ_TAG_ID <= I;
                                    var_tag_found_i := I;
                                    var_tag_found := '1';
                                end if;
                            end loop;
                            if (var_tag_found = '0') then
                                state <= STATE_REQDATA_INIT;
                            else
                                if I_ADDR(4 downto 2) = "011" then
                                    S_DATA <= data(var_tag_found_i)(31 downto 0);
                                elsif I_ADDR(4 downto 2) = "010" then
                                    S_DATA <= data(var_tag_found_i)(63 downto 32);
                                elsif I_ADDR(4 downto 2) = "001" then
                                    S_DATA <= data(var_tag_found_i)(95 downto 64);
                                elsif I_ADDR(4 downto 2) = "000" then
                                    S_DATA <= data(var_tag_found_i)(127 downto 96);
                                elsif I_ADDR(4 downto 2) = "111" then
                                    S_DATA <= data(var_tag_found_i)(159 downto 128);
                                elsif I_ADDR(4 downto 2) = "110" then
                                    S_DATA <= data(var_tag_found_i)(191 downto 160);
                                elsif I_ADDR(4 downto 2) = "101" then
                                    S_DATA <= data(var_tag_found_i)(223 downto 192);
                                elsif I_ADDR(4 downto 2) = "100" then
                                    S_DATA <= data(var_tag_found_i)(255 downto 224);
                                end if;
                                S_CMDDONE <= '1';
                                S_READY <= '1';
                                state <= STATE_COMPLETE;
                            end if;

                        elsif I_CMD = CMD_WRITEINVAL then
                            -- **** ISSUE ****
                            -- FIXME: There is an issue with write-through randomly failing riscv-compliance tests in
                            --    a seemingly random way. It's not actually random - just requires a specific set of
                            --    circumstances to arrise with DDR3 writes and then reads of results in the compliance
                            --    test runner. In the mean time, this feature has been disabled
                            
                            -- Simply invalidate any lines which hold data which is being written to
                            for I in 0 to (CACHE_DEPTH - 1) loop
                                if tags(I).addr = I_ADDR(31 downto 5) then
                                    tags(I).valid <= '0';
                                    S_nextTag <= I; -- set the next line to use as this one, it's invalid anyway
                                end if;
                            end loop;
                            state <= STATE_COMPLETE;
--                            var_tag_found := '0';
--                            -- write is occuring to I_ADDR
--                            -- if I_ADDR is in the cache, and it is a 32b write, update the line. else invalidate.
--                            for I in 0 to (CACHE_DEPTH - 1) loop
--                                if tags(I).addr = I_ADDR(31 downto 5) then
--                                    if I_WRITESIZE = "10" then
--                                        var_tag_found_i := I;
--                                        var_tag_found := '1';
--                                    else
--                                        tags(I).valid <= '0';
--                                        S_nextTag <= I; -- set the next line to use as this one, it's invalid anyway
--                                    end if;
--                                end if;
--                            end loop;
--
--                            if (var_tag_found = '1') then
--                                S_REQ_TAG_ID <= var_tag_found_i;
--                                state <= STATE_WT_WRITE;
--                            else
--                                state <= STATE_COMPLETE;
--                            end if;

                        elsif I_CMD = CMD_ALLINVAL then
                            for I in 0 to (CACHE_DEPTH - 1) loop
                                tags(I).valid <= '0';
                            end loop;
                            state <= STATE_COMPLETE;
                        end if;
                    end if;

                elsif state = STATE_REQDATA_INIT then
                    S_REQ <= '1';
                    S_ADDR_TAG <= I_ADDR(31 downto 5);
                    pc_misses <= std_logic_vector(unsigned(pc_misses) + 1);
                    state <= STATE_REQDATA_WAIT;

                elsif state = STATE_REQDATA_WAIT then
                    S_REQ <= '0';
                    if I_REQRDY = '1' then
                        state <= STATE_REQDATA_DONE;
                        S_NEWDATA <= I_DATA;
                    end if;

                elsif state = STATE_REQDATA_DONE then
                    data(S_nextTag) <= S_NEWDATA;
                    tags(S_nextTag).addr <= S_ADDR_TAG;
                    tags(S_nextTag).valid <= '1';
                    S_REQ_TAG_ID <= S_nextTag;
                    S_nextTag <= (S_nextTag + 1) mod CACHE_DEPTH;

                    if S_ADDR_BITS(4 downto 2) = "011" then
                        S_DATA <= S_NEWDATA(31 downto 0);
                    elsif S_ADDR_BITS(4 downto 2) = "010" then
                        S_DATA <= S_NEWDATA(63 downto 32);
                    elsif S_ADDR_BITS(4 downto 2) = "001" then
                        S_DATA <= S_NEWDATA(95 downto 64);
                    elsif S_ADDR_BITS(4 downto 2) = "000" then
                        S_DATA <= S_NEWDATA(127 downto 96);
                    elsif S_ADDR_BITS(4 downto 2) = "111" then
                        S_DATA <= S_NEWDATA(159 downto 128);
                    elsif S_ADDR_BITS(4 downto 2) = "110" then
                        S_DATA <= S_NEWDATA(191 downto 160);
                    elsif S_ADDR_BITS(4 downto 2) = "101" then
                        S_DATA <= S_NEWDATA(223 downto 192);
                    elsif S_ADDR_BITS(4 downto 2) = "100" then
                        S_DATA <= S_NEWDATA(255 downto 224);
                    end if;
                    S_CMDDONE <= '1';
                    S_READY <= '1';
                    state <= STATE_COMPLETE;

                elsif state = STATE_READDATA then
                    -- read the data from the tag id, accounting for byte offset ******************************
                    if S_ADDR_BITS(4 downto 2) = "011" then
                        S_DATA <= data(S_REQ_TAG_ID)(31 downto 0);
                    elsif S_ADDR_BITS(4 downto 2) = "010" then
                        S_DATA <= data(S_REQ_TAG_ID)(63 downto 32);
                    elsif S_ADDR_BITS(4 downto 2) = "001" then
                        S_DATA <= data(S_REQ_TAG_ID)(95 downto 64);
                    elsif S_ADDR_BITS(4 downto 2) = "000" then
                        S_DATA <= data(S_REQ_TAG_ID)(127 downto 96);
                    elsif S_ADDR_BITS(4 downto 2) = "111" then
                        S_DATA <= data(S_REQ_TAG_ID)(159 downto 128);
                    elsif S_ADDR_BITS(4 downto 2) = "110" then
                        S_DATA <= data(S_REQ_TAG_ID)(191 downto 160);
                    elsif S_ADDR_BITS(4 downto 2) = "101" then
                        S_DATA <= data(S_REQ_TAG_ID)(223 downto 192);
                    elsif S_ADDR_BITS(4 downto 2) = "100" then
                        S_DATA <= data(S_REQ_TAG_ID)(255 downto 224);
                    end if;
                    S_CMDDONE <= '1';
                    S_READY <= '1';
                    state <= STATE_COMPLETE;
                elsif state = STATE_WT_WRITE then
                    -- write 32bits into a cache line
                    if S_ADDR_BITS(4 downto 2) = "011" then
                        data(S_REQ_TAG_ID)(31 downto 0) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "010" then
                        data(S_REQ_TAG_ID)(63 downto 32) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "001" then
                        data(S_REQ_TAG_ID)(95 downto 64) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "000" then
                        data(S_REQ_TAG_ID)(127 downto 96) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "111" then
                        data(S_REQ_TAG_ID)(159 downto 128) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "110" then
                        data(S_REQ_TAG_ID)(191 downto 160) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "101" then
                        data(S_REQ_TAG_ID)(223 downto 192) <= S_RWDATA;
                    elsif S_ADDR_BITS(4 downto 2) = "100" then
                        data(S_REQ_TAG_ID)(255 downto 224) <= S_RWDATA;
                    end if;

                    state <= 0; --don't count as a request, short circuit to idle

                elsif state = STATE_COMPLETE then
                    pc_requests <= std_logic_vector(unsigned(pc_requests) + 1);
                    -- set as done?
                    state <= 0;
                end if;
            end if;
        end if;
    end process;

    O_ADDR <= S_ADDR;
    O_DATA <= S_DATA;
    O_REQ <= S_REQ;
    O_CMDDONE <= S_CMDDONE;
    O_READY <= S_READY;
    O_PC_requests <= pc_requests;
    O_PC_misses <= pc_misses;
end Behavioral;