----------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<
----------------------------------------------------------------------
--///////////////////////////////////////////////////////////////////
--//                                                             ////
--//  WISHBONE rev.B2 compliant I2C Master byte-controller        ////
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
-----------------------------------------------------------------------
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity i2c_master_byte_ctrl is
  port (
        clk      : in  std_logic;						-- master clock
        rst      : in  std_logic;						-- synchronous active high reset
        nReset   : in  std_logic;						-- asynchronous active low reset
        clk_cnt  : in  std_logic_vector(15 downto 0);	-- 4x SCL
		-- control inputs
        start    : in  std_logic;
        stop     : in  std_logic;
        read     : in  std_logic;
        write    : in  std_logic;
        ack_in   : in  std_logic;
        din      : in  std_logic_vector(7 downto 0);
		-- status outputs
        cmd_ack  : out std_logic;
        ack_out  : out std_logic;						-- i2c clock line input
        dout     : out std_logic_vector(7 downto 0);
        i2c_al   : in  std_logic;
		-- signals for bit_controller
		core_cmd : out std_logic_vector(3 downto 0);
		core_txd : out std_logic;
		core_rxd : in  std_logic;
		core_ack : in  std_logic
        );
end;

architecture arch of i2c_master_byte_ctrl is

constant I2C_CMD_NOP	: std_logic_vector(3 downto 0) := "0000";
constant I2C_CMD_START	: std_logic_vector(3 downto 0) := "0001";
constant I2C_CMD_STOP	: std_logic_vector(3 downto 0) := "0010";
constant I2C_CMD_WRITE	: std_logic_vector(3 downto 0) := "0100";
constant I2C_CMD_READ	: std_logic_vector(3 downto 0) := "1000";


constant ST_IDLE	: std_logic_vector(4 downto 0) := "00000";
constant ST_START	: std_logic_vector(4 downto 0) := "00001";
constant ST_READ	: std_logic_vector(4 downto 0) := "00010";
constant ST_WRITE	: std_logic_vector(4 downto 0) := "00100";
constant ST_ACK		: std_logic_vector(4 downto 0) := "01000";
constant ST_STOP	: std_logic_vector(4 downto 0) := "10000";

signal c_state : std_logic_vector(4 downto 0);


signal go : std_logic;
signal dcnt : std_logic_vector(2 downto 0);
signal cnt_done : std_logic;

signal sr : std_logic_vector(7 downto 0); --8bit shift register
signal shift, ld : std_logic;

signal cmd_ack_int : std_logic;


begin

go <= '1' when (((read = '1') OR (write = '1') OR (stop = '1')) AND (cmd_ack_int = '0')) else '0';
dout <= sr;

-- generate shift register
process(clk,nReset)
begin
	if (nReset = '0') then
		sr <= (others => '0');
	elsif rising_edge(clk) then
		if (rst = '1') then
			sr <= (others => '0');
		elsif (ld = '1') then
			sr <= din;
		elsif (shift = '1') then
			sr <= sr(6 downto 0) & core_rxd;
		end if;
	end if;
end process;

-- generate counter
process(clk,nReset)
begin
	if (nReset = '0') then
		dcnt <= (others => '0');
	elsif rising_edge(clk) then
		if (rst = '1') then
			dcnt <= (others => '0');
		elsif (ld = '1') then
			dcnt <= "111";
		elsif (shift = '1') then
			dcnt <= dcnt - '1';
		end if;
	end if;
end process;

cnt_done <= '1' when (dcnt = "000") else '0';

-- state machine
process(clk,nReset)
begin
	if (nReset = '0') then
		core_cmd <= I2C_CMD_NOP;
		core_txd <= '0';
		shift <= '0';
		ld <= '0';
		cmd_ack_int <= '0';
		c_state <= ST_IDLE;
		ack_out <= '0';
	elsif rising_edge(clk) then
		if ((rst = '1') OR (i2c_al = '1')) then
			core_cmd <= I2C_CMD_NOP;
			core_txd <= '0';
			shift <= '0';
			ld <= '0';
			cmd_ack_int <= '0';
			c_state <= ST_IDLE;
			ack_out <= '0';
		else
			-- initially reset all signals
			core_txd <= sr(7);
			shift <= '0';
			ld <= '0';
			cmd_ack_int <= '0';

			case (c_state) is
				when ST_IDLE =>
						if (go = '1') then
							if (start = '1') then
								c_state <= ST_START;
								core_cmd <= I2C_CMD_START;
							elsif (read = '1') then
								c_state <= ST_READ;
								core_cmd <= I2C_CMD_READ;
							elsif (write = '1') then
								c_state <= ST_WRITE;
								core_cmd <= I2C_CMD_WRITE;
							else
								c_state <= ST_STOP;
								core_cmd <= I2C_CMD_STOP;
							end if;
							ld <= '1';
						end if;
				when ST_START =>
						if (core_ack = '1') then
							if (read = '1') then
								c_state <= ST_READ;
								core_cmd <= I2C_CMD_READ;
							else
								c_state <= ST_WRITE;
								core_cmd <= I2C_CMD_WRITE;
							end if;
							ld <= '1';
						end if;
				when ST_WRITE =>
						if (core_ack = '1') then
							if (cnt_done = '1') then
								c_state <= ST_ACK;
								core_cmd <= I2C_CMD_READ;
							else
								c_state <= ST_WRITE;		-- stay in same state
								core_cmd <= I2C_CMD_WRITE;	-- write next bit
								shift <= '1';
							end if;
						end if;
				when ST_READ =>
						if (core_ack = '1') then
							if (cnt_done = '1') then
								c_state <= ST_ACK;
								core_cmd <= I2C_CMD_WRITE;
							else
								c_state <= ST_READ;			-- stay in same state
								core_cmd <= I2C_CMD_READ;	-- read next bit
								shift <= '1';
							end if;
							shift <= '1';
							core_txd <= ack_in;
						end if;
				when ST_ACK =>
						if (core_ack = '1') then
							if (stop = '1') then
								c_state <= ST_STOP;
								core_cmd <= I2C_CMD_STOP;
							else
								c_state <= ST_IDLE;
								core_cmd <= I2C_CMD_NOP;
								-- generate command acknowledge signal
								cmd_ack_int <= '1';
							end if;
							-- assign ack_out output to bit_controller_rxd (contains last received bit)
							ack_out <= core_rxd;
							core_txd <= '1';
						else
							core_txd <= ack_in;
						end if;
				when ST_STOP =>
						if (core_ack = '1') then
							c_state <= ST_IDLE;
							core_cmd <= I2C_CMD_NOP;
							-- generate command acknowledge signal
							cmd_ack_int <= '1';
						end if;
				when others => NULL;
			end case;
		end if;
	end if;
end process;

cmd_ack <= cmd_ack_int;

end arch;
