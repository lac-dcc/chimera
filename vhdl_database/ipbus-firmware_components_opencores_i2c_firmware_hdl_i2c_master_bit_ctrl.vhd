----------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<
----------------------------------------------------------------------
--///////////////////////////////////////////////////////////////////
--//                                                             ////
--//  WISHBONE rev.B2 compliant I2C Master bit-controller        ////
--//                                                             ////
--//                                                             ////
--//  Author: Richard Herveille                                  ////
--//          richard@asics.ws                                   ////
--//          www.asics.ws                                       ////
--//                                                             ////
--//  Downloaded from: http://www.opencores.org/projects/i2c/    ////
--//                                                             ////
--///////////////////////////////////////////////////////////////////
--//                                                             ////
--// Copyright (C) 2001 Richard Herveille                        ////
--//                    richard@asics.ws                         ////
--//                                                             ////
--// This source file may be used and distributed without        ////
--// restriction provided that this copyright statement is not   ////
--// removed from the file and that any derivative work contains ////
--// the original copyright notice and the associated disclaimer.////
--//                                                             ////
--//     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
--// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
--// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
--// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
--// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
--// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
--// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
--// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
--// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
--// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
--// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
--// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
--// POSSIBILITY OF SUCH DAMAGE.                                 ////
--//                                                             ////
--///////////////////////////////////////////////////////////////////
-- --------------------------------------------------------------------              
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<              
-- --------------------------------------------------------------------              
-- Copyright (c) 2008 - 2010 by Lattice Semiconductor Corporation                    
-- --------------------------------------------------------------------                            
--                                                                                   
-- Disclaimer:                                                                       
--                                                                                   
-- This VHDL or Verilog source code is intended as a design reference                
-- which illustrates how these types of functions can be implemented.                
-- It is the user's responsibility to verify their design for                        
-- consistency and functionality through the use of formal                           
-- verification methods. Lattice Semiconductor provides no warranty                  
-- regarding the use or functionality of this code.                                  
--                                                                                   
-- --------------------------------------------------------------------              
--                                                                                   
-- Lattice Semiconductor Corporation                                                 
-- 5555 NE Moore Court                                                               
-- Hillsboro, OR 97214                                                               
-- U.S.A                                                                             
--                                                                                   
-- TEL: 1-800-Lattice (USA and Canada)                                               
-- 503-268-8001 (other locations)                                                    
--                                                                                   
-- web: http://www.latticesemi.com/                                                  
-- email: techsupport@latticesemi.com                                                
--                                                                                   
-- --------------------------------------------------------------------              
-- Code Revision History :                                                           
-- --------------------------------------------------------------------              
-- Ver: | Author |Mod. Date |Changes Made:                                           
-- V1.0 |K.P.    | 7/09     | Initial ver for VHDL                                       
-- 			    | converted from LSC ref design RD1046                   
-- --------------------------------------------------------------------              


--/////////////////////////////////////
--// Bit controller section
--/////////////////////////////////////
--//
--// Translate simple commands into SCL/SDA transitions
--// Each command has 5 states, A/B/C/D/idle
--//
--// start:	SCL	~~~~~~~~~~\____
--//	SDA	~~~~~~~~\______
--//		 x | A | B | C | D | i
--//
--// repstart	SCL	____/~~~~\___
--//	SDA	__/~~~\______
--//		 x | A | B | C | D | i
--//
--// stop	SCL	____/~~~~~~~~
--//	SDA	==\____/~~~~~
--//		 x | A | B | C | D | i
--//
--//- write	SCL	____/~~~~\____
--//	SDA	==X=========X=
--//		 x | A | B | C | D | i
--//
--//- read	SCL	____/~~~~\____
--//	SDA	XXXX=====XXXX
--//		 x | A | B | C | D | i
--//
--
--// Timing:     Normal mode      Fast mode
--///////////////////////////////////////////////////////////////////////
--// Fscl        100KHz           400KHz
--// Th_scl      4.0us            0.6us   High period of SCL
--// Tl_scl      4.7us            1.3us   Low period of SCL
--// Tsu:sta     4.7us            0.6us   setup time for a repeated start condition
--// Tsu:sto     4.0us            0.6us   setup time for a stop conditon
--// Tbuf        4.7us            1.3us   Bus free time between a stop and start condition
--//
--
-- --------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity i2c_master_bit_ctrl is
  port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        nReset   : in  std_logic;
        clk_cnt  : in  std_logic_vector(15 downto 0);	-- clock prescale value
        ena      : in  std_logic;						-- core enable signal
        cmd      : in  std_logic_vector(3 downto 0);
        cmd_ack  : out std_logic;						-- command complete acknowledge
        busy     : out std_logic;						-- i2c bus busy
        al       : out std_logic;						-- i2c bus arbitration lost
        din      : in  std_logic;
        dout     : out std_logic;
        scl_i    : in  std_logic;						-- i2c clock line input
        scl_o    : out std_logic;						-- i2c clock line output
        scl_oen  : out std_logic;						-- i2c clock line output enable (active low)
        sda_i    : in  std_logic;						-- i2c data line input
        sda_o    : out std_logic;						-- i2c data line output
        sda_oen  : out std_logic						-- i2c data line output enable (active low)
        );
        
 
end;

architecture arch of i2c_master_bit_ctrl is

--attribute UGROUP:string;                                   
--attribute UGROUP of arch : label is "bit_group"; 


signal sSCL, sSDA : std_logic;	-- synchronized SCL and SDA inputs
signal dscl_oen : std_logic;	-- delayed scl_oen
signal sda_chk : std_logic;		-- check SDA output (Multi-master arbitration)
signal clk_en : std_logic;		-- clock generation signals
signal slave_wait : std_logic;

-- bus status controller signals
signal dSCL,dSDA : std_logic;
signal sta_condition : std_logic;
signal sto_condition : std_logic;
signal cmd_stop : std_logic;

signal cnt : std_logic_vector(15 downto 0);	-- clock divider counter

signal scl_oen_int : std_logic;
signal sda_oen_int : std_logic;
signal busy_int : std_logic;
signal al_int : std_logic;

-- state machine variable
signal c_state : std_logic_vector(16 downto 0);

constant idle 		: std_logic_vector(16 downto 0) := "00000000000000000";
constant start_a 	: std_logic_vector(16 downto 0) := "00000000000000001";
constant start_b 	: std_logic_vector(16 downto 0) := "00000000000000010";
constant start_c 	: std_logic_vector(16 downto 0) := "00000000000000100";
constant start_d 	: std_logic_vector(16 downto 0) := "00000000000001000";
constant start_e 	: std_logic_vector(16 downto 0) := "00000000000010000";
constant stop_a 	: std_logic_vector(16 downto 0) := "00000000000100000";
constant stop_b	 	: std_logic_vector(16 downto 0) := "00000000001000000";
constant stop_c	 	: std_logic_vector(16 downto 0) := "00000000010000000";
constant stop_d 	: std_logic_vector(16 downto 0) := "00000000100000000";
constant rd_a	 	: std_logic_vector(16 downto 0) := "00000001000000000";
constant rd_b 		: std_logic_vector(16 downto 0) := "00000010000000000";
constant rd_c 		: std_logic_vector(16 downto 0) := "00000100000000000";
constant rd_d 		: std_logic_vector(16 downto 0) := "00001000000000000";
constant wr_a 		: std_logic_vector(16 downto 0) := "00010000000000000";
constant wr_b 		: std_logic_vector(16 downto 0) := "00100000000000000";
constant wr_c 		: std_logic_vector(16 downto 0) := "01000000000000000";
constant wr_d 		: std_logic_vector(16 downto 0) := "10000000000000000";

constant I2C_CMD_NOP	: std_logic_vector(3 downto 0) := "0000";
constant I2C_CMD_START	: std_logic_vector(3 downto 0) := "0001";
constant I2C_CMD_STOP	: std_logic_vector(3 downto 0) := "0010";
constant I2C_CMD_WRITE	: std_logic_vector(3 downto 0) := "0100";
constant I2C_CMD_READ	: std_logic_vector(3 downto 0) := "1000";

begin

scl_oen <= scl_oen_int;
sda_oen <= sda_oen_int;

-- whenever the slave is not ready it can delay the cycle by pulling SCL low
-- delay scl_oen
process(clk)
begin
	if rising_edge(clk) then
		dscl_oen <= scl_oen_int;
	end if;
end process;

slave_wait <= '1' when ((dscl_oen = '1') AND (sSCL = '0')) else '0';

-- generate clk enable signal
process(clk,nReset)
begin
	if (nReset = '0') then
		cnt <= (others => '0');
		clk_en <= '1';
	elsif rising_edge(clk) then
		if (rst = '1') then
			cnt <= (others => '0');
			clk_en <= '1';
		elsif ((cnt = "0000000000000000") OR (ena = '0')) then
			cnt <= clk_cnt;
			clk_en <= '1';
		elsif (slave_wait = '1') then
			cnt <= cnt;
			clk_en <= '0';
		else
			cnt <= cnt - '1';
			clk_en <= '0';
		end if;
	end if;
end process;

-- synchronize SCL and SDA inputs
-- reduce metastability risc
process(clk,nReset)
begin
	if (nReset = '0') then
		sSCL <= '1';
		sSDA <= '1';
		dSCL <= '1';
		dSDA <= '1';
	elsif rising_edge(clk) then
		if (rst = '1') then
			sSCL <= '1';
			sSDA <= '1';
			dSCL <= '1';
			dSDA <= '1';
		else
			dSCL <= sSCL;
			dSDA <= sSDA;
                        -- Don't need to treat 'H' if separate I and O
			-- if ((scl_i = '1') OR (scl_i = 'H')) then
                        if (scl_i = '1')  then
				sSCL <= '1';
			else
				sSCL <= '0';
			end if;
			-- if ((sda_i = '1') OR (sda_i = 'H')) then
                        if (sda_i = '1')  then
				sSDA <= '1';
			else
				sSDA <= '0';
			end if;
		end if;
	end if;
end process;

-- detect start condition => detect falling edge on SDA while SCL is high
-- detect stop condition => detect rising edge on SDA while SCL is high
process(clk,nReset)
begin
	if (nReset = '0') then
		sta_condition <= '0';
		sto_condition <= '0';
	elsif rising_edge(clk) then
		if (rst = '1') then
			sta_condition <= '0';
			sto_condition <= '0';
		else
			sta_condition <= NOT(sSDA) AND dSDA AND sSCL;
			sto_condition <= sSDA AND NOT(dSDA) AND sSCL;
		end if;
	end if;
end process;

-- generate i2c bus busy signal
process(clk,nReset)
begin
	if (nReset = '0') then
		busy_int <= '0';
	elsif rising_edge(clk) then
		if (rst = '1') then
			busy_int <= '0';
		else
			busy_int <= (sta_condition OR busy_int) AND NOT(sto_condition);
		end if;
	end if;
end process;

busy <= busy_int;

-- generate arbitration lost signal
-- aribitration lost when:
-- 1) master drives SDA high, but the i2c bus is low
-- 2) stop detected while not requested
process(clk,nReset)
begin
	if (nReset = '0') then
		cmd_stop <= '0';
	elsif rising_edge(clk) then
		if (rst = '1') then
			cmd_stop <= '0';
		elsif (clk_en = '1') then
			if (cmd = I2C_CMD_STOP) then
				cmd_stop <= '1';
			else
				cmd_stop <= '0';
			end if;
		end if;
	end if;
end process;

process(clk,nReset)
begin
	if (nReset = '0') then
		al_int <= '0';
	elsif rising_edge(clk) then
		if (rst = '1') then
			al_int <= '0';
		else
			if (((sda_chk = '1') AND (sSDA = '0') AND (sda_oen_int = '1')) OR ((c_state /= idle) AND (sto_condition = '1') AND (cmd_stop = '0'))) then
				al_int <= '1';
			else
				al_int <= '0';
			end if;
		end if;
	end if;
end process;

al <= al_int;


-- generate dout signal (store SDA on rising edge of SCL)
process(clk)
begin
	if rising_edge(clk) then
		if ((sSCL = '1') AND (dSCL = '0')) then
			dout <= sSDA;
		end if;
	end if;
end process;


--generate state machine
process(clk,nReset)
begin
	if (nReset = '0') then
		c_state <= idle;
		cmd_ack <= '0';
		scl_oen_int <= '1';
		sda_oen_int <= '1';
		sda_chk <= '0';
	elsif rising_edge(clk) then
		if ((rst = '1') OR (al_int = '1')) then
			c_state <= idle;
			cmd_ack <= '0';
			scl_oen_int <= '1';
			sda_oen_int <= '1';
			sda_chk <= '0';
		else
			cmd_ack <= '0';	--default no command acknowledge + assert cmd_ack only 1clk cycle
			if (clk_en = '1') then
				case (c_state) is
					when idle =>
							case (cmd) is
								when I2C_CMD_START	=> c_state <= start_a;
								when I2C_CMD_STOP	=> c_state <= stop_a;
								when I2C_CMD_WRITE	=> c_state <= wr_a;
								when I2C_CMD_READ	=> c_state <= rd_a;
								when others			=> c_state <= idle;
							end case;

							scl_oen_int <= scl_oen_int;  -- keep SCL in same state
							sda_oen_int <= sda_oen_int;  -- keep SDA in same state
							sda_chk <= '0';              -- don't check SDA output
					when start_a =>          -- start
							c_state <= start_b;
							scl_oen_int <= scl_oen_int;  -- keep SCL in same state
							sda_oen_int <= '1';          -- set SDA high
							sda_chk <= '0';              -- don't check SDA output
					when start_b =>
							c_state <= start_c;
							scl_oen_int <= '1';          -- set SCL high
							sda_oen_int <= '1';          -- keep SDA high
							sda_chk <= '0';              -- don't check SDA output
					when start_c =>
							c_state <= start_d;
							scl_oen_int <= '1';          -- keep SCL high
							sda_oen_int <= '0';          -- set SDA low
							sda_chk <= '0';              -- don't check SDA output
					when start_d =>
							c_state <= start_e;
							scl_oen_int <= '1';          -- keep SCL high
							sda_oen_int <= '0';          -- keep SDA low
							sda_chk <= '0';              -- don't check SDA output
					when start_e =>
							c_state <= idle;
							cmd_ack <= '1';
							scl_oen_int <= '0';          -- set SCL low
							sda_oen_int <= '0';          -- keep SDA low
							sda_chk <= '0';              -- don't check SDA output
					when stop_a =>          -- stop
							c_state <= stop_b;
							scl_oen_int <= '0';          -- keep SCL low
							sda_oen_int <= '0';          -- set SDA low
							sda_chk <= '0';              -- don't check SDA output
					when stop_b =>
							c_state <= stop_c;
							scl_oen_int <= '1';          -- set SCL high
							sda_oen_int <= '0';          -- keep SDA low
							sda_chk <= '0';              -- don't check SDA output
					when stop_c =>
							c_state <= stop_d;
							scl_oen_int <= '1';          -- keep SCL high
							sda_oen_int <= '0';          -- keep SDA low
							sda_chk <= '0';              -- don't check SDA output
					when stop_d =>
							c_state <= idle;
							cmd_ack <= '1';
							scl_oen_int <= '1';          -- keep SCL high
							sda_oen_int <= '1';          -- set SDA high
							sda_chk <= '0';              -- don't check SDA output
					when rd_a =>          -- read
							c_state <= rd_b;
							scl_oen_int <= '0';          -- keep SCL low
							sda_oen_int <= '1';          -- tri-state SDA
							sda_chk <= '0';              -- don't check SDA output
					when rd_b =>
							c_state <= rd_c;
							scl_oen_int <= '1';          -- set SCL high
							sda_oen_int <= '1';          -- keep SDA tri-stated
							sda_chk <= '0';              -- don't check SDA output
					when rd_c =>
							c_state <= rd_d;
							scl_oen_int <= '1';          -- keep SCL high
							sda_oen_int <= '1';          -- keep SDA tri-stated
							sda_chk <= '0';              -- don't check SDA output
					when rd_d =>
							c_state <= idle;
							cmd_ack <= '1';
							scl_oen_int <= '0';          -- set SCL low
							sda_oen_int <= '1';          -- keep SDA tri-stated
							sda_chk <= '0';              -- don't check SDA output
					when wr_a =>          -- write
							c_state <= wr_b;
							scl_oen_int <= '0';          -- keep SCL low
							sda_oen_int <= din;          -- set SDA
							sda_chk <= '0';              -- don't check SDA output (SCL low)
					when wr_b =>
							c_state <= wr_c;
							scl_oen_int <= '1';          -- set SCL high
							sda_oen_int <= din;          -- keep SDA
							sda_chk <= '1';              -- check SDA output
					when wr_c =>
							c_state <= wr_d;
							scl_oen_int <= '1';          -- keep SCL high
							sda_oen_int <= din;
							sda_chk <= '1';              -- check SDA output
					when wr_d =>
							c_state <= idle;
							cmd_ack <= '1';
							scl_oen_int <= '0';          -- set SCL low
							sda_oen_int <= din;
							sda_chk <= '0';              -- don't check SDA output (SCL low)
					when others => NULL;
				end case;
			end if;
		end if;
	end if;
end process;


-- assign scl and sda output (always gnd)
scl_o <= '0';
sda_o <= '0';

end arch;
