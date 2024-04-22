library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_fifo_small is
   generic (
      G_RAM_WIDTH : natural;
      G_RAM_DEPTH : natural
   );
   port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;

      -- AXI input interface
      s_ready_o : out std_logic;
      s_valid_i : in  std_logic;
      s_data_i  : in  std_logic_vector(G_RAM_WIDTH-1 downto 0);

      -- AXI output interface
      m_ready_i : in  std_logic;
      m_valid_o : out std_logic;
      m_data_o  : out std_logic_vector(G_RAM_WIDTH-1 downto 0)
   );
end entity axi_fifo_small;

architecture synthesis of axi_fifo_small is

   -- The FIFO is full when the RAM contains G_RAM_DEPTH-1 elements
   type ram_type is array (0 to G_RAM_DEPTH-1) of std_logic_vector(s_data_i'range);
   signal ram : ram_type;

   -- Newest element at head, oldest element at tail
   subtype index_type is natural range ram_type'range;
   signal head    : index_type;
   signal tail    : index_type;
   signal count   : index_type;
   signal count_d : index_type;

   -- True the clock cycle after a simultaneous read and write
   signal read_while_write_d : std_logic;

   -- Increment or wrap the index if this transaction is valid
   function next_index (
      index : index_type;
      ready : std_logic;
      valid : std_logic) return index_type is
   begin
      if ready = '1' and valid = '1' then
         if index = index_type'high then
            return index_type'low;
         else
            return index + 1;
         end if;
      end if;

      return index;
   end function next_index;

begin

   p_head : process (clk_i)
   begin
      if rising_edge(clk_i) then
         head <= next_index(head, s_ready_o, s_valid_i);

         if rst_i = '1' then
            head <= index_type'low;
         end if;
      end if;
   end process p_head;

   p_tail : process (clk_i)
   begin
      if rising_edge(clk_i) then
         tail <= next_index(tail, m_ready_i, m_valid_o);

         if rst_i = '1' then
            tail <= index_type'low;
         end if;
      end if;
   end process p_tail;


   -- Write to and read from the RAM
   p_ram : process(clk_i)
   begin
      if rising_edge(clk_i) then
         ram(head) <= s_data_i;
         m_data_o <= ram(next_index(tail, m_ready_i, m_valid_o));
      end if;
   end process p_ram;

   -- Find the number of elements in the RAM
   p_count : process(head, tail)
   begin
      if head < tail then
         count <= head - tail + G_RAM_DEPTH;
      else
         count <= head - tail;
      end if;
   end process p_count;

   -- Delay the count by one clock cycles
   p_count_p1 : process(clk_i)
   begin
      if rising_edge(clk_i) then
         count_d <= count;

         if rst_i = '1' then
            count_d <= 0;
         end if;
      end if;
   end process p_count_p1;

   -- Set s_ready_o when the RAM isn't full
   p_s_ready : process(count)
   begin
      if count < G_RAM_DEPTH-1 then
         s_ready_o <= '1';
      else
         s_ready_o <= '0';
      end if;
   end process p_s_ready;

   -- Detect simultaneous read and write operations
   p_read_while_write_d : process(clk_i)
   begin
      if rising_edge(clk_i) then

         read_while_write_d <= '0';
         if s_ready_o = '1' and s_valid_i = '1' and m_ready_i = '1' and m_valid_o = '1' then
            read_while_write_d <= '1';
         end if;

         if rst_i = '1' then
            read_while_write_d <= '0';
         end if;
      end if;
   end process p_read_while_write_d;

   -- Set out_valid when the RAM outputs valid data
   p_m_valid : process(count, count_d, read_while_write_d)
   begin
      m_valid_o <= '1';

      -- If the RAM is empty or was empty in the prev cycle
      if count = 0 or count_d = 0 then
         m_valid_o <= '0';
      end if;

      -- If simultaneous read and write when almost empty
      if count = 1 and read_while_write_d = '1' then
         m_valid_o <= '0';
      end if;
   end process p_m_valid;

end architecture synthesis;

