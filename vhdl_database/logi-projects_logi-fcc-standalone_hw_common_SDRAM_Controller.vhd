----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Create Date:    14:09:12 09/15/2013 
-- Module Name:    SDRAM_Controller - Behavioral 
-- Description:    Simple SDRAM controller for a Micron 48LC16M16 @ 100MHz
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
-- Performance is about
-- Writes 16 cycles = 6,250,000 writes/sec = 25.0MB/s (excluding refresh)
-- Reads  17 cycles = 5,882,352 reads/sec  = 23.5MB/s (excluding refresh)
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use IEEE.NUMERIC_STD.ALL;


entity SDRAM_Controller is
    Port ( clk           : in  STD_LOGIC;
           clk_mem       : in  STD_LOGIC;
           reset         : in  STD_LOGIC;
           
           -- Interface to issue reads or write data
           cmd_ready         : out STD_LOGIC;                     -- '1' when a new command will be acted on
           cmd_enable        : in  STD_LOGIC;                     -- Set to '1' to issue new command (only acted on when cmd_read = '1')
           cmd_wr            : in  STD_LOGIC;                     -- Is this a write?
           cmd_address       : in  STD_LOGIC_VECTOR(22 downto 0); -- address to read/write
           cmd_byte_enable   : in  STD_LOGIC_VECTOR(3 downto 0);  -- byte masks for the write command
           cmd_data_in       : in  STD_LOGIC_VECTOR(31 downto 0); -- data for the write command
           
           data_out          : out STD_LOGIC_VECTOR(31 downto 0); -- word read from SDRAM
           data_out_ready    : out STD_LOGIC;                     -- is new data ready?
           
           -- SDRAM signals
           SDRAM_CLK     : out   STD_LOGIC;
           SDRAM_CKE     : out   STD_LOGIC;
           SDRAM_CS      : out   STD_LOGIC;
           SDRAM_RAS     : out   STD_LOGIC;
           SDRAM_CAS     : out   STD_LOGIC;
           SDRAM_WE      : out   STD_LOGIC;
           SDRAM_DQM     : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_ADDR    : out   STD_LOGIC_VECTOR(12 downto 0);
           SDRAM_BA      : out   STD_LOGIC_VECTOR( 1 downto 0);
           SDRAM_DATA    : inout STD_LOGIC_VECTOR(15 downto 0));
end SDRAM_Controller;

architecture Behavioral of SDRAM_Controller is
   -- From page 37 of MT48LC16M16A2 datasheet
   -- Name (Function)       CS# RAS# CAS# WE# DQM  Addr    Data
   -- COMMAND INHIBIT (NOP)  H   X    X    X   X     X       X
   -- NO OPERATION (NOP)     L   H    H    H   X     X       X
   -- ACTIVE                 L   L    H    H   X  Bank/row   X
   -- READ                   L   H    L    H  L/H Bank/col   X
   -- WRITE                  L   H    L    L  L/H Bank/col Valid
   -- BURST TERMINATE        L   H    H    L   X     X     Active
   -- PRECHARGE              L   L    H    L   X   Code      X
   -- AUTO REFRESH           L   L    L    H   X     X       X 
   -- LOAD MODE REGISTER     L   L    L    L   X  Op-code    X 
   -- Write enable           X   X    X    X   L     X     Active
   -- Write inhibit          X   X    X    X   H     X     High-Z

   -- Here are the commands mapped to constants   
   constant CMD_UNSELECTED    : std_logic_vector(3 downto 0) := "1000";
   constant CMD_NOP           : std_logic_vector(3 downto 0) := "0111";
   constant CMD_ACTIVE        : std_logic_vector(3 downto 0) := "0011";
   constant CMD_READ          : std_logic_vector(3 downto 0) := "0101";
   constant CMD_WRITE         : std_logic_vector(3 downto 0) := "0100";
   constant CMD_TERMINATE     : std_logic_vector(3 downto 0) := "0110";
   constant CMD_PRECHARGE     : std_logic_vector(3 downto 0) := "0010";
   constant CMD_REFRESH       : std_logic_vector(3 downto 0) := "0001";
   constant CMD_LOAD_MODE_REG : std_logic_vector(3 downto 0) := "0000";

   constant MODE_REG          : std_logic_vector(12 downto 0) := 
    -- Reserved, wr bust, OpMode, CAS Latency (2), Burst Type, Burst Length (2)
         "000" &   "0"  &  "00"  &    "010"      &     "0"    &   "001";

   signal iob_command     : std_logic_vector( 3 downto 0) := CMD_NOP;
   signal iob_address     : std_logic_vector(12 downto 0) := (others => '0');
   signal iob_data        : std_logic_vector(15 downto 0) := (others => '0');
   signal iob_dqm         : std_logic_vector( 1 downto 0) := (others => '0');
   signal iob_cke         : std_logic := '0';
   signal iob_bank        : std_logic_vector( 1 downto 0) := (others => '0');
   
   attribute IOB: string;
   attribute IOB of iob_command: signal is "true";
   attribute IOB of iob_address: signal is "true";
   attribute IOB of iob_dqm    : signal is "true";
   attribute IOB of iob_cke    : signal is "true";
   attribute IOB of iob_bank   : signal is "true";
   attribute IOB of iob_data   : signal is "true";
   
   signal captured_data      : std_logic_vector(15 downto 0) := (others => '0');
   signal captured_data_last : std_logic_vector(15 downto 0) := (others => '0');
   signal sdram_din          : std_logic_vector(15 downto 0);
   attribute IOB of captured_data : signal is "true";
   
   type fsm_state is (s_startup,
                      s_idle_in_9,   
                      s_idle_in_8,   
                      s_idle_in_7,   
                      s_idle_in_6,   
                      s_idle_in_5, s_idle_in_4,   s_idle_in_3, s_idle_in_2, s_idle_in_1,
                      s_idle,
                      s_open_in_2, s_open_in_1,
                      s_write_1, s_write_2, s_write_3,
                      s_read_1,  s_read_2,  s_read_3,  s_read_4,  
                      s_precharge
                      );

   signal state              : fsm_state := s_startup;
   signal startup_wait_count : unsigned(15 downto 0) := to_unsigned(10100,16);  -- 10100
   
   signal refresh_count   : unsigned(9 downto 0) := (others => '0');
   signal pending_refresh : std_logic := '0';
   constant refresh_max   : unsigned(9 downto 0) := to_unsigned(3200000/8192-1,10);  -- 8192 refreshes every 64ms (@ 100MHz)
   
   signal addr_row         : std_logic_vector(12 downto 0);
   signal addr_col         : std_logic_vector(12 downto 0);
   signal addr_bank        : std_logic_vector( 1 downto 0);
   
   -- signals to hold the requested transaction
   signal save_wr          : std_logic := '0';
   signal save_row         : std_logic_vector(12 downto 0);
   signal save_bank        : std_logic_vector( 1 downto 0);
   signal save_col         : std_logic_vector(12 downto 0);
   signal save_d_in        : std_logic_vector(31 downto 0);
   signal save_byte_enable : std_logic_vector( 3 downto 0);
   
   signal iob_dq_hiz     : std_logic := '1';

   -- signals for when to read the data off of the bus
   signal data_ready_delay : std_logic_vector( 4 downto 0);
   
   signal ready_for_new   : std_logic := '0';
   signal got_transaction : std_logic := '0';
begin
   -- tell the outside world when we can accept a new transaction;
   cmd_ready <= ready_for_new;

   ----------------------------------------------------------------------------
   -- Seperate the address into row / bank / address
   -- fot the x16 part, columns are addr(8:0).
   -- for 32 bit (2 word bursts), the lowest bit will be controlled by the FSM
   ----------------------------------------------------------------------------
   -- for the logi-pi
   ----------------------------------------------------------------------------
   -- addr_row  <= cmd_address(22 downto 10);  
   -- addr_bank <= cmd_address( 9 downto  8);
   -- addr_col  <= cmd_address( 7 downto  0) & '0';   -- This changes for the x4, x8 or x16 parts.   
   ----------------------------------------------------------------------------
   --- for the papilio pro
   ----------------------------------------------------------------------------
   addr_row  <= cmd_address(21 downto  9);  
   addr_bank <= cmd_address( 8 downto  7);
   addr_col  <= "00000" & cmd_address( 6 downto  0) & '0';   -- This changes for the x4, x8 or x16 parts.   

   -----------------------------------------------------------
   -- Forward the SDRAM clock to the SDRAM chip - 180 degress 
   -- out of phase with the control signals (ensuring setup and holdup 
  -----------------------------------------------------------
 sdram_clk_forward : ODDR2
   generic map(DDR_ALIGNMENT => "NONE", INIT => '0', SRTYPE => "SYNC")
   port map (Q => sdram_clk, C0 => clk, C1 => not clk, CE => not reset, R => '0', S => '0', D0 => '0', D1 => '1');
	-- i have a doubt on how to wire the reset input to disable the clock output in that case ...
   -----------------------------------------------
   --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   --!! Ensure that all outputs are registered. !!
   --!! Check the pinout report to be sure      !!
   --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   -----------------------------------------------
   sdram_cke  <= iob_cke;
   sdram_CS   <= iob_command(3);
   sdram_RAS  <= iob_command(2);
   sdram_CAS  <= iob_command(1);
   sdram_WE   <= iob_command(0);
   sdram_dqm  <= iob_dqm;
   sdram_ba   <= iob_bank;
   sdram_addr <= iob_address;
   
iob_dq_g: for i in 0 to 15 generate
   begin
iob_dq_iob: IOBUF
   generic map (DRIVE => 12, IOSTANDARD => "LVTTL", SLEW => "FAST")
   port map ( O  => sdram_din(i),   -- Buffer output
              IO => sdram_data(i),  -- Buffer inout port (connect directly to top-level port)
              I  => iob_data(i),    -- Buffer input
              T  => iob_dq_hiz      -- 3-state enable input, high=input, low=output 
   );
end generate;
   
                                                 
-- === start of block ==========================
-- Use this two processes if you need to use a 
-- capture clock with a phase of between about 
-- 225 and 360 degrees (@100MHz). Without it you 
-- may not be able to make timing closure. You 
-- might also need to reduce the length of 
-- data_ready_delay by one to make up for the 
-- delay this adds
-- ===========================================
--capture_proc: process(clk_mem) 
--   begin
--      if rising_edge(clk_mem) then
--        captured_temp <= sdram_data;
--      end if;      
--   end process;
--capture_proc2: process(clk) 
--   begin
--      if falling_edge(clk) then
--        captured_data <= captured_temp;
--      end if;      
--   end process;
-- === end of block ==========================

-- === start of block ==========================
-- Use this if you need to use a capture clock 
-- with a phase of between 0 and 180 degrees.
-- For 0 and 180 degrees it is better to use the 
-- rising or falling edge of the main clock, 
-- saving the use of the clocking resource
-- ===========================================
--capture_proc: process(clk_mem) 
--   begin
--      if rising_edge(clk_mem) then
--        captured_data <= sdram_din;
--      end if;      
--   end process;
-- === end of block ==========================

-- === start of block ==========================
-- Use this if you can get away with a capture 
-- clock of either 0 or 180 degrees, saving the 
-- extra clock resource
-- ===========================================
capture_proc: process(clk) 
   begin
     if rising_edge(clk) then
         captured_data      <= sdram_din;
      end if;
   end process;
-- === end of block ==========================
   

main_proc: process(clk) 
   begin
      if rising_edge(clk) then
         captured_data_last <= captured_data;
      
         -- default outputs
         ------------------------------------------------
         -- Default state is to do nothing
         ------------------------------------------------
         iob_command     <= CMD_NOP;
         iob_address     <= (others => '0');
         iob_bank        <= (others => '0');
         iob_dqm         <= (others => '1');  

         -- countdown for initialisation
         startup_wait_count <= startup_wait_count-1;
         
         -- Logic to decide when to refresh
         if refresh_count /= refresh_max then
            refresh_count <= refresh_count + 1;
         else
            refresh_count <= (others => '0');
            if state /= s_startup then
               pending_refresh <= '1';
            end if;
         end if;
         
         ---------------------------------------------
         -- It we are ready for a new tranasction 
         -- and one is being presented, then accept it
         -- remember what we are reading or writing
         ---------------------------------------------
         if ready_for_new = '1' and cmd_enable = '1' then
            save_row         <= addr_row;
            save_bank        <= addr_bank;
            save_col         <= addr_col;
            save_wr          <= cmd_wr; 
            save_d_in        <= cmd_data_in;
            save_byte_enable <= cmd_byte_enable;
            got_transaction  <= '1';
            ready_for_new    <= '0';
         end if;

         ------------------------------------------------
         -- Read transactions are completed when the last
         -- word of data has been latched. Writes are 
         -- completed when the data has been sent
         ------------------------------------------------
         data_out_ready <= '0';
         if data_ready_delay(0) = '1' then
            data_out <= captured_data & captured_data_last;
            data_out_ready <= '1';
         end if;

         -- update shift registers used to present data read from memory
         data_ready_delay <= '0' & data_ready_delay(data_ready_delay'high downto 1);
         
         --
         case state is 
            when s_startup =>
               ------------------------------------------------------------------------
               -- This is the initial startup state, where we wait for at least 100us
               -- before starting the start sequence
               -- 
               -- The initialisation is sequence is 
               --  * de-assert SDRAM_CKE
               --  * 100us wait, 
               --  * assert SDRAM_CKE
               --  * wait at least one cycle, 
               --  * PRECHARGE
               --  * wait 2 cycles
               --  * REFRESH, 
               --  * tREF wait
               --  * REFRESH, 
               --  * tREF wait 
               --  * LOAD_MODE_REG 
               --  * 2 cycles wait
               ------------------------------------------------------------------------
                  iob_CKE <= '1';
               
               if startup_wait_count = 21 then      
                   -- ensure all rows are closed
                  iob_command     <= CMD_PRECHARGE;
                  iob_address(10) <= '1';  -- all banks
                  iob_bank        <= (others => '0');
               elsif startup_wait_count = 18 then   
                  -- these refreshes need to be at least tREF (66ns) apart
                  iob_command     <= CMD_REFRESH;
               elsif startup_wait_count = 11 then
                  iob_command     <= CMD_REFRESH;
               elsif startup_wait_count = 4 then    
                  -- Now load the mode register
                  iob_command     <= CMD_LOAD_MODE_REG;
                  iob_address     <= MODE_REG;
               else
                  iob_command     <= CMD_NOP;
               end if;

               pending_refresh    <= '0';

               if startup_wait_count = 0 then
                  state           <= s_idle;
                  ready_for_new   <= '1';
                  got_transaction <= '0';
               end if;
            when s_idle_in_9 => state <= s_idle_in_8;
            when s_idle_in_8 => state <= s_idle_in_7;
            when s_idle_in_7 => state <= s_idle_in_6;
            when s_idle_in_6 => state <= s_idle_in_5;
            when s_idle_in_5 => state <= s_idle_in_4;
            when s_idle_in_4 => state <= s_idle_in_3;
            when s_idle_in_3 => state <= s_idle_in_2;
            when s_idle_in_2 => state <= s_idle_in_1;
            when s_idle_in_1 => state <= s_idle;

            when s_idle =>
               -- Priority is to issue a refresh if one is outstanding
               if pending_refresh = '1' then
                 ------------------------------------------------------------------------
                  -- Start the refresh cycle. 
                  -- This tasks tRFC (66ns), so 6 idle cycles are needed @ 100MHz
                  ------------------------------------------------------------------------
                  state            <= s_idle_in_6;
                  iob_command      <= CMD_REFRESH;
                  pending_refresh  <= '0';
               elsif got_transaction = '1' then
                  --------------------------------
                  -- Start the read or write cycle. 
                  -- First task is to open the row
                  --------------------------------
                  state       <= s_open_in_2;
                  iob_command <= CMD_ACTIVE;
                  iob_address <= save_row;
                  iob_bank    <= save_bank;
               end if;               
            ------------------------------------------
            -- Opening the row ready for read or write
            ------------------------------------------
            when s_open_in_2 => state <= s_open_in_1;

            when s_open_in_1 =>
               -- still waiting for row to open
               if save_wr = '1' then
                  state              <= s_write_1;
                  iob_dq_hiz         <= '0';
                  iob_data           <= save_d_in(15 downto 0); -- get the DQ bus out of HiZ early
               else
                  iob_dq_hiz         <= '1';
                  state              <= s_read_1;
                  ready_for_new      <= '1'; -- we will be ready for a new transaction next cycle!
                  got_transaction    <= '0';
               end if;

            ----------------------------------
            -- Processing the read transaction
            ----------------------------------
            when s_read_1 =>
               state              <= s_read_2;
               iob_command     <= CMD_READ;
               iob_address     <= save_col; 
               iob_address(10) <= '0'; -- A10 actually matters - it selects auto prefresh
               iob_bank        <= save_bank;
               
               -- Schedule reading the data values off the bus
               data_ready_delay(data_ready_delay'high)   <= '1';
               
               -- Set the data masks to read all bytes
               iob_dqm         <= (others => '0');    -- For CAS = 2
               
            when s_read_2 =>
               state              <= s_read_3;
               -- Set the data masks to read all bytes
               iob_dqm         <= (others => '0');   -- For CAS = 2 or CAS = 3

            when s_read_3 => state <= s_read_4;
               -- iob_dqm         <= (others => '0');    -- For CAS = 3
            when s_read_4 => state <= s_precharge;

            -------------------------------------------------------------------
            -- Processing the write transaction
            -------------------------------------------------------------------
            when s_write_1 =>
               state              <= s_write_2;
               iob_command     <= CMD_WRITE;
               iob_address     <= save_col; 
               iob_address(10) <= '0'; -- A10 actually matters - it selects auto prefresh
               iob_bank        <= save_bank;
               iob_dqm         <= NOT save_byte_enable(1 downto 0);    
               iob_data        <= save_d_in(15 downto 0);
               ready_for_new   <= '1';
               got_transaction <= '0';
            when s_write_2 =>
               state           <= s_write_3;
               iob_dqm         <= NOT save_byte_enable(3 downto 2);    
               iob_data        <= save_d_in(31 downto 16);
         
            when s_write_3 =>  -- must wait tRDL, hence the extra idle state
               iob_dq_hiz         <= '1';
               state              <= s_precharge;

            -------------------------------------------------------------------
            -- Closing the row off (this closes all banks)
            -------------------------------------------------------------------
            when s_precharge =>
               state           <= s_idle_in_9;
               iob_command     <= CMD_PRECHARGE;
               iob_address(10) <= '1'; -- A10 actually matters - it selects all banks or just one

            -------------------------------------------------------------------
            -- We should never get here, but if we do then reset the memory
            -------------------------------------------------------------------
            when others => 
               state <= s_startup;
               ready_for_new       <= '0';
               startup_wait_count  <= to_unsigned(10100,16);
         end case;
         
         -- Sync reset
         if reset = '1' then
            state               <= s_startup;
            ready_for_new       <= '0';
            startup_wait_count  <= to_unsigned(10100,16);
         end if;
      end if;      
   end process;
end Behavioral;