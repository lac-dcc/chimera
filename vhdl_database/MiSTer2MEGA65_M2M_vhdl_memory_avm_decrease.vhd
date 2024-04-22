library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This reduces the data width of an Avalon Memory Map interface.

entity avm_decrease is
   generic (
      G_SLAVE_ADDRESS_SIZE  : integer;
      G_SLAVE_DATA_SIZE     : integer; -- Must be a multiple of G_MASTER_DATA_SIZE
      G_MASTER_ADDRESS_SIZE : integer;
      G_MASTER_DATA_SIZE    : integer
   );
   port (
      clk_i                 : in  std_logic;
      rst_i                 : in  std_logic;

      -- Slave interface (input)
      s_avm_write_i         : in  std_logic;
      s_avm_read_i          : in  std_logic;
      s_avm_address_i       : in  std_logic_vector(G_SLAVE_ADDRESS_SIZE-1 downto 0);
      s_avm_writedata_i     : in  std_logic_vector(G_SLAVE_DATA_SIZE-1 downto 0);
      s_avm_byteenable_i    : in  std_logic_vector(G_SLAVE_DATA_SIZE/8-1 downto 0);
      s_avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      s_avm_readdata_o      : out std_logic_vector(G_SLAVE_DATA_SIZE-1 downto 0);
      s_avm_readdatavalid_o : out std_logic;
      s_avm_waitrequest_o   : out std_logic;

      -- Master interface (output)
      m_avm_write_o         : out std_logic;
      m_avm_read_o          : out std_logic;
      m_avm_address_o       : out std_logic_vector(G_MASTER_ADDRESS_SIZE-1 downto 0);
      m_avm_writedata_o     : out std_logic_vector(G_MASTER_DATA_SIZE-1 downto 0);
      m_avm_byteenable_o    : out std_logic_vector(G_MASTER_DATA_SIZE/8-1 downto 0);
      m_avm_burstcount_o    : out std_logic_vector(7 downto 0);
      m_avm_readdata_i      : in  std_logic_vector(G_MASTER_DATA_SIZE-1 downto 0);
      m_avm_readdatavalid_i : in  std_logic;
      m_avm_waitrequest_i   : in  std_logic
   );
end entity avm_decrease;

architecture synthesis of avm_decrease is

   constant C_RATIO        : integer := G_SLAVE_DATA_SIZE / G_MASTER_DATA_SIZE;
   constant C_ZERO_DATA    : std_logic_vector(G_MASTER_DATA_SIZE-1 downto 0)   := (others => '0');
   constant C_ZERO_BYTE_EN : std_logic_vector(G_MASTER_DATA_SIZE/8-1 downto 0) := (others => '0');

   signal s_avm_write      : std_logic;
   signal s_avm_read       : std_logic;
   signal s_avm_address    : std_logic_vector(G_SLAVE_ADDRESS_SIZE-1 downto 0);
   signal s_avm_writedata  : std_logic_vector(G_SLAVE_DATA_SIZE-1 downto 0);
   signal s_avm_byteenable : std_logic_vector(G_SLAVE_DATA_SIZE/8-1 downto 0);
   signal s_avm_burstcount : std_logic_vector(7 downto 0);

   type t_state is (IDLE_ST, WRITING_ST, READING_ST);
   signal state : t_state := IDLE_ST;

   signal s_write_pos : integer range 0 to C_RATIO-1 := 0;
   signal s_read_pos  : integer range 0 to C_RATIO-1 := 0;

begin

   assert C_RATIO > 1 severity failure;
   assert G_SLAVE_DATA_SIZE = C_RATIO * G_MASTER_DATA_SIZE severity failure;
   assert G_SLAVE_DATA_SIZE * (2**G_SLAVE_ADDRESS_SIZE) = G_MASTER_DATA_SIZE * (2**G_MASTER_ADDRESS_SIZE) severity failure;

   p_fsm : process (clk_i)
   begin
      if rising_edge(clk_i) then
         s_avm_readdatavalid_o <= '0';

         if m_avm_waitrequest_i = '0' then
            s_avm_write <= '0';
            s_avm_read  <= '0';
         end if;

         if m_avm_readdatavalid_i = '1' then
            s_avm_readdata_o(G_MASTER_DATA_SIZE*s_read_pos + G_MASTER_DATA_SIZE-1 downto G_MASTER_DATA_SIZE*s_read_pos) <= m_avm_readdata_i;

            if s_read_pos+1 = C_RATIO then
               s_read_pos <= 0;
               s_avm_readdatavalid_o <= '1';
            else
               s_read_pos <= s_read_pos + 1;
            end if;
         end if;

         case state is
            when IDLE_ST =>
               if (s_avm_write_i = '1' or s_avm_read_i = '1') and s_avm_waitrequest_o = '0' then
                  s_avm_write      <= s_avm_write_i;
                  s_avm_read       <= s_avm_read_i;
                  s_avm_address    <= s_avm_address_i;
                  s_avm_writedata  <= s_avm_writedata_i;
                  s_avm_byteenable <= s_avm_byteenable_i;
                  s_avm_burstcount <= std_logic_vector(to_unsigned(C_RATIO * to_integer(unsigned(s_avm_burstcount_i)), 8));
                  if s_avm_write_i = '1' then
                     s_write_pos   <= 0;
                     state         <= WRITING_ST;
                  elsif s_read_pos /= 0 or m_avm_readdatavalid_i = '1' then
                     state         <= READING_ST;
                  else
                     s_read_pos    <= 0;
                  end if;
               end if;

            when WRITING_ST =>
               if m_avm_waitrequest_i = '0' then
                  s_write_pos <= s_write_pos + 1;

                  -- Preserve value from previous clock cycle
                  s_avm_write <= s_avm_write;

                  if s_write_pos+2 = C_RATIO then
                     state <= IDLE_ST;
                  end if;
               end if;

            when READING_ST =>
               if s_read_pos = 0 then
                  state <= IDLE_ST;
               end if;

         end case;

         if rst_i = '1' then
            s_avm_write <= '0';
            s_avm_read  <= '0';
            s_read_pos  <= 0;
            state       <= IDLE_ST;
         end if;

      end if;
   end process p_fsm;

   m_avm_write_o       <= s_avm_write;
   m_avm_read_o        <= s_avm_read;
   m_avm_address_o(G_MASTER_ADDRESS_SIZE-1 downto G_MASTER_ADDRESS_SIZE-G_SLAVE_ADDRESS_SIZE) <= s_avm_address;
   m_avm_address_o(G_MASTER_ADDRESS_SIZE-G_SLAVE_ADDRESS_SIZE-1 downto 0) <= (others => '0');
   m_avm_writedata_o   <= s_avm_writedata(G_MASTER_DATA_SIZE*s_write_pos + G_MASTER_DATA_SIZE-1 downto G_MASTER_DATA_SIZE*s_write_pos);
   m_avm_byteenable_o  <= s_avm_byteenable(G_MASTER_DATA_SIZE/8*s_write_pos + G_MASTER_DATA_SIZE/8-1 downto G_MASTER_DATA_SIZE/8*s_write_pos);
   m_avm_burstcount_o  <= s_avm_burstcount;
   s_avm_waitrequest_o <= ((m_avm_write_o or m_avm_read_o) and m_avm_waitrequest_i) when state = IDLE_ST else '1';

end architecture synthesis;

