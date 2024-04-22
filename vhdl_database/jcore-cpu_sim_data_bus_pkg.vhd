library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.cpu2j0_pack.all;
package data_bus_pkg is
  type data_bus_device_t is (
    DEV_NONE
    ,DEV_PIO
    ,DEV_SPI
    ,DEV_AIC
      ,DEV_UART0
      ,DEV_UART1
      ,DEV_UARTGPS
    ,DEV_SRAM
      ,DEV_DDR
    ,DEV_BL0
    ,DEV_EMAC
      ,DEV_I2C
  );
  type data_bus_i_t is array(data_bus_device_t'left to data_bus_device_t'right) of cpu_data_i_t;
  type data_bus_o_t is array(data_bus_device_t'left to data_bus_device_t'right) of cpu_data_o_t;
  type ext_bus_device_t is (
    DEV_BL0,
    DEV_EMAC,
      DEV_I2C,
    DEV_DDR
  );
  type ext_irq_device_t is (
    DEV_EMAC,
      DEV_I2C,
    DEV_1PPS,
    DEV_EXT
  );
  type ext_to_int_data_bus_t is array(ext_bus_device_t'left to ext_bus_device_t'right) of data_bus_device_t;
  type ext_to_int_irq_t is array(ext_irq_device_t'left to ext_irq_device_t'right) of integer range 0 to 7;
  -- arrays for mapping mcu_lib's data bus and irq ports to the internal versions
  constant ext_to_int_data : ext_to_int_data_bus_t := (
    DEV_BL0 => DEV_BL0,
    DEV_EMAC => DEV_EMAC,
      DEV_I2C => DEV_I2C,
    DEV_DDR => DEV_NONE
  );
  constant ext_to_int_irq : ext_to_int_irq_t := (
    DEV_EMAC => 0,
      DEV_I2C => 7,
    DEV_1PPS => 5,
    DEV_EXT => 3
  );
  -- TODO: Should instruction bus have a DEV_NONE? Depends on if all reads
  -- outside DDR should be mapped to SRAM.
  type instr_bus_device_t is (
      DEV_DDR,
    DEV_SRAM);
  type instr_bus_i_t is array(instr_bus_device_t'left to instr_bus_device_t'right) of cpu_instruction_i_t;
  type instr_bus_o_t is array(instr_bus_device_t'left to instr_bus_device_t'right) of cpu_instruction_o_t;
  function mask_data_o(d: cpu_data_o_t; en : std_logic)
    return cpu_data_o_t;
  function decode_data_address(addr : std_logic_vector(31 downto 0))
    return data_bus_device_t;
  procedure data_buses(signal master_i : out cpu_data_i_t;
                       signal master_o : in cpu_data_o_t;
                       selected : in data_bus_device_t;
                       signal slaves_i : in data_bus_i_t;
                       signal slaves_o : out data_bus_o_t);
  function decode_instr_address(addr : std_logic_vector(31 downto 1))
    return instr_bus_device_t;
  procedure instruction_buses(signal master_i : out cpu_instruction_i_t;
                              signal master_o : in cpu_instruction_o_t;
                              selected : in instr_bus_device_t;
                              signal slaves_i : in instr_bus_i_t;
                              signal slaves_o : out instr_bus_o_t);
  procedure splice_instr_data_bus(signal instr_o : in cpu_instruction_o_t;
                                  signal instr_i : out cpu_instruction_i_t;
                                  signal data_o : out cpu_data_o_t;
                                  signal data_i : in cpu_data_i_t);
end data_bus_pkg;
package body data_bus_pkg is
  -- convert boolean to std_logic
  function to_bit(b : boolean) return std_logic is
  begin
    if b then
      return '1';
    else
      return '0';
    end if;
  end function to_bit;
  -- return a cpu_data_o_t with the en, rd, and wr bits masked by the given en bit
  function mask_data_o(d: cpu_data_o_t; en : std_logic)
  return cpu_data_o_t is
    variable r : cpu_data_o_t := d;
  begin
    r.en := en and d.en;
    r.rd := en and d.rd;
    r.wr := en and d.wr;
    return r;
  end function mask_data_o;
  function is_prefix(addr : std_logic_vector;
                     prefix : std_logic_vector)
  return boolean is
  begin
    return addr(addr'left downto (addr'left - prefix'high + prefix'low)) = prefix;
  end function is_prefix;
  -- determine device from data address
  function decode_data_address(addr : std_logic_vector(31 downto 0))
  return data_bus_device_t is
  begin
    case addr(31 downto 28) is
        when x"1" =>
          return DEV_DDR;
      when x"a" =>
        case addr(27 downto 16) is
          when x"bcd" =>
            case addr(15 downto 8) is
              when x"00" =>
                case addr(7 downto 6) is
                  when "00" =>
                    return DEV_PIO;
                  when "01" =>
                    return DEV_SPI;
                    when "10" =>
                      return DEV_I2C;
                  when others =>
                    return DEV_NONE;
                end case;
              when x"01" =>
                return DEV_UART0;
              when x"02" =>
                return DEV_AIC;
              when x"03" =>
                return DEV_UART1;
              when x"04" =>
                return DEV_UARTGPS;
              when others =>
                return DEV_NONE;
            end case;
            when x"bce" =>
              return DEV_EMAC;
          when x"bd0" =>
            return DEV_BL0;
          when others =>
            return DEV_NONE;
        end case;
      when others =>
        -- TODO: This maps more addresses than necessary to SRAM, so the SRAM
        -- will appear to be repeated in the address space. We should be able
        -- to map fewer addresses to SRAM (only those that start with 18 zero
        -- bits). However, the SRAM was previously the default, so it's likely
        -- programs rely on that. For example, my build of sdboot has a 4 byte
        -- stack at 0x300000 and loading it in gdb prints errors when default
        -- is DEV_NONE. For now, leave SRAM as the default.
        return DEV_SRAM;
    end case;
  end function decode_data_address;
  -- connect master and slave data buses
  procedure data_buses(signal master_i : out cpu_data_i_t;
                       signal master_o : in cpu_data_o_t;
                       selected : in data_bus_device_t;
                       signal slaves_i : in data_bus_i_t;
                       signal slaves_o : out data_bus_o_t) is
    variable selected_device : data_bus_device_t;
    variable master_temp_i : cpu_data_i_t;
  begin
    if master_o.en = '1' then
      selected_device := selected;
    else
      selected_device := DEV_NONE;
    end if;
    master_temp_i := slaves_i(selected_device);
    -- ensure the data is 0 when it's not a read.
    -- TODO: Is this necessary? Will the CPU use the data when it's not a read?
    if master_o.rd = '1' then
      master_i.d <= master_temp_i.d;
    else
      master_i.d <= (others => '0');
    end if;
    master_i.ack <= master_temp_i.ack;
    -- split outgoing data bus, masked by device
    for dev in data_bus_device_t'left to data_bus_device_t'right loop
      slaves_o(dev) <= mask_data_o(master_o, to_bit(dev = selected_device));
    end loop;
  end;
  -- determine device from instruction address
  function decode_instr_address(addr : std_logic_vector(31 downto 1))
  return instr_bus_device_t is
  begin
      if is_prefix(addr, x"1") then
        return DEV_DDR;
      else
        -- TODO: Should we have a DEV_NONE here and explicitly check for SRAM's
        -- prefix of zeros?
        return DEV_SRAM;
      end if;
  end function decode_instr_address;
  -- connect master and slave instruction buses
  procedure instruction_buses(signal master_i : out cpu_instruction_i_t;
                              signal master_o : in cpu_instruction_o_t;
                              selected : in instr_bus_device_t;
                              signal slaves_i : in instr_bus_i_t;
                              signal slaves_o : out instr_bus_o_t) is
  begin
    -- select incoming bus
    master_i <= slaves_i(selected);
    -- split outgoing bus, masked by device
    for dev in instr_bus_device_t'left to instr_bus_device_t'right loop
      slaves_o(dev) <= master_o;
      slaves_o(dev).en <= master_o.en and to_bit(dev = selected);
    end loop;
  end;
  -- Connect an instruction bus to a data bus. The instruction bus is on the
  -- master side. The data bus is on the slave side.
  procedure splice_instr_data_bus(signal instr_o : in cpu_instruction_o_t;
                                  signal instr_i : out cpu_instruction_i_t;
                                  signal data_o : out cpu_data_o_t;
                                  signal data_i : in cpu_data_i_t) is
  begin
    -- request path
    data_o.en <= instr_o.en;
    data_o.a <= instr_o.a(31 downto 1) & "0";
    data_o.rd <= instr_o.en;
    data_o.wr <= '0';
    data_o.we <= "0000"; -- WE is "0000" for reads
    data_o.d <= (others => '0');
    -- reply path
    instr_i.ack <= data_i.ack;
    if instr_o.a(1) = '0' then
      instr_i.d <= data_i.d(31 downto 16);
    else
      instr_i.d <= data_i.d(15 downto 0);
    end if;
  end;
end data_bus_pkg;
