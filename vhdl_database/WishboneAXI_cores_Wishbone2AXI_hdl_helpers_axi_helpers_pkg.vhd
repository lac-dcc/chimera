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

package axi_helpers_pkg is
constant c_axi4_address_width : integer := 32;
constant c_axi4_data_width : integer := 128;
constant c_axi4_id_width : integer := 4;

type t_axi_interface_mode is (AXI4, AXI4LITE);


subtype t_axi4_address is
  std_logic_vector(c_axi4_address_width-1 downto 0);
  
  
  type t_axi4_m2s is record
     awid : std_logic_vector(c_axi4_id_width - 1 downto 0);
     awaddr :  STD_LOGIC_VECTOR(c_axi4_address_width-1 DOWNTO 0);
     awlen : STD_LOGIC_VECTOR(7 DOWNTO 0);
     awsize : STD_LOGIC_VECTOR(2 DOWNTO 0);
     awburst : STD_LOGIC_VECTOR(1 DOWNTO 0);
     awlock : STD_LOGIC;
     awcache : STD_LOGIC_VECTOR(3 DOWNTO 0);
     awregion: std_logic_vector(3 downto 0);
     awprot : STD_LOGIC_VECTOR(2 DOWNTO 0);
     awqos : STD_LOGIC_VECTOR(3 DOWNTO 0);
     awvalid : STD_LOGIC;     
     wdata : STD_LOGIC_VECTOR(c_axi4_data_width-1 DOWNTO 0);
     wstrb : STD_LOGIC_VECTOR(c_axi4_data_width/8 - 1 DOWNTO 0);
     wlast : STD_LOGIC;
     wvalid : STD_LOGIC;
     bready : STD_LOGIC;
     arid :  STD_LOGIC_VECTOR(c_axi4_id_width - 1 DOWNTO 0);
     araddr : STD_LOGIC_VECTOR(c_axi4_address_width-1 DOWNTO 0);
     arlen :  STD_LOGIC_VECTOR(7 DOWNTO 0);
     arsize :  STD_LOGIC_VECTOR(2 DOWNTO 0);
     arburst : STD_LOGIC_VECTOR(1 DOWNTO 0);
     arlock :  STD_LOGIC;
     arcache : STD_LOGIC_VECTOR(3 DOWNTO 0);
     arregion: std_logic_vector(3 downto 0);
     arprot :  STD_LOGIC_VECTOR(2 DOWNTO 0);
     arqos : STD_LOGIC_VECTOR(3 DOWNTO 0);
     arvalid : STD_LOGIC;
     rready : STD_LOGIC;
  end record t_axi4_m2s;
  

  type t_axi4_s2m is record
     awready : STD_LOGIC;
     wready : STD_LOGIC;
     bid : STD_LOGIC_VECTOR(c_axi4_id_width - 1 DOWNTO 0);
     bresp : STD_LOGIC_VECTOR(1 DOWNTO 0);
     bvalid : STD_LOGIC;
     arready : STD_LOGIC;
     rid : STD_LOGIC_VECTOR(c_axi4_id_width - 1 DOWNTO 0);
     rdata : STD_LOGIC_VECTOR(c_axi4_data_width-1 DOWNTO 0);
     rresp : STD_LOGIC_VECTOR(1 DOWNTO 0);
     rlast : STD_LOGIC;
     rvalid :  STD_LOGIC;
  end record t_axi4_s2m;  
  
  type t_axi4_datagen is record
     waddr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
     wdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
     wvalid : STD_LOGIC;
     raddr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
     rdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
     rvalid : STD_LOGIC;
  end record t_axi4_datagen;
  
  type t_axi4_m2s_array is array (natural range <>) of t_axi4_m2s;
  type t_axi4_s2m_array is array (natural range <>) of t_axi4_s2m;
  type t_axi4_datagen_array is array (natural range <>) of t_axi4_datagen;
  


  function f_axitype_to_str(x   : t_axi_interface_mode) return string;
  


 constant c_axi_m2s_dummy: t_axi4_m2s := (
     awid => ( others => '0' ),
     awaddr => ( others => '0' ),
     awlen => ( others => '0' ),
     awsize => ( others => '0' ),
     awburst => ( others => '0' ),
     awlock => '0',
     awcache => ( others => '0' ),
     awregion => ( others => '0' ),
     awprot => ( others => '0' ),
     awqos => ( others => '0' ),
     awvalid => '0',     
     wdata => ( others => '0' ),
     wstrb => ( others => '0' ),
     wlast => '0',
     wvalid => '0',
     bready => '0',
     arid => ( others => '0' ),
     araddr => ( others => '0' ),
     arlen => ( others => '0' ),
     arsize => ( others => '0' ),
     arburst => ( others => '0' ),
     arlock => '0',
     arcache => ( others => '0' ),
     arregion => ( others => '0' ),
     arprot => ( others => '0' ),
     arqos => ( others => '0' ),
     arvalid => '0',
     rready => '0'
   );

 constant c_axi_s2m_dummy: t_axi4_s2m := (
     awready => '0',
     wready => '0',
     bid => (others => '0'),
     bresp => (others => '0'),
     bvalid => '0',
     arready => '0',
     rid => (others => '0'),
     rdata => (others => '0'),
     rresp => (others => '0'),
     rlast => '0',
     rvalid => '0'
   );
  
end axi_helpers_pkg;

package body  axi_helpers_pkg is

  function f_axitype_to_str(x : t_axi_interface_mode) return string is
  begin
    if x = AXI4 then return "AXI4";
    elsif x = AXI4LITE then return "AXI4LITE";
    else return "AXI4";
    end if;
  end f_axitype_to_str;
  
end axi_helpers_pkg;
