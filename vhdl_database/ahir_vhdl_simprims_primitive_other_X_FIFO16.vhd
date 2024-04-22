-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16K-Bit FIFO
-- /___/   /\     Filename : X_FIFO16.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:20 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    02/06/06 - Updated the reset requirement message.
--    05/31/06 - Added feature for invalid reset condition. (CR 223364).
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision
  
----- CELL X_FIFO16 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

library STD;
use STD.TEXTIO.ALL;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_FIFO16 is

  generic(
    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";

----- VITAL input wire delays
    tipd_DI    : VitalDelayArrayType01(31 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIP   : VitalDelayArrayType01(3 downto 0)  := (others => (0 ps, 0 ps));
    tipd_RDCLK : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_RDEN  : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_RST   : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WRCLK : VitalDelayType01                   := ( 0 ps, 0 ps);
    tipd_WREN  : VitalDelayType01                   := ( 0 ps, 0 ps);

----- VITAL pin-to-pin propagation delays

    tpd_RDCLK_DO          : VitalDelayArrayType01 (31 downto 0) := (others => (100 ps, 100 ps));
    tpd_RDCLK_DOP         : VitalDelayArrayType01 (3 downto 0)  := (others => (100 ps, 100 ps));
    tpd_RDCLK_EMPTY       : VitalDelayType01                    := ( 100 ps, 100 ps);
    tpd_RDCLK_ALMOSTEMPTY : VitalDelayType01                    := ( 100 ps, 100 ps);
    tpd_RDCLK_RDCOUNT     : VitalDelayArrayType01 (11 downto 0) := (others => (100 ps, 100 ps));
    tpd_RDCLK_RDERR       : VitalDelayType01                    := ( 100 ps, 100 ps);

    tpd_WRCLK_FULL        : VitalDelayType01                    := ( 100 ps, 100 ps);
    tpd_WRCLK_ALMOSTFULL  : VitalDelayType01                    := ( 100 ps, 100 ps);
    tpd_WRCLK_WRCOUNT     : VitalDelayArrayType01 (11 downto 0) := (others => (100 ps, 100 ps));
    tpd_WRCLK_WRERR       : VitalDelayType01                    := ( 100 ps, 100 ps);


    tpd_RST_EMPTY         : VitalDelayType01                    := ( 0 ps, 0 ps);
    tpd_RST_ALMOSTEMPTY   : VitalDelayType01                    := ( 0 ps, 0 ps);
    tpd_RST_FULL          : VitalDelayType01                    := ( 0 ps, 0 ps);
    tpd_RST_ALMOSTFULL    : VitalDelayType01                    := ( 0 ps, 0 ps);
    tpd_RST_RDCOUNT       : VitalDelayArrayType01 (11 downto 0) := (others => (0 ps, 0 ps));
    tpd_RST_RDERR         : VitalDelayType01                    := ( 0 ps, 0 ps);
    tpd_RST_WRCOUNT       : VitalDelayArrayType01 (11 downto 0) := (others => (0 ps, 0 ps));
    tpd_RST_WRERR         : VitalDelayType01                    := ( 0 ps, 0 ps);

----- VITAL recovery time


    trecovery_RST_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    trecovery_RST_RDCLK_negedge_posedge : VitalDelayType := 0 ps;

----- VITAL removal time


    tremoval_RST_WRCLK_negedge_posedge : VitalDelayType  := 0 ps;
    tremoval_RST_RDCLK_negedge_posedge : VitalDelayType  := 0 ps;

----- VITAL setup time

    tsetup_DI_WRCLK_posedge_posedge   : VitalDelayArrayType (31 downto 0) := (others => 0 ps);
    tsetup_DI_WRCLK_negedge_posedge   : VitalDelayArrayType (31 downto 0) := (others => 0 ps);
    tsetup_DIP_WRCLK_posedge_posedge  : VitalDelayArrayType (3 downto 0)  := (others => 0 ps);
    tsetup_DIP_WRCLK_negedge_posedge  : VitalDelayArrayType (3 downto 0)  := (others => 0 ps);
    tsetup_RDEN_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RDEN_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_WREN_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_WREN_WRCLK_negedge_posedge : VitalDelayType := 0 ps;

----- VITAL hold time

    thold_DI_WRCLK_posedge_posedge    : VitalDelayArrayType (31 downto 0) := (others => 0 ps);
    thold_DI_WRCLK_negedge_posedge    : VitalDelayArrayType (31 downto 0) := (others => 0 ps);
    thold_DIP_WRCLK_posedge_posedge   : VitalDelayArrayType (3 downto 0)  := (others => 0 ps);
    thold_DIP_WRCLK_negedge_posedge   : VitalDelayArrayType (3 downto 0)  := (others => 0 ps);
    thold_RDEN_RDCLK_posedge_posedge  : VitalDelayType := 0 ps;
    thold_RDEN_RDCLK_negedge_posedge  : VitalDelayType := 0 ps;
    thold_WREN_WRCLK_posedge_posedge  : VitalDelayType := 0 ps;
    thold_WREN_WRCLK_negedge_posedge  : VitalDelayType := 0 ps;

----- VITAL 
 
    tisd_DI_WRCLK    : VitalDelayArrayType(31 downto 0) := (others => 0 ps); 
    tisd_DIP_WRCLK   : VitalDelayArrayType(3 downto 0)  := (others => 0 ps);
    tisd_RST_WRCLK   : VitalDelayType                   := 0 ps;

    tisd_RDEN_RDCLK  : VitalDelayType                   := 0 ps;
    ticd_RDCLK       : VitalDelayType                   := 0 ps;

    tisd_WREN_WRCLK  : VitalDelayType                   := 0 ps;
    ticd_WRCLK       : VitalDelayType                   := 0 ps;

----- VITAL pulse width 
    tpw_RDCLK_negedge : VitalDelayType := 0 ps;
    tpw_RDCLK_posedge : VitalDelayType := 0 ps;

    tpw_RST_negedge : VitalDelayType := 0 ps;
    tpw_RST_posedge : VitalDelayType := 0 ps;

    tpw_WRCLK_negedge : VitalDelayType := 0 ps;
    tpw_WRCLK_posedge : VitalDelayType := 0 ps;

----- VITAL period
    tperiod_RDCLK_posedge : VitalDelayType := 0 ps;

    tperiod_WRCLK_posedge : VitalDelayType := 0 ps;

    ALMOST_FULL_OFFSET      : bit_vector := X"080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"080"; 
    DATA_WIDTH              : integer    := 36;
    FIRST_WORD_FALL_THROUGH : boolean    := false
    );

  port(
    ALMOSTEMPTY : out std_ulogic;
    ALMOSTFULL  : out std_ulogic;
    DO          : out std_logic_vector (31 downto 0);
    DOP         : out std_logic_vector (3 downto 0);
    EMPTY       : out std_ulogic;
    FULL        : out std_ulogic;
    RDCOUNT     : out std_logic_vector (11 downto 0);
    RDERR       : out std_ulogic;
    WRCOUNT     : out std_logic_vector (11 downto 0);
    WRERR       : out std_ulogic;

    DI          : in  std_logic_vector (31 downto 0);
    DIP         : in  std_logic_vector (3 downto 0);
    RDCLK       : in  std_ulogic;
    RDEN        : in  std_ulogic;
    RST         : in  std_ulogic;
    WRCLK       : in  std_ulogic;
    WREN        : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_FIFO16 : entity is true;

end X_FIFO16;

-- architecture body                    --

architecture X_FIFO16_V of X_FIFO16 is

attribute VITAL_LEVEL0 of X_FIFO16_V : architecture is true;


    constant SYNC_PATH_DELAY: time  := 100 ps;
    
    constant MAX_DO      : integer    := 32;
    constant MAX_DOP     : integer    := 4;
    constant MAX_RDCOUNT : integer    := 12;
    constant MAX_WRCOUNT : integer    := 12;
    constant MSB_MAX_DO  : integer    := 31;
    constant MSB_MAX_DOP : integer    := 3;
    constant MSB_MAX_RDCOUNT : integer    := 11;
    constant MSB_MAX_WRCOUNT : integer    := 11;

    constant MAX_DI      : integer    := 32;
    constant MAX_DIP     : integer    := 4;
    constant MSB_MAX_DI  : integer    := 31;
    constant MSB_MAX_DIP : integer    := 3;

    constant MAX_LATENCY_EMPTY : integer := 3;
    constant MAX_LATENCY_FULL  : integer := 3;

    signal MEM  : std_logic_vector( 16383 downto 0 ) := (others => 'X');
    signal MEMP : std_logic_vector( 2047 downto 0 )  := (others => 'X');

    signal DI_ipd    : std_logic_vector(MSB_MAX_DI downto 0)    := (others => 'X');
    signal DIP_ipd   : std_logic_vector(MSB_MAX_DIP downto 0)   := (others => 'X');
    signal GSR_ipd   : std_ulogic     :=    'X';
    signal RDCLK_ipd : std_ulogic     :=    'X';
    signal RDEN_ipd  : std_ulogic     :=    'X';
    signal RST_ipd   : std_ulogic     :=    'X';
    signal WRCLK_ipd : std_ulogic     :=    'X';
    signal WREN_ipd  : std_ulogic     :=    'X';

    signal DI_dly    : std_logic_vector(MSB_MAX_DI downto 0)    := (others => 'X');
    signal DIP_dly   : std_logic_vector(MSB_MAX_DIP downto 0)   := (others => 'X');
    signal GSR_dly   : std_ulogic     :=    '0';
    signal RDCLK_dly : std_ulogic     :=    'X';
    signal RDEN_dly  : std_ulogic     :=    'X';
    signal RST_dly   : std_ulogic     :=    'X';
    signal WRCLK_dly : std_ulogic     :=    'X';
    signal WREN_dly  : std_ulogic     :=    'X';

    signal DO_zd          : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => '0');
    signal DOP_zd         : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => '0');
    signal ALMOSTEMPTY_zd : std_ulogic     :=    '1';
    signal ALMOSTFULL_zd  : std_ulogic     :=    '0';
    signal EMPTY_zd       : std_ulogic     :=    '1';
    signal FULL_zd        : std_ulogic     :=    '0';
    signal RDCOUNT_zd     : std_logic_vector(MSB_MAX_RDCOUNT  downto 0)    := (others => '0');
    signal RDERR_zd       : std_ulogic     :=    '0';
    signal WRCOUNT_zd     : std_logic_vector(MSB_MAX_WRCOUNT  downto 0)    := (others => '0');
    signal WRERR_zd       : std_ulogic     :=    '0';

  --- Internal Signal Declarations

    signal RST_META    : std_ulogic := '0';

    signal DefDelay    : time := 10 ps;

    signal addr_limit    : integer := 0;
    signal wr_addr       : integer := 0;
    signal rd_addr       : integer := 0;
    signal rd_addr_range : integer := 0;
    signal wr_addr_range : integer := 0;

    signal rd_flag       : std_ulogic := '0';
    signal wr_flag       : std_ulogic := '0';

    signal rdcount_flag  : std_ulogic := '0';

    signal D_W           : integer := 32;
    signal P_W           : integer := 4;

    signal almostempty_limit : real := 0.0;
    signal almostfull_limit  : real := 0.0;

    signal violation : std_ulogic := '0'; 

    signal fwft      : std_ulogic := 'X';

    signal update_from_write_prcs      : std_ulogic := '0';
    signal update_from_read_prcs       : std_ulogic := '0';

    signal ae_empty   : integer := 0;

-- CR 182616 fix
   signal rst_rdckreg : std_logic_vector (2 downto 0) := (others => '0');
   signal rst_wrckreg : std_logic_vector (2 downto 0) := (others => '0');

   signal RDCOUNT_OUT_zd : std_logic_vector(MSB_MAX_RDCOUNT  downto 0)    := (others => '1');
   signal WRCOUNT_OUT_zd : std_logic_vector(MSB_MAX_WRCOUNT  downto 0)    := (others => '1');
   signal DO_OUT_zd      : std_logic_vector(MSB_MAX_DO  downto 0)         := (others => 'X');
   signal DOP_OUT_zd     : std_logic_vector(MSB_MAX_DOP  downto 0)        := (others => 'X');
   signal rst_rdclk_flag : std_ulogic := '0';
   signal rst_wrclk_flag : std_ulogic := '0';

begin

  ---------------------
  --  INPUT PATH DELAYs
  ---------------------

  GSR_dly <= GSR;

  WireDelay     : block
  begin
    DI_WireDelay : for i in MSB_MAX_DI downto 0 generate
        VitalWireDelay (DI_ipd(i),     DI(i),    tipd_DI(i));
    end generate DI_WireDelay;    

    DIP_WireDelay : for i in MSB_MAX_DIP downto 0 generate
        VitalWireDelay (DIP_ipd(i),     DIP(i),    tipd_DIP(i));
    end generate DIP_WireDelay;    

    VitalWireDelay (RDEN_ipd,       RDEN,       tipd_RDEN);
    VitalWireDelay (RDCLK_ipd,      RDCLK,      tipd_RDCLK);
    VitalWireDelay (RST_ipd,        RST,        tipd_RST);
    VitalWireDelay (WREN_ipd,       WREN,       tipd_WREN);
    VitalWireDelay (WRCLK_ipd,      WRCLK,      tipd_WRCLK);

  end block;


  SignalDelay : block
  begin

    DI_Delay : for i in MSB_MAX_DI downto 0 generate
        VitalSignalDelay (DI_dly(i),     DI_ipd(i),    tisd_DI_WRCLK(i));  -- FP ??
    end generate DI_Delay;    

    DIP_Delay : for i in MSB_MAX_DIP downto 0 generate
        VitalSignalDelay (DIP_dly(i),     DIP_ipd(i),    tisd_DIP_WRCLK(i));  -- FP ??
    end generate DIP_Delay;    

    VitalSignalDelay (RDEN_dly,     RDEN_ipd,   tisd_RDEN_RDCLK);          -- FP ??
    VitalSignalDelay (RDCLK_dly,    RDCLK_ipd,  ticd_RDCLK);
    VitalSignalDelay (RST_dly,      RST_ipd,    tisd_RST_WRCLK);           -- FP ??
    VitalSignalDelay (WREN_dly,     WREN_ipd,   tisd_WREN_WRCLK);          -- FP ??
    VitalSignalDelay (WRCLK_dly,    WRCLK_ipd,  ticd_WRCLK);


  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------



--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_initialize:process
  variable first_time        : boolean    := true;
  variable addr_limit_var    : integer    := 0; 
  variable fwft_var          : std_ulogic := 'X';
  variable rd_offset_stdlogic : std_logic_vector (ALMOST_EMPTY_OFFSET'length-1 downto 0);
  variable rd_offset_int : integer := 0;
  variable wr_offset_stdlogic : std_logic_vector (ALMOST_FULL_OFFSET'length-1 downto 0);
  variable wr_offset_int : integer := 0;
  variable Message : LINE;
  variable ae_empty_var      : integer := 0;

  begin
     if (first_time) then
       case  DATA_WIDTH is
            when 4  => 
                      addr_limit_var := 4096;
                      D_W <= 4;
                      P_W <= 0;
            when 9  =>
                      addr_limit_var := 2048;
                      D_W <= 8;
                      P_W <= 1;
            when 18 => 
                      addr_limit_var := 1024;
                      D_W <= 16; 
                      P_W <= 2;
            when 36 => 
                      addr_limit_var := 512;
                      D_W <= 32;
                      P_W <= 4;
            when others =>
                    GenericValueCheckMessage
                      ( HeaderMsg            => " Attribute Syntax Error ",
                        GenericName          => " DATA_WIDTH ",
                        EntityName           => "X_FIFO16",
                        GenericValue         => DATA_WIDTH,
                        Unit                 => "",
                        ExpectedValueMsg     => " The Legal values for this attribute are ",
                        ExpectedGenericValue => " 4, 9, 18 and 36 ",
                        TailMsg              => "",
                        MsgSeverity          => error
                        );
       end case;

       rd_offset_stdlogic := To_StdLogicVector(ALMOST_EMPTY_OFFSET);
       rd_offset_int := SLV_TO_INT(rd_offset_stdlogic);

       wr_offset_stdlogic := To_StdLogicVector(ALMOST_FULL_OFFSET);
       wr_offset_int := SLV_TO_INT(wr_offset_stdlogic);

       case FIRST_WORD_FALL_THROUGH is
            when true  =>
                         fwft_var     := '1';
                         ae_empty_var := rd_offset_int - 2;
            when false =>
                         fwft_var     := '0';
                         ae_empty_var := rd_offset_int - 1;
            when others =>
                    GenericValueCheckMessage
                      ( HeaderMsg            => " Attribute Syntax Error ",
                        GenericName          => " FIRST_WORD_FALL_THROUGH ",
                        EntityName           => "X_FIFO16",
                        GenericValue         => FIRST_WORD_FALL_THROUGH,
                        Unit                 => "",
                        ExpectedValueMsg     => " The Legal values for this attribute are ",
                        ExpectedGenericValue => " true or false ",
                        TailMsg              => "",
                        MsgSeverity          => error
                        );
       end case;

       if ((fwft_var = '0') and ((rd_offset_int < 5) or (rd_offset_int > addr_limit_var - 4))) then
          write( Message, STRING'("Attribute Syntax Error : ") );
          write( Message, STRING'("The attribute ") );
          write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO16 is set to ") );
          write( Message, rd_offset_int);
          write( Message, STRING'(". Legal values for this attribute are ") );
          write( Message, 5);
          write( Message, STRING'(" to ") );
          write( Message, addr_limit_var - 4 );
          ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
          DEALLOCATE (Message);
       end if;
 
       if ((fwft_var = '0') and ((wr_offset_int < 4) or (wr_offset_int > addr_limit_var - 5))) then
          write( Message, STRING'("Attribute Syntax Error : ") );
          write( Message, STRING'("The attribute ") );
          write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO16 is set to ") );
          write( Message, wr_offset_int);
          write( Message, STRING'(". Legal values for this attribute are ") );
          write( Message, 4);
          write( Message, STRING'(" to ") );
          write( Message, addr_limit_var - 5 );
          ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
          DEALLOCATE (Message);
       end if;

       if ((fwft_var = '1') and ((rd_offset_int < 6) or (rd_offset_int > addr_limit_var - 3))) then
          write( Message, STRING'("Attribute Syntax Error : ") );
          write( Message, STRING'("The attribute ") );
          write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO16 is set to ") );
          write( Message, rd_offset_int);
          write( Message, STRING'(". Legal values for this attribute are ") );
          write( Message, 6);
          write( Message, STRING'(" to ") );
          write( Message, addr_limit_var - 3 );
          ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
          DEALLOCATE (Message);
       end if;

       if ((fwft_var = '1') and ((wr_offset_int < 4) or (wr_offset_int > addr_limit_var - 5))) then
          write( Message, STRING'("Attribute Syntax Error : ") );
          write( Message, STRING'("The attribute ") );
          write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO16 is set to ") );
          write( Message, wr_offset_int);
          write( Message, STRING'(". Legal values for this attribute are ") );
          write( Message, 4);
          write( Message, STRING'(" to ") );
          write( Message, addr_limit_var - 5 );
          ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
          DEALLOCATE (Message);
       end if;


       addr_limit <= addr_limit_var;
       fwft       <= fwft_var;
       ae_empty   <= ae_empty_var;
       first_time := false;
     end if;
     wait;
  end process prcs_initialize;

--####################################################################
--#####                         CR 182616                        #####
--####################################################################
  prcs_rst_rdin_wrin:process(RST_dly, RDEN_dly, WREN_dly)
  begin
     if(RST_dly = '1') then
       if(RDEN_dly = '1') then
          assert false
          report "Warning : RDEN on X_FIFO16  is high when RST is high. RDEN should be low during reset."
          severity Warning;
       end if;

       if(WREN_dly = '1') then
          assert false
          report "Warning : WREN on X_FIFO16  is high when RST is high. WREN should be low during reset."
          severity Warning;
       end if;
     end if;
  end process prcs_rst_rdin_wrin;
-------------------------------------------
  prcs_3clkrst_readwrite:process(RDCLK_dly, WRCLK_dly)
  variable  rst_rdckreg_var : std_logic_vector (2 downto 0) := (others => '0');
  variable  rst_wrckreg_var : std_logic_vector (2 downto 0) := (others => '0');
  begin
    if(rising_edge(RDCLK_dly)) then
      rst_rdckreg_var(2) := RST_dly and rst_rdckreg_var(1);
      rst_rdckreg_var(1) := RST_dly and rst_rdckreg_var(0);
      rst_rdckreg_var(0) := RST_dly;
    end if;   
           
    if(rising_edge(WRCLK_dly)) then
      rst_wrckreg_var(2) := RST_dly and rst_wrckreg_var(1);
      rst_wrckreg_var(1) := RST_dly and rst_wrckreg_var(0);
      rst_wrckreg_var(0) := RST_dly;
    end if;   
    
    rst_rdckreg <= rst_rdckreg_var;
    rst_wrckreg <= rst_wrckreg_var;
  end process prcs_3clkrst_readwrite;

  prcs_2clkrst:process(RST_dly)
  begin
    rst_rdclk_flag <= '0';
    rst_wrclk_flag <= '0';
        
      if(falling_edge(RST_dly)) then
         if((rst_rdckreg(2) ='0') or (rst_rdckreg(1) ='0') or (rst_rdckreg(0) ='0')) then  
             assert false
             report "Error : RST signal on X_FIFO16 stays high for less than three RDCLK clock cycles. RST has to stay high for more than three RDCLK clock cycles"
             severity Error;
             rst_rdclk_flag <= '1';
         end if;
         if((rst_wrckreg(2) ='0') or (rst_wrckreg(1) ='0') or (rst_wrckreg(0) ='0')) then  
             assert false
             report "Error : RST signal on X_FIFO16 stays high for less than three WRCLK clock cycles. RST has to stay high for more than three WRCLK clock cycles"
             severity Error;
             rst_wrclk_flag <= '1';
         end if;
      end if;
  end process prcs_2clkrst;

--####################################################################
--#####                         Read                             #####
--####################################################################
  prcs_read:process(RDCLK_dly, RST_dly, GSR_dly, update_from_write_prcs, rst_rdclk_flag, rst_wrclk_flag)
  variable first_time        : boolean    := true;
  variable rd_addr_var       : integer    := 0;
  variable wr_addr_var       : integer    := 0;
  variable rdcount_var       : integer    := 0;

  variable rd_flag_var       : std_ulogic := '0';
  variable wr_flag_var       : std_ulogic := '0';

  variable rdcount_flag_var  : std_ulogic := '0';

  variable rd_offset_stdlogic : std_logic_vector (ALMOST_EMPTY_OFFSET'length-1 downto 0);
  variable rd_offset_int : integer := 0;

  variable do_in             : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => 'X');
  variable dop_in            : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => 'X');

  variable almostempty_int   : std_ulogic_vector(3 downto 0) := (others => '1');
  variable empty_int         : std_ulogic_vector(3 downto 0) := (others => '1');
  variable empty_ram         : std_ulogic_vector(3 downto 0) := (others => '1');

  variable addr_limit_var    : integer    := 0;

  variable wr1_addr_var      : integer := 0;
  variable wr1_flag_var      : std_ulogic := '0';
  variable rd_prefetch_var   : integer := 0;
  variable rd_prefetch_flag_var  : std_ulogic := '0';

-- CR 195129  fix from verilog (may not be necessary for vhdl)
-- Added ren_var/wren_var to remember the old val of RDEN_dly/WREN_dly

  variable rden_var  : std_ulogic := '0';
  variable wren_var  : std_ulogic := '0';

  begin
     if((GSR_dly = '1') or (RST_dly = '1'))then
       rd_addr <= 0;
       rd_flag <= '0';

       rd_addr_var  := 0;
       wr_addr_var  := 0;
       wr1_addr_var := 0;
       rd_prefetch_var := 0;
   
       rdcount_var := 0;
       
       rd_flag_var  := '0';
       wr_flag_var  := '0';
       wr1_flag_var := '0';
       rd_prefetch_flag_var := '0';
  
       rdcount_flag_var := '0';

       empty_int       :=  (others => '1');
       almostempty_int :=  (others => '1');
       empty_ram       :=  (others => '1');

       ALMOSTEMPTY_zd <= '1';
       EMPTY_zd <= '1';
       RDERR_zd <= '0';
       RDCOUNT_zd <= (others => '0');

       if(GSR_dly = '1') then
          DO_zd((D_W -1) downto 0) <= (others => '0');
          DOP_zd((P_W -1) downto 0) <= (others => '0');
       end if;

     elsif ((rst_rdclk_flag = '1') or (rst_wrclk_flag = '1'))then

       rd_addr <= 0;
       rd_flag <= '0';

       rd_addr_var  := 0;
       wr_addr_var  := 0;
       wr1_addr_var := 0;
       rd_prefetch_var := 0;
   
       rdcount_var := 0;
       
       rd_flag_var  := '0';
       wr_flag_var  := '0';
       wr1_flag_var := '0';
       rd_prefetch_flag_var := '0';
  
       rdcount_flag_var := '0';

       empty_int       :=  (others => '1');
       almostempty_int :=  (others => '1');
       empty_ram       :=  (others => '1');

       ALMOSTEMPTY_zd <= 'X';
       EMPTY_zd <= 'X';
       RDERR_zd <= 'X';
       RDCOUNT_zd <= (others => 'X');

       DO_zd((D_W -1) downto 0) <= (others => 'X');
       DOP_zd((P_W -1) downto 0) <= (others => 'X');
       
     elsif ((GSR_dly = '0') and (RST_dly = '0'))then

       rden_var := RDEN_dly;
       wren_var := WREN_dly;

       if(rising_edge(RDCLK_dly)) then

         rd_offset_stdlogic := To_StdLogicVector(ALMOST_EMPTY_OFFSET);
         rd_offset_int := SLV_TO_INT(rd_offset_stdlogic);

         rd_flag_var := rd_flag;
         wr_flag_var := wr_flag;

         rd_addr_var := rd_addr;
         wr_addr_var := wr_addr;

         rdcount_var := SLV_TO_INT(RDCOUNT_zd);
         rdcount_flag_var := rdcount_flag;

         if(fwft = '0') then
           addr_limit_var := addr_limit;
           if((rden_var = '1') and (rd_addr_var /= rdcount_var)) then
              DO_zd   <= do_in;
              DOP_zd  <= dop_in;
              rd_addr_var  := (rd_addr_var + 1) mod addr_limit;
              if(rd_addr_var = 0) then 
                  rd_flag_var := NOT rd_flag_var;
              end if;
           end if;
           if (((rd_addr_var = rdcount_var) and (empty_ram(3) = '0')) or 
              ((rden_var = '1') and (empty_ram(1) = '0'))) then
              do_in((D_W-1) downto 0) := MEM((((rdcount_var)*D_W)+(D_W -1)) downto ((rdcount_var)*D_W));
              dop_in((P_W-1) downto 0) := MEMP((((rdcount_var)*P_W)+(P_W -1)) downto ((rdcount_var)*P_W));
              rdcount_var := (rdcount_var + 1) mod addr_limit;

              if(rdcount_var = 0) then
                 rdcount_flag_var := NOT rdcount_flag_var;
              end if;
           end if;
-----------------  FP --------------------------------
         elsif(fwft = '1') then
           if((rden_var = '1') and (rd_addr_var /= rd_prefetch_var)) then
              rd_prefetch_var := (rd_prefetch_var + 1) mod addr_limit;
              if(rd_prefetch_var = 0) then 
                  rd_prefetch_flag_var := NOT rd_prefetch_flag_var;
              end if;
           end if;
           if((rd_prefetch_var = rd_addr_var) and (rd_addr_var /= rdcount_var)) then
             DO_zd   <= do_in;
             DOP_zd <= dop_in;
             rd_addr_var  := (rd_addr_var + 1) mod addr_limit;
             if(rd_addr_var = 0) then 
                rd_flag_var := NOT rd_flag_var;
             end if;
           end if;
           if(((rd_addr_var = rdcount_var) and (empty_ram(3) = '0')) or
              ((rden_var = '1')  and (empty_ram(1) = '0')) or 
              ((rden_var = '0')  and (empty_ram(1) = '0') and (rd_addr_var = rdcount_var))) then 
              do_in((D_W-1) downto 0) := MEM((((rdcount_var)*D_W)+(D_W -1)) downto ((rdcount_var)*D_W));
              dop_in((P_W-1) downto 0) := MEMP((((rdcount_var)*P_W)+(P_W -1)) downto ((rdcount_var)*P_W));
              rdcount_var := (rdcount_var + 1) mod addr_limit;
              if(rdcount_var = 0) then 
                 rdcount_flag_var := NOT rdcount_flag_var;
              end if;
           end if;
         end if;  ---  end if(fwft = '1')


         ALMOSTEMPTY_zd <= almostempty_int(3);
         if((((rdcount_var + ae_empty) >= wr_addr_var) and (rdcount_flag_var = wr_flag_var)) or (((rdcount_var + ae_empty) >= (wr_addr_var + addr_limit)) and (rdcount_flag_var /= wr_flag_var))) then    
            almostempty_int(3) := '1';
            almostempty_int(2) := '1';
            almostempty_int(1) := '1';
            almostempty_int(0) := '1';
         elsif(almostempty_int(2)  = '0') then
            almostempty_int(3) :=  almostempty_int(0);
            almostempty_int(0) :=  '0';
         end if;

         if(fwft = '0') then
           if((rdcount_var = rd_addr_var) and (rdcount_flag_var = rd_flag_var)) then
              EMPTY_zd <= '1';
           else
             EMPTY_zd  <= '0';
           end if;
         elsif(fwft = '1') then
           if((rd_prefetch_var = rd_addr_var) and (rd_prefetch_flag_var = rd_flag_var)) then
             EMPTY_zd <=  '1';
           else
             EMPTY_zd  <= '0';
           end if;
         end if;   
          
         if((rdcount_var = wr_addr_var) and (rdcount_flag_var = wr_flag_var)) then
           empty_ram(2) := '1';
           empty_ram(1) := '1';
           empty_ram(0) := '1';
         else
           empty_ram(2) := empty_ram(1);
           empty_ram(1) := empty_ram(0);
           empty_ram(0) := '0';
         end if;
           
         if((rdcount_var = wr1_addr_var) and (rdcount_flag_var = wr1_flag_var)) then
           empty_ram(3) := '1';
         else
           empty_ram(3) := '0';
         end if;

         wr1_addr_var := wr_addr;
         wr1_flag_var := wr_flag;

         if (not (rst_rdclk_flag or rst_wrclk_flag) = '1') then
           RDCOUNT_zd <= CONV_STD_LOGIC_VECTOR(rdcount_var, MAX_RDCOUNT);       
         end if;

         if((rden_var = '1') and (EMPTY_zd = '1')) then
             RDERR_zd <= '1';
--         elsif(rden_var = '0') then
         else
             RDERR_zd <= '0';
         end if; -- end ((rden_var = '1') and (empty_int /= '1'))

        update_from_read_prcs <= NOT update_from_read_prcs;

       end if; -- end (rising_edge(RDCLK_dly))

     end if; -- end (GSR_dly = 1)

     if(update_from_write_prcs'event) then
       wr_addr_var := wr_addr;
       wr_flag_var := wr_flag;
       if((((rdcount_var + ae_empty) <  wr_addr_var)  and (rdcount_flag_var = wr_flag_var)) or 
          (((rdcount_var + ae_empty) <  ( wr_addr_var + addr_limit)) and (rdcount_flag_var /= wr_flag_var))) then    
          if(wren_var = '1') then
             almostempty_int(2) := almostempty_int(1);
             almostempty_int(1) := '0';
          end if;
       else
           almostempty_int(2) := '1';
           almostempty_int(1) := '1';
       end if;
     end if;

     rd_addr <= rd_addr_var;
     rd_flag <= rd_flag_var;
     rdcount_flag <= rdcount_flag_var;


  end process prcs_read;

--####################################################################
--#####                         Write                            #####
--####################################################################
  prcs_write:process(WRCLK_dly, RST_dly, GSR_dly, update_from_read_prcs, rst_rdclk_flag, rst_wrclk_flag)
  variable first_time        : boolean    := true;
  variable wr_addr_var       : integer := 0;
  variable rd_addr_var       : integer := 0;
  variable rdcount_var       : integer := 0;
  variable wrcount_var       : integer := 0;

  variable rd_flag_var       : std_ulogic := '0';
  variable wr_flag_var       : std_ulogic := '0';

  variable rdcount_flag_var  : std_ulogic := '0';

  variable wr_offset_stdlogic : std_logic_vector (ALMOST_FULL_OFFSET'length-1 downto 0);
  variable wr_offset_int : integer := 0;

  variable almostfull_int : std_ulogic_vector(3 downto 0) := (others => '0');
  variable full_int       : std_ulogic_vector(3 downto 0) := (others => '0');

-- CR 195129  fix from verilog (may not be necessary for vhdl)
-- Added ren_var/wren_var to remember the old val of RDEN_dly/WREN_dly

  variable rden_var  : std_ulogic := '0';
  variable wren_var  : std_ulogic := '0';

  begin
    if ((GSR_dly = '1') or (RST_dly = '1') or (rst_rdclk_flag = '1') or (rst_wrclk_flag = '1'))then
        wr_addr_var := 0;
        wr_addr <=  0;
        wr_flag <= '0';

        wr_addr_var := 0;
        rd_addr_var := 0;
        rdcount_var := 0;
        wrcount_var := 0;

        rd_flag_var := '0';
        wr_flag_var := '0';

        rdcount_flag_var  := '0';

        full_int       :=  (others => '0');
        almostfull_int :=  (others => '0');

        if ((GSR_dly = '1') or (RST_dly = '1'))then
          ALMOSTFULL_zd <= '0';      
          FULL_zd <= '0';            
          WRERR_zd <= '0';           
          WRCOUNT_zd <= (others => '0');
        else
          ALMOSTFULL_zd <= 'X';       
          FULL_zd <= 'X';             
          WRERR_zd <= 'X';            
          WRCOUNT_zd <= (others => 'X');
        end if;
        
    elsif((GSR_dly = '0') and (RST_dly = '0'))then
      rden_var := RDEN_dly;
      wren_var := WREN_dly;

      if(rising_edge(WRCLK_dly)) then

        wr_offset_stdlogic := To_StdLogicVector(ALMOST_FULL_OFFSET);
        wr_offset_int := SLV_TO_INT(wr_offset_stdlogic);

        rd_flag_var := rd_flag;
        wr_flag_var := wr_flag;

        rd_addr_var := rd_addr;
        wr_addr_var := wr_addr;

        rdcount_var := SLV_TO_INT(RDCOUNT_zd);
        rdcount_flag_var := rdcount_flag;

        if((wren_var = '1') and (full_int(1)= '0') and (RST_dly = '0'))then
          MEM((((wr_addr_var)*D_W) +(D_W-1)) downto ((wr_addr_var)*D_W)) <= DI_dly((D_W -1) downto 0);
          MEMP((((wr_addr_var)*P_W) +(P_W-1)) downto ((wr_addr_var)*P_W)) <= DIP_dly((P_W -1) downto 0);

          wr_addr_var := (wr_addr_var + 1) mod addr_limit;
         
          if(wr_addr_var = 0) then
            wr_flag_var := NOT wr_flag_var;
          end if;
        end if; -- if((wren_var = '1') and (FULL_zd = '0') ....      

        if((wren_var = '1') and (full_int(1) = '1')) then 
            WRERR_zd <= '1';
        else
            WRERR_zd <= '0';
        end if;

        ALMOSTFULL_zd <= almostfull_int(3);
        if((((rdcount_var + addr_limit) <= (wr_addr_var + wr_offset_int)) and (rdcount_flag_var = wr_flag_var)) or ((rdcount_var <= (wr_addr_var + wr_offset_int)) and (rdcount_flag_var /= wr_flag_var))) then    
          almostfull_int(3) := '1';
          almostfull_int(2) := '1';
          almostfull_int(1) := '1';
          almostfull_int(0) := '1';
        elsif(almostfull_int(2)  = '0') then
          almostfull_int(3) := almostfull_int(0);
          almostfull_int(0) :=  '0';
        end if;
            

        FULL_zd <= full_int(1);
        if((rdcount_var = wr_addr_var) and (rdcount_flag_var /= wr_flag_var)) then
          full_int(1) := '1';
          full_int(0) := '1';
        else
          full_int(1) := full_int(0);
          full_int(0) := '0';
        end if;

        update_from_write_prcs <= NOT update_from_write_prcs;

        WRCOUNT_zd <= CONV_STD_LOGIC_VECTOR( wr_addr_var, MAX_WRCOUNT);

        wr_addr <= wr_addr_var;
        wr_flag <= wr_flag_var;

      end if; -- if(rising(WRCLK_dly))

    end if; -- if(GSR_dly = '1'))


    if(update_from_read_prcs'event) then
       rdcount_var := SLV_TO_INT(RDCOUNT_zd);
       rdcount_flag_var := rdcount_flag;
       if((((rdcount_var + addr_limit) > (wr_addr_var + wr_offset_int)) and (rdcount_flag_var = wr_flag_var)) or ((rdcount_var > (wr_addr_var + wr_offset_int)) and (rdcount_flag_var /= wr_flag_var))) then    
--         if(rden_var = '1') then
-- replaced the above line with line below
-- fp -- 09_10_03

           if(((rden_var = '1') and (EMPTY_zd = '0')) or ((((rd_addr_var + 1) mod addr_limit) = rdcount_var) and (almostfull_int(1) = '1'))) then
              almostfull_int(2) := almostfull_int(1);
              almostfull_int(1) := '0';
           end if;
       else
           almostfull_int(2) := '1';
           almostfull_int(1) := '1';
       end if;
    end if;

  end process prcs_write;

  
  -- matching HW behavior to pull up the unused output bits
  prcs_x_1_output: process (WRCOUNT_zd, RDCOUNT_zd, DO_zd, DOP_zd)
  begin  -- process prcs_x_1_output

    case DATA_WIDTH is
      when 4  => 
                WRCOUNT_OUT_zd <= WRCOUNT_zd;
                RDCOUNT_OUT_zd <= RDCOUNT_zd;
                DO_OUT_zd(3 downto 0) <= DO_zd(3 downto 0);
      when 9  =>
                WRCOUNT_OUT_zd(10 downto 0) <= WRCOUNT_zd(10 downto 0);
                RDCOUNT_OUT_zd(10 downto 0) <= RDCOUNT_zd(10 downto 0);
                DO_OUT_zd(7 downto 0) <= DO_zd(7 downto 0);
                DOP_OUT_zd(0 downto 0) <= DOP_zd(0 downto 0);
      when 18 =>
                WRCOUNT_OUT_zd(9 downto 0) <= WRCOUNT_zd(9 downto 0);
                RDCOUNT_OUT_zd(9 downto 0) <= RDCOUNT_zd(9 downto 0);
                DO_OUT_zd(15 downto 0) <= DO_zd(15 downto 0);
                DOP_OUT_zd(1 downto 0) <= DOP_zd(1 downto 0);
      when 36 => 
                WRCOUNT_OUT_zd(8 downto 0) <= WRCOUNT_zd(8 downto 0);
                RDCOUNT_OUT_zd(8 downto 0) <= RDCOUNT_zd(8 downto 0);
                DO_OUT_zd(31 downto 0) <= DO_zd(31 downto 0);
                DOP_OUT_zd(3 downto 0) <= DOP_zd(3 downto 0);
      when others =>
                WRCOUNT_OUT_zd <= WRCOUNT_zd;
                RDCOUNT_OUT_zd <= RDCOUNT_zd;
                DO_OUT_zd <= DO_zd;
    end case;
  end process prcs_x_1_output;

  
--####################################################################
--#####                   TIMING CHECKS                          #####
--####################################################################
--prcs_tmngchk:process(RDCLK_dly, WRCLK_dly) 
  prcs_tmngchk:process

--  Pin Timing Violations (all input pins)
     variable Tviol_DI0_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI0_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI1_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI1_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI2_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI2_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI3_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI3_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI4_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI4_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI5_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI5_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI6_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI6_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI7_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI7_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI8_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI8_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI9_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI9_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI10_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI10_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI11_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI11_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI12_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI12_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI13_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI13_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI14_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI14_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI15_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI15_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI16_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI16_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI17_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI17_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI18_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI18_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI19_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI19_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI20_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI20_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI21_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI21_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI22_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI22_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI23_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI23_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI24_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI24_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI25_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI25_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI26_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI26_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI27_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI27_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI28_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI28_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI29_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI29_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI30_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI30_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI31_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI31_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP0_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP0_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP1_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP1_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP2_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP2_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP3_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP3_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RDEN_RDCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RDEN_RDCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_WREN_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_WREN_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_RDCLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_RDCLK : std_ulogic := '0';

    variable PInfo_WRCLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_WRCLK : std_ulogic := '0';

    variable PInfo_RST : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_RST : std_ulogic := '0';

--  Output Pin glitch declaration
     variable  ALMOSTEMPTY_GlitchData : VitalGlitchDataType;
     variable  ALMOSTFULL_GlitchData : VitalGlitchDataType;
     variable  DO0_GlitchData : VitalGlitchDataType;
     variable  DO1_GlitchData : VitalGlitchDataType;
     variable  DO2_GlitchData : VitalGlitchDataType;
     variable  DO3_GlitchData : VitalGlitchDataType;
     variable  DO4_GlitchData : VitalGlitchDataType;
     variable  DO5_GlitchData : VitalGlitchDataType;
     variable  DO6_GlitchData : VitalGlitchDataType;
     variable  DO7_GlitchData : VitalGlitchDataType;
     variable  DO8_GlitchData : VitalGlitchDataType;
     variable  DO9_GlitchData : VitalGlitchDataType;
     variable  DO10_GlitchData : VitalGlitchDataType;
     variable  DO11_GlitchData : VitalGlitchDataType;
     variable  DO12_GlitchData : VitalGlitchDataType;
     variable  DO13_GlitchData : VitalGlitchDataType;
     variable  DO14_GlitchData : VitalGlitchDataType;
     variable  DO15_GlitchData : VitalGlitchDataType;
     variable  DO16_GlitchData : VitalGlitchDataType;
     variable  DO17_GlitchData : VitalGlitchDataType;
     variable  DO18_GlitchData : VitalGlitchDataType;
     variable  DO19_GlitchData : VitalGlitchDataType;
     variable  DO20_GlitchData : VitalGlitchDataType;
     variable  DO21_GlitchData : VitalGlitchDataType;
     variable  DO22_GlitchData : VitalGlitchDataType;
     variable  DO23_GlitchData : VitalGlitchDataType;
     variable  DO24_GlitchData : VitalGlitchDataType;
     variable  DO25_GlitchData : VitalGlitchDataType;
     variable  DO26_GlitchData : VitalGlitchDataType;
     variable  DO27_GlitchData : VitalGlitchDataType;
     variable  DO28_GlitchData : VitalGlitchDataType;
     variable  DO29_GlitchData : VitalGlitchDataType;
     variable  DO30_GlitchData : VitalGlitchDataType;
     variable  DO31_GlitchData : VitalGlitchDataType;
     variable  DOP0_GlitchData : VitalGlitchDataType;
     variable  DOP1_GlitchData : VitalGlitchDataType;
     variable  DOP2_GlitchData : VitalGlitchDataType;
     variable  DOP3_GlitchData : VitalGlitchDataType;
     variable  EMPTY_GlitchData : VitalGlitchDataType;
     variable  FULL_GlitchData : VitalGlitchDataType;
     variable  RDERR_GlitchData : VitalGlitchDataType;
     variable  WRERR_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT0_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT1_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT2_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT3_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT4_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT5_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT6_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT7_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT8_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT9_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT10_GlitchData : VitalGlitchDataType;
     variable  RDCOUNT11_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT0_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT1_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT2_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT3_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT4_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT5_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT6_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT7_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT8_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT9_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT10_GlitchData : VitalGlitchDataType;
     variable  WRCOUNT11_GlitchData : VitalGlitchDataType;
begin

--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI0_WRCLK_posedge,
         TimingData     => Tmkr_DI0_WRCLK_posedge,
         TestSignal     => DI_dly(0),
         TestSignalName => "DI(0)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(0),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(0),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(0),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(0),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI1_WRCLK_posedge,
         TimingData     => Tmkr_DI1_WRCLK_posedge,
         TestSignal     => DI_dly(1),
         TestSignalName => "DI(1)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(1),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(1),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(1),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(1),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI2_WRCLK_posedge,
         TimingData     => Tmkr_DI2_WRCLK_posedge,
         TestSignal     => DI_dly(2),
         TestSignalName => "DI(2)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(2),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(2),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(2),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(2),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI3_WRCLK_posedge,
         TimingData     => Tmkr_DI3_WRCLK_posedge,
         TestSignal     => DI_dly(3),
         TestSignalName => "DI(3)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(3),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(3),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(3),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(3),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI4_WRCLK_posedge,
         TimingData     => Tmkr_DI4_WRCLK_posedge,
         TestSignal     => DI_dly(4),
         TestSignalName => "DI(4)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(4),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(4),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(4),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(4),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI5_WRCLK_posedge,
         TimingData     => Tmkr_DI5_WRCLK_posedge,
         TestSignal     => DI_dly(5),
         TestSignalName => "DI(5)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(5),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(5),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(5),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(5),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI6_WRCLK_posedge,
         TimingData     => Tmkr_DI6_WRCLK_posedge,
         TestSignal     => DI_dly(6),
         TestSignalName => "DI(6)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(6),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(6),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(6),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(6),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI7_WRCLK_posedge,
         TimingData     => Tmkr_DI7_WRCLK_posedge,
         TestSignal     => DI_dly(7),
         TestSignalName => "DI(7)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(7),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(7),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(7),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(7),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI8_WRCLK_posedge,
         TimingData     => Tmkr_DI8_WRCLK_posedge,
         TestSignal     => DI_dly(8),
         TestSignalName => "DI(8)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(8),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(8),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(8),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(8),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI9_WRCLK_posedge,
         TimingData     => Tmkr_DI9_WRCLK_posedge,
         TestSignal     => DI_dly(9),
         TestSignalName => "DI(9)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(9),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(9),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(9),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(9),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI10_WRCLK_posedge,
         TimingData     => Tmkr_DI10_WRCLK_posedge,
         TestSignal     => DI_dly(10),
         TestSignalName => "DI(10)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(10),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(10),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(10),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(10),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI11_WRCLK_posedge,
         TimingData     => Tmkr_DI11_WRCLK_posedge,
         TestSignal     => DI_dly(11),
         TestSignalName => "DI(11)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(11),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(11),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(11),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(11),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI12_WRCLK_posedge,
         TimingData     => Tmkr_DI12_WRCLK_posedge,
         TestSignal     => DI_dly(12),
         TestSignalName => "DI(12)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(12),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(12),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(12),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(12),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI13_WRCLK_posedge,
         TimingData     => Tmkr_DI13_WRCLK_posedge,
         TestSignal     => DI_dly(13),
         TestSignalName => "DI(13)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(13),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(13),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(13),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(13),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI14_WRCLK_posedge,
         TimingData     => Tmkr_DI14_WRCLK_posedge,
         TestSignal     => DI_dly(14),
         TestSignalName => "DI(14)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(14),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(14),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(14),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(14),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI15_WRCLK_posedge,
         TimingData     => Tmkr_DI15_WRCLK_posedge,
         TestSignal     => DI_dly(15),
         TestSignalName => "DI(15)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(15),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(15),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(15),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(15),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI16_WRCLK_posedge,
         TimingData     => Tmkr_DI16_WRCLK_posedge,
         TestSignal     => DI_dly(16),
         TestSignalName => "DI(16)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(16),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(16),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(16),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(16),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI17_WRCLK_posedge,
         TimingData     => Tmkr_DI17_WRCLK_posedge,
         TestSignal     => DI_dly(17),
         TestSignalName => "DI(17)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(17),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(17),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(17),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(17),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI18_WRCLK_posedge,
         TimingData     => Tmkr_DI18_WRCLK_posedge,
         TestSignal     => DI_dly(18),
         TestSignalName => "DI(18)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(18),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(18),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(18),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(18),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI19_WRCLK_posedge,
         TimingData     => Tmkr_DI19_WRCLK_posedge,
         TestSignal     => DI_dly(19),
         TestSignalName => "DI(19)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(19),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(19),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(19),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(19),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI20_WRCLK_posedge,
         TimingData     => Tmkr_DI20_WRCLK_posedge,
         TestSignal     => DI_dly(20),
         TestSignalName => "DI(20)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(20),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(20),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(20),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(20),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI21_WRCLK_posedge,
         TimingData     => Tmkr_DI21_WRCLK_posedge,
         TestSignal     => DI_dly(21),
         TestSignalName => "DI(21)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(21),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(21),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(21),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(21),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI22_WRCLK_posedge,
         TimingData     => Tmkr_DI22_WRCLK_posedge,
         TestSignal     => DI_dly(22),
         TestSignalName => "DI(22)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(22),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(22),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(22),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(22),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI23_WRCLK_posedge,
         TimingData     => Tmkr_DI23_WRCLK_posedge,
         TestSignal     => DI_dly(23),
         TestSignalName => "DI(23)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(23),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(23),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(23),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(23),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI24_WRCLK_posedge,
         TimingData     => Tmkr_DI24_WRCLK_posedge,
         TestSignal     => DI_dly(24),
         TestSignalName => "DI(24)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(24),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(24),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(24),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(24),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI25_WRCLK_posedge,
         TimingData     => Tmkr_DI25_WRCLK_posedge,
         TestSignal     => DI_dly(25),
         TestSignalName => "DI(25)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(25),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(25),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(25),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(25),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI26_WRCLK_posedge,
         TimingData     => Tmkr_DI26_WRCLK_posedge,
         TestSignal     => DI_dly(26),
         TestSignalName => "DI(26)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(26),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(26),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(26),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(26),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI27_WRCLK_posedge,
         TimingData     => Tmkr_DI27_WRCLK_posedge,
         TestSignal     => DI_dly(27),
         TestSignalName => "DI(27)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(27),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(27),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(27),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(27),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI28_WRCLK_posedge,
         TimingData     => Tmkr_DI28_WRCLK_posedge,
         TestSignal     => DI_dly(28),
         TestSignalName => "DI(28)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(28),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(28),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(28),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(28),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI29_WRCLK_posedge,
         TimingData     => Tmkr_DI29_WRCLK_posedge,
         TestSignal     => DI_dly(29),
         TestSignalName => "DI(29)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(29),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(29),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(29),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(29),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI30_WRCLK_posedge,
         TimingData     => Tmkr_DI30_WRCLK_posedge,
         TestSignal     => DI_dly(30),
         TestSignalName => "DI(30)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(30),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(30),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(30),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(30),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI31_WRCLK_posedge,
         TimingData     => Tmkr_DI31_WRCLK_posedge,
         TestSignal     => DI_dly(31),
         TestSignalName => "DI(31)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(31),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(31),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(31),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(31),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP0_WRCLK_posedge,
         TimingData     => Tmkr_DIP0_WRCLK_posedge,
         TestSignal     => DIP_dly(0),
         TestSignalName => "DIP(0)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(0),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(0),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(0),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(0),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP1_WRCLK_posedge,
         TimingData     => Tmkr_DIP1_WRCLK_posedge,
         TestSignal     => DIP_dly(1),
         TestSignalName => "DIP(1)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(1),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(1),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(1),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(1),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP2_WRCLK_posedge,
         TimingData     => Tmkr_DIP2_WRCLK_posedge,
         TestSignal     => DIP_dly(2),
         TestSignalName => "DIP(2)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(2),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(2),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(2),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(2),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP3_WRCLK_posedge,
         TimingData     => Tmkr_DIP3_WRCLK_posedge,
         TestSignal     => DIP_dly(3),
         TestSignalName => "DIP(3)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(3),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(3),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(3),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(3),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_RDEN_RDCLK_posedge,
         TimingData     => Tmkr_RDEN_RDCLK_posedge,
         TestSignal     => RDEN,
         TestSignalName => "RDEN",
         TestDelay      => 0 ns,
         RefSignal      => RDCLK_dly,
         RefSignalName  => "RDCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_RDEN_RDCLK_posedge_posedge,
         SetupLow       => tsetup_RDEN_RDCLK_negedge_posedge,
         HoldLow        => thold_RDEN_RDCLK_posedge_posedge,
         HoldHigh       => thold_RDEN_RDCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_WREN_WRCLK_posedge,
         TimingData     => Tmkr_WREN_WRCLK_posedge,
         TestSignal     => WREN,
         TestSignalName => "WREN",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_WREN_WRCLK_posedge_posedge,
         SetupLow       => tsetup_WREN_WRCLK_negedge_posedge,
         HoldLow        => thold_WREN_WRCLK_posedge_posedge,
         HoldHigh       => thold_WREN_WRCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO16",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Error
       );
      VitalPeriodPulseCheck (
        Violation            => Pviol_RDCLK,
        PeriodData           => PInfo_RDCLK,
        TestSignal           => RDCLK_dly,
        TestSignalName       => "RDCLK",
        TestDelay            => 0 ps,
        Period               => tperiod_RDCLK_posedge,
        PulseWidthHigh       => tpw_RDCLK_posedge,
        PulseWidthLow        => tpw_RDCLK_negedge,
        CheckEnabled         => (TO_X01(GSR_dly) = '0'),
        HeaderMsg            => "/X_FIFO16",
        Xon                  => Xon,
        MsgOn                => MsgOn,
        MsgSeverity          => Error
      );
      VitalPeriodPulseCheck (
        Violation            => Pviol_WRCLK,
        PeriodData           => PInfo_WRCLK,
        TestSignal           => WRCLK_dly,
        TestSignalName       => "WRCLK",
        TestDelay            => 0 ps,
        Period               => tperiod_WRCLK_posedge,
        PulseWidthHigh       => tpw_WRCLK_posedge,
        PulseWidthLow        => tpw_WRCLK_negedge,
        CheckEnabled         => (TO_X01(GSR_dly) = '0'),
        HeaderMsg            => "/X_FIFO16",
        Xon                  => Xon,
        MsgOn                => MsgOn,
        MsgSeverity          => Error
      );
      VitalPeriodPulseCheck (
        Violation            => Pviol_RST,
        PeriodData           => PInfo_RST,
        TestSignal           => RST_dly,
        TestSignalName       => "RST",
        TestDelay            => 0 ps,
        Period               => 0 ps,
        PulseWidthHigh       => tpw_RST_posedge,
        PulseWidthLow        => tpw_RST_negedge,
        CheckEnabled         => (TO_X01(GSR_dly) = '0'),
        HeaderMsg            => "/X_FIFO16",
        Xon                  => Xon,
        MsgOn                => MsgOn,
        MsgSeverity          => Error
      );

     end if;
-- End of (TimingChecksOn)

--  Output-to-Clock path delay
     VitalPathDelay01
       (
         OutSignal     => ALMOSTEMPTY,
         GlitchData    => ALMOSTEMPTY_GlitchData,
         OutSignalName => "ALMOSTEMPTY",
         OutTemp       => ALMOSTEMPTY_zd,
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_ALMOSTEMPTY,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => ALMOSTFULL,
         GlitchData    => ALMOSTFULL_GlitchData,
         OutSignalName => "ALMOSTFULL",
         OutTemp       => ALMOSTFULL_zd,
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ALMOSTFULL,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(0),
         GlitchData    => DO0_GlitchData,
         OutSignalName => "DO(0)",
         OutTemp       => DO_OUT_zd(0),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(0),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(1),
         GlitchData    => DO1_GlitchData,
         OutSignalName => "DO(1)",
         OutTemp       => DO_OUT_zd(1),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(1),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(2),
         GlitchData    => DO2_GlitchData,
         OutSignalName => "DO(2)",
         OutTemp       => DO_OUT_zd(2),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(2),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(3),
         GlitchData    => DO3_GlitchData,
         OutSignalName => "DO(3)",
         OutTemp       => DO_OUT_zd(3),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(3),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(4),
         GlitchData    => DO4_GlitchData,
         OutSignalName => "DO(4)",
         OutTemp       => DO_OUT_zd(4),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(4),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(5),
         GlitchData    => DO5_GlitchData,
         OutSignalName => "DO(5)",
         OutTemp       => DO_OUT_zd(5),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(5),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(6),
         GlitchData    => DO6_GlitchData,
         OutSignalName => "DO(6)",
         OutTemp       => DO_OUT_zd(6),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(6),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(7),
         GlitchData    => DO7_GlitchData,
         OutSignalName => "DO(7)",
         OutTemp       => DO_OUT_zd(7),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(7),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(8),
         GlitchData    => DO8_GlitchData,
         OutSignalName => "DO(8)",
         OutTemp       => DO_OUT_zd(8),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(8),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(9),
         GlitchData    => DO9_GlitchData,
         OutSignalName => "DO(9)",
         OutTemp       => DO_OUT_zd(9),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(9),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(10),
         GlitchData    => DO10_GlitchData,
         OutSignalName => "DO(10)",
         OutTemp       => DO_OUT_zd(10),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(10),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(11),
         GlitchData    => DO11_GlitchData,
         OutSignalName => "DO(11)",
         OutTemp       => DO_OUT_zd(11),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(11),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(12),
         GlitchData    => DO12_GlitchData,
         OutSignalName => "DO(12)",
         OutTemp       => DO_OUT_zd(12),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(12),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(13),
         GlitchData    => DO13_GlitchData,
         OutSignalName => "DO(13)",
         OutTemp       => DO_OUT_zd(13),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(13),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(14),
         GlitchData    => DO14_GlitchData,
         OutSignalName => "DO(14)",
         OutTemp       => DO_OUT_zd(14),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(14),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(15),
         GlitchData    => DO15_GlitchData,
         OutSignalName => "DO(15)",
         OutTemp       => DO_OUT_zd(15),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(15),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(16),
         GlitchData    => DO16_GlitchData,
         OutSignalName => "DO(16)",
         OutTemp       => DO_OUT_zd(16),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(16),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(17),
         GlitchData    => DO17_GlitchData,
         OutSignalName => "DO(17)",
         OutTemp       => DO_OUT_zd(17),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(17),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(18),
         GlitchData    => DO18_GlitchData,
         OutSignalName => "DO(18)",
         OutTemp       => DO_OUT_zd(18),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(18),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(19),
         GlitchData    => DO19_GlitchData,
         OutSignalName => "DO(19)",
         OutTemp       => DO_OUT_zd(19),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(19),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(20),
         GlitchData    => DO20_GlitchData,
         OutSignalName => "DO(20)",
         OutTemp       => DO_OUT_zd(20),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(20),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(21),
         GlitchData    => DO21_GlitchData,
         OutSignalName => "DO(21)",
         OutTemp       => DO_OUT_zd(21),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(21),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(22),
         GlitchData    => DO22_GlitchData,
         OutSignalName => "DO(22)",
         OutTemp       => DO_OUT_zd(22),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(22),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(23),
         GlitchData    => DO23_GlitchData,
         OutSignalName => "DO(23)",
         OutTemp       => DO_OUT_zd(23),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(23),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(24),
         GlitchData    => DO24_GlitchData,
         OutSignalName => "DO(24)",
         OutTemp       => DO_OUT_zd(24),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(24),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(25),
         GlitchData    => DO25_GlitchData,
         OutSignalName => "DO(25)",
         OutTemp       => DO_OUT_zd(25),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(25),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(26),
         GlitchData    => DO26_GlitchData,
         OutSignalName => "DO(26)",
         OutTemp       => DO_OUT_zd(26),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(26),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(27),
         GlitchData    => DO27_GlitchData,
         OutSignalName => "DO(27)",
         OutTemp       => DO_OUT_zd(27),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(27),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(28),
         GlitchData    => DO28_GlitchData,
         OutSignalName => "DO(28)",
         OutTemp       => DO_OUT_zd(28),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(28),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(29),
         GlitchData    => DO29_GlitchData,
         OutSignalName => "DO(29)",
         OutTemp       => DO_OUT_zd(29),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(29),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(30),
         GlitchData    => DO30_GlitchData,
         OutSignalName => "DO(30)",
         OutTemp       => DO_OUT_zd(30),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(30),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(31),
         GlitchData    => DO31_GlitchData,
         OutSignalName => "DO(31)",
         OutTemp       => DO_OUT_zd(31),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(31),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(0),
         GlitchData    => DOP0_GlitchData,
         OutSignalName => "DOP(0)",
         OutTemp       => DOP_OUT_zd(0),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(0),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(1),
         GlitchData    => DOP1_GlitchData,
         OutSignalName => "DOP(1)",
         OutTemp       => DOP_OUT_zd(1),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(1),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(2),
         GlitchData    => DOP2_GlitchData,
         OutSignalName => "DOP(2)",
         OutTemp       => DOP_OUT_zd(2),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(2),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(3),
         GlitchData    => DOP3_GlitchData,
         OutSignalName => "DOP(3)",
         OutTemp       => DOP_OUT_zd(3),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(3),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => EMPTY,
         GlitchData    => EMPTY_GlitchData,
         OutSignalName => "EMPTY",
         OutTemp       => EMPTY_zd,
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_EMPTY,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => FULL,
         GlitchData    => FULL_GlitchData,
         OutSignalName => "FULL",
         OutTemp       => FULL_zd,
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_FULL,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDERR,
         GlitchData    => RDERR_GlitchData,
         OutSignalName => "RDERR",
         OutTemp       => RDERR_zd,
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDERR,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRERR,
         GlitchData    => WRERR_GlitchData,
         OutSignalName => "WRERR",
         OutTemp       => WRERR_zd,
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRERR,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(0),
         GlitchData    => RDCOUNT0_GlitchData,
         OutSignalName => "RDCOUNT(0)",
         OutTemp       => RDCOUNT_OUT_zd(0),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(0),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(1),
         GlitchData    => RDCOUNT1_GlitchData,
         OutSignalName => "RDCOUNT(1)",
         OutTemp       => RDCOUNT_OUT_zd(1),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(1),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(2),
         GlitchData    => RDCOUNT2_GlitchData,
         OutSignalName => "RDCOUNT(2)",
         OutTemp       => RDCOUNT_OUT_zd(2),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(2),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(3),
         GlitchData    => RDCOUNT3_GlitchData,
         OutSignalName => "RDCOUNT(3)",
         OutTemp       => RDCOUNT_OUT_zd(3),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(3),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(4),
         GlitchData    => RDCOUNT4_GlitchData,
         OutSignalName => "RDCOUNT(4)",
         OutTemp       => RDCOUNT_OUT_zd(4),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(4),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(5),
         GlitchData    => RDCOUNT5_GlitchData,
         OutSignalName => "RDCOUNT(5)",
         OutTemp       => RDCOUNT_OUT_zd(5),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(5),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(6),
         GlitchData    => RDCOUNT6_GlitchData,
         OutSignalName => "RDCOUNT(6)",
         OutTemp       => RDCOUNT_OUT_zd(6),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(6),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(7),
         GlitchData    => RDCOUNT7_GlitchData,
         OutSignalName => "RDCOUNT(7)",
         OutTemp       => RDCOUNT_OUT_zd(7),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(7),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(8),
         GlitchData    => RDCOUNT8_GlitchData,
         OutSignalName => "RDCOUNT(8)",
         OutTemp       => RDCOUNT_OUT_zd(8),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(8),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(9),
         GlitchData    => RDCOUNT9_GlitchData,
         OutSignalName => "RDCOUNT(9)",
         OutTemp       => RDCOUNT_OUT_zd(9),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(9),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(10),
         GlitchData    => RDCOUNT10_GlitchData,
         OutSignalName => "RDCOUNT(10)",
         OutTemp       => RDCOUNT_OUT_zd(10),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(10),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(11),
         GlitchData    => RDCOUNT11_GlitchData,
         OutSignalName => "RDCOUNT(11)",
         OutTemp       => RDCOUNT_OUT_zd(11),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(11),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(0),
         GlitchData    => WRCOUNT0_GlitchData,
         OutSignalName => "WRCOUNT(0)",
         OutTemp       => WRCOUNT_OUT_zd(0),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(0),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(1),
         GlitchData    => WRCOUNT1_GlitchData,
         OutSignalName => "WRCOUNT(1)",
         OutTemp       => WRCOUNT_OUT_zd(1),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(1),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(2),
         GlitchData    => WRCOUNT2_GlitchData,
         OutSignalName => "WRCOUNT(2)",
         OutTemp       => WRCOUNT_OUT_zd(2),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(2),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(3),
         GlitchData    => WRCOUNT3_GlitchData,
         OutSignalName => "WRCOUNT(3)",
         OutTemp       => WRCOUNT_OUT_zd(3),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(3),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(4),
         GlitchData    => WRCOUNT4_GlitchData,
         OutSignalName => "WRCOUNT(4)",
         OutTemp       => WRCOUNT_OUT_zd(4),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(4),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(5),
         GlitchData    => WRCOUNT5_GlitchData,
         OutSignalName => "WRCOUNT(5)",
         OutTemp       => WRCOUNT_OUT_zd(5),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(5),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(6),
         GlitchData    => WRCOUNT6_GlitchData,
         OutSignalName => "WRCOUNT(6)",
         OutTemp       => WRCOUNT_OUT_zd(6),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(6),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(7),
         GlitchData    => WRCOUNT7_GlitchData,
         OutSignalName => "WRCOUNT(7)",
         OutTemp       => WRCOUNT_OUT_zd(7),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(7),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(8),
         GlitchData    => WRCOUNT8_GlitchData,
         OutSignalName => "WRCOUNT(8)",
         OutTemp       => WRCOUNT_OUT_zd(8),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(8),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(9),
         GlitchData    => WRCOUNT9_GlitchData,
         OutSignalName => "WRCOUNT(9)",
         OutTemp       => WRCOUNT_OUT_zd(9),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(9),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(10),
         GlitchData    => WRCOUNT10_GlitchData,
         OutSignalName => "WRCOUNT(10)",
         OutTemp       => WRCOUNT_OUT_zd(10),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(10),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(11),
         GlitchData    => WRCOUNT11_GlitchData,
         OutSignalName => "WRCOUNT(11)",
         OutTemp       => WRCOUNT_OUT_zd(11),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(11),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

--  Wait signal (input/output pins)
   wait on
     DI_dly,
     DIP_dly,
     RDCLK_dly,
     RDEN_dly,
     RST_dly,
     WRCLK_dly,
     WREN_dly,
     ALMOSTEMPTY_zd,
     ALMOSTFULL_zd,
     DO_OUT_zd,
     DOP_OUT_zd,
     EMPTY_zd,
     FULL_zd,
     RDERR_zd,
     WRERR_zd,
     RDCOUNT_OUT_zd,
     WRCOUNT_OUT_zd;
  end process prcs_tmngchk;
--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
--  prcs_output:process(ALMOSTEMPTY_zd, ALMOSTFULL_zd, DO_zd, DOP_zd, 
--                      EMPTY_ltncy, FULL_tncy, RDCOUNT_zd, RDERR_zd, 
--                      WRCOUNT_zd, WRERR_zd)
--  begin
--      ALMOSTEMPTY <= Violation xor ALMOSTEMPTY_zd;
--      ALMOSTFULL  <= Violation xor ALMOSTFULL_zd;
--      DO          <= Violation xor DO_zd;
--      DOP         <= Violation xor DOP_zd;
--      EMPTY       <= Violation xor EMPTY_ltncy;
--      FULL        <= Violation xor FULL_ltncy;
--      RDCOUNT     <= Violation xor RDCOUNT_zd;
--      RDERR       <= Violation xor RDERR_zd;
--      WRCOUNT     <= Violation xor WRCOUNT_zd;
--      WRERR       <= Violation xor WRERR_zd;
--  end process prcs_output;
--####################################################################


end X_FIFO16_V;

