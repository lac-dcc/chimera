library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;
use work.pReg_swan.all;

entity sound_module5 is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
                 
      soundDMAvalue  : in  std_logic_vector(7 downto 0);
      soundDMAvalid  : in  std_logic;
                                   
      RegBus_Din     : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr     : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren    : in  std_logic;
      RegBus_rst     : in  std_logic;
      RegBus_Dout    : out std_logic_vector(BUS_buswidth-1 downto 0);   
      
      soundEnable    : out std_logic;
      soundoutL      : out signed(12 downto 0) := (others => '0');
      soundoutR      : out signed(12 downto 0) := (others => '0')
   );
end entity;

architecture arch of sound_module5 is

   -- register
   signal SND_HYPER_CTRL      : std_logic_vector(7 downto 0);
   signal SND_HYPER_CHAN_CTRL : std_logic_vector(6 downto 0);
   signal SND_HYPERVOICE      : std_logic_vector(7 downto 0);
   
   signal SND_HYPERVOICE_written : std_logic;

   type t_reg_wired_or is array(0 to 2) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;   

   signal sample      : unsigned(7 downto 0);
   signal volumeMulti : integer range 0 to 8;

begin 

   iREG_SND_HYPER_CTRL      : entity work.eReg generic map ( REG_SND_HYPER_CTRL       ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), SND_HYPER_CTRL     , SND_HYPER_CTRL     );  
   iREG_SND_HYPER_CHAN_CTRL : entity work.eReg generic map ( REG_SND_HYPER_CHAN_CTRL  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), SND_HYPER_CHAN_CTRL, SND_HYPER_CHAN_CTRL);  
   iREG_SND_HYPERVOICE      : entity work.eReg generic map ( REG_SND_HYPERVOICE       ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), SND_HYPERVOICE     , SND_HYPERVOICE     , SND_HYPERVOICE_written);  
   
   soundEnable <= SND_HYPER_CTRL(7);
   
   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   process (clk)
      variable soundvalue  : signed(12 downto 0);  
   begin
      if rising_edge(clk) then
      
         if (reset = '1') then
                 
            soundoutL     <= (others => '0');
            soundoutR     <= (others => '0');
            sample        <= (others => '0');
            
         elsif (ce = '1') then

            case (SND_HYPER_CTRL(1 downto 0)) is
               when "00" => volumeMulti <= 8;
               when "01" => volumeMulti <= 4;
               when "10" => volumeMulti <= 2;
               when "11" => volumeMulti <= 1;
               when others => null;
            end case;
            
            soundvalue := (others => '0');
            case (SND_HYPER_CTRL(3 downto 2)) is
               when "00" => soundvalue := to_signed(to_integer(sample) * volumeMulti, 13);
               when "01" => soundvalue := to_signed((to_integer(sample) - 16#100#) * volumeMulti, 13);
               when "10" => soundvalue := to_signed(to_integer(signed(sample)) * volumeMulti, 13);
               when "11" => soundvalue := to_signed(to_integer(sample), 13);
               when others => null;
            end case;
            
            if (SND_HYPER_CHAN_CTRL(5) = '1') then soundoutL <= soundvalue; else soundoutL <= (others => '0'); end if;
            if (SND_HYPER_CHAN_CTRL(6) = '1') then soundoutR <= soundvalue; else soundoutR <= (others => '0'); end if;
            
         end if;
         
         if (SND_HYPERVOICE_written = '1') then sample <= unsigned(SND_HYPERVOICE); end if;
         if (soundDMAvalid = '1')          then sample <= unsigned(soundDMAvalue);  end if;
      
      end if;
   end process;
  

end architecture;





