----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:44:25 10/09/2017 
-- Design Name: 
-- Module Name:    IO - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AppleIISd is
Port (
    ADD_HIGH : in std_logic_vector(11 downto 8);
    ADD_LOW : in std_logic_vector(1 downto 0);
    B : out std_logic_vector(10 downto 8);
    CARD : in std_logic;
    DATA : inout std_logic_vector (7 downto 0);
    CLK : in std_logic;
    LED : out std_logic;
    NDEV_SEL : in std_logic;
    NG : out std_logic;
    NIO_SEL : in std_logic;
    NIO_STB : in std_logic;
    NOE : out std_logic;
    NWE : out std_logic;
    PHI0 : in std_logic;
    NRESET : in std_logic;
    RNW : in std_logic;
    MISO : in std_logic;
    MOSI : out std_logic;
    NSEL : out std_logic;
    SCLK : out std_logic;
    WP : in std_logic
    
    -- synthesis translate_off
    ;
    data_dbg : out std_logic_vector (7 downto 0);
    add_dbg : out std_logic_vector (1 downto 0);
    data_en_dbg : out std_logic
    -- synthesis translate_on
    
    );
end AppleIISd;

architecture Behavioral of AppleIISd is

    signal data_in : std_logic_vector (7 downto 0);
    signal data_out : std_logic_vector (7 downto 0);
    signal addr_low_int : std_logic_vector (1 downto 0);
    
    signal data_en : std_logic;
    signal pgm_en : std_logic;
        
component SpiController is
Port (
        data_in : in std_logic_vector (7 downto 0);
        data_out : out std_logic_vector (7 downto 0);
        is_read : in  std_logic;
        nreset : in  std_logic;
        addr : in  std_logic_vector (1 downto 0);
        phi0 : in  std_logic;
        ndev_sel : in  std_logic;
        clk : in  std_logic;
        miso: in std_logic;
        mosi : out  std_logic;
        sclk : out  std_logic;
        nsel : out  std_logic;
        wp : in  std_logic;
        card : in  std_logic;
        led : out  std_logic;
        pgm_en : out std_logic
    );
end component;

component AddressDecoder
Port ( 
        A : in  std_logic_vector (11 downto 8);
        B : out  std_logic_vector (10 downto 8);
        CLK : in std_logic;
        PHI0 : in std_logic;
        RNW : in  std_logic;
        NDEV_SEL : in  std_logic;
        NIO_SEL : in  std_logic;
        NIO_STB : in  std_logic;
        NRESET : in std_logic;
        DATA_EN : out  std_logic;
        PGM_EN : in std_logic;
        NG : out  std_logic;
        NOE : out  std_logic;
        NWE : out std_logic
      );
end component;


begin
    spi: SpiController port map(
        data_in => data_in,
        data_out => data_out,
        is_read => RNW,
        nreset => NRESET,
        addr => addr_low_int,
        phi0 => PHI0,
        ndev_sel => NDEV_SEL,
        clk => CLK,
        miso => MISO,
        mosi => MOSI,
        sclk => SCLK,
        nsel => NSEL,
        wp => WP,
        card => CARD,
        led => LED,
        pgm_en => pgm_en
    );
    
    addDec: AddressDecoder port map(
        A => ADD_HIGH,
        B => B,
        CLK => CLK,
        PHI0 => PHI0,
        RNW => RNW,
        NDEV_SEL => NDEV_SEL,
        NIO_SEL => NIO_SEL,
        NIO_STB => NIO_STB,
        NRESET => NRESET,
        DATA_EN => data_en,
        PGM_EN => pgm_en,
        NOE => NOE,
        NWE => NWE,
        NG => NG
    );
    
    DATA <= data_out when (data_en = '1') else (others => 'Z');      -- data bus tristate
    
    -- synthesis translate_off
    data_dbg <= data_in;
    add_dbg <= addr_low_int;
    data_en_dbg <= data_en;
    -- synthesis translate_on
    
    data_latch: process(CLK)
    begin
        if falling_edge(CLK) then
            addr_low_int <= ADD_LOW;
            if (NDEV_SEL = '0') then
                data_in <= DATA;
            end if;
        end if;
    end process;

end Behavioral;

