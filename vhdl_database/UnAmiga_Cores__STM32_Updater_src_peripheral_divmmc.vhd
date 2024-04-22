--
-- Emulation of DivMMC interface
--
-- (C) 2011 Mike Stirling

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divmmc is
	port (
		clock				: in    std_logic;								-- Entrada do clock da CPU
		reset_n			: in    std_logic;								-- Reset geral
		cpu_a				: in    std_logic_vector(15 downto 0);		-- Barramento de endereços da CPU
		enable			: in    std_logic;								-- Portas I/O foram selecionadas
		cpu_wr_n			: in    std_logic;								-- Sinal de escrita da CPU
		cpu_rd_n			: in    std_logic;								-- Sinal de leitura da CPU
		cpu_mreq_n		: in    std_logic;								-- CPU acessando memória
		cpu_m1_n			: in    std_logic;								-- Ciclo M1
		di					: in    std_logic_vector(7 downto 0);		-- Barramento de dados de entrada
		do					: out   std_logic_vector(7 downto 0);		-- Barramento de dados de saída

		-- SD card interface
		spi_cs			: out   std_logic;
		sd_cs0			: out   std_logic;								-- Saída Chip Select para o cartão
		sd_sclk			: out   std_logic;								-- Saida SCK
		sd_mosi			: out   std_logic;								-- Master Out Slave In
		sd_miso			: in    std_logic;								-- Master In Slave Out

		-- Paging control for external RAM/ROM banks
		no_automap		: in    std_logic;								-- Desabilita o auto mapeamento
		disable_nmi		: out   std_logic;								-- Sinal para desabilitar NMI
		ram_bank			: out   std_logic_vector(5 downto 0);		-- 5 bits da página da RAM
		conmem			: out   std_logic;								-- Chavear ROM entre 0x0000 e 0x1FFF
		mapram			: out   std_logic									-- Chavear RAM banco 3 entre 0x0000 e 0x1FFF
	);
end entity;

architecture rtl of divmmc is

	signal sck_delayed	: std_logic;
	signal counter			: unsigned(3 downto 0);
	-- Shift register has an extra bit because we write on the
	-- falling edge and read on the rising edge
	signal shift_reg		: std_logic_vector(8 downto 0);
	signal portE3_reg		: std_logic_vector(7 downto 0);
	signal portEB_reg		: std_logic_vector(7 downto 0);

	signal nmi_enabled	: std_logic;
	signal mapterm			: std_logic;
	signal mapcond			: std_logic;
	signal automap			: std_logic;

begin
	-- Leitura das portas
	DO <= 
		portEB_reg			when cpu_rd_n = '0' and enable = '1' and cpu_a(3 downto 0) = X"B"  else		-- Leitura porta EB 
		(others => '1');

	-- M1 = 0 quando a CPU está lendo um byte da memória e será uma instrução que será decodificada.
	-- M1 = 1 quando a CPU está lendo um byte da memória e não será uma instrução, é um parâmetro.

	-- MAPTERM
	-- Detectar quando a CPU está lendo uma instrução (FETCH) (M1 = 0) em alguns endereços:
	mapterm <= '1' when cpu_m1_n = '0' and no_automap = '0' and
			(cpu_a = X"0000" or cpu_a = X"0008" or cpu_a = X"0038" or 
			 cpu_a = X"0066" or cpu_a = X"04C6" or cpu_a = X"0562")									else '0';

	-- MAPCOND
	-- Recebe 1 quando a CPU está fazendo o fetch da instrução nos endereços de auto-mapeamento ou
	-- imediatamente quando há um FETCH entre 3D00 e 3DFF (vai a 1 para segurar o auto-mapeamento)
	-- Só vai a 0 (deixa de ser 1) se a CPU terminar um FETCH nos endereços de 1FF8 a 1FFF (M1 = 0)
	process (reset_n, cpu_mreq_n)
	begin
		if (reset_n = '0') then
			mapcond <= '0';
		elsif (falling_edge(cpu_mreq_n)) then
			if mapterm = '1' or 
						(cpu_a(15 downto 8) = X"3D" and cpu_m1_n = '0') or
						(mapcond = '1' and (cpu_a(15 downto 3) /= "0001111111111" or cpu_m1_n = '1')) then
				mapcond <= '1';
			else
				mapcond <= '0';
			end if;
		end if;
	end process;

	-- Atrasa 1 ciclo de /MREQ para chavear a região de 0000 a 3FFF do spectrum para a ROM/RAM da DivMMC
	-- /MREQ baixa novamente após o FETCH quando está começando uma nova leitura ou é um ciclo de REFRESH
	-- O auto-mapeamento é feito imediatamente caso o FETCH aconteça entre 3D00 e 3DFF
	process (reset_n, cpu_mreq_n)
	begin
		if (reset_n = '0') then
			automap <= '0';
		elsif (falling_edge(cpu_mreq_n)) then
			if no_automap = '0' and (mapcond = '1' or (cpu_a(15 downto 8) = X"3D" and cpu_m1_n = '0')) then
				automap <= '1';
			else
				automap <= '0';
			end if;
		end if;
	end process;

	-- Paging control outputs from register
	disable_nmi <= mapcond or not nmi_enabled;			-- Indica para o módulo TOP bloquear a interrupção NMI
	conmem      <= portE3_reg(7) or automap;				-- Indica para o módulo TOP chavear a ROM da DivMMC
	mapram      <= portE3_reg(6);								-- Indica para o módulo TOP chavear o banco 3 da RAM como se fosse uma ROM entre 0000 e 1FFF
	ram_bank    <= portE3_reg(5 downto 0);					-- Indica para o módulo TOP qual banco da RAM chavear entre 2000 e 3FFF (até 512K)

	-- Paging register writes (porta E3 controla CONMEM, MAPRAM e banco da RAM)
	process(clock, reset_n)
	begin
		if reset_n = '0' then
			portE3_reg <= (others => '0');
		elsif rising_edge(clock) then
			if enable = '1' and cpu_a(3 downto 0) = X"3" and cpu_wr_n = '0' then		-- Escrita porta E3
				portE3_reg <= di;
			end if;
		end if;
	end process;

	--------------------------------------------------
	-- Essa parte lida com a porta SPI por hardware --
	--      Implementa um SPI Master Mode 0         --
	--------------------------------------------------

	-- Chip selects (somente 1 /CS, pois a DE1 tem somente 1 soquete para cartão SD)
	process(clock, reset_n)
	begin
		if reset_n = '0' then
			spi_cs <= '1';
			nmi_enabled <= '1';
--			sd_cs1 <= '1';
			sd_cs0 <= '1';
		elsif rising_edge(clock) then
			if enable = '1' and cpu_wr_n = '0' and cpu_a(3 downto 0) = X"7" then		-- Escrita porta E7
				-- The two chip select outputs are controlled directly
				-- by writes to the lowest two bits of the control register
				spi_cs		<= di(7);
				nmi_enabled <= di(3);
--				sd_cs1      <= di(1);
				sd_cs0      <= di(0);
			end if;
		end if;
	end process;

	-- SD card outputs from clock divider and shift register
	sd_sclk  <= sck_delayed;
	sd_mosi  <= shift_reg(8);

	-- Atrasa SCK para dar tempo do bit mais significativo mudar de estado e acertar MOSI antes do SCK
	process (clock, reset_n)
	begin
		if reset_n = '0' then
			sck_delayed <= '0';
		elsif rising_edge(clock) then
			sck_delayed <= not counter(0);
		end if;
	end process;

	-- SPI write
	process(clock, reset_n)
	begin		
		if reset_n = '0' then
			shift_reg  <= (others => '1');
			portEB_reg <= (others => '1');
			counter    <= "1111"; -- Idle
		elsif rising_edge(clock) then
			if counter = "1111" then
				-- Store previous shift register value in input register
				portEB_reg <= shift_reg(7 downto 0);
				shift_reg(8) <= '1';			-- MOSI repousa em '1'

				-- Idle - check for a bus access
				if enable = '1' and cpu_a(3 downto 0) = X"B" then		-- Escrita ou leitura na porta EB
					-- Write loads shift register with data
					-- Read loads it with all 1s
					if cpu_rd_n = '0' then
						shift_reg <= (others => '1');										-- Uma leitura seta 0xFF para enviar e dispara a transmissão
					else
						shift_reg <= di & '1';												-- Uma escrita seta o valor a enviar e dispara a transmissão
					end if;
					counter <= "0000"; -- Initiates transfer
				end if;
			else
				counter <= counter + 1;												-- Transfer in progress

				if sck_delayed = '0' then
					shift_reg(0) <= sd_miso;										-- Input next bit on rising edge
				else
					shift_reg <= shift_reg(7 downto 0) & '1';					-- Output next bit on falling edge
				end if;
			end if;
		end if;
	end process;
end architecture;
