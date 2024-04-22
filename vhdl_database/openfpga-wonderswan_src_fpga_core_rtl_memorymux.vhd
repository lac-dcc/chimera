library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all; 

use work.pRegisterBus.all;  
use work.pBus_savestates.all;
use work.pReg_savestates.all; 
use work.pReg_swan.all;

entity memorymux is
   port 
   (
      clk                  : in  std_logic;
      clk_ram              : in  std_logic;
      ce                   : in  std_logic;
      reset                : in  std_logic;
      isColor              : in  std_logic;
      
      maskAddr             : in  std_logic_vector(23 downto 0);
      romtype              : in  std_logic_vector(7 downto 0);
      ramtype              : in  std_logic_vector(7 downto 0);
      
      eepromWrite          : out std_logic;
      eeprom_addr          : in  std_logic_vector(9 downto 0);
      eeprom_din           : in  std_logic_vector(15 downto 0);
      eeprom_dout          : out std_logic_vector(15 downto 0);
      eeprom_req           : in  std_logic;
      eeprom_rnw           : in  std_logic;
      
      cpu_read             : in  std_logic;
      cpu_write            : in  std_logic;
      cpu_be               : in  std_logic_vector(1 downto 0) := "00";
      cpu_addr             : in  unsigned(19 downto 0);
      cpu_datawrite        : in  std_logic_vector(15 downto 0);
      cpu_dataread         : out std_logic_vector(15 downto 0); 
      
      GPU_addr             : in  std_logic_vector(15 downto 0);
      GPU_dataread         : out std_logic_vector(15 downto 0);   
      
      Color_addr           : in  std_logic_vector(7 downto 0);
      Color_dataread       : out std_logic_vector(15 downto 0);    
      
      bios_wraddr          : in  std_logic_vector(12 downto 0);
      bios_wrdata          : in  std_logic_vector(15 downto 0);
      bios_wr              : in  std_logic;
      bios_wrcolor         : in  std_logic;
      
      RegBus_Din           : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr           : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren          : in  std_logic;
      RegBus_rst           : in  std_logic;
      RegBus_Dout          : out std_logic_vector(BUS_buswidth-1 downto 0);
      
      EXTRAM_read          : out std_logic;
      EXTRAM_write         : out std_logic;
      EXTRAM_be            : out std_logic_vector(1 downto 0);
      EXTRAM_addr          : out std_logic_vector(24 downto 0);
      EXTRAM_datawrite     : out std_logic_vector(15 downto 0);
      EXTRAM_dataread      : in  std_logic_vector(15 downto 0); 
      
      -- savestates              
      sleep_savestate      : in  std_logic;
      
      SSBus_Din            : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBus_Adr            : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBus_wren           : in  std_logic;
      SSBus_rst            : in  std_logic;
      SSBus_Dout           : out std_logic_vector(SSBUS_buswidth-1 downto 0);
      
      SSMEM_Addr           : in  std_logic_vector(18 downto 0);
      SSMEM_RdEn           : in  std_logic_vector( 2 downto 0);
      SSMEM_WrEn           : in  std_logic_vector( 2 downto 0);
      SSMEM_WriteData      : in  std_logic_vector(15 downto 0);
      SSMEM_ReadData_REG   : out std_logic_vector(15 downto 0);
      SSMEM_ReadData_RAM   : out std_logic_vector(15 downto 0);
      SSMEM_ReadData_SRAM  : out std_logic_vector(15 downto 0)
   );
end entity;

architecture arch of memorymux is
  
   -- register
   signal BANK_ROM2        : std_logic_vector(REG_BANK_ROM2.upper downto REG_BANK_ROM2.lower);
   signal BANK_SRAM        : std_logic_vector(REG_BANK_SRAM.upper downto REG_BANK_SRAM.lower);
   signal BANK_ROM0        : std_logic_vector(REG_BANK_ROM0.upper downto REG_BANK_ROM0.lower);
   signal BANK_ROM1        : std_logic_vector(REG_BANK_ROM1.upper downto REG_BANK_ROM1.lower);
   
   signal HW_FLAGS_read    : std_logic_vector(REG_HW_FLAGS.upper downto REG_HW_FLAGS.lower);
   signal HW_FLAGS_written : std_logic;
   signal HW_FLAGS_set     : std_logic;
   
   type t_reg_wired_or is array(0 to 6) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;
  
   -- masks from header
   signal rommask          : std_logic_vector(23 downto 0);
   signal sramMask         : std_logic_vector(23 downto 0);
  
   -- cpu
   type tMemAccessType is 
   (
      BIOS,
      BIOSCOLOR,
      EXTRAM,
      RAMACC,
      UNMAPPED,
      ZERO
   );
   signal MemAccessType          : tMemAccessType; 
   signal MemAccessTypeNew       : tMemAccessType; 
   
   signal cpu_dataread_16        : std_logic_vector(15 downto 0);
   signal cpu_unaligned          : std_logic;
  
   -- BIOS non-color
   signal BIOS_address           : std_logic_vector(10 downto 0);
   signal BIOS_data              : std_logic_vector(15 downto 0);   
   
   signal BIOS_addressColor      : std_logic_vector(11 downto 0);
   signal BIOS_dataColor         : std_logic_vector(15 downto 0);
            
   -- 64kbyte ram    
   signal RAM_addressCPU         : std_logic_vector(14 downto 0);
   signal RAM_dataReadCPU        : std_logic_vector(15 downto 0);
   signal RAM_dataWriteCPU       : std_logic_vector(15 downto 0);
   signal RAM_dataWriteEnable    : std_logic_vector(1 downto 0);
   
   -- palette ram
   signal Palette_WriteEnable    : std_logic_vector(1 downto 0);
         
   -- savestates     
   type t_ss_wired_or is array(0 to 1) of std_logic_vector(63 downto 0);
   signal ss_wired_or : t_ss_wired_or;

begin 

   iREG_BANK_ROM2   : entity work.eReg generic map ( REG_BANK_ROM2   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 0), BANK_ROM2    , BANK_ROM2); 
   iREG_BANK_SRAM   : entity work.eReg generic map ( REG_BANK_SRAM   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 1), BANK_SRAM    , BANK_SRAM); 
   iREG_BANK_ROM0   : entity work.eReg generic map ( REG_BANK_ROM0   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 2), BANK_ROM0    , BANK_ROM0); 
   iREG_BANK_ROM1   : entity work.eReg generic map ( REG_BANK_ROM1   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 3), BANK_ROM1    , BANK_ROM1); 
                                                                                                                                                     
   iREG_HW_FLAGS    : entity work.eReg generic map ( REG_HW_FLAGS    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 4), HW_FLAGS_read, open, HW_FLAGS_written); 

   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   -- savestates
   process (ss_wired_or)
      variable wired_or : std_logic_vector(63 downto 0);
   begin
      wired_or := ss_wired_or(0);
      for i in 1 to (ss_wired_or'length - 1) loop
         wired_or := wired_or or ss_wired_or(i);
      end loop;
      SSBUS_Dout <= wired_or;
   end process;
   
   
   -- carttype
   rommask      <= maskAddr;      
   sramMask     <= x"001FFF" when ramtype = x"01" else     
                   x"007FFF" when ramtype = x"02" else     
                   x"01FFFF" when ramtype = x"03" else     
                   x"03FFFF" when ramtype = x"04" else     
                   x"07FFFF" when ramtype = x"05" else     
                   x"000000";
   
   -- 
   HW_FLAGS_read <= "100001" & isColor & HW_FLAGS_set;
    
   process (clk)
   begin
      if rising_edge(clk) then
         if (SSBUS_rst = '1') then
            HW_FLAGS_set <= '0';
         elsif (HW_FLAGS_written = '1' and RegBus_Din(0) = '1') then
            HW_FLAGS_set <= '1';
         end if;
      end if;
   end process;
               
   RAM_addressCPU   <= SSMEM_Addr(15 downto 1) when sleep_savestate = '1' else 
                       std_logic_vector(cpu_addr(15 downto 1));
                
   RAM_dataWriteCPU <= SSMEM_WriteData when sleep_savestate = '1' else 
                       cpu_datawrite when cpu_addr(0) = '0' else cpu_datawrite(7 downto 0) & cpu_datawrite(15 downto 8);
              
   SSMEM_ReadData_RAM  <= RAM_dataReadCPU;
   SSMEM_ReadData_SRAM <= EXTRAM_dataread;
              
   iramCPUA: entity work.dpram
   generic map
   (
       addr_width => 15,
       data_width => 8
   )
   port map
   (
      clock_a     => clk,
      address_a   => RAM_addressCPU,
      data_a      => RAM_dataWriteCPU(7 downto 0),
      wren_a      => RAM_dataWriteEnable(0),
      q_a         => RAM_dataReadCPU(7 downto 0),

      clock_b     => clk,
      address_b   => GPU_addr(15 downto 1),
      data_b      => x"00",
      wren_b      => '0',
      q_b         => GPU_dataread(7 downto 0)
   );
   iramCPUB: entity work.dpram
   generic map
   (
       addr_width => 15,
       data_width => 8
   )
   port map
   (
      clock_a     => clk,
      address_a   => RAM_addressCPU,
      data_a      => RAM_dataWriteCPU(15 downto 8),
      wren_a      => RAM_dataWriteEnable(1),
      q_a         => RAM_dataReadCPU(15 downto 8),

      clock_b     => clk,
      address_b   => GPU_addr(15 downto 1),
      data_b      => x"00",
      wren_b      => '0',
      q_b         => GPU_dataread(15 downto 8)
   );
   
   Palette_WriteEnable <= RAM_dataWriteEnable when (RAM_addressCPU(14 downto 8) = "1111111") else "00";

   iramPALA: entity work.dpram
   generic map
   (
       addr_width => 8,
       data_width => 8
   )
   port map
   (
      clock_a     => clk,
      address_a   => RAM_addressCPU(7 downto 0),
      data_a      => RAM_dataWriteCPU(7 downto 0),
      wren_a      => Palette_WriteEnable(0),
      q_a         => open,

      clock_b     => clk,
      address_b   => Color_addr,
      data_b      => x"00",
      wren_b      => '0',
      q_b         => Color_dataread(7 downto 0)
   );
   iramPALB: entity work.dpram
   generic map
   (
       addr_width => 8,
       data_width => 8
   )
   port map
   (
      clock_a     => clk,
      address_a   => RAM_addressCPU(7 downto 0),
      data_a      => RAM_dataWriteCPU(15 downto 8),
      wren_a      => Palette_WriteEnable(1),
      q_a         => open,

      clock_b     => clk,
      address_b   => Color_addr,
      data_b      => x"00",
      wren_b      => '0',
      q_b         => Color_dataread(15 downto 8)
   );
       
   ireg_shadow: entity work.dpram
   generic map
   (
       addr_width => 8,
       data_width => 8
   )
   port map
   (
      clock_a      => clk,
      address_a   => RegBus_Adr,
      data_a      => RegBus_Din,
      wren_a      => RegBus_wren,
      q_a         => open,
   
      clock_b     => clk,
      address_b   => SSMEM_Addr(7 downto 0),
      data_b      => x"00",
      wren_b      => '0',
      q_b         => SSMEM_ReadData_REG(7 downto 0)
   );
   SSMEM_ReadData_REG(15 downto 8) <= (others => '0');
   
   BIOS_address <= std_logic_vector(cpu_addr(11 downto 1));
   iswanbios : entity work.swanbios
   port map
   (
      clk         => clk,
      address     => BIOS_address,
      data        => BIOS_data,
      bios_wraddr => bios_wraddr(11 downto 1),
      bios_wrdata => bios_wrdata,
      bios_wr     => bios_wr
   );
   
   BIOS_addressColor <= std_logic_vector(cpu_addr(12 downto 1));
   iswanbioscolor : entity work.swanbioscolor
   port map
   (
      clk         => clk,
      address     => BIOS_addressColor,
      data        => BIOS_dataColor,
      bios_wraddr => bios_wraddr(12 downto 1),
      bios_wrdata => bios_wrdata,
      bios_wr     => bios_wrcolor
   );
      
   cpu_dataread <= cpu_dataread_16 when cpu_unaligned = '0' else x"00" & cpu_dataread_16(15 downto 8);
  
   process (all)
      variable BiosAccess : std_logic;
   begin
      cpu_dataread_16 <= x"0000";
      
      MemAccessTypeNew <= EXTRAM;
      case (MemAccessType) is
         when BIOS      => cpu_dataread_16 <= BIOS_data;
         when BIOSCOLOR => cpu_dataread_16 <= BIOS_dataColor;
         when EXTRAM    => cpu_dataread_16 <= EXTRAM_dataread;
         when RAMACC    => cpu_dataread_16 <= RAM_dataReadCPU;
         when UNMAPPED  => cpu_dataread_16 <= x"9090";
         when ZERO      => cpu_dataread_16 <= x"0000";
      end case;
      
      BiosAccess := '0';
      if (isColor) then
         if (HW_FLAGS_set = '0' and cpu_addr >= 16#100000# - 8192) then
            BiosAccess       := '1'; 
            MemAccessTypeNew <= BIOSCOLOR;
         end if;
      else
         if (HW_FLAGS_set = '0' and cpu_addr >= 16#100000# - 4096) then
            BiosAccess       := '1'; 
            MemAccessTypeNew <= BIOS;
         end if;
      end if;
      
      EXTRAM_addr      <= '0' & ((BANK_ROM2(3 downto 0) & std_logic_vector(cpu_addr)) and rommask); -- default
      EXTRAM_read      <= '0';
      EXTRAM_write     <= '0';
      EXTRAM_datawrite <= cpu_datawrite;
      EXTRAM_be        <= "00";
      
      RAM_dataWriteEnable <= "00";
      
      if (BiosAccess = '0') then
         case (cpu_addr(19 downto 16)) is
            when x"0" => 
               if (cpu_addr(0) = '0') then
                  RAM_dataWriteEnable <= cpu_be and (cpu_write & cpu_write);
               else
                  RAM_dataWriteEnable <= (cpu_be(0) & cpu_be(1)) and (cpu_write & cpu_write);
               end if;
               MemAccessTypeNew    <= RAMACC;
               if (isColor = '0' and cpu_addr(15 downto 14) /= "00") then
                  MemAccessTypeNew <= UNMAPPED;
               end if;
               
            when x"1" => 
               if (sramMask = x"000000") then
                  MemAccessTypeNew <= ZERO;
               else
                  EXTRAM_addr      <= '1' & ((BANK_SRAM & std_logic_vector(cpu_addr(15 downto 0))) and sramMask);
                  EXTRAM_read      <= CPU_read;
                  EXTRAM_write     <= CPU_write;
                  EXTRAM_be        <= cpu_be;
                  if (cpu_addr(0) = '0') then
                     EXTRAM_be <= cpu_be;
                  else
                     EXTRAM_be        <= cpu_be(0) & '0';
                     EXTRAM_datawrite <= cpu_datawrite(7 downto 0) & x"00";
                  end if;
               end if;
               
            when x"2" =>
               EXTRAM_addr      <= '0' & ((BANK_ROM0 & std_logic_vector(cpu_addr(15 downto 0))) and rommask);
               EXTRAM_read      <= CPU_read;
               EXTRAM_write     <= '0';
               
            when x"3" =>
               EXTRAM_addr      <= '0' & ((BANK_ROM1 & std_logic_vector(cpu_addr(15 downto 0))) and rommask);
               EXTRAM_read      <= CPU_read;
               EXTRAM_write     <= '0';
               
            when others =>
               EXTRAM_addr      <= '0' & ((BANK_ROM2(3 downto 0) & std_logic_vector(cpu_addr)) and rommask);
               EXTRAM_read      <= CPU_read;
               EXTRAM_write     <= '0';
         end case;
      end if;
      
      if (SSMEM_WrEn(1) = '1') then
         RAM_dataWriteEnable <= "11";
      end if;
      
      if (sleep_savestate = '1') then
         EXTRAM_addr      <= "100000" & SSMEM_Addr(18 downto 0);
      end if;
      
      if (SSMEM_WrEn(2) = '1') then
         EXTRAM_datawrite <= SSMEM_WriteData;
         EXTRAM_read      <= '0';
         EXTRAM_write     <= '1';
         EXTRAM_be        <= "11";
      end if;
      
      if (SSMEM_RdEn(2) = '1') then
         EXTRAM_read      <= '1';
         EXTRAM_write     <= '0';
      end if;
      
   end process;
  
   process (clk)
   begin
      if rising_edge(clk) then
         if (reset = '1') then
            cpu_unaligned <= '0';
         else
            MemAccessType <= MemAccessTypeNew;
            cpu_unaligned <= cpu_addr(0);
         end if;
      end if;
   end process;
   
   -- eeprom
   
   ieeprom_int : entity work.eeprom
   generic map
   (
      isExternal           => '0',
      defaultvalue         => x"0000",
      REG_Data_H           => REG_EeIntData_H,
      REG_Data_L           => REG_EeIntData_L,
      REG_Addr_H           => REG_EeIntAddr_H,
      REG_Addr_L           => REG_EeIntAddr_L,
      REG_Cmd              => REG_EeIntCmd,
      REG_SAVESTATE_EEPROM => REG_SAVESTATE_EEPROMINT      
   )
   port map
   (
      clk            => clk, 
      clk_ram        => clk_ram,       
      ce             => ce,     
      reset          => reset,  
      isColor        => isColor,
      
      ramtype        => x"00",
      
      written        => open,
      eeprom_addr    => (9 downto 0 => '0'),
      eeprom_din     => (15 downto 0 => '0'), 
      eeprom_dout    => open,
      eeprom_req     => '0', 
      eeprom_rnw     => '1', 
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(5),
                     
      -- savestates  
      SSBus_Din      => SSBus_Din, 
      SSBus_Adr      => SSBus_Adr, 
      SSBus_wren     => SSBus_wren,
      SSBus_rst      => SSBus_rst, 
      SSBus_Dout     => ss_wired_or(0)
   );
   
   ieeprom_ext : entity work.eeprom
   generic map
   (
      isExternal           => '1',
      defaultvalue         => x"FFFF",
      REG_Data_H           => REG_EeExtData_H,
      REG_Data_L           => REG_EeExtData_L,
      REG_Addr_H           => REG_EeExtAddr_H,
      REG_Addr_L           => REG_EeExtAddr_L,
      REG_Cmd              => REG_EeExtCmd,
      REG_SAVESTATE_EEPROM => REG_SAVESTATE_EEPROMEXT
   )
   port map
   (
      clk            => clk, 
      clk_ram        => clk_ram,       
      ce             => ce,     
      reset          => reset,  
      isColor        => isColor,
      
      ramtype        => ramtype,
      
      written        => eepromWrite,
      eeprom_addr    => eeprom_addr,
      eeprom_din     => eeprom_din, 
      eeprom_dout    => eeprom_dout,
      eeprom_req     => eeprom_req, 
      eeprom_rnw     => eeprom_rnw, 
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(6),
                     
      -- savestates  
      SSBus_Din      => SSBus_Din, 
      SSBus_Adr      => SSBus_Adr, 
      SSBus_wren     => SSBus_wren,
      SSBus_rst      => SSBus_rst, 
      SSBus_Dout     => ss_wired_or(1)
   );
   

end architecture;





