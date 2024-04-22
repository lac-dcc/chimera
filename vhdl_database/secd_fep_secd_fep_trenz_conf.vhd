-------------------------------------------------------------------------------
--
-- Title       : Configuration secd_fep_trenz_conf for secd_fep_trenz
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : h:\fpga\secd\activehdl\secd\src\secd_fep_trenz_conf.vhd
-- Generated   : 30.06.2006, 08:38
-- From        : no source file
-- By          : Active-HDL Built-in Configuration Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated configuration file for secd_fep_trenz
--
-------------------------------------------------------------------------------

library secd;
use secd.all;

configuration secd_fep_trenz_conf of secd_fep_trenz is
for syn
	for my_user_ram : user_ram 
		use entity secd.user_ram (sim);
	end for;
end for;
end secd_fep_trenz_conf;
