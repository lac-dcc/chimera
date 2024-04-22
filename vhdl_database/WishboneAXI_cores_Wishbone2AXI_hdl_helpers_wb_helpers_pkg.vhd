----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2016 11:46:54 PM
-- Design Name: 
-- Module Name: axi_helpers_pkg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.wishbone_pkg.all;

package wb_helpers_pkg is


  function f_wb_type_to_str(x   : t_wishbone_interface_mode) return string;
  function f_str_to_wb_type(x   : string) return t_wishbone_interface_mode;
  
  function f_str_to_wb_granularity(x   : string) return t_wishbone_address_granularity;
  

  
end wb_helpers_pkg;

package body  wb_helpers_pkg is

  function f_str_to_wb_granularity(x : string) return t_wishbone_address_granularity is
  begin
    if x = "BYTE" then return BYTE;
    elsif x = "WORD" then return WORD;
    else return BYTE;
    end if;
  end f_str_to_wb_granularity;
  
  function f_wb_type_to_str(x : t_wishbone_interface_mode) return string is
  begin
    if x = CLASSIC then return "CLASSIC";
    elsif x = PIPELINED then return "PIPELINED";
    else return "PIPELINED";
    end if;
  end f_wb_type_to_str;
  
  function f_str_to_wb_type(x   : string) return t_wishbone_interface_mode is
  begin
    if x = "CLASSIC" then return CLASSIC;
    elsif x = "PIPELINED" then return PIPELINED;
    else return PIPELINED;
    end if;
  end f_str_to_wb_type;

  
end wb_helpers_pkg;
