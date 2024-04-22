-- This module inserts empty wait cycles into an Avalon Memory Map stream.
-- The throughput is 1 - 1/G_PAUSE.
-- So a value of 4 results in a 75% throughput.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity avm_pause is
   generic (
      G_REQ_PAUSE    : integer;
      G_RESP_PAUSE   : integer;
      G_ADDRESS_SIZE : integer; -- Number of bits
      G_DATA_SIZE    : integer  -- Number of bits
   );
   port (
      clk_i                 : in  std_logic;
      rst_i                 : in  std_logic;
      s_avm_write_i         : in  std_logic;
      s_avm_read_i          : in  std_logic;
      s_avm_address_i       : in  std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      s_avm_writedata_i     : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      s_avm_byteenable_i    : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      s_avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      s_avm_readdata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      s_avm_readdatavalid_o : out std_logic;
      s_avm_waitrequest_o   : out std_logic;
      m_avm_write_o         : out std_logic;
      m_avm_read_o          : out std_logic;
      m_avm_address_o       : out std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      m_avm_writedata_o     : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_byteenable_o    : out std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      m_avm_burstcount_o    : out std_logic_vector(7 downto 0);
      m_avm_readdata_i      : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      m_avm_readdatavalid_i : in  std_logic;
      m_avm_waitrequest_i   : in  std_logic
   );
end entity avm_pause;

architecture synthesis of avm_pause is

   signal rd_burstcount : integer range 0 to 255;
   signal cnt : integer range 0 to G_REQ_PAUSE := 0;
   signal allow : std_logic;

   type read_resp_t is array (0 to G_RESP_PAUSE) of std_logic_vector(G_DATA_SIZE downto 0);
   signal read_resp : read_resp_t;

begin

   ------------------
   -- Handle request
   ------------------

   p_cnt : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if G_REQ_PAUSE > 0 then
            if (s_avm_write_i = '1' or s_avm_read_i = '1') and cnt > 0 then
               cnt <= cnt - 1;
            else
               cnt <= G_REQ_PAUSE;
            end if;

            if rst_i = '1' then
               cnt <= G_REQ_PAUSE;
            end if;
         end if;
      end if;
   end process p_cnt;

   p_rd_burstcount : process (clk_i)
   begin
      if rising_edge(clk_i) then
         if s_avm_readdatavalid_o then
            assert rst_i = '1' or rd_burstcount /= 0
               report "s_avm_readdatavalid_o asserted when rd_burstcount = 0";
            rd_burstcount <= rd_burstcount - 1;
         end if;

         if s_avm_read_i and not s_avm_waitrequest_o then
            rd_burstcount <= to_integer(s_avm_burstcount_i);
         end if;

         if rst_i = '1' then
            rd_burstcount <= 0;
         end if;
      end if;
   end process p_rd_burstcount;


   allow <= '1' when cnt = 0 or G_REQ_PAUSE = 0 else '0';

   m_avm_write_o         <= s_avm_write_i and allow when rd_burstcount = 0 else '0';
   m_avm_read_o          <= s_avm_read_i and allow when rd_burstcount = 0 else '0';
   m_avm_address_o       <= s_avm_address_i;
   m_avm_writedata_o     <= s_avm_writedata_i;
   m_avm_byteenable_o    <= s_avm_byteenable_i;
   m_avm_burstcount_o    <= s_avm_burstcount_i;
   s_avm_waitrequest_o   <= '1' when rd_burstcount /= 0 else
                             m_avm_waitrequest_i or not allow;

   -------------------
   -- Handle response
   -------------------

   read_resp(0)(G_DATA_SIZE-1 downto 0) <= m_avm_readdata_i;
   read_resp(0)(G_DATA_SIZE)            <= m_avm_readdatavalid_i;

   gen: for i in 1 to G_RESP_PAUSE generate
      p_resp : process (clk_i)
      begin
         if rising_edge(clk_i) then
            read_resp(i) <= read_resp(i-1);
            if read_resp(i-1)(G_DATA_SIZE) = '0' then
               read_resp(i) <= (others => '0');
            end if;

            if rst_i = '1' then
               read_resp(i) <= (others => '0');
            end if;
         end if;
      end process p_resp;
   end generate gen;

   s_avm_readdata_o      <= read_resp(G_RESP_PAUSE)(G_DATA_SIZE-1 downto 0);
   s_avm_readdatavalid_o <= read_resp(G_RESP_PAUSE)(G_DATA_SIZE);

end architecture synthesis;

