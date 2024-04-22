library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity avm_rom is
   generic (
      G_INIT_FILE    : string := "";
      G_ADDRESS_SIZE : integer; -- Number of bits
      G_DATA_SIZE    : integer  -- Number of bits
   );
   port (
      clk_i               : in  std_logic;
      rst_i               : in  std_logic;
      avm_write_i         : in  std_logic;
      avm_read_i          : in  std_logic;
      avm_address_i       : in  std_logic_vector(G_ADDRESS_SIZE-1 downto 0);
      avm_writedata_i     : in  std_logic_vector(G_DATA_SIZE-1 downto 0);
      avm_byteenable_i    : in  std_logic_vector(G_DATA_SIZE/8-1 downto 0);
      avm_burstcount_i    : in  std_logic_vector(7 downto 0);
      avm_readdata_o      : out std_logic_vector(G_DATA_SIZE-1 downto 0);
      avm_readdatavalid_o : out std_logic;
      avm_waitrequest_o   : out std_logic;
      length_o            : out natural
   );
end entity avm_rom;

architecture simulation of avm_rom is

   -- This defines a type containing an array of bytes
   type mem_t is array (0 to 2**G_ADDRESS_SIZE-1) of std_logic_vector(G_DATA_SIZE-1 downto 0);
   type info_t is record
      mem    : mem_t;
      length : natural;
   end record info_t;

   signal read_burstcount      : std_logic_vector(7 downto 0);
   signal read_address         : std_logic_vector(G_ADDRESS_SIZE-1 downto 0);

   signal mem_read_burstcount  : std_logic_vector(7 downto 0);
   signal mem_read_address     : std_logic_vector(G_ADDRESS_SIZE-1 downto 0);

   impure function read_romfile(rom_file_name : in string) return info_t is
      type char_file_t is file of character;
      file char_file : char_file_t;
      variable char_v : character;
      subtype byte_t is natural range 0 to 255;
      variable byte_v    : byte_t;
      variable address_v : natural := 0;
      variable index_v   : natural := 0;
      variable data_v    : std_logic_vector(G_DATA_SIZE-1 downto 0);
      variable info_v    : info_t;
   begin
      file_open(char_file, rom_file_name);
      while not endfile(char_file) and address_v <= 2**G_ADDRESS_SIZE-1 loop
         read(char_file, char_v);
         byte_v := character'pos(char_v);

         data_v(index_v*8+7 downto index_v*8) := std_logic_vector(to_unsigned(byte_v, 8));
         index_v := index_v + 1;
         if index_v = G_DATA_SIZE/8 then
            index_v := 0;
            info_v.mem(address_v) := data_v;
            address_v := address_v + 1;
         end if;
      end loop;
      info_v.length := address_v;
      file_close(char_file);
      return info_v;
   end function;

   signal info : info_t := read_romfile(G_INIT_FILE);

begin

   length_o <= info.length;

   mem_read_address     <= avm_address_i    when read_burstcount = X"00" else read_address;
   mem_read_burstcount  <= avm_burstcount_i when read_burstcount = X"00" else read_burstcount;

   avm_waitrequest_o <= '0' when unsigned(read_burstcount) = 0 else '1';

   p_mem : process (clk_i)
   begin
      if rising_edge(clk_i) then
         avm_readdatavalid_o <= '0';

         if (avm_read_i = '1' and avm_waitrequest_o = '0') or to_integer(unsigned(read_burstcount)) > 0 then
            read_address <= std_logic_vector(unsigned(mem_read_address) + 1);
            read_burstcount <= std_logic_vector(unsigned(mem_read_burstcount) - 1);

            avm_readdata_o <= info.mem(to_integer(unsigned(mem_read_address)));
            avm_readdatavalid_o <= '1';

            --report "Reading 0x" & to_hstring(info.mem(to_integer(unsigned(mem_read_address)))) & " from 0x" & to_hstring(mem_read_address) &
            --       " with burstcount " & to_hstring(read_burstcount);
         end if;

         if rst_i = '1' then
            read_burstcount  <= (others => '0');
         end if;
      end if;
   end process p_mem;

end architecture simulation;

