-------------------------------------------------------
-- Author: Hugues CREUSY
--February 2004
-- VHDL model
-- project: M25P16 50 MHz,
-- release: 1.2
-----------------------------------------------------
-- Unit    : ACDC_check_pkg
-----------------------------------------------------


-------------------------------------------------------------
-- These VHDL models are provided "as is" without warranty
-- of any kind, included but not limited to, implied warranty
-- of merchantability and fitness for a particular purpose.
-------------------------------------------------------------


--------------------------------------------------------------------------
--
--					ACDC CHECK			--
--
--------------------------------------------------------------------------

LIBRARY IEEE ;
    USE IEEE.std_logic_1164.ALL;
LIBRARY STD;
	USE STD.textio.ALL;

--------------------------------------------------------------------------
--				ENTITY	
--------------------------------------------------------------------------
-- This entity receives SPI port signals and one signal write operation
-- from the internal logic
--------------------------------------------------------------------------

Entity ACDC_check is
generic (	Tc: TIME;
		Tr: TIME;
		tSLCH: TIME;
		tCHSL: TIME;
		tCH : TIME;
		tCL : TIME;
		tDVCH: TIME;
		tCHDX: TIME;
		tCHSH : TIME;
		tSHCH: TIME;
		tSHSL: TIME;
		tHLCH: TIME;
		tCHHH: TIME ;
		tHHCH: TIME;
		tCHHL: TIME;
		tVSL: TIME ;	
		tPUW: TIME ;	
		tWHSL: TIME;         
		tSHWL: TIME;          
		Vwi: REAL;		
		Vccmin: REAL;		
		Vccmax: REAL 
);
port (VCC: IN REAL; C, D, S, HOLD : IN std_logic;
	write_op,read_op: IN boolean;
        wrsr: IN boolean;
        srwd_wrsr: IN boolean;
        write_protect: IN boolean;
	Power_up: OUT boolean
	);
END ACDC_check;

--------------------------------------------------------------
--				ARCHITECTURE
--------------------------------------------------------------
-- Several processes test and verify AC/DC characteristics
-- and timings
--------------------------------------------------------------

ARCHITECTURE spy OF ACDC_check IS
SIGNAL VCCmin_ok,Vwi_ok: boolean:=false;
SIGNAL high_time,low_time: TIME:=100 ns;
SIGNAL t_c_rise,t_c_fall: TIME:=100 ns;  
SIGNAL t_write_protect_fall: TIME:=0 ns; 
SIGNAL t_s_rise, t_s_fall: TIME:= 0 ns;
BEGIN

---------------------------------------------------
-- This process checks Vcc level:
-- VCCmin<VCC<VCCmax
-- VCC>Vwi
---------------------------------------------------
VCC_watch: PROCESS
BEGIN
WAIT ON VCC;

IF (VCC>VCCmax) THEN
	REPORT "VCC>VCCmax no more instructions guaranteed"
	severity ERROR;
END IF;

IF ((VCC>=Vccmin) AND (VCC'last_value<Vccmin)) THEN
	Vccmin_ok <= true;
END IF;

IF ((VCC<=Vccmin) AND (VCC'last_value>Vccmin)) THEN
	Vccmin_ok <= false;
	IF write_op THEN 
		REPORT "VCC<VCCmin : write cycle not guaranteed"
		severity ERROR;
	ELSE  REPORT "VCC<VCCmin : no more instructions guaranteed"
		severity WARNING;
	END IF;
END IF;

IF ((VCC>=Vwi) AND (VCC'last_value<Vwi)) THEN
	Vwi_ok <= true;
	Power_up<=true;
END IF;
IF ((VCC<=Vwi) AND (VCC'last_value>Vwi)) THEN
	Vwi_ok <= false;
	Power_up<=false;
	IF write_op THEN 
		REPORT "VCC<Vwi and write cycle in progress: data corrupted"
		severity FAILURE;
	ELSE  REPORT "VCC<Vwi: the chip is now reset"
		severity WARNING;
	END IF;

END IF;

END PROCESS VCC_watch;

------------------------------------------------------------------------
-- This process checks that no write instruction is sent during power up
------------------------------------------------------------------------
PUW:PROCESS
BEGIN
WAIT ON write_op;
IF (write_op) THEN
	ASSERT (Vwi_ok AND (Vwi_ok'stable(tPUW)))
	REPORT "No write instruction is allowed until a time delay of tPUW"
	severity ERROR;
END IF;
END PROCESS PUW;

----------------------------------------------
-- This process checks pulses length on pin /S
----------------------------------------------
SHSL_watch:PROCESS
VARIABLE t0,t1:TIME:= 0 ns;
BEGIN
WAIT ON S;
IF ( S='1') THEN
	t0:=now;
	t_s_rise<=t0;  
	WAIT UNTIL (S'event AND S='0');
	t1:=now;
	t_s_fall<=t1;  
	IF ((t1-t0)<tSHSL) THEN
		REPORT "tSHSL condition violated"
		severity ERROR;
	END IF;
END IF;
END PROCESS SHSL_watch;

---------------------------------------------------------------
-- This process checks select setup and hold timings     
-- and Vccmin to select low timing
---------------------------------------------------------------
S_watch1:PROCESS
VARIABLE t:TIME:=0 ns;
BEGIN
WAIT ON S;

 IF (S='0' AND HOLD/='0') THEN
	ASSERT (Vwi_ok)
	REPORT "VCC<Vwi: chip is on reset mode and will not respond";

	IF (NOT Vccmin_ok) THEN
		REPORT "Vcc<Vccmin: operation not guaranteed"
		severity ERROR;
	ELSIF (Vccmin_ok AND (NOT Vccmin_ok'stable(tVSL))) THEN
		REPORT "Vcc must be greater than VCCmin during at least tVSL before chip is selected"
		severity ERROR;
	END IF;

	ASSERT (Vccmin_ok AND Vccmin_ok'stable(tVSL))
		REPORT "Vcc must be greater than VCCmin during at least tVSL before chip is selected"
		severity ERROR;
	
        t:=now;
	IF ((t-t_c_rise)<tCHSL) THEN  
	   REPORT "tCHSL condition violated"
	   severity ERROR;
	END IF;
	IF (C='1')THEN  
	        WAIT ON C FOR tSLCH;
	        WAIT ON C FOR tSLCH;
	        IF (C'event=true AND C='1' AND(NOW-t)<tSLCH) THEN
	    	REPORT "tSLCH condition violated"
	    	severity ERROR;
		END IF;
	ELSIF (C='0') THEN  
		WAIT ON C FOR tSLCH;
		IF (C'event=true AND (NOW-t)<tSLCH) THEN
		REPORT "tSLCH condition violated"
		severity ERROR;
		END IF;
	END IF;
END IF;
END PROCESS S_watch1;


------------------------------------------------------
-- This process checks deselect setup timings        
------------------------------------------------------
S_watch2:PROCESS
VARIABLE t:TIME:=0 ns;
BEGIN
WAIT ON S;
t:=now;
IF (S='1' AND HOLD /='0') THEN
    IF ((t-t_c_rise)<tCHSH AND NOW/=0 ns) THEN  
    REPORT "tCHSH condition violated"
    severity ERROR;
    END IF;
    IF (C='1') THEN
       WAIT ON C FOR tSHCH;
       WAIT ON C FOR tSHCH;
       IF (C'event=true AND C='1' AND (NOW-t)<tSHCH) THEN
       REPORT "tSHCH condition violated"
       severity ERROR;
       END IF;
    ELSIF (C='0') THEN
	WAIT ON C FOR tSHCH;
	IF (C'event=true AND (NOW-t)<tSHCH) THEN
	REPORT "tSHCH condition violated"
	severity ERROR;
	END IF;
    END IF;
END IF;
END PROCESS S_watch2;

-----------------------------------
-- This process checks hold timings
-----------------------------------
hold_watch:PROCESS
VARIABLE t:TIME:=0 ns;
BEGIN
WAIT ON hold;

 IF (hold='0') THEN
	IF (C='1')THEN
		IF (NOT C'stable(tCHHL)) THEN
			REPORT "tCHHL condition violated"
			severity ERROR;
		END IF;
		t:=NOW;
	ELSIF (C='0') THEN
		WAIT ON C FOR tHLCH;
		IF (C'event=true AND (NOW-t)/=tHLCH) THEN
			REPORT "tHLCH condition violated"
			severity ERROR;
		END IF;
	END IF;
END IF;

IF (hold='1') THEN
	IF (C='1') THEN
		IF (NOT C'stable(tCHHH)) THEN
			REPORT "tCHHH condition violated"
			severity ERROR;
		END IF;
		t:=NOW;
	ELSIF (C='0') THEN
		WAIT ON C FOR tHHCH;
		IF (C'event=true AND (NOW-t)/=tHHCH) THEN
			REPORT "tHHCH condition violated"
			severity ERROR;
		END IF;
	END IF;
END IF;
END PROCESS hold_watch;

----------------------------------------------------
-- This process checks data hold and setup timings
----------------------------------------------------
D_watch: PROCESS
VARIABLE t:TIME:=0 ns;
BEGIN
WAIT ON D;
	IF (C='1')THEN
		IF (NOT C'stable(tCHDX)) THEN
		        IF (S='0'AND HOLD='1') THEN REPORT "tCHDX condition violated"	severity ERROR; END IF;
		END IF;
		t:=NOW;
	ELSIF (C='0') THEN
		WAIT ON C FOR tDVCH;
		IF (C'event=true AND (NOW-t)/=tDVCH) THEN
			IF (S='0'AND HOLD='1') THEN REPORT "tDVCH condition violated"  severity ERROR;  END IF;
		END IF;
	END IF;
END PROCESS D_watch;

---------------------------------------
-- This process checks clock high time
---------------------------------------
C_high_watch: PROCESS
VARIABLE t1:TIME:=0 ns;
BEGIN
WAIT ON C;
IF ( C='1') THEN
    IF (S='1') THEN 
    high_time <= 100 ns;   
    t_c_rise<=now;  
    ELSE  
        t_c_rise<=now;  
        WAIT UNTIL (C'event AND C='0');
        t1:=now;
        high_time<=t1-t_c_rise;
        IF ((t1-t_c_rise)<tCH) THEN
            IF (S='0'AND HOLD='1') THEN  
            REPORT "tCH condition violated"
            severity ERROR;
            END IF;
	END IF;
    END IF;  
END IF;
END PROCESS C_high_watch;

---------------------------------------
-- This process checks clock low time
---------------------------------------
C_low_watch: PROCESS
VARIABLE t1:TIME:=0 ns;
BEGIN
WAIT ON C;
IF ( C='0') THEN
    IF (S='1') THEN 
    low_time <= 100 ns; 
    ELSE  
	t_c_fall<=now;  
	WAIT UNTIL (C'event AND C='1');
	t1:=now;
	low_time <= t1-t_c_fall;
	IF ((t1-t_c_fall)<tCL) THEN
	        IF (S='0'AND HOLD='1') THEN  
		REPORT "tCL condition violated"		
		severity ERROR;
		END IF;
	END IF;
    ENd IF;
END IF;
END PROCESS C_low_watch;
-------------------------------------------------
-- This process checks clock frequency
-------------------------------------------------
freq_watch: PROCESS(high_time,low_time)
BEGIN
IF read_op THEN
	IF ((high_time+low_time)<Tr) THEN
	        IF (S='0' AND HOLD='1') THEN REPORT "Clock frequency condition violated for READ instruction: fR>20MHz" severity ERROR; END IF;
	END IF;
ELSIF ((high_time+low_time)<Tc) THEN
	IF (S='0' AND HOLD='1') THEN REPORT "Clock frequency condition violated: fC>25MHz" 	severity ERROR; END IF;
END IF;
END PROCESS freq_watch;

--------------------------------------------------------------------------
-- This process detects the write_protect negative transitions     
--------------------------------------------------------------------------
write_protect_watch: PROCESS
BEGIN
WAIT ON write_protect;
IF (NOW /= 0 ns) THEN
   IF (NOT write_protect) THEN t_write_protect_fall <= NOW; END IF;
END IF;

END PROCESS write_protect_watch;


--------------------------------------------------------
-- This process checks the TWHSL parameter     
--------------------------------------------------------
TWHSL_watch: PROCESS
BEGIN
WAIT ON srwd_wrsr;
IF (NOW /= 0 ns) THEN
    IF ((t_s_fall - t_write_protect_fall) < tWHSL) THEN
       	REPORT "tWHSL condition violated"
	severity FAILURE;
    END IF;
END IF;
END PROCESS TWHSL_watch;

--------------------------------------------------------
-- This process checks the TSHWL parameter     
--------------------------------------------------------
TSHWL_watch: PROCESS
VARIABLE t0:TIME:=0 ns;
BEGIN
WAIT ON write_protect;
IF (NOW /= 0 ns) THEN
      t0 := NOW; 
     IF ( write_protect AND WRSR) THEN
          IF ((t0 -t_s_rise) < tSHWL) THEN  	REPORT "tSHWL condition violated" 	severity FAILURE; END IF;
    END IF;
END IF;
END PROCESS TSHWL_watch;

END SPY;
