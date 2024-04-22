----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:11 10/04/2013 
-- Design Name: 
-- Module Name:    FWtop - Behavioral 
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

entity FWtop is
port(
--ETHERNET PORTS
      -- Client receiver interface
      EMACCLIENTRXDVLD         : out std_logic;
      EMACCLIENTRXFRAMEDROP    : out std_logic;
      EMACCLIENTRXSTATS        : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSVLD     : out std_logic;
      EMACCLIENTRXSTATSBYTEVLD : out std_logic;

      -- Client transmitter interface
      CLIENTEMACTXIFGDELAY     : in  std_logic_vector(7 downto 0);
      EMACCLIENTTXSTATS        : out std_logic;
      EMACCLIENTTXSTATSVLD     : out std_logic;
      EMACCLIENTTXSTATSBYTEVLD : out std_logic;

      -- MAC control interface
      CLIENTEMACPAUSEREQ       : in  std_logic;
      CLIENTEMACPAUSEVAL       : in  std_logic_vector(15 downto 0);


      -- GMII Interface
      GMII_TXD                 : out std_logic_vector(7 downto 0);
      GMII_TX_EN               : out std_logic;
      GMII_TX_ER               : out std_logic;
      GMII_TX_CLK              : out std_logic;
      GMII_RXD                 : in  std_logic_vector(7 downto 0);
      GMII_RX_DV               : in  std_logic;
      GMII_RX_ER               : in  std_logic;
      GMII_RX_CLK              : in  std_logic;


		
      SYSCLK_N, SYSCLK_P : in std_logic ;
        
      PHY_RESET : out std_logic ;
      -- Asynchronous reset
      RESET                    : in  std_logic;

------PCIE PORTS-----------
  pci_exp_txp                   : out std_logic_vector(7 downto 0);
  pci_exp_txn                   : out std_logic_vector(7 downto 0);
  pci_exp_rxp                   : in std_logic_vector(7 downto 0);
  pci_exp_rxn                   : in std_logic_vector(7 downto 0);

  sys_clk_p                     : in std_logic;
  sys_clk_n                     : in std_logic;
  sys_reset_n                   : in std_logic);
end FWtop;

architecture Behavioral of FWtop is

component v6_emac_v1_6_example_design is
   port(

      -- Client receiver interface
      EMACCLIENTRXDVLD         : out std_logic;
      EMACCLIENTRXFRAMEDROP    : out std_logic;
      EMACCLIENTRXSTATS        : out std_logic_vector(6 downto 0);
      EMACCLIENTRXSTATSVLD     : out std_logic;
      EMACCLIENTRXSTATSBYTEVLD : out std_logic;

      -- Client transmitter interface
      CLIENTEMACTXIFGDELAY     : in  std_logic_vector(7 downto 0);
      EMACCLIENTTXSTATS        : out std_logic;
      EMACCLIENTTXSTATSVLD     : out std_logic;
      EMACCLIENTTXSTATSBYTEVLD : out std_logic;

      -- MAC control interface
      CLIENTEMACPAUSEREQ       : in  std_logic;
      CLIENTEMACPAUSEVAL       : in  std_logic_vector(15 downto 0);


      -- GMII Interface
      GMII_TXD                 : out std_logic_vector(7 downto 0);
      GMII_TX_EN               : out std_logic;
      GMII_TX_ER               : out std_logic;
      GMII_TX_CLK              : out std_logic;
      GMII_RXD                 : in  std_logic_vector(7 downto 0);
      GMII_RX_DV               : in  std_logic;
      GMII_RX_ER               : in  std_logic;
      GMII_RX_CLK              : in  std_logic;


		
      SYSCLK_N, SYSCLK_P : in std_logic ;
        
      PHY_RESET : out std_logic ;
      -- Asynchronous reset
      RESET                    : in  std_logic
   );

end component;

component riffa_top_v6_pcie_v2_5 is
  generic (
  PL_FAST_TRAIN	        : boolean := FALSE
    );
  port (
  pci_exp_txp                   : out std_logic_vector(7 downto 0);
  pci_exp_txn                   : out std_logic_vector(7 downto 0);
  pci_exp_rxp                   : in std_logic_vector(7 downto 0);
  pci_exp_rxn                   : in std_logic_vector(7 downto 0);

  sys_clk_p                     : in std_logic;
  sys_clk_n                     : in std_logic;
  sys_reset_n                   : in std_logic
);
end component;


begin


v6_emac_inst : v6_emac_v1_6_example_design
   port map(

      -- Client receiver interface
      EMACCLIENTRXDVLD      => EMACCLIENTRXDVLD, 
      EMACCLIENTRXFRAMEDROP  => EMACCLIENTRXFRAMEDROP,
      EMACCLIENTRXSTATS      => EMACCLIENTRXSTATS,
      EMACCLIENTRXSTATSVLD    => EMACCLIENTRXSTATSVLD,
      EMACCLIENTRXSTATSBYTEVLD => EMACCLIENTRXSTATSBYTEVLD,

      -- Client transmitter interface
      CLIENTEMACTXIFGDELAY => CLIENTEMACTXIFGDELAY,
      EMACCLIENTTXSTATS       => EMACCLIENTTXSTATS ,
      EMACCLIENTTXSTATSVLD  => EMACCLIENTTXSTATSVLD   ,
      EMACCLIENTTXSTATSBYTEVLD => EMACCLIENTTXSTATSBYTEVLD,
      -- MAC control interface
      CLIENTEMACPAUSEREQ    => CLIENTEMACPAUSEREQ,
      CLIENTEMACPAUSEVAL   => CLIENTEMACPAUSEVAL,


      -- GMII Interface
      GMII_TXD               => GMII_TXD,
      GMII_TX_EN             => GMII_TX_EN,
      GMII_TX_ER             => GMII_TX_ER,
      GMII_TX_CLK            => GMII_TX_CLK,
      GMII_RXD               => GMII_RXD,
      GMII_RX_DV             => GMII_RX_DV,
      GMII_RX_ER             => GMII_RX_ER,
      GMII_RX_CLK            => GMII_RX_CLK,


		
      SYSCLK_N		=> SYSCLK_N, 
      SYSCLK_P 		=> SYSCLK_P,
        
      PHY_RESET => PHY_RESET,
      -- Asynchronous reset
      RESET                 => RESET
   );

riffa_pcie_inst : riffa_top_v6_pcie_v2_5
  generic map(
  PL_FAST_TRAIN	   => FALSE)
  port map(
  pci_exp_txp    	      => pci_exp_txp,
  pci_exp_txn	              => pci_exp_txn,
  pci_exp_rxp                 => pci_exp_rxp,
  pci_exp_rxn                 => pci_exp_rxn,

  sys_clk_p      => sys_clk_p,
  sys_clk_n      => sys_clk_n,
  sys_reset_n    => sys_reset_n
);


end Behavioral;

