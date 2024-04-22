----------------------------------------------------------------------------------
-- 2 flip-flop synchronizer
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 4.6.2019
-- Modified: 11.6.2019 -> FDCE instantiations
--
-- 2 flip-flop synchronizer to be used with CDC. For control signals only!
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use work.MyPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity sync is
   --generic (
      --Nsignals : integer := 2   -- No. of signals to be synchronized
   --);
   Port ( 
      target_clk : in std_logic; -- target clock
      asyn : in std_logic;  -- async input
      syn : out std_logic -- sync output
   );
end sync;

architecture RTL of sync is
   signal meta: std_logic;   -- intermediate stage
   
   -- ASYNC_REG attribute places the two registers close together
   attribute ASYNC_REG : string;
   attribute ASYNC_REG of ff_1: label is "TRUE";
   attribute ASYNC_REG of ff_2: label is "TRUE";
   
begin
   --process(target_clk)
   --begin
      --if rising_edge(target_clk) then
         --meta <= asyn;
         --syn <= meta;
      --end if;
   --end process;
   
   ff_1: FDCE
      generic map (
         INIT => '0')
      port map (
         Q => meta,
         C => target_clk,
         CE => '1',
         CLR => '0',
         D => asyn
      );
   
   ff_2: FDCE
      generic map (
         INIT => '0')
      port map (
         Q => syn,
         C => target_clk,
         CE => '1',
         CLR => '0',
         D => meta
      );
         
end RTL;