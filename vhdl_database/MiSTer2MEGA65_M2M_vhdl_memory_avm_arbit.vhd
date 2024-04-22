library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

-- This arbitrates fairly between two Masters connected to a single Slave

entity avm_arbit is
   generic (
      G_FREQ_HZ       : integer := 100_000_000;  -- 100 MHz
      G_ADDRESS_SIZE  : integer;
      G_DATA_SIZE     : integer
   );
   port (
      clk_i                  : in  std_logic;
      rst_i                  : in  std_logic;

      -- Slave interface 0 (input)
      s0_avm_write_i         : in  std_logic;
      s0_avm_read_i          : in  std_logic;
      s0_avm_address_i       : in  std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      s0_avm_writedata_i     : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      s0_avm_byteenable_i    : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      s0_avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      s0_avm_readdata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      s0_avm_readdatavalid_o : out std_logic;
      s0_avm_waitrequest_o   : out std_logic;

      -- Slave interface 1 (input)
      s1_avm_write_i         : in  std_logic;
      s1_avm_read_i          : in  std_logic;
      s1_avm_address_i       : in  std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      s1_avm_writedata_i     : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      s1_avm_byteenable_i    : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      s1_avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      s1_avm_readdata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      s1_avm_readdatavalid_o : out std_logic;
      s1_avm_waitrequest_o   : out std_logic;

      -- Master interface (output)
      m_avm_write_o          : out std_logic;
      m_avm_read_o           : out std_logic;
      m_avm_address_o        : out std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      m_avm_writedata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_byteenable_o     : out std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      m_avm_burstcount_o     : out std_logic_vector(7 downto 0);
      m_avm_readdata_i       : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_readdatavalid_i  : in  std_logic;
      m_avm_waitrequest_i    : in  std_logic
   );
end entity avm_arbit;

architecture synthesis of avm_arbit is

   signal s0_active_req : std_logic;
   signal s1_active_req : std_logic;

   signal s0_active_grant : std_logic := '0';
   signal s1_active_grant : std_logic := '0';
   signal active_grants   : std_logic_vector(1 downto 0);

   signal s0_last : std_logic;
   signal s1_last : std_logic;

   signal last_grant : std_logic := '0';

   signal burstcount : std_logic_vector(7 downto 0);

   signal cnt                 : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s0_active_grant : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s1_active_grant : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s0_waiting      : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s1_waiting      : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s0_waiting_tot  : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s1_waiting_tot  : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s0_waiting_max  : integer range 0 to G_FREQ_HZ-1;
   signal cnt_s1_waiting_max  : integer range 0 to G_FREQ_HZ-1;

begin

   p_cnt : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if s0_active_req = '1' and s0_active_grant = '0' then
            cnt_s0_waiting     <= cnt_s0_waiting + 1;
            cnt_s0_waiting_tot <= cnt_s0_waiting_tot + 1;
         end if;
         if s1_active_req = '1' and s1_active_grant = '0' then
            cnt_s1_waiting     <= cnt_s1_waiting + 1;
            cnt_s1_waiting_tot <= cnt_s1_waiting_tot + 1;
         end if;

         if s0_active_grant = '1' then
            if cnt_s0_waiting > cnt_s0_waiting_max then
               cnt_s0_waiting_max <= cnt_s0_waiting;
            end if;
            cnt_s0_waiting      <= 0;
            cnt_s0_active_grant <= cnt_s0_active_grant + 1;
         end if;
         if s1_active_grant = '1' then
            if cnt_s1_waiting > cnt_s1_waiting_max then
               cnt_s1_waiting_max <= cnt_s1_waiting;
            end if;
            cnt_s1_waiting      <= 0;
            cnt_s1_active_grant <= cnt_s1_active_grant + 1;
         end if;

         if rst_i = '1' or cnt = G_FREQ_HZ-1 then
            cnt_s0_waiting      <= 0;
            cnt_s1_waiting      <= 0;
            cnt_s0_waiting_tot  <= 0;
            cnt_s1_waiting_tot  <= 0;
            cnt_s0_waiting_max  <= 0;
            cnt_s1_waiting_max  <= 0;
            cnt_s0_active_grant <= 0;
            cnt_s1_active_grant <= 0;
            cnt                 <= 0;
         else
            cnt <= cnt + 1;
         end if;
      end if;
   end process p_cnt;

   assert not (s0_active_grant and s1_active_grant);

   s0_avm_waitrequest_o <= m_avm_waitrequest_i or not s0_active_grant;
   s1_avm_waitrequest_o <= m_avm_waitrequest_i or not s1_active_grant;

   s0_active_req <= s0_avm_write_i or s0_avm_read_i;
   s1_active_req <= s1_avm_write_i or s1_avm_read_i;

   p_last : process (all)
   begin
      s0_last <= '0';
      s1_last <= '0';

      if s0_active_grant = '1' then
         if burstcount = X"00" or (burstcount = X"01" and s0_avm_readdatavalid_o = '1') or (burstcount = X"01" and s0_avm_write_i = '1') then
            if s0_active_req = '0' or
               (burstcount = X"01" and s0_avm_readdatavalid_o = '1' and s0_avm_waitrequest_o = '1') or
               (burstcount = X"01" and s0_avm_write_i = '1' and s0_avm_waitrequest_o = '0') or
               (s0_avm_write_i = '1' and s0_avm_waitrequest_o = '0' and s0_avm_burstcount_i = X"01") then
               s0_last <= '1';
            end if;
         end if;
      end if;

      if s1_active_grant = '1' then
         if burstcount = X"00" or (burstcount = X"01" and s1_avm_readdatavalid_o = '1') or (burstcount = X"01" and s1_avm_write_i = '1') then
            if s1_active_req = '0' or
               (burstcount = X"01" and s1_avm_readdatavalid_o = '1' and s1_avm_waitrequest_o = '1') or
               (burstcount = X"01" and s1_avm_write_i = '1' and s1_avm_waitrequest_o = '0') or
               (s1_avm_write_i = '1' and s1_avm_waitrequest_o = '0' and s1_avm_burstcount_i = X"01") then
               s1_last <= '1';
            end if;
         end if;
      end if;
   end process p_last;

   p_burstcount : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if s0_avm_write_i = '1' and s0_avm_waitrequest_o = '0' and burstcount = 0 then
            burstcount <= std_logic_vector(unsigned(s0_avm_burstcount_i) - 1);
         elsif s0_avm_read_i and not s0_avm_waitrequest_o then
            burstcount <= s0_avm_burstcount_i;
         elsif s1_avm_write_i = '1' and s1_avm_waitrequest_o = '0' and burstcount = 0 then
            burstcount <= std_logic_vector(unsigned(s1_avm_burstcount_i) - 1);
         elsif s1_avm_read_i and not s1_avm_waitrequest_o then
            burstcount <= s1_avm_burstcount_i;
         else
            if (s0_avm_write_i and not s0_avm_waitrequest_o) or
               s0_avm_readdatavalid_o or
               (s1_avm_write_i and not s1_avm_waitrequest_o) or
               s1_avm_readdatavalid_o then
               burstcount <= std_logic_vector(unsigned(burstcount) - 1);
            end if;
         end if;

         if rst_i = '1' then
            burstcount <= X"00";
         end if;
      end if;
   end process p_burstcount;

   active_grants <= s1_active_grant & s0_active_grant;

   p_grant : process (clk_i)
   begin
      if rising_edge(clk_i) then

         -- Last clock cycle in a burst transfer
         if s0_last = '1' then
            s0_active_grant <= '0';
         end if;
         if s1_last = '1' then
            s1_active_grant <= '0';
         end if;

         case active_grants is
            when "00" =>
               if s0_active_req = '1' and (last_grant = '1' or s1_active_req = '0') then
                  s0_active_grant <= '1';
                  last_grant <= '0';
               end if;
               if s1_active_req = '1' and (last_grant = '0' or s0_active_req = '0') then
                  s1_active_grant <= '1';
                  last_grant <= '1';
               end if;

            when "01" =>
               if s0_last = '1' then
                  if s0_active_req = '1' and not (last_grant = '0' and s1_active_req = '1') then
                     s0_active_grant <= '1';
                     last_grant <= '0';
                  elsif s1_active_req = '1' and not (last_grant = '1' and s0_active_req = '1') then
                     s1_active_grant <= '1';
                     s0_active_grant <= '0';
                     last_grant <= '1';
                  end if;
               end if;

            when "10" =>
               if s1_last = '1' then
                  if s1_active_req = '1' and not (last_grant = '1' and s0_active_req = '1') then
                     s1_active_grant <= '1';
                     last_grant <= '1';
                  elsif s0_active_req = '1' and not (last_grant = '0' and s1_active_req = '1') then
                     s0_active_grant <= '1';
                     s1_active_grant <= '0';
                     last_grant <= '0';
                  end if;
               end if;

            when others =>
               report "S0 and S1 both active"
                  severity failure;
         end case;

         if rst_i = '1' then
            s0_active_grant <= '0';
            s1_active_grant <= '0';
            last_grant      <= '1';
         end if;
      end if;
   end process p_grant;

   m_avm_write_o      <= s0_avm_write_i and s0_active_grant when last_grant = '0' else
                         s1_avm_write_i and s1_active_grant;
   m_avm_read_o       <= s0_avm_read_i and s0_active_grant  when last_grant = '0' else
                         s1_avm_read_i and s1_active_grant;
   m_avm_address_o    <= s0_avm_address_i    when last_grant = '0' else s1_avm_address_i;
   m_avm_writedata_o  <= s0_avm_writedata_i  when last_grant = '0' else s1_avm_writedata_i;
   m_avm_byteenable_o <= s0_avm_byteenable_i when last_grant = '0' else s1_avm_byteenable_i;
   m_avm_burstcount_o <= s0_avm_burstcount_i when last_grant = '0' else s1_avm_burstcount_i;

   s0_avm_readdata_o      <= m_avm_readdata_i;
   s0_avm_readdatavalid_o <= m_avm_readdatavalid_i when last_grant = '0' else '0';

   s1_avm_readdata_o      <= m_avm_readdata_i;
   s1_avm_readdatavalid_o <= m_avm_readdatavalid_i when last_grant = '1' else '0';

end architecture synthesis;

