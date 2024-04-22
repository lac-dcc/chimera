--
-- TBBlue / ZX Spectrum Next project
-- Copyright (c) 2015 - Fabio Belavenuto & Victor Trucco
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

entity dpSRAM_25616 is
	port (
		clk				: in    std_logic;
		-- Porta 0
		porta0_addr		: in    std_logic_vector(18 downto 0);
		porta0_ce		: in    std_logic;
		porta0_oe		: in    std_logic;
		porta0_we		: in    std_logic;
		porta0_din		: in    std_logic_vector(7 downto 0);
		porta0_dout		: out   std_logic_vector(7 downto 0);
		-- Porta 1
		porta1_addr		: in    std_logic_vector(18 downto 0);
		porta1_ce		: in    std_logic;
		porta1_oe		: in    std_logic;
		porta1_we		: in    std_logic;
		porta1_din		: in    std_logic_vector(7 downto 0);
		porta1_dout		: out   std_logic_vector(7 downto 0);
		-- Output to SRAM in board
		sram_addr		: out   std_logic_vector(18 downto 0);
		from_sram		: in std_logic_vector(15 downto 0);
		to_sram			: out std_logic_vector(15 downto 0);
		sram_ub			: out   std_logic;
		sram_lb			: out   std_logic;
		sram_ce_n		: out   std_logic								:= '1';
		sram_oe_n		: out   std_logic								:= '1';
		sram_we_n		: out   std_logic								:= '1'
	);
end entity;

architecture Behavior of dpSRAM_25616 is

	signal sram_a		: std_logic_vector(18 downto 0);
	signal sram_d		: std_logic_vector(7 downto 0);
	signal sram_we		: std_logic;
	signal sram_oe		: std_logic;

begin

--	sram_ce_n	<= '0';					-- sempre ativa
--	sram_oe_n	<= sram_oe;
--	sram_we_n	<= sram_we;
--	sram_ub		<= not sram_a(0);		-- UB = 0 ativa bits 15..8
--	sram_lb		<= sram_a(0);			-- LB = 0 ativa bits 7..0
--	sram_addr	<= sram_a(18 downto 1);
--	sram_data	<= "ZZZZZZZZ" & sram_d	when sram_a(0) = '0' else
	--					sram_d & "ZZZZZZZZ";

	sram_ce_n	<= '0';					-- sempre ativa
	sram_oe_n	<= sram_oe;
	sram_we_n	<= sram_we;
	sram_ub		<= '1';		-- UB = 0 ativa bits 15..8
	sram_lb		<= '0';			-- LB = 0 ativa bits 7..0
	sram_addr	<= sram_a;
	to_sram	<= "ZZZZZZZZ" & sram_d;
					
						
	process (clk)

		variable state		: std_logic	:= '0';
		variable p0_ce		: std_logic_vector(1 downto 0);
		variable p1_ce		: std_logic_vector(1 downto 0);
		variable acesso0	: std_logic;
		variable acesso1	: std_logic;
		variable p0_req	: std_logic									:= '0';
		variable p1_req	: std_logic									:= '0';
		variable p0_we		: std_logic									:= '0';
		variable p1_we		: std_logic									:= '0';
		variable p0_addr	: std_logic_vector(18 downto 0);
		variable p1_addr	: std_logic_vector(18 downto 0);
		variable p0_data	: std_logic_vector(7 downto 0);
		variable p1_data	: std_logic_vector(7 downto 0);

	begin
		if rising_edge(clk) then
			acesso0	:= porta0_ce and (porta0_oe or porta0_we);
			acesso1	:= porta1_ce and (porta1_oe or porta1_we);
			p0_ce		:= p0_ce(0) & acesso0;
			p1_ce		:= p1_ce(0) & acesso1;

			if p0_ce = "01" then							-- detecta rising edge do pedido da porta0
				p0_req	:= '1';							-- marca que porta0 pediu acesso
				p0_we		:= '0';							-- por enquanto eh leitura
				p0_addr	:= porta0_addr;				-- pegamos endereco
				if porta0_we = '1' then					-- se foi gravacao que a porta0 pediu
					p0_we		:= '1';						-- marcamos que eh gravacao
					p0_data	:= porta0_din;				-- pegamos dado
				end if;
			end if;

			if p1_ce = "01" then							-- detecta rising edge do pedido da porta1
				p1_req	:= '1';							-- marca que porta1 pediu acesso
				p1_we		:= '0';							-- por enquanto eh leitura
				p1_addr	:= porta1_addr;				-- pegamos endereco
				if porta1_we = '1' then					-- se foi gravacao que a porta1 pediu
					p1_we		:= '1';						-- marcamos que eh gravacao
					p1_data	:= porta1_din;				-- pegamos dado
				end if;
			end if;

			if state = '0' then							-- Estado 0
				sram_d		<= (others => 'Z');		-- desconectar bus da SRAM
				if p0_req = '1' then						-- pedido da porta0 pendente
					sram_a	<= p0_addr;					-- colocamos o endereco pedido na SRAM
					sram_we	<= '1';
					sram_oe	<= '0';
					if p0_we = '1' then					-- se for gravacao
						sram_d	<= p0_data;				-- damos o dado para a SRAM
						sram_we	<= '0';					-- e dizemos para ela gravar
						sram_oe	<= '1';
					end if;
					state	:= '1';
				elsif p1_req = '1' then					-- pedido da porta1 pendente
					sram_a	<= p1_addr;					-- colocamos o endereco pedido na SRAM
					sram_we	<= '1';
					sram_oe	<= '0';
					if p1_we = '1' then					-- se for gravacao
						sram_d	<= p1_data;				-- damos o dado para a SRAM
						sram_we	<= '0';					-- e dizemos para ela gravar
						sram_oe	<= '1';
					end if;
					state	:= '1';							-- proximo rising do clock vamos para segundo estado
				end if;
			elsif state = '1' then						-- Estado 1
				if p0_req = '1' then						-- pedido da porta0 pendente
					sram_we	<= '1';
					sram_d	<= (others => 'Z');		-- desconectar bus da SRAM
					if p0_we = '0' then					-- se for leitura
						--if sram_a(0) = '0' then			-- pegamos o dado que a SRAM devolveu
							porta0_dout	<= from_sram(7 downto 0);
						--else
						--	porta0_dout	<= sram_data(15 downto 8);
						--end if;
					end if;
					p0_req	:= '0';						-- limpamos a flag de requisicao da porta0
					state		:= '0';						-- voltar para estado 0
					sram_oe	<= '1';
				elsif p1_req = '1' then					-- pedido da porta1 pendente
					sram_we	<= '1';
					sram_d	<= (others => 'Z');		-- desconectar bus da SRAM
					if p1_we = '0' then					-- se for leitura
						--if sram_a(0) = '0' then			-- pegamos o dado que a SRAM devolveu
							porta1_dout	<= from_sram(7 downto 0);
						--else
						--	porta1_dout	<= sram_data(15 downto 8);
						--end if;
					end if;
					p1_req	:= '0';						-- limpamos a flag de requisicao da porta1
					state		:= '0';						-- voltar para estado 0
					sram_oe	<= '1';
				end if;
			end if;
		end if;
	end process;

end;