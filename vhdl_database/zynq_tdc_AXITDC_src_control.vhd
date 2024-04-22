----------------------------------------------------------------------------------
-- TDC Control Unit
-- Version: 2.0 (based on 1.0)
--
-- Author: Michel Adamic
-- Created: 27.9.2019
-- 28.9.2019 -> 64-bit data (added trigger counter) + TDC enable controlled by FSM
--
-- Finite state machine.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control is
   generic (
      ADDR_WIDTH : integer := 11    -- 2k data points
   );
   Port ( 
      clk : in STD_LOGIC;
      timestamp : in STD_LOGIC_VECTOR (31 downto 0); -- incoming timestamp
      valid : in STD_LOGIC;   -- TDC valid
      DLenable : out STD_LOGIC;  -- delay line enable
      
      addr : out STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);   -- BRAM address
      data : out STD_LOGIC_VECTOR (63 downto 0);   -- BRAM data
      we : out STD_LOGIC_VECTOR (7 downto 0);   -- write enable
      
      -- trigger counter input/output
      trigger_out : out std_logic_vector (ADDR_WIDTH-1 downto 0);
      trigger_in : in std_logic_vector (ADDR_WIDTH-1 downto 0);
      
      -- control signals
      run : in std_logic;  -- collect data
      clr : in std_logic;  -- clear BRAM
      rdy : out std_logic; -- FSM ready
      full : out std_logic -- BRAM full
      );
end control;

architecture RTL of control is
   constant ADDR_MAX : integer := 2**ADDR_WIDTH - 1;  -- highest address
   constant emptyBits : std_logic_vector(31-ADDR_WIDTH downto 0) := (others => '0');   -- zeros to fill out the remaining data bits
   
   signal addr_cnt : unsigned(addr'range) := (others => '0');  -- address counter 
   
   -- extra clock cycle latency for BRAM signals
   signal addr_e : std_logic_vector(addr'range);
   signal data_e : std_logic_vector(31 downto 0);
   signal we_e : std_logic_vector(we'range);
   
   signal valid_e : std_logic;
   
   type StateType is (  -- FSM states
      INIT,
      IDLE,
      RUNNING,
      RUN_DONE,
      CLEAR,
      CLR_DONE
   );
   signal state: StateType := INIT;
   signal state_e : StateType;
   
begin

StateMachine: process(clk)
begin
   if rising_edge(clk) then
      case state is
      
         when IDLE =>
            we_e <= x"00";
            data_e <= (others => '0');
            
            rdy <= '1';
            if run = '1' then -- trigger
               state <= RUNNING;
            end if;
            if clr = '1' then -- clear
               state <= CLEAR;
               addr_cnt <= (others => '0');  -- start clearing from address 0
            end if;
               
         when RUNNING =>   -- collect data
            if valid = '1' then  -- timestamp arrived
               we_e <= x"FF";
               data_e <= timestamp;
               addr_cnt <= addr_cnt + 1;
               if addr_cnt = ADDR_MAX then   -- buffer full
                  state <= RUN_DONE;
                  full <= '1';
               end if;
            else
               we_e <= x"00";
               data_e <= (others => '0');
            end if;
            
            rdy <= '0';
            if run = '0' then -- stop collecting data
               state <= IDLE;
            end if;
            
         when RUN_DONE =>  -- wait for reset of RUN bit
            we_e <= x"00";
            data_e <= (others => '0');
            
            rdy <= '0';          
            if run = '0' then
               state <= IDLE;
            end if;
            
         when CLEAR =>
            we_e <= x"FF";
            data_e <= (others => '0');
            addr_cnt <= addr_cnt + 1;
            
            rdy <= '0';
            if addr_cnt = ADDR_MAX then   -- all cleared
               state <= CLR_DONE;
               full <= '0';
            end if;
            
         when CLR_DONE =>  -- wait for reset of CLR bit
            we_e <= x"00";
            data_e <= (others => '0');
               
            rdy <= '0';          
            if clr = '0' then
               state <= IDLE;
            end if;
            
         when others =>    -- INIT
            we_e <= x"00";
            data_e <= (others => '0');
            addr_cnt <= (others => '0');
            
            rdy <= '0';
            full <= '0';
            state <= IDLE;
         
      end case;
      
      -- Output extra clock latency logic
      addr_e <= std_logic_vector(addr_cnt);
      addr <= addr_e;
      we <= we_e;
      if (state_e = RUNNING) and (valid_e = '1') then
         data <= emptyBits & trigger_in & data_e;
      else
         data <= (others => '0');
      end if;
      
      state_e <= state;
      valid_e <= valid;
      
   end if;
end process;

trigger_out <= std_logic_vector(addr_cnt) when state = RUNNING else
               (others => '0');
               
DLenable <= '1' when state = RUNNING else
            '0';
               
end RTL;
