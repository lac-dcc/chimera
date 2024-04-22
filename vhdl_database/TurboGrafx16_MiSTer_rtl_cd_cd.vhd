library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;

entity cd is
	port(
		RST_N			: in  std_logic;
		CLK 			: in  std_logic;
		EN 			: in  std_logic;

		EXT_A 		: in  std_logic_vector(20 downto 0);
		EXT_DI 		: in  std_logic_vector(7 downto 0);
		EXT_DO 		: out std_logic_vector(7 downto 0);
		EXT_WR_N		: in  std_logic;
		EXT_RD_N		: in  std_logic;
		CPU_CE		: in  std_logic;
		
		SEL_N			: out std_logic;
		IRQ_N			: out std_logic;
		
		RAM_CS_N		: out std_logic;
		BRAM_EN		: out std_logic;
		
		CD_STAT		: in std_logic_vector(7 downto 0);
		CD_MSG		: in std_logic_vector(7 downto 0);
		CD_STAT_GET	: in std_logic;
		
		CD_COMM		: out std_logic_vector(95 downto 0);
		CD_COMM_SEND: out std_logic;
		
		CD_DOUT_REQ	: in std_logic;
		CD_DOUT		: out std_logic_vector(79 downto 0);
		CD_DOUT_SEND: out std_logic;
		
		CD_REGION   : in  std_logic;
		CD_RESET		: out std_logic;
		
		CD_DATA		: in std_logic_vector(7 downto 0);
		CD_WR			: in std_logic;
		CD_DATA_END	: out std_logic;
		
		DM				: in std_logic;
		
		CD_SL			: out signed(15 downto 0);
		CD_SR			: out signed(15 downto 0);
		AD_S			: out signed(15 downto 0)
	);
end cd;

architecture rtl of cd is

	signal REG_SEL 			: std_logic;
	signal RAM_SEL 			: std_logic;
	signal CDRAM_DO			: std_logic_vector(7 downto 0);
	
	signal SCSI_DBI			: std_logic_vector(7 downto 0);
	signal SCSI_DBO			: std_logic_vector(7 downto 0);
	signal SCSI_ACK_N			: std_logic;
	signal SCSI_RST_N			: std_logic;
	signal SCSI_SEL_N			: std_logic;
	signal SCSI_BSY_N			: std_logic;
	signal SCSI_REQ_N			: std_logic;
	signal SCSI_MSG_N			: std_logic;
	signal SCSI_CD_N			: std_logic;
	signal SCSI_IO_N			: std_logic;
	signal CD_STOP_CD_SND		: std_logic;
	
	signal CD_DTD				: std_logic;	--CD data transfer done flag
	signal CD_DTR				: std_logic;	--CD data transfer ready flag
	signal CD_DTD_EN			: std_logic;
	signal CD_DTR_EN			: std_logic;
	signal ADPCM_END_EN		: std_logic;
	signal ADPCM_HALF_EN		: std_logic;
	signal CH_SEL				: std_logic;
	signal BRAM_LOCK			: std_logic;
	
	signal AUTO_ACK			: std_logic;
	signal TR_DONE_OLD		: std_logic;
	signal TR_RDY_OLD			: std_logic;
	signal SCSI_REQ_N_OLD	: std_logic;
	signal SCSI_BSY_N_OLD	: std_logic;
	signal SCSI_ACK_N_OLD	: std_logic;
	signal CD_DATA_CNT		: unsigned(10 downto 0);
	
	signal CDDA_VOL_R			: std_logic_vector(15 downto 0);
	signal CDDA_VOL_L			: std_logic_vector(15 downto 0);
	
	--ADPCM controller
	signal ADPCM_OFFS			: std_logic_vector(15 downto 0);
	signal ADPCM_LEN			: std_logic_vector(15 downto 0);
	signal ADPCM_RDADDR		: std_logic_vector(16 downto 0);
	signal ADPCM_WRADDR		: std_logic_vector(16 downto 0);
	signal ADPCM_CTRL			: std_logic_vector(7 downto 0);
	signal ADPCM_DMA_EN		: std_logic;
	signal ADPCM_DMA_RUN		: std_logic;
	signal ADPCM_END			: std_logic;							--ADPCM end reached flag
	signal ADPCM_HALF			: std_logic;							--ADPCM half reached flag
	signal ADPCM_PLAY			: std_logic;
	signal ADPCM_FREQ			: std_logic_vector(3 downto 0);
	signal ADPCM_FADER		: std_logic_vector(2 downto 0);
	signal ADPCM_RDDATA		: std_logic_vector(7 downto 0);
	signal ADPCM_WRDATA		: std_logic_vector(7 downto 0);
	signal ADPCM_WRITE_PEND	: std_logic;
	signal ADPCM_READ_PEND	: std_logic;
	signal PLAY_READ_PEND	: std_logic;
	signal DMA_WRITE_PEND	: std_logic;
	signal ADPCM_WRITE_NIB	: std_logic;
	signal ADPCM_READ_NIB	: std_logic;
	signal WRITE_PEND			: std_logic;
	signal READ_PEND			: std_logic;
	
	--ADPCM DRAM
	signal ADRAM_A				: std_logic_vector(16 downto 0);
	signal ADRAM_DI			: std_logic_vector(3 downto 0);
	signal ADRAM_DO			: std_logic_vector(3 downto 0);
	signal ADRAM_WE			: std_logic;
	
	type DRAMSlot_t is (
		SLOT_REFRESH,
		SLOT_READ,
		SLOT_WRITE
	);
	signal DRAM_SLOT 			: DRAMSlot_t; 
	signal DRAM_CLK_CNT		: unsigned(4 downto 0);
	signal DRAM_CLKEN			: std_logic;
	signal DRAM_SLOT_CNT		: unsigned(1 downto 0);
	
	--ADPCM decoder
	signal M5205_D				: std_logic_vector(3 downto 0);
	signal M5205_CLK			: std_logic;
	signal M5205_VCK_R		: std_logic;
	signal M5205_VCK_F		: std_logic;
	signal M5205_SOUT			: signed(15 downto 0);
	signal M5205_CLK_CNT 	: integer range 0 to 511;
	type M5205ClockTable_t is array (0 to 15) of integer range 0 to 511;
	constant ACT : M5205ClockTable_t :=
	(443,	--96712Hz
	 415,	--103199Hz
	 387,	--110619Hz
	 360,	--119048Hz
	 332,	--129032Hz
	 304,	--140647Hz
	 276,	--154799Hz
	 249,	--171821Hz
	 221,	--193424Hz
	 193,	--221239Hz
	 166,	--257732Hz
	 138,	--309598Hz
	 110,	--386100Hz
	 82,	--515464Hz
	 55,	--769231Hz
	 27	--1538462Hz
	);
	
	--CDDA
	signal CD_WR_OLD 			: std_logic;
	signal CD_BYTE_CNT		: unsigned(1 downto 0);
	signal FIFO_FULL 			: std_logic;
	signal FIFO_EMPTY 		: std_logic;
	signal FIFO_RD_REQ		: std_logic;
	signal FIFO_WR_REQ		: std_logic;
	signal FIFO_D 				: std_logic_vector(31 downto 0);
	signal FIFO_Q 				: std_logic_vector(31 downto 0);
	signal FIFO_SCLR			: std_logic;
	signal SAMPLE_CE 			: std_logic;
	signal ADPCM_CE			: std_logic;
	signal OUTL 				: signed(15 downto 0);
	signal OUTR 				: signed(15 downto 0);
	
	
	--Fader
	signal FADE_VOL 			: unsigned(10 downto 0);
	signal FADE_CNT 			: unsigned(7 downto 0);
	signal CDDA_FADE_VOL		: unsigned(10 downto 0);
	signal ADPCM_FADE_VOL	: unsigned(10 downto 0);

begin

	REG_SEL <= '1' when EXT_A(20 downto 13) = x"FF" and EXT_A(12 downto 8) = "11000" else '0';

	process( CLK, RST_N ) begin
		if RST_N = '0' then
			SCSI_DBI <= (others => '0');
			SCSI_ACK_N <= '1';
			SCSI_RST_N <= '1';
			SCSI_SEL_N <= '1';
			CD_DTD <= '0';
			CD_DTR <= '0';
			CH_SEL <= '0';
			BRAM_LOCK <= '1';
			CD_DTD_EN <= '0';
			CD_DTR_EN <= '0';
			ADPCM_END_EN <= '0';
			ADPCM_HALF_EN <= '0';
			AUTO_ACK <= '0';
			
			CDDA_VOL_R <= (others => '0');
			CDDA_VOL_L <= (others => '0');
			
			ADPCM_OFFS <= (others => '0');
			ADPCM_LEN <= (others => '0');
			ADPCM_RDADDR <= (others => '0');
			ADPCM_WRADDR <= (others => '0');
			ADPCM_CTRL <= (others => '0');
			ADPCM_DMA_EN <= '0';
			ADPCM_DMA_RUN <= '0';
			ADPCM_END <= '0';
			ADPCM_HALF <= '0';
			ADPCM_PLAY <= '0';
			ADPCM_FREQ <= (others => '0');
			ADPCM_WRDATA <= (others => '0');
			ADPCM_RDDATA <= (others => '0');
			ADPCM_WRITE_PEND <= '0';
			ADPCM_READ_PEND <= '0';
			PLAY_READ_PEND <= '0';
			ADPCM_WRITE_NIB <= '0';
			ADPCM_READ_NIB <= '0';
			M5205_D <= (others => '0');
		elsif rising_edge( CLK ) then
			if EN = '1' then
			if CPU_CE = '1' then
				SCSI_SEL_N <= '1';
				if REG_SEL = '1' and EXT_WR_N = '0' then
					case EXT_A(7 downto 0) is
						when x"00" =>
							SCSI_SEL_N <= '0';
							CD_DTD <= '0';
							CD_DTR <= '0';
						when x"01" =>
							SCSI_DBI <= EXT_DI;
						when x"02" =>
							SCSI_ACK_N <= not EXT_DI(7);
							CD_DTR_EN <= EXT_DI(6);
							CD_DTD_EN <= EXT_DI(5);
							ADPCM_END_EN <= EXT_DI(3);
							ADPCM_HALF_EN <= EXT_DI(2);
						when x"04" =>
							SCSI_RST_N <= not EXT_DI(1);
							if EXT_DI(1) = '1' then
								CD_DTD <= '0';
								CD_DTR <= '0';
							end if;
						when x"05" =>
							CDDA_VOL_R <= std_logic_vector(OUTR);
							CDDA_VOL_L <= std_logic_vector(OUTL);
							CH_SEL <= not CH_SEL;
							
						when x"07" =>
						   BRAM_LOCK <= not EXT_DI(7);  -- unlock when bit 7 is '1', but also lock if bit 7 is '0'

						when x"08" =>
							ADPCM_OFFS(7 downto 0) <= EXT_DI;
						when x"09" =>
							ADPCM_OFFS(15 downto 8) <= EXT_DI;
						when x"0A" =>
							ADPCM_WRDATA <= EXT_DI;
							ADPCM_WRITE_NIB <= '0';
							ADPCM_WRITE_PEND <= '1';
						when x"0B" =>
							ADPCM_DMA_EN <= EXT_DI(1);
							ADPCM_DMA_RUN <= EXT_DI(0);
						when x"0D" =>
							ADPCM_CTRL <= EXT_DI;
							if EXT_DI(5) = '1' and ADPCM_CTRL(5) = '0' then
								ADPCM_PLAY <= '1';
								ADPCM_HALF <= '0';
							elsif EXT_DI(5) = '0' and ADPCM_CTRL(5) = '1' then
								ADPCM_PLAY <= '0';
							end if;
						when x"0E" =>
							ADPCM_FREQ <= EXT_DI(3 downto 0);
						when x"0F" =>
							ADPCM_FADER <= EXT_DI(3 downto 1);
						when others => null;
					end case;
				elsif REG_SEL = '1' and EXT_RD_N = '0' then
					case EXT_A(7 downto 0) is
						when x"03" =>
							BRAM_LOCK <= '1';
						when x"08" =>
							if SCSI_REQ_N = '0' and SCSI_IO_N = '0' and SCSI_CD_N = '1' and SCSI_ACK_N = '1' then 
								SCSI_ACK_N <= '0';
								AUTO_ACK <= '1';
							end if;
						when x"0A" =>
							ADPCM_READ_NIB <= '0';
							ADPCM_READ_PEND <= '1';
						when others => null;
					end case;
				end if;
			end if;
			
			if AUTO_ACK = '1' and SCSI_REQ_N = '1' then
				SCSI_ACK_N <= '1';
				AUTO_ACK <= '0';
			end if;
			
			if (ADPCM_DMA_EN = '1' or ADPCM_DMA_RUN = '1') and DMA_WRITE_PEND = '0' then
				if SCSI_REQ_N = '0' and SCSI_IO_N = '0' and SCSI_CD_N = '1' and SCSI_ACK_N = '1' then
					ADPCM_WRDATA <= SCSI_DBO;
					DMA_WRITE_PEND <= '1';
				end if;
			end if;
			
			SCSI_REQ_N_OLD <= SCSI_REQ_N;
			SCSI_BSY_N_OLD <= SCSI_BSY_N;
			if SCSI_REQ_N = '0' and SCSI_REQ_N_OLD = '1' and SCSI_BSY_N = '0' and SCSI_MSG_N = '1' and SCSI_IO_N = '0' and SCSI_CD_N = '0' then
				CD_DTD <= '1';
				ADPCM_DMA_RUN <= '0';
			elsif CD_DTD = '1' and SCSI_BSY_N = '1' and SCSI_BSY_N_OLD = '0' then
				CD_DTD <= '0';
			end if;
			
			SCSI_ACK_N_OLD <= SCSI_ACK_N;
			if CD_DTR = '0' and SCSI_REQ_N = '0' and SCSI_BSY_N = '0' and SCSI_CD_N = '1' and SCSI_MSG_N = '1' and SCSI_IO_N = '0' then
				CD_DTR <= '1';
				CD_DATA_CNT <= (others => '0');
			elsif CD_DTR = '1' and SCSI_ACK_N = '1' and SCSI_ACK_N_OLD = '0' and SCSI_BSY_N = '0' and SCSI_CD_N = '1' and SCSI_MSG_N = '1' and SCSI_IO_N = '0' then
				CD_DATA_CNT <= CD_DATA_CNT + 1;
				if CD_DATA_CNT = 2047 then
					CD_DTR <= '0';
				end if;
			end if;
			
			
			if M5205_VCK_R = '1' and ADPCM_PLAY = '1' then
				PLAY_READ_PEND <= '1';
			end if;
			
			if DRAM_CLKEN = '1' then
				case DRAM_SLOT is
					when SLOT_READ =>
						if ADPCM_READ_PEND = '1' or PLAY_READ_PEND = '1' then
							M5205_D <= ADRAM_DO;
							if PLAY_READ_PEND = '1' then
								PLAY_READ_PEND <= '0';
							end if;
							
							ADPCM_READ_NIB <= not ADPCM_READ_NIB;
							if ADPCM_READ_NIB = '0' then
								ADPCM_RDDATA(7 downto 4) <= ADRAM_DO;
							else
								ADPCM_RDDATA(3 downto 0) <= ADRAM_DO;
							end if;
							if ADPCM_READ_NIB = '1' then
								if ADPCM_LEN /= x"0000" then
									ADPCM_LEN <= std_logic_vector(unsigned(ADPCM_LEN) - 1);
								end if;
								if ADPCM_READ_PEND = '1' then
									ADPCM_READ_PEND <= '0';
								end if;
							end if;
							ADPCM_HALF <= not ADPCM_LEN(15);
							if ADPCM_LEN = x"0000" then
								ADPCM_END <= '1';
								ADPCM_HALF <= '0';
								if ADPCM_CTRL(6) = '1' and ADPCM_PLAY = '1' then
									ADPCM_PLAY <= '0';
									M5205_D <= (others => '0');
								end if;
							end if;
						end if;
						
					when SLOT_WRITE =>
						if ADPCM_WRITE_PEND = '1' or DMA_WRITE_PEND = '1' then
							ADPCM_WRITE_NIB <= not ADPCM_WRITE_NIB;
							if ADPCM_WRITE_NIB = '1' then
								if ADPCM_LEN /= x"FFFF" then
									ADPCM_LEN <= std_logic_vector(unsigned(ADPCM_LEN) + 1);
								end if;
								if ADPCM_WRITE_PEND = '1' then
									ADPCM_WRITE_PEND <= '0';
								end if;
								if DMA_WRITE_PEND = '1' then
									DMA_WRITE_PEND <= '0';
									SCSI_ACK_N <= '0';
									AUTO_ACK <= '1';
								end if;
							end if;
							ADPCM_HALF <= not ADPCM_LEN(15);
						end if;
						
					when others => null;
				end case;
			end if;
			
			if ADPCM_CTRL(4) = '1' then
				ADPCM_LEN <= ADPCM_OFFS;
				ADPCM_END <= '0';
			end if;
			
			if ADPCM_CTRL(7) = '1' then
				ADPCM_OFFS <= (others => '0');
				ADPCM_LEN <= (others => '0');
				ADPCM_WRADDR <= (others => '0');
				ADPCM_RDADDR <= (others => '0');
				ADPCM_END <= '0';
				ADPCM_HALF <= '0';
				ADPCM_PLAY <= '0';
				ADPCM_CTRL(6 downto 0) <= (others => '0');
			end if;
			
			if DRAM_CLKEN = '1' and DRAM_SLOT = SLOT_WRITE and (ADPCM_WRITE_PEND = '1' or DMA_WRITE_PEND = '1') then
				if ADPCM_CTRL(1) = '1' then
					ADPCM_WRADDR <= ADPCM_OFFS & "0";
				else
					ADPCM_WRADDR <= std_logic_vector(unsigned(ADPCM_WRADDR) + 1);
				end if;
			elsif CPU_CE = '1' and REG_SEL = '1' and EXT_WR_N = '0' and EXT_A(7 downto 0) = x"0D" and EXT_DI(0) = '0' and ADPCM_CTRL(0) = '1' then
				if ADPCM_CTRL(1) = '1' then
					ADPCM_WRADDR <= ADPCM_OFFS & "0";
				else
					ADPCM_WRADDR <= std_logic_vector(unsigned(ADPCM_WRADDR) + 1);
				end if;
			end if;
			
			if DRAM_CLKEN = '1' and DRAM_SLOT = SLOT_READ and (ADPCM_READ_PEND = '1' or PLAY_READ_PEND = '1') then
				if ADPCM_CTRL(3) = '1' then
					ADPCM_RDADDR <= ADPCM_OFFS & "0";
				else
					ADPCM_RDADDR <= std_logic_vector(unsigned(ADPCM_RDADDR) + 1);
				end if;
			elsif CPU_CE = '1' and REG_SEL = '1' and EXT_WR_N = '0' and EXT_A(7 downto 0) = x"0D" and EXT_DI(2) = '0' and ADPCM_CTRL(2) = '1' then
				if ADPCM_CTRL(3) = '1' then
					ADPCM_RDADDR <= ADPCM_OFFS & "0";
				else
					ADPCM_RDADDR <= std_logic_vector(unsigned(ADPCM_RDADDR) + 1);
				end if;
			end if;
			end if;
		end if;
	end process;

	WRITE_PEND <= ADPCM_WRITE_PEND or DMA_WRITE_PEND;
	READ_PEND <= ADPCM_READ_PEND or PLAY_READ_PEND;
	process( REG_SEL, EXT_A, SCSI_DBO, SCSI_BSY_N, SCSI_REQ_N, SCSI_MSG_N, SCSI_CD_N, SCSI_IO_N, SCSI_ACK_N, SCSI_RST_N, 
				CD_DTR, CD_DTD, CD_DTR_EN, CD_DTD_EN, CH_SEL, ADPCM_RDDATA, ADPCM_DMA_EN, ADPCM_DMA_RUN, ADPCM_END, ADPCM_HALF, ADPCM_END_EN, ADPCM_HALF_EN, 
				ADPCM_CTRL, ADPCM_FREQ, ADPCM_PLAY, ADPCM_FADER, READ_PEND, WRITE_PEND, CDDA_VOL_R, CDDA_VOL_L, CD_REGION) 
	begin
		EXT_DO <= x"00";
		if REG_SEL = '1' then
			case EXT_A(7 downto 0) is
				when x"00" =>
					EXT_DO <= not SCSI_BSY_N & not SCSI_REQ_N & not SCSI_MSG_N & not SCSI_CD_N & not SCSI_IO_N & "000";
				when x"01" =>
					EXT_DO <= SCSI_DBO;
				when x"02" =>
					EXT_DO <= not SCSI_ACK_N & CD_DTR_EN & CD_DTD_EN & "0" & ADPCM_END_EN & ADPCM_HALF_EN & "00";--TODO
				when x"03" =>
					EXT_DO <= "0" & CD_DTR & CD_DTD & "0" & ADPCM_END & ADPCM_HALF & CH_SEL & "0";--TODO	
				when x"04" =>
					EXT_DO <= "000000" & not SCSI_RST_N & "0";
				when x"05" =>
					if CH_SEL = '1' then
						EXT_DO <= CDDA_VOL_L(7 downto 0);
					else
						EXT_DO <= CDDA_VOL_R(7 downto 0);
					end if;
				when x"06" =>
					if CH_SEL = '1' then
						EXT_DO <= CDDA_VOL_L(15 downto 8);
					else
						EXT_DO <= CDDA_VOL_R(15 downto 8);
					end if;
				when x"07" =>
					EXT_DO <= x"FF";
				when x"08" =>
					EXT_DO <= SCSI_DBO;
					
				when x"0A" =>
					EXT_DO <= ADPCM_RDDATA;
				when x"0B" =>
					EXT_DO <= "000000" & ADPCM_DMA_EN & ADPCM_DMA_RUN;
				when x"0C" =>
					EXT_DO <= READ_PEND & "000" & ADPCM_PLAY & WRITE_PEND & "0" & ADPCM_END;
				when x"0D" =>
					EXT_DO <= ADPCM_CTRL;
				when x"0E" =>
					EXT_DO <= "0000" & ADPCM_FREQ;
				when x"0F" =>
					EXT_DO <= "0000" & ADPCM_FADER & "0";
					
				when x"C1" =>
					EXT_DO <= x"AA";
				when x"C2" =>
					EXT_DO <= x"55";
				when x"C3" =>
					EXT_DO <= x"00";

				when x"C5" =>
					if CD_REGION = '1' then
						EXT_DO <= x"55";
					else
						EXT_DO <= x"AA";
					end if;
				when x"C6" =>
					if CD_REGION = '1' then
						EXT_DO <= x"AA";
					else
						EXT_DO <= x"55";
					end if;
				when x"C7" =>
					if CD_REGION = '1' then
						EXT_DO <= x"C0";
					else
						EXT_DO <= x"03";
					end if;
				when others => null;
			end case;
		end if;
	end process;
	
	SEL_N <= not (REG_SEL and EN);
	IRQ_N <= not ((CD_DTR_EN and CD_DTR) or (CD_DTD_EN and CD_DTD) or (ADPCM_END_EN and ADPCM_END) or (ADPCM_HALF_EN and ADPCM_HALF));
	
	RAM_SEL <= '1' when EXT_A(20 downto 13) >= x"68" and EXT_A(20 downto 13) <= x"87" else '0';
	RAM_CS_N <= not (RAM_SEL and EN);
	
	BRAM_EN <= not BRAM_LOCK or not EN;
	CD_RESET <= not SCSI_RST_N;
	
	SCSI : entity work.SCSI
	port map (
		RESET_N		=> RST_N and SCSI_RST_N,-- and EN
		CLK			=> CLK,
		
		DBI			=> SCSI_DBI,
		DBO			=> SCSI_DBO,
		SEL_N			=> SCSI_SEL_N,
		ACK_N			=> SCSI_ACK_N,
		RST_N			=> '1', --SCSI_RST_N,
		BSY_N			=> SCSI_BSY_N,
		REQ_N			=> SCSI_REQ_N,
		MSG_N			=> SCSI_MSG_N,
		CD_N			=> SCSI_CD_N,
		IO_N			=> SCSI_IO_N,
		
		STATUS		=> CD_STAT,
		MESSAGE		=> CD_MSG,
		STAT_GET		=> CD_STAT_GET,
		
		COMMAND		=> CD_COMM,
		COMM_SEND	=> CD_COMM_SEND,
		
		DOUT_REQ		=> CD_DOUT_REQ,
		DOUT			=> CD_DOUT,
		DOUT_SEND	=> CD_DOUT_SEND,
		STOP_CD_SND	=> CD_STOP_CD_SND,
		
		CD_DATA		=> CD_DATA,
		CD_WR			=> CD_WR and DM,
		CD_DATA_END	=> CD_DATA_END
	);


	--ADPCM DRAM
	process( RST_N, CLK )
	begin
		if RST_N = '0' then
			DRAM_CLK_CNT <= (others => '0');
			DRAM_CLKEN <= '0';
			DRAM_SLOT_CNT <= (others => '0');
		elsif rising_edge(CLK) then
			if EN = '1' then
				DRAM_CLKEN <= '0';
				DRAM_CLK_CNT <= DRAM_CLK_CNT + 1;
				if DRAM_CLK_CNT = 18-1 then
					DRAM_CLK_CNT <= (others => '0');
					DRAM_CLKEN <= '1';
				end if;
				
				if DRAM_CLKEN = '1' then
					DRAM_SLOT_CNT <= DRAM_SLOT_CNT + 1;
				end if;
			end if;
		end if;
	end process;
	
	process( DRAM_SLOT_CNT )
	begin
		case DRAM_SLOT_CNT is
			when "00" => DRAM_SLOT <= SLOT_REFRESH;
			when "01" => DRAM_SLOT <= SLOT_WRITE;
			when "10" => DRAM_SLOT <= SLOT_WRITE;
			when others => DRAM_SLOT <= SLOT_READ;
		end case;
	end process;
	
	ADPCM_DRAM : entity work.dpram generic map (17,4)
	port map (
		clock		=> CLK,
		address_a=> ADRAM_A,
		data_a	=> ADRAM_DI,
		wren_a	=> ADRAM_WE,
		q_a		=> ADRAM_DO
	);
	ADRAM_A <= ADPCM_WRADDR when DRAM_SLOT = SLOT_WRITE else ADPCM_RDADDR;
	ADRAM_DI <= ADPCM_WRDATA(3 downto 0) when ADPCM_WRITE_NIB = '1' else ADPCM_WRDATA(7 downto 4);
	ADRAM_WE <= DRAM_CLKEN when DRAM_SLOT = SLOT_WRITE and (ADPCM_WRITE_PEND = '1' or DMA_WRITE_PEND = '1') else '0';

	
	process( RST_N, CLK )
	begin
		if RST_N = '0' then
			M5205_CLK_CNT <= 0;
			M5205_CLK <= '0';
		elsif rising_edge(CLK) then
			M5205_CLK <= '0';
			if EN = '1' then
				if ADPCM_CE = '1' then
					-- M5205 CLK = 42954545Hz / (ACT(n)+1)
					M5205_CLK_CNT <= M5205_CLK_CNT + 1;
					if M5205_CLK_CNT >= 15 - unsigned(ADPCM_FREQ) then
						M5205_CLK_CNT <= 0;
						M5205_CLK <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	MSM5205 : entity work.MSM5205
	port map (
		RST_N		=> not ADPCM_CTRL(7) and ADPCM_PLAY and EN,
		CLK		=> CLK,
		
		XTI		=> M5205_CLK,
		D			=> M5205_D,
		VCK_R		=> M5205_VCK_R,
		--VCK_F		=> M5205_VCK_F,
		
		SOUT		=> M5205_SOUT
	);

	
	--CDDA
	process( RST_N, CLK )
	begin
		if RST_N = '0' then
			CD_BYTE_CNT <= (others => '0');
			FIFO_D <= (others => '0');
			FIFO_WR_REQ <= '0';
			CD_WR_OLD <= '0';
		elsif rising_edge(CLK) then
			FIFO_WR_REQ <= '0';
			if EN = '1' then
				CD_WR_OLD <= CD_WR;
				if DM = '1' then
					CD_BYTE_CNT <= (others => '0');
				elsif CD_WR = '1' and CD_WR_OLD = '0' then
					CD_BYTE_CNT <= CD_BYTE_CNT + 1;
					case CD_BYTE_CNT is
						when "00" => FIFO_D(7 downto 0) <= CD_DATA;
						when "01" => FIFO_D(15 downto 8) <= CD_DATA;
						when "10" => FIFO_D(23 downto 16) <= CD_DATA;
						when others => 
							FIFO_D(31 downto 24) <= CD_DATA;
							if FIFO_FULL = '0' and DM = '0' then
								FIFO_WR_REQ <= '1';
							end if;
					end case;
				end if;
			end if;
		end if;
	end process;
	
	FIFO : entity work.CDDA_FIFO 
	port map(
		clock		=> CLK,
		data		=> FIFO_D,
		wrreq		=> FIFO_WR_REQ,
		full		=> FIFO_FULL,
		sclr		=> FIFO_SCLR,
		rdreq		=> FIFO_RD_REQ,
		empty		=> FIFO_EMPTY,
		q			=> FIFO_Q
	);
	
	CDDA_CLK_GEN : entity work.CEGen
	port map(
		CLK   		=> CLK,
		RST_N       => RST_N,		
		IN_CLK   	=> 429545,
		OUT_CLK   	=> 441,
		CE   			=> SAMPLE_CE
	);

	ADPCM_CLK_GEN : entity work.CEGen
	port map(
		CLK         => CLK,
		RST_N       => RST_N,
		IN_CLK      => 42954545,
		OUT_CLK     => 1540200,
		CE          => ADPCM_CE
	);
	
	process( RST_N, CLK )
	begin
		if RST_N = '0' then
			FIFO_SCLR <= '1';
			FIFO_RD_REQ <= '0';
			OUTL <= (others => '0');
			OUTR <= (others => '0');
		elsif rising_edge(CLK) then
			FIFO_RD_REQ <= '0';
			FIFO_SCLR <= '0';
			if SAMPLE_CE = '1' and EN = '1' then	-- ~44.1kHz
				if FIFO_EMPTY = '0' then
					FIFO_RD_REQ <= '1';
					if (CD_STOP_CD_SND = '0') then
						OUTL <= resize(shift_right(signed(FIFO_Q(15 downto 0)) * signed(CDDA_FADE_VOL), 10), OUTL'length);
						OUTR <= resize(shift_right(signed(FIFO_Q(31 downto 16)) * signed(CDDA_FADE_VOL), 10), OUTR'length);
					else
						OUTL <= (others => '0');
						OUTR <= (others => '0');
						FIFO_SCLR <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;

			
	--Fader
	process( RST_N, CLK )
	begin
		if RST_N = '0' then
			FADE_VOL <= "01111111111";
			FADE_CNT <= (others => '0');
		elsif rising_edge(CLK) then
			if SAMPLE_CE = '1' and EN = '1' then
				if FADE_VOL(9 downto 0) > 0 and ADPCM_FADER(2) = '1' then
					FADE_CNT <= FADE_CNT + 1;
					if (FADE_CNT = 107 and ADPCM_FADER(1) = '1') or 	--2.5s
						(FADE_CNT = 255 and ADPCM_FADER(1) = '0') then	--6s
						FADE_CNT <= (others => '0');
						FADE_VOL <= "0" & (FADE_VOL(9 downto 0) - 1);
					end if;
				elsif ADPCM_FADER(2) = '0' then
					FADE_VOL <= "01111111111";
				end if;
			end if;
		end if;
	end process;
	
	CDDA_FADE_VOL <= FADE_VOL when ADPCM_FADER(0) = '0' else "01111111111";
	ADPCM_FADE_VOL <= FADE_VOL when ADPCM_FADER(0) = '1' else "01111111111";
	
	CD_SL <= OUTL;
	CD_SR <= OUTR;

	AD_S <= x"0000" when ADPCM_PLAY = '0' else resize(shift_right(M5205_SOUT * signed(ADPCM_FADE_VOL), 10), AD_S'length);

end rtl;
