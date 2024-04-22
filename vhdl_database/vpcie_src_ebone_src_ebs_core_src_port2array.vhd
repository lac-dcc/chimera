--------------------------------------------------------------------------
--
-- E-bone - single ports (4 of them) to array type changer
--
--------------------------------------------------------------------------
--
-- Version  Date       Author  Comment
--     0.1  12/12/09    herve  Peliminary
--
-- http://www.esrf.fr
--------------------------------------------------------------------------
-- This is for VERILOG users only.
-- VERILOG does not allow array port.
-- This is a problem since 'ebs_core' E-bone interconnect
-- precisely uses array port (the size of which depending on one parameter,
-- the number of slaves in the system).
-- To overcome this problem, VERILOG users should instantiate
-- this (or a modified version) single port to array type changer
--------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.ebs_pkg.all;

entity port2array is
port (
   eb_dk_1   : in std_logic; -- slave #1 input
   eb_err_1  : in std_logic; -- slave #1 input
   eb_dat_1  : in std32;     -- slave #1 input

   eb_dk_2   : in std_logic; -- slave #2 input
   eb_err_2  : in std_logic; -- slave #2 input
   eb_dat_2  : in std32;     -- slave #2 input

   eb_dk_3   : in std_logic; -- slave #3 input
   eb_err_3  : in std_logic; -- slave #3 input
   eb_dat_3  : in std32;     -- slave #3 input

   eb_dk_4   : in std_logic; -- slave #4 input
   eb_err_4  : in std_logic; -- slave #4 input
   eb_dat_4  : in std32;     -- slave #4 input

   eb_dk_o   : out std_logic_vector(4 downto 1); -- to interconnect
   eb_err_o  : out std_logic_vector(4 downto 1); -- to interconnect
   eb_dat_o  : out std32_a(4 downto 1)           -- to interconnect
);
end port2array;

architecture rtl of port2array is
---------------------------------
begin
   eb_dk_o(1)  <= eb_dk_1;
   eb_err_o(1) <= eb_err_1;
   eb_dat_o(1) <= eb_dat_1;

   eb_dk_o(2)  <= eb_dk_2;
   eb_err_o(2) <= eb_err_2;
   eb_dat_o(2) <= eb_dat_2;

   eb_dk_o(3)  <= eb_dk_3;
   eb_err_o(3) <= eb_err_3;
   eb_dat_o(3) <= eb_dat_3;

   eb_dk_o(4)  <= eb_dk_4;
   eb_err_o(4) <= eb_err_4;
   eb_dat_o(4) <= eb_dat_4;

end rtl;

