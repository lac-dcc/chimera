-- This is the main state machine of the HyperRAM controller.
-- The purpose is to implement the HyperBus protocol, i.e.
-- to decode the Avalon Memory Map requests and generate the control
-- signals for the HyperRAM device.
--
-- Bit 31 of avm_address_i is used to indicate register space.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hyperram_ctrl is
   generic (
      G_LATENCY : integer
   );
   port (
      clk_i               : in  std_logic;
      rst_i               : in  std_logic;

      -- Avalon Memory Map
      avm_write_i         : in  std_logic;
      avm_read_i          : in  std_logic;
      avm_address_i       : in  std_logic_vector(31 downto 0);
      avm_writedata_i     : in  std_logic_vector(15 downto 0);
      avm_byteenable_i    : in  std_logic_vector(1 downto 0);
      avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      avm_readdata_o      : out std_logic_vector(15 downto 0);
      avm_readdatavalid_o : out std_logic;
      avm_waitrequest_o   : out std_logic;

      -- Statistics
      count_long_o        : out unsigned(31 downto 0);
      count_short_o       : out unsigned(31 downto 0);

      -- HyperBus control signals
      hb_rstn_o           : out std_logic;
      hb_csn_o            : out std_logic;
      hb_ck_ddr_o         : out std_logic_vector(1 downto 0);
      hb_dq_ddr_in_i      : in  std_logic_vector(15 downto 0);
      hb_dq_ddr_out_o     : out std_logic_vector(15 downto 0);
      hb_dq_oe_o          : out std_logic;
      hb_dq_ie_i          : in  std_logic;
      hb_rwds_ddr_out_o   : out std_logic_vector(1 downto 0);
      hb_rwds_oe_o        : out std_logic;
      hb_rwds_in_i        : in  std_logic;
      hb_read_o           : out std_logic
   );
end entity hyperram_ctrl;

architecture synthesis of hyperram_ctrl is

   type state_t is (
      INIT_ST,
      COMMAND_ADDRESS_ST,
      WAIT_ST,
      SAMPLE_RWDS_ST,
      LATENCY_ST,
      READ_ST,
      WRITE_ST,
      WRITE_BURST_ST,
      RECOVERY_ST
   );

   signal state : state_t;

   signal writedata         : std_logic_vector(15 downto 0);
   signal byteenable        : std_logic_vector(1 downto 0);
   signal read              : std_logic;
   signal config            : std_logic;
   signal burst_count       : integer range 0 to 255;
   signal command_address   : std_logic_vector(47 downto 0);
   signal ca_count          : integer range 0 to 3;
   signal latency_count     : integer range 0 to 15;
   signal read_clk_count    : integer range 0 to 256;
   signal read_return_count : integer range 0 to 255;
   signal write_clk_count   : integer range 0 to 255;
   signal recovery_count    : integer range 0 to 255;

   -- Decode Command/Address value
   constant R_CA_RW           : integer := 47;
   constant R_CA_AS           : integer := 46;
   constant R_CA_BURST        : integer := 45;
   subtype  R_CA_ADDR_MSB is natural range 44 downto 16;
   subtype  R_CA_RESERVED is natural range 15 downto  3;
   subtype  R_CA_ADDR_LSB is natural range  2 downto  0;

   -- Statistics
   signal count_long  : unsigned(31 downto 0);
   signal count_short : unsigned(31 downto 0);

begin

   p_fsm : process (clk_i)
   begin
      if rising_edge(clk_i) then
         hb_rstn_o           <= '1';
         hb_dq_oe_o          <= '0';
         hb_rwds_oe_o        <= '0';
         hb_read_o           <= '0';

         case state is
            when INIT_ST =>
               if avm_read_i = '1' or avm_write_i = '1' then
                  read        <= avm_read_i;
                  config      <= avm_address_i(31);
                  writedata   <= avm_writedata_i;
                  byteenable  <= avm_byteenable_i;
                  burst_count <= to_integer(unsigned(avm_burstcount_i));

                  command_address(R_CA_RW)       <= avm_read_i;
                  command_address(R_CA_AS)       <= avm_address_i(31);
                  command_address(R_CA_BURST)    <= '1';
                  command_address(R_CA_ADDR_MSB) <= '0' & avm_address_i(30 downto 3);
                  command_address(R_CA_RESERVED) <= "0000000000000";
                  command_address(R_CA_ADDR_LSB) <= avm_address_i(2 downto 0);

                  avm_waitrequest_o <= '1';
                  hb_csn_o          <= '0';
                  hb_dq_oe_o        <= '1';
                  ca_count          <= 2;
                  if avm_address_i(31) = '1' then
                     ca_count <= 3;
                  end if;

                  state <= COMMAND_ADDRESS_ST;
               end if;

            when COMMAND_ADDRESS_ST =>
               command_address <= command_address(31 downto 0) & writedata(15 downto 0);

               if ca_count > 0 then
                  hb_dq_oe_o  <= '1';
                  hb_ck_ddr_o <= "10";
                  ca_count    <= ca_count - 1;
               else
                  if config = '1' and read = '0' then
                     recovery_count <= 3;
                     state <= RECOVERY_ST;
                  else
                     state <= WAIT_ST;
                  end if;
               end if;

            when WAIT_ST =>
               state <= SAMPLE_RWDS_ST;

            when SAMPLE_RWDS_ST =>
               if hb_rwds_in_i = '1' then
                  latency_count <= 2*G_LATENCY - 4;
                  count_long <= count_long + 1;
               else
                  latency_count <= G_LATENCY - 4;
                  count_short <= count_short + 1;
               end if;
               state <= LATENCY_ST;

            when LATENCY_ST =>
               if latency_count > 0 then
                  latency_count <= latency_count - 1;
               else
                  if read = '1' then
                     read_clk_count    <= burst_count+1;
                     read_return_count <= burst_count;
                     hb_read_o         <= '1';
                     state             <= READ_ST;
                  else
                     write_clk_count <= burst_count;
                     hb_dq_oe_o      <= '1';
                     hb_rwds_oe_o    <= '1';
                     state           <= WRITE_ST;
                  end if;
               end if;

            when READ_ST =>
               hb_read_o <= '1';
               if read_clk_count > 0 then
                  read_clk_count <= read_clk_count - 1;
               else
                  hb_ck_ddr_o <= "00";
               end if;

               if hb_dq_ie_i = '1' then
                  read_return_count <= read_return_count - 1;
                  if read_return_count = 1 then
                     hb_csn_o       <= '1';
                     hb_ck_ddr_o    <= "00";
                     recovery_count <= 1;
                     state          <= RECOVERY_ST;
                  end if;
               end if;

            when WRITE_ST | WRITE_BURST_ST =>
               state             <= WRITE_BURST_ST;
               writedata         <= avm_writedata_i;
               byteenable        <= avm_byteenable_i;
               hb_dq_oe_o        <= '1';
               hb_rwds_oe_o      <= '1';
               avm_waitrequest_o <= '0';

               if avm_write_i = '1' or state = WRITE_ST then
                  hb_ck_ddr_o <= "10";
                  if write_clk_count > 0 then
                     write_clk_count <= write_clk_count - 1;
                     if write_clk_count = 1 then
                        recovery_count    <= 2;
                        hb_dq_oe_o        <= '0';
                        hb_rwds_oe_o      <= '0';
                        avm_waitrequest_o <= '1';
                        state             <= RECOVERY_ST;
                     end if;
                  end if;
               else
                  hb_ck_ddr_o <= "00";
               end if;

            when RECOVERY_ST =>
               hb_csn_o    <= '1';
               hb_ck_ddr_o <= "00";
               if recovery_count > 0 then
                  recovery_count <= recovery_count - 1;
               else
                  avm_waitrequest_o <= '0';
                  state             <= INIT_ST;
               end if;
         end case;

         if rst_i = '1' then
            avm_waitrequest_o   <= '1';
            state        <= INIT_ST;
            hb_rstn_o    <= '0';
            hb_ck_ddr_o  <= (others => '0');
            hb_csn_o     <= '1';
            hb_dq_oe_o   <= '0';
            hb_rwds_oe_o <= '0';
            count_long   <= (others => '0');
            count_short  <= (others => '0');
         end if;
      end if;
   end process p_fsm;

   avm_readdata_o      <= hb_dq_ddr_in_i;
   avm_readdatavalid_o <= hb_dq_ie_i when state = READ_ST else '0';

   hb_dq_ddr_out_o   <= avm_writedata_i when state = WRITE_BURST_ST else
                        command_address(47 downto 32);
   hb_rwds_ddr_out_o <= not byteenable when state = WRITE_ST or state = WRITE_BURST_ST else "00";

   -- Statistics
   count_long_o  <= count_long;
   count_short_o <= count_short;

end architecture synthesis;

