------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-----------------------------------------------------------------------------
-- Entity: 	stratixii_ddr_phy
-- File:	stratixii_ddr_phy.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	DDR PHY for Altera FPGAs
------------------------------------------------------------------------------

LIBRARY stratixii;
USE stratixii.all;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY altdqs_stxii IS 
	 generic (width : integer := 2; MHz : integer := 100);
	 PORT 
	 ( 
		 dqinclk	:	OUT  STD_LOGIC_VECTOR (width-1 downto 0);
		 dqs_datain_h	:	IN  STD_LOGIC_VECTOR (width-1 downto 0);
		 dqs_datain_l	:	IN  STD_LOGIC_VECTOR (width-1 downto 0);
		 dqs_padio	:	INOUT  STD_LOGIC_VECTOR (width-1 downto 0);
		 inclk	:	IN  STD_LOGIC := '0';
		 oe	:	IN  STD_LOGIC_VECTOR (width-1 downto 0) := (OTHERS => '1');
		 outclk	:	IN  STD_LOGIC_VECTOR (width-1 downto 0)
	 ); 
END altdqs_stxii;

ARCHITECTURE RTL OF altdqs_stxii IS

	 COMPONENT  stratixii_dll
	 GENERIC 
	 (
		DELAY_BUFFER_MODE	:	STRING := "none";
		DELAY_CHAIN_LENGTH	:	NATURAL := 12;
		DELAYCTRLOUT_MODE	:	STRING := "normal";
		INPUT_FREQUENCY	:	STRING;
		JITTER_REDUCTION	:	STRING := "false";
		OFFSETCTRLOUT_MODE	:	STRING := "static";
		SIM_LOOP_DELAY_INCREMENT	:	NATURAL := 0;
		SIM_LOOP_INTRINSIC_DELAY	:	NATURAL := 0;
		SIM_VALID_LOCK	:	NATURAL := 5;
		SIM_VALID_LOCKCOUNT	:	NATURAL := 0;
		STATIC_DELAY_CTRL	:	NATURAL := 0;
		STATIC_OFFSET	:	STRING;
		USE_UPNDNIN	:	STRING := "false";
		USE_UPNDNINCLKENA	:	STRING := "false";
		lpm_type	:	STRING := "stratixii_dll"
	 );
	 PORT
	 ( 
		addnsub	:	IN STD_LOGIC := '1';
		aload	:	IN STD_LOGIC := '0';
		clk	:	IN STD_LOGIC;
		delayctrlout	:	OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		dqsupdate	:	OUT STD_LOGIC;
		offset	:	IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		offsetctrlout	:	OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		upndnin	:	IN STD_LOGIC := '0';
		upndninclkena	:	IN STD_LOGIC := '1';
		upndnout	:	OUT STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixii_io
	 GENERIC 
	 (
		BUS_HOLD	:	STRING := "false";
		DDIO_MODE	:	STRING := "none";
		DDIOINCLK_INPUT	:	STRING := "negated_inclk";
		DQS_CTRL_LATCHES_ENABLE	:	STRING := "false";
		DQS_DELAY_BUFFER_MODE	:	STRING := "none";
		DQS_EDGE_DETECT_ENABLE	:	STRING := "false";
		DQS_INPUT_FREQUENCY	:	STRING := "unused";
		DQS_OFFSETCTRL_ENABLE	:	STRING := "false";
		DQS_OUT_MODE	:	STRING := "none";
		DQS_PHASE_SHIFT	:	NATURAL := 0;
		EXTEND_OE_DISABLE	:	STRING := "false";
		GATED_DQS	:	STRING := "false";
		INCLK_INPUT	:	STRING := "normal";
		INPUT_ASYNC_RESET	:	STRING := "none";
		INPUT_POWER_UP	:	STRING := "low";
		INPUT_REGISTER_MODE	:	STRING := "none";
		INPUT_SYNC_RESET	:	STRING := "none";
		OE_ASYNC_RESET	:	STRING := "none";
		OE_POWER_UP	:	STRING := "low";
		OE_REGISTER_MODE	:	STRING := "none";
		OE_SYNC_RESET	:	STRING := "none";
		OPEN_DRAIN_OUTPUT	:	STRING := "false";
		OPERATION_MODE	:	STRING;
		OUTPUT_ASYNC_RESET	:	STRING := "none";
		OUTPUT_POWER_UP	:	STRING := "low";
		OUTPUT_REGISTER_MODE	:	STRING := "none";
		OUTPUT_SYNC_RESET	:	STRING := "none";
		SIM_DQS_DELAY_INCREMENT	:	NATURAL := 0;
		SIM_DQS_INTRINSIC_DELAY	:	NATURAL := 0;
		SIM_DQS_OFFSET_INCREMENT	:	NATURAL := 0;
		TIE_OFF_OE_CLOCK_ENABLE	:	STRING := "false";
		TIE_OFF_OUTPUT_CLOCK_ENABLE	:	STRING := "false";
		lpm_type	:	STRING := "stratixii_io"
	 );
	 PORT
	 ( 
		areset	:	IN STD_LOGIC := '0';
		combout	:	OUT STD_LOGIC;
		datain	:	IN STD_LOGIC := '0';
		ddiodatain	:	IN STD_LOGIC := '0';
		ddioinclk	:	IN STD_LOGIC := '0';
		ddioregout	:	OUT STD_LOGIC;
		delayctrlin	:	IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		dqsbusout	:	OUT STD_LOGIC;
		dqsupdateen	:	IN STD_LOGIC := '1';
		inclk	:	IN STD_LOGIC := '0';
		inclkena	:	IN STD_LOGIC := '1';
		linkin	:	IN STD_LOGIC := '0';
		linkout	:	OUT STD_LOGIC;
		oe	:	IN STD_LOGIC := '1';
		offsetctrlin	:	IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		outclk	:	IN STD_LOGIC := '0';
		outclkena	:	IN STD_LOGIC := '1';
		padio	:	INOUT STD_LOGIC;
		regout	:	OUT STD_LOGIC;
		sreset	:	IN STD_LOGIC := '0';
		terminationcontrol	:	IN STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;

	 SIGNAL  dqs_busout :	STD_LOGIC_VECTOR (width-1 downto 0);
	 SIGNAL  dqsbusout :	STD_LOGIC_VECTOR (width-1 downto 0);
	 SIGNAL  delay_ctrl :	STD_LOGIC_VECTOR (5 DOWNTO 0);

	 TYPE periodtype IS ARRAY(10 TO 20) of STRING(1 TO 6);
	 CONSTANT period : periodtype := (
	 "9999ps", "9090ps", "8333ps", "7692ps", -- 100-130 MHz
	 "7143ps", "6667ps", "6250ps", "5882ps", -- 140-170 MHz
	 "5556ps", "5263ps", "5000ps");          -- 180-200 MHz
	 FUNCTION buffer_mode(MHz : INTEGER) RETURN STRING IS
	 BEGIN
	   IF MHz > 175 THEN RETURN "high"; ELSE RETURN "low"; END IF;
	 END buffer_mode;
	 FUNCTION out_mode(MHz : INTEGER) RETURN STRING IS
	 BEGIN
	   IF MHz > 175 THEN RETURN "delay_chain4";
	   ELSE RETURN "delay_chain3"; END IF;
	 END out_mode;
	 FUNCTION chain_length(MHz : INTEGER) RETURN INTEGER IS
	 BEGIN
	   IF MHz > 175 THEN RETURN 16; ELSE RETURN 12; END IF;
	 END chain_length;
	 
component global
    port (
        a_in : in std_logic;
        a_out : out std_logic);
end component;

component stratixii_clkctrl
    generic (
             clock_type : STRING := "Auto";
             lpm_type : STRING := "stratixii_clkctrl"
             );
    
    port (
          inclk       : in std_logic_vector(3 downto 0) := "0000";
          clkselect   : in std_logic_vector(1 downto 0) := "00";
          ena         : in std_logic := '1';
          devclrn     : in std_logic := '1';
          devpor      : in std_logic := '1';
          outclk      : out std_logic
         );
end component;
subtype v4 is std_logic_vector(3 downto 0);
type vv4 is array (width-1 downto 0) of v4;
signal dqslocal : vv4;
signal gnd : std_logic;
BEGIN
        gnd <= '0';
	dqinclk <= not dqs_busout;

	stxii_dll1 :  stratixii_dll
	  GENERIC MAP (
		DELAY_BUFFER_MODE => buffer_mode(MHz),
		DELAY_CHAIN_LENGTH => chain_length(MHz),
		INPUT_FREQUENCY => period(MHz/10),
		OFFSETCTRLOUT_MODE => "static",
		DELAYCTRLOUT_MODE => "normal",
		JITTER_REDUCTION => "false",
		SIM_LOOP_DELAY_INCREMENT => 132,
		SIM_LOOP_INTRINSIC_DELAY => 3840,
		SIM_VALID_LOCK => 1,
		SIM_VALID_LOCKCOUNT => 46,
		STATIC_OFFSET => "0",
		USE_UPNDNIN => "false",
		USE_UPNDNINCLKENA => "false"
	  )
	  PORT MAP ( 
		clk => inclk,
		delayctrlout => delay_ctrl
	  );

	loop0 : FOR i IN 0 TO width-1 GENERATE 
	  stxii_io2a :  stratixii_io
	  GENERIC MAP (
		DDIO_MODE => "output",
		DQS_CTRL_LATCHES_ENABLE => "false",
		DQS_DELAY_BUFFER_MODE => buffer_mode(MHz),
		DQS_EDGE_DETECT_ENABLE => "false",
		DQS_INPUT_FREQUENCY => period(MHz/10),
		DQS_OFFSETCTRL_ENABLE => "false",
		DQS_OUT_MODE => out_mode(MHz),
		DQS_PHASE_SHIFT => 9000,
		EXTEND_OE_DISABLE => "true",
		GATED_DQS => "false",
		OE_ASYNC_RESET => "none",
		OE_POWER_UP => "low",
		OE_REGISTER_MODE => "register",
		OE_SYNC_RESET => "none",
		OPEN_DRAIN_OUTPUT => "false",
		OPERATION_MODE => "bidir",
		OUTPUT_ASYNC_RESET => "none",
		OUTPUT_POWER_UP => "low",
		OUTPUT_REGISTER_MODE => "register",
		OUTPUT_SYNC_RESET => "none",
		SIM_DQS_DELAY_INCREMENT => 36,
		SIM_DQS_INTRINSIC_DELAY => 900,
		SIM_DQS_OFFSET_INCREMENT => 0,
		TIE_OFF_OE_CLOCK_ENABLE => "false",
		TIE_OFF_OUTPUT_CLOCK_ENABLE => "false"
	  )
	  PORT MAP (
		datain => dqs_datain_h(i),
		ddiodatain => dqs_datain_l(i),
		delayctrlin => delay_ctrl,
		dqsbusout => dqs_busout(i),
		oe => oe(i),
		outclk => outclk(i),
		padio => dqs_padio(i)
	  );
--          clkbuf : global 
--	  port map (a_in => dqsbusout(i), a_out => dqs_busout(i));
--	  dqslocal(i) <= "000" & dqsbusout(i);
--          clkbuf : stratixii_clkctrl generic map (clock_type => "global clock")
--	  port map (inclk => dqslocal(i), outclk => dqs_busout(i));
	END GENERATE loop0;

END RTL; --altdqs_stxii


LIBRARY stratixii;
USE stratixii.all;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY  altdq_stxii IS
         generic (width : integer := 8);
	 PORT 
	 ( 
		 datain_h	:	IN  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		 datain_l	:	IN  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		 dataout_h	:	OUT  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		 dataout_l	:	OUT  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		 inclock	:	IN  STD_LOGIC;
		 oe	:	IN  STD_LOGIC := '1';
		 outclock	:	IN  STD_LOGIC;
		 padio	:	INOUT  STD_LOGIC_VECTOR (width-1 DOWNTO 0)
	 ); 
END altdq_stxii;

ARCHITECTURE RTL OF altdq_stxii IS

	 COMPONENT  stratixii_io
	 GENERIC 
	 (
		BUS_HOLD	:	STRING := "false";
		DDIO_MODE	:	STRING := "none";
		DDIOINCLK_INPUT	:	STRING := "negated_inclk";
		DQS_CTRL_LATCHES_ENABLE	:	STRING := "false";
		DQS_DELAY_BUFFER_MODE	:	STRING := "none";
		DQS_EDGE_DETECT_ENABLE	:	STRING := "false";
		DQS_INPUT_FREQUENCY	:	STRING := "unused";
		DQS_OFFSETCTRL_ENABLE	:	STRING := "false";
		DQS_OUT_MODE	:	STRING := "none";
		DQS_PHASE_SHIFT	:	NATURAL := 0;
		EXTEND_OE_DISABLE	:	STRING := "false";
		GATED_DQS	:	STRING := "false";
		INCLK_INPUT	:	STRING := "normal";
		INPUT_ASYNC_RESET	:	STRING := "none";
		INPUT_POWER_UP	:	STRING := "low";
		INPUT_REGISTER_MODE	:	STRING := "none";
		INPUT_SYNC_RESET	:	STRING := "none";
		OE_ASYNC_RESET	:	STRING := "none";
		OE_POWER_UP	:	STRING := "low";
		OE_REGISTER_MODE	:	STRING := "none";
		OE_SYNC_RESET	:	STRING := "none";
		OPEN_DRAIN_OUTPUT	:	STRING := "false";
		OPERATION_MODE	:	STRING;
		OUTPUT_ASYNC_RESET	:	STRING := "none";
		OUTPUT_POWER_UP	:	STRING := "low";
		OUTPUT_REGISTER_MODE	:	STRING := "none";
		OUTPUT_SYNC_RESET	:	STRING := "none";
		SIM_DQS_DELAY_INCREMENT	:	NATURAL := 0;
		SIM_DQS_INTRINSIC_DELAY	:	NATURAL := 0;
		SIM_DQS_OFFSET_INCREMENT	:	NATURAL := 0;
		TIE_OFF_OE_CLOCK_ENABLE	:	STRING := "false";
		TIE_OFF_OUTPUT_CLOCK_ENABLE	:	STRING := "false";
		lpm_type	:	STRING := "stratixii_io"
	 );
	 PORT
	 ( 
		areset	:	IN STD_LOGIC := '0';
		combout	:	OUT STD_LOGIC;
		datain	:	IN STD_LOGIC := '0';
		ddiodatain	:	IN STD_LOGIC := '0';
		ddioinclk	:	IN STD_LOGIC := '0';
		ddioregout	:	OUT STD_LOGIC;
		delayctrlin	:	IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		dqsbusout	:	OUT STD_LOGIC;
		dqsupdateen	:	IN STD_LOGIC := '1';
		inclk	:	IN STD_LOGIC := '0';
		inclkena	:	IN STD_LOGIC := '1';
		linkin	:	IN STD_LOGIC := '0';
		linkout	:	OUT STD_LOGIC;
		oe	:	IN STD_LOGIC := '1';
		offsetctrlin	:	IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		outclk	:	IN STD_LOGIC := '0';
		outclkena	:	IN STD_LOGIC := '1';
		padio	:	INOUT STD_LOGIC;
		regout	:	OUT STD_LOGIC;
		sreset	:	IN STD_LOGIC := '0';
		terminationcontrol	:	IN STD_LOGIC_VECTOR(13 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;

BEGIN
	loop0 : FOR i IN 0 TO width-1 GENERATE 
	  dq_ioa : stratixii_io
	  GENERIC MAP (
		DDIO_MODE => "bidir",
		DDIOINCLK_INPUT => "negated_inclk",
		EXTEND_OE_DISABLE => "false",
--		INCLK_INPUT => "dqs_bus",
		INPUT_ASYNC_RESET => "none",
		INPUT_POWER_UP => "low",
		INPUT_REGISTER_MODE => "register",
		OE_ASYNC_RESET => "none",
		OE_POWER_UP => "low",
		OE_REGISTER_MODE => "register",
		OPERATION_MODE => "bidir",
		OUTPUT_ASYNC_RESET => "none",
		OUTPUT_POWER_UP => "low",
		OUTPUT_REGISTER_MODE => "register"
	  )
	  PORT MAP ( 
		datain => datain_h(i),
		ddiodatain => datain_l(i),
		ddioregout => dataout_l(i),
		inclk => inclock,
		oe => oe,
		outclk => outclock,
		padio => padio(i),
		regout => dataout_h(i)
	  );
	END GENERATE loop0;

END RTL; --altdq_stxii


library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;

library altera;
library altera_mf;
--pragma translate_off
use altera_mf.altpll;
use altera_mf.altddio_out;
use altera_mf.altddio_bidir;
--pragma translate_on

------------------------------------------------------------------
-- STRATIX2 DDR PHY -----------------------------------------------
------------------------------------------------------------------

entity stratixii_ddr_phy is
  generic (MHz : integer := 100; rstdelay : integer := 200;
	dbits : integer := 16; clk_mul : integer := 2 ;
	clk_div : integer := 2);

  port (
    rst       : in  std_ulogic;
    clk       : in  std_logic;          	-- input clock
    clkout    : out std_ulogic;			-- system clock
    lock      : out std_ulogic;			-- DCM locked

    ddr_clk 	: out std_logic_vector(2 downto 0);
    ddr_clkb	: out std_logic_vector(2 downto 0);
    ddr_clk_fb_out  : out std_logic;
    ddr_clk_fb  : in std_logic;
    ddr_cke  	: out std_logic_vector(1 downto 0);
    ddr_csb  	: out std_logic_vector(1 downto 0);
    ddr_web  	: out std_ulogic;                       -- ddr write enable
    ddr_rasb  	: out std_ulogic;                       -- ddr ras
    ddr_casb  	: out std_ulogic;                       -- ddr cas
    ddr_dm   	: out std_logic_vector (dbits/8-1 downto 0);    -- ddr dm
    ddr_dqs  	: inout std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
    ddr_ad      : out std_logic_vector (13 downto 0);   -- ddr address
    ddr_ba      : out std_logic_vector (1 downto 0);    -- ddr bank address
    ddr_dq    	: inout  std_logic_vector (dbits-1 downto 0); -- ddr data
 
    addr  	: in  std_logic_vector (13 downto 0); -- data mask
    ba    	: in  std_logic_vector ( 1 downto 0); -- data mask
    dqin  	: out std_logic_vector (dbits*2-1 downto 0); -- ddr input data
    dqout 	: in  std_logic_vector (dbits*2-1 downto 0); -- ddr input data
    dm    	: in  std_logic_vector (dbits/4-1 downto 0); -- data mask
    oen       	: in  std_ulogic;
    dqs       	: in  std_ulogic;
    dqsoen     	: in  std_ulogic;
    rasn      	: in  std_ulogic;
    casn      	: in  std_ulogic;
    wen       	: in  std_ulogic;
    csn       	: in  std_logic_vector(1 downto 0);
    cke       	: in  std_logic_vector(1 downto 0)
  );

end;

architecture rtl of stratixii_ddr_phy is

signal vcc, gnd, oe, lockl : std_logic;
signal ddr_clk_fb_outr : std_ulogic;
signal ddr_clk_fbl, fbclk : std_ulogic;
signal ddr_rasnr, ddr_casnr, ddr_wenr : std_ulogic;
signal ddr_clkl, ddr_clkbl : std_logic_vector(2 downto 0);
signal ddr_csnr, ddr_ckenr, ckel : std_logic_vector(1 downto 0);
signal clk_0r, clk_90r, clk_180r, clk_270r : std_ulogic;
signal clk0r, clk90r, clk180r, clk270r : std_ulogic;
signal locked, vlockl, ddrclkfbl : std_ulogic;
signal clk4, clk5 : std_logic;

signal ddr_dqin  	: std_logic_vector (dbits-1 downto 0); -- ddr data
signal ddr_dqout  	: std_logic_vector (dbits-1 downto 0); -- ddr data
signal ddr_dqoen  	: std_logic_vector (dbits-1 downto 0); -- ddr data
signal ddr_adr      	: std_logic_vector (13 downto 0);   -- ddr address
signal ddr_bar      	: std_logic_vector (1 downto 0);   -- ddr address
signal ddr_dmr      	: std_logic_vector (dbits/8-1 downto 0);   -- ddr address
signal ddr_dqsin  	: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal ddr_dqsoen 	: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal ddr_dqsoutl 	: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal dqsdel, dqsclk 	: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal da     		: std_logic_vector (dbits-1 downto 0); -- ddr data
signal dqinl		: std_logic_vector (dbits-1 downto 0); -- ddr data
signal dllrst		: std_logic_vector(0 to 3);
signal dll0rst		: std_logic_vector(0 to 3);
signal mlock, mclkfb, mclk, mclkfx, mclk0 : std_ulogic;
signal gndv             : std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal pclkout	: std_logic_vector (5 downto 1);
signal ddr_clkin	: std_logic_vector(0 to 2);
signal dqinclk  	: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal dqsoclk  	: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
signal dqsnv  		: std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs

constant DDR_FREQ : integer := (MHz * clk_mul) / clk_div;

component stratixii_clkctrl
    generic (
             clock_type : STRING := "Auto";
             lpm_type : STRING := "stratixii_clkctrl"
             );
    port (
          inclk       : in std_logic_vector(3 downto 0) := "0000";
          clkselect   : in std_logic_vector(1 downto 0) := "00";
          ena         : in std_logic := '1';
          devclrn     : in std_logic := '1';
          devpor      : in std_logic := '1';
          outclk      : out std_logic
         );

end component;	

component altddio_out
    generic (
        width                  : positive;  -- required parameter
        power_up_high          : string := "OFF";
        oe_reg                 : string := "UNUSED";
        extend_oe_disable      : string := "UNUSED";
        invert_output          : string := "OFF";
        intended_device_family : string := "MERCURY";
        lpm_hint               : string := "UNUSED";
        lpm_type               : string := "altddio_out" );
    port (
        datain_h   : in std_logic_vector(width-1 downto 0);
        datain_l   : in std_logic_vector(width-1 downto 0);
        outclock   : in std_logic;
        outclocken : in std_logic := '1';
        aset       : in std_logic := '0';
        aclr       : in std_logic := '0';
        sset       : in std_logic := '0';
        sclr       : in std_logic := '0';
        oe         : in std_logic := '1';
        dataout    : out std_logic_vector(width-1 downto 0));
end component;

component altddio_bidir
    generic(
        width                    : positive; -- required parameter
        power_up_high            : string := "OFF";
        oe_reg                   : string := "UNUSED";
        extend_oe_disable        : string := "UNUSED";
        implement_input_in_lcell : string := "UNUSED";
        invert_output            : string := "OFF";
        intended_device_family   : string := "MERCURY";
        lpm_hint                 : string := "UNUSED";
        lpm_type                 : string := "altddio_bidir" );
    port (
        datain_h   : in std_logic_vector(width-1 downto 0);
        datain_l   : in std_logic_vector(width-1 downto 0);
        inclock    : in std_logic := '0';
        inclocken  : in std_logic := '1';
        outclock   : in std_logic;
        outclocken : in std_logic := '1';
        aset       : in std_logic := '0';
        aclr       : in std_logic := '0';
        sset       : in std_logic := '0';
        sclr       : in std_logic := '0';
        oe         : in std_logic := '1';
        dataout_h  : out std_logic_vector(width-1 downto 0);
        dataout_l  : out std_logic_vector(width-1 downto 0);
        padio      : inout std_logic_vector(width-1 downto 0) );
end component;

component altdqs_stxii
	generic (width : integer := 2; MHz : integer := 100);
	PORT
	(
		dqs_datain_h		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		dqs_datain_l		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		inclk		: IN STD_LOGIC ;
		oe		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		outclk		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		dqinclk		: OUT STD_LOGIC_VECTOR (width-1 downto 0);
		dqs_padio		: INOUT STD_LOGIC_VECTOR (width-1 downto 0)
	);
END component;


type phasevec is array (1 to 3) of string(1 to 4);
type phasevecarr is array (10 to 13) of phasevec;

constant phasearr : phasevecarr := (
        ("2500", "5000", "7500"), ("2273", "4545", "6818"),   -- 100 & 110 MHz
        ("2083", "4167", "6250"), ("1923", "3846", "5769"));  -- 120 & 130 MHz

  component altpll
  generic (   
    intended_device_family : string := "Stratix" ;
    operation_mode         : string := "NORMAL" ;
    inclk0_input_frequency : positive;
    inclk1_input_frequency : positive;
    width_clock            : positive := 6;
    clk0_multiply_by       : positive := 1;
    clk0_divide_by         : positive := 1;
    clk1_multiply_by       : positive := 1;
    clk1_divide_by         : positive := 1;    
    clk2_multiply_by       : positive := 1;
    clk2_divide_by         : positive := 1;
    clk3_multiply_by       : positive := 1;
    clk3_divide_by         : positive := 1;    
    clk4_multiply_by       : positive := 1;
    clk4_divide_by         : positive := 1;
    clk3_phase_shift       : string := "0";
    clk2_phase_shift       : string := "0";
    clk1_phase_shift       : string := "0";
    clk0_phase_shift       : string := "0"
  );
  port (
    inclk       : in std_logic_vector(1 downto 0);
    clk         : out std_logic_vector(width_clock-1 downto 0);
    locked      : out std_logic
  );
  end component;

begin

  oe <= not oen; vcc <= '1'; gnd <= '0'; gndv <= (others => '0');

  mclk <= clk;
--  clkout <= clk_270r; 
--  clkout <= clk_0r when DDR_FREQ >= 110 else clk_270r; 
  clkout <= clk_90r when DDR_FREQ > 120 else clk_0r; 
  clk0r <= clk_270r; clk90r <= clk_0r;
  clk180r <= clk_90r; clk270r <= clk_180r;

  dll : altpll
  generic map (   
    intended_device_family => "Stratix II",
    operation_mode => "NORMAL",
    inclk0_input_frequency   => 1000000/MHz,
    inclk1_input_frequency   => 1000000/MHz,
    clk4_multiply_by => clk_mul, clk4_divide_by => clk_div, 
    clk3_multiply_by => clk_mul, clk3_divide_by => clk_div, 
    clk2_multiply_by => clk_mul, clk2_divide_by => clk_div, 
    clk1_multiply_by => clk_mul, clk1_divide_by => clk_div,
    clk0_multiply_by => clk_mul, clk0_divide_by => clk_div, 
    clk3_phase_shift => phasearr(DDR_FREQ/10)(3),
    clk2_phase_shift => phasearr(DDR_FREQ/10)(2),
    clk1_phase_shift => phasearr(DDR_FREQ/10)(1)
  )
  port map ( inclk(0) => mclk, inclk(1) => gnd,  clk(0) => clk_0r, 
        clk(1) => clk_90r, clk(2) => clk_180r, clk(3) => clk_270r, 
        clk(4) => clk4, clk(5) => clk5, locked => lockl);

  rstdel : process (mclk, rst)
  begin
      if rst = '0' then dllrst <= (others => '1');
      elsif rising_edge(mclk) then
	dllrst <= dllrst(1 to 3) & '0';
      end if;
  end process;

  rdel : if rstdelay /= 0 generate
    rcnt : process (clk_0r, lockl)
    variable cnt : std_logic_vector(15 downto 0);
    variable vlock, co : std_ulogic;
    begin
      if rising_edge(clk_0r) then
        co := cnt(15);
        vlockl <= vlock;
        if lockl = '0' then
	  cnt := conv_std_logic_vector(rstdelay*DDR_FREQ, 16); vlock := '0';
        else
	  if vlock = '0' then
	    cnt := cnt -1;  vlock := cnt(15) and not co;
	  end if;
        end if;
      end if;
      if lockl = '0' then
	vlock := '0';
      end if;
    end process;
  end generate;

  locked <= lockl when rstdelay = 0 else vlockl;
  lock <= locked;

  -- Generate external DDR clock

--  fbclkpad : altddio_out generic map (width => 1)
--    port map ( datain_h(0) => vcc, datain_l(0) => gnd,
--	outclock => clk90r, dataout(0) => ddr_clk_fb_out);

  ddrclocks : for i in 0 to 2 generate
    clkpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => vcc, datain_l(0) => gnd, oe => vcc, 
	outclock => clk90r, dataout(0) => ddr_clk(i));

    clknpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => gnd, datain_l(0) => vcc, oe => vcc, 
	outclock => clk90r, dataout(0) => ddr_clkb(i));

  end generate;

  csnpads : altddio_out generic map (width => 2,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h => csn, datain_l => csn, oe => vcc, 
	outclock => clk0r, dataout => ddr_csb);

  ckepads : altddio_out generic map (width => 2,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h => ckel, datain_l => ckel, oe => vcc, 
	outclock => clk0r, dataout => ddr_cke);

  ddrbanks : for i in 0 to 1 generate
    ckel(i) <= cke(i) and locked;
  end generate;

  rasnpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => rasn, datain_l(0) => rasn, oe => vcc, 
	outclock => clk0r, dataout(0) => ddr_rasb);

  casnpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => casn, datain_l(0) => casn, oe => vcc, 
	outclock => clk0r, dataout(0) => ddr_casb);

  wenpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => wen, datain_l(0) => wen, oe => vcc, 
	outclock => clk0r, dataout(0) => ddr_web);

  dmpads : altddio_out generic map (width => dbits/8,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_h => dm(dbits/8*2-1 downto dbits/8),
	datain_l => dm(dbits/8-1 downto 0), oe => vcc, 
	outclock => clk0r, dataout => ddr_dm
    );

  bapads : altddio_out generic map (width => 2,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_h => ba, datain_l => ba, oe => vcc, 
	outclock => clk0r, dataout => ddr_ba
    );

  addrpads : altddio_out generic map (width => 14,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_h => addr, datain_l => addr, oe => vcc, 
	outclock => clk0r, dataout => ddr_ad
    );

  -- DQS generation
  dqsoclk <= (others => clk90r);
         
  altdqs : altdqs_stxii generic map (dbits/8, DDR_FREQ)
    port map (dqs_datain_h => dqsnv, dqs_datain_l => gndv, 
	inclk => clk270r, oe => ddr_dqsoen, outclk => dqsoclk, 
	dqinclk => dqinclk, dqs_padio => ddr_dqs);

  -- Data bus
  dqgen : for i in 0 to dbits/8-1 generate
    qi : altddio_bidir generic map (width => 8, oe_reg =>"REGISTERED",
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_l => dqout(i*8+7 downto i*8),
	datain_h => dqout(i*8+7+dbits downto dbits+i*8), 
	inclock => dqinclk(i), --clk270r, 
	outclock => clk0r, oe => oe,
	dataout_h => dqin(i*8+7 downto i*8),
	dataout_l => dqin(i*8+7+dbits downto dbits+i*8), --dqinl(i*8+7 downto i*8),
	padio => ddr_dq(i*8+7 downto i*8));
  end generate;

  dqsreg : process(clk180r)
  begin
    if rising_edge(clk180r) then
      dqsnv <= (others => oe);
    end if;
  end process;
  oereg : process(clk0r)
  begin
    if rising_edge(clk0r) then
      ddr_dqsoen(dbits/8-1 downto 0) <= (others => not dqsoen);
    end if;
  end process;

end;


library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;

library altera_mf;
--library stratixii;
use altera_mf.altera_mf_components.all;
--use stratixii.stratixii_pll;

------------------------------------------------------------------
-- STRATIX2 DDR2 PHY -----------------------------------------------
------------------------------------------------------------------

entity stratixii_ddr2_phy is
  generic (MHz : integer := 100; rstdelay : integer := 200;
           dbits : integer := 16; clk_mul : integer := 2;
           clk_div : integer := 2; eightbanks : integer range 0 to 1 := 0);
                                                       
  port (
    rst       : in  std_ulogic;
    clk       : in  std_logic;          	-- input clock
    clkout    : out std_ulogic;			-- system clock
    lock      : out std_ulogic;			-- DCM locked

    ddr_clk 	: out std_logic_vector(2 downto 0);
    ddr_clkb	: out std_logic_vector(2 downto 0);
    ddr_cke  	: out std_logic_vector(1 downto 0);
    ddr_csb  	: out std_logic_vector(1 downto 0);
    ddr_web  	: out std_ulogic;                       -- ddr write enable
    ddr_rasb  	: out std_ulogic;                       -- ddr ras
    ddr_casb  	: out std_ulogic;                       -- ddr cas
    ddr_dm   	: out std_logic_vector (dbits/8-1 downto 0);    -- ddr dm
    ddr_dqs  	: inout std_logic_vector (dbits/8-1 downto 0);    -- ddr dqs
    ddr_ad      : out std_logic_vector (13 downto 0);   -- ddr address
    ddr_ba      : out std_logic_vector (1+eightbanks downto 0);    -- ddr bank address
    ddr_dq    	: inout  std_logic_vector (dbits-1 downto 0); -- ddr data
    ddr_odt     : out std_logic_vector(1 downto 0);
 
    addr  	: in  std_logic_vector (13 downto 0); -- data mask
    ba    	: in  std_logic_vector ( 2 downto 0); -- data mask
    dqin  	: out std_logic_vector (dbits*2-1 downto 0); -- ddr input data
    dqout 	: in  std_logic_vector (dbits*2-1 downto 0); -- ddr input data
    dm    	: in  std_logic_vector (dbits/4-1 downto 0); -- data mask
    oen       	: in  std_ulogic;
    dqs       	: in  std_ulogic;
    dqsoen     	: in  std_ulogic;
    rasn      	: in  std_ulogic;
    casn      	: in  std_ulogic;
    wen       	: in  std_ulogic;
    csn       	: in  std_logic_vector(1 downto 0);
    cke       	: in  std_logic_vector(1 downto 0);
    cal_en      : in  std_logic_vector(dbits/8-1 downto 0);
    cal_inc     : in  std_logic_vector(dbits/8-1 downto 0);
    cal_rst     : in  std_logic;
    odt         : in  std_logic_vector(1 downto 0)
  );

end;

architecture rtl of stratixii_ddr2_phy is

signal vcc, gnd : std_logic;
signal ckel, odtl : std_logic_vector(1 downto 0);
signal clk_0r, clk_90r, clk_120r, clk_180r, clk_270r : std_ulogic;
signal locked, lockl, vlockl : std_ulogic;
signal clk5 : std_ulogic;

signal dllrst  : std_logic_vector(0 to 3);
signal gndv    : std_logic_vector (dbits/8-1 downto 0);
signal dqsnv   : std_logic_vector (dbits/8-1 downto 0);
signal dqsoe   : std_logic_vector (dbits/8-1 downto 0);
signal dqsoclk : std_logic_vector (dbits/8-1 downto 0);
signal dqinclk : std_logic_vector (dbits/8-1 downto 0);
signal dqinl   : std_logic_vector (dbits*2-1 downto 0);
signal dqoe    : std_logic;

constant DDR_FREQ : integer := (MHz * clk_mul) / clk_div;

component altdqs_stxii
	generic (width : integer := 2; Mhz : integer := 100);
	PORT
	(
		dqs_datain_h		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		dqs_datain_l		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		inclk		: IN STD_LOGIC ;
		oe		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		outclk		: IN STD_LOGIC_VECTOR (width-1 downto 0);
		dqinclk		: OUT STD_LOGIC_VECTOR (width-1 downto 0);
		dqs_padio		: INOUT STD_LOGIC_VECTOR (width-1 downto 0)
	);
END component;

component altdq_stxii
         generic (width : integer := 8);
         PORT
         (
                 datain_h       :       IN  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
                 datain_l       :       IN  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
                 dataout_h      :       OUT  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
                 dataout_l      :       OUT  STD_LOGIC_VECTOR (width-1 DOWNTO 0);
                 inclock        :       IN  STD_LOGIC;
                 oe     :       IN  STD_LOGIC := '1';
                 outclock       :       IN  STD_LOGIC;
                 padio  :       INOUT  STD_LOGIC_VECTOR (width-1 DOWNTO 0)
         );
END component;

type phasevec is array (1 to 4) of string(1 to 4);
type phasevecarr is array (13 to 20) of phasevec;

constant phasearr : phasevecarr := (
        ("1923", "2564", "3846", "5769"),   -- 130 MHz
        ("1786", "2381", "3571", "5357"),   -- 140 MHz
        ("1667", "2222", "3333", "5000"),   -- 150 MHz
        ("1562", "2083", "3125", "4687"),   -- 160 MHz
        ("1471", "1961", "2941", "4412"),   -- 160 MHz
        ("1389", "1852", "2778", "4167"),   -- 180 MHz
        ("1316", "1754", "2632", "3947"),   -- 190 MHz
        ("1250", "1667", "2500", "3750"));  -- 200 MHz

  component altpll
  generic (   
    intended_device_family : string := "Stratix" ;
    operation_mode         : string := "NORMAL" ;
    inclk0_input_frequency : positive;
    inclk1_input_frequency : positive;
    width_clock            : positive := 6;
    clk0_multiply_by       : positive := 1;
    clk0_divide_by         : positive := 1;
    clk1_multiply_by       : positive := 1;
    clk1_divide_by         : positive := 1;    
    clk2_multiply_by       : positive := 1;
    clk2_divide_by         : positive := 1;
    clk3_multiply_by       : positive := 1;
    clk3_divide_by         : positive := 1;    
    clk4_multiply_by       : positive := 1;
    clk4_divide_by         : positive := 1;
    clk4_phase_shift       : string := "0";
    clk3_phase_shift       : string := "0";
    clk2_phase_shift       : string := "0";
    clk1_phase_shift       : string := "0";
    clk0_phase_shift       : string := "0"
  );
  port (
    inclk       : in std_logic_vector(1 downto 0);
    clk         : out std_logic_vector(width_clock-1 downto 0);
    locked      : out std_logic
  );
  end component;

component altddio_out
    generic (
        width                  : positive;  -- required parameter
        power_up_high          : string := "OFF";
        oe_reg                 : string := "UNUSED";
        extend_oe_disable      : string := "UNUSED";
        invert_output          : string := "OFF";
        intended_device_family : string := "MERCURY";
        lpm_hint               : string := "UNUSED";
        lpm_type               : string := "altddio_out" );
    port (
        datain_h   : in std_logic_vector(width-1 downto 0);
        datain_l   : in std_logic_vector(width-1 downto 0);
        outclock   : in std_logic;
        outclocken : in std_logic := '1';
        aset       : in std_logic := '0';
        aclr       : in std_logic := '0';
        sset       : in std_logic := '0';
        sclr       : in std_logic := '0';
        oe         : in std_logic := '1';
        dataout    : out std_logic_vector(width-1 downto 0));
end component;

begin
  clkout <= clk_0r;
  vcc <= '1'; gnd <= '0'; gndv <= (others => '0');

  dll : altpll
  generic map (   
    intended_device_family => "Stratix II",
    operation_mode => "NORMAL",
    inclk0_input_frequency   => 1000000/MHz,
    inclk1_input_frequency   => 1000000/MHz,
    clk4_multiply_by => clk_mul, clk4_divide_by => clk_div, 
    clk3_multiply_by => clk_mul, clk3_divide_by => clk_div, 
    clk2_multiply_by => clk_mul, clk2_divide_by => clk_div, 
    clk1_multiply_by => clk_mul, clk1_divide_by => clk_div,
    clk0_multiply_by => clk_mul, clk0_divide_by => clk_div, 
    clk4_phase_shift => phasearr(DDR_FREQ/10)(4),
    clk3_phase_shift => phasearr(DDR_FREQ/10)(3),
    clk2_phase_shift => phasearr(DDR_FREQ/10)(2),
    clk1_phase_shift => phasearr(DDR_FREQ/10)(1)
  )
  port map ( inclk(0) => clk, inclk(1) => gnd,  clk(0) => clk_0r,
        clk(1) => clk_90r, clk(2) => clk_120r, clk(3) => clk_180r,
        clk(4) => clk_270r, clk(5) => clk5, locked => lockl);

  rstdel : process (clk, rst)
  begin
      if rst = '0' then dllrst <= (others => '1');
      elsif rising_edge(clk) then
	dllrst <= dllrst(1 to 3) & '0';
      end if;
  end process;

  rdel : if rstdelay /= 0 generate
    rcnt : process (clk_180r, lockl)
    variable cnt : std_logic_vector(15 downto 0);
    variable vlock, co : std_ulogic;
    begin
      if rising_edge(clk_180r) then
        co := cnt(15);
        vlockl <= vlock;
        if lockl = '0' then
	  cnt := conv_std_logic_vector(rstdelay*DDR_FREQ, 16); vlock := '0';
        else
	  if vlock = '0' then
	    cnt := cnt -1;  vlock := cnt(15) and not co;
	  end if;
        end if;
      end if;
      if lockl = '0' then
	vlock := '0';
      end if;
    end process;
  end generate;

  locked <= lockl when rstdelay = 0 else vlockl;
  lock <= locked;

  ddrbanks : for i in 0 to 1 generate
    ckel(i) <= cke(i) and locked;
    odtl(i) <= odt(i) and locked;
  end generate;

  dqsreg : process (clk_180r)
  begin
    if rising_edge(clk_180r) then
      dqsoe <= (others => not dqsoen);
      dqsnv <= (others => not oen);
    end if;
  end process;
  
  dqinreg : process (clk_120r)
  begin
    if rising_edge(clk_120r) then
      dqin <= dqinl;
    end if;
  end process;
  
  ddrclocks : for i in 0 to 2 generate
    clkpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => vcc, datain_l(0) => gnd, oe => vcc, 
	outclock => clk_0r, dataout(0) => ddr_clk(i));

    clknpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => gnd, datain_l(0) => vcc, oe => vcc, 
	outclock => clk_0r, dataout(0) => ddr_clkb(i));

  end generate;

  -- Control signal pads
  ckepads : altddio_out generic map (width => 2,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h => ckel, datain_l => ckel, oe => vcc, 
	outclock => clk_180r, dataout => ddr_cke);

  csnpads : altddio_out generic map (width => 2,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h => csn, datain_l => csn, oe => vcc, 
	outclock => clk_180r, dataout => ddr_csb);

  odtpads : altddio_out generic map (width => 2,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h => odtl, datain_l => odtl, oe => vcc, 
	outclock => clk_180r, dataout => ddr_odt);

  rasnpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => rasn, datain_l(0) => rasn, oe => vcc, 
	outclock => clk_180r, dataout(0) => ddr_rasb);

  casnpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => casn, datain_l(0) => casn, oe => vcc, 
	outclock => clk_180r, dataout(0) => ddr_casb);

  wenpad : altddio_out generic map (width => 1,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map ( datain_h(0) => wen, datain_l(0) => wen, oe => vcc, 
	outclock => clk_180r, dataout(0) => ddr_web);

  bapads : altddio_out generic map (width => 2+eightbanks,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_h => ba(1+eightbanks downto 0),
        datain_l => ba(1+eightbanks downto 0),
        oe => vcc, 
	outclock => clk_180r, dataout => ddr_ba
    );

  addrpads : altddio_out generic map (width => 14,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_h => addr, datain_l => addr, oe => vcc, 
	outclock => clk_180r, dataout => ddr_ad
    );

  -- DQS generation
  dqsoclk <= (others => clk_0r);
  altdqs : altdqs_stxii generic map (dbits/8, DDR_FREQ)
    port map (dqs_datain_h => dqsnv, dqs_datain_l => gndv,
	inclk => clk_0r, oe => dqsoe, outclk => dqsoclk, 
	dqinclk => dqinclk, dqs_padio => ddr_dqs);

  -- Data bus
  dqoe <= not oen;
  dqgen : for i in 0 to dbits/8-1 generate
    altdq : altdq_stxii generic map (width => 8)
    port map (
	datain_l => dqout(i*8+7 downto i*8),
	datain_h => dqout(i*8+7+dbits downto dbits+i*8), 
	inclock => dqinclk(i),
	outclock => clk_270r, oe => dqoe,
	dataout_h => dqinl(i*8+7 downto i*8),
	dataout_l => dqinl(i*8+7+dbits downto dbits+i*8),
	padio => ddr_dq(i*8+7 downto i*8));
  end generate;

  -- Data mask
  dmpads : altddio_out generic map (width => dbits/8,
	INTENDED_DEVICE_FAMILY => "STRATIXII")
    port map (
	datain_h => dm(dbits/4-1 downto dbits/8),
	datain_l => dm(dbits/8-1 downto 0), oe => vcc, 
	outclock => clk_270r, dataout => ddr_dm
    );

end;

