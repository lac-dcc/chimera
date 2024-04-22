-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  User Interface to Global Clock, Reset and 3-State Controls
-- /___/   /\     Filename : X_STARTUPE2.vhd
-- \   \  /  \    Timestamp : Mon Mar  8 15:49:37 PST 2010
--  \___\/\___\
--
-- Revision:
--    03/08/10 - Initial version.
--    10/26/10 - CR 573665 -- Added PREQ support.
--    08/23/11 - CR 608084 -- Passed USRCCLKO to global signal CCLKO_GLBL 
-- End Revision

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.vcomponents.all;

  entity X_STARTUPE2 is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      PROG_USR : string := "FALSE";
      SIM_CCLK_FREQ : real := 0.0;
      tipd_CLK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_GSR : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_GTS : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_KEYCLEARB : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_PACK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRCCLKO : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRCCLKTS : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRDONEO : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_USRDONETS : VitalDelayType01 :=  (0 ps, 0 ps)
    );

    port (
      CFGCLK               : out std_ulogic;
      CFGMCLK              : out std_ulogic;
      EOS                  : out std_ulogic;
      PREQ                 : out std_ulogic;
      CLK                  : in std_ulogic;
      GSR                  : in std_ulogic;
      GTS                  : in std_ulogic;
      KEYCLEARB            : in std_ulogic;
      PACK                 : in std_ulogic;
      USRCCLKO             : in std_ulogic;
      USRCCLKTS            : in std_ulogic;
      USRDONEO             : in std_ulogic;
      USRDONETS            : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_STARTUPE2 :     entity is true;
  end X_STARTUPE2;

  architecture X_STARTUPE2_V of X_STARTUPE2 is
    constant   CFGMCLK_PERIOD : time       := 20000 ps;
    signal     CFGMCLK_zd     : std_ulogic := '0';

    signal    start_count    : std_ulogic := '0';
    signal    preq_deassert  : std_ulogic := '0';
    signal    EOS_zd        : std_ulogic := '0';
    signal    PREQ_zd        : std_ulogic := '0';
    signal    PROGB_int      : std_ulogic;

    signal    GSR_int          : std_ulogic := '1';
    signal    start_glbl_cclko : std_ulogic := '0';
    signal    CCLKO_GLBL_zd    : std_ulogic := 'H';

-- counters for CCLKO_GLBL
    signal    edge_count_cclko : integer := 0;
    signal    cclko_wait_count : integer := 2;

    TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;
    
    function SUL_TO_STR (sul : std_ulogic)
    return string is
    begin
      if sul = '0' then
        return "0";
      else
        return "1";
      end if;
    end SUL_TO_STR;

    function boolean_to_string(bool: boolean)
    return string is
    begin
      if bool then
        return "TRUE";
      else
        return "FALSE";
      end if;
    end boolean_to_string;

    function getstrlength(in_vec : std_logic_vector)
    return integer is
      variable string_length : integer;
    begin
      if ((in_vec'length mod 4) = 0) then
        string_length := in_vec'length/4;
      elsif ((in_vec'length mod 4) > 0) then
        string_length := in_vec'length/4 + 1;
      end if;
      return string_length;
    end getstrlength;

    signal PROG_USR_BINARY : std_logic_vector(2 downto 0);
    signal SIM_CCLK_FREQ_BINARY : std_ulogic;
    
    begin
    
    
    INIPROC : process
    begin
    -- case PROG_USR is
      if((PROG_USR = "FALSE") or (PROG_USR = "false")) then
        PROG_USR_BINARY <= "000";
      elsif((PROG_USR = "TRUE") or (PROG_USR= "true")) then
        PROG_USR_BINARY <= "111";
      else
        assert FALSE report "Error : PROG_USR = is not FALSE, TRUE." severity error;
      end if;
    -- end case;
    wait;
    end process INIPROC;
    
    CFGMCLK_zd <= not CFGMCLK_zd after CFGMCLK_PERIOD/2.0;

-------------------------------------------------------------------------------
-------------------- PREQ -----------------------------------------------------
-------------------------------------------------------------------------------
    start_count <= '1' when (PREQ_zd = '1' and PACK = '1') else
                   '0';

    PROGB_int <= PROGB_GLBL;

    prcs_deassert : process(CFGMCLK_zd)
    variable  edge_count_var : integer := 0;
    begin
      if(rising_edge(CFGMCLK_zd)) then
         if(start_count='1') then
            edge_count_var := edge_count_var + 1;
         else
            edge_count_var := 0;
         end if;
      end if;

      if(edge_count_var = 35) then
         preq_deassert <= '1';
      else
         preq_deassert <= '0';
      end if;
    end process prcs_deassert;

    prcs_preq : process(PROGB_int, preq_deassert)
    begin
      if(falling_edge(PROGB_int) or rising_edge(preq_deassert)) then
         PREQ_zd <= NOT PROGB_int or NOT preq_deassert;
       end if;
    end process prcs_preq;

-------------------------------------------------------------------------------
-------------------- PREQ ERROR MESSAGE ---------------------------------------
-------------------------------------------------------------------------------
    prcs_pack : process(PACK)
    begin
      if(rising_edge(PACK)) then
        if(PREQ_zd='0') then
           assert false
           report "Error  : PACK received with no associate PREQ in STARTTUPE2 instance"
           severity Warning;
        end if;
      end if;
    end process prcs_pack;
-------------------------------------------------------------------------------
-------------------- GSR_int toggle  ------------------------------------------
-------------------------------------------------------------------------------
    GSR_int <= '0' after 100 ns;

-------------------------------------------------------------------------------
-----------------------    EOS     --------------------------------------------
-------------------------------------------------------------------------------
    EOS_zd <= NOT GSR_int;

-------------------------------------------------------------------------------
--------------------  CCLKO_CCLK  ---------------------------------------------
-------------------------------------------------------------------------------
    prcs_UsrcclkoRiseEdgeCount:process(USRCCLKO)
    begin
      if(rising_edge(USRCCLKO) and (EOS_zd = '1')) then
          if(edge_count_cclko = cclko_wait_count) then
             start_glbl_cclko <= '1';
          else
             edge_count_cclko <= edge_count_cclko + 1;
          end if;
      end if;
    end process prcs_UsrcclkoRiseEdgeCount;

    CCLKO_GLBL_zd <= USRCCLKO when ((start_glbl_cclko = '1')and (USRCCLKTS = '0')) else
                   'H';

-------------------------------------------------------------------------------
-------------------- OUTPUT ---------------------------------------------------
-------------------------------------------------------------------------------

    CFGMCLK <= CFGMCLK_zd;
    PREQ    <= PREQ_zd;
    EOS        <= EOS_zd;
    CCLKO_GLBL <= CCLKO_GLBL_zd;


  end X_STARTUPE2_V;
