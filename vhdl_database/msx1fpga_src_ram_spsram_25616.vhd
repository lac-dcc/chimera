--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--

library ieee;
use ieee.std_logic_1164.all;

entity spSRAM_25616 is
	port (
		clk_i				: in    std_logic;
		-- sync
		sync_addr_i		    : in    std_logic_vector(18 downto 0);
		sync_ce_n_i		    : in    std_logic;
		sync_oe_n_i		    : in    std_logic;
		sync_we_n_i		    : in    std_logic;
		sync_data_i		    : in    std_logic_vector(7 downto 0);
		sync_data_o		    : out   std_logic_vector(7 downto 0);
		-- Output to SRAM in board
		sram_addr_o			: out   std_logic_vector(17 downto 0);
		sram_data_io		: inout std_logic_vector(15 downto 0);
		sram_ub_n_o			: out   std_logic;
		sram_lb_n_o			: out   std_logic;
		sram_ce_n_o			: out   std_logic							:= '1';
		sram_oe_n_o			: out   std_logic							:= '1';
		sram_we_n_o			: out   std_logic							:= '1'
	);
end entity;

architecture Behavior of spSRAM_25616 is

	signal sram_a_s		: std_logic_vector(18 downto 0);
	signal sram_d_s		: std_logic_vector(7 downto 0);
	signal sram_we_n_s	: std_logic;
	signal sram_oe_n_s	: std_logic;

begin

	sram_ce_n_o			<= '0';					-- sempre ativa
	sram_oe_n_o			<= sram_oe_n_s;
	sram_we_n_o			<= sram_we_n_s;
	sram_ub_n_o			<= not sram_a_s(0);		-- UB = 0 ativa bits 15..8
	sram_lb_n_o			<= sram_a_s(0);			-- LB = 0 ativa bits 7..0
	sram_addr_o			<= sram_a_s(18 downto 1);
	sram_data_io		<= "ZZZZZZZZ" & sram_d_s	when sram_a_s(0) = '0' else
						   sram_d_s & "ZZZZZZZZ";

	main: process (clk_i)

		variable state_v	: std_logic	:= '0';
		variable p_ce_q		: std_logic_vector(1 downto 0);
		variable access_v	: std_logic;
		variable p_req_v	: std_logic									:= '0';
		variable p_we_v		: std_logic									:= '0';
		variable p_addr_v	: std_logic_vector(18 downto 0);
		variable p_data_v	: std_logic_vector(7 downto 0);

	begin
		if rising_edge(clk_i) then
			access_v	:= sync_ce_n_i or (sync_oe_n_i and sync_we_n_i);
			p_ce_q		:= p_ce_q(0) & access_v;

			if p_ce_q = "10" then							-- detecta rising edge do pedido da porta0
				p_req_v		:= '1';							-- marca que porta0 pediu acesso
				p_we_v		:= '0';							-- por enquanto eh leitura
				p_addr_v	:= sync_addr_i;					-- pegamos endereco
				if sync_we_n_i = '0' then					-- se foi gravacao que a porta0 pediu
					p_we_v		:= '1';						-- marcamos que eh gravacao
					p_data_v	:= sync_data_i;				-- pegamos dado
				end if;
			end if;

			if state_v = '0' then							-- Estado 0
				sram_d_s	<= (others => 'Z');				-- desconectar bus da SRAM
				if p_req_v = '1' then						-- pedido da porta0 pendente
					sram_a_s	<= p_addr_v;				-- colocamos o endereco pedido na SRAM
					sram_we_n_s	<= '1';
					sram_oe_n_s	<= '0';
					if p_we_v = '1' then					-- se for gravacao
						sram_d_s	<= p_data_v;			-- damos o dado para a SRAM
						sram_we_n_s	<= '0';					-- e dizemos para ela gravar
						sram_oe_n_s	<= '1';
					end if;
					state_v	:= '1';
				end if;
			elsif state_v = '1' then							-- Estado 1
				if p_req_v = '1' then						-- pedido da porta0 pendente
					sram_we_n_s		<= '1';
					sram_d_s		<= (others => 'Z');		-- desconectar bus da SRAM
					if p_we_v = '0' then					-- se for leitura
						if sram_a_s(0) = '0' then			-- pegamos o dado que a SRAM devolveu
							sync_data_o	<= sram_data_io(7 downto 0);
						else
							sync_data_o	<= sram_data_io(15 downto 8);
						end if;
					end if;
					p_req_v			:= '0';					-- limpamos a flag de requisicao da porta0
					state_v			:= '0';					-- voltar para estado 0
					sram_oe_n_s		<= '1';
				end if;
			end if;
		end if;
	end process;

end;