-- This is the HyperRAM "configurator".
-- It performs two functions:
-- * Wait until the HyperRAM device is operational after reset.
-- * Perform a write to configuration register 0 to set latency mode.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hyperram_config is
   generic (
      G_LATENCY : integer
   );
   port (
      clk_i                 : in  std_logic;
      rst_i                 : in  std_logic;

      -- Slave interface (input). Connect to client.
      s_avm_write_i         : in  std_logic;
      s_avm_read_i          : in  std_logic;
      s_avm_address_i       : in  std_logic_vector(31 downto 0);
      s_avm_writedata_i     : in  std_logic_vector(15 downto 0);
      s_avm_byteenable_i    : in  std_logic_vector(1 downto 0);
      s_avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      s_avm_readdata_o      : out std_logic_vector(15 downto 0);
      s_avm_readdatavalid_o : out std_logic;
      s_avm_waitrequest_o   : out std_logic;

      -- Master interface (output). Connect to controller.
      m_avm_write_o         : out std_logic;
      m_avm_read_o          : out std_logic;
      m_avm_address_o       : out std_logic_vector(31 downto 0);
      m_avm_writedata_o     : out std_logic_vector(15 downto 0);
      m_avm_byteenable_o    : out std_logic_vector(1 downto 0);
      m_avm_burstcount_o    : out std_logic_vector(7 downto 0);
      m_avm_readdata_i      : in  std_logic_vector(15 downto 0);
      m_avm_readdatavalid_i : in  std_logic;
      m_avm_waitrequest_i   : in  std_logic
   );
end entity hyperram_config;

architecture synthesis of hyperram_config is

   constant C_INIT_DELAY : integer := 150*100; -- 150 us @ 100 MHz.

   -- Decode configuration register 0
   constant R_C0_DPD          : integer := 15;
   subtype  R_C0_DRIVE    is natural range 14 downto 12;
   subtype  R_C0_RESERVED is natural range 11 downto  8;
   subtype  R_C0_LATENCY  is natural range  7 downto  4;
   constant R_C0_FIXED        : integer :=  3;
   constant R_C0_HYBRID       : integer :=  2;
   subtype  R_C0_BURST    is natural range  1 downto  0;

   type state_t is (
      INIT_ST,
      CONFIG_ST,
      READY_ST
   );

   signal state : state_t := INIT_ST;

   signal init_counter : integer range 0 to C_INIT_DELAY;

   signal cfg_readdata      : std_logic_vector(15 downto 0);
   signal cfg_readdatavalid : std_logic;
   signal cfg_waitrequest   : std_logic;
   signal cfg_write         : std_logic;
   signal cfg_read          : std_logic;
   signal cfg_address       : std_logic_vector(31 downto 0);
   signal cfg_writedata     : std_logic_vector(15 downto 0);
   signal cfg_byteenable    : std_logic_vector(1 downto 0);
   signal cfg_burstcount    : std_logic_vector(7 downto 0);

begin

   p_fsm : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if m_avm_waitrequest_i = '0' then
            cfg_write <= '0';
            cfg_read  <= '0';
         end if;

         case state is
            when INIT_ST =>
               if init_counter > 0 then
                  init_counter <= init_counter - 1;
               else
                  report "Init completed";
                  state <= CONFIG_ST;
               end if;

            when CONFIG_ST =>
               -- Write to configuration register 0
               -- See section 5.2.1 of the datasheet.
               -- The drive strength is chosen to the lowest resistance, i.e. strongest drive strength.
               -- This improves signal quality (lower rise and fall times) and therefore larger timing margin.
               -- The latency mode is set to variable. This results in lower latency on average.
               cfg_write       <= '1';
               cfg_read        <= '0';
               cfg_address     <= (others => '0');
               cfg_address(18 downto 11) <= X"01";
               cfg_address(31) <= '1';
               cfg_writedata(R_C0_DPD)      <= '1';    -- normal (default)
               cfg_writedata(R_C0_DRIVE)    <= "111";  -- 19 ohms (maximal drive strength)
               cfg_writedata(R_C0_RESERVED) <= "1111";
               cfg_writedata(R_C0_LATENCY)  <= std_logic_vector(to_unsigned(G_LATENCY, 4) - 5);
               cfg_writedata(R_C0_FIXED)    <= '0';    -- variable
               cfg_writedata(R_C0_HYBRID)   <= '1';    -- legacy (default)
               cfg_writedata(R_C0_BURST)    <= "11";   -- 32 bytes (default)
               cfg_byteenable  <= "11";
               cfg_burstcount  <= X"01";

               if cfg_write = '1' and m_avm_waitrequest_i = '0' then
                  state <= READY_ST;
               end if;

            when READY_ST =>
               -- Stay here forever after (or until reset)
               null;

         end case;

         if rst_i = '1' then
            cfg_write    <= '0';
            cfg_read     <= '0';
            init_counter <= C_INIT_DELAY;
            state        <= INIT_ST;
         end if;
      end if;
   end process p_fsm;

   m_avm_write_o         <= s_avm_write_i         when state = READY_ST else cfg_write;
   m_avm_read_o          <= s_avm_read_i          when state = READY_ST else cfg_read;
   m_avm_address_o       <= s_avm_address_i       when state = READY_ST else cfg_address;
   m_avm_writedata_o     <= s_avm_writedata_i     when state = READY_ST else cfg_writedata;
   m_avm_byteenable_o    <= s_avm_byteenable_i    when state = READY_ST else cfg_byteenable;
   m_avm_burstcount_o    <= s_avm_burstcount_i    when state = READY_ST else cfg_burstcount;
   s_avm_readdata_o      <= m_avm_readdata_i      when state = READY_ST else (others => '0');
   s_avm_readdatavalid_o <= m_avm_readdatavalid_i when state = READY_ST else '0';
   s_avm_waitrequest_o   <= m_avm_waitrequest_i   when state = READY_ST else '1';

end architecture synthesis;

