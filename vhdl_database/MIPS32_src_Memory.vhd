library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Common.all;

entity Memory is
  port (
    -- Interface --
    clk:          in      std_logic;
    rst:          in      std_logic;
    en:           in      std_logic;
    rw:           in      RwType;
    length:       in      LenType;
    addr:         in      Int32;
    data_in:      in      Int32;
    data_out:     out     Int32;
    completed:    out     std_logic;
    int_com:      out     std_logic;
    
    -- Import --
    ram1_en:      out     std_logic;
    ram1_oe:      out     std_logic;
    ram1_rw:      out     std_logic;
    ram1_data:    inout   Int16;
    ram1_addr:    out     Int18;
    ram2_en:      out     std_logic;
    ram2_oe:      out     std_logic;
    ram2_rw:      out     std_logic;
    ram2_data:    inout   Int16;
    ram2_addr:    out     Int18;
    com_ready:    in      std_logic;
    com_rdn:      out     std_logic;
    com_wrn:      out     std_logic;
    com_tbre:     in      std_logic;
    com_tsre:     in      std_logic;
    flash_byte:   out     std_logic;
    flash_vpen:   out     std_logic;
    flash_ce:     out     std_logic;
    flash_oe:     out     std_logic;
    flash_we:     out     std_logic;
    flash_rp:     out     std_logic;
    flash_data:   inout   Int16;
    flash_addr:   out     Int23;
    
    -- Debug --
    seg7_r_num:   out     Int4
  );
end Memory;

architecture Behavioral of Memory is
  component Rom
    port (
      addr: in Int10;
      data: out Int32
    );
  end component;

  type StateType is (
    INITIAL,
    STOPPED,
    RAM_READ,
    RAM_WRITE,
    RAM_WRITE_BYTE_1,
    RAM_WRITE_BYTE_2,
    COM_READ,
    COM_WRITE,
    COM_WRITE_1,
    FLASH_READ,
    FLASH_READ_1,
    FLASH_WRITE
  );

procedure print_state(
  signal state: in StateType;
  signal seg7_r_num: out Int4) is
begin
  case state is
    when INITIAL =>
      seg7_r_num <= std_logic_vector(to_signed(0, 4));
    when STOPPED =>
      seg7_r_num <= std_logic_vector(to_signed(1, 4));
    when RAM_READ =>
      seg7_r_num <= std_logic_vector(to_signed(2, 4));
    when RAM_WRITE =>
      seg7_r_num <= std_logic_vector(to_signed(3, 4));
    when RAM_WRITE_BYTE_1 =>
      seg7_r_num <= std_logic_vector(to_signed(4, 4));
    when RAM_WRITE_BYTE_2 =>
      seg7_r_num <= std_logic_vector(to_signed(5, 4));
    when COM_READ =>
      seg7_r_num <= std_logic_vector(to_signed(6, 4));
    when COM_WRITE =>
      seg7_r_num <= std_logic_vector(to_signed(7, 4));
    when FLASH_READ =>
      seg7_r_num <= std_logic_vector(to_signed(8, 4));
    when FLASH_WRITE =>
      seg7_r_num <= std_logic_vector(to_signed(9, 4));
    when others =>
      seg7_r_num <= std_logic_vector(to_signed(15, 4));
  end case;
end;

procedure rom_read(
  signal data_out: out Int32;
  signal rom_data: in Int32;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      data_out <= rom_data;
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;

procedure ram_read(
  signal length: in LenType;
  signal addr: in Int32;
  signal data_out: out Int32;
  signal ram1_en: out std_logic;
  signal ram1_oe: out std_logic;
  signal ram1_rw: out std_logic;
  signal ram1_data: inout Int16;
  signal ram2_en: out std_logic;
  signal ram2_oe: out std_logic;
  signal ram2_rw: out std_logic;
  signal ram2_data: inout Int16;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      ram1_en <= '0';
      ram2_en <= '0';
      ram1_oe <= '0';
      ram2_oe <= '0';
      ram1_rw <= '1';
      ram2_rw <= '1';
      ram1_data <= Int16_Z;
      ram2_data <= Int16_Z;
      state <= RAM_READ;
    when RAM_READ =>
      if length = Lword then
        data_out(15 downto 0) <= ram1_data;
        data_out(31 downto 16) <= ram2_data;
      elsif length = Lhalf then
        data_out(31 downto 16) <= Int16_Zero;
        if addr(1) = '0' then
          data_out(15 downto 0) <= ram1_data;
        else
          data_out(15 downto 0) <= ram2_data;
        end if;
      elsif length = Lbyte then
        data_out(31 downto 8) <= Int16_Zero & Int8_Zero;
        if addr(1) = '0' then
          if addr(0) = '0' then
            data_out(7 downto 0) <= ram1_data(7 downto 0);
          else
            data_out(7 downto 0) <= ram1_data(15 downto 8);
          end if;
        else
          if addr(0) = '0' then
            data_out(7 downto 0) <= ram2_data(7 downto 0);
          else
            data_out(7 downto 0) <= ram2_data(15 downto 8);
          end if;
        end if;
      end if;
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;
  
procedure ram_write(
  signal length: in LenType;
  signal addr: in Int32;
  signal data_in: in Int32;
  signal ram1_en: out std_logic;
  signal ram1_oe: out std_logic;
  signal ram1_rw: out std_logic;
  signal ram1_data: inout Int16;
  signal ram2_en: out std_logic;
  signal ram2_oe: out std_logic;
  signal ram2_rw: out std_logic;
  signal ram2_data: inout Int16;
  signal data_byte_temp: inout Int16;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      ram1_en <= '0';
      ram2_en <= '0';
      -- Write ram
      if length = Lword then
        ram1_oe <= '1';
        ram2_oe <= '1';
        ram1_rw <= '0';
        ram2_rw <= '0';
        ram1_data <= data_in(15 downto 0);
        ram2_data <= data_in(31 downto 16);
        state <= RAM_WRITE;
      elsif length = Lhalf then
        if addr(1) = '0' then
          ram1_oe <= '1';
          ram1_rw <= '0';
          ram1_data <= data_in(15 downto 0);
        else
          ram2_oe <= '1';
          ram2_rw <= '0';
          ram2_data <= data_in(15 downto 0);
        end if;
        state <= RAM_WRITE;
      elsif length = Lbyte then
        ram1_oe <= '0';
        ram2_oe <= '0';
        ram1_rw <= '1';
        ram2_rw <= '1';
        ram1_data <= Int16_Z;
        ram2_data <= Int16_Z;
        state <= RAM_WRITE_BYTE_1;
      end if;
    when RAM_WRITE =>
      ram1_rw <= '1';
      ram2_rw <= '1';
      completed <= '1';
      state <= STOPPED;
    when RAM_WRITE_BYTE_1 =>
      if addr(1) = '0' then
        data_byte_temp <= ram1_data;
      else
        data_byte_temp <= ram2_data;
      end if;
      state <= RAM_WRITE_BYTE_2;
    when RAM_WRITE_BYTE_2 =>
      if addr(1) = '0' then
        ram1_oe <= '1';
        ram1_rw <= '0';
        if addr(0) = '0' then
          ram1_data(7 downto 0) <= data_in(7 downto 0);
          ram1_data(15 downto 8) <= data_byte_temp(15 downto 8);
        else
          ram1_data(7 downto 0) <= data_byte_temp(7 downto 0);
          ram1_data(15 downto 8) <= data_in(7 downto 0);
        end if;
      else
        ram2_oe <= '1';
        ram2_rw <= '0';
        if addr(0) = '0' then
          ram2_data(7 downto 0) <= data_in(7 downto 0);
          ram2_data(15 downto 8) <= data_byte_temp(15 downto 8);
        else
          ram2_data(7 downto 0) <= data_byte_temp(7 downto 0);
          ram2_data(15 downto 8) <= data_in(7 downto 0);
        end if;
      end if;
      state <= RAM_WRITE;
    when others =>
  end case;
end;

procedure com_status(
  signal com_ready: in std_logic;
  signal com_tbre: in std_logic;
  signal com_tsre: in std_logic;
  signal data_out: out Int32;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      data_out(0) <= com_tbre and com_tsre;
      data_out(1) <= com_ready;
      data_out(31 downto 2) <= Int30_Zero;
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;

procedure com_read(
  signal com_ready: in std_logic;
  signal com_rdn: out std_logic;
  signal ram1_en: out std_logic;
  signal ram1_oe: out std_logic;
  signal com_data: inout Int8;
  signal data_out: out Int32;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      ram1_en <= '1';
      ram1_oe <= '1';
      com_rdn <= '0';
      com_data <= Int8_Z;
      state <= COM_READ;
    when COM_READ =>
      com_rdn <= '1';
      data_out(7 downto 0) <= com_data;
      data_out(31 downto 8) <= Int24_Zero;
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;

procedure com_write(
  signal com_tbre: in std_logic;
  signal com_tsre: in std_logic;
  signal data_in: in Int32;
  signal com_wrn: out std_logic;
  signal ram1_en: out std_logic;
  signal ram1_oe: out std_logic;
  signal com_data: inout Int8;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      ram1_en <= '1';
      ram1_oe <= '1';
      com_data <= data_in(7 downto 0);
      state <= COM_WRITE;
    when COM_WRITE =>
      com_wrn <= '0';
      state <= COM_WRITE_1;
    when COM_WRITE_1 =>
      com_wrn <= '1';
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;

procedure flash_read(
  signal addr: in Int32;
  signal data_out: out Int32;
  signal flash_oe: out std_logic;
  signal flash_we: out std_logic;
  signal flash_data: inout Int16;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      flash_oe <= '0';
      flash_we <= '1';
      flash_data <= Int16_Z;
      state <= FLASH_READ;
    when FLASH_READ =>
      state <= FLASH_READ_1;
    when FLASH_READ_1 =>
      data_out(15 downto 0) <= flash_data;
      data_out(31 downto 16) <= Int16_Zero;
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;

procedure flash_write(
  signal addr: in Int32;
  signal data_in: in Int32;
  signal flash_oe: out std_logic;
  signal flash_we: out std_logic;
  signal flash_data: inout Int16;
  signal state: inout StateType;
  signal completed: out std_logic) is
begin
  case state is
    when INITIAL =>
      flash_oe <= '1';
      flash_we <= '0';
      flash_data <= data_in(15 downto 0);
      state <= FLASH_WRITE;
    when FLASH_WRITE =>
      flash_we <= '1';
      completed <= '1';
      state <= STOPPED;
    when others =>
  end case;
end;
  
signal state: StateType;
signal data_byte_temp: Int16;
signal rom_addr: Int10;
signal rom_data: Int32;
  
begin
  flash_byte <= '1';
  flash_vpen <= '1';
  flash_ce <= '0';
  flash_rp <= '1';
  flash_addr <= addr(23 downto 1);

  rom_addr <= addr(11 downto 2);
  ram1_addr <= addr(19 downto 2);
  ram2_addr <= addr(19 downto 2);
  
  int_com <= com_ready;
  
  rom_instance: Rom port map (
    addr => rom_addr,
    data => rom_data
  );
  
  process(clk, rst)
  begin
    if rst = '0' then
      -- Reset
      ram1_en <= '1';
      ram2_en <= '1';
      ram1_oe <= '1';
      ram2_oe <= '1';
      ram1_rw <= '1';
      ram2_rw <= '1';
      com_rdn <= '1';
      com_wrn <= '1';
      completed <= '0';
      state <= STOPPED;
    elsif rising_edge(clk) then
      print_state(state, seg7_r_num); -- Debug --
      if en = '1' then
        state <= INITIAL;
        completed <= '0';
      else
        if addr(31 downto 20) = x"000" then
          --- SRAM ---
          if rw = R then
            ram_read(length, addr, data_out, ram1_en, ram1_oe, ram1_rw, ram1_data,
              ram2_en, ram2_oe, ram2_rw, ram2_data, state, completed);
          else
            ram_write(length, addr, data_in, ram1_en, ram1_oe, ram1_rw, ram1_data,
              ram2_en, ram2_oe, ram2_rw, ram2_data, data_byte_temp, state, completed);
          end if;
        elsif addr(31 downto 12) = x"1FC00" then
          -- ROM --
          if rw = R then
            rom_read(data_out, rom_data, state, completed);
          end if;
        elsif addr = COM_Data_Addr then
          -- COM --
          if rw = R then
            com_read(com_ready, com_rdn, ram1_en, ram1_oe, ram1_data(7 downto 0), data_out, state, completed);
          else
            com_write(com_tbre, com_tsre, data_in, com_wrn, ram1_en, ram1_oe, ram1_data(7 downto 0), state, completed);
          end if;
        elsif addr = COM_Stat_Addr then
          -- COM Status --
          if rw = R then
            com_status(com_ready, com_tbre, com_tsre, data_out, state, completed);
          end if;
        elsif addr(31 downto 24) = x"1E" then
          --- Flash ---
          if rw = R then
            flash_read(addr, data_out, flash_oe, flash_we, flash_data, state, completed);
          else
            flash_write(addr, data_in, flash_oe, flash_we, flash_data, state, completed);
          end if;
        end if;
      end if; -- en
    end if; -- clk
  end process;
end Behavioral;
