----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
--
-- Create Date:    21:30:20 05/25/2013
-- Design Name:    i3c2 - Intelligent I2C Controller
-- Module Name:    i3c2 - Behavioral
-- Description:    The main CPU/logic
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity i3c2 is
    Generic( clk_divide : STD_LOGIC_VECTOR (7 downto 0));

    Port ( clk : in  STD_LOGIC;
           inst_address : out  STD_LOGIC_VECTOR (9 downto 0);
           inst_data : in  STD_LOGIC_VECTOR (8 downto 0);
           i2c_scl : out  STD_LOGIC := '1';
           i2c_sda_i : in  STD_LOGIC;
           i2c_sda_o : out  STD_LOGIC := '0';
           i2c_sda_t : out STD_LOGIC := '1';
           inputs : in  STD_LOGIC_VECTOR (15 downto 0);
           outputs : out  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
           reg_addr : out  STD_LOGIC_VECTOR (4 downto 0);
           reg_data : out  STD_LOGIC_VECTOR (7 downto 0);
           reg_write : out  STD_LOGIC;
           debug_scl : out  STD_LOGIC := '1';
           debug_sda : out  STD_LOGIC;
           error : out STD_LOGIC);
end i3c2;

architecture Behavioral of i3c2 is

    constant STATE_RUN       : std_logic_vector(3 downto 0) := "0000";
    constant STATE_DELAY     : std_logic_vector(3 downto 0) := "0001";
    constant STATE_I2C_START : std_logic_vector(3 downto 0) := "0010";
    constant STATE_I2C_BITS  : std_logic_vector(3 downto 0) := "0011";
    constant STATE_I2C_STOP  : std_logic_vector(3 downto 0) := "0100";
    signal   state           : std_logic_vector(3 downto 0) := STATE_RUN;

    constant OPCODE_JUMP      : std_logic_vector( 3 downto 0) := "0000";
    constant OPCODE_SKIPSET   : std_logic_vector( 3 downto 0) := "0001";
    constant OPCODE_SKIPCLEAR : std_logic_vector( 3 downto 0) := "0010";
    constant OPCODE_SET       : std_logic_vector( 3 downto 0) := "0011";
    constant OPCODE_CLEAR     : std_logic_vector( 3 downto 0) := "0100";
    constant OPCODE_I2C_READ  : std_logic_vector( 3 downto 0) := "0101";
    constant OPCODE_DELAY     : std_logic_vector( 3 downto 0) := "0110";
    constant OPCODE_SKIPACK   : std_logic_vector( 3 downto 0) := "0111";
    constant OPCODE_SKIPNACK  : std_logic_vector( 3 downto 0) := "1000";
    constant OPCODE_NOP       : std_logic_vector( 3 downto 0) := "1001";
    constant OPCODE_I2C_STOP  : std_logic_vector( 3 downto 0) := "1010";
    constant OPCODE_I2C_WRITE : std_logic_vector( 3 downto 0) := "1011";
    constant OPCODE_WRITELOW  : std_logic_vector( 3 downto 0) := "1100";
    constant OPCODE_WRITEHI   : std_logic_vector( 3 downto 0) := "1101";
    constant OPCODE_UNKNOWN   : std_logic_vector( 3 downto 0) := "1110";
    signal   opcode           : std_logic_vector( 3 downto 0);


    signal ack_flag      : std_logic := '0';
    signal skip          : std_logic := '1';   -- IGNORE THE FIRST INSTRUCTION

    -- I2C status
    signal i2c_doing_read : std_logic := '0';
    signal i2c_started    : std_logic := '0';
    signal i2c_bits_left  : unsigned(3 downto 0);

    -- counters
    signal pcnext         : unsigned(9 downto 0) := (others => '0');
    signal delay         : unsigned(15 downto 0);
    signal bitcount      : unsigned( 7 downto 0);

    -- Input/output data
    signal i2c_data  : std_logic_vector( 8 downto 0);

begin

-- |Opcode   | Instruction | Action
-- +---------+-------------+----------------------------------------
-- |00nnnnnnn| JUMP m      | Set PC to m (n = m/8)
-- |01000nnnn| SKIPCLEAR n | Skip if input n clear
-- |01001nnnn| SKIPSET n   | skip if input n set
-- |01010nnnn| CLEAR n     | Clear output n
-- |01011nnnn| SET n       | Set output n
-- |0110nnnnn| READ n      | Read to register n
-- |01110nnnn| DELAY m     | Delay m clock cycles (n = log2(m))
-- |011110000| SKIPNACK    | Skip if NACK is set
-- |011110001| SKIPACK     | Skip if ACK is set
-- |011110010| WRITELOW    | Write inputs 7 downto 0 to the I2C bus
-- |011110011| WRITEHI     | Write inputs 15 downto 8 to the I2C bus
-- |011110100| USER0       | User defined
-- |.........|             |
-- |011111110| USER9       | User defined
-- |011111111| STOP        | Send Stop on i2C bus
-- |1nnnnnnnn| WRITE n     | Output n on I2C bus

    opcode <= OPCODE_JUMP      when inst_data(8 downto 7) = "00"        else
              OPCODE_SKIPCLEAR when inst_data(8 downto 4) = "01000"     else
              OPCODE_SKIPSET   when inst_data(8 downto 4) = "01001"     else
              OPCODE_CLEAR     when inst_data(8 downto 4) = "01010"     else
              OPCODE_SET       when inst_data(8 downto 4) = "01011"     else
              OPCODE_I2C_READ  when inst_data(8 downto 5) = "0110"      else
              OPCODE_DELAY     when inst_data(8 downto 4) = "01110"     else
              OPCODE_SKIPACK   when inst_data(8 downto 0) = "011110000" else
              OPCODE_SKIPNACK  when inst_data(8 downto 0) = "011110001" else
              OPCODE_WRITELOW  when inst_data(8 downto 0) = "011110010" else
              OPCODE_WRITEHI   when inst_data(8 downto 0) = "011110011" else
              -- user codes can go here
              OPCODE_NOP        when inst_data(8 downto 0) = "011111110" else
              OPCODE_I2C_STOP   when inst_data(8 downto 0) = "011111111" else
              OPCODE_I2C_WRITE  when inst_data(8 downto 8) = "1"         else OPCODE_UNKNOWN;

    inst_address <= std_logic_vector(pcnext);

    debug_sda <= i2c_sda_i;
    i2c_sda_o <= '0';
    cpu: process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when STATE_I2C_START =>
                    i2c_started <= '1';
                    i2c_scl <= '1';
                    debug_scl <= '1';

                    if bitcount = unsigned("0" & clk_divide(clk_divide'high downto 1)) then
                        i2c_sda_t <= '0';
                    end if;

                    if bitcount = 0 then
                        state    <= STATE_I2C_BITS;
                        i2c_scl  <= '0';
                        debug_scl <= '0';
                        bitcount <= unsigned(clk_divide);
                    else
                        bitcount <= bitcount-1;
                    end if;


                when STATE_I2C_BITS => -- scl has always just lowered '0' on entry
                    -- set the data half way through clock low half of the cycle
                    if bitcount = unsigned(clk_divide) - unsigned("00" & clk_divide(clk_divide'high downto 2)) then
                        if i2c_data(8) = '0' then
                            i2c_sda_t <= '0';
                        else
                            i2c_sda_t <= '1';
                        end if;
                    end if;

                    -- raise the clock half way through
                    if bitcount = unsigned("0" & clk_divide(clk_divide'high downto 1)) then
                        i2c_scl <= '1';
                        debug_scl <= '1';
                        -- Input bits halfway  through the cycle
                        i2c_data <= i2c_data(7 downto 0) & i2c_sda_i;
                    end if;

                    -- lower the clock at the end of the cycle
                    if bitcount = 0 then
                        i2c_scl <= '0';
                        debug_scl <= '0';
                        if i2c_bits_left  = "000" then
                            i2c_scl <= '0';
                            debug_scl <= '0';
                            if i2c_doing_read = '1' then
                                reg_data  <= i2c_data(8 downto 1);
                                reg_write <= '1';
                            end if;
                            ack_flag <= NOT i2c_data(0);
                            state    <= STATE_RUN;
                            pcnext   <= pcnext+1;
                        else
                            i2c_bits_left  <= i2c_bits_left -1;
                        end if;
                        bitcount <= unsigned(clk_divide);
                    else
                        bitcount <= bitcount-1;
                    end if;


                when STATE_I2C_STOP =>
                    -- clock stays high, and data goes high half way through a bit
                    i2c_started <= '0';
                    if bitcount = unsigned(clk_divide) - unsigned("00" & clk_divide(clk_divide'high downto 2)) then
                        i2c_sda_t      <= '0';
                    end if;

                    if bitcount = unsigned("0" & clk_divide(clk_divide'high downto 1)) then
                        i2c_scl <= '1';
                        debug_scl <= '1';
                    end if;

                    if bitcount = unsigned("00" & clk_divide(clk_divide'high downto 2)) then
                        i2c_sda_t      <= '1';
                    end if;
                    if bitcount = 0 then
                        state    <= STATE_RUN;
                        pcnext   <= pcnext+1;
                    else
                        bitcount <= bitcount-1;
                    end if;

                when STATE_DELAY =>
                    if bitcount /= 0 then
                        bitcount <= bitcount -1;
                    else
                        if delay = 0 then
                            pcnext       <= pcnext+1;
                            state <= STATE_RUN;
                        else
                            delay <= delay-1;
                            bitcount <= unsigned(clk_divide) - 1;
                        end if;
                    end if;

                when STATE_RUN =>
                    reg_data     <= "XXXXXXXX";

                    if skip = '1'then
                        -- Do nothing for a cycle other than unset 'skip';
                        skip <= '0';
                        pcnext       <= pcnext+1;
                    else
                        case opcode is
                            when OPCODE_JUMP =>
                                -- Ignore the next instruciton while fetching the jump destination
                                skip <= '1';
                                pcnext <= unsigned(inst_data(6 downto 0)) & "000";

                            when OPCODE_I2C_WRITE =>
                                i2c_data       <= inst_data(7 downto 0) & "1";
                                bitcount       <= unsigned(clk_divide);
                                i2c_doing_read <= '0';
                                i2c_bits_left  <= "1000";
                                if i2c_started = '0' then
                                    state <= STATE_I2C_START;
                                else
                                    state <= STATE_I2C_BITS;
                                end if;

                            when OPCODE_I2C_READ =>
                                reg_addr       <= inst_data(4 downto 0);
                                i2c_data       <= x"FF" & "1";  -- keep the SDA pulled up while clocking in data & ACK
                                bitcount       <= unsigned(clk_divide);
                                i2c_bits_left  <= "1000";
                                i2c_doing_read <= '1';
                                if i2c_started = '0' then
                                    state <= STATE_I2C_START;
                                else
                                    state <= STATE_I2C_BITS;
                                end if;

                            when OPCODE_SKIPCLEAR =>
                                skip   <= inputs(to_integer(unsigned(inst_data(3 downto 0)))) xnor inst_data(4);
                                pcnext <= pcnext+1;

                            when OPCODE_SKIPSET =>
                                skip   <= inputs(to_integer(unsigned(inst_data(3 downto 0)))) xnor inst_data(4);
                                pcnext <= pcnext+1;

                            when OPCODE_CLEAR =>
                                outputs(to_integer(unsigned(inst_data(3 downto 0)))) <= inst_data(4);
                                pcnext <= pcnext+1;

                            when OPCODE_SET =>
                                outputs(to_integer(unsigned(inst_data(3 downto 0)))) <= inst_data(4);
                                pcnext <= pcnext+1;

                            when OPCODE_SKIPACK =>
                                skip   <= ack_flag;
                                pcnext <= pcnext+1;

                            when OPCODE_SKIPNACK =>
                                skip   <= not ack_flag;
                                pcnext <= pcnext+1;

                            when OPCODE_DELAY =>
                                state <= STATE_DELAY;
                                bitcount <= unsigned(clk_divide);
                                case inst_data(3 downto 0) is
                                    when "0000" => delay <= x"0001";
                                    when "0001" => delay <= x"0002";
                                    when "0010" => delay <= x"0004";
                                    when "0011" => delay <= x"0008";
                                    when "0100" => delay <= x"0010";
                                    when "0101" => delay <= x"0020";
                                    when "0110" => delay <= x"0040";
                                    when "0111" => delay <= x"0080";
                                    when "1000" => delay <= x"0100";
                                    when "1001" => delay <= x"0200";
                                    when "1010" => delay <= x"0400";
                                    when "1011" => delay <= x"0800";
                                    when "1100" => delay <= x"1000";
                                    when "1101" => delay <= x"2000";
                                    when "1110" => delay <= x"4000";
                                    when others => delay <= x"8000";
                                end case;

                            when OPCODE_I2C_STOP =>
                                bitcount <= unsigned(clk_divide);
                                state    <= STATE_I2C_STOP;

                            when OPCODE_NOP =>
                                pcnext       <= pcnext+1;
                            when others =>
                                error <= '1';
                        end case;
                    end if;

                when others =>
                    state  <= STATE_RUN;
                    pcnext <= (others => '0');
                    skip   <= '1';

            end case;
        end if;
    end process;
end Behavioral;
