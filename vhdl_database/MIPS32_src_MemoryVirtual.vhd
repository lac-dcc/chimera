library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.Common.all;

entity MemoryVirtual is
  generic (
    debug : boolean
    );
  port (
    -- Interface --
    clk       : in  std_logic;
    rst       : in  std_logic;
    en        : in  std_logic;
    rw        : in  RwType;
    length    : in  LenType;
    addr      : in  std_logic_vector (31 downto 0);
    data_in   : in  std_logic_vector (31 downto 0);
    data_out  : out std_logic_vector (31 downto 0);
    completed : out std_logic;
    int_com   : out std_logic
    );
end MemoryVirtual;

architecture Behavioral of MemoryVirtual is
begin
  int_com <= '0';
  
  process(clk, rst)
    
    type StateType is (
      INITIAL,
      ROM_READ,
      RAM_READ,
      RAM_WRITE,
      COM_READ,
      COM_WRITE,
      FLASH_READ,
      COMPLETE
    );

    constant NUM_RAM_CELLS : integer := 1024*1024;
    constant NUM_ROM_CELLS: integer := 1024;
    constant NUM_FLASH_CELLS: integer := 400000;
    type     VirtualRamType is array(0 to NUM_RAM_CELLS - 1) of Int8;
    type     VirtualRomType is array(0 to NUM_ROM_CELLS - 1) of Int32;
    type     VirtualFlashType is array(0 to NUM_FLASH_CELLS - 1) of Int16;

    variable state        : StateType;
    variable ram          : VirtualRamType;
    variable rom          : VirtualRomType;
    variable flash        : VirtualFlashType;
    variable addr_int     : integer;
    variable L            : line;
    variable com          : line;
    variable data_out_tmp : std_logic_vector (31 downto 0);

    procedure load_rom is
      file mem_file     : text open read_mode is "rom.hex";
      variable data_var : integer;
      variable index    : integer;
      variable i        : integer;
      variable word     : Int32;
    begin
      -- if debug then
        -- write(L, string'("loading ROM"));
        -- writeline(output, L);
      -- end if;
      
      index := 0;
      while not endfile(mem_file) loop
        readline(mem_file, L);

        data_var := 0;
        for i in 1 to 8 loop
          if ('0' <= L(i) and L(i) <= '9') then
            data_var := data_var*16
                        + character'pos(L(i)) - character'pos('0');
          else
            data_var := data_var*16
                        + character'pos(L(i)) - character'pos('a') + 10;
          end if;
        end loop;

        word := std_logic_vector(to_signed(data_var, 32));
        rom(index) := word;
        index := index + 1;
      end loop;
    end load_rom;

    procedure load_ram is
      file mem_file     : text open read_mode is "memory.dat";
      variable addr_var : integer;
      variable data_var : integer;
      variable i        : integer;
      variable word     : Int32;
      variable addr     : Int32;
    begin
      -- if debug then
        -- write(L, string'("loading RAM"));
        -- writeline(output, L);
      -- end if;
      
      while not endfile(mem_file) loop
        readline(mem_file, L);
        addr_var := 0;
        for i in 1 to 8 loop
          if ('0' <= L(i) and L(i) <= '9') then
            addr_var := addr_var*16
                        + character'pos(L(i)) - character'pos('0');
          else
            addr_var := addr_var*16
                        + character'pos(L(i)) - character'pos('a') + 10;
          end if;
        end loop;
        data_var := 0;
        for i in 10 to 17 loop
          if ('0' <= L(i) and L(i) <= '9') then
            data_var := data_var*16
                        + character'pos(L(i)) - character'pos('0');
          else
            data_var := data_var*16
                        + character'pos(L(i)) - character'pos('a') + 10;
          end if;
        end loop;

        word     := std_logic_vector(to_signed(data_var, 32));
        addr     := std_logic_vector(to_signed(addr_var, 32));
        addr     := "000" & addr(28 downto 0);
        addr_var := to_integer(unsigned(addr));

        ram(addr_var)   := word(7 downto 0);
        ram(addr_var+1) := word(15 downto 8);
        ram(addr_var+2) := word(23 downto 16);
        ram(addr_var+3) := word(31 downto 24);
        
      end loop;
    end load_ram;
    
    procedure load_flash is
      file mem_file     : text open read_mode is "flash.hex";
      variable data_var : integer;
      variable index    : integer;
      variable i        : integer;
      variable word     : Int32;
    begin
      -- if debug then
        -- write(L, string'("loading FLASH"));
        -- writeline(output, L);
      -- end if;
      
      index := 0;
      while not endfile(mem_file) loop
        readline(mem_file, L);

        data_var := 0;
        for i in 1 to 8 loop
          if ('0' <= L(i) and L(i) <= '9') then
            data_var := data_var*16
                        + character'pos(L(i)) - character'pos('0');
          else
            data_var := data_var*16
                        + character'pos(L(i)) - character'pos('a') + 10;
          end if;
        end loop;

        word := std_logic_vector(to_signed(data_var, 32));
        flash(index) := word(15 downto 0);
        flash(index + 1) := word(31 downto 16);
        index := index + 2;
      end loop;
    end load_flash;
    
    procedure mem_debug(
      rw         : RwType;
      addr, data : std_logic_vector;
      length     : LenType) is
      variable L            : line;
    begin
      if debug then
        write(L, string'("Mem["));
        write(L, to_hex_string(addr));
        if rw = R then
          write(L, string'("] :  "));
        else
          write(L, string'("] <= "));
        end if;
        case length is
          when Lword =>
            write(L, to_hex_string(data(31 downto 0)));
            write(L, string'(" ("));
            write(L, to_bitvector(data(31 downto 0)));
            write(L, string'(")"));
          when Lhalf =>
            write(L, to_hex_string(data(15 downto 0)));
            write(L, string'(" ("));
            write(L, to_bitvector(data(15 downto 0)));
            write(L, string'(")"));
          when Lbyte =>
            write(L, to_hex_string(data(7 downto 0)));
            write(L, string'(" ("));
            write(L, to_bitvector(data(7 downto 0)));
            write(L, string'(")"));
        end case;
        writeline(output, L);
      end if;
    end procedure;
    
  begin
    if rst = '0' then
      -- Reset
      load_rom;
      load_ram;
      load_flash;
      state := INITIAL;
    elsif rising_edge(clk) then
      if en = '1' then
        state := INITIAL;
        completed <= '0';
      end if;       
      case state is
        when INITIAL =>
          if en = '0' then
            if addr(31 downto 20) = x"000" then
              -- RAM
              if rw = R then
                state := RAM_READ;
              else
                state := RAM_WRITE;
              end if;
            elsif addr(31 downto 12) = x"1FC00" then
              -- ROM
              state := ROM_READ;
            elsif addr = COM_Data_Addr and rw = W then
              state := COM_WRITE;
            elsif addr = COM_Stat_Addr and rw = R then
              state := COM_READ;
            elsif addr(31 downto 24) = x"1E" then
              -- FLASH
              if rw = R then
                state := FLASH_READ;
              else
                -- ignore flash write
                completed <= '1';
                state := COMPLETE;
              end if;
            else
            end if;
          end if;
        when RAM_READ =>
          addr_int := to_integer(unsigned(addr));
          -- Read ram
          case length is
            when Lword =>
              data_out_tmp(7 downto 0)   := ram(addr_int);
              data_out_tmp(15 downto 8)  := ram(addr_int+1);
              data_out_tmp(23 downto 16) := ram(addr_int+2);
              data_out_tmp(31 downto 24) := ram(addr_int+3);
            when Lhalf =>
              data_out_tmp(7 downto 0)   := ram(addr_int);
              data_out_tmp(15 downto 8)  := ram(addr_int+1);
              data_out_tmp(23 downto 16) := Int8_Zero;
              data_out_tmp(31 downto 24) := Int8_Zero;
            when Lbyte =>
              data_out_tmp(7 downto 0)   := ram(addr_int);
              data_out_tmp(15 downto 8)  := Int8_Zero;
              data_out_tmp(23 downto 16) := Int8_Zero;
              data_out_tmp(31 downto 24) := Int8_Zero;
          end case;
          data_out  <= data_out_tmp;
          mem_debug(rw, addr, data_out_tmp, length);
          completed <= '1';
          state     := COMPLETE;
        when RAM_WRITE =>
          addr_int := to_integer(unsigned(addr));
          case length is
            when Lword =>
              ram(addr_int)   := data_in(7 downto 0);
              ram(addr_int+1) := data_in(15 downto 8);
              ram(addr_int+2) := data_in(23 downto 16);
              ram(addr_int+3) := data_in(31 downto 24);
            when Lhalf =>
              ram(addr_int)   := data_in(7 downto 0);
              ram(addr_int+1) := data_in(15 downto 8);
            when Lbyte =>
              ram(addr_int) := data_in(7 downto 0);
          end case;
          mem_debug(rw, addr, data_in, length);
          completed <= '1';
          state     := COMPLETE;
        when COM_READ =>
          data_out_tmp := Int24_Zero & x"01";
          data_out  <= data_out_tmp;
          mem_debug(rw, addr, data_out_tmp, length);
          completed <= '1';
          state     := COMPLETE;
        when COM_WRITE =>
          if not debug then
            write(com, to_hex_string(data_in(7 downto 0)));
            writeline(output, com);
          else
            mem_debug(rw, addr, data_in(7 downto 0), Lbyte);
          end if;
          completed <= '1';
          state     := COMPLETE;
        when ROM_READ =>
          data_out_tmp := rom(to_integer(unsigned(addr(11 downto 2))));
          data_out  <= data_out_tmp;
          mem_debug(rw, addr, data_out_tmp, length);
          completed <= '1';
          state     := COMPLETE;
        when FLASH_READ =>
          data_out_tmp := Int16_Zero & flash(to_integer(unsigned(addr(24 downto 2))));
          data_out  <= data_out_tmp;
          mem_debug(rw, addr, data_out_tmp, length);
          completed <= '1';
          state     := COMPLETE;
        when COMPLETE =>
      end case;
    end if;
  end process;
end Behavioral;
