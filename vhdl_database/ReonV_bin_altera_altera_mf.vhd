
library ieee;
use ieee.std_logic_1164.all;

-- Dummy sld_virtual_jtag - ModelSim crashes on default one

entity sld_virtual_jtag is

    generic (
        lpm_type : string := "SLD_VIRTUAL_JTAG";
                                        -- required by coding standard
        lpm_hint : string := "SLD_VIRTUAL_JTAG";              -- required by coding standard
        sld_auto_instance_index : string := "NO";
                                        -- Yes of auto index is desired and no otherwise
        sld_instance_index      : integer := 0;
                                        -- Index to be used if SLD_AUTO_INSTANCE_INDEX is no
        sld_ir_width       : integer := 1;
                                        -- the width of the IR register
        sld_sim_n_scan         : integer := 0;
                                        -- the number of scans in the simulation model
        sld_sim_total_length   : integer := 0;
                                        -- the total bit width of all DR scan values
        sld_sim_action     : string := "");
                                        -- the actions to be simulated in a format specified by the documentation
    port (
        tdo                : in  std_logic := '0';  -- tdo signal into megafunction
        ir_out             : in  std_logic_vector(sld_ir_width - 1 downto 0) := (others => '0');
                                        -- parallel ir data into megafunction
        tck                : out std_logic;  -- tck signal from megafunction
        tdi                : out std_logic;  -- tdi signal from megafunction
        ir_in              : out std_logic_vector(sld_ir_width - 1 downto 0);
                                        -- paraller ir data from megafunction
        virtual_state_cdr  : out std_logic;  -- cdr state signal of megafunction
        virtual_state_sdr  : out std_logic;  -- sdr state signal of megafunction
        virtual_state_e1dr : out std_logic;
                                        -- e1dr state signal of megafunction
        virtual_state_pdr  : out std_logic;  -- pdr state signal of megafunction
        virtual_state_e2dr : out std_logic;
                                        -- e2dr state signal of megafunction
        virtual_state_udr  : out std_logic;  -- udr state signal of megafunction
        virtual_state_cir  : out std_logic;  -- cir state signal of megafunction
        virtual_state_uir  : out std_logic;  -- uir state signal of megafunction
        jtag_state_tlr     : out std_logic;  -- Test, Logic, Reset state
        jtag_state_rti     : out std_logic;  -- Run, Test, Idle state 
        jtag_state_sdrs    : out std_logic;  -- Select DR scan state
        jtag_state_cdr     : out std_logic;  -- capture DR state
        jtag_state_sdr     : out std_logic;  -- Shift DR state 
        jtag_state_e1dr    : out std_logic;  -- exit 1 dr state
        jtag_state_pdr     : out std_logic;  -- pause dr state 
        jtag_state_e2dr    : out std_logic;  -- exit 2 dr state
        jtag_state_udr     : out std_logic;  -- update dr state 
        jtag_state_sirs    : out std_logic;  -- Select IR scan state
        jtag_state_cir     : out std_logic;  -- capture IR state
        jtag_state_sir     : out std_logic;  -- shift IR state 
        jtag_state_e1ir    : out std_logic;  -- exit 1 IR state
        jtag_state_pir     : out std_logic;  -- pause IR state
        jtag_state_e2ir    : out std_logic;  -- exit 2 IR state 
        jtag_state_uir     : out std_logic;  -- update IR state
        tms                : out std_logic);  -- tms signal
end sld_virtual_jtag;

architecture structural of sld_virtual_jtag is

      
begin  -- structural

-- dummy drivers to avoid modelsim warnings

  tck <= '0';
  tdi <= '0';
  ir_in <= (others => '0');
  virtual_state_cdr <= '0';
  virtual_state_sdr <= '0';
  virtual_state_udr <= '0'; 
  
end structural;

