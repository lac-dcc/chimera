-------------------------------------------------------------------------------
--$Id:  $
-------------------------------------------------------------------------------
--
-- Company     : xxxxxx
-- Title       : cdc_synchroniser
-- xxx P/N     : XXXX-XX-XXXXV01.00 xx Rev X
-- Designer    : Adam
-- Generated   : XXXXXXX
--
-------------------------------------------------------------------------------
--
-- Description : This function performs clock domain crossing synchronisation
-- for trigger signals and static bus signals
-------------------------------------------------------------------------------
--
-- Notations used:
--
-- Component Name (All Caps):
-- *_*_* eg. FIFO_WR_CTRL
--
-- Port Declarations:
-- IP_* = Input pin of device eg. IP_CLK
-- OP_* = Output pin of device eg. OP_WR_EN
-- BP_* = Bi-directional pin of device eg. BP_MEM_DATA_BUS
--
-- Active Low Port Notation (Try to avoid active low logic)
--
-- IP_N* eg. IP_NRST
-- OP_N* eg. OP_NDVAL
-- BP_N* eg. BP_NDQ
--
-- Instance Name: (CamelCase with prefix)
--  i*
--  => Block Diagrams (where # is the number of instantiation) : iInstanceName# (on block diagram)
--  => Inside architecture: iInstanceName1 : COMPONENT_NAME
--                          iInstanceName2 : COMPONENT_NAME
--                          iInstanceName3 : COMPONENT_NAME
--
-- Generic Declarations:
-- G_*_*  eg. generic (G_BUS_WIDTH : natural := 32);
--
-- Constant Declarations:
-- C_*_*  eg. constant C_TOTAL_DMA_CHANNELS : natural := 8;
--
-- Internal signals (CamelCase with prefix)
-- a* - array             eg. type aMatrixType is array(natural range <>) of std_logic_vector(31 downto 0);
-- r* - record            eg.
--  type rPrnDebugBus is
--    record
--      PatGenDat          : std_logic_vector(15 downto 0);
--      PatDat             : std_logic_vector(15 downto 0);
--      DatVal             : std_logic;
--      ErrDetected        : std_logic;
--	    ClkCount           : std_logic_vector(47 downto 0);
--	    DataCount          : std_logic_vector(47 downto 0);
--	    BitErrors          : std_logic_vector(63 downto 0);
--    end record;
--
-- s* - registered signal  eg. sDataValid       : std_logic
-- sc* - concurrent signal eg. scAndOrCtrl      : std_logic
-- v* - variable           eg. vInternalCounter : std_logic_vector
-- sm*, st* - state machine state variable eg
--                 type smStateType is (stRst, stIdle, stProc, stDone);
--                 signal smState: smStateType;
--
-- Active Low Port Notation (Try to avoid active low logic)
--
-- sn* eg. snRst, snDvalOut
--
-- Process Name: (CamelCase with prefix)
-- p* eg. pProcessName : process (IP_CLK, IP_RST)
--
--  Sync Reset
--  -- ***********************************************************************
--  -- Process  :
--  --            Enter Name elaboration here
--  -- Function :
--  --            Enter Function Description here
--  -- Notes    :
--  --            Enter Notes here
--  -- ***********************************************************************
--  pProcessName : process (IP_CLK, IP_RST)
--  begin
--     if rising_edge(IP_CLK) then
--        if (IP_RST = '1') then
--          -- Reset Conditions
--        else
--          -- Rising edge clocked processes
--        end if;
--     end if;
--   end process pProcessName;
--
--  Async Reset
--  -- ***********************************************************************
--  -- Process  :
--  --            Enter Name elaboration here
--  -- Function :
--  --            Enter Function Description here
--  -- Notes    :
--  --            Enter Notes here
--  -- ***********************************************************************
--  pProcessName : process (IP_CLK, IP_RST)
--  begin
--     if (IP_RST = '1') then
--          -- Reset Conditions
--     elsif rising_edge(IP_CLK) then
--          -- Rising edge clocked processes
--     end if;
--   end process pProcessName;
--

-------------------------------------------------------------------------------
--$Log:  $  (cut and paste this section at the end of the vhdl file)
-------------------------------------------------------------------------------






--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {CDC_Synchroniser} architecture {CDC_Synchroniser}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cdc_synchroniser is
	 generic(	
	      G_BUS_WIDTH : integer := 8;   --default width of bus
	      G_OP_INITIAL_VAL: std_logic_vector := X"00000000"  --value of the output after reset
	        );		
	 port(
		 IP_CLK : in STD_LOGIC;
		 IP_RESET : in STD_LOGIC;
		 IP_TRIGGER : in STD_LOGIC;
		 IP_BUS_VALID : in STD_LOGIC;
		 IP_BUS : in STD_LOGIC_VECTOR(G_BUS_WIDTH-1 downto 0);
		 OP_TRIGGER : out STD_LOGIC;
		 OP_BUS : out STD_LOGIC_VECTOR(G_BUS_WIDTH-1 downto 0)
	     );
end cdc_synchroniser;

--}} End of automatically maintained section

architecture cdc_synchroniser of cdc_synchroniser is


signal sSyncTrigger : std_logic;
signal sBusValid : std_logic;
signal sBus : std_logic_vector(G_BUS_WIDTH-1 downto 0);

begin
	
	
-- ***********************************************************************
-- Process  :
--            pTriggerSynchroniser
-- Function :
--            This function performs clock domain crossing synchronisation
--            on a trigger signal
-- Notes    :
--            Enter Notes here
-- ***********************************************************************
pTriggerSynchroniser: process(IP_CLK, IP_RESET)
variable vTrigTmp : std_logic;
begin
    if ( IP_RESET = '1' ) then
        vTrigTmp := '0';
        sSyncTrigger <= '0';
    elsif ( rising_edge(IP_CLK) ) then
        sSyncTrigger <= vTrigTmp;
        vTrigTmp := IP_TRIGGER;
    end if;
end process pTriggerSynchroniser;


-- ***********************************************************************
-- Process  :
--            pBusSynchroniser
-- Function :
--            This function performs clock domain crossing synchronisation
--            on a static bus signal
-- Notes    :
--            Enter Notes here
-- ***********************************************************************
pBusSynchroniser: process(IP_CLK, IP_RESET)
variable vBusValidTmp : std_logic;
begin
    if ( IP_RESET = '1' ) then
        vBusValidTmp := '0';
        sBusValid <= '0';
        sBus <= G_OP_INITIAL_VAL(G_BUS_WIDTH-1 to 0);
    elsif ( rising_edge(IP_CLK) ) then
        sBusValid <= vBusValidTmp;
        vBusValidTmp := IP_BUS_VALID;
		if (sBusValid = '1') then
			sBus <= IP_BUS;
		end if;	
    end if;
end process pBusSynchroniser;

--Output Signals

OP_TRIGGER <= sSyncTrigger;
OP_BUS <= sBus;
end cdc_synchroniser;
