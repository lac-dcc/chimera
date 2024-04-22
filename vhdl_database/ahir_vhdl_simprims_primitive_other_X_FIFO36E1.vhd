-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_FIFO36E1.vhd,v 1.46 2012/03/09 22:38:51 wloo Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2009 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                       36K-Bit FIFO
-- /___/   /\     Filename : X_FIFO36E1.vhd
-- \   \  /  \    Timestamp : Mon Apr 14 18:32:30 PDT 2008
--  \___\/\___\
--
-- Revision:
--    04/14/08 - Initial version.
--    07/10/08 - IR476500 Add INIT parameter support, sync with FIFO36 internal
--    08/26/08 - Updated unused bit on wrcount and rdcount to match the hardware.
--    09/02/08 - Fixed ECC mismatch with hardware. (IR 479250)
--    09/18/08 - Fixed ECC injection. (IR 474017)
--    09/23/08 - Fixed X's from wrcount and rdcount. (IR 488611)
--    11/11/08 - Added DRC for invalid input parity for ECC (CR 482976).
--    01/07/09 - Fixed rdcount output when reset (IR 501177).
--    01/15/09 - Fixed X in ECCPARITY during initialization (IR 501358).
--    01/30/09 - Fixed sbiterr and dbiterr in synchronous and output register mode (IR 501358).
--    03/19/09 - Fixed Vital port connection for RST (CR 513223).
--    04/02/09 - Implemented DRC for FIFO_MODE (CR 517127).
--    04/30/09 - Fixed timing violation for asynchronous reset (CR 519016).
--    10/23/09 - Fixed RST and RSTREG (CR 537067).
--    11/17/09 - Fixed ECCPARITY behavior during RST (CR 537360).
--    12/02/09 - Updated SRVAL and INIT port mapping for FIFO_MODE = FIFO36_72 (CR 539776).
--    06/30/10 - Updated RESET behavior and added SIM_DEVICE (CR 567515).
--    07/09/10 - Fixed INJECTSBITERR and INJECTDBITERR behaviors (CR 565234).
--    07/19/10 - Fixed RESET behavior during startup (CR 568626).
--    08/19/10 - Fixed RESET DRC during startup (CR 570708).
--    12/02/10 - Added warning message for 7SERIES Aysnc mode (CR 584052).
--    12/08/10 - Fixed attribute check for 7SERIES (CR 585796).
--    12/08/10 - Error out if no reset before first use of the fifo (CR 583638).
--    01/12/11 - updated warning message for 7SERIES Aysnc mode (CR 589721).
--    04/01/11 - Fixed RESET behvavior at 0 ps (CR 588406).
--    04/08/11 - Fixed RSTREG behavior when RST is asserted (CR 596723).
--    05/11/11 - Fixed DO not suppose to be reseted when RST asserted (CR 586526).
--    05/19/11 - Fixed drc for almost_empty/full_offset (CR 611056).
--    05/26/11 - Update Aysnc fifo behavior (CR 599680).
--    05/31/11 - Fixed DRC for almost_empty/full_offset (CR 611228).
--    06/02/11 - Fixed full flag for 7 series aysnc fifo (CR 611949).
--    06/06/11 - Fixed RST in standard mode (CR 613216).
--    06/07/11 - Update DRC equation for ALMOST_FULL_OFFSET (CR 611057).
--    06/09/11 - Fixed GSR behavior (CR 611989).
--    06/13/11 - Added setup/hold timing check for RST (CR 606107).
--    06/29/11 - Fixed almostempty flag (CR 614659).
--    07/07/11 - Fixed Full flag (CR 615773).
--    08/29/11 - Fixed FULL and ALMOSTFULL during initial time (CR 622163).
--    09/19/11 - Fixed almostempty flag when write counter looped around (CR 624102).
--    03/08/12 - Added DRC to check WREN/RDEN after RST deassertion (CR 644571).
-- End Revision


-- WARNING !!!: The following X_FF36_INTERNAL_VHDL entity is not an user primitive. 
--              Please do not modify any part of it. X_FIFO36E1 may not work properly if do so.
--
--
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

library STD;
use STD.TEXTIO.ALL;


library IEEE;  -- simprim
use IEEE.VITAL_Timing.all;  -- simprim

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_FF36_INTERNAL_VHDL is

  generic(

    ALMOST_FULL_OFFSET      : bit_vector := X"0080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"0080"; 
    DATA_WIDTH              : integer    := 4;
    DO_REG                  : integer    := 1;
    EN_ECC_READ             : boolean    := FALSE;
    EN_ECC_WRITE            : boolean    := FALSE;    
    EN_SYN                  : boolean    := FALSE;
    FIFO_MODE               : string     := "FIFO36";
    FIFO_SIZE               : integer    := 36;
    FIRST_WORD_FALL_THROUGH : boolean    := FALSE;
    INIT                    : bit_vector := X"000000000000000000";
    SIM_DEVICE              : string     := "VIRTEX6";
    SRVAL                   : bit_vector := X"000000000000000000"
    );

  port(
    ALMOSTEMPTY          : out std_ulogic;
    ALMOSTFULL           : out std_ulogic;
    DBITERR              : out std_ulogic;
    DO                   : out std_logic_vector (63 downto 0);
    DOP                  : out std_logic_vector (7 downto 0);
    ECCPARITY            : out std_logic_vector (7 downto 0);
    EMPTY                : out std_ulogic;
    FULL                 : out std_ulogic;
    RDCOUNT              : out std_logic_vector (12 downto 0);
    RDERR                : out std_ulogic;
    SBITERR              : out std_ulogic;
    WRCOUNT              : out std_logic_vector (12 downto 0);
    WRERR                : out std_ulogic;

    DI                   : in  std_logic_vector (63 downto 0);
    DIP                  : in  std_logic_vector (7 downto 0);
    INJECTDBITERR        : in  std_ulogic;
    INJECTSBITERR        : in  std_ulogic;
    RDCLK                : in  std_ulogic;
    RDEN                 : in  std_ulogic;
    REGCE                : in  std_ulogic;
    RST                  : in  std_ulogic;
    RSTREG               : in  std_ulogic;
    WRCLK                : in  std_ulogic;
    WREN                 : in  std_ulogic
    );

end X_FF36_INTERNAL_VHDL;

-- architecture body                    --

architecture X_FF36_INTERNAL_VHDL_V of X_FF36_INTERNAL_VHDL is

  function GetMemoryDepth (
    rdwr_width : in integer;
    func_fifo_size : in integer
    ) return integer is
    variable func_mem_depth : integer;
  begin
    case rdwr_width is
      when 4 => if (func_fifo_size = 18) then
                  func_mem_depth := 4096;
                else
                  func_mem_depth := 8192;
                end if;
      when 9 => if (func_fifo_size = 18) then
                  func_mem_depth := 2048;
                else
                  func_mem_depth := 4096;
                end if;
      when 18 => if (func_fifo_size = 18) then
                   func_mem_depth := 1024;
                 else
                   func_mem_depth := 2048;
                 end if;
      when 36 => if (func_fifo_size = 18) then
                   func_mem_depth := 512;
                 else
                   func_mem_depth := 1024;
                 end if;
      when 72 => if (func_fifo_size = 18) then
                   func_mem_depth := 0;
                 else
                   func_mem_depth := 512;
                 end if;
      when others => func_mem_depth := 8192;
    end case;
    return func_mem_depth;
  end;

  function GetMemoryDepthP (
    rdwr_width : in integer;
    func_fifo_size : in integer
    ) return integer is
    variable func_memp_depth : integer;
  begin
    case rdwr_width is
      when 9 => if (func_fifo_size = 18) then
                  func_memp_depth := 2048;
                else
                  func_memp_depth := 4096;
                end if;
      when 18 => if (func_fifo_size = 18) then
                   func_memp_depth := 1024;
                 else
                   func_memp_depth := 2048;
                 end if;
      when 36 => if (func_fifo_size = 18) then
                   func_memp_depth := 512;
                 else
                   func_memp_depth := 1024;
                 end if;
      when 72 => if (func_fifo_size = 18) then
                   func_memp_depth := 0;
                 else
                   func_memp_depth := 512;
                 end if;
      when others => func_memp_depth := 8192;
    end case;
    return func_memp_depth;
  end;

  
  function GetWidth (
    rdwr_width : in integer
    ) return integer is
    variable func_width : integer;
  begin
    case rdwr_width is
      when 4 => func_width := 4;
      when 9 => func_width := 8;
      when 18 => func_width := 16;
      when 36 => func_width := 32;
      when 72 => func_width := 64;
      when others => func_width := 64;
    end case;
    return func_width;
  end;

  
  function GetWidthp (
    rdwr_widthp : in integer
    ) return integer is
    variable func_widthp : integer;
  begin
    case rdwr_widthp is
      when 9 => func_widthp := 1;
      when 18 => func_widthp := 2;
      when 36 => func_widthp := 4;
      when 72 => func_widthp := 8;
      when others => func_widthp := 8;
    end case;
    return func_widthp;
  end;
    
    constant MAX_DO      : integer    := 64;
    constant MAX_DOP     : integer    := 8;
    constant MAX_RDCOUNT : integer    := 13;
    constant MAX_WRCOUNT : integer    := 13;
    constant MSB_MAX_DO  : integer    := 63;
    constant MSB_MAX_DOP : integer    := 7;
    constant MSB_MAX_RDCOUNT : integer    := 12;
    constant MSB_MAX_WRCOUNT : integer    := 12;

    constant MAX_DI      : integer    := 64;
    constant MAX_DIP     : integer    := 8;
    constant MSB_MAX_DI  : integer    := 63;
    constant MSB_MAX_DIP : integer    := 7;

    constant MAX_LATENCY_EMPTY : integer := 3;
    constant MAX_LATENCY_FULL  : integer := 3;

    constant mem_depth : integer := GetMemoryDepth(DATA_WIDTH, FIFO_SIZE);
    constant memp_depth : integer := GetMemoryDepthP(DATA_WIDTH, FIFO_SIZE);
    constant mem_width : integer := GetWidth(DATA_WIDTH);
    constant memp_width : integer := GetWidthp(DATA_WIDTH); 

    type Two_D_array_type is array ((mem_depth -  1) downto 0) of std_logic_vector((mem_width - 1) downto 0);
    type Two_D_parity_array_type is array ((memp_depth - 1) downto 0) of std_logic_vector((memp_width -1) downto 0);
  
    signal mem : Two_D_array_type;
    signal memp : Two_D_parity_array_type;

    signal DI_dly    : std_logic_vector(MSB_MAX_DI downto 0)    := (others => 'X');
    signal DIP_dly   : std_logic_vector(MSB_MAX_DIP downto 0)   := (others => 'X');
    signal GSR_dly   : std_ulogic;
    signal RDCLK_dly : std_ulogic     :=    'X';
    signal RDEN_dly  : std_ulogic     :=    'X';
    signal RST_dly   : std_ulogic     :=    'X';
    signal WRCLK_dly : std_ulogic     :=    'X';
    signal WREN_dly  : std_ulogic     :=    'X';

    signal DO_zd          : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => '0');
    signal DOP_zd         : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => '0');
    signal ALMOSTEMPTY_zd : std_logic     :=    '1';
    signal ALMOSTFULL_zd  : std_logic     :=    '0';
    signal EMPTY_zd       : std_logic     :=    '1';
    signal FULL_zd        : std_logic     :=    '0';
    signal RDCOUNT_zd     : std_logic_vector(MSB_MAX_RDCOUNT  downto 0)    := (others => '0');
    signal RDERR_zd       : std_logic     :=    '0';
    signal WRCOUNT_zd     : std_logic_vector(MSB_MAX_WRCOUNT  downto 0)    := (others => '0');
    signal WRERR_zd       : std_logic     :=    '0';
    signal RDCOUNT_OUT_zd : std_logic_vector(MSB_MAX_RDCOUNT  downto 0)    := (others => '0');
    signal WRCOUNT_OUT_zd : std_logic_vector(MSB_MAX_WRCOUNT  downto 0)    := (others => '0');
    signal DO_OUT_zd      : std_logic_vector(MSB_MAX_DO  downto 0)         := (others => 'X');
    signal DOP_OUT_zd     : std_logic_vector(MSB_MAX_DOP  downto 0)        := (others => 'X');
    signal DO_OUTREG_zd          : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => '0');
    signal DOP_OUTREG_zd         : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => '0');
    signal DO_OUT_MUX_zd         : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => '0');
    signal DOP_OUT_MUX_zd        : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => '0');

  --- Internal Signal Declarations

    signal RST_META    : std_ulogic := '0';

    signal DefDelay    : time := 10 ps;

    signal addr_limit    : integer := 0;
    signal wr_addr       : integer := 0;
    signal wr_addr_7s       : integer := 0;
    signal rdcount_m1 : integer := -1;

    signal rd_addr       : integer := 0;
    signal rd_addr_7s       : integer := 0;
    signal rd_addr_range : integer := 0;
    signal wr_addr_range : integer := 0;

    signal rd_flag       : std_logic := '0';
    signal wr_flag       : std_logic := '0';
    signal awr_flag      : std_logic := '0';

    signal rdcount_flag  : std_logic := '0';

    signal almostempty_limit : real := 0.0;
    signal almostfull_limit  : real := 0.0;

    signal violation : std_ulogic := '0'; 

    signal fwft      : std_logic := 'X';

    signal update_from_write_prcs      : std_logic := '0';
    signal update_from_read_prcs       : std_logic := '0';
    signal update_from_write_prcs_sync : std_logic := '0';
    signal update_from_read_prcs_sync  : std_logic := '0';
  
    signal ae_empty   : integer := 0;
    signal ae_full    : integer := 0;

-- CR 182616 fix
   signal rst_rdckreg : std_logic_vector (4 downto 0) := (others => '0');
   signal rst_wrckreg : std_logic_vector (4 downto 0) := (others => '0');
   signal rst_rdckreg_flag : std_logic := '0';
   signal rst_wrckreg_flag : std_logic := '0';
   signal sync : std_logic := 'X';
   signal sbiterr_zd : std_logic := '0';
   signal dbiterr_zd : std_logic := '0';
   signal ECCPARITY_zd : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
   signal rst_rdclk_flag : std_logic := '0';
   signal rst_wrclk_flag : std_logic := '0';
   signal INIT_STD : std_logic_vector(INIT'length-1 downto 0) := To_StdLogicVector(INIT);
   signal SRVAL_STD : std_logic_vector(SRVAL'length-1 downto 0) := To_StdLogicVector(SRVAL);
   signal INJECTDBITERR_dly     : std_ulogic          := '0';
   signal INJECTSBITERR_dly     : std_ulogic          := '0';
   signal RSTREG_dly :  std_ulogic := '0';
   signal REGCE_dly   : std_ulogic                    := '0';
   signal viol_rst_rden : std_logic := '0';
   signal viol_rst_wren : std_logic := '0';
   signal first_rst_flag : std_logic := '0';
   signal rm1w_eq : std_logic := '0';
   signal rm1wp1_eq : std_logic := '0';
   signal full_v3 : std_logic := '0';
   signal count_freq_wrclk : integer := 0;
   signal period_wrclk : time := 0 ps;
   signal count_freq_wrclk_reset : std_logic := '0';
   signal fwft_prefetch_flag : integer := 1;
   signal set_fwft_prefetch_flag_to_0 : std_logic := '0';
   signal after_rst_x_flag : std_logic := '0';

begin

  ---------------------
  --  INPUT PATH DELAYs
  ---------------------

  DI_dly         	 <= DI             	after 0 ps;
  DIP_dly        	 <= DIP            	after 0 ps;
  GSR_dly        	 <= GSR            	after 0 ps;
  RDCLK_dly      	 <= RDCLK          	after 0 ps;
  RDEN_dly       	 <= RDEN           	after 0 ps;
  RST_dly        	 <= RST            	after 0 ps;
  RSTREG_dly             <= RSTREG              after 0 ps;
  REGCE_dly              <= REGCE               after 0 ps;
  WRCLK_dly      	 <= WRCLK          	after 0 ps;
  WREN_dly       	 <= WREN           	after 0 ps;
  INJECTDBITERR_dly      <= INJECTDBITERR       after 0 ps;
  INJECTSBITERR_dly      <= INJECTSBITERR       after 0 ps;
  
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
--  variable Message : LINE;
  variable ae_empty_var      : integer := 0;
  variable ae_full_var       : integer := 0;
  
  begin
     if (first_time) then

       case EN_SYN is
            when TRUE  => sync <= '1';
            when FALSE => sync <= '0';
            when others =>
                    GenericValueCheckMessage
                      ( HeaderMsg            => " Attribute Syntax Error ",
                        GenericName          => " EN_SYN ",
                        EntityName           => "X_FIFO36E1",
                        GenericValue         => EN_SYN,
                        Unit                 => "",
                        ExpectedValueMsg     => " The Legal values for this attribute are ",
                        ExpectedGenericValue => " TRUE or FALSE ",
                        TailMsg              => "",
                        MsgSeverity          => failure
                        );
       end case;

       
       case DATA_WIDTH is
            when 4  => if (FIFO_SIZE = 36) then
                         addr_limit_var := 8192;
                       else                         
                         addr_limit_var := 4096;
                       end if;     
            when 9  => if (FIFO_SIZE = 36) then
                         addr_limit_var := 4096;
                       else                         
                         addr_limit_var := 2048;
                       end if;
            when 18 => if (FIFO_SIZE = 36) then
                         addr_limit_var := 2048;
                       else                         
                         addr_limit_var := 1024;
                       end if;
            when 36 => if (FIFO_SIZE = 36) then
                         addr_limit_var := 1024;
                       else                         
                         addr_limit_var := 512;
                       end if;
            when 72 =>
                       addr_limit_var := 512;

            when others =>
                    GenericValueCheckMessage
                      ( HeaderMsg            => " Attribute Syntax Error ",
                        GenericName          => " DATA_WIDTH ",
                        EntityName           => "X_FIFO36E1",
                        GenericValue         => DATA_WIDTH,
                        Unit                 => "",
                        ExpectedValueMsg     => " The Legal values for this attribute are ",
                        ExpectedGenericValue => " 4, 9, 18, 36 and 72 ",
                        TailMsg              => "",
                        MsgSeverity          => failure
                        );
       end case;

       rd_offset_stdlogic := To_StdLogicVector(ALMOST_EMPTY_OFFSET);
       rd_offset_int := SLV_TO_INT(rd_offset_stdlogic);

       wr_offset_stdlogic := To_StdLogicVector(ALMOST_FULL_OFFSET);
       wr_offset_int := SLV_TO_INT(wr_offset_stdlogic);

       case FIRST_WORD_FALL_THROUGH is
            when TRUE  =>
                         fwft_var     := '1';
                         ae_empty_var := rd_offset_int - 2;
                         ae_full_var := wr_offset_int;
            when FALSE =>
                         fwft_var     := '0';
                         if (EN_SYN = FALSE) then
                           ae_empty_var := rd_offset_int - 1;
                           ae_full_var := wr_offset_int;
                         else
                           ae_empty_var := rd_offset_int;
                           ae_full_var := wr_offset_int;
                         end if;
         when others =>
                    GenericValueCheckMessage
                      ( HeaderMsg            => " Attribute Syntax Error ",
                        GenericName          => " FIRST_WORD_FALL_THROUGH ",
                        EntityName           => "X_FIFO36E1",
                        GenericValue         => FIRST_WORD_FALL_THROUGH,
                        Unit                 => "",
                        ExpectedValueMsg     => " The Legal values for this attribute are ",
                        ExpectedGenericValue => " true or false ",
                        TailMsg              => "",
                        MsgSeverity          => failure
                        );
       end case;

       
       if(fwft_var = '1' and EN_SYN = TRUE) then
          assert false
          report "DRC Error : First word fall through is not supported in synchronous mode on X_FIFO36E1."
          severity failure;
       end if;

       
       if(EN_SYN = FALSE and DO_REG = 0) then
          assert false
          report "DRC Error : DO_REG = 0 is invalid when EN_SYN is set to FALSE on X_FIFO36E1."
          severity failure;
       end if;

       
       if (not (EN_ECC_WRITE = TRUE or EN_ECC_WRITE = FALSE)) then
         GenericValueCheckMessage
           ( HeaderMsg            => " Attribute Syntax Error ",
             GenericName          => " EN_ECC_WRITE ",
             EntityName           => "X_FIFO36E1",
             GenericValue         => EN_ECC_WRITE,
             Unit                 => "",
             ExpectedValueMsg     => " The Legal values for this attribute are ",
             ExpectedGenericValue => " true or false ",
             TailMsg              => "",
             MsgSeverity          => failure
             );
       end if;

       
       if (not (EN_ECC_READ = TRUE or EN_ECC_READ = FALSE)) then
         GenericValueCheckMessage
           ( HeaderMsg            => " Attribute Syntax Error ",
             GenericName          => " EN_ECC_READ ",
             EntityName           => "X_FIFO36E1",
             GenericValue         => EN_ECC_READ,
             Unit                 => "",
             ExpectedValueMsg     => " The Legal values for this attribute are ",
             ExpectedGenericValue => " true or false ",
             TailMsg              => "",
             MsgSeverity          => failure
             );
       end if;


       if ((EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE) and DATA_WIDTH /= 72) then
          assert false
            report "DRC Error : The attribute DATA_WIDTH must be set to 72 when X_FIFO36E1 is configured in the ECC mode."
          severity failure;
       end if;

       
       if (not(SIM_DEVICE = "VIRTEX6" or SIM_DEVICE = "7SERIES")) then
         GenericValueCheckMessage
            ( HeaderMsg            => " Attribute Syntax Error ",
              GenericName          => " SIM_DEVICE ",
              EntityName           => "X_FIFO36E1",
              GenericValue         => SIM_DEVICE,
              Unit                 => "",
              ExpectedValueMsg     => " The Legal values for this attribute are ",
              ExpectedGenericValue => " VIRTEX6 or 7SERIES ",
              TailMsg              => "",
              MsgSeverity          => failure
              );
       end if;


       addr_limit <= addr_limit_var;
       fwft       <= fwft_var;
       ae_full    <= ae_full_var;
       ae_empty   <= ae_empty_var;
       first_time := false;
     end if;
     wait;
  end process prcs_initialize;



  prcs_check_almost_rdclk:process(RDCLK_dly)
      variable count_freq_rdclk_var : integer := 0;
      variable period_rdclk_var : time := 0 ps;
      variable rise_rdclk_var : time := 0 ps;
      variable Message : LINE;
      variable aempty_offset_stdlogic : std_logic_vector (ALMOST_EMPTY_OFFSET'length-1 downto 0);
      variable aempty_offset_int : integer := 0;
      variable afull_offset_stdlogic : std_logic_vector (ALMOST_FULL_OFFSET'length-1 downto 0);
      variable afull_offset_int : integer := 0;
      variable roundup_period_rd_wr_int : integer := 0;
      variable s7_roundup_period_rd_wr_int : integer := 0;
      variable roundup_period_wr_rd_int : integer := 0;
      variable period_rdclk_real_var : real := 0.0;
      variable period_wrclk_real_var : real := 0.0;

  begin

      if (rising_edge(RDCLK_dly)) then

          aempty_offset_stdlogic := To_StdLogicVector(ALMOST_EMPTY_OFFSET);
          aempty_offset_int := SLV_TO_INT(aempty_offset_stdlogic);
             
          afull_offset_stdlogic := To_StdLogicVector(ALMOST_FULL_OFFSET);
          afull_offset_int := SLV_TO_INT(afull_offset_stdlogic);
                
          count_freq_rdclk_var := count_freq_rdclk_var + 1;

          if (count_freq_rdclk_var = 100) then
              rise_rdclk_var := now;
          elsif (count_freq_rdclk_var = 101) then
              period_rdclk_var := now - rise_rdclk_var;
          
           if (count_freq_wrclk >= 101 and RST_dly = '0' and GSR_dly = '0') then

              -- Setup ranges for almostempty
              if (period_rdclk_var = period_wrclk) then
                                                    
                  if (EN_SYN = FALSE) then

                      if (SIM_DEVICE = "7SERIES") then
                    
                          if (fwft = '0') then

                              if ((aempty_offset_int < 5) or (aempty_offset_int > addr_limit - 6)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, aempty_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 5);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 6 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;
 
                              if ((afull_offset_int < 4) or (afull_offset_int > addr_limit - 7)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, afull_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 4);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 7 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;

                          else
           
                              if ((aempty_offset_int < 6) or (aempty_offset_int > addr_limit - 5)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, aempty_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 6);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 5 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;
 
                              if ((afull_offset_int < 4) or (afull_offset_int > addr_limit - 7)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, afull_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 4);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 7 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;

                          end if;

                      else

                          if (fwft = '0') then

                              if ((aempty_offset_int < 5) or (aempty_offset_int > addr_limit - 5)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, aempty_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 5);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 5 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;
 
                              if ((afull_offset_int < 4) or (afull_offset_int > addr_limit - 5)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, afull_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 4);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 5 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;

                          else
           
                              if ((aempty_offset_int < 6) or (aempty_offset_int > addr_limit - 4)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, aempty_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 6);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 4 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;
 
                              if ((afull_offset_int < 4) or (afull_offset_int > addr_limit - 5)) then
                                write( Message, STRING'("Attribute Syntax Error : ") );
                                write( Message, STRING'("The attribute ") );
                                write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO36E1 is set to ") );
                                write( Message, afull_offset_int);
                                write( Message, STRING'(". Legal values for this attribute are ") );
                                write( Message, 4);
                                write( Message, STRING'(" to ") );
                                write( Message, addr_limit - 5 );
                                ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                                DEALLOCATE (Message);
                              end if;

                          end if;

                      end if;
                      
                  else
                    -- sync
           
                    if ((fwft = '0') and ((aempty_offset_int < 1) or (aempty_offset_int > addr_limit - 2))) then
                      write( Message, STRING'("Attribute Syntax Error : ") );
                      write( Message, STRING'("The attribute ") );
                      write( Message, STRING'("ALMOST_EMPTY_OFFSET on X_FIFO36E1 is set to ") );
                      write( Message, aempty_offset_int);
                      write( Message, STRING'(". Legal values for this attribute are ") );
                      write( Message, 1);
                      write( Message, STRING'(" to ") );
                      write( Message, addr_limit - 2 );
                      ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                      DEALLOCATE (Message);
                    end if;

                    if ((fwft = '0') and ((afull_offset_int < 1) or (afull_offset_int > addr_limit - 2))) then
                      write( Message, STRING'("Attribute Syntax Error : ") );
                      write( Message, STRING'("The attribute ") );
                      write( Message, STRING'("ALMOST_FULL_OFFSET on X_FIFO36E1 is set to ") );
                      write( Message, afull_offset_int);
                      write( Message, STRING'(". Legal values for this attribute are ") );
                      write( Message, 1);
                      write( Message, STRING'(" to ") );
                      write( Message, addr_limit - 2 );
                      ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                      DEALLOCATE (Message);
                    end if;

                  end if;

              else
                -- (period_rdclk_var /= period_wrclk)
                
                period_rdclk_real_var := real (period_rdclk_var / 1 ps);
                period_wrclk_real_var := real (period_wrclk / 1 ps);
              
                roundup_period_rd_wr_int := integer ((period_rdclk_real_var / period_wrclk_real_var) + 0.499);
                roundup_period_wr_rd_int := integer ((period_wrclk_real_var / period_rdclk_real_var) + 0.499);

                s7_roundup_period_rd_wr_int := integer ((4.0 * (period_rdclk_real_var / period_wrclk_real_var)) + 0.499);
                
                if (SIM_DEVICE = "7SERIES") then

                  if (afull_offset_int > (addr_limit - (s7_roundup_period_rd_wr_int + 6))) then
                    write( Message, STRING'("DRC Error : ") );
                    write( Message, STRING'("The attribute ") );
                    write( Message, STRING'("ALMOST_FULL_OFFSET on AX_FIFO36E1 is set to ") );
                    write( Message, afull_offset_int);
                    write( Message, STRING'(". It must be set to a value smaller than (FIFO_DEPTH - ((roundup (4 * (WRCLK frequency / RDCLK frequency))) + 6)) when X_FIFO36E1 has different frequencies for RDCLK and WRCLK.") );
                    ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                    DEALLOCATE (Message);
                  end if;

                else

                  if (afull_offset_int > (addr_limit - ((3 * roundup_period_wr_rd_int) + 3))) then
                    write( Message, STRING'("DRC Error : ") );
                    write( Message, STRING'("The attribute ") );
                    write( Message, STRING'("ALMOST_FULL_OFFSET on AX_FIFO36E1 is set to ") );
                    write( Message, afull_offset_int);
                    write( Message, STRING'(". It must be set to a value smaller than (FIFO_DEPTH - ((3 * roundup (RDCLK frequency / WRCLK frequency)) + 3)) when X_FIFO36E1 has different frequencies for RDCLK and WRCLK.") );
                    ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                    DEALLOCATE (Message);
                  end if;
                  

                  if (aempty_offset_int > (addr_limit - ((3 * roundup_period_rd_wr_int) + 3))) then
                    write( Message, STRING'("DRC Error : ") );
                    write( Message, STRING'("The attribute ") );
                    write( Message, STRING'("ALMOST_EMPTY_OFFSET on AX_FIFO36E1 is set to ") );
                    write( Message, aempty_offset_int);
                    write( Message, STRING'(". It must be set to a value smaller than (FIFO_DEPTH - ((3 * roundup (WRCLK frequency / RDCLK frequency)) + 3)) when X_FIFO36E1 has different frequencies for RDCLK and WRCLK.") );
                    ASSERT FALSE REPORT Message.ALL SEVERITY Failure;
                    DEALLOCATE (Message);
                  end if;

                end if;
  
              end if;

              count_freq_rdclk_var := 0;
              count_freq_wrclk_reset <= not count_freq_wrclk_reset;

            end if;

         end if;

      end if;

  end process prcs_check_almost_rdclk;


  
  prcs_check_almost_wrclk:process(WRCLK_dly, count_freq_wrclk_reset)
      variable count_freq_wrclk_var : integer := 0;
      variable rise_wrclk_var : time := 0 ps;
    begin

      if(count_freq_wrclk_reset'event) then
        count_freq_wrclk_var := 0;
        count_freq_wrclk <= 0;
      end if;

        
      if (rising_edge(WRCLK_dly)) then

        count_freq_wrclk_var := count_freq_wrclk_var + 1;

        if (count_freq_wrclk_var = 100) then
          rise_wrclk_var := now;
        elsif (count_freq_wrclk_var = 101) then
          period_wrclk <= now - rise_wrclk_var;
        end if;

        count_freq_wrclk <= count_freq_wrclk_var;

      end if;
        
  end process prcs_check_almost_wrclk;

                                                       
  
  V6: if (SIM_DEVICE = "VIRTEX6") generate

    prcs_3clkrst_readwrite:process(RDCLK_dly, WRCLK_dly, rst_rdckreg_flag, rst_wrckreg_flag)
      variable  rst_rdckreg_var : std_logic_vector (4 downto 0) := (others => '0');
      variable  rst_wrckreg_var : std_logic_vector (4 downto 0) := (others => '0');
      variable  rden_rdckreg_var : std_logic_vector (3 downto 0) := (others => '0');
      variable  wren_wrckreg_var : std_logic_vector (3 downto 0) := (others => '0');
      variable  viol_rst_rden_var : std_logic := '0';
      variable  viol_rst_wren_var : std_logic := '0';

    begin

      if(rising_edge(RDCLK_dly)) then

        if (RST_dly = '1' and RDEN_dly = '1') then
          viol_rst_rden_var := '1';
        end if;
        
        if (RST_dly = '0') then
          rden_rdckreg_var(3 downto 0) := rden_rdckreg_var(2 downto 0) & RDEN_dly;
        end if;

        if (rden_rdckreg_var = "0000") then
          rst_rdckreg_var(2) := RST_dly and rst_rdckreg_var(1);
          rst_rdckreg_var(1) := RST_dly and rst_rdckreg_var(0);
          rst_rdckreg_var(0) := RST_dly;
        end if;   

      end if;


      if(rising_edge(WRCLK_dly)) then

        if (RST_dly = '1' and WREN_dly = '1') then
          viol_rst_wren_var := '1';
        end if;
        
        if (RST_dly = '0') then
          wren_wrckreg_var(3 downto 0) := wren_wrckreg_var(2 downto 0) & WREN_dly;
        end if;
        
        if (wren_wrckreg_var = "0000") then
          rst_wrckreg_var(2) := RST_dly and rst_wrckreg_var(1);
          rst_wrckreg_var(1) := RST_dly and rst_wrckreg_var(0);
          rst_wrckreg_var(0) := RST_dly;
        end if;   

      end if;
      
    
      if (rst_rdckreg_flag'event) then
        rst_rdckreg <= "00000";
        rst_rdckreg_var := "00000";
        viol_rst_rden <= '0';
        viol_rst_rden_var := '0';
      else
        rst_rdckreg <= rst_rdckreg_var;
        viol_rst_rden <= viol_rst_rden_var;
      end if;


      if (rst_wrckreg_flag'event) then
        rst_wrckreg <= "00000";
        rst_wrckreg_var := "00000";
        viol_rst_wren <= '0';
        viol_rst_wren_var := '0';
      else
        rst_wrckreg <= rst_wrckreg_var;
        viol_rst_wren <= viol_rst_wren_var;
      end if;
    
    end process prcs_3clkrst_readwrite;

  
    prcs_2clkrst:process(RST_dly)
      variable rst_rdclk_flag_var : std_logic := '0';
      variable rst_wrclk_flag_var : std_logic := '0';
    begin
      rst_rdclk_flag <= '0';
      rst_wrclk_flag <= '0';
      rst_rdclk_flag_var := '0';
      rst_wrclk_flag_var := '0';
      
      if(falling_edge(RST_dly)) then
        if(((rst_rdckreg(2) ='0') or (rst_rdckreg(1) ='0') or (rst_rdckreg(0) ='0')) or viol_rst_rden = '1') then  
          assert false
            report "DRC Error : Reset is unsuccessful.  RST must be held high for at least three RDCLK clock cycles, and RDEN must be low for four clock cycles before RST becomes active high, and RDEN remains low during this reset cycle."
            severity Error;
          rst_rdclk_flag <= '1';
          rst_rdclk_flag_var := '1';
        end if;
         
        if(((rst_wrckreg(2) ='0') or (rst_wrckreg(1) ='0') or (rst_wrckreg(0) ='0')) or viol_rst_wren = '1') then  
          assert false
            report "DRC Error : Reset is unsuccessful.  RST must be held high for at least three WRCLK clock cycles, and WREN must be low for four clock cycles before RST becomes active high, and WREN remains low during this reset cycle."
            severity Error;
          rst_wrclk_flag <= '1';
          rst_wrclk_flag_var := '1';
        end if;

        if (rst_rdclk_flag_var = '0' and rst_wrclk_flag_var = '0' and first_rst_flag = '0') then
          first_rst_flag <= '1';
        end if;
        
        rst_rdckreg_flag <= not rst_rdckreg_flag;
        rst_wrckreg_flag <= not rst_wrckreg_flag;

      end if;

      
    end process prcs_2clkrst;

    
  end generate V6;


  S_7: if (SIM_DEVICE = "7SERIES") generate

    prcs_rst_rden_after_rst:process(RDCLK_dly, WRCLK_dly, RST_dly)
      variable rst_trans_rden_1 : std_logic := '0';
      variable rst_trans_rden_2 : std_logic := '0';
      variable after_rst_rdclk : integer := 0;
      variable rst_trans_wren_1 : std_logic := '0';
      variable rst_trans_wren_2 : std_logic := '0';
      variable after_rst_wrclk : integer := 0;
      variable after_rst_rden_flag : std_logic := '0';
      variable after_rst_wren_flag : std_logic := '0';
    begin


        if (rising_edge(RST_dly)) then
          rst_trans_rden_1 := '1';
        elsif (falling_edge(RST_dly) and rst_trans_rden_1 = '1') then 
          rst_trans_rden_2 := '1';
        end if;

        
        if (rising_edge(RST_dly)) then
          rst_trans_wren_1 := '1';
        elsif (falling_edge(RST_dly) and rst_trans_wren_1 = '1') then 
          rst_trans_wren_2 := '1';
        end if;

        
       if (rising_edge(RST_dly)) then
         after_rst_x_flag <= '0';
         after_rst_rdclk := 0;
         after_rst_wrclk := 0;
       end if;

        
	if (rising_edge(RDCLK_dly)) then
		    
          if (rst_trans_rden_1 = '1' and rst_trans_rden_2 = '1') then
			
            after_rst_rdclk := after_rst_rdclk + 1;
			
            if (RDEN_dly = '1' and after_rst_rdclk <= 2) then

              after_rst_rden_flag := '1';
            
            elsif (after_rst_rdclk = 3) then
              rst_trans_rden_1 := '0';
              rst_trans_rden_2 := '0';

              if (after_rst_rden_flag = '1') then
                assert false
                  report "DRC Error : Reset is unsuccessful at time %t.  RDEN must be low for at least two RDCLK clock cycles after RST deasserted."
                  severity Error;

                after_rst_rden_flag := '0';
                after_rst_x_flag <= '1';
				
              end if;
            end if;
          end if;
        end if;

        
	if (rising_edge(WRCLK_dly)) then
		    
          if (rst_trans_wren_1 = '1' and rst_trans_wren_2 = '1') then
			
            after_rst_wrclk := after_rst_wrclk + 1;
			
            if (WREN_dly = '1' and after_rst_wrclk <= 2) then

              after_rst_wren_flag := '1';
            
            elsif (after_rst_wrclk = 3) then
              rst_trans_wren_1 := '0';
              rst_trans_wren_2 := '0';

              if (after_rst_wren_flag = '1') then
                assert false
                  report "DRC Error : Reset is unsuccessful at time %t.  WREN must be low for at least two WRCLK clock cycles after RST deasserted."
                  severity Error;

                after_rst_wren_flag := '0';
                after_rst_x_flag <= '1';
				
              end if;
            end if;
          end if;
        end if;
        
    end process prcs_rst_rden_after_rst;

        
    prcs_5clkrst_readwrite:process(RDCLK_dly, WRCLK_dly, rst_rdckreg_flag, rst_wrckreg_flag)
      variable  rst_rdckreg_var : std_logic_vector (4 downto 0) := (others => '0');
      variable  rst_wrckreg_var : std_logic_vector (4 downto 0) := (others => '0');
      variable  rden_rst_cnt_var  : integer := 0;
      variable  wren_rst_cnt_var  : integer := 0;   
      variable  viol_rst_rden_var : std_logic := '0';
      variable  viol_rst_wren_var : std_logic := '0';
      
    begin

      if(rising_edge(RDCLK_dly)) then

        if (RST_dly = '1' and RDEN_dly = '1') then
          viol_rst_rden_var := '1';
        end if;

        
        if (RDEN_dly = '0' and RST_dly = '1') then
          rst_rdckreg_var(4) := RST_dly and rst_rdckreg_var(3);
          rst_rdckreg_var(3) := RST_dly and rst_rdckreg_var(2);
          rst_rdckreg_var(2) := RST_dly and rst_rdckreg_var(1);
          rst_rdckreg_var(1) := RST_dly and rst_rdckreg_var(0);
          rst_rdckreg_var(0) := RST_dly;
        elsif (RDEN_dly = '1' and RST_dly = '1') then
          rst_rdckreg_var := "00000";
        end if;   

      end if;


      if(rising_edge(WRCLK_dly)) then

        if (RST_dly = '1' and WREN_dly = '1') then
          viol_rst_wren_var := '1';
        end if;
        
        
        if (WREN_dly = '0' and RST_dly = '1') then
          rst_wrckreg_var(4) := RST_dly and rst_wrckreg_var(3);
          rst_wrckreg_var(3) := RST_dly and rst_wrckreg_var(2);
          rst_wrckreg_var(2) := RST_dly and rst_wrckreg_var(1);
          rst_wrckreg_var(1) := RST_dly and rst_wrckreg_var(0);
          rst_wrckreg_var(0) := RST_dly;
        elsif (WREN_dly = '1' and RST_dly = '1') then
          rst_wrckreg_var := "00000";
        end if;   

      end if;

      
      if (rst_rdckreg_flag'event) then
        rst_rdckreg <= "00000";
        rst_rdckreg_var := "00000";
        viol_rst_rden <= '0';
        viol_rst_rden_var := '0';
      else
        rst_rdckreg <= rst_rdckreg_var;
        viol_rst_rden <= viol_rst_rden_var;
      end if;


      if (rst_wrckreg_flag'event) then
        rst_wrckreg <= "00000";
        rst_wrckreg_var := "00000";
        viol_rst_wren <= '0';
        viol_rst_wren_var := '0';
      else
        rst_wrckreg <= rst_wrckreg_var;
        viol_rst_wren <= viol_rst_wren_var;
      end if;
    
    end process prcs_5clkrst_readwrite;


    prcs_2clkrst:process(RST_dly)
      variable rst_rdclk_flag_var : std_logic := '0';
      variable rst_wrclk_flag_var : std_logic := '0';
    begin
      rst_rdclk_flag <= '0';
      rst_wrclk_flag <= '0';

      if(falling_edge(RST_dly)) then
        if(((rst_rdckreg(4) ='0') or (rst_rdckreg(3) ='0') or (rst_rdckreg(2) ='0') or (rst_rdckreg(1) ='0') or (rst_rdckreg(0) ='0')) or viol_rst_rden = '1') then  
          assert false
            report "DRC Error : Reset is unsuccessful.  RST must be held high for at least five RDCLK clock cycles, and RDEN must be low before RST becomes active high, and RDEN remains low during this reset cycle."
            severity Error;
          rst_rdclk_flag <= '1';
          rst_rdclk_flag_var := '1';
        end if;
         
        if(((rst_wrckreg(4) ='0') or (rst_wrckreg(3) ='0') or (rst_wrckreg(2) ='0') or (rst_wrckreg(1) ='0') or (rst_wrckreg(0) ='0')) or viol_rst_wren = '1') then  
          assert false
            report "DRC Error : Reset is unsuccessful.  RST must be held high for at least five WRCLK clock cycles, and WREN must be low before RST becomes active high, and WREN remains low during this reset cycle."
            severity Error;
          rst_wrclk_flag <= '1';
          rst_wrclk_flag_var := '1';
        end if;

        if (rst_rdclk_flag_var = '0' and rst_wrclk_flag_var = '0' and first_rst_flag = '0') then
          first_rst_flag <= '1';
        end if;
        
        rst_rdckreg_flag <= not rst_rdckreg_flag;
        rst_wrckreg_flag <= not rst_wrckreg_flag;

      end if;
      
    end process prcs_2clkrst;

    
  end generate S_7;


-- DRC
  prcs_rst_rden_drc:process
    begin
      if (now > 0 ps and (RDEN_dly = '1' or GSR_dly = '0')) then
        wait until (rising_edge(RDCLK_dly));
          if (first_rst_flag = '0' and RDEN_dly = '1') then
            assert false
              report "A RESET cycle must be observerd before the first use of the FIFO instance."
              severity Error;
          end if;
      end if;
      wait on RDEN_dly;
  end process prcs_rst_rden_drc;

  
  prcs_rst_wren_drc:process
    begin
      if (now > 0 ps and (WREN_dly = '1' or GSR_dly = '0')) then
        wait until (rising_edge(WRCLK_dly));
          if (first_rst_flag = '0' and WREN_dly = '1') then
            assert false
              report "A RESET cycle must be observerd before the first use of the FIFO instance."
              severity Error;
          end if;
      end if;
      wait on WREN_dly, GSR_dly;
  end process prcs_rst_wren_drc;

  
V6_read_write: if (SIM_DEVICE = "VIRTEX6") generate
    
--####################################################################
--#####                         Read                             #####
--####################################################################
  prcs_read:process(RDCLK_dly, RST_dly, GSR_dly, update_from_write_prcs, update_from_write_prcs_sync, rst_rdclk_flag, rst_wrclk_flag)
  variable first_time        : boolean    := true;
  variable rd_addr_var       : integer    := 0;
  variable wr_addr_var       : integer    := 0;
  variable rdcount_var       : integer    := 0;

  variable rd_flag_var       : std_ulogic := '0';
  variable wr_flag_var       : std_ulogic := '0';
  variable awr_flag_var       : std_ulogic := '0';  

  variable rdcount_flag_var  : std_ulogic := '0';

  variable do_in             : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => '0');
  variable dop_in            : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => '0');

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

  variable do_buf : std_logic_vector(MSB_MAX_DO downto 0) := (others => '0');
  variable dop_buf : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable dopr_ecc : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable tmp_syndrome_int : integer;    
  variable syndrome : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable ecc_bit_position : std_logic_vector(71 downto 0) := (others => '0');
  variable di_dly_ecc_corrected : std_logic_vector(MSB_MAX_DO downto 0) := (others => '0');
  variable dip_dly_ecc_corrected : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable sbiterr_out : std_ulogic := '0';
  variable dbiterr_out : std_ulogic := '0';
  variable sbiterr_out_out_var : std_ulogic := '0';
  variable dbiterr_out_out_var : std_ulogic := '0';
  variable DO_OUTREG_var: std_logic_vector(MSB_MAX_DO downto 0) := (others => '0');
  variable DOP_OUTREG_var : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');

  begin


    if ((rst_rdclk_flag = '1') or (rst_wrclk_flag = '1'))then

       rd_addr <= 0;
       rd_flag <= '0';

       rd_addr_var  := 0;
       wr_addr_var  := 0;
       wr1_addr_var := 0;
       rd_prefetch_var := 0;
   
       rdcount_var := 0;
       
       rd_flag_var  := '0';
       wr_flag_var  := '0';
       awr_flag_var  := '0';       
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
       
       sbiterr_zd <= 'X';
       dbiterr_zd <= 'X';

    end if;
    
    
    if(RST_dly = '1') then

       rd_addr <= 0;
       rd_flag <= '0';

       rd_addr_var  := 0;
       wr_addr_var  := 0;
       wr1_addr_var := 0;
       rd_prefetch_var := 0;
   
       rdcount_var := 0;
       
       rd_flag_var  := '0';
       wr_flag_var  := '0';
       awr_flag_var  := '0';       
       wr1_flag_var := '0';
       rd_prefetch_flag_var := '0';
  
       rdcount_flag_var := '0';

       empty_int       :=  (others => '1');
       almostempty_int :=  (others => '1');
       empty_ram       :=  (others => '1');

       sbiterr_zd <= '0';
       dbiterr_zd <= '0';
       
       ALMOSTEMPTY_zd <= '1';
       EMPTY_zd <= '1';
       RDERR_zd <= '0';
       RDCOUNT_zd <= (others => '0');

    end if;

       
    if(GSR_dly = '1') then

         if (DO_REG = 1 and sync = '1') then
           
           DO_zd(mem_width-1 downto 0) <= INIT_STD(mem_width-1 downto 0);
           DO_OUTREG_zd(mem_width-1 downto 0) <= INIT_STD(mem_width-1 downto 0);
           do_in(mem_width-1 downto 0) := INIT_STD(mem_width-1 downto 0);
           do_buf(mem_width-1 downto 0) := INIT_STD(mem_width-1 downto 0);
           
           if (DATA_WIDTH /= 4) then
             DOP_zd(memp_width-1 downto 0) <= INIT_STD((memp_width+mem_width)-1 downto mem_width);
             DOP_OUTREG_zd(memp_width-1 downto 0) <= INIT_STD((memp_width+mem_width)-1 downto mem_width);
             dop_in(memp_width-1 downto 0) := INIT_STD((memp_width+mem_width)-1 downto mem_width);
             dop_buf(memp_width-1 downto 0) := INIT_STD((memp_width+mem_width)-1 downto mem_width);
           end if;

         else

           DO_zd((mem_width -1) downto 0) <= (others => '0');
           DO_OUTREG_zd((mem_width -1) downto 0) <= (others => '0');
           do_in((mem_width -1) downto 0) := (others => '0');
           do_buf((mem_width -1) downto 0) := (others => '0');
           
           if (DATA_WIDTH /= 4) then
             DOP_zd((memp_width -1) downto 0) <= (others => '0');
             DOP_OUTREG_zd((memp_width -1) downto 0) <= (others => '0');
             dop_in((memp_width -1) downto 0) := (others => '0');
             dop_buf((memp_width -1) downto 0) := (others => '0');
           end if;

         end if;

    elsif (GSR_dly = '0')then
       
       rden_var := RDEN_dly;
       wren_var := WREN_dly;

       if(rising_edge(RDCLK_dly)) then

         -- SRVAL in output register mode
         if (DO_REG = 1 and sync = '1' and rstreg_dly = '1') then
			
           DO_OUTREG_var(mem_width-1 downto 0) := SRVAL_STD(mem_width-1 downto 0);
         
           if (mem_width >= 8) then
             DOP_OUTREG_var(memp_width-1 downto 0) := SRVAL_STD((memp_width+mem_width)-1 downto mem_width);
           end if;

         end if;

         
         if (RST_dly = '0')then
         
          rd_flag_var := rd_flag;
          wr_flag_var := wr_flag;
          awr_flag_var := awr_flag;

          rd_addr_var := rd_addr;
          wr_addr_var := wr_addr;

          rdcount_var := SLV_TO_INT(RDCOUNT_zd);
          rdcount_flag_var := rdcount_flag;

         
          if (sync = '1') then

           -- output register
           if (DO_REG = 1 and regce_dly = '1' and rstreg_dly = '0') then
             
             DO_OUTREG_var := DO_zd;
             DOP_OUTREG_var := DOP_zd;
             dbiterr_out_out_var := dbiterr_out;
             sbiterr_out_out_var := sbiterr_out;
             
           end if;
            
                     
           if (RDEN_dly = '1') then

             if (EMPTY_zd = '0') then

               do_buf(mem_width-1 downto 0) := mem(rdcount_var);
               dop_buf(memp_width-1 downto 0) := memp(rdcount_var);

               -- ECC decode
               if (EN_ECC_READ = TRUE) then
                 -- regenerate parity
                 dopr_ecc(0) := do_buf(0) xor do_buf(1) xor do_buf(3) xor do_buf(4) xor do_buf(6) xor do_buf(8)
		      xor do_buf(10) xor do_buf(11) xor do_buf(13) xor do_buf(15) xor do_buf(17) xor do_buf(19)
		      xor do_buf(21) xor do_buf(23) xor do_buf(25) xor do_buf(26) xor do_buf(28)
            	      xor do_buf(30) xor do_buf(32) xor do_buf(34) xor do_buf(36) xor do_buf(38)
		      xor do_buf(40) xor do_buf(42) xor do_buf(44) xor do_buf(46) xor do_buf(48)
		      xor do_buf(50) xor do_buf(52) xor do_buf(54) xor do_buf(56) xor do_buf(57) xor do_buf(59)
		      xor do_buf(61) xor do_buf(63);

                 dopr_ecc(1) := do_buf(0) xor do_buf(2) xor do_buf(3) xor do_buf(5) xor do_buf(6) xor do_buf(9)
                      xor do_buf(10) xor do_buf(12) xor do_buf(13) xor do_buf(16) xor do_buf(17)
                      xor do_buf(20) xor do_buf(21) xor do_buf(24) xor do_buf(25) xor do_buf(27) xor do_buf(28)
                      xor do_buf(31) xor do_buf(32) xor do_buf(35) xor do_buf(36) xor do_buf(39)
                      xor do_buf(40) xor do_buf(43) xor do_buf(44) xor do_buf(47) xor do_buf(48)
                      xor do_buf(51) xor do_buf(52) xor do_buf(55) xor do_buf(56) xor do_buf(58) xor do_buf(59)
                      xor do_buf(62) xor do_buf(63);

                 dopr_ecc(2) := do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17)
                      xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48)
                      xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);
	
                 dopr_ecc(3) := do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
		      xor do_buf(10) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(4) := do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);


                 dopr_ecc(5) := do_buf(26) xor do_buf(27) xor do_buf(28) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38)
	              xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47)
                      xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(6) := do_buf(57) xor do_buf(58) xor do_buf(59)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 dopr_ecc(7) := dop_buf(0) xor dop_buf(1) xor dop_buf(2) xor dop_buf(3) xor dop_buf(4) xor dop_buf(5) xor dop_buf(6)
                      xor do_buf(0) xor do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18)
                      xor do_buf(19) xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(26) xor do_buf(27)
                      xor do_buf(28) xor do_buf(29) xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36)
                      xor do_buf(37) xor do_buf(38) xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45)
                      xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54)
                      xor do_buf(55) xor do_buf(56) xor do_buf(57) xor do_buf(58) xor do_buf(59) xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 syndrome := dopr_ecc xor dop_buf;

                 if (syndrome /= "00000000") then

                   if (syndrome(7) = '1') then  -- dectect single bit error

                     ecc_bit_position := do_buf(63 downto 57) & dop_buf(6) & do_buf(56 downto 26) & dop_buf(5) & do_buf(25 downto 11) & dop_buf(4) & do_buf(10 downto 4) & dop_buf(3) & do_buf(3 downto 1) & dop_buf(2) & do_buf(0) & dop_buf(1 downto 0) & dop_buf(7);

                     tmp_syndrome_int := SLV_TO_INT(syndrome(6 downto 0));

                     if (tmp_syndrome_int > 71) then
                       assert false
                         report "DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code."
                         severity failure;
                     end if;

                     ecc_bit_position(tmp_syndrome_int) := not ecc_bit_position(tmp_syndrome_int); -- correct single bit error in the output 

                     di_dly_ecc_corrected := ecc_bit_position(71 downto 65) & ecc_bit_position(63 downto 33) & ecc_bit_position(31 downto 17) & ecc_bit_position(15 downto 9) & ecc_bit_position(7 downto 5) & ecc_bit_position(3); -- correct single bit error in the memory

                     do_buf := di_dly_ecc_corrected;
			
                     dip_dly_ecc_corrected := ecc_bit_position(0) & ecc_bit_position(64) & ecc_bit_position(32) & ecc_bit_position(16) & ecc_bit_position(8) & ecc_bit_position(4) & ecc_bit_position(2 downto 1); -- correct single bit error in the parity memory
                
                     dop_buf := dip_dly_ecc_corrected;
                
                     dbiterr_out := '0';  -- latch out in sync mode
                     sbiterr_out := '1';

                   elsif (syndrome(7) = '0') then  -- double bit error
                     sbiterr_out := '0';
                     dbiterr_out := '1';
                   end if;
                   
                 else
                   dbiterr_out := '0';
                   sbiterr_out := '0';
                 end if;              

               end if;

               if (DO_REG = 0) then
                 dbiterr_out_out_var := dbiterr_out;
                 sbiterr_out_out_var := sbiterr_out;
               end if;

               
               DO_zd <= do_buf;
               DOP_zd <= dop_buf;

               rdcount_var := (rdcount_var + 1) mod addr_limit;

               if (rdcount_var = 0) then
                 rdcount_flag_var := not rdcount_flag_var;
               end if;

             end if;
           end if;


           if (RDEN_dly = '1' and EMPTY_zd = '1') then
             RDERR_zd <= '1';
           else
             RDERR_zd <= '0';
           end if;
           
           
           if (WREN_dly = '1') then
             EMPTY_zd <= '0';
           elsif (rdcount_var = wr_addr_var and rdcount_flag_var = wr_flag_var) then
             EMPTY_zd <= '1';
           end if;
             
           if((((rdcount_var + ae_empty) >= wr_addr_var) and (rdcount_flag_var = wr_flag_var)) or (((rdcount_var + ae_empty) >= (wr_addr_var + addr_limit)) and (rdcount_flag_var /= wr_flag_var))) then    
             ALMOSTEMPTY_zd <= '1';
           end if;

           update_from_read_prcs_sync <= not update_from_read_prcs_sync;

       elsif (sync = '0') then
         
         if(fwft = '0') then
           addr_limit_var := addr_limit;
           if((rden_var = '1') and (rd_addr_var /= rdcount_var)) then
              DO_zd   <= do_in;
              if (DATA_WIDTH /= 4) then
                DOP_zd  <= dop_in;
              end if;
              rd_addr_var  := (rd_addr_var + 1) mod addr_limit;
              if(rd_addr_var = 0) then 
                  rd_flag_var := NOT rd_flag_var;
              end if;

              dbiterr_out_out_var := dbiterr_out; -- reg out in async mode
              sbiterr_out_out_var := sbiterr_out;

           end if;
           if (((rd_addr_var = rdcount_var) and (empty_ram(3) = '0')) or 
              ((rden_var = '1') and (empty_ram(1) = '0'))) then
                do_buf(mem_width-1 downto 0) := mem(rdcount_var);
                dop_buf(memp_width-1 downto 0) := memp(rdcount_var);

 
                -- ECC decode
                if (EN_ECC_READ = TRUE) then
                 -- regenerate parity
                 dopr_ecc(0) := do_buf(0) xor do_buf(1) xor do_buf(3) xor do_buf(4) xor do_buf(6) xor do_buf(8)
		      xor do_buf(10) xor do_buf(11) xor do_buf(13) xor do_buf(15) xor do_buf(17) xor do_buf(19)
		      xor do_buf(21) xor do_buf(23) xor do_buf(25) xor do_buf(26) xor do_buf(28)
            	      xor do_buf(30) xor do_buf(32) xor do_buf(34) xor do_buf(36) xor do_buf(38)
		      xor do_buf(40) xor do_buf(42) xor do_buf(44) xor do_buf(46) xor do_buf(48)
		      xor do_buf(50) xor do_buf(52) xor do_buf(54) xor do_buf(56) xor do_buf(57) xor do_buf(59)
		      xor do_buf(61) xor do_buf(63);

                 dopr_ecc(1) := do_buf(0) xor do_buf(2) xor do_buf(3) xor do_buf(5) xor do_buf(6) xor do_buf(9)
                      xor do_buf(10) xor do_buf(12) xor do_buf(13) xor do_buf(16) xor do_buf(17)
                      xor do_buf(20) xor do_buf(21) xor do_buf(24) xor do_buf(25) xor do_buf(27) xor do_buf(28)
                      xor do_buf(31) xor do_buf(32) xor do_buf(35) xor do_buf(36) xor do_buf(39)
                      xor do_buf(40) xor do_buf(43) xor do_buf(44) xor do_buf(47) xor do_buf(48)
                      xor do_buf(51) xor do_buf(52) xor do_buf(55) xor do_buf(56) xor do_buf(58) xor do_buf(59)
                      xor do_buf(62) xor do_buf(63);

                 dopr_ecc(2) := do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17)
                      xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48)
                      xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);
	
                 dopr_ecc(3) := do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
		      xor do_buf(10) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(4) := do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);


                 dopr_ecc(5) := do_buf(26) xor do_buf(27) xor do_buf(28) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38)
	              xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47)
                      xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(6) := do_buf(57) xor do_buf(58) xor do_buf(59)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 dopr_ecc(7) := dop_buf(0) xor dop_buf(1) xor dop_buf(2) xor dop_buf(3) xor dop_buf(4) xor dop_buf(5) xor dop_buf(6)
                      xor do_buf(0) xor do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18)
                      xor do_buf(19) xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(26) xor do_buf(27)
                      xor do_buf(28) xor do_buf(29) xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36)
                      xor do_buf(37) xor do_buf(38) xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45)
                      xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54)
                      xor do_buf(55) xor do_buf(56) xor do_buf(57) xor do_buf(58) xor do_buf(59) xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 syndrome := dopr_ecc xor dop_buf;

                 if (syndrome /= "00000000") then

                   if (syndrome(7) = '1') then  -- dectect single bit error

                     ecc_bit_position := do_buf(63 downto 57) & dop_buf(6) & do_buf(56 downto 26) & dop_buf(5) & do_buf(25 downto 11) & dop_buf(4) & do_buf(10 downto 4) & dop_buf(3) & do_buf(3 downto 1) & dop_buf(2) & do_buf(0) & dop_buf(1 downto 0) & dop_buf(7);

                     tmp_syndrome_int := SLV_TO_INT(syndrome(6 downto 0));

                     if (tmp_syndrome_int > 71) then
                       assert false
                         report "DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code."
                         severity failure;
                     end if;
                     
                     ecc_bit_position(tmp_syndrome_int) := not ecc_bit_position(tmp_syndrome_int); -- correct single bit error in the output 

                     di_dly_ecc_corrected := ecc_bit_position(71 downto 65) & ecc_bit_position(63 downto 33) & ecc_bit_position(31 downto 17) & ecc_bit_position(15 downto 9) & ecc_bit_position(7 downto 5) & ecc_bit_position(3); -- correct single bit error in the memory

                     do_buf := di_dly_ecc_corrected;
			
                     dip_dly_ecc_corrected := ecc_bit_position(0) & ecc_bit_position(64) & ecc_bit_position(32) & ecc_bit_position(16) & ecc_bit_position(8) & ecc_bit_position(4) & ecc_bit_position(2 downto 1); -- correct single bit error in the parity memory
                
                     dop_buf := dip_dly_ecc_corrected;
                
                     dbiterr_out := '0';
                     sbiterr_out := '1';

                   elsif (syndrome(7) = '0') then  -- double bit error
                     sbiterr_out := '0';
                     dbiterr_out := '1';
                   end if;
                     
                 else
                   dbiterr_out := '0';
                   sbiterr_out := '0';
                 end if;              

              end if;

                
              do_in := do_buf;
              dop_in := dop_buf;
                 
                
              rdcount_var := (rdcount_var + 1) mod addr_limit;

              if(rdcount_var = 0) then
                 rdcount_flag_var := NOT rdcount_flag_var;
              end if;

         end if;
         
         elsif(fwft = '1') then
           if((rden_var = '1') and (rd_addr_var /= rd_prefetch_var)) then
              rd_prefetch_var := (rd_prefetch_var + 1) mod addr_limit;
              if(rd_prefetch_var = 0) then 
                  rd_prefetch_flag_var := NOT rd_prefetch_flag_var;
              end if;
           end if;
           if((rd_prefetch_var = rd_addr_var) and (rd_addr_var /= rdcount_var)) then
             DO_zd   <= do_in;
             if (DATA_WIDTH /= 4) then
               DOP_zd <= dop_in;
             end if;
             rd_addr_var  := (rd_addr_var + 1) mod addr_limit;
             if(rd_addr_var = 0) then 
                rd_flag_var := NOT rd_flag_var;
             end if;

             dbiterr_out_out_var := dbiterr_out; -- reg out in async mode
             sbiterr_out_out_var := sbiterr_out;
             
           end if;
           if(((rd_addr_var = rdcount_var) and (empty_ram(3) = '0')) or
              ((rden_var = '1')  and (empty_ram(1) = '0')) or 
              ((rden_var = '0')  and (empty_ram(1) = '0') and (rd_addr_var = rdcount_var))) then 
                do_buf(mem_width-1 downto 0) := mem(rdcount_var);
                dop_buf(memp_width-1 downto 0) := memp(rdcount_var);

                -- ECC decode
               if (EN_ECC_READ = TRUE) then
                 -- regenerate parity
                 dopr_ecc(0) := do_buf(0) xor do_buf(1) xor do_buf(3) xor do_buf(4) xor do_buf(6) xor do_buf(8)
		      xor do_buf(10) xor do_buf(11) xor do_buf(13) xor do_buf(15) xor do_buf(17) xor do_buf(19)
		      xor do_buf(21) xor do_buf(23) xor do_buf(25) xor do_buf(26) xor do_buf(28)
            	      xor do_buf(30) xor do_buf(32) xor do_buf(34) xor do_buf(36) xor do_buf(38)
		      xor do_buf(40) xor do_buf(42) xor do_buf(44) xor do_buf(46) xor do_buf(48)
		      xor do_buf(50) xor do_buf(52) xor do_buf(54) xor do_buf(56) xor do_buf(57) xor do_buf(59)
		      xor do_buf(61) xor do_buf(63);

                 dopr_ecc(1) := do_buf(0) xor do_buf(2) xor do_buf(3) xor do_buf(5) xor do_buf(6) xor do_buf(9)
                      xor do_buf(10) xor do_buf(12) xor do_buf(13) xor do_buf(16) xor do_buf(17)
                      xor do_buf(20) xor do_buf(21) xor do_buf(24) xor do_buf(25) xor do_buf(27) xor do_buf(28)
                      xor do_buf(31) xor do_buf(32) xor do_buf(35) xor do_buf(36) xor do_buf(39)
                      xor do_buf(40) xor do_buf(43) xor do_buf(44) xor do_buf(47) xor do_buf(48)
                      xor do_buf(51) xor do_buf(52) xor do_buf(55) xor do_buf(56) xor do_buf(58) xor do_buf(59)
                      xor do_buf(62) xor do_buf(63);

                 dopr_ecc(2) := do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17)
                      xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48)
                      xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);
	
                 dopr_ecc(3) := do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
		      xor do_buf(10) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(4) := do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);


                 dopr_ecc(5) := do_buf(26) xor do_buf(27) xor do_buf(28) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38)
	              xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47)
                      xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(6) := do_buf(57) xor do_buf(58) xor do_buf(59)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 dopr_ecc(7) := dop_buf(0) xor dop_buf(1) xor dop_buf(2) xor dop_buf(3) xor dop_buf(4) xor dop_buf(5) xor dop_buf(6)
                      xor do_buf(0) xor do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18)
                      xor do_buf(19) xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(26) xor do_buf(27)
                      xor do_buf(28) xor do_buf(29) xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36)
                      xor do_buf(37) xor do_buf(38) xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45)
                      xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54)
                      xor do_buf(55) xor do_buf(56) xor do_buf(57) xor do_buf(58) xor do_buf(59) xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 syndrome := dopr_ecc xor dop_buf;

                 if (syndrome /= "00000000") then

                   if (syndrome(7) = '1') then  -- dectect single bit error

                     ecc_bit_position := do_buf(63 downto 57) & dop_buf(6) & do_buf(56 downto 26) & dop_buf(5) & do_buf(25 downto 11) & dop_buf(4) & do_buf(10 downto 4) & dop_buf(3) & do_buf(3 downto 1) & dop_buf(2) & do_buf(0) & dop_buf(1 downto 0) & dop_buf(7);

                     tmp_syndrome_int := SLV_TO_INT(syndrome(6 downto 0));

                     if (tmp_syndrome_int > 71) then
                       assert false
                         report "DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code."
                         severity failure;
                     end if;                     
                     
                     ecc_bit_position(tmp_syndrome_int) := not ecc_bit_position(tmp_syndrome_int); -- correct single bit error in the output 

                     di_dly_ecc_corrected := ecc_bit_position(71 downto 65) & ecc_bit_position(63 downto 33) & ecc_bit_position(31 downto 17) & ecc_bit_position(15 downto 9) & ecc_bit_position(7 downto 5) & ecc_bit_position(3); -- correct single bit error in the memory

                     do_buf := di_dly_ecc_corrected;
			
                     dip_dly_ecc_corrected := ecc_bit_position(0) & ecc_bit_position(64) & ecc_bit_position(32) & ecc_bit_position(16) & ecc_bit_position(8) & ecc_bit_position(4) & ecc_bit_position(2 downto 1); -- correct single bit error in the parity memory
                
                     dop_buf := dip_dly_ecc_corrected;
                
                     dbiterr_out := '0';
                     sbiterr_out := '1';

                   elsif (syndrome(7) = '0') then  -- double bit error
                     sbiterr_out := '0';
                     dbiterr_out := '1';
                   end if;
                   
                 else
                   dbiterr_out := '0';
                   sbiterr_out := '0';
                 end if;              
               end if;

                
              do_in := do_buf;
              dop_in := dop_buf;
                 
                
              rdcount_var := (rdcount_var + 1) mod addr_limit;

              if(rdcount_var = 0) then
                 rdcount_flag_var := NOT rdcount_flag_var;
              end if;

         end if;

       end if;  ---  end if(fwft = '1')


         ALMOSTEMPTY_zd <= almostempty_int(3);

         if((((rdcount_var + ae_empty) >= wr_addr_var) and (rdcount_flag_var = awr_flag_var)) or (((rdcount_var + ae_empty) >= (wr_addr_var + addr_limit)) and (rdcount_flag_var /= awr_flag_var))) then    
            almostempty_int(3) := '1';
            almostempty_int(2) := '1';
            almostempty_int(1) := '1';
            almostempty_int(0) := '1';
         elsif(almostempty_int(2)  = '0') then
           -- added to match verilog
           if (rdcount_var <= rdcount_var + ae_empty or rdcount_flag_var /= awr_flag_var) then
            almostempty_int(3) :=  almostempty_int(0);
            almostempty_int(0) :=  '0';
           end if;
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
          
         if((rdcount_var = wr_addr_var) and (rdcount_flag_var = awr_flag_var)) then
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
         wr1_flag_var := awr_flag;

         if((rden_var = '1') and (EMPTY_zd = '1')) then
             RDERR_zd <= '1';
         else
             RDERR_zd <= '0';
         end if; -- end ((rden_var = '1') and (empty_int /= '1'))

        update_from_read_prcs <= NOT update_from_read_prcs;

       end if;

      end if; -- end (RST_dly = '0')

    end if; -- end (rising_edge(RDCLK_dly))

  end if; -- end (GSR_dly = 1)



     if(update_from_write_prcs_sync'event) then
       wr_addr_var := wr_addr;
       wr_flag_var := wr_flag;
       if((((rdcount_var + ae_empty) <  wr_addr_var)  and (rdcount_flag_var = wr_flag_var)) or 
          (((rdcount_var + ae_empty) < (wr_addr_var + addr_limit)) and (rdcount_flag_var /= wr_flag_var))) then    
          if(rdcount_var <= rdcount_var + ae_empty or rdcount_flag_var /= wr_flag_var) then
            almostempty_zd <= '0';
          end if;
       end if;
     end if;
  
     
     if(update_from_write_prcs'event) then
       wr_addr_var := wr_addr;
       wr_flag_var := wr_flag;
       awr_flag_var := awr_flag;

       if((((rdcount_var + ae_empty) <  wr_addr_var)  and (rdcount_flag_var = awr_flag_var)) or 
          (((rdcount_var + ae_empty) <  ( wr_addr_var + addr_limit)) and (rdcount_flag_var /= awr_flag_var))) then    
         if(wren_var = '1') then
             almostempty_int(2) := almostempty_int(1);
             almostempty_int(1) := '0';
          end if;
       else
           almostempty_int(2) := '1';
           almostempty_int(1) := '1';
       end if;
     end if;
  
  
     if (not (rst_rdclk_flag or rst_wrclk_flag) = '1') then
       RDCOUNT_zd <= CONV_STD_LOGIC_VECTOR(rdcount_var, MAX_RDCOUNT);       
       dbiterr_zd <= dbiterr_out_out_var;
       sbiterr_zd <= sbiterr_out_out_var;
     end if;

     rd_addr <= rd_addr_var;
     rd_flag <= rd_flag_var;
     rdcount_flag <= rdcount_flag_var;
     DO_OUTREG_zd <= DO_OUTREG_var;
     DOP_OUTREG_zd <= DOP_OUTREG_var;

  end process prcs_read;

--####################################################################
--#####                         Write                            #####
--####################################################################
  prcs_write:process(WRCLK_dly, RST_dly, GSR_dly, update_from_read_prcs, update_from_read_prcs_sync, rst_rdclk_flag, rst_wrclk_flag)
  variable first_time        : boolean    := true;
  variable wr_addr_var       : integer := 0;
  variable rd_addr_var       : integer := 0;
  variable rdcount_var       : integer := 0;
  variable wrcount_var       : integer := 0;

  variable rd_flag_var       : std_ulogic := '0';
  variable wr_flag_var       : std_ulogic := '0';
  variable awr_flag_var       : std_ulogic := '0';

  variable rdcount_flag_var  : std_ulogic := '0';

  variable almostfull_int : std_ulogic_vector(3 downto 0) := (others => '0');
  variable full_int       : std_ulogic_vector(3 downto 0) := (others => '0');

-- CR 195129  fix from verilog (may not be necessary for vhdl)
-- Added ren_var/wren_var to remember the old val of RDEN_dly/WREN_dly

  variable rden_var  : std_ulogic := '0';
  variable wren_var  : std_ulogic := '0';
  variable di_ecc_col : std_logic_vector(63 downto 0) := (others => '0');
  variable dip_ecc : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable dip_dly_ecc : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable ALMOSTFULL_var : std_ulogic     :=    '0';

  begin
    if ((RST_dly = '1') or (rst_rdclk_flag = '1') or (rst_wrclk_flag = '1'))then
        wr_addr_var := 0;
        wr_addr <=  0;
        wr_flag <= '0';
        awr_flag <= '0';
        
        wr_addr_var := 0;
        rd_addr_var := 0;
        rdcount_var := 0;
        wrcount_var := 0;
        ALMOSTFULL_var := '0';
   
        rd_flag_var := '0';
        wr_flag_var := '0';
        awr_flag_var := '0';

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
          eccparity_zd <= (others => 'X');
        end if;

    end if;
    
    if((GSR_dly = '0') and (RST_dly = '1'))then  -- match HW eccparity output when RST = 1

      if(rising_edge(WRCLK_dly)) then
        if(wren_dly = '1') then
          if (full_zd= '0') then

            -- ECC encode
            if (EN_ECC_WRITE = TRUE) then

              -- regenerate parity
              dip_ecc(0) := di_dly(0) xor di_dly(1) xor di_dly(3) xor di_dly(4) xor di_dly(6) xor di_dly(8)
		      xor di_dly(10) xor di_dly(11) xor di_dly(13) xor di_dly(15) xor di_dly(17) xor di_dly(19)
		      xor di_dly(21) xor di_dly(23) xor di_dly(25) xor di_dly(26) xor di_dly(28)
            	      xor di_dly(30) xor di_dly(32) xor di_dly(34) xor di_dly(36) xor di_dly(38)
		      xor di_dly(40) xor di_dly(42) xor di_dly(44) xor di_dly(46) xor di_dly(48)
		      xor di_dly(50) xor di_dly(52) xor di_dly(54) xor di_dly(56) xor di_dly(57) xor di_dly(59)
		      xor di_dly(61) xor di_dly(63);

              dip_ecc(1) := di_dly(0) xor di_dly(2) xor di_dly(3) xor di_dly(5) xor di_dly(6) xor di_dly(9)
                      xor di_dly(10) xor di_dly(12) xor di_dly(13) xor di_dly(16) xor di_dly(17)
                      xor di_dly(20) xor di_dly(21) xor di_dly(24) xor di_dly(25) xor di_dly(27) xor di_dly(28)
                      xor di_dly(31) xor di_dly(32) xor di_dly(35) xor di_dly(36) xor di_dly(39)
                      xor di_dly(40) xor di_dly(43) xor di_dly(44) xor di_dly(47) xor di_dly(48)
                      xor di_dly(51) xor di_dly(52) xor di_dly(55) xor di_dly(56) xor di_dly(58) xor di_dly(59)
                      xor di_dly(62) xor di_dly(63);

              dip_ecc(2) := di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17)
                      xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48)
                      xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);
	
              dip_ecc(3) := di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
		      xor di_dly(10) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(4) := di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);


              dip_ecc(5) := di_dly(26) xor di_dly(27) xor di_dly(28) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38)
	              xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47)
                      xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(6) := di_dly(57) xor di_dly(58) xor di_dly(59)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              dip_ecc(7) := dip_ecc(0) xor dip_ecc(1) xor dip_ecc(2) xor dip_ecc(3) xor dip_ecc(4) xor dip_ecc(5) xor dip_ecc(6)
                      xor di_dly(0) xor di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18)
                      xor di_dly(19) xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(26) xor di_dly(27)
                      xor di_dly(28) xor di_dly(29) xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36)
                      xor di_dly(37) xor di_dly(38) xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45)
                      xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54)
                      xor di_dly(55) xor di_dly(56) xor di_dly(57) xor di_dly(58) xor di_dly(59) xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              ECCPARITY_zd <= dip_ecc;

            end if;
          end if;
        end if;
      end if;
        
    elsif((GSR_dly = '0') and (RST_dly = '0') and (rst_rdclk_flag = '0') and (rst_wrclk_flag = '0'))then
      rden_var := RDEN_dly;
      wren_var := WREN_dly;

      if(rising_edge(WRCLK_dly)) then

        rd_flag_var := rd_flag;
        wr_flag_var := wr_flag;
        awr_flag_var := awr_flag;        

        rd_addr_var := rd_addr;
        wr_addr_var := wr_addr;

        rdcount_var := SLV_TO_INT(RDCOUNT_zd);
        rdcount_flag_var := rdcount_flag;


        if (not(EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE)) then
      
          if (injectsbiterr_dly = '1') then
            assert false
              report "DRC Warning : INJECTSBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on X_FIFO36E1 instance."
              severity Warning;
          end if;

          if (injectdbiterr_dly = '1') then
            assert false
            report "DRC Warning : INJECTDBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on X_FIFO36E1 instance."
            severity Warning;
          end if;

        end if;

        
	if (sync = '1') then
          if(wren_dly = '1') then
            if (full_zd= '0') then

            -- ECC encode
            if (EN_ECC_WRITE = TRUE) then

              -- regenerate parity
              dip_ecc(0) := di_dly(0) xor di_dly(1) xor di_dly(3) xor di_dly(4) xor di_dly(6) xor di_dly(8)
		      xor di_dly(10) xor di_dly(11) xor di_dly(13) xor di_dly(15) xor di_dly(17) xor di_dly(19)
		      xor di_dly(21) xor di_dly(23) xor di_dly(25) xor di_dly(26) xor di_dly(28)
            	      xor di_dly(30) xor di_dly(32) xor di_dly(34) xor di_dly(36) xor di_dly(38)
		      xor di_dly(40) xor di_dly(42) xor di_dly(44) xor di_dly(46) xor di_dly(48)
		      xor di_dly(50) xor di_dly(52) xor di_dly(54) xor di_dly(56) xor di_dly(57) xor di_dly(59)
		      xor di_dly(61) xor di_dly(63);

              dip_ecc(1) := di_dly(0) xor di_dly(2) xor di_dly(3) xor di_dly(5) xor di_dly(6) xor di_dly(9)
                      xor di_dly(10) xor di_dly(12) xor di_dly(13) xor di_dly(16) xor di_dly(17)
                      xor di_dly(20) xor di_dly(21) xor di_dly(24) xor di_dly(25) xor di_dly(27) xor di_dly(28)
                      xor di_dly(31) xor di_dly(32) xor di_dly(35) xor di_dly(36) xor di_dly(39)
                      xor di_dly(40) xor di_dly(43) xor di_dly(44) xor di_dly(47) xor di_dly(48)
                      xor di_dly(51) xor di_dly(52) xor di_dly(55) xor di_dly(56) xor di_dly(58) xor di_dly(59)
                      xor di_dly(62) xor di_dly(63);

              dip_ecc(2) := di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17)
                      xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48)
                      xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);
	
              dip_ecc(3) := di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
		      xor di_dly(10) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(4) := di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);


              dip_ecc(5) := di_dly(26) xor di_dly(27) xor di_dly(28) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38)
	              xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47)
                      xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(6) := di_dly(57) xor di_dly(58) xor di_dly(59)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              dip_ecc(7) := dip_ecc(0) xor dip_ecc(1) xor dip_ecc(2) xor dip_ecc(3) xor dip_ecc(4) xor dip_ecc(5) xor dip_ecc(6)
                      xor di_dly(0) xor di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18)
                      xor di_dly(19) xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(26) xor di_dly(27)
                      xor di_dly(28) xor di_dly(29) xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36)
                      xor di_dly(37) xor di_dly(38) xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45)
                      xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54)
                      xor di_dly(55) xor di_dly(56) xor di_dly(57) xor di_dly(58) xor di_dly(59) xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              ECCPARITY_zd <= dip_ecc;

              dip_dly_ecc := dip_ecc;  -- only 64 bits width

            else

              dip_dly_ecc := dip_dly; -- only 64 bits width

            end if;


            -- injecting error
            di_ecc_col := di_dly;

            if (EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE) then
               
              if (injectdbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
                di_ecc_col(62) := not(di_ecc_col(62));
              elsif (injectsbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
              end if;

            end if;

            
            mem(wr_addr_var) <= di_ecc_col(mem_width-1 downto 0);
            memp(wr_addr_var) <= dip_dly_ecc(memp_width-1 downto 0);

            wr_addr_var := (wr_addr_var + 1) mod addr_limit;

            if(wr_addr_var = 0) then
              wr_flag_var := NOT wr_flag_var;
            end if;

          end if;
        end if;


        if ((WREN_dly = '1') and (FULL_zd = '1')) then
          WRERR_zd <= '1';
        else
          WRERR_zd <= '0';
        end if;

        
        if (rden_dly = '1') then
          full_zd <= '0';
        elsif (rdcount_var = wr_addr_var and rdcount_flag_var /= wr_flag_var) then
          full_zd <= '1';
        end if;

        update_from_write_prcs_sync <= NOT update_from_write_prcs_sync;

        if((((rdcount_var + addr_limit) <= (wr_addr_var + ae_full)) and (rdcount_flag_var = wr_flag_var)) or ((rdcount_var <= (wr_addr_var + ae_full)) and (rdcount_flag_var /= wr_flag_var))) then
          almostfull_zd <= '1';
        end if;
        

      elsif (sync = '0') then

        if((wren_var = '1') and (full_zd = '0'))then  

          -- ECC encode
            if (EN_ECC_WRITE = TRUE) then

              -- regenerate parity
              dip_ecc(0) := di_dly(0) xor di_dly(1) xor di_dly(3) xor di_dly(4) xor di_dly(6) xor di_dly(8)
		      xor di_dly(10) xor di_dly(11) xor di_dly(13) xor di_dly(15) xor di_dly(17) xor di_dly(19)
		      xor di_dly(21) xor di_dly(23) xor di_dly(25) xor di_dly(26) xor di_dly(28)
            	      xor di_dly(30) xor di_dly(32) xor di_dly(34) xor di_dly(36) xor di_dly(38)
		      xor di_dly(40) xor di_dly(42) xor di_dly(44) xor di_dly(46) xor di_dly(48)
		      xor di_dly(50) xor di_dly(52) xor di_dly(54) xor di_dly(56) xor di_dly(57) xor di_dly(59)
		      xor di_dly(61) xor di_dly(63);

              dip_ecc(1) := di_dly(0) xor di_dly(2) xor di_dly(3) xor di_dly(5) xor di_dly(6) xor di_dly(9)
                      xor di_dly(10) xor di_dly(12) xor di_dly(13) xor di_dly(16) xor di_dly(17)
                      xor di_dly(20) xor di_dly(21) xor di_dly(24) xor di_dly(25) xor di_dly(27) xor di_dly(28)
                      xor di_dly(31) xor di_dly(32) xor di_dly(35) xor di_dly(36) xor di_dly(39)
                      xor di_dly(40) xor di_dly(43) xor di_dly(44) xor di_dly(47) xor di_dly(48)
                      xor di_dly(51) xor di_dly(52) xor di_dly(55) xor di_dly(56) xor di_dly(58) xor di_dly(59)
                      xor di_dly(62) xor di_dly(63);

              dip_ecc(2) := di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17)
                      xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48)
                      xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);
	
              dip_ecc(3) := di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
		      xor di_dly(10) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(4) := di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);


              dip_ecc(5) := di_dly(26) xor di_dly(27) xor di_dly(28) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38)
	              xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47)
                      xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(6) := di_dly(57) xor di_dly(58) xor di_dly(59)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              dip_ecc(7) := dip_ecc(0) xor dip_ecc(1) xor dip_ecc(2) xor dip_ecc(3) xor dip_ecc(4) xor dip_ecc(5) xor dip_ecc(6)
                      xor di_dly(0) xor di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18)
                      xor di_dly(19) xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(26) xor di_dly(27)
                      xor di_dly(28) xor di_dly(29) xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36)
                      xor di_dly(37) xor di_dly(38) xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45)
                      xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54)
                      xor di_dly(55) xor di_dly(56) xor di_dly(57) xor di_dly(58) xor di_dly(59) xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              ECCPARITY_zd <= dip_ecc;

              dip_dly_ecc := dip_ecc;  -- only 64 bits width

            else

              dip_dly_ecc := dip_dly; -- only 64 bits width

            end if;

            
            -- injecting error
            di_ecc_col := di_dly;

            if (EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE) then
              
              if (injectdbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
                di_ecc_col(62) := not(di_ecc_col(62));
              elsif (injectsbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
              end if;

            end if;
            
            
            mem(wr_addr_var) <= di_ecc_col(mem_width-1 downto 0);
            if (DATA_WIDTH >= 9) then
              memp(wr_addr_var) <= dip_dly_ecc(memp_width-1 downto 0);              
            end if;
                
            wr_addr_var := (wr_addr_var + 1) mod addr_limit;
         
            if(wr_addr_var = 0) then
              awr_flag_var := NOT awr_flag_var;
            end if;

            if(wr_addr_var = addr_limit - 1) then
              wr_flag_var := NOT wr_flag_var;
            end if;
            
        end if; -- if((wren_var = '1') and (FULL_zd = '0') ....      

        if((wren_var = '1') and (full_zd = '1')) then 
            WRERR_zd <= '1';
        else
            WRERR_zd <= '0';
        end if;

        ALMOSTFULL_var := almostfull_int(3);
        
        if((((rdcount_var + addr_limit) <= (wr_addr_var + ae_full)) and (rdcount_flag_var = awr_flag_var)) or ((rdcount_var <= (wr_addr_var + ae_full)) and (rdcount_flag_var /= awr_flag_var))) then    
          almostfull_int(3) := '1';
          almostfull_int(2) := '1';
          almostfull_int(1) := '1';
          almostfull_int(0) := '1';
        elsif(almostfull_int(2)  = '0') then
          if (wr_addr_var <= wr_addr_var + ae_full or rdcount_flag_var = awr_flag_var) then

            almostfull_int(3) := almostfull_int(0);
            almostfull_int(0) :=  '0';

          end if;
        end if;

        if (wren_var = '1' or full_zd = '1') then
          full_zd <= full_int(1);
        end if;

        if(((rdcount_var = wr_addr_var) or (rdcount_var - 1 = wr_addr_var or rdcount_var + addr_limit - 1 = wr_addr_var)) and ALMOSTFULL_var = '1') then
          full_int(1) := '1';
          full_int(0) := '1';
        else
          full_int(1) := full_int(0);
          full_int(0) := '0';
        end if;

        update_from_write_prcs <= NOT update_from_write_prcs;
        ALMOSTFULL_zd <= ALMOSTFULL_var;

      end if; -- if (sync)
  
        WRCOUNT_zd <= CONV_STD_LOGIC_VECTOR( wr_addr_var, MAX_WRCOUNT);

        wr_addr <= wr_addr_var;
        wr_flag <= wr_flag_var;
        awr_flag <= awr_flag_var;

    end if; -- if(rising(WRCLK_dly))

  end if; -- if(GSR_dly = '1'))


    if(update_from_read_prcs_sync'event) then
      rdcount_var := SLV_TO_INT(RDCOUNT_zd);
      rdcount_flag_var := rdcount_flag;
      if((((rdcount_var + addr_limit) > (wr_addr_var + ae_full)) and (rdcount_flag_var = wr_flag_var)) or ((rdcount_var > (wr_addr_var + ae_full)) and (rdcount_flag_var /= wr_flag_var))) then
        if (wr_addr_var <= wr_addr_var + ae_full or rdcount_flag_var = wr_flag_var) then
          ALMOSTFULL_zd <= '0';
        end if;
      end if;
    end if;

    if(update_from_read_prcs'event) then
       rdcount_var := SLV_TO_INT(RDCOUNT_zd);
       rdcount_flag_var := rdcount_flag;

       if((((rdcount_var + addr_limit) > (wr_addr_var + ae_full)) and (rdcount_flag_var = awr_flag_var)) or ((rdcount_var > (wr_addr_var + ae_full)) and (rdcount_flag_var /= awr_flag_var))) then    

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

end generate V6_read_write;


S7_read_write : if (SIM_DEVICE = "7SERIES") generate
    
--####################################################################
--#####                         Read                             #####
--####################################################################
  prcs_read:process(RDCLK_dly, RST_dly, GSR_dly, update_from_write_prcs_sync, rst_rdclk_flag, rst_wrclk_flag, after_rst_x_flag)
  variable first_time        : boolean    := true;
  variable rd_addr_var       : integer    := 0;
  variable wr_addr_var       : integer    := 0;
  variable wr_addr_sync_3_var : integer   := 0;
  variable wr_addr_sync_2_var : integer   := 0;
  variable wr_addr_sync_1_var : integer   := 0;

  variable rdcount_var         : integer    := 0;
  variable rdcount_m1_temp_var : integer    := 0;

  variable rd_flag_var       : std_ulogic := '0';
  variable wr_flag_var       : std_ulogic := '0';
  variable awr_flag_var       : std_ulogic := '0';  

  variable rdcount_flag_var  : std_ulogic := '0';

  variable do_in             : std_logic_vector(MSB_MAX_DO  downto 0)    := (others => '0');
  variable dop_in            : std_logic_vector(MSB_MAX_DOP downto 0)    := (others => '0');

  variable almostempty_int   : std_ulogic_vector(3 downto 0) := (others => '1');
  variable empty_int         : std_ulogic_vector(3 downto 0) := (others => '1');
  variable empty_ram         : std_ulogic_vector(3 downto 0) := (others => '1');

  variable addr_limit_var    : integer    := 0;

  variable wr1_addr_var      : integer := 0;
  variable wr1_flag_var      : std_ulogic := '0';
  variable rd_prefetch_var   : integer := 0;
  variable rd_prefetch_flag_var  : std_ulogic := '0';

  variable rden_var  : std_ulogic := '0';
  variable wren_var  : std_ulogic := '0';

  variable do_buf : std_logic_vector(MSB_MAX_DO downto 0) := (others => '0');
  variable dop_buf : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable dopr_ecc : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable tmp_syndrome_int : integer;    
  variable syndrome : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable ecc_bit_position : std_logic_vector(71 downto 0) := (others => '0');
  variable di_dly_ecc_corrected : std_logic_vector(MSB_MAX_DO downto 0) := (others => '0');
  variable dip_dly_ecc_corrected : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable sbiterr_out : std_ulogic := '0';
  variable dbiterr_out : std_ulogic := '0';
  variable sbiterr_out_out_var : std_ulogic := '0';
  variable dbiterr_out_out_var : std_ulogic := '0';
  variable DO_OUTREG_var: std_logic_vector(MSB_MAX_DO downto 0) := (others => '0');
  variable DOP_OUTREG_var : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable awr_flag_sync_1_var : std_ulogic := '0';
  variable awr_flag_sync_2_var : std_ulogic := '0';
  variable awr_flag_sync_3_var : std_ulogic := '0';
  
  begin

    if (rising_edge(RDCLK_dly)) then
         wr_addr_sync_3_var := wr_addr_sync_2_var;
         wr_addr_sync_2_var := wr_addr_sync_1_var;
         wr_addr_sync_1_var := wr_addr_7s;

         awr_flag_sync_3_var := awr_flag_sync_2_var;
         awr_flag_sync_2_var := awr_flag_sync_1_var;
         awr_flag_sync_1_var := awr_flag;
    end if;


    if ((rst_rdclk_flag = '1') or (rst_wrclk_flag = '1') or (after_rst_x_flag = '1'))then

       rd_addr_7s <= 0;
       rd_flag <= '0';

       rd_addr_var  := 0;
       wr_addr_var  := 0;
       wr1_addr_var := 0;
       rd_prefetch_var := 0;

       rdcount_var := 0;
       
       rd_flag_var  := '0';
       wr_flag_var  := '0';
       awr_flag_var  := '0';       
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
       
       sbiterr_zd <= 'X';
       dbiterr_zd <= 'X';

       rdcount_m1 <= -1;
       wr_addr_sync_3_var := 0;
       
    end if;
    
    
    if(RST_dly = '1') then

       rd_addr_7s <= 0;
       rd_flag <= '0';

       rd_addr_var  := 0;
       wr_addr_var  := 0;
       wr1_addr_var := 0;
       rd_prefetch_var := 0;
   
       rdcount_var := 0;
       
       rd_flag_var  := '0';
       wr_flag_var  := '0';
       awr_flag_var  := '0';       
       wr1_flag_var := '0';
       rd_prefetch_flag_var := '0';
  
       rdcount_flag_var := '0';

       empty_int       :=  (others => '1');
       almostempty_int :=  (others => '1');
       empty_ram       :=  (others => '1');

       sbiterr_zd <= '0';
       dbiterr_zd <= '0';
       
       ALMOSTEMPTY_zd <= '1';
       EMPTY_zd <= '1';
       RDERR_zd <= '0';
       RDCOUNT_zd <= (others => '0');

       rdcount_m1 <= -1;
       wr_addr_sync_3_var := 0;


       if (fwft_prefetch_flag = 1) then

         set_fwft_prefetch_flag_to_0 <= NOT set_fwft_prefetch_flag_to_0;

         DO_zd <= do_in;

         if (DATA_WIDTH /= 4) then
           DOP_zd <= dop_in;
         end if;

       end if;

    end if;

    
    if(GSR_dly = '1') then

         if (DO_REG = 1 and sync = '1') then
           
           DO_zd(mem_width-1 downto 0) <= INIT_STD(mem_width-1 downto 0);
           DO_OUTREG_zd(mem_width-1 downto 0) <= INIT_STD(mem_width-1 downto 0);
           do_in(mem_width-1 downto 0) := INIT_STD(mem_width-1 downto 0);
           do_buf(mem_width-1 downto 0) := INIT_STD(mem_width-1 downto 0);
           
           if (DATA_WIDTH /= 4) then
             DOP_zd(memp_width-1 downto 0) <= INIT_STD((memp_width+mem_width)-1 downto mem_width);
             DOP_OUTREG_zd(memp_width-1 downto 0) <= INIT_STD((memp_width+mem_width)-1 downto mem_width);
             dop_in(memp_width-1 downto 0) := INIT_STD((memp_width+mem_width)-1 downto mem_width);
             dop_buf(memp_width-1 downto 0) := INIT_STD((memp_width+mem_width)-1 downto mem_width);
           end if;

         else

           DO_zd((mem_width -1) downto 0) <= (others => '0');
           DO_OUTREG_zd((mem_width -1) downto 0) <= (others => '0');
           do_in((mem_width -1) downto 0) := (others => '0');
           do_buf((mem_width -1) downto 0) := (others => '0');
           
           if (DATA_WIDTH /= 4) then
             DOP_zd((memp_width -1) downto 0) <= (others => '0');
             DOP_OUTREG_zd((memp_width -1) downto 0) <= (others => '0');
             dop_in((memp_width -1) downto 0) := (others => '0');
             dop_buf((memp_width -1) downto 0) := (others => '0');
           end if;

         end if;

    elsif (GSR_dly = '0')then

       rden_var := RDEN_dly;
       wren_var := WREN_dly;

       if(rising_edge(RDCLK_dly)) then

         -- SRVAL in output register mode
         if (DO_REG = 1 and sync = '1' and rstreg_dly = '1') then
			
           DO_OUTREG_var(mem_width-1 downto 0) := SRVAL_STD(mem_width-1 downto 0);
         
           if (mem_width >= 8) then
             DOP_OUTREG_var(memp_width-1 downto 0) := SRVAL_STD((memp_width+mem_width)-1 downto mem_width);
           end if;

         end if;

         
         if (RST_dly = '0')then
         
          rd_flag_var := rd_flag;
          wr_flag_var := wr_flag;
          awr_flag_var := awr_flag;

          rd_addr_var := rd_addr_7s;
          wr_addr_var := wr_addr_7s;

          rdcount_var := SLV_TO_INT(RDCOUNT_zd);
          rdcount_flag_var := rdcount_flag;

         
          if (sync = '1') then

           -- output register
           if (DO_REG = 1 and regce_dly = '1' and rstreg_dly = '0') then
             
             DO_OUTREG_var := DO_zd;
             DOP_OUTREG_var := DOP_zd;
             dbiterr_out_out_var := dbiterr_out;
             sbiterr_out_out_var := sbiterr_out;
             
           end if;
            
                     
           if (RDEN_dly = '1') then

             if (EMPTY_zd = '0') then

               do_buf(mem_width-1 downto 0) := mem(rdcount_var);
               dop_buf(memp_width-1 downto 0) := memp(rdcount_var);
               
               -- ECC decode
               if (EN_ECC_READ = TRUE) then
                 -- regenerate parity
                 dopr_ecc(0) := do_buf(0) xor do_buf(1) xor do_buf(3) xor do_buf(4) xor do_buf(6) xor do_buf(8)
		      xor do_buf(10) xor do_buf(11) xor do_buf(13) xor do_buf(15) xor do_buf(17) xor do_buf(19)
		      xor do_buf(21) xor do_buf(23) xor do_buf(25) xor do_buf(26) xor do_buf(28)
            	      xor do_buf(30) xor do_buf(32) xor do_buf(34) xor do_buf(36) xor do_buf(38)
		      xor do_buf(40) xor do_buf(42) xor do_buf(44) xor do_buf(46) xor do_buf(48)
		      xor do_buf(50) xor do_buf(52) xor do_buf(54) xor do_buf(56) xor do_buf(57) xor do_buf(59)
		      xor do_buf(61) xor do_buf(63);

                 dopr_ecc(1) := do_buf(0) xor do_buf(2) xor do_buf(3) xor do_buf(5) xor do_buf(6) xor do_buf(9)
                      xor do_buf(10) xor do_buf(12) xor do_buf(13) xor do_buf(16) xor do_buf(17)
                      xor do_buf(20) xor do_buf(21) xor do_buf(24) xor do_buf(25) xor do_buf(27) xor do_buf(28)
                      xor do_buf(31) xor do_buf(32) xor do_buf(35) xor do_buf(36) xor do_buf(39)
                      xor do_buf(40) xor do_buf(43) xor do_buf(44) xor do_buf(47) xor do_buf(48)
                      xor do_buf(51) xor do_buf(52) xor do_buf(55) xor do_buf(56) xor do_buf(58) xor do_buf(59)
                      xor do_buf(62) xor do_buf(63);

                 dopr_ecc(2) := do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17)
                      xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48)
                      xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);
	
                 dopr_ecc(3) := do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
		      xor do_buf(10) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(4) := do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);


                 dopr_ecc(5) := do_buf(26) xor do_buf(27) xor do_buf(28) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38)
	              xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47)
                      xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(6) := do_buf(57) xor do_buf(58) xor do_buf(59)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 dopr_ecc(7) := dop_buf(0) xor dop_buf(1) xor dop_buf(2) xor dop_buf(3) xor dop_buf(4) xor dop_buf(5) xor dop_buf(6)
                      xor do_buf(0) xor do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18)
                      xor do_buf(19) xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(26) xor do_buf(27)
                      xor do_buf(28) xor do_buf(29) xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36)
                      xor do_buf(37) xor do_buf(38) xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45)
                      xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54)
                      xor do_buf(55) xor do_buf(56) xor do_buf(57) xor do_buf(58) xor do_buf(59) xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 syndrome := dopr_ecc xor dop_buf;

                 if (syndrome /= "00000000") then

                   if (syndrome(7) = '1') then  -- dectect single bit error

                     ecc_bit_position := do_buf(63 downto 57) & dop_buf(6) & do_buf(56 downto 26) & dop_buf(5) & do_buf(25 downto 11) & dop_buf(4) & do_buf(10 downto 4) & dop_buf(3) & do_buf(3 downto 1) & dop_buf(2) & do_buf(0) & dop_buf(1 downto 0) & dop_buf(7);

                     tmp_syndrome_int := SLV_TO_INT(syndrome(6 downto 0));

                     if (tmp_syndrome_int > 71) then
                       assert false
                         report "DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code."
                         severity failure;
                     end if;

                     ecc_bit_position(tmp_syndrome_int) := not ecc_bit_position(tmp_syndrome_int); -- correct single bit error in the output 

                     di_dly_ecc_corrected := ecc_bit_position(71 downto 65) & ecc_bit_position(63 downto 33) & ecc_bit_position(31 downto 17) & ecc_bit_position(15 downto 9) & ecc_bit_position(7 downto 5) & ecc_bit_position(3); -- correct single bit error in the memory

                     do_buf := di_dly_ecc_corrected;
			
                     dip_dly_ecc_corrected := ecc_bit_position(0) & ecc_bit_position(64) & ecc_bit_position(32) & ecc_bit_position(16) & ecc_bit_position(8) & ecc_bit_position(4) & ecc_bit_position(2 downto 1); -- correct single bit error in the parity memory
                
                     dop_buf := dip_dly_ecc_corrected;
                
                     dbiterr_out := '0';  -- latch out in sync mode
                     sbiterr_out := '1';

                   elsif (syndrome(7) = '0') then  -- double bit error
                     sbiterr_out := '0';
                     dbiterr_out := '1';
                   end if;
                   
                 else
                   dbiterr_out := '0';
                   sbiterr_out := '0';
                 end if;              

               end if;

               if (DO_REG = 0) then
                 dbiterr_out_out_var := dbiterr_out;
                 sbiterr_out_out_var := sbiterr_out;
               end if;

               
               DO_zd <= do_buf;
               DOP_zd <= dop_buf;

               
               rdcount_var := (rdcount_var + 1) mod addr_limit;

               if (rdcount_var = 0) then
                 rdcount_flag_var := not rdcount_flag_var;
               end if;

             end if;
           end if;


           if (RDEN_dly = '1' and EMPTY_zd = '1') then
             RDERR_zd <= '1';
           else
             RDERR_zd <= '0';
           end if;
           
           
           if (WREN_dly = '1') then
             EMPTY_zd <= '0';
           elsif (rdcount_var = wr_addr_var and rdcount_flag_var = wr_flag_var) then
             EMPTY_zd <= '1';
           end if;
             
           if((((rdcount_var + ae_empty) >= wr_addr_var) and (rdcount_flag_var = wr_flag_var)) or (((rdcount_var + ae_empty) >= (wr_addr_var + addr_limit)) and (rdcount_flag_var /= wr_flag_var))) then    
             ALMOSTEMPTY_zd <= '1';
           end if;

           update_from_read_prcs_sync <= not update_from_read_prcs_sync;

       elsif (sync = '0') then

         if(fwft = '0') then
           addr_limit_var := addr_limit;

           if(RDEN_dly = '1' and rd_addr_var /= rdcount_var) then

             DO_zd   <= do_in;
              if (DATA_WIDTH /= 4) then
                DOP_zd  <= dop_in;
              end if;
              rd_addr_var  := (rd_addr_var + 1) mod addr_limit;
              if(rd_addr_var = 0) then 
                  rd_flag_var := NOT rd_flag_var;
              end if;

              dbiterr_out_out_var := dbiterr_out; -- reg out in async mode
              sbiterr_out_out_var := sbiterr_out;

           end if;

             
           if (empty_ram(0) = '0' and (RDEN_dly = '1' or rd_addr_var = rdcount_var)) then

                do_buf(mem_width-1 downto 0) := mem(rdcount_var);
                dop_buf(memp_width-1 downto 0) := memp(rdcount_var);

                
                -- ECC decode
                if (EN_ECC_READ = TRUE) then
                 -- regenerate parity
                 dopr_ecc(0) := do_buf(0) xor do_buf(1) xor do_buf(3) xor do_buf(4) xor do_buf(6) xor do_buf(8)
		      xor do_buf(10) xor do_buf(11) xor do_buf(13) xor do_buf(15) xor do_buf(17) xor do_buf(19)
		      xor do_buf(21) xor do_buf(23) xor do_buf(25) xor do_buf(26) xor do_buf(28)
            	      xor do_buf(30) xor do_buf(32) xor do_buf(34) xor do_buf(36) xor do_buf(38)
		      xor do_buf(40) xor do_buf(42) xor do_buf(44) xor do_buf(46) xor do_buf(48)
		      xor do_buf(50) xor do_buf(52) xor do_buf(54) xor do_buf(56) xor do_buf(57) xor do_buf(59)
		      xor do_buf(61) xor do_buf(63);

                 dopr_ecc(1) := do_buf(0) xor do_buf(2) xor do_buf(3) xor do_buf(5) xor do_buf(6) xor do_buf(9)
                      xor do_buf(10) xor do_buf(12) xor do_buf(13) xor do_buf(16) xor do_buf(17)
                      xor do_buf(20) xor do_buf(21) xor do_buf(24) xor do_buf(25) xor do_buf(27) xor do_buf(28)
                      xor do_buf(31) xor do_buf(32) xor do_buf(35) xor do_buf(36) xor do_buf(39)
                      xor do_buf(40) xor do_buf(43) xor do_buf(44) xor do_buf(47) xor do_buf(48)
                      xor do_buf(51) xor do_buf(52) xor do_buf(55) xor do_buf(56) xor do_buf(58) xor do_buf(59)
                      xor do_buf(62) xor do_buf(63);

                 dopr_ecc(2) := do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17)
                      xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48)
                      xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);
	
                 dopr_ecc(3) := do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
		      xor do_buf(10) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(4) := do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);


                 dopr_ecc(5) := do_buf(26) xor do_buf(27) xor do_buf(28) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38)
	              xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47)
                      xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(6) := do_buf(57) xor do_buf(58) xor do_buf(59)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 dopr_ecc(7) := dop_buf(0) xor dop_buf(1) xor dop_buf(2) xor dop_buf(3) xor dop_buf(4) xor dop_buf(5) xor dop_buf(6)
                      xor do_buf(0) xor do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18)
                      xor do_buf(19) xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(26) xor do_buf(27)
                      xor do_buf(28) xor do_buf(29) xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36)
                      xor do_buf(37) xor do_buf(38) xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45)
                      xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54)
                      xor do_buf(55) xor do_buf(56) xor do_buf(57) xor do_buf(58) xor do_buf(59) xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 syndrome := dopr_ecc xor dop_buf;

                 if (syndrome /= "00000000") then

                   if (syndrome(7) = '1') then  -- dectect single bit error

                     ecc_bit_position := do_buf(63 downto 57) & dop_buf(6) & do_buf(56 downto 26) & dop_buf(5) & do_buf(25 downto 11) & dop_buf(4) & do_buf(10 downto 4) & dop_buf(3) & do_buf(3 downto 1) & dop_buf(2) & do_buf(0) & dop_buf(1 downto 0) & dop_buf(7);

                     tmp_syndrome_int := SLV_TO_INT(syndrome(6 downto 0));

                     if (tmp_syndrome_int > 71) then
                       assert false
                         report "DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code."
                         severity failure;
                     end if;
                     
                     ecc_bit_position(tmp_syndrome_int) := not ecc_bit_position(tmp_syndrome_int); -- correct single bit error in the output 

                     di_dly_ecc_corrected := ecc_bit_position(71 downto 65) & ecc_bit_position(63 downto 33) & ecc_bit_position(31 downto 17) & ecc_bit_position(15 downto 9) & ecc_bit_position(7 downto 5) & ecc_bit_position(3); -- correct single bit error in the memory

                     do_buf := di_dly_ecc_corrected;
			
                     dip_dly_ecc_corrected := ecc_bit_position(0) & ecc_bit_position(64) & ecc_bit_position(32) & ecc_bit_position(16) & ecc_bit_position(8) & ecc_bit_position(4) & ecc_bit_position(2 downto 1); -- correct single bit error in the parity memory
                
                     dop_buf := dip_dly_ecc_corrected;
                
                     dbiterr_out := '0';
                     sbiterr_out := '1';

                   elsif (syndrome(7) = '0') then  -- double bit error
                     sbiterr_out := '0';
                     dbiterr_out := '1';
                   end if;
                     
                 else
                   dbiterr_out := '0';
                   sbiterr_out := '0';
                 end if;              

              end if;

                
              do_in := do_buf;
              dop_in := dop_buf;

              rdcount_m1_temp_var := rdcount_var;
              rdcount_m1 <= rdcount_m1_temp_var;
           
              rdcount_var := (rdcount_var + 1) mod addr_limit;

              if(rdcount_var = 0) then
                 rdcount_flag_var := NOT rdcount_flag_var;
              end if;

         end if;
         
         elsif(fwft = '1') then
           if((RDEN_dly = '1') and (rd_addr_var /= rd_prefetch_var)) then
              rd_prefetch_var := (rd_prefetch_var + 1) mod addr_limit;
              if(rd_prefetch_var = 0) then 
                  rd_prefetch_flag_var := NOT rd_prefetch_flag_var;
              end if;
           end if;

           
           if((rd_prefetch_var = rd_addr_var and rd_addr_var /= rdcount_var) or (RST_dly = '1' and fwft_prefetch_flag = 1)) then

             set_fwft_prefetch_flag_to_0 <= NOT set_fwft_prefetch_flag_to_0;

             DO_zd   <= do_in;
             if (DATA_WIDTH /= 4) then
               DOP_zd <= dop_in;
             end if;
             rd_addr_var  := (rd_addr_var + 1) mod addr_limit;
             if(rd_addr_var = 0) then 
                rd_flag_var := NOT rd_flag_var;
             end if;

             dbiterr_out_out_var := dbiterr_out; -- reg out in async mode
             sbiterr_out_out_var := sbiterr_out;
             
           end if;

           
           if (empty_ram(0) = '0' and (RDEN_dly = '1' or rd_addr_var = rdcount_var)) then
             
               do_buf(mem_width-1 downto 0) := mem(rdcount_var);
               dop_buf(memp_width-1 downto 0) := memp(rdcount_var);

                -- ECC decode
               if (EN_ECC_READ = TRUE) then
                 -- regenerate parity
                 dopr_ecc(0) := do_buf(0) xor do_buf(1) xor do_buf(3) xor do_buf(4) xor do_buf(6) xor do_buf(8)
		      xor do_buf(10) xor do_buf(11) xor do_buf(13) xor do_buf(15) xor do_buf(17) xor do_buf(19)
		      xor do_buf(21) xor do_buf(23) xor do_buf(25) xor do_buf(26) xor do_buf(28)
            	      xor do_buf(30) xor do_buf(32) xor do_buf(34) xor do_buf(36) xor do_buf(38)
		      xor do_buf(40) xor do_buf(42) xor do_buf(44) xor do_buf(46) xor do_buf(48)
		      xor do_buf(50) xor do_buf(52) xor do_buf(54) xor do_buf(56) xor do_buf(57) xor do_buf(59)
		      xor do_buf(61) xor do_buf(63);

                 dopr_ecc(1) := do_buf(0) xor do_buf(2) xor do_buf(3) xor do_buf(5) xor do_buf(6) xor do_buf(9)
                      xor do_buf(10) xor do_buf(12) xor do_buf(13) xor do_buf(16) xor do_buf(17)
                      xor do_buf(20) xor do_buf(21) xor do_buf(24) xor do_buf(25) xor do_buf(27) xor do_buf(28)
                      xor do_buf(31) xor do_buf(32) xor do_buf(35) xor do_buf(36) xor do_buf(39)
                      xor do_buf(40) xor do_buf(43) xor do_buf(44) xor do_buf(47) xor do_buf(48)
                      xor do_buf(51) xor do_buf(52) xor do_buf(55) xor do_buf(56) xor do_buf(58) xor do_buf(59)
                      xor do_buf(62) xor do_buf(63);

                 dopr_ecc(2) := do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17)
                      xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48)
                      xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);
	
                 dopr_ecc(3) := do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
		      xor do_buf(10) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38) xor do_buf(39)
                      xor do_buf(40) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(4) := do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18) xor do_buf(19)
                      xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25)
                      xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49)
                      xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);


                 dopr_ecc(5) := do_buf(26) xor do_buf(27) xor do_buf(28) xor do_buf(29)
                      xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36) xor do_buf(37) xor do_buf(38)
	              xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45) xor do_buf(46) xor do_buf(47)
                      xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54) xor do_buf(55) xor do_buf(56);

                 dopr_ecc(6) := do_buf(57) xor do_buf(58) xor do_buf(59)
                      xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 dopr_ecc(7) := dop_buf(0) xor dop_buf(1) xor dop_buf(2) xor dop_buf(3) xor dop_buf(4) xor dop_buf(5) xor dop_buf(6)
                      xor do_buf(0) xor do_buf(1) xor do_buf(2) xor do_buf(3) xor do_buf(4) xor do_buf(5) xor do_buf(6) xor do_buf(7) xor do_buf(8) xor do_buf(9)
                      xor do_buf(10) xor do_buf(11) xor do_buf(12) xor do_buf(13) xor do_buf(14) xor do_buf(15) xor do_buf(16) xor do_buf(17) xor do_buf(18)
                      xor do_buf(19) xor do_buf(20) xor do_buf(21) xor do_buf(22) xor do_buf(23) xor do_buf(24) xor do_buf(25) xor do_buf(26) xor do_buf(27)
                      xor do_buf(28) xor do_buf(29) xor do_buf(30) xor do_buf(31) xor do_buf(32) xor do_buf(33) xor do_buf(34) xor do_buf(35) xor do_buf(36)
                      xor do_buf(37) xor do_buf(38) xor do_buf(39) xor do_buf(40) xor do_buf(41) xor do_buf(42) xor do_buf(43) xor do_buf(44) xor do_buf(45)
                      xor do_buf(46) xor do_buf(47) xor do_buf(48) xor do_buf(49) xor do_buf(50) xor do_buf(51) xor do_buf(52) xor do_buf(53) xor do_buf(54)
                      xor do_buf(55) xor do_buf(56) xor do_buf(57) xor do_buf(58) xor do_buf(59) xor do_buf(60) xor do_buf(61) xor do_buf(62) xor do_buf(63);

                 syndrome := dopr_ecc xor dop_buf;

                 if (syndrome /= "00000000") then

                   if (syndrome(7) = '1') then  -- dectect single bit error

                     ecc_bit_position := do_buf(63 downto 57) & dop_buf(6) & do_buf(56 downto 26) & dop_buf(5) & do_buf(25 downto 11) & dop_buf(4) & do_buf(10 downto 4) & dop_buf(3) & do_buf(3 downto 1) & dop_buf(2) & do_buf(0) & dop_buf(1 downto 0) & dop_buf(7);

                     tmp_syndrome_int := SLV_TO_INT(syndrome(6 downto 0));

                     if (tmp_syndrome_int > 71) then
                       assert false
                         report "DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code."
                         severity failure;
                     end if;                     
                     
                     ecc_bit_position(tmp_syndrome_int) := not ecc_bit_position(tmp_syndrome_int); -- correct single bit error in the output 

                     di_dly_ecc_corrected := ecc_bit_position(71 downto 65) & ecc_bit_position(63 downto 33) & ecc_bit_position(31 downto 17) & ecc_bit_position(15 downto 9) & ecc_bit_position(7 downto 5) & ecc_bit_position(3); -- correct single bit error in the memory

                     do_buf := di_dly_ecc_corrected;
			
                     dip_dly_ecc_corrected := ecc_bit_position(0) & ecc_bit_position(64) & ecc_bit_position(32) & ecc_bit_position(16) & ecc_bit_position(8) & ecc_bit_position(4) & ecc_bit_position(2 downto 1); -- correct single bit error in the parity memory
                
                     dop_buf := dip_dly_ecc_corrected;
                
                     dbiterr_out := '0';
                     sbiterr_out := '1';

                   elsif (syndrome(7) = '0') then  -- double bit error
                     sbiterr_out := '0';
                     dbiterr_out := '1';
                   end if;
                   
                 else
                   dbiterr_out := '0';
                   sbiterr_out := '0';
                 end if;              
               end if;

                
              do_in := do_buf;
              dop_in := dop_buf;

              rdcount_m1_temp_var := rdcount_var;
              rdcount_m1 <= rdcount_m1_temp_var;
                
              rdcount_var := (rdcount_var + 1) mod addr_limit;

              if(rdcount_var = 0) then
                 rdcount_flag_var := NOT rdcount_flag_var;
              end if;

         end if;

       end if;  ---  end if(fwft = '1')


       ALMOSTEMPTY_zd <= almostempty_int(0);


       if (((wr_addr_sync_3_var - rdcount_var <= ae_empty) and (rdcount_flag_var = awr_flag_sync_3_var)) or (((wr_addr_sync_3_var + addr_limit)- rdcount_var <= ae_empty) and (rdcount_flag_var /= awr_flag_sync_3_var))) then
         almostempty_int(0) := '1';
       else
         almostempty_int(0) := '0';
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
          

         if((rdcount_var = wr_addr_sync_2_var) and (rdcount_flag_var = awr_flag_sync_2_var)) then
           empty_ram(0) := '1';
         else
           empty_ram(0) := '0';
         end if;

       
         if((RDEN_dly = '1') and (EMPTY_zd = '1')) then
             RDERR_zd <= '1';
         else
             RDERR_zd <= '0';
         end if; -- end ((RDEN_dly = '1') and (empty_int /= '1'))


       end if;

      end if; -- end (RST_dly = '0')

    end if; -- end (rising_edge(RDCLK_dly))

  end if; -- end (GSR_dly = 1)


     if(update_from_write_prcs_sync'event) then
       wr_addr_var := wr_addr_7s;
       wr_flag_var := wr_flag;
       if((((rdcount_var + ae_empty) <  wr_addr_var)  and (rdcount_flag_var = wr_flag_var)) or 
          (((rdcount_var + ae_empty) < (wr_addr_var + addr_limit)) and (rdcount_flag_var /= wr_flag_var))) then    
          if(rdcount_var <= rdcount_var + ae_empty or rdcount_flag_var /= wr_flag_var) then
            almostempty_zd <= '0';
          end if;
       end if;
     end if;

    
     if (not (rst_rdclk_flag or rst_wrclk_flag or after_rst_x_flag) = '1') then
       RDCOUNT_zd <= CONV_STD_LOGIC_VECTOR(rdcount_var, MAX_RDCOUNT);
       dbiterr_zd <= dbiterr_out_out_var;
       sbiterr_zd <= sbiterr_out_out_var;
     end if;

     rd_addr_7s <= rd_addr_var;
     rd_flag <= rd_flag_var;
     rdcount_flag <= rdcount_flag_var;
     DO_OUTREG_zd <= DO_OUTREG_var;
     DOP_OUTREG_zd <= DOP_OUTREG_var;

  end process prcs_read;


--####################################################################
--#####                         Write                            #####
--####################################################################
  prcs_write:process(WRCLK_dly, RST_dly, GSR_dly, update_from_read_prcs_sync, rst_rdclk_flag, rst_wrclk_flag, after_rst_x_flag)
  variable first_time        : boolean    := true;
  variable wr_addr_var       : integer := 0;
  variable rd_addr_var       : integer := 0;
  variable rdcount_var       : integer := 0;
  variable rdcount_sync_3_var : integer := -1;
  variable rdcount_sync_2_var : integer := -1;
  variable rdcount_sync_1_var : integer := -1;

  
  variable wrcount_var       : integer := 0;

  variable rd_flag_var       : std_ulogic := '0';
  variable wr_flag_var       : std_ulogic := '0';
  variable awr_flag_var       : std_ulogic := '0';

  variable rdcount_flag_var  : std_ulogic := '0';

  variable almostfull_int : std_ulogic_vector(3 downto 0) := (others => '0');
  variable full_int       : std_ulogic_vector(3 downto 0) := (others => '0');

  variable rden_var  : std_ulogic := '0';
  variable wren_var  : std_ulogic := '0';
  variable di_ecc_col : std_logic_vector(63 downto 0) := (others => '0');
  variable dip_ecc : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable dip_dly_ecc : std_logic_vector(MSB_MAX_DOP downto 0) := (others => '0');
  variable ALMOSTFULL_var : std_ulogic     :=    '0';

  begin

    if (rising_edge(WRCLK_dly)) then
      rdcount_sync_3_var := rdcount_sync_2_var;
      rdcount_sync_2_var := rdcount_sync_1_var;
      rdcount_sync_1_var := rdcount_m1;
    end if;


    if ((RST_dly = '1') or (rst_rdclk_flag = '1') or (rst_wrclk_flag = '1') or (after_rst_x_flag = '1'))then
        wr_addr_var := 0;
        wr_addr_7s <=  0;
        wr_flag <= '0';
        awr_flag <= '0';
        
        rd_addr_var := 0;
        rdcount_var := 0;
        wrcount_var := 0;
        ALMOSTFULL_var := '0';
   
        rd_flag_var := '0';
        wr_flag_var := '0';
        awr_flag_var := '0';

        rdcount_flag_var  := '0';

        full_int       :=  (others => '0');
        almostfull_int :=  (others => '0');

        rdcount_sync_3_var := -1;
          
        if (RST_dly = '1')then
          ALMOSTFULL_zd <= '0';      
          FULL_zd <= '0';            
          WRERR_zd <= '0';           
          WRCOUNT_zd <= (others => '0');
        else
          ALMOSTFULL_zd <= 'X';       
          FULL_zd <= 'X';             
          WRERR_zd <= 'X';            
          WRCOUNT_zd <= (others => 'X');
          eccparity_zd <= (others => 'X');
        end if;

    end if;
    
    if((GSR_dly = '0') and (RST_dly = '1'))then  -- match HW eccparity output when RST = 1

      if(rising_edge(WRCLK_dly)) then
        if(wren_dly = '1') then
          if (full_zd= '0') then

            -- ECC encode
            if (EN_ECC_WRITE = TRUE) then

              -- regenerate parity
              dip_ecc(0) := di_dly(0) xor di_dly(1) xor di_dly(3) xor di_dly(4) xor di_dly(6) xor di_dly(8)
		      xor di_dly(10) xor di_dly(11) xor di_dly(13) xor di_dly(15) xor di_dly(17) xor di_dly(19)
		      xor di_dly(21) xor di_dly(23) xor di_dly(25) xor di_dly(26) xor di_dly(28)
            	      xor di_dly(30) xor di_dly(32) xor di_dly(34) xor di_dly(36) xor di_dly(38)
		      xor di_dly(40) xor di_dly(42) xor di_dly(44) xor di_dly(46) xor di_dly(48)
		      xor di_dly(50) xor di_dly(52) xor di_dly(54) xor di_dly(56) xor di_dly(57) xor di_dly(59)
		      xor di_dly(61) xor di_dly(63);

              dip_ecc(1) := di_dly(0) xor di_dly(2) xor di_dly(3) xor di_dly(5) xor di_dly(6) xor di_dly(9)
                      xor di_dly(10) xor di_dly(12) xor di_dly(13) xor di_dly(16) xor di_dly(17)
                      xor di_dly(20) xor di_dly(21) xor di_dly(24) xor di_dly(25) xor di_dly(27) xor di_dly(28)
                      xor di_dly(31) xor di_dly(32) xor di_dly(35) xor di_dly(36) xor di_dly(39)
                      xor di_dly(40) xor di_dly(43) xor di_dly(44) xor di_dly(47) xor di_dly(48)
                      xor di_dly(51) xor di_dly(52) xor di_dly(55) xor di_dly(56) xor di_dly(58) xor di_dly(59)
                      xor di_dly(62) xor di_dly(63);

              dip_ecc(2) := di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17)
                      xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48)
                      xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);
	
              dip_ecc(3) := di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
		      xor di_dly(10) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(4) := di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);


              dip_ecc(5) := di_dly(26) xor di_dly(27) xor di_dly(28) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38)
	              xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47)
                      xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(6) := di_dly(57) xor di_dly(58) xor di_dly(59)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              dip_ecc(7) := dip_ecc(0) xor dip_ecc(1) xor dip_ecc(2) xor dip_ecc(3) xor dip_ecc(4) xor dip_ecc(5) xor dip_ecc(6)
                      xor di_dly(0) xor di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18)
                      xor di_dly(19) xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(26) xor di_dly(27)
                      xor di_dly(28) xor di_dly(29) xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36)
                      xor di_dly(37) xor di_dly(38) xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45)
                      xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54)
                      xor di_dly(55) xor di_dly(56) xor di_dly(57) xor di_dly(58) xor di_dly(59) xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              ECCPARITY_zd <= dip_ecc;

            end if;
          end if;
        end if;
      end if;
        
    elsif((GSR_dly = '0') and (RST_dly = '0') and (rst_rdclk_flag = '0') and (rst_wrclk_flag = '0') and (after_rst_x_flag = '0'))then
      rden_var := RDEN_dly;
      wren_var := WREN_dly;

      if(rising_edge(WRCLK_dly)) then

        rd_flag_var := rd_flag;
        wr_flag_var := wr_flag;
        awr_flag_var := awr_flag;        

        rd_addr_var := rd_addr_7s;
        wr_addr_var := wr_addr_7s;

        rdcount_var := SLV_TO_INT(RDCOUNT_zd);
        rdcount_flag_var := rdcount_flag;


        if (not(EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE)) then
      
          if (injectsbiterr_dly = '1') then
            assert false
              report "DRC Warning : INJECTSBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on X_FIFO36E1 instance."
              severity Warning;
          end if;

          if (injectdbiterr_dly = '1') then
            assert false
            report "DRC Warning : INJECTDBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on X_FIFO36E1 instance."
            severity Warning;
          end if;

        end if;

        
	if (sync = '1') then
          if(wren_dly = '1') then
            if (full_zd= '0') then

            -- ECC encode
            if (EN_ECC_WRITE = TRUE) then

              -- regenerate parity
              dip_ecc(0) := di_dly(0) xor di_dly(1) xor di_dly(3) xor di_dly(4) xor di_dly(6) xor di_dly(8)
		      xor di_dly(10) xor di_dly(11) xor di_dly(13) xor di_dly(15) xor di_dly(17) xor di_dly(19)
		      xor di_dly(21) xor di_dly(23) xor di_dly(25) xor di_dly(26) xor di_dly(28)
            	      xor di_dly(30) xor di_dly(32) xor di_dly(34) xor di_dly(36) xor di_dly(38)
		      xor di_dly(40) xor di_dly(42) xor di_dly(44) xor di_dly(46) xor di_dly(48)
		      xor di_dly(50) xor di_dly(52) xor di_dly(54) xor di_dly(56) xor di_dly(57) xor di_dly(59)
		      xor di_dly(61) xor di_dly(63);

              dip_ecc(1) := di_dly(0) xor di_dly(2) xor di_dly(3) xor di_dly(5) xor di_dly(6) xor di_dly(9)
                      xor di_dly(10) xor di_dly(12) xor di_dly(13) xor di_dly(16) xor di_dly(17)
                      xor di_dly(20) xor di_dly(21) xor di_dly(24) xor di_dly(25) xor di_dly(27) xor di_dly(28)
                      xor di_dly(31) xor di_dly(32) xor di_dly(35) xor di_dly(36) xor di_dly(39)
                      xor di_dly(40) xor di_dly(43) xor di_dly(44) xor di_dly(47) xor di_dly(48)
                      xor di_dly(51) xor di_dly(52) xor di_dly(55) xor di_dly(56) xor di_dly(58) xor di_dly(59)
                      xor di_dly(62) xor di_dly(63);

              dip_ecc(2) := di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17)
                      xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48)
                      xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);
	
              dip_ecc(3) := di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
		      xor di_dly(10) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(4) := di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);


              dip_ecc(5) := di_dly(26) xor di_dly(27) xor di_dly(28) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38)
	              xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47)
                      xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(6) := di_dly(57) xor di_dly(58) xor di_dly(59)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              dip_ecc(7) := dip_ecc(0) xor dip_ecc(1) xor dip_ecc(2) xor dip_ecc(3) xor dip_ecc(4) xor dip_ecc(5) xor dip_ecc(6)
                      xor di_dly(0) xor di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18)
                      xor di_dly(19) xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(26) xor di_dly(27)
                      xor di_dly(28) xor di_dly(29) xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36)
                      xor di_dly(37) xor di_dly(38) xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45)
                      xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54)
                      xor di_dly(55) xor di_dly(56) xor di_dly(57) xor di_dly(58) xor di_dly(59) xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              ECCPARITY_zd <= dip_ecc;

              dip_dly_ecc := dip_ecc;  -- only 64 bits width

            else

              dip_dly_ecc := dip_dly; -- only 64 bits width

            end if;


            -- injecting error
            di_ecc_col := di_dly;

            if (EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE) then
               
              if (injectdbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
                di_ecc_col(62) := not(di_ecc_col(62));
              elsif (injectsbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
              end if;

            end if;

            
            mem(wr_addr_var) <= di_ecc_col(mem_width-1 downto 0);
            memp(wr_addr_var) <= dip_dly_ecc(memp_width-1 downto 0);

            wr_addr_var := (wr_addr_var + 1) mod addr_limit;

            if(wr_addr_var = 0) then
              wr_flag_var := NOT wr_flag_var;
            end if;

          end if;
        end if;


        if ((WREN_dly = '1') and (FULL_zd = '1')) then
          WRERR_zd <= '1';
        else
          WRERR_zd <= '0';
        end if;

        
        if (rden_dly = '1') then
          full_zd <= '0';
        elsif (rdcount_var = wr_addr_var and rdcount_flag_var /= wr_flag_var) then
          full_zd <= '1';
        end if;

        update_from_write_prcs_sync <= NOT update_from_write_prcs_sync;

        if((((rdcount_var + addr_limit) <= (wr_addr_var + ae_full)) and (rdcount_flag_var = wr_flag_var)) or ((rdcount_var <= (wr_addr_var + ae_full)) and (rdcount_flag_var /= wr_flag_var))) then
          almostfull_zd <= '1';
        end if;
        
        
      elsif (sync = '0') then

        if((wren_var = '1') and (full_zd = '0'))then  

          -- ECC encode
            if (EN_ECC_WRITE = TRUE) then

              -- regenerate parity
              dip_ecc(0) := di_dly(0) xor di_dly(1) xor di_dly(3) xor di_dly(4) xor di_dly(6) xor di_dly(8)
		      xor di_dly(10) xor di_dly(11) xor di_dly(13) xor di_dly(15) xor di_dly(17) xor di_dly(19)
		      xor di_dly(21) xor di_dly(23) xor di_dly(25) xor di_dly(26) xor di_dly(28)
            	      xor di_dly(30) xor di_dly(32) xor di_dly(34) xor di_dly(36) xor di_dly(38)
		      xor di_dly(40) xor di_dly(42) xor di_dly(44) xor di_dly(46) xor di_dly(48)
		      xor di_dly(50) xor di_dly(52) xor di_dly(54) xor di_dly(56) xor di_dly(57) xor di_dly(59)
		      xor di_dly(61) xor di_dly(63);

              dip_ecc(1) := di_dly(0) xor di_dly(2) xor di_dly(3) xor di_dly(5) xor di_dly(6) xor di_dly(9)
                      xor di_dly(10) xor di_dly(12) xor di_dly(13) xor di_dly(16) xor di_dly(17)
                      xor di_dly(20) xor di_dly(21) xor di_dly(24) xor di_dly(25) xor di_dly(27) xor di_dly(28)
                      xor di_dly(31) xor di_dly(32) xor di_dly(35) xor di_dly(36) xor di_dly(39)
                      xor di_dly(40) xor di_dly(43) xor di_dly(44) xor di_dly(47) xor di_dly(48)
                      xor di_dly(51) xor di_dly(52) xor di_dly(55) xor di_dly(56) xor di_dly(58) xor di_dly(59)
                      xor di_dly(62) xor di_dly(63);

              dip_ecc(2) := di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17)
                      xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48)
                      xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);
	
              dip_ecc(3) := di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
		      xor di_dly(10) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38) xor di_dly(39)
                      xor di_dly(40) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(4) := di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18) xor di_dly(19)
                      xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25)
                      xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49)
                      xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);


              dip_ecc(5) := di_dly(26) xor di_dly(27) xor di_dly(28) xor di_dly(29)
                      xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36) xor di_dly(37) xor di_dly(38)
	              xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45) xor di_dly(46) xor di_dly(47)
                      xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54) xor di_dly(55) xor di_dly(56);

              dip_ecc(6) := di_dly(57) xor di_dly(58) xor di_dly(59)
                      xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              dip_ecc(7) := dip_ecc(0) xor dip_ecc(1) xor dip_ecc(2) xor dip_ecc(3) xor dip_ecc(4) xor dip_ecc(5) xor dip_ecc(6)
                      xor di_dly(0) xor di_dly(1) xor di_dly(2) xor di_dly(3) xor di_dly(4) xor di_dly(5) xor di_dly(6) xor di_dly(7) xor di_dly(8) xor di_dly(9)
                      xor di_dly(10) xor di_dly(11) xor di_dly(12) xor di_dly(13) xor di_dly(14) xor di_dly(15) xor di_dly(16) xor di_dly(17) xor di_dly(18)
                      xor di_dly(19) xor di_dly(20) xor di_dly(21) xor di_dly(22) xor di_dly(23) xor di_dly(24) xor di_dly(25) xor di_dly(26) xor di_dly(27)
                      xor di_dly(28) xor di_dly(29) xor di_dly(30) xor di_dly(31) xor di_dly(32) xor di_dly(33) xor di_dly(34) xor di_dly(35) xor di_dly(36)
                      xor di_dly(37) xor di_dly(38) xor di_dly(39) xor di_dly(40) xor di_dly(41) xor di_dly(42) xor di_dly(43) xor di_dly(44) xor di_dly(45)
                      xor di_dly(46) xor di_dly(47) xor di_dly(48) xor di_dly(49) xor di_dly(50) xor di_dly(51) xor di_dly(52) xor di_dly(53) xor di_dly(54)
                      xor di_dly(55) xor di_dly(56) xor di_dly(57) xor di_dly(58) xor di_dly(59) xor di_dly(60) xor di_dly(61) xor di_dly(62) xor di_dly(63);

              ECCPARITY_zd <= dip_ecc;

              dip_dly_ecc := dip_ecc;  -- only 64 bits width

            else

              dip_dly_ecc := dip_dly; -- only 64 bits width

            end if;

            
            -- injecting error
            di_ecc_col := di_dly;

            if (EN_ECC_WRITE = TRUE or EN_ECC_READ = TRUE) then
              
              if (injectdbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
                di_ecc_col(62) := not(di_ecc_col(62));
              elsif (injectsbiterr_dly = '1') then
                di_ecc_col(30) := not(di_ecc_col(30));
              end if;

            end if;
            
            
            mem(wr_addr_var) <= di_ecc_col(mem_width-1 downto 0);
            if (DATA_WIDTH >= 9) then
              memp(wr_addr_var) <= dip_dly_ecc(memp_width-1 downto 0);              
            end if;
                
            wr_addr_var := (wr_addr_var + 1) mod addr_limit;
         
            if(wr_addr_var = 0) then
              awr_flag_var := NOT awr_flag_var;
            end if;

            if(wr_addr_var = addr_limit - 1) then
              wr_flag_var := NOT wr_flag_var;
            end if;
            
        end if; -- if((wren_var = '1') and (FULL_zd = '0') ....      

        if((wren_var = '1') and (full_zd = '1')) then 
            WRERR_zd <= '1';
        else
            WRERR_zd <= '0';
        end if;


        ALMOSTFULL_var := almostfull_int(0);

        
        if(((((rdcount_sync_3_var + addr_limit) - wr_addr_var) <= ae_full) and (rdcount_flag_var = awr_flag_var)) or (((rdcount_sync_3_var - wr_addr_var) <= ae_full) and (rdcount_flag_var /= awr_flag_var))) then    
          almostfull_int(0) := '1';
        else
          almostfull_int(0) := '0';
        end if;
        

        FULL_zd <= full_v3;
        

        ALMOSTFULL_zd <= ALMOSTFULL_var;

      end if; -- if (sync)
  
        WRCOUNT_zd <= CONV_STD_LOGIC_VECTOR( wr_addr_var, MAX_WRCOUNT);

        wr_addr_7s <= wr_addr_var;
        wr_flag <= wr_flag_var;
        awr_flag <= awr_flag_var;

    end if; -- if(rising(WRCLK_dly))

   end if; -- if(GSR_dly = '1'))


   if (rising_edge(WRCLK_dly)) then

     if (rdcount_sync_2_var = wr_addr_var) then
       rm1w_eq <= '1';
     else
       rm1w_eq <= '0';
     end if;


     if (wr_addr_var + 1 = addr_limit) then -- wr_addr(FF) + 1 != 0

       if (rdcount_sync_2_var = 0) then
         rm1wp1_eq <= '1';
       else
         rm1wp1_eq <= '0';
       end if;

     else

       if (rdcount_sync_2_var = wr_addr_var + 1) then
         rm1wp1_eq <= '1';
       else
         rm1wp1_eq <= '0';
       end if;

     end if;
     
   end if;
    

    if(update_from_read_prcs_sync'event) then
      rdcount_var := SLV_TO_INT(RDCOUNT_zd);
      rdcount_flag_var := rdcount_flag;
      if((((rdcount_var + addr_limit) > (wr_addr_var + ae_full)) and (rdcount_flag_var = wr_flag_var)) or ((rdcount_var > (wr_addr_var + ae_full)) and (rdcount_flag_var /= wr_flag_var))) then
        if (wr_addr_var <= wr_addr_var + ae_full or rdcount_flag_var = wr_flag_var) then
          ALMOSTFULL_zd <= '0';
        end if;
      end if;
    end if;


  end process prcs_write;

end generate S7_read_write;


  fwft_prefetch_7s : process (set_fwft_prefetch_flag_to_0, WRCLK_dly)
  begin                     

    if (RST_dly = '0' and sync = '0') then
      if (EMPTY_zd = '1' and WREN_dly = '1' and fwft_prefetch_flag = 0) then
        fwft_prefetch_flag <= 1;
      end if;
    end if;

    
    if (set_fwft_prefetch_flag_to_0'event) then
          fwft_prefetch_flag <= 0;
    end if;

  end process fwft_prefetch_7s;
                
                
  full_7s : process (rm1w_eq, rm1wp1_eq, WREN_dly, FULL_zd)
  begin 

    if (rm1w_eq = '1' or (rm1wp1_eq = '1' and (WREN_dly = '1' and FULL_zd = '0'))) then 
     full_v3 <= '1';
    else
     full_v3 <= '0';
    end if;

  end process full_7s;

      
  outmux: process (DO_zd, DOP_zd, DO_OUTREG_zd, DOP_OUTREG_zd)
  begin  -- process outmux_clka

    if (sync = '1') then
      
      case DO_REG is
        when 0 =>
                  DO_OUT_MUX_zd <= DO_zd;
                  DOP_OUT_MUX_zd <= DOP_zd;
        when 1 =>
                  DO_OUT_MUX_zd <= DO_OUTREG_zd;
                  DOP_OUT_MUX_zd <= DOP_OUTREG_zd;
        when others => assert false
                       report "Attribute Syntax Error: The allowed integer values for DO_REG are 0 or 1."
                       severity Failure;
      end case;

    else
      DO_OUT_MUX_zd <= DO_zd;
      DOP_OUT_MUX_zd <= DOP_zd;
    end if;
    
  end process outmux;
  

  -- matching HW behavior to pull up and X the unused output bits
  prcs_x_1_output: process (DO_OUT_MUX_zd, DOP_OUT_MUX_zd)
  begin  -- process prcs_x_1_output

    if (FIFO_SIZE = 18) then
      
      case DATA_WIDTH is
        when 4  => 
                  DO_OUT_zd(3 downto 0) <= DO_OUT_MUX_zd(3 downto 0);
        when 9  =>
                  DO_OUT_zd(7 downto 0) <= DO_OUT_MUX_zd(7 downto 0);
                  DOP_OUT_zd(0 downto 0) <= DOP_OUT_MUX_zd(0 downto 0);
        when 18 =>
                  DO_OUT_zd(15 downto 0) <= DO_OUT_MUX_zd(15 downto 0);
                  DOP_OUT_zd(1 downto 0) <= DOP_OUT_MUX_zd(1 downto 0);
        when 36 => 
                  DO_OUT_zd(31 downto 0) <= DO_OUT_MUX_zd(31 downto 0);
                  DOP_OUT_zd(3 downto 0) <= DOP_OUT_MUX_zd(3 downto 0);
        when others =>
                  DO_OUT_zd <= DO_OUT_MUX_zd;
      end case;   

    else

      case DATA_WIDTH is
        when 4  => 
                  DO_OUT_zd(3 downto 0) <= DO_OUT_MUX_zd(3 downto 0);
        when 9  =>
                  DO_OUT_zd(7 downto 0) <= DO_OUT_MUX_zd(7 downto 0);
                  DOP_OUT_zd(0 downto 0) <= DOP_OUT_MUX_zd(0 downto 0);
        when 18 =>
                  DO_OUT_zd(15 downto 0) <= DO_OUT_MUX_zd(15 downto 0);
                  DOP_OUT_zd(1 downto 0) <= DOP_OUT_MUX_zd(1 downto 0);
        when 36 => 
                  DO_OUT_zd(31 downto 0) <= DO_OUT_MUX_zd(31 downto 0);
                  DOP_OUT_zd(3 downto 0) <= DOP_OUT_MUX_zd(3 downto 0);
        when 72 => 
                  DO_OUT_zd(63 downto 0) <= DO_OUT_MUX_zd(63 downto 0);
                  DOP_OUT_zd(7 downto 0) <= DOP_OUT_MUX_zd(7 downto 0);          
        when others =>
                  DO_OUT_zd <= DO_OUT_MUX_zd;
      end case;
         
    end if;
    
  end process prcs_x_1_output;


  -- matching HW behavior to pull up and X the unused output bits
  prcs_x_1_output_wrcount: process (WRCOUNT_zd, RST_dly, GSR_dly, rst_rdclk_flag, rst_wrclk_flag, after_rst_x_flag)
  begin

    if((GSR_dly = '1') or (RST_dly = '1')) then
      WRCOUNT_OUT_zd <= (others => '0');
    elsif ((rst_rdclk_flag = '1') or (rst_wrclk_flag = '1') or (after_rst_x_flag = '1'))then
      WRCOUNT_OUT_zd <= (others => 'X');
    elsif (WRCOUNT_zd'event) then
      
      if (FIFO_SIZE = 18) then
      
        case DATA_WIDTH is
          when 4  => 
                  WRCOUNT_OUT_zd(12 downto 0) <= '1' & WRCOUNT_zd(11 downto 0);
          when 9  =>
                  WRCOUNT_OUT_zd(12 downto 0) <= "11" & WRCOUNT_zd(10 downto 0);
          when 18 =>
                  WRCOUNT_OUT_zd(12 downto 0) <= "111" & WRCOUNT_zd(9 downto 0);
          when 36 => 
                  WRCOUNT_OUT_zd(12 downto 0) <= "1111" & WRCOUNT_zd(8 downto 0);
          when others =>
                  WRCOUNT_OUT_zd <= WRCOUNT_zd;
        end case;   

      else

        case DATA_WIDTH is
          when 4  => 
                  WRCOUNT_OUT_zd(12 downto 0) <= WRCOUNT_zd(12 downto 0);
          when 9  =>
                  WRCOUNT_OUT_zd(12 downto 0) <= '1' & WRCOUNT_zd(11 downto 0);
          when 18 =>
                  WRCOUNT_OUT_zd(12 downto 0) <= "11" & WRCOUNT_zd(10 downto 0);
          when 36 => 
                  WRCOUNT_OUT_zd(12 downto 0) <= "111" & WRCOUNT_zd(9 downto 0);
          when 72 => 
                  WRCOUNT_OUT_zd(12 downto 0) <= "1111" & WRCOUNT_zd(8 downto 0);
          when others =>
                  WRCOUNT_OUT_zd <= WRCOUNT_zd;
        end case;
         
      end if;

    end if;
    
  end process prcs_x_1_output_wrcount;


  -- matching HW behavior to pull up and X the unused output bits
  prcs_x_1_output_rdcount: process (RDCOUNT_zd, RST_dly, GSR_dly, rst_rdclk_flag, rst_wrclk_flag)
  begin

    if((GSR_dly = '1') or (RST_dly = '1')) then
      RDCOUNT_OUT_zd <= (others => '0');
    elsif ((rst_rdclk_flag = '1') or (rst_wrclk_flag = '1') or (after_rst_x_flag = '1'))then
      RDCOUNT_OUT_zd <= (others => 'X');
    elsif (RDCOUNT_zd'event) then
      
      if (FIFO_SIZE = 18) then
      
        case DATA_WIDTH is
          when 4  => 
                  RDCOUNT_OUT_zd(12 downto 0) <= '1' & RDCOUNT_zd(11 downto 0);
          when 9  =>
                  RDCOUNT_OUT_zd(12 downto 0) <= "11" & RDCOUNT_zd(10 downto 0);
          when 18 =>
                  RDCOUNT_OUT_zd(12 downto 0) <= "111" & RDCOUNT_zd(9 downto 0);
          when 36 => 
                  RDCOUNT_OUT_zd(12 downto 0) <= "1111" & RDCOUNT_zd(8 downto 0);
          when others =>
                  RDCOUNT_OUT_zd <= RDCOUNT_zd;
        end case;   

      else

        case DATA_WIDTH is
          when 4  => 
                  RDCOUNT_OUT_zd(12 downto 0) <= RDCOUNT_zd(12 downto 0);
          when 9  =>
                  RDCOUNT_OUT_zd(12 downto 0) <= '1' & RDCOUNT_zd(11 downto 0);
          when 18 =>
                  RDCOUNT_OUT_zd(12 downto 0) <= "11" & RDCOUNT_zd(10 downto 0);
          when 36 => 
                  RDCOUNT_OUT_zd(12 downto 0) <= "111" & RDCOUNT_zd(9 downto 0);
          when 72 => 
                  RDCOUNT_OUT_zd(12 downto 0) <= "1111" & RDCOUNT_zd(8 downto 0);
          when others =>
                  RDCOUNT_OUT_zd <= RDCOUNT_zd;
        end case;
         
      end if;

    end if;
    
  end process prcs_x_1_output_rdcount;

  
--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
  prcs_output:process(ALMOSTEMPTY_zd, ALMOSTFULL_zd, DO_OUT_zd, DOP_OUT_zd, 
                      EMPTY_zd, FULL_zd, RDCOUNT_OUT_zd, RDERR_zd, 
                      WRCOUNT_OUT_zd, WRERR_zd, sbiterr_zd, dbiterr_zd, ECCPARITY_zd)
  begin
      ALMOSTEMPTY <= ALMOSTEMPTY_zd;
      ALMOSTFULL  <= ALMOSTFULL_zd;
      DBITERR     <= dbiterr_zd;
      DO          <= DO_OUT_zd;
      DOP         <= DOP_OUT_zd;
      ECCPARITY   <= ECCPARITY_zd;
      EMPTY       <= EMPTY_zd;
      FULL        <= FULL_zd;
      RDCOUNT     <= RDCOUNT_OUT_zd;
      RDERR       <= RDERR_zd;
      SBITERR     <= sbiterr_zd;
      WRCOUNT     <= WRCOUNT_OUT_zd;
      WRERR       <= WRERR_zd;
  end process prcs_output;
--####################################################################


end X_FF36_INTERNAL_VHDL_V;


-- end of X_FF36_INTERNAL_VHDL - Note: Not an user primitive


-------------------------------------------------------------------------------
-- X_FIFO36E1
-------------------------------------------------------------------------------

----- CELL X_FIFO36E1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;


entity X_FIFO36E1 is
generic (

    TimingChecksOn : boolean := true;
    InstancePath   : string  := "*";
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    
    ALMOST_FULL_OFFSET      : bit_vector := X"0080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"0080"; 
    DATA_WIDTH              : integer    := 4;
    DO_REG                  : integer    := 1;
    EN_ECC_READ             : boolean    := FALSE;
    EN_ECC_WRITE            : boolean    := FALSE;
    EN_SYN                  : boolean    := FALSE;
    FIFO_MODE               : string     := "FIFO36";
    FIRST_WORD_FALL_THROUGH : boolean    := FALSE;
    INIT                    : bit_vector := X"000000000000000000";
    LOC                     : string     := "UNPLACED";
    SIM_DEVICE              : string     := "VIRTEX6";
    SRVAL                   : bit_vector := X"000000000000000000";

----- VITAL input wire delays

    tipd_DI : VitalDelayArrayType01 (63 downto 0) := (others => (0 ps, 0 ps));
    tipd_DIP : VitalDelayArrayType01 (7 downto 0) := (others => (0 ps, 0 ps));
    tipd_INJECTDBITERR : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_INJECTSBITERR : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_RDCLK : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_RDEN : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_REGCE : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_RST : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_RSTREG : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_WRCLK : VitalDelayType01 :=  (0 ps, 0 ps);
    tipd_WREN : VitalDelayType01 :=  (0 ps, 0 ps);

----- VITAL pin-to-pin propagation delays   

    tpd_RDCLK_ALMOSTEMPTY : VitalDelayType01 := (100 ps, 100 ps);
    tpd_RDCLK_DBITERR : VitalDelayType01 := (100 ps, 100 ps);
    tpd_RDCLK_DO : VitalDelayArrayType01(63 downto 0) := (others => (100 ps, 100 ps));
    tpd_RDCLK_DOP : VitalDelayArrayType01(7 downto 0) := (others => (100 ps, 100 ps));
    tpd_RDCLK_EMPTY : VitalDelayType01 := (100 ps, 100 ps);
    tpd_RDCLK_RDCOUNT : VitalDelayArrayType01(12 downto 0) := (others => (100 ps, 100 ps));
    tpd_RDCLK_RDERR : VitalDelayType01 := (100 ps, 100 ps);
    tpd_RDCLK_SBITERR : VitalDelayType01 := (100 ps, 100 ps);
    tpd_RST_ALMOSTEMPTY : VitalDelayType01 := (0 ps, 0 ps);
    tpd_RST_ALMOSTFULL : VitalDelayType01 := (0 ps, 0 ps);
    tpd_RST_EMPTY : VitalDelayType01 := (0 ps, 0 ps);
    tpd_RST_FULL : VitalDelayType01 := (0 ps, 0 ps);
    tpd_RST_RDCOUNT : VitalDelayArrayType01(12 downto 0) := (others => (0 ps, 0 ps));
    tpd_RST_RDERR : VitalDelayType01 := (0 ps, 0 ps);
    tpd_RST_WRCOUNT : VitalDelayArrayType01(12 downto 0) := (others => (0 ps, 0 ps));
    tpd_RST_WRERR : VitalDelayType01 := (0 ps, 0 ps);
    tpd_WRCLK_ALMOSTFULL : VitalDelayType01 := (100 ps, 100 ps);
    tpd_WRCLK_ECCPARITY : VitalDelayArrayType01(7 downto 0) := (others => (100 ps, 100 ps));
    tpd_WRCLK_FULL : VitalDelayType01 := (100 ps, 100 ps);
    tpd_WRCLK_WRCOUNT : VitalDelayArrayType01(12 downto 0) := (others => (100 ps, 100 ps));
    tpd_WRCLK_WRERR : VitalDelayType01 := (100 ps, 100 ps);

----- VITAL recovery time
    trecovery_RST_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    trecovery_RST_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    
----- VITAL removal time
    tremoval_RST_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tremoval_RST_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
   
----- VITAL hold time
    thold_DIP_WRCLK_negedge_posedge : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    thold_DIP_WRCLK_posedge_posedge : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    thold_DI_WRCLK_negedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0 ps);
    thold_DI_WRCLK_posedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0 ps);
    thold_INJECTDBITERR_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_INJECTDBITERR_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_INJECTSBITERR_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_INJECTSBITERR_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_RDEN_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_RDEN_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_REGCE_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_REGCE_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_RST_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_RST_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_RST_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_RST_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_RSTREG_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_RSTREG_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    thold_WREN_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    thold_WREN_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
      
----- VITAL setup time    
    tsetup_DIP_WRCLK_negedge_posedge : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tsetup_DIP_WRCLK_posedge_posedge : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tsetup_DI_WRCLK_negedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0 ps);
    tsetup_DI_WRCLK_posedge_posedge : VitalDelayArrayType(63 downto 0) := (others => 0 ps);
    tsetup_INJECTDBITERR_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_INJECTDBITERR_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_INJECTSBITERR_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_INJECTSBITERR_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RDEN_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_RDEN_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_REGCE_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_REGCE_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RST_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_RST_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RST_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_RST_WRCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_RSTREG_RDCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_RSTREG_RDCLK_posedge_posedge : VitalDelayType := 0 ps;
    tsetup_WREN_WRCLK_negedge_posedge : VitalDelayType := 0 ps;
    tsetup_WREN_WRCLK_posedge_posedge : VitalDelayType := 0 ps;

    tisd_DIP_WRCLK : VitalDelayArrayType(7 downto 0) := (others => 0 ps);
    tisd_DI_WRCLK : VitalDelayArrayType(63 downto 0) := (others => 0 ps);
    tisd_INJECTDBITERR_WRCLK : VitalDelayType := 0 ps;
    tisd_INJECTSBITERR_WRCLK : VitalDelayType := 0 ps;
    tisd_RDEN_RDCLK : VitalDelayType := 0 ps;
    tisd_REGCE_RDCLK : VitalDelayType := 0 ps;
    tisd_RSTREG_RDCLK : VitalDelayType := 0 ps;
    tisd_RST_RDCLK : VitalDelayType := 0 ps;
    tisd_RST_WRCLK : VitalDelayType := 0 ps;
    tisd_WREN_WRCLK : VitalDelayType := 0 ps;
    ticd_RDCLK : VitalDelayType := 0 ps;
    ticd_WRCLK : VitalDelayType := 0 ps;

----- VITAL pulse width 
    tpw_RDCLK_negedge : VitalDelayType := 0 ps;
    tpw_RDCLK_posedge : VitalDelayType := 0 ps;
    
    tpw_RST_negedge : VitalDelayType := 0 ps;
    tpw_RST_posedge : VitalDelayType := 0 ps;

    tpw_WRCLK_negedge : VitalDelayType := 0 ps;
    tpw_WRCLK_posedge : VitalDelayType := 0 ps;

----- VITAL period
    tperiod_RDCLK_posedge : VitalDelayType := 0 ps;
    tperiod_WRCLK_posedge : VitalDelayType := 0 ps
    
  );

port (

    ALMOSTEMPTY    : out std_ulogic;
    ALMOSTFULL     : out std_ulogic;
    DBITERR        : out std_ulogic;
    DO             : out std_logic_vector (63 downto 0);
    DOP            : out std_logic_vector (7 downto 0);
    ECCPARITY      : out std_logic_vector (7 downto 0);
    EMPTY          : out std_ulogic;
    FULL           : out std_ulogic;
    RDCOUNT        : out std_logic_vector (12 downto 0);
    RDERR          : out std_ulogic;
    SBITERR        : out std_ulogic;
    WRCOUNT        : out std_logic_vector (12 downto 0);
    WRERR          : out std_ulogic;

    DI             : in  std_logic_vector (63 downto 0);
    DIP            : in  std_logic_vector (7 downto 0);
    INJECTDBITERR  : in  std_ulogic;
    INJECTSBITERR  : in  std_ulogic;
    RDCLK          : in  std_ulogic;
    RDEN           : in  std_ulogic;
    REGCE          : in  std_ulogic;
    RST            : in  std_ulogic;
    RSTREG         : in  std_ulogic;
    WRCLK          : in  std_ulogic;
    WREN           : in  std_ulogic    
  );

end X_FIFO36E1;
                                                                        
architecture X_FIFO36E1_V of X_FIFO36E1 is

  component X_FF36_INTERNAL_VHDL

    generic(

    ALMOST_FULL_OFFSET      : bit_vector := X"0080";
    ALMOST_EMPTY_OFFSET     : bit_vector := X"0080"; 
    DATA_WIDTH              : integer    := 4;
    DO_REG                  : integer    := 1;
    EN_ECC_READ             : boolean    := FALSE;
    EN_ECC_WRITE            : boolean    := FALSE;    
    EN_SYN                  : boolean    := FALSE;
    FIFO_MODE               : string     := "FIFO36";
    FIFO_SIZE               : integer    := 36;
    FIRST_WORD_FALL_THROUGH : boolean    := FALSE;
    INIT                    : bit_vector := X"000000000000000000";
    SIM_DEVICE              : string     := "VIRTEX6"; 
    SRVAL                   : bit_vector := X"000000000000000000"
    );

  port(
    ALMOSTEMPTY          : out std_ulogic;
    ALMOSTFULL           : out std_ulogic;
    DBITERR              : out std_ulogic;
    DO                   : out std_logic_vector (63 downto 0);
    DOP                  : out std_logic_vector (7 downto 0);
    ECCPARITY            : out std_logic_vector (7 downto 0);
    EMPTY                : out std_ulogic;
    FULL                 : out std_ulogic;
    RDCOUNT              : out std_logic_vector (12 downto 0);
    RDERR                : out std_ulogic;
    SBITERR              : out std_ulogic;
    WRCOUNT              : out std_logic_vector (12 downto 0);
    WRERR                : out std_ulogic;

    DI                   : in  std_logic_vector (63 downto 0);
    DIP                  : in  std_logic_vector (7 downto 0);
    INJECTDBITERR        : in  std_ulogic;
    INJECTSBITERR        : in  std_ulogic;
    RDCLK                : in  std_ulogic;
    RDEN                 : in  std_ulogic;
    REGCE                : in  std_ulogic;
    RST                  : in  std_ulogic;
    RSTREG               : in  std_ulogic;
    WRCLK                : in  std_ulogic;
    WREN                 : in  std_ulogic
    );

  end component;

    
  signal do_zd : std_logic_vector(63 downto 0) :=  (others => '0');
  signal dop_zd : std_logic_vector(7 downto 0) :=  (others => '0');
  signal almostfull_zd : std_ulogic := '0';
  signal almostempty_zd : std_ulogic := '0';
  signal empty_zd : std_ulogic := '0';
  signal full_zd : std_ulogic := '0';
  signal rderr_zd : std_ulogic := '0';
  signal wrerr_zd : std_ulogic := '0';
  signal rdcount_zd : std_logic_vector(12 downto 0) :=  (others => '0');
  signal wrcount_zd : std_logic_vector(12 downto 0) :=  (others => '0');
  signal sbiterr_zd : std_ulogic := '0';
  signal dbiterr_zd : std_ulogic := '0';
  signal eccparity_zd : std_logic_vector(7 downto 0) :=  (others => '0');

  signal DIP_ipd : std_logic_vector(7 downto 0);
  signal DI_ipd : std_logic_vector(63 downto 0);
  signal INJECTDBITERR_ipd : std_ulogic;
  signal INJECTSBITERR_ipd : std_ulogic;
  signal RDCLK_ipd : std_ulogic;
  signal RDEN_ipd : std_ulogic;
  signal REGCE_ipd : std_ulogic;
  signal RSTREG_ipd : std_ulogic;
  signal RST_ipd : std_ulogic;
  signal WRCLK_ipd : std_ulogic;
  signal WREN_ipd : std_ulogic;
    
  signal DIP_dly : std_logic_vector(7 downto 0);
  signal DI_dly : std_logic_vector(63 downto 0);
  signal INJECTDBITERR_dly : std_ulogic;
  signal INJECTSBITERR_dly : std_ulogic;
  signal RDCLK_dly : std_ulogic;
  signal RDEN_dly : std_ulogic;
  signal REGCE_dly : std_ulogic;
  signal RSTREG_dly : std_ulogic;
  signal RST_dly : std_ulogic;
  signal WRCLK_dly : std_ulogic;
  signal WREN_dly : std_ulogic;

  signal GSR_dly   : std_ulogic     :=    '0';
  signal violation : std_ulogic := '0'; 
  signal violation_rdclk : std_ulogic := '0';
  signal violation_wrclk : std_ulogic := '0';


  function INIT_SRVAL_SDP (
    input_a : bit_vector(71 downto 0))
    return bit_vector is variable out_init_srval : bit_vector(71 downto 0);
  begin

    if (FIFO_MODE = "FIFO36_72") then
      out_init_srval := input_a(71 downto 68) & input_a(35 downto 32) & input_a(67 downto 36) & input_a(31 downto 0);
    else
      out_init_srval := input_a;
    end if;

    return out_init_srval;  
                         
  end;

                         
begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  ---------------------

  WireDelay     : block
  begin

    DIP_DELAY : for i in 7 downto 0 generate
      VitalWireDelay (DIP_ipd(i),DIP(i),tipd_DIP(i));
    end generate DIP_DELAY;

    DI_DELAY : for i in 63 downto 0 generate
      VitalWireDelay (DI_ipd(i),DI(i),tipd_DI(i));
    end generate DI_DELAY;

    VitalWireDelay (INJECTDBITERR_ipd,INJECTDBITERR,tipd_INJECTDBITERR);
    VitalWireDelay (INJECTSBITERR_ipd,INJECTSBITERR,tipd_INJECTSBITERR);
    VitalWireDelay (RDCLK_ipd,RDCLK,tipd_RDCLK);
    VitalWireDelay (RDEN_ipd,RDEN,tipd_RDEN);
    VitalWireDelay (REGCE_ipd,REGCE,tipd_REGCE);
    VitalWireDelay (RSTREG_ipd,RSTREG,tipd_RSTREG);
    VitalWireDelay (RST_ipd,RST,tipd_RST);
    VitalWireDelay (WRCLK_ipd,WRCLK,tipd_WRCLK);
    VitalWireDelay (WREN_ipd,WREN,tipd_WREN);

  end block;


  SignalDelay : block
  begin

    DIP_DELAY : for i in 7 downto 0 generate
      VitalSignalDelay (DIP_dly(i),DIP_ipd(i),tisd_DIP_WRCLK(i));
    end generate DIP_DELAY;

    DI_DELAY : for i in 63 downto 0 generate
      VitalSignalDelay (DI_dly(i),DI_ipd(i),tisd_DI_WRCLK(i));
    end generate DI_DELAY;

    VitalSignalDelay (INJECTDBITERR_dly,INJECTDBITERR_ipd,tisd_INJECTDBITERR_WRCLK);
    VitalSignalDelay (INJECTSBITERR_dly,INJECTSBITERR_ipd,tisd_INJECTSBITERR_WRCLK);
    VitalSignalDelay (RDEN_dly,RDEN_ipd,tisd_RDEN_RDCLK);
    VitalSignalDelay (REGCE_dly,REGCE_ipd,tisd_REGCE_RDCLK);
    VitalSignalDelay (RSTREG_dly,RSTREG_ipd,tisd_RSTREG_RDCLK);
    VitalSignalDelay (RST_dly,RST_ipd,tisd_RST_RDCLK);
    VitalSignalDelay (WREN_dly,WREN_ipd,tisd_WREN_WRCLK);
    VitalSignalDelay (RDCLK_dly,RDCLK_ipd,ticd_RDCLK);
    VitalSignalDelay (WRCLK_dly,WRCLK_ipd,ticd_WRCLK);

  end block;

  
X_FIFO36E1_inst : X_FF36_INTERNAL_VHDL
  generic map (
    ALMOST_EMPTY_OFFSET => ALMOST_EMPTY_OFFSET, 
    ALMOST_FULL_OFFSET => ALMOST_FULL_OFFSET,
    DATA_WIDTH => DATA_WIDTH,
    DO_REG => DO_REG,
    EN_ECC_READ => EN_ECC_READ, 
    EN_ECC_WRITE => EN_ECC_WRITE,
    EN_SYN => EN_SYN,
    FIRST_WORD_FALL_THROUGH => FIRST_WORD_FALL_THROUGH,
    INIT => INIT_SRVAL_SDP(INIT),
    SIM_DEVICE => SIM_DEVICE,
    SRVAL => INIT_SRVAL_SDP(SRVAL)
    )

  port map (
    ALMOSTEMPTY => almostempty_zd,
    ALMOSTFULL => almostfull_zd,
    DBITERR => dbiterr_zd,
    DO => do_zd,
    DOP => dop_zd,
    ECCPARITY => eccparity_zd,
    EMPTY => empty_zd,
    FULL => full_zd,
    RDCOUNT => rdcount_zd,
    RDERR => rderr_zd,
    SBITERR => sbiterr_zd,
    WRCOUNT => wrcount_zd,
    WRERR => wrerr_zd,

    DI => DI_dly,
    DIP => DIP_dly,
    INJECTDBITERR => INJECTDBITERR_dly,
    INJECTSBITERR => INJECTSBITERR_dly,
    RDCLK => RDCLK_dly,
    RDEN => RDEN_dly,
    REGCE => REGCE_dly,
    RST => RST_dly,
    RSTREG => RSTREG_dly,
    WRCLK => WRCLK_dly,
    WREN => WREN_dly
    );

   prcs_initialize:process
     variable first_time        : boolean    := true;

     begin
       if (first_time) then
         case DATA_WIDTH is
            when 4 | 9 | 18 | 36 | 72 => null;
            when others =>
                    GenericValueCheckMessage
                      ( HeaderMsg            => " Attribute Syntax Error ",
                        GenericName          => " DATA_WIDTH ",
                        EntityName           => "X_FIFO36E1",
                        GenericValue         => DATA_WIDTH,
                        Unit                 => "",
                        ExpectedValueMsg     => " The Legal values for this attribute are ",
                        ExpectedGenericValue => " 4, 9, 18, 36 and 72",
                        TailMsg              => "",
                        MsgSeverity          => failure
                        );
         end case;


         if (not(FIFO_MODE = "FIFO36" or FIFO_MODE = "FIFO36_72")) then

           GenericValueCheckMessage
             ( HeaderMsg            => " Attribute Syntax Error : ",
               GenericName          => " FIFO_MODE ",
               EntityName           => "X_FIFO36E1",
               GenericValue         => FIFO_MODE,
               Unit                 => "",
               ExpectedValueMsg     => " The Legal values for this attribute are ",
               ExpectedGenericValue => " FIFO36 or FIFO36_72 ",
               TailMsg              => "",
               MsgSeverity          => failure
               );
         end if;

         
         if(DATA_WIDTH = 72 xor FIFO_MODE = "FIFO36_72") then
          assert false
          report "DRC Error : The attribute DATA_WIDTH must be set to 72 when attribute FIFO_MODE = FIFO36_72."
          severity failure;
         end if;

         
         first_time := false;

       end if;
       wait;
   end process prcs_initialize;

       
-------------------------------------------------------------------------------
-- Timing Checks
-------------------------------------------------------------------------------

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
     variable Tviol_DI32_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI32_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI33_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI33_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI34_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI34_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI35_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI35_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI36_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI36_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI37_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI37_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI38_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI38_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI39_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI39_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI40_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI40_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI41_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI41_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI42_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI42_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI43_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI43_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI44_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI44_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI45_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI45_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI46_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI46_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI47_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI47_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI48_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI48_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI49_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI49_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI50_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI50_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI51_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI51_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI52_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI52_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI53_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI53_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI54_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI54_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI55_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI55_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI56_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI56_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI57_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI57_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI58_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI58_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI59_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI59_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI60_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI60_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI61_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI61_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI62_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI62_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DI63_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DI63_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP0_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP0_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP1_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP1_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP2_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP2_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP3_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP3_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP4_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP4_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP5_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP5_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP6_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP6_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_DIP7_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_DIP7_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RDEN_RDCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RDEN_RDCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_WREN_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_WREN_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_RDCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_RDCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_WRCLK_posedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_RDCLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_RDCLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_RST_WRCLK_negedge : STD_ULOGIC := '0';
     variable  Tmkr_RST_WRCLK_negedge : VitalTimingDataType := VitalTimingDataInit;
     
     variable Tmkr_INJECTDBITERR_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tmkr_INJECTSBITERR_WRCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tmkr_REGCE_RDCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tmkr_RSTREG_RDCLK_posedge : VitalTimingDataType := VitalTimingDataInit;
     variable Tviol_INJECTDBITERR_WRCLK_posedge :  std_ulogic := '0';
     variable Tviol_INJECTSBITERR_WRCLK_posedge :  std_ulogic := '0';
     variable Tviol_REGCE_RDCLK_posedge :  std_ulogic := '0';
     variable Tviol_RSTREG_RDCLK_posedge :  std_ulogic := '0';
     
     variable PInfo_RDCLK : VitalPeriodDataType := VitalPeriodDataInit;
     variable Pviol_RDCLK : std_ulogic := '0';
     
     variable PInfo_WRCLK : VitalPeriodDataType := VitalPeriodDataInit;
     variable Pviol_WRCLK : std_ulogic := '0';

     variable PInfo_RST : VitalPeriodDataType := VitalPeriodDataInit;
     variable Pviol_RST : std_ulogic := '0';

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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI32_WRCLK_posedge,
         TimingData     => Tmkr_DI32_WRCLK_posedge,
         TestSignal     => DI_dly(32),
         TestSignalName => "DI(32)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(32),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(32),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(32),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(32),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI33_WRCLK_posedge,
         TimingData     => Tmkr_DI33_WRCLK_posedge,
         TestSignal     => DI_dly(33),
         TestSignalName => "DI(33)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(33),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(33),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(33),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(33),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI34_WRCLK_posedge,
         TimingData     => Tmkr_DI34_WRCLK_posedge,
         TestSignal     => DI_dly(34),
         TestSignalName => "DI(34)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(34),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(34),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(34),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(34),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI35_WRCLK_posedge,
         TimingData     => Tmkr_DI35_WRCLK_posedge,
         TestSignal     => DI_dly(35),
         TestSignalName => "DI(35)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(35),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(35),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(35),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(35),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI36_WRCLK_posedge,
         TimingData     => Tmkr_DI36_WRCLK_posedge,
         TestSignal     => DI_dly(36),
         TestSignalName => "DI(36)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(36),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(36),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(36),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(36),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI37_WRCLK_posedge,
         TimingData     => Tmkr_DI37_WRCLK_posedge,
         TestSignal     => DI_dly(37),
         TestSignalName => "DI(37)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(37),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(37),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(37),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(37),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI38_WRCLK_posedge,
         TimingData     => Tmkr_DI38_WRCLK_posedge,
         TestSignal     => DI_dly(38),
         TestSignalName => "DI(38)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(38),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(38),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(38),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(38),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI39_WRCLK_posedge,
         TimingData     => Tmkr_DI39_WRCLK_posedge,
         TestSignal     => DI_dly(39),
         TestSignalName => "DI(39)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(39),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(39),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(39),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(39),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI40_WRCLK_posedge,
         TimingData     => Tmkr_DI40_WRCLK_posedge,
         TestSignal     => DI_dly(40),
         TestSignalName => "DI(40)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(40),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(40),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(40),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(40),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI41_WRCLK_posedge,
         TimingData     => Tmkr_DI41_WRCLK_posedge,
         TestSignal     => DI_dly(41),
         TestSignalName => "DI(41)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(41),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(41),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(41),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(41),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI42_WRCLK_posedge,
         TimingData     => Tmkr_DI42_WRCLK_posedge,
         TestSignal     => DI_dly(42),
         TestSignalName => "DI(42)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(42),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(42),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(42),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(42),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI43_WRCLK_posedge,
         TimingData     => Tmkr_DI43_WRCLK_posedge,
         TestSignal     => DI_dly(43),
         TestSignalName => "DI(43)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(43),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(43),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(43),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(43),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI44_WRCLK_posedge,
         TimingData     => Tmkr_DI44_WRCLK_posedge,
         TestSignal     => DI_dly(44),
         TestSignalName => "DI(44)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(44),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(44),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(44),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(44),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI45_WRCLK_posedge,
         TimingData     => Tmkr_DI45_WRCLK_posedge,
         TestSignal     => DI_dly(45),
         TestSignalName => "DI(45)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(45),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(45),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(45),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(45),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI46_WRCLK_posedge,
         TimingData     => Tmkr_DI46_WRCLK_posedge,
         TestSignal     => DI_dly(46),
         TestSignalName => "DI(46)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(46),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(46),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(46),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(46),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI47_WRCLK_posedge,
         TimingData     => Tmkr_DI47_WRCLK_posedge,
         TestSignal     => DI_dly(47),
         TestSignalName => "DI(47)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(47),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(47),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(47),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(47),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI48_WRCLK_posedge,
         TimingData     => Tmkr_DI48_WRCLK_posedge,
         TestSignal     => DI_dly(48),
         TestSignalName => "DI(48)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(48),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(48),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(48),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(48),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI49_WRCLK_posedge,
         TimingData     => Tmkr_DI49_WRCLK_posedge,
         TestSignal     => DI_dly(49),
         TestSignalName => "DI(49)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(49),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(49),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(49),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(49),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI50_WRCLK_posedge,
         TimingData     => Tmkr_DI50_WRCLK_posedge,
         TestSignal     => DI_dly(50),
         TestSignalName => "DI(50)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(50),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(50),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(50),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(50),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI51_WRCLK_posedge,
         TimingData     => Tmkr_DI51_WRCLK_posedge,
         TestSignal     => DI_dly(51),
         TestSignalName => "DI(51)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(51),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(51),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(51),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(51),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI52_WRCLK_posedge,
         TimingData     => Tmkr_DI52_WRCLK_posedge,
         TestSignal     => DI_dly(52),
         TestSignalName => "DI(52)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(52),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(52),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(52),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(52),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI53_WRCLK_posedge,
         TimingData     => Tmkr_DI53_WRCLK_posedge,
         TestSignal     => DI_dly(53),
         TestSignalName => "DI(53)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(53),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(53),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(53),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(53),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI54_WRCLK_posedge,
         TimingData     => Tmkr_DI54_WRCLK_posedge,
         TestSignal     => DI_dly(54),
         TestSignalName => "DI(54)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(54),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(54),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(54),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(54),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI55_WRCLK_posedge,
         TimingData     => Tmkr_DI55_WRCLK_posedge,
         TestSignal     => DI_dly(55),
         TestSignalName => "DI(55)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(55),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(55),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(55),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(55),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI56_WRCLK_posedge,
         TimingData     => Tmkr_DI56_WRCLK_posedge,
         TestSignal     => DI_dly(56),
         TestSignalName => "DI(56)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(56),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(56),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(56),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(56),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI57_WRCLK_posedge,
         TimingData     => Tmkr_DI57_WRCLK_posedge,
         TestSignal     => DI_dly(57),
         TestSignalName => "DI(57)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(57),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(57),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(57),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(57),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI58_WRCLK_posedge,
         TimingData     => Tmkr_DI58_WRCLK_posedge,
         TestSignal     => DI_dly(58),
         TestSignalName => "DI(58)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(58),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(58),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(58),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(58),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI59_WRCLK_posedge,
         TimingData     => Tmkr_DI59_WRCLK_posedge,
         TestSignal     => DI_dly(59),
         TestSignalName => "DI(59)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(59),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(59),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(59),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(59),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI60_WRCLK_posedge,
         TimingData     => Tmkr_DI60_WRCLK_posedge,
         TestSignal     => DI_dly(60),
         TestSignalName => "DI(60)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(60),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(60),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(60),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(60),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI61_WRCLK_posedge,
         TimingData     => Tmkr_DI61_WRCLK_posedge,
         TestSignal     => DI_dly(61),
         TestSignalName => "DI(61)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(61),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(61),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(61),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(61),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI62_WRCLK_posedge,
         TimingData     => Tmkr_DI62_WRCLK_posedge,
         TestSignal     => DI_dly(62),
         TestSignalName => "DI(62)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(62),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(62),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(62),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(62),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DI63_WRCLK_posedge,
         TimingData     => Tmkr_DI63_WRCLK_posedge,
         TestSignal     => DI_dly(63),
         TestSignalName => "DI(63)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DI_WRCLK_posedge_posedge(63),
         SetupLow       => tsetup_DI_WRCLK_negedge_posedge(63),
         HoldLow        => thold_DI_WRCLK_posedge_posedge(63),
         HoldHigh       => thold_DI_WRCLK_negedge_posedge(63),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP4_WRCLK_posedge,
         TimingData     => Tmkr_DIP4_WRCLK_posedge,
         TestSignal     => DIP_dly(4),
         TestSignalName => "DIP(4)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(4),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(4),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(4),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(4),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP5_WRCLK_posedge,
         TimingData     => Tmkr_DIP5_WRCLK_posedge,
         TestSignal     => DIP_dly(5),
         TestSignalName => "DIP(5)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(5),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(5),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(5),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(5),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP6_WRCLK_posedge,
         TimingData     => Tmkr_DIP6_WRCLK_posedge,
         TestSignal     => DIP_dly(6),
         TestSignalName => "DIP(6)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(6),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(6),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(6),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(6),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_DIP7_WRCLK_posedge,
         TimingData     => Tmkr_DIP7_WRCLK_posedge,
         TestSignal     => DIP_dly(7),
         TestSignalName => "DIP(7)",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_DIP_WRCLK_posedge_posedge(7),
         SetupLow       => tsetup_DIP_WRCLK_negedge_posedge(7),
         HoldLow        => thold_DIP_WRCLK_posedge_posedge(7),
         HoldHigh       => thold_DIP_WRCLK_negedge_posedge(7),
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_WREN_WRCLK_posedge,
         TimingData     => Tmkr_WREN_WRCLK_posedge,
         TestSignal     => WREN_dly,
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_INJECTDBITERR_WRCLK_posedge,
         TimingData     => Tmkr_INJECTDBITERR_WRCLK_posedge,
         TestSignal     => INJECTDBITERR_dly,
         TestSignalName => "INJECTDBITERR",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_INJECTDBITERR_WRCLK_posedge_posedge,
         SetupLow       => tsetup_INJECTDBITERR_WRCLK_negedge_posedge,
         HoldLow        => thold_INJECTDBITERR_WRCLK_posedge_posedge,
         HoldHigh       => thold_INJECTDBITERR_WRCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_INJECTSBITERR_WRCLK_posedge,
         TimingData     => Tmkr_INJECTSBITERR_WRCLK_posedge,
         TestSignal     => INJECTSBITERR_dly,
         TestSignalName => "INJECTSBITERR",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_INJECTSBITERR_WRCLK_posedge_posedge,
         SetupLow       => tsetup_INJECTSBITERR_WRCLK_negedge_posedge,
         HoldLow        => thold_INJECTSBITERR_WRCLK_posedge_posedge,
         HoldHigh       => thold_INJECTSBITERR_WRCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );     
     VitalSetupHoldCheck
       (
         Violation      => Tviol_RDEN_RDCLK_posedge,
         TimingData     => Tmkr_RDEN_RDCLK_posedge,
         TestSignal     => RDEN_dly,
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
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_REGCE_RDCLK_posedge,
         TimingData     => Tmkr_REGCE_RDCLK_posedge,
         TestSignal     => REGCE_dly,
         TestSignalName => "REGCE",
         TestDelay      => 0 ns,
         RefSignal      => RDCLK_dly,
         RefSignalName  => "RDCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_REGCE_RDCLK_posedge_posedge,
         SetupLow       => tsetup_REGCE_RDCLK_negedge_posedge,
         HoldLow        => thold_REGCE_RDCLK_posedge_posedge,
         HoldHigh       => thold_REGCE_RDCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_RSTREG_RDCLK_posedge,
         TimingData     => Tmkr_RSTREG_RDCLK_posedge,
         TestSignal     => RSTREG_dly,
         TestSignalName => "RSTREG",
         TestDelay      => 0 ns,
         RefSignal      => RDCLK_dly,
         RefSignalName  => "RDCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_RSTREG_RDCLK_posedge_posedge,
         SetupLow       => tsetup_RSTREG_RDCLK_negedge_posedge,
         HoldLow        => thold_RSTREG_RDCLK_posedge_posedge,
         HoldHigh       => thold_RSTREG_RDCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_RST_RDCLK_posedge,
         TimingData     => Tmkr_RST_RDCLK_posedge,
         TestSignal     => RST_dly,
         TestSignalName => "RST",
         TestDelay      => 0 ns,
         RefSignal      => RDCLK_dly,
         RefSignalName  => "RDCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_RST_RDCLK_posedge_posedge,
         SetupLow       => tsetup_RST_RDCLK_negedge_posedge,
         HoldLow        => thold_RST_RDCLK_posedge_posedge,
         HoldHigh       => thold_RST_RDCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_RST_WRCLK_posedge,
         TimingData     => Tmkr_RST_WRCLK_posedge,
         TestSignal     => RST_dly,
         TestSignalName => "RST",
         TestDelay      => 0 ns,
         RefSignal      => WRCLK_dly,
         RefSignalName  => "WRCLK",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_RST_WRCLK_posedge_posedge,
         SetupLow       => tsetup_RST_WRCLK_negedge_posedge,
         HoldLow        => thold_RST_WRCLK_posedge_posedge,
         HoldHigh       => thold_RST_WRCLK_negedge_posedge,
         CheckEnabled   => (TO_X01(GSR_dly) = '0'),
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_FIFO36E1",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => Warning
       );   
     VitalRecoveryRemovalCheck (
        Violation            => Tviol_RST_RDCLK_negedge,
        TimingData           => Tmkr_RST_RDCLK_negedge,
        TestSignal           => RST_dly,
        TestSignalName       => "RST",
        TestDelay            => tisd_RST_RDCLK,
        RefSignal            => RDCLK_dly,
        RefSignalName        => "RDCLK",
        RefDelay             => ticd_RDCLK,
        Recovery             => trecovery_RST_RDCLK_negedge_posedge,
        Removal              => tremoval_RST_RDCLK_negedge_posedge,
        ActiveLow            => false,
        CheckEnabled         => (TO_X01(GSR_dly) = '0'),
        RefTransition        => 'R',
        HeaderMsg            => "/X_FIFO36E1",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
     VitalRecoveryRemovalCheck (
        Violation            => Tviol_RST_WRCLK_negedge,
        TimingData           => Tmkr_RST_WRCLK_negedge,
        TestSignal           => RST_dly,
        TestSignalName       => "RST",
        TestDelay            => tisd_RST_WRCLK,
        RefSignal            => WRCLK_dly,
        RefSignalName        => "WRCLK",
        RefDelay             => ticd_WRCLK,
        Recovery             => trecovery_RST_WRCLK_negedge_posedge,
        Removal              => tremoval_RST_WRCLK_negedge_posedge,
        ActiveLow            => false,
        CheckEnabled         => (TO_X01(GSR_dly) = '0'),
        RefTransition        => 'R',
        HeaderMsg            => "/X_FIFO36E1",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
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
        HeaderMsg            => "/X_FIFO36E1",
        Xon                  => Xon,
        MsgOn                => MsgOn,
        MsgSeverity          => Warning
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
        HeaderMsg            => "/X_FIFO36E1",
        Xon                  => Xon,
        MsgOn                => MsgOn,
        MsgSeverity          => Warning
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
        HeaderMsg            => "/X_FIFO36E1",
        Xon                  => Xon,
        MsgOn                => MsgOn,
        MsgSeverity          => Warning
      );

     end if;

     Violation <=
     Pviol_RDCLK or
     Pviol_RST or
     Pviol_WRCLK or
     Tviol_DI0_WRCLK_posedge or
     Tviol_DI10_WRCLK_posedge or
     Tviol_DI11_WRCLK_posedge or
     Tviol_DI12_WRCLK_posedge or
     Tviol_DI13_WRCLK_posedge or
     Tviol_DI14_WRCLK_posedge or
     Tviol_DI15_WRCLK_posedge or
     Tviol_DI16_WRCLK_posedge or
     Tviol_DI17_WRCLK_posedge or
     Tviol_DI18_WRCLK_posedge or
     Tviol_DI19_WRCLK_posedge or
     Tviol_DI1_WRCLK_posedge or
     Tviol_DI20_WRCLK_posedge or
     Tviol_DI21_WRCLK_posedge or
     Tviol_DI22_WRCLK_posedge or
     Tviol_DI23_WRCLK_posedge or
     Tviol_DI24_WRCLK_posedge or
     Tviol_DI25_WRCLK_posedge or
     Tviol_DI26_WRCLK_posedge or
     Tviol_DI27_WRCLK_posedge or
     Tviol_DI28_WRCLK_posedge or
     Tviol_DI29_WRCLK_posedge or
     Tviol_DI2_WRCLK_posedge or
     Tviol_DI30_WRCLK_posedge or
     Tviol_DI31_WRCLK_posedge or
     Tviol_DI32_WRCLK_posedge or
     Tviol_DI33_WRCLK_posedge or
     Tviol_DI34_WRCLK_posedge or
     Tviol_DI35_WRCLK_posedge or
     Tviol_DI36_WRCLK_posedge or
     Tviol_DI37_WRCLK_posedge or
     Tviol_DI38_WRCLK_posedge or
     Tviol_DI39_WRCLK_posedge or
     Tviol_DI3_WRCLK_posedge or
     Tviol_DI40_WRCLK_posedge or
     Tviol_DI41_WRCLK_posedge or
     Tviol_DI42_WRCLK_posedge or
     Tviol_DI43_WRCLK_posedge or
     Tviol_DI44_WRCLK_posedge or
     Tviol_DI45_WRCLK_posedge or
     Tviol_DI46_WRCLK_posedge or
     Tviol_DI47_WRCLK_posedge or
     Tviol_DI48_WRCLK_posedge or
     Tviol_DI49_WRCLK_posedge or
     Tviol_DI4_WRCLK_posedge or
     Tviol_DI50_WRCLK_posedge or
     Tviol_DI51_WRCLK_posedge or
     Tviol_DI52_WRCLK_posedge or
     Tviol_DI53_WRCLK_posedge or
     Tviol_DI54_WRCLK_posedge or
     Tviol_DI55_WRCLK_posedge or
     Tviol_DI56_WRCLK_posedge or
     Tviol_DI57_WRCLK_posedge or
     Tviol_DI58_WRCLK_posedge or
     Tviol_DI59_WRCLK_posedge or
     Tviol_DI5_WRCLK_posedge or
     Tviol_DI60_WRCLK_posedge or
     Tviol_DI61_WRCLK_posedge or
     Tviol_DI62_WRCLK_posedge or
     Tviol_DI63_WRCLK_posedge or
     Tviol_DI6_WRCLK_posedge or
     Tviol_DI7_WRCLK_posedge or
     Tviol_DI8_WRCLK_posedge or
     Tviol_DI9_WRCLK_posedge or
     Tviol_DIP0_WRCLK_posedge or
     Tviol_DIP1_WRCLK_posedge or
     Tviol_DIP2_WRCLK_posedge or
     Tviol_DIP3_WRCLK_posedge or
     Tviol_DIP4_WRCLK_posedge or
     Tviol_DIP5_WRCLK_posedge or
     Tviol_DIP6_WRCLK_posedge or
     Tviol_DIP7_WRCLK_posedge or
     Tviol_INJECTDBITERR_WRCLK_posedge or
     Tviol_INJECTSBITERR_WRCLK_posedge or
     Tviol_RDEN_RDCLK_posedge or
     Tviol_REGCE_RDCLK_posedge or
     Tviol_WREN_WRCLK_posedge;

     Violation_rdclk <= Tviol_RST_RDCLK_negedge or Tviol_RST_RDCLK_posedge or
                        Tviol_RSTREG_RDCLK_posedge;

     Violation_wrclk <= Tviol_RST_WRCLK_negedge or Tviol_RST_WRCLK_posedge;

     
--  Wait signal (input/output pins)
   wait on
     DI_dly,
     DIP_dly,
     RDCLK_dly,
     RDEN_dly,
     RST_dly,
     WRCLK_dly,
     WREN_dly,
     INJECTDBITERR_dly,
     INJECTSBITERR_dly,
     RSTREG_dly,
     REGCE_dly;
     
-- End of (TimingChecksOn)

end process prcs_tmngchk;


-------------------------------------------------------------------------------
-- Path delay
-------------------------------------------------------------------------------
   prcs_output:process (DO_zd, DOP_zd, EMPTY_zd, FULL_zd, ALMOSTEMPTY_zd, ALMOSTFULL_zd, RDCOUNT_zd, WRCOUNT_zd, RDERR_zd, WRERR_zd, DBITERR_zd, ECCPARITY_zd, SBITERR_zd)
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
     variable  DO32_GlitchData : VitalGlitchDataType;
     variable  DO33_GlitchData : VitalGlitchDataType;
     variable  DO34_GlitchData : VitalGlitchDataType;
     variable  DO35_GlitchData : VitalGlitchDataType;
     variable  DO36_GlitchData : VitalGlitchDataType;
     variable  DO37_GlitchData : VitalGlitchDataType;
     variable  DO38_GlitchData : VitalGlitchDataType;
     variable  DO39_GlitchData : VitalGlitchDataType;
     variable  DO40_GlitchData : VitalGlitchDataType;
     variable  DO41_GlitchData : VitalGlitchDataType;
     variable  DO42_GlitchData : VitalGlitchDataType;
     variable  DO43_GlitchData : VitalGlitchDataType;
     variable  DO44_GlitchData : VitalGlitchDataType;
     variable  DO45_GlitchData : VitalGlitchDataType;
     variable  DO46_GlitchData : VitalGlitchDataType;
     variable  DO47_GlitchData : VitalGlitchDataType;
     variable  DO48_GlitchData : VitalGlitchDataType;
     variable  DO49_GlitchData : VitalGlitchDataType;
     variable  DO50_GlitchData : VitalGlitchDataType;
     variable  DO51_GlitchData : VitalGlitchDataType;
     variable  DO52_GlitchData : VitalGlitchDataType;
     variable  DO53_GlitchData : VitalGlitchDataType;
     variable  DO54_GlitchData : VitalGlitchDataType;
     variable  DO55_GlitchData : VitalGlitchDataType;
     variable  DO56_GlitchData : VitalGlitchDataType;
     variable  DO57_GlitchData : VitalGlitchDataType;
     variable  DO58_GlitchData : VitalGlitchDataType;
     variable  DO59_GlitchData : VitalGlitchDataType;
     variable  DO60_GlitchData : VitalGlitchDataType;
     variable  DO61_GlitchData : VitalGlitchDataType;
     variable  DO62_GlitchData : VitalGlitchDataType;
     variable  DO63_GlitchData : VitalGlitchDataType;
     variable  DOP0_GlitchData : VitalGlitchDataType;
     variable  DOP1_GlitchData : VitalGlitchDataType;
     variable  DOP2_GlitchData : VitalGlitchDataType;
     variable  DOP3_GlitchData : VitalGlitchDataType;
     variable  DOP4_GlitchData : VitalGlitchDataType;
     variable  DOP5_GlitchData : VitalGlitchDataType;
     variable  DOP6_GlitchData : VitalGlitchDataType;
     variable  DOP7_GlitchData : VitalGlitchDataType;
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
     variable  RDCOUNT12_GlitchData : VitalGlitchDataType;     
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
     variable  WRCOUNT12_GlitchData : VitalGlitchDataType;
     variable ECCPARITY_GlitchData0 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData1 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData2 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData3 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData4 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData5 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData6 : VitalGlitchDataType;
     variable ECCPARITY_GlitchData7 : VitalGlitchDataType;
     variable DBITERR_GlitchData : VitalGlitchDataType;
     variable SBITERR_GlitchData : VitalGlitchDataType;    
     variable  DO_viol     : std_logic_vector(63 downto 0);
     variable  DOP_viol    : std_logic_vector(7 downto 0);
     variable  EMPTY_viol  : std_ulogic;
     variable  ALMOSTEMPTY_viol  : std_ulogic;
     variable  FULL_viol  : std_ulogic;
     variable  ALMOSTFULL_viol  : std_ulogic;
     variable  RDERR_viol  : std_ulogic;
     variable  WRERR_viol  : std_ulogic;
     variable  RDCOUNT_viol    : std_logic_vector(12 downto 0);
     variable  WRCOUNT_viol    : std_logic_vector(12 downto 0);
     
     begin
       
    DO_viol(0)  := Violation xor DO_zd(0);
    DO_viol(1)  := Violation xor DO_zd(1);
    DO_viol(2)  := Violation xor DO_zd(2);
    DO_viol(3)  := Violation xor DO_zd(3);
    DO_viol(4)  := Violation xor DO_zd(4);
    DO_viol(5)  := Violation xor DO_zd(5);
    DO_viol(6)  := Violation xor DO_zd(6);
    DO_viol(7)  := Violation xor DO_zd(7);
    DO_viol(8)  := Violation xor DO_zd(8);
    DO_viol(9)  := Violation xor DO_zd(9);
    DO_viol(10) := Violation xor DO_zd(10);
    DO_viol(11) := Violation xor DO_zd(11);
    DO_viol(12) := Violation xor DO_zd(12);
    DO_viol(13) := Violation xor DO_zd(13);
    DO_viol(14) := Violation xor DO_zd(14);
    DO_viol(15) := Violation xor DO_zd(15);
    DO_viol(16) := Violation xor DO_zd(16);
    DO_viol(17) := Violation xor DO_zd(17);
    DO_viol(18) := Violation xor DO_zd(18);
    DO_viol(19) := Violation xor DO_zd(19);
    DO_viol(20) := Violation xor DO_zd(20);
    DO_viol(21) := Violation xor DO_zd(21);
    DO_viol(22) := Violation xor DO_zd(22);
    DO_viol(23) := Violation xor DO_zd(23);
    DO_viol(24) := Violation xor DO_zd(24);
    DO_viol(25) := Violation xor DO_zd(25);
    DO_viol(26) := Violation xor DO_zd(26);
    DO_viol(27) := Violation xor DO_zd(27);
    DO_viol(28) := Violation xor DO_zd(28);
    DO_viol(29) := Violation xor DO_zd(29);
    DO_viol(30) := Violation xor DO_zd(30);
    DO_viol(31) := Violation xor DO_zd(31);
    DO_viol(32) := Violation xor DO_zd(32);
    DO_viol(33) := Violation xor DO_zd(33);
    DO_viol(34) := Violation xor DO_zd(34);
    DO_viol(35) := Violation xor DO_zd(35);
    DO_viol(36) := Violation xor DO_zd(36);
    DO_viol(37) := Violation xor DO_zd(37);
    DO_viol(38) := Violation xor DO_zd(38);
    DO_viol(39) := Violation xor DO_zd(39);
    DO_viol(40) := Violation xor DO_zd(40);
    DO_viol(41) := Violation xor DO_zd(41);
    DO_viol(42) := Violation xor DO_zd(42);
    DO_viol(43) := Violation xor DO_zd(43);
    DO_viol(44) := Violation xor DO_zd(44);
    DO_viol(45) := Violation xor DO_zd(45);
    DO_viol(46) := Violation xor DO_zd(46);
    DO_viol(47) := Violation xor DO_zd(47);
    DO_viol(48) := Violation xor DO_zd(48);
    DO_viol(49) := Violation xor DO_zd(49);
    DO_viol(50) := Violation xor DO_zd(50);
    DO_viol(51) := Violation xor DO_zd(51);
    DO_viol(52) := Violation xor DO_zd(52);
    DO_viol(53) := Violation xor DO_zd(53);
    DO_viol(54) := Violation xor DO_zd(54);
    DO_viol(55) := Violation xor DO_zd(55);
    DO_viol(56) := Violation xor DO_zd(56);
    DO_viol(57) := Violation xor DO_zd(57);
    DO_viol(58) := Violation xor DO_zd(58);
    DO_viol(59) := Violation xor DO_zd(59);
    DO_viol(60) := Violation xor DO_zd(60);
    DO_viol(61) := Violation xor DO_zd(61);
    DO_viol(62) := Violation xor DO_zd(62);
    DO_viol(63) := Violation xor DO_zd(63);
    DOP_viol(0) := Violation xor DOP_zd(0);
    DOP_viol(1) := Violation xor DOP_zd(1);
    DOP_viol(2) := Violation xor DOP_zd(2);
    DOP_viol(3) := Violation xor DOP_zd(3);
    DOP_viol(4)  := Violation xor DOP_zd(4);
    DOP_viol(5)  := Violation xor DOP_zd(5);
    DOP_viol(6)  := Violation xor DOP_zd(6);
    DOP_viol(7)  := Violation xor DOP_zd(7);

    EMPTY_viol := Violation_rdclk xor EMPTY_zd;
    ALMOSTEMPTY_viol := Violation_rdclk xor ALMOSTEMPTY_zd;
    RDERR_viol := Violation_rdclk xor RDERR_zd;
    RDCOUNT_viol(0)  := Violation_rdclk xor RDCOUNT_zd(0);
    RDCOUNT_viol(1)  := Violation_rdclk xor RDCOUNT_zd(1);
    RDCOUNT_viol(2)  := Violation_rdclk xor RDCOUNT_zd(2);
    RDCOUNT_viol(3)  := Violation_rdclk xor RDCOUNT_zd(3);
    RDCOUNT_viol(4)  := Violation_rdclk xor RDCOUNT_zd(4);
    RDCOUNT_viol(5)  := Violation_rdclk xor RDCOUNT_zd(5);
    RDCOUNT_viol(6)  := Violation_rdclk xor RDCOUNT_zd(6);
    RDCOUNT_viol(7)  := Violation_rdclk xor RDCOUNT_zd(7);
    RDCOUNT_viol(8)  := Violation_rdclk xor RDCOUNT_zd(8);
    RDCOUNT_viol(9)  := Violation_rdclk xor RDCOUNT_zd(9);
    RDCOUNT_viol(10) := Violation_rdclk xor RDCOUNT_zd(10);
    RDCOUNT_viol(11) := Violation_rdclk xor RDCOUNT_zd(11);
    RDCOUNT_viol(12) := Violation_rdclk xor RDCOUNT_zd(12);
    
    FULL_viol := Violation_wrclk xor FULL_zd;
    ALMOSTFULL_viol := Violation_wrclk xor ALMOSTFULL_zd;
    WRERR_viol := Violation_wrclk xor WRERR_zd;
    WRCOUNT_viol(0)  := Violation_wrclk xor WRCOUNT_zd(0);
    WRCOUNT_viol(1)  := Violation_wrclk xor WRCOUNT_zd(1);
    WRCOUNT_viol(2)  := Violation_wrclk xor WRCOUNT_zd(2);
    WRCOUNT_viol(3)  := Violation_wrclk xor WRCOUNT_zd(3);
    WRCOUNT_viol(4)  := Violation_wrclk xor WRCOUNT_zd(4);
    WRCOUNT_viol(5)  := Violation_wrclk xor WRCOUNT_zd(5);
    WRCOUNT_viol(6)  := Violation_wrclk xor WRCOUNT_zd(6);
    WRCOUNT_viol(7)  := Violation_wrclk xor WRCOUNT_zd(7);
    WRCOUNT_viol(8)  := Violation_wrclk xor WRCOUNT_zd(8);
    WRCOUNT_viol(9)  := Violation_wrclk xor WRCOUNT_zd(9);
    WRCOUNT_viol(10) := Violation_wrclk xor WRCOUNT_zd(10);
    WRCOUNT_viol(11) := Violation_wrclk xor WRCOUNT_zd(11);
    WRCOUNT_viol(12) := Violation_wrclk xor WRCOUNT_zd(12);

    
--  Output-to-Clock path delay
     VitalPathDelay01
       (
         OutSignal     => ALMOSTEMPTY,
         GlitchData    => ALMOSTEMPTY_GlitchData,
         OutSignalName => "ALMOSTEMPTY",
         OutTemp       => ALMOSTEMPTY_viol,
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_ALMOSTEMPTY,TRUE),
                           1 => (RST_dly'last_event, tpd_RST_ALMOSTEMPTY,TRUE)),
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
         OutTemp       => ALMOSTFULL_viol,
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ALMOSTFULL,TRUE),
                           1 => (RST_dly'last_event, tpd_RST_ALMOSTFULL,TRUE)),
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
         OutTemp       => DO_viol(0),
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
         OutTemp       => DO_viol(1),
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
         OutTemp       => DO_viol(2),
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
         OutTemp       => DO_viol(3),
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
         OutTemp       => DO_viol(4),
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
         OutTemp       => DO_viol(5),
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
         OutTemp       => DO_viol(6),
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
         OutTemp       => DO_viol(7),
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
         OutTemp       => DO_viol(8),
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
         OutTemp       => DO_viol(9),
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
         OutTemp       => DO_viol(10),
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
         OutTemp       => DO_viol(11),
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
         OutTemp       => DO_viol(12),
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
         OutTemp       => DO_viol(13),
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
         OutTemp       => DO_viol(14),
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
         OutTemp       => DO_viol(15),
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
         OutTemp       => DO_viol(16),
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
         OutTemp       => DO_viol(17),
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
         OutTemp       => DO_viol(18),
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
         OutTemp       => DO_viol(19),
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
         OutTemp       => DO_viol(20),
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
         OutTemp       => DO_viol(21),
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
         OutTemp       => DO_viol(22),
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
         OutTemp       => DO_viol(23),
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
         OutTemp       => DO_viol(24),
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
         OutTemp       => DO_viol(25),
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
         OutTemp       => DO_viol(26),
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
         OutTemp       => DO_viol(27),
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
         OutTemp       => DO_viol(28),
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
         OutTemp       => DO_viol(29),
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
         OutTemp       => DO_viol(30),
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
         OutTemp       => DO_viol(31),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(31),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(32),
         GlitchData    => DO32_GlitchData,
         OutSignalName => "DO(32)",
         OutTemp       => DO_viol(32),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(32),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(33),
         GlitchData    => DO33_GlitchData,
         OutSignalName => "DO(33)",
         OutTemp       => DO_viol(33),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(33),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(34),
         GlitchData    => DO34_GlitchData,
         OutSignalName => "DO(34)",
         OutTemp       => DO_viol(34),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(34),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(35),
         GlitchData    => DO35_GlitchData,
         OutSignalName => "DO(35)",
         OutTemp       => DO_viol(35),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(35),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(36),
         GlitchData    => DO36_GlitchData,
         OutSignalName => "DO(36)",
         OutTemp       => DO_viol(36),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(36),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(37),
         GlitchData    => DO37_GlitchData,
         OutSignalName => "DO(37)",
         OutTemp       => DO_viol(37),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(37),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(38),
         GlitchData    => DO38_GlitchData,
         OutSignalName => "DO(38)",
         OutTemp       => DO_viol(38),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(38),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(39),
         GlitchData    => DO39_GlitchData,
         OutSignalName => "DO(39)",
         OutTemp       => DO_viol(39),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(39),TRUE)),
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
         OutTemp       => DO_viol(30),
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
         OutTemp       => DO_viol(31),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(31),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(32),
         GlitchData    => DO32_GlitchData,
         OutSignalName => "DO(32)",
         OutTemp       => DO_viol(32),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(32),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(33),
         GlitchData    => DO33_GlitchData,
         OutSignalName => "DO(33)",
         OutTemp       => DO_viol(33),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(33),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(34),
         GlitchData    => DO34_GlitchData,
         OutSignalName => "DO(34)",
         OutTemp       => DO_viol(34),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(34),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(35),
         GlitchData    => DO35_GlitchData,
         OutSignalName => "DO(35)",
         OutTemp       => DO_viol(35),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(35),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(36),
         GlitchData    => DO36_GlitchData,
         OutSignalName => "DO(36)",
         OutTemp       => DO_viol(36),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(36),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(37),
         GlitchData    => DO37_GlitchData,
         OutSignalName => "DO(37)",
         OutTemp       => DO_viol(37),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(37),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(38),
         GlitchData    => DO38_GlitchData,
         OutSignalName => "DO(38)",
         OutTemp       => DO_viol(38),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(38),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(39),
         GlitchData    => DO39_GlitchData,
         OutSignalName => "DO(39)",
         OutTemp       => DO_viol(39),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(39),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(40),
         GlitchData    => DO40_GlitchData,
         OutSignalName => "DO(40)",
         OutTemp       => DO_viol(40),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(40),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(41),
         GlitchData    => DO41_GlitchData,
         OutSignalName => "DO(41)",
         OutTemp       => DO_viol(41),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(41),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(42),
         GlitchData    => DO42_GlitchData,
         OutSignalName => "DO(42)",
         OutTemp       => DO_viol(42),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(42),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(43),
         GlitchData    => DO43_GlitchData,
         OutSignalName => "DO(43)",
         OutTemp       => DO_viol(43),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(43),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(44),
         GlitchData    => DO44_GlitchData,
         OutSignalName => "DO(44)",
         OutTemp       => DO_viol(44),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(44),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(45),
         GlitchData    => DO45_GlitchData,
         OutSignalName => "DO(45)",
         OutTemp       => DO_viol(45),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(45),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(46),
         GlitchData    => DO46_GlitchData,
         OutSignalName => "DO(46)",
         OutTemp       => DO_viol(46),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(46),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(47),
         GlitchData    => DO47_GlitchData,
         OutSignalName => "DO(47)",
         OutTemp       => DO_viol(47),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(47),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(48),
         GlitchData    => DO48_GlitchData,
         OutSignalName => "DO(48)",
         OutTemp       => DO_viol(48),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(48),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(49),
         GlitchData    => DO49_GlitchData,
         OutSignalName => "DO(49)",
         OutTemp       => DO_viol(49),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(49),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(50),
         GlitchData    => DO50_GlitchData,
         OutSignalName => "DO(50)",
         OutTemp       => DO_viol(50),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(50),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(51),
         GlitchData    => DO51_GlitchData,
         OutSignalName => "DO(51)",
         OutTemp       => DO_viol(51),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(51),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(52),
         GlitchData    => DO52_GlitchData,
         OutSignalName => "DO(52)",
         OutTemp       => DO_viol(52),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(52),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(53),
         GlitchData    => DO53_GlitchData,
         OutSignalName => "DO(53)",
         OutTemp       => DO_viol(53),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(53),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(54),
         GlitchData    => DO54_GlitchData,
         OutSignalName => "DO(54)",
         OutTemp       => DO_viol(54),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(54),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(55),
         GlitchData    => DO55_GlitchData,
         OutSignalName => "DO(55)",
         OutTemp       => DO_viol(55),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(55),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(56),
         GlitchData    => DO56_GlitchData,
         OutSignalName => "DO(56)",
         OutTemp       => DO_viol(56),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(56),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(57),
         GlitchData    => DO57_GlitchData,
         OutSignalName => "DO(57)",
         OutTemp       => DO_viol(57),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(57),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(58),
         GlitchData    => DO58_GlitchData,
         OutSignalName => "DO(58)",
         OutTemp       => DO_viol(58),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(58),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(59),
         GlitchData    => DO59_GlitchData,
         OutSignalName => "DO(59)",
         OutTemp       => DO_viol(59),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(59),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(60),
         GlitchData    => DO60_GlitchData,
         OutSignalName => "DO(60)",
         OutTemp       => DO_viol(60),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(60),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(61),
         GlitchData    => DO61_GlitchData,
         OutSignalName => "DO(61)",
         OutTemp       => DO_viol(61),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(61),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(62),
         GlitchData    => DO62_GlitchData,
         OutSignalName => "DO(62)",
         OutTemp       => DO_viol(62),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(62),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DO(63),
         GlitchData    => DO63_GlitchData,
         OutSignalName => "DO(63)",
         OutTemp       => DO_viol(63),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DO(63),TRUE)),
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
         OutTemp       => DOP_viol(0),
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
         OutTemp       => DOP_viol(1),
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
         OutTemp       => DOP_viol(2),
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
         OutTemp       => DOP_viol(3),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(3),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(4),
         GlitchData    => DOP4_GlitchData,
         OutSignalName => "DOP(4)",
         OutTemp       => DOP_viol(4),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(4),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(5),
         GlitchData    => DOP5_GlitchData,
         OutSignalName => "DOP(5)",
         OutTemp       => DOP_viol(5),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(5),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(6),
         GlitchData    => DOP6_GlitchData,
         OutSignalName => "DOP(6)",
         OutTemp       => DOP_viol(6),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(6),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => DOP(7),
         GlitchData    => DOP7_GlitchData,
         OutSignalName => "DOP(7)",
         OutTemp       => DOP_viol(7),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DOP(7),TRUE)),
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
         OutTemp       => EMPTY_viol,
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_EMPTY,TRUE),
                           1 => (RST_dly'last_event, tpd_RST_EMPTY,TRUE)),
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
         OutTemp       => FULL_viol,
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_FULL,TRUE),
                           1 => (RST_dly'last_event, tpd_RST_FULL,TRUE)), 
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
         OutTemp       => RDERR_viol,
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDERR,TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDERR,TRUE)),
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
         OutTemp       => WRERR_viol,
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRERR,TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRERR,TRUE)),
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
         OutTemp       => RDCOUNT_viol(0),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(0),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(0),TRUE)),
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
         OutTemp       => RDCOUNT_viol(1),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(1),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(1),TRUE)),
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
         OutTemp       => RDCOUNT_viol(2),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(2),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(2),TRUE)),                           
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
         OutTemp       => RDCOUNT_viol(3),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(3),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(3),TRUE)),
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
         OutTemp       => RDCOUNT_viol(4),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(4),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(4),TRUE)),
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
         OutTemp       => RDCOUNT_viol(5),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(5),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(5),TRUE)),
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
         OutTemp       => RDCOUNT_viol(6),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(6),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(6),TRUE)),
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
         OutTemp       => RDCOUNT_viol(7),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(7),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(7),TRUE)),
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
         OutTemp       => RDCOUNT_viol(8),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(8),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(8),TRUE)),
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
         OutTemp       => RDCOUNT_viol(9),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(9),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(9),TRUE)),
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
         OutTemp       => RDCOUNT_viol(10),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(10),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(10),TRUE)),
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
         OutTemp       => RDCOUNT_viol(11),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(11),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(11),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => RDCOUNT(12),
         GlitchData    => RDCOUNT12_GlitchData,
         OutSignalName => "RDCOUNT(12)",
         OutTemp       => RDCOUNT_viol(12),
         Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_RDCOUNT(12),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_RDCOUNT(12),TRUE)),
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
         OutTemp       => WRCOUNT_viol(0),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(0),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(0),TRUE)),
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
         OutTemp       => WRCOUNT_viol(1),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(1),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(1),TRUE)),
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
         OutTemp       => WRCOUNT_viol(2),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(2),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(2),TRUE)),
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
         OutTemp       => WRCOUNT_viol(3),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(3),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(3),TRUE)),
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
         OutTemp       => WRCOUNT_viol(4),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(4),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(4),TRUE)),
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
         OutTemp       => WRCOUNT_viol(5),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(5),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(5),TRUE)),
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
         OutTemp       => WRCOUNT_viol(6),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(6),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(6),TRUE)),
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
         OutTemp       => WRCOUNT_viol(7),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(7),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(7),TRUE)),
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
         OutTemp       => WRCOUNT_viol(8),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(8),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(8),TRUE)),
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
         OutTemp       => WRCOUNT_viol(9),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(9),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(9),TRUE)),
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
         OutTemp       => WRCOUNT_viol(10),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(10),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(10),TRUE)),
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
         OutTemp       => WRCOUNT_viol(11),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(11),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(11),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => WRCOUNT(12),
         GlitchData    => WRCOUNT12_GlitchData,
         OutSignalName => "WRCOUNT(12)",
         OutTemp       => WRCOUNT_viol(12),
         Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_WRCOUNT(12),TRUE),
                           1 => (RST_dly'last_event, tpd_RST_WRCOUNT(12),TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(0),
      GlitchData    => ECCPARITY_GlitchData0,
      OutSignalName => "ECCPARITY(0)",
      OutTemp       => ECCPARITY_zd(0),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(0), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(1),
      GlitchData    => ECCPARITY_GlitchData1,
      OutSignalName => "ECCPARITY(1)",
      OutTemp       => ECCPARITY_zd(1),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(1), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(2),
      GlitchData    => ECCPARITY_GlitchData2,
      OutSignalName => "ECCPARITY(2)",
      OutTemp       => ECCPARITY_zd(2),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(2), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(3),
      GlitchData    => ECCPARITY_GlitchData3,
      OutSignalName => "ECCPARITY(3)",
      OutTemp       => ECCPARITY_zd(3),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(3), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(4),
      GlitchData    => ECCPARITY_GlitchData4,
      OutSignalName => "ECCPARITY(4)",
      OutTemp       => ECCPARITY_zd(4),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(4), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(5),
      GlitchData    => ECCPARITY_GlitchData5,
      OutSignalName => "ECCPARITY(5)",
      OutTemp       => ECCPARITY_zd(5),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(5), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(6),
      GlitchData    => ECCPARITY_GlitchData6,
      OutSignalName => "ECCPARITY(6)",
      OutTemp       => ECCPARITY_zd(6),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(6), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => ECCPARITY(7),
      GlitchData    => ECCPARITY_GlitchData7,
      OutSignalName => "ECCPARITY(7)",
      OutTemp       => ECCPARITY_zd(7),
      Paths         => (0 => (WRCLK_dly'last_event, tpd_WRCLK_ECCPARITY(7), (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => DBITERR,
      GlitchData    => DBITERR_GlitchData,
      OutSignalName => "DBITERR",
      OutTemp       => DBITERR_zd,
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_DBITERR, (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => SBITERR,
      GlitchData    => SBITERR_GlitchData,
      OutSignalName => "SBITERR",
      OutTemp       => SBITERR_zd,
      Paths         => (0 => (RDCLK_dly'last_event, tpd_RDCLK_SBITERR, (GSR_dly /= '1'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    
  end process prcs_output;


end X_FIFO36E1_V;
