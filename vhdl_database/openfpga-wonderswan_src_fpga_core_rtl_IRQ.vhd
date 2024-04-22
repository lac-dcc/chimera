library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all; 

use work.pRegisterBus.all;  
use work.pBus_savestates.all;
use work.pReg_savestates.all; 
use work.pReg_swan.all;

entity IRQ is
   port 
   (
      clk                  : in  std_logic;
      ce                   : in  std_logic;
      reset                : in  std_logic;
      isColor              : in  std_logic;
      
      irqrequest           : out std_logic;
      irqvector            : out unsigned(9 downto 0) := (others => '0');
      
      IRQ_LineComp         : in  std_logic;
      IRQ_VBlankTmr        : in  std_logic;
      IRQ_VBlank           : in  std_logic;
      IRQ_HBlankTmr        : in  std_logic;
      
      RegBus_Din           : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr           : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren          : in  std_logic;
      RegBus_rst           : in  std_logic;
      RegBus_Dout          : out std_logic_vector(BUS_buswidth-1 downto 0);
      
      -- debug
      export_irq           : out std_logic_vector(7 downto 0);
      
      -- savestates              
      SSBus_Din            : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBus_Adr            : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBus_wren           : in  std_logic;
      SSBus_rst            : in  std_logic;
      SSBus_Dout           : out std_logic_vector(SSBUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of IRQ is
  
   -- register
   signal INT_BASE         : std_logic_vector(REG_INT_BASE  .upper downto REG_INT_BASE  .lower);
   signal INT_BASE_back    : std_logic_vector(REG_INT_BASE  .upper downto REG_INT_BASE  .lower);
   signal INT_ENABLE       : std_logic_vector(REG_INT_ENABLE.upper downto REG_INT_ENABLE.lower);
   signal INT_STATUS       : std_logic_vector(REG_INT_STATUS.upper downto REG_INT_STATUS.lower);
   
   signal INT_ENABLE_written : std_logic;
   signal INT_ACK_written    : std_logic;
   
   type t_reg_wired_or is array(0 to 3) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;
  
   -- savestates
   signal SS_IRQ           : std_logic_vector(REG_SAVESTATE_IRQ.upper downto REG_SAVESTATE_IRQ.lower);
   signal SS_IRQ_BACK      : std_logic_vector(REG_SAVESTATE_IRQ.upper downto REG_SAVESTATE_IRQ.lower);
   
begin 

   iREG_INT_BASE   : entity work.eReg generic map ( REG_INT_BASE   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), INT_BASE_back, INT_BASE  ); 
   iREG_INT_ENABLE : entity work.eReg generic map ( REG_INT_ENABLE ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), INT_ENABLE   , INT_ENABLE, INT_ENABLE_written); 
   iREG_INT_STATUS : entity work.eReg generic map ( REG_INT_STATUS ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), INT_STATUS   ); 
   iREG_INT_ACK    : entity work.eReg generic map ( REG_INT_ACK    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(3), x"00"        , open   , INT_ACK_written); 

   INT_BASE_back <= (INT_BASE and x"FE") when isColor = '1' else (INT_BASE and x"F8");

   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   iSS_IRQ : entity work.eReg_SS generic map ( REG_SAVESTATE_IRQ ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, SSBUS_Dout, SS_IRQ_BACK, SS_IRQ); 
          
   irqrequest <= '1' when (INT_STATUS and INT_ENABLE) /= x"00" else '0';
          
   export_irq <= INT_STATUS;
   
   
   SS_IRQ_BACK(7 downto 0) <= INT_STATUS;
          
   process (clk)
   begin
      if rising_edge(clk) then
         if (reset = '1') then
            INT_STATUS <= SS_IRQ(7 downto 0);
         elsif (ce = '1') then
         
            -- set
            if (IRQ_LineComp  = '1' and INT_ENABLE(4) = '1') then INT_STATUS(4) <= '1'; end if;
            if (IRQ_VBlankTmr = '1' and INT_ENABLE(5) = '1') then INT_STATUS(5) <= '1'; end if;
            if (IRQ_VBlank    = '1' and INT_ENABLE(6) = '1') then INT_STATUS(6) <= '1'; end if;
            if (IRQ_HBlankTmr = '1' and INT_ENABLE(7) = '1') then INT_STATUS(7) <= '1'; end if;
            
            -- enable masking
            if (INT_ENABLE_written = '1') then
               for i in 0 to 7 loop
                  if (RegBus_Din(i) = '1') then
                     INT_STATUS(i) <= '0';
                  end if;
               end loop;
            end if;
            
            -- clear
            if (INT_ACK_written = '1') then
               if (RegBus_Din(1) = '1') then INT_STATUS(1) <= '0'; end if;
               if (RegBus_Din(4) = '1') then INT_STATUS(4) <= '0'; end if;
               if (RegBus_Din(5) = '1') then INT_STATUS(5) <= '0'; end if;
               if (RegBus_Din(6) = '1') then INT_STATUS(6) <= '0'; end if;
               if (RegBus_Din(7) = '1') then INT_STATUS(7) <= '0'; end if;
            end if;
            
            -- pick highest priority
            for i in 0 to 7 loop
               if (INT_STATUS(i) = '1' and INT_ENABLE(i) = '1') then
                  irqvector <= to_unsigned(((to_integer(unsigned(INT_BASE_back)) + i) * 4), 10);
               end if;
            end loop;
            
         end if;
      end if;
   end process;
               
   

end architecture;





