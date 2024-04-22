library IEEE;
use IEEE.std_logic_1164.all;

package	tube_comp_pack is

component tube port (
    h_addr     : in  std_logic_vector(2 downto 0);
    h_cs_b     : in  std_logic;
    h_data_in  : in  std_logic_vector(7 downto 0);
    h_data_out : out  std_logic_vector(7 downto 0);
    h_phi2     : in  std_logic;
    h_rdnw     : in  std_logic;
    h_rst_b    : in  std_logic;
    h_irq_b    : out  std_logic;
    p_addr     : in  std_logic_vector(2 downto 0);
    p_cs_b     : in  std_logic;
    p_data_in  : in  std_logic_vector(7 downto 0);
    p_data_out : out  std_logic_vector(7 downto 0);
    p_rdnw     : in  std_logic;
    p_phi2     : in  std_logic;
    p_rst_b    : out std_logic;
    p_nmi_b    : out std_logic;
    p_irq_b    : out std_logic
    );
end component;
    
end package;

        
