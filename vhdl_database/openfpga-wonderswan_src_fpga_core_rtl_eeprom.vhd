library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all; 

use work.pRegisterBus.all;  
use work.pBus_savestates.all;

entity eeprom is
   generic
   (
      isExternal           : std_logic;
      defaultvalue         : std_logic_vector(15 downto 0);
      REG_Data_H           : regmap_type;
      REG_Data_L           : regmap_type;
      REG_Addr_H           : regmap_type;
      REG_Addr_L           : regmap_type;
      REG_Cmd              : regmap_type;
      REG_SAVESTATE_EEPROM : savestate_type
   );
   port 
   (
      clk            : in  std_logic;
      clk_ram        : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
      isColor        : in  std_logic;
      
      ramtype        : in  std_logic_vector(7 downto 0);
      
      written        : out std_logic;
      eeprom_addr    : in  std_logic_vector(9 downto 0);
      eeprom_din     : in  std_logic_vector(15 downto 0);
      eeprom_dout    : out std_logic_vector(15 downto 0);
      eeprom_req     : in  std_logic;
      eeprom_rnw     : in  std_logic;
      
      RegBus_Din     : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr     : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren    : in  std_logic;
      RegBus_rst     : in  std_logic;
      RegBus_Dout    : out std_logic_vector(BUS_buswidth-1 downto 0);
      
      -- savestates     
      SSBus_Din      : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBus_Adr      : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBus_wren     : in  std_logic;
      SSBus_rst      : in  std_logic;
      SSBus_Dout     : out std_logic_vector(SSBUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of eeprom is
  
   -- register
   signal Data        : std_logic_vector(15 downto 0);
   signal Addr        : std_logic_vector(15 downto 0);
   signal Cmd         : std_logic_vector( 7 downto 0);
   
   signal Status      : std_logic_vector( 7 downto 0);
   
   signal Data_L_written : std_logic;
   signal Data_H_written : std_logic;
   signal Cmd_written    : std_logic;
   
   type t_reg_wired_or is array(0 to 4) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;
   
   -- wiring
   signal opcode : std_logic_vector(1 downto 0);
   signal extCmd : std_logic_vector(1 downto 0);
   
   -- internal logic
   type tState is
   (
      OFF,
      IDLE,
      EVALCMD,
      CLEAR,
      OVERWRITE,
      READONE
   );
   signal state : tState;
   
   signal writeEnable  : std_logic := '0';
   
   signal size         : integer range 0 to 1024 := 0;
   
   signal clearCounter : integer range 0 to 1024 := 0;
   signal addrCounter  : integer range 0 to 1024 := 0;
                       
   signal RAMAddrFull  : std_logic_vector( 9 downto 0);
   signal RAMAddr      : std_logic_vector( 9 downto 0);
   signal writevalue   : std_logic_vector(15 downto 0);
   signal readvalue    : std_logic_vector(15 downto 0);
   signal RAMWrEn      : std_logic := '0';
   
   signal wren_b       : std_logic;
         
   -- savestates     
   signal SS_EEPROM      : std_logic_vector(REG_SAVESTATE_EEPROM.upper downto REG_SAVESTATE_EEPROM.lower);
   signal SS_EEPROM_BACK : std_logic_vector(REG_SAVESTATE_EEPROM.upper downto REG_SAVESTATE_EEPROM.lower);

begin 
   iREG_Data_H : entity work.eReg generic map ( REG_Data_H ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), Data( 7 downto 0)     , open             , Data_L_written);  
   iREG_Data_L : entity work.eReg generic map ( REG_Data_L ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), Data(15 downto 8)     , open             , Data_H_written);  
   iREG_Addr_H : entity work.eReg generic map ( REG_Addr_H ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), Addr( 7 downto 0)     , Addr( 7 downto 0));  
   iREG_Addr_L : entity work.eReg generic map ( REG_Addr_L ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(3), Addr(15 downto 8)     , Addr(15 downto 8));  
   iREG_Cmd    : entity work.eReg generic map ( REG_Cmd    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(4), Status                , Cmd              , Cmd_written);  
   
   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   opcode <= Addr(7 downto 6) when size = 64 else Addr(11 downto 10);
   extCmd <= Addr(5 downto 4) when size = 64 else Addr( 9 downto  8);
   
   Status <= x"0F";
   
   RAMAddrFull <= std_logic_vector(to_unsigned(addrCounter, 10));
   
   RAMAddr <= "0000" & RAMAddrFull(5 downto 0) when size = 64  else
                 '0' & RAMAddrFull(8 downto 0) when size = 512 else
               RAMAddrFull;
   
   iramEEPROM: entity work.dpram
   generic map
   (
       addr_width => 10,
       data_width => 16
   )
   port map
   (
      clock_a     => clk,
      address_a   => RAMAddr,
      data_a      => writevalue,
      wren_a      => RAMWrEn,
      q_a         => readvalue,

      clock_b     => clk_ram,
      address_b   => eeprom_addr,
      data_b      => eeprom_din,
      wren_b      => wren_b,
      q_b         => eeprom_dout
   );
   
   wren_b <= '1' when (eeprom_req = '1' and eeprom_rnw = '0') else '0';
   
   iSS_EEPROM : entity work.eReg_SS generic map ( REG_SAVESTATE_EEPROM ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, SSBUS_Dout, SS_EEPROM_BACK, SS_EEPROM); 
               
   SS_EEPROM_BACK(15 downto  0) <= Data;    
   SS_EEPROM_BACK(          16) <= writeEnable;       
               
   process (clk)
   begin
      if rising_edge(clk) then
      
         RAMWrEn <= '0';
         written <= RAMWrEn;
      
         if (reset = '1') then
         
            if (isExternal = '0') then
               state        <= clear;
               clearCounter <= 0;
            else
               state        <= IDLE;
            end if;
            
            Data         <= SS_EEPROM(15 downto  0);
            writeEnable  <= SS_EEPROM(          16);
         
            if (isExternal = '1') then
               case (ramtype) is
                  when x"10"  => size <= 64;
                  when x"20"  => size <= 1024;
                  when x"50"  => size <= 512;
                  when others => size <= 0; state <= OFF;
               end case;
            else
               if (isColor = '1') then
                  size <= 1024;
               else
                  size <= 64;
               end if;
            end if;
               
         else
            
            case (state) is
            
               when OFF =>
                  null;
            
               when IDLE =>
               
                  if (ce = '1' and Data_L_written = '1') then Data( 7 downto 0) <= RegBus_Din; end if;
                  if (ce = '1' and Data_H_written = '1') then Data(15 downto 8) <= RegBus_Din; end if;
               
                  if (ce = '1' and Cmd_written = '1') then
                     state <= EVALCMD;
                  end if;
                  
                  case (size) is
                     when 64     => addrCounter <= to_integer(unsigned(Addr(5 downto 0)));
                     when 512    => addrCounter <= to_integer(unsigned(Addr(8 downto 0)));
                     when 1024   => addrCounter <= to_integer(unsigned(Addr(9 downto 0)));
                     when others => null;
                  end case;
                  
               when EVALCMD =>
                  state <= IDLE;

                  case (Cmd) is
                     when x"10" => -- READ
                        state <= READONE;
                        
                     when x"20" => -- WRITE
                        writevalue <= Data;
                        if (writeEnable = '1') then RAMWrEn <= '1'; end if; 
                     
                     when x"40" =>
                        case (opcode) is
                           when "00" => 
                              case (extCmd) is
                                 when "00" =>
                                    writeEnable <= '0';
                                 
                                 when "01" => -- write all
                                    state       <= OVERWRITE;
                                    writevalue  <= x"FFFF";
                                    addrCounter <= 0;
                                    if (writeEnable = '1') then RAMWrEn <= '1'; end if; 
                                 
                                 when "10" => -- erase all
                                    state       <= OVERWRITE;
                                    writevalue  <= Data;
                                    addrCounter <= 0;
                                    if (writeEnable = '1') then RAMWrEn <= '1'; end if; 
                                 
                                 when "11" =>
                                    writeEnable <= '1';
                                 
                                 when others => null;
                              end case;
                           
                           when "01" => -- read
                              state <= READONE;
                           
                           when "10" => -- write
                              writevalue  <= Data;
                              if (writeEnable = '1') then RAMWrEn <= '1'; end if; 
                           
                           when "11" => -- erase
                              writevalue  <= x"FFFF";
                              if (writeEnable = '1') then RAMWrEn <= '1'; end if; 

                           when others => null;
                        end case;
                     
                     when x"80" => -- RESET
                        writeEnable <= '0';

                     when others => null;
                  end case;
                  
               when CLEAR => 
                  addrCounter <= clearCounter;
                  RAMWrEn     <= '1';
                  if ((isExternal = '1' and clearCounter < size) or (isExternal = '0' and clearCounter < 16#43#)) then
                     clearCounter <= clearCounter + 1;
                     writevalue   <= defaultvalue;
                     if (isExternal = '0') then
                        if (isColor = '1') then
                           case (clearCounter) is
                              when 16#3B# => writevalue <= x"0101";
                              when 16#3C# => writevalue <= x"0027";
                              when 16#3E# => writevalue <= x"0001";
                              when 16#40# => writevalue <= x"0101";
                              when 16#41# => writevalue <= x"0327";
                              -- wonderswancolor
                              when 16#30# => writevalue <= x"1921";
                              when 16#31# => writevalue <= x"0E18";
                              when 16#32# => writevalue <= x"1C0F";
                              when 16#33# => writevalue <= x"211D";
                              when 16#34# => writevalue <= x"180B";
                              when 16#35# => writevalue <= x"190D";
                              when 16#36# => writevalue <= x"1916";
                              when 16#37# => writevalue <= x"001C";
                              when others => null;
                           end case;
                        else
                           case (clearCounter) is
                              when 16#3B# => writevalue <= x"0001";
                              when 16#3C# => writevalue <= x"0024";
                              when 16#3E# => writevalue <= x"0001";
                              -- wonderswancolor
                              when 16#30# => writevalue <= x"1921";
                              when 16#31# => writevalue <= x"0E18";
                              when 16#32# => writevalue <= x"1C0F";
                              when 16#33# => writevalue <= x"211D";
                              when 16#34# => writevalue <= x"180B";
                              when others => null;
                           end case;
                        end if;
                     end if;
                  else
                     state <= IDLE;
                  end if;
                  
               when OVERWRITE =>
                  if (addrCounter + 1 < size and writeEnable = '1') then
                     addrCounter <= addrCounter + 1;
                     RAMWrEn     <= '1';
                  else
                     state <= IDLE;
                  end if;
               
               when READONE =>
                  Data      <= readvalue;
                  state     <= IDLE;
            
            end case;
         

         end if;
      end if;
   end process;
   

end architecture;





