library  ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

library std;
   use std.textio.all;

entity tdp_ram is
   generic (
      ADDR_WIDTH   : positive;
      DATA_WIDTH   : positive;
      ROM_PRELOAD  : boolean := false;
      ROM_FILE     : string  := "";
      ROM_FILE_HEX : boolean := false
   );
   port (
      clock_a   : in  std_logic;
      clen_a    : in  std_logic := '1';
      address_a : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      data_a    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      wren_a    : in  std_logic;
      q_a       : out std_logic_vector(DATA_WIDTH-1 downto 0);

      clock_b   : in  std_logic;
      clen_b    : in  std_logic := '1';
      address_b : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
      data_b    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
      wren_b    : in  std_logic;
      q_b       : out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end entity tdp_ram;

architecture synthesis of tdp_ram is

   subtype t_word is std_logic_vector(DATA_WIDTH - 1 downto 0);
   type    t_ram  is array(0 to 2**ADDR_WIDTH - 1) of t_word;

   impure function InitRAMFromFile(ramfilename: string) return t_ram is
      file     ramfile     : text;
      variable ramfileline : line;
      variable ram_data    : t_ram;
      variable bitvec      : bit_vector(DATA_WIDTH - 1 downto 0);
      variable i           : natural := 0;
   begin
      file_open(ramfile, ramfilename);
      while not endfile(ramfile) loop
         readline(ramfile, ramfileline);
         if ROM_FILE_HEX then
            hread(ramfileline, bitvec);
         else
            read(ramfileline, bitvec);
         end if;
         ram_data(i) := to_stdlogicvector(bitvec);
         i := i + 1;
      end loop;
      file_close(ramfile);
      return ram_data;
   end function;

   -- Vivado 2019.2 crashes, if we are not using this indirection
   impure function InitRAM(ramfile: string) return t_ram is
   begin
      if ROM_PRELOAD then
         return InitRamFromFile(ramfile);
      else
         return (others => (others => '0'));
      end if;
   end;

   signal ram           : t_ram := InitRAM(ROM_FILE);
   signal address_a_reg : std_logic_vector(ADDR_WIDTH-1 downto 0);
   signal address_b_reg : std_logic_vector(ADDR_WIDTH-1 downto 0);

begin

   ram_proc : process (clock_a, clock_b)
   begin
      if rising_edge(clock_a) then
         if clen_a = '1' then -- Clock Enable is required for Vivado 2021.2 to correctly infer a BlockRAM
            if wren_a = '1' then
               ram(to_integer(unsigned(address_a))) <= data_a;
            end if;

            address_a_reg <= address_a;
         end if;
      end if;

      if rising_edge(clock_b) then
         if clen_b = '1' then
            if wren_b = '1' then
               ram(to_integer(unsigned(address_b))) <= data_b;
            end if;

            address_b_reg <= address_b;
         end if;
      end if;
   end process ram_proc;

   q_a <= ram(to_integer(unsigned(address_a_reg)));
   q_b <= ram(to_integer(unsigned(address_b_reg)));

end architecture synthesis;

