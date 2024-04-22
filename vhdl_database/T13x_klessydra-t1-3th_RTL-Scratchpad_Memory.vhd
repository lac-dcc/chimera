-----------------------------------------------------------------------------------------------------------------
--  SPM -- (Scratchpad Memories)                                                                               --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                           --
--                                                                                                             --
--  Date Modified: 17-11-2019                                                                                  --
-----------------------------------------------------------------------------------------------------------------
--  The SPMs are implemented as low latency single cycle read memories. The number of memory banks in this     --
--  entity is decided by many factors. The first being the SIMD size whcih decides the number of banks per     -- 
--  SPM. The second being whether the hardware accelerator is replicated, whuch will replicate the SPM         --
--  for all the harts in the core. And the last is the number of SPMs configured by the parameter "SPM_NUM".   --
--  Each SPM bank has a read and write port which is 32-bits wide, and the mems are implemented in BRAMs       --
-----------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.klessydra_parameters.all;


---------------------------------------------------------------------------------------------------
entity Scratchpad_memory is
  generic(
    SPM_NUM               : natural; 
    Addr_Width            : natural;
    SIMD                  : natural;
    --------------------------------
    ACCL_NUM              : natural;
    SIMD_BITS             : natural;
    Data_Width            : natural
  );
  port(
    clk_i          : in  std_logic;
    sc_we          : in  array_2d(ACCL_NUM - 1 downto 0)(SIMD*SPM_NUM-1 downto 0);
    sc_addr_wr     : in  array_3d(ACCL_NUM - 1 downto 0)(SIMD*SPM_NUM-1 downto 0)(Addr_Width-(SIMD_BITS+3) downto 0);
    sc_addr_rd     : in  array_3d(ACCL_NUM - 1 downto 0)(SIMD*SPM_NUM-1 downto 0)(Addr_Width-(SIMD_BITS+3) downto 0);
    sc_data_wr     : in  array_3d(ACCL_NUM - 1 downto 0)(SIMD*SPM_NUM-1 downto 0)(Data_Width-1 downto 0);
    sc_data_rd     : out array_3d(ACCL_NUM - 1 downto 0)(SIMD*SPM_NUM-1 downto 0)(Data_Width-1 downto 0)
    );
end Scratchpad_memory;

---------------------------------------------------------------------------------------------------
architecture SC of Scratchpad_memory is

subtype accl_range is integer range ACCL_NUM - 1 downto 0; 

signal mem : array_3d(ACCL_NUM*SIMD*SPM_NUM-1 downto 0)(2**(Addr_Width-(SIMD_BITS+2))-1 downto 0)(Data_Width-1 downto 0);
signal h   : std_logic_vector(ACCL_NUM*SIMD*SPM_NUM downto 0);
attribute ram_style : string;
attribute ram_style of mem : signal is "block";

begin

 --------- replicate logic three times --------------------------------
  spm_replicas : for g in accl_range generate 
  spm_banks    : for h in 0 to SIMD*SPM_NUM -1 generate 
    
    write_logic: process(clk_i) -- 
    begin
      if (clk_i'event and clk_i='1') then
         sc_data_rd(g)(h) <= mem(g*SIMD*SPM_NUM + h)(to_integer(unsigned(sc_addr_rd(g)(h))));
        if sc_we(g)(h) = '1' then         --write mode
          mem(g*SIMD*SPM_NUM + h)(to_integer(unsigned(sc_addr_wr(g)(h)))) <= sc_data_wr(g)(h);
        end if; -- we
      end if; -- clk
    end process;

  end generate spm_banks;
  end generate spm_replicas;
  -- end of replicated logic --------------------------------------------

--------------------------------------------------------------------- end of SPM Logic -----------
--------------------------------------------------------------------------------------------------  

end SC;
--------------------------------------------------------------------------------------------------
-- END of Scratchpad Memory architecture ---------------------------------------------------------
--------------------------------------------------------------------------------------------------
