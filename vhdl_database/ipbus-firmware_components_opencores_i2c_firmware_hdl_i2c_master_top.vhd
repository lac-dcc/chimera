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
-------------------------------------------------------------------------------
-- Changes at University of bristol:
-- V1.0A|D.G.C   | 5/11     | Changed name and ports to fit OC original
-- --------------------------------------------------------------------    

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity i2c_master_top is
  generic (
		ARST_LVL : integer := 0
		);
  port (
        wb_clk_i : in  std_logic;
        wb_rst_i : in  std_logic;
        arst_i   : in  std_logic;
        wb_adr_i : in  std_logic_vector(2 downto 0);
        wb_dat_i : in  std_logic_vector(7 downto 0);
        wb_dat_o : out std_logic_vector(7 downto 0);
        wb_we_i  : in  std_logic;
        wb_stb_i : in  std_logic;
        wb_cyc_i : in  std_logic;
        wb_ack_o : out std_logic;
        wb_inta_o: out std_logic;
        scl_pad_i: in std_logic;
        scl_pad_o: out std_logic;
        scl_padoen_o: out std_logic;
        sda_pad_i: in std_logic;
        sda_pad_o: out std_logic;
        sda_padoen_o: out std_logic
--        scl      : inout std_logic;
--        sda      : inout std_logic
        );
end;

architecture arch of i2c_master_top is

component i2c_master_bit_ctrl
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
end component;

component i2c_master_byte_ctrl
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
end component;

component i2c_master_registers
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
end component;


signal prer : std_logic_vector(15 downto 0);
signal ctr : std_logic_vector(7 downto 0);
signal txr : std_logic_vector(7 downto 0);
signal rxr : std_logic_vector(7 downto 0);
signal cr : std_logic_vector(7 downto 0);
signal sr : std_logic_vector(7 downto 0);

signal done : std_logic;
signal core_en : std_logic;
signal ien : std_logic;
signal irxack : std_logic;
signal irq_flag : std_logic;
signal i2c_busy : std_logic;
signal i2c_al : std_logic;

signal core_cmd : std_logic_vector(3 downto 0);
signal core_txd : std_logic;
signal core_ack, core_rxd : std_logic;

-- Don't need these signals, since passing them through
-- component interface
--signal scl_pad_i : std_logic;
--signal scl_pad_o : std_logic;
--signal scl_padoen_o : std_logic;
--
--signal sda_pad_i : std_logic;
--signal sda_pad_o : std_logic;
--signal sda_padoen_o : std_logic;

signal rst_i : std_logic;

signal sta : std_logic;
signal sto : std_logic;
signal rd : std_logic;
signal wr : std_logic;
signal ack : std_logic;
signal iack : std_logic;

signal wb_ack_o_int : std_logic;

signal wb_wacc : std_logic;
signal acki : std_logic;

begin

  -- Don't need to copy these signal - passing through
  -- component interface
--scl_pad_i <= scl;
--sda_pad_i <= sda;

rst_i <= arst_i when (ARST_LVL = 0) else NOT(arst_i);

wb_wacc <= wb_cyc_i AND wb_stb_i AND wb_we_i;

sta <= cr(7);
sto <= cr(6);
rd <= cr(5);
wr <= cr(4);
ack <= cr(3);
acki <= cr(0);

core_en <= ctr(7);
ien <= ctr(6);

process(wb_clk_i)
begin
	if rising_edge(wb_clk_i) then
		wb_ack_o_int <= wb_cyc_i AND wb_stb_i AND NOT(wb_ack_o_int);
	end if;
end process;

wb_ack_o <= wb_ack_o_int;

process(wb_clk_i)
begin
	if rising_edge(wb_clk_i) then
		case (wb_adr_i) is
			when "000" => wb_dat_o <= prer(7 downto 0);
			when "001" => wb_dat_o <= prer(15 downto 8);
			when "010" => wb_dat_o <= ctr;
			when "011" => wb_dat_o <= rxr;
			when "100" => wb_dat_o <= sr;
			when "101" => wb_dat_o <= txr;
			when "110" => wb_dat_o <= cr;
			when "111" => wb_dat_o <= "00000000";
			when others => NULL;
		end case;
	end if;
end process;

process(wb_clk_i,rst_i)
begin
	if (rst_i = '0') then
		wb_inta_o <= '0';
	elsif rising_edge(wb_clk_i) then
		wb_inta_o <= sr(0) AND ien;
	end if;
end process;



byte_controller: i2c_master_byte_ctrl port map(
	clk 		=> wb_clk_i,
	rst			=> wb_rst_i,
	nReset		=> rst_i,
	clk_cnt		=> prer,
	start		=> sta,
	stop		=> sto,
	read		=> rd,
	write		=> wr,
	ack_in		=> ack,
	din			=> txr,
	cmd_ack		=> done,
	ack_out		=> irxack,
	dout		=> rxr,
	i2c_al		=> i2c_al,
	core_cmd	=> core_cmd,
	core_ack	=> core_ack,
	core_txd	=> core_txd,
	core_rxd	=> core_rxd);

bit_controller: i2c_master_bit_ctrl port map(
	clk			=> wb_clk_i,
	rst			=> wb_rst_i,
	nReset		=> rst_i,
	ena			=> core_en,
	clk_cnt		=> prer,
	cmd			=> core_cmd,
	cmd_ack		=> core_ack,
	busy		=> i2c_busy,
	al			=> i2c_al,
	din			=> core_txd,
	dout		=> core_rxd,
	scl_i		=> scl_pad_i,
	scl_o		=> scl_pad_o,
	scl_oen		=> scl_padoen_o,
	sda_i		=> sda_pad_i,
	sda_o		=> sda_pad_o,
	sda_oen		=> sda_padoen_o);

registers: i2c_master_registers port map(
	wb_clk_i	=> wb_clk_i,
	rst_i		=> rst_i,
	wb_rst_i	=> wb_rst_i,
	wb_dat_i	=> wb_dat_i,
	wb_wacc		=> wb_wacc,
	wb_adr_i	=> wb_adr_i,
	i2c_al		=> i2c_al,
	i2c_busy	=> i2c_busy,
	done		=> done,
	irxack		=> irxack,
	prer		=> prer,
	ctr			=> ctr,
	txr			=> txr,
	cr			=> cr,
	sr			=> sr);


-- edited from Lattice original to pass uni-directional signals
--scl <= scl_pad_o when (scl_padoen_o = '0') else 'Z';
--sda <= sda_pad_o when (sda_padoen_o = '0') else 'Z';

end arch;
