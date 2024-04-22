----------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<
----------------------------------------------------------------------
--///////////////////////////////////////////////////////////////////
--//                                                             ////
--//  WISHBONE rev.B2 compliant I2C Master registers             ////
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
-- --------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity i2c_master_registers is
  port (
        wb_clk_i : in  std_logic;
        rst_i    : in  std_logic;
        wb_rst_i : in  std_logic;
        wb_dat_i : in  std_logic_vector(7 downto 0);
        wb_adr_i : in  std_logic_vector(2 downto 0);
        wb_wacc  : in  std_logic;
        i2c_al   : in  std_logic;
        i2c_busy : in  std_logic;
        done     : in  std_logic;
        irxack   : in  std_logic;
        prer     : out std_logic_vector(15 downto 0);	-- clock prescale register
        ctr      : out std_logic_vector(7 downto 0);	-- control register
        txr      : out std_logic_vector(7 downto 0);	-- transmit register
        cr       : out std_logic_vector(7 downto 0);	-- command register
        sr       : out std_logic_vector(7 downto 0)		-- status register
        );
end;

architecture arch of i2c_master_registers is


signal ctr_int : std_logic_vector(7 downto 0);
signal cr_int : std_logic_vector(7 downto 0);

signal al : std_logic;			-- status register arbitration lost bit
signal rxack : std_logic;		-- received aknowledge from slave
signal tip : std_logic;			-- transfer in progress
signal irq_flag : std_logic;	-- interrupt pending flag

begin

-- generate prescale regisres, control registers, and transmit register
process(wb_clk_i,rst_i)
begin
	if (rst_i = '0') then
		prer <= (others => '1');
		ctr_int <= (others => '0');
		txr <= (others => '0');
	elsif rising_edge(wb_clk_i) then
		if (wb_rst_i = '1') then
			prer <= (others => '1');
			ctr_int <= (others => '0');
			txr <= (others => '0');
		elsif (wb_wacc = '1') then
			case (wb_adr_i) is
				when "000" => prer(7 downto 0)	<= wb_dat_i;
				when "001" => prer(15 downto 8)	<= wb_dat_i;
				when "010" => ctr_int			<= wb_dat_i;
				when "011" => txr				<= wb_dat_i;
				when others => NULL;
			end case;
		end if;
	end if;
end process;

ctr <= ctr_int;

-- generate command register (special case)
process(wb_clk_i,rst_i)
begin
	if (rst_i = '0') then
		cr_int <= (others => '0');
	elsif rising_edge(wb_clk_i) then
		if (wb_rst_i = '1') then
			cr_int <= (others => '0');
		elsif (wb_wacc = '1') then
			if ((ctr_int(7) = '1') AND (wb_adr_i = "100")) then
				cr_int <= wb_dat_i;
			end if;
		else
			if ((done = '1') OR (i2c_al = '1')) then
				cr_int(7 downto 4) <= "0000";	-- clear command b
			end if;							-- or when aribitr
			cr_int(2 downto 1) <= "00";			-- reserved bits
			cr_int(0) <= '0';					-- clear IRQ_ACK b
		end if;
	end if;
end process;

cr <= cr_int;

-- generate status register block + interrupt request signal
-- each output will be assigned to corresponding sr register locations on top level
process(wb_clk_i,rst_i)
begin
	if (rst_i = '0') then
		al 			<= '0';
		rxack 		<= '0';
		tip 		<= '0';
		irq_flag	<= '0';
	elsif rising_edge(wb_clk_i) then
		if (wb_rst_i = '1') then
			al 			<= '0';
			rxack 		<= '0';
			tip 		<= '0';
			irq_flag	<= '0';
		else
			al			<= i2c_al OR (al AND NOT(cr_int(7)));
			rxack		<= irxack;
			tip			<= (cr_int(5) OR cr_int(4));
			irq_flag	<= (done OR i2c_al OR irq_flag) AND NOT(cr_int(0)); -- interrupt request flag is always generated
		end if;
	end if;
end process;

sr(7)	 		<= rxack;
sr(6)			<= i2c_busy;
sr(5)			<= al;
sr(4 downto 2)	<= "000"; -- reserved
sr(1)			<= tip;
sr(0)			<= irq_flag;


end arch;
