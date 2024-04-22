library STD;
use STD.TEXTIO.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
use IEEE.NUMERIC_STD.ALL;

entity SCSI is
	port(
		RESET_N		: in std_logic;
		CLK 			: in std_logic;
		
		DBI			: in std_logic_vector(7 downto 0);
		DBO			: out std_logic_vector(7 downto 0);
		SEL_N			: in std_logic;
		ACK_N			: in std_logic;
		RST_N			: in std_logic;
		BSY_N			: out std_logic;
		REQ_N			: out std_logic;
		MSG_N			: out std_logic;
		CD_N			: out std_logic;
		IO_N			: out std_logic;
		
		STATUS		: in std_logic_vector(7 downto 0);
		MESSAGE		: in std_logic_vector(7 downto 0);
		STAT_GET		: in std_logic;
		
		COMMAND		: out std_logic_vector(95 downto 0);
		COMM_SEND	: out std_logic;
		
		DOUT_REQ		: in std_logic;
		DOUT			: out std_logic_vector(79 downto 0);
		DOUT_SEND	: out std_logic;
		
		CD_DATA		: in std_logic_vector(7 downto 0);
		CD_WR			: in std_logic;
		CD_DATA_END	: out std_logic;
		STOP_CD_SND	: out std_logic;
		
		DBG_DATAIN_CNT: out unsigned(15 downto 0)
	);
end SCSI;

architecture rtl of SCSI is
	
	type SCSIPhase_t is (
		SP_FREE,
		SP_COMM_START,
		SP_COMM_END,
		SP_STAT_START,
		SP_STAT_END,
		SP_MSGIN_START,
		SP_MSGIN_END,
		SP_DATAIN_START,
		SP_DATAIN_END,
		SP_DATAOUT_START,
		SP_DATAOUT_END
	);
	signal SP 			: SCSIPhase_t; 
	
	signal BSY_Nr 		: std_logic;
	signal MSG_Nr 		: std_logic;
	signal CD_Nr 		: std_logic;
	signal IO_Nr 		: std_logic;
	signal REQ_Nr 		: std_logic;
--	signal TR_DONE		: std_logic;
--	signal TR_RDY		: std_logic;
	
	type CommBuf_t is array (0 to 11) of std_logic_vector(7 downto 0);
	signal COMM 		: CommBuf_t;
	signal COMM_POS 	: unsigned(3 downto 0);
	signal COMM_OUT 	: std_logic;
	type CommLen_t is array (0 to 15) of unsigned(3 downto 0);
	constant COMM_LEN : CommLen_t :=
	("0110", "0110", "1010", "1010", "1010", "1010", "1010", "1010", "1010", "1010", "1100", "1100", "1010", "1010", "1010", "1010"); 

	type DataBuf_t is array (0 to 9) of std_logic_vector(7 downto 0);
	signal DATA_BUF 	: DataBuf_t;
	signal DATA_POS	: unsigned(3 downto 0);
	signal DATA_OUT	: std_logic;
	
	signal FULL 		: std_logic;
	signal EMPTY		: std_logic;
	signal FIFO_RD_REQ: std_logic;
	signal FIFO_WR_REQ: std_logic;
	signal FIFO_D 		: std_logic_vector(7 downto 0);
	signal FIFO_Q 		: std_logic_vector(7 downto 0);
	signal CD_WR_OLD 	: std_logic;
	signal STAT_PEND 	: std_logic;
	signal DOUT_PEND: std_logic;
	
	signal DATAIN_CNT 	: unsigned(15 downto 0);

	signal STAT_COUNT    : unsigned(15 downto 0);

begin

	process( RESET_N, CLK )
	begin
		if RESET_N = '0' then
			FIFO_D <= (others => '0');
			FIFO_WR_REQ <= '0';
			--CD_WR_OLD <= '0';
		elsif rising_edge(CLK) then
			FIFO_WR_REQ <= '0';
--			if EN = '1' then
				CD_WR_OLD <= CD_WR;
				if CD_WR = '1' and CD_WR_OLD = '0' then
					FIFO_D <= CD_DATA;
					if FULL = '0' then
						FIFO_WR_REQ <= '1';
					end if;
				end if;
--			end if;
		end if;
	end process;

	
	FIFO : entity work.SCSI_FIFO 
	port map(
		aclr     => not RESET_N,

		wrclk		=> CLK,
		data		=> FIFO_D,
		wrreq		=> FIFO_WR_REQ,
		wrfull	=> FULL,
		
		rdclk		=> CLK,
		rdreq		=> FIFO_RD_REQ,
		rdempty	=> EMPTY,
		q			=> FIFO_Q
	);

	process( CLK, RESET_N ) begin
		if RESET_N = '0' then
			DBO <= (others => '0');
			BSY_Nr <= '1';
			MSG_Nr <= '1';
			CD_Nr <= '1';
			IO_Nr <= '1';
			REQ_Nr <= '1';
			COMM <= (others => (others => '0'));
			COMM_POS <= (others => '0');
			DATA_BUF <= (others => (others => '0'));
			DATA_POS <= (others => '0');
			SP <= SP_FREE;
			STOP_CD_SND <= '0';
			
			COMM_OUT <= '0';
			DATA_OUT <= '0';
			CD_DATA_END <= '0';
			STAT_PEND <= '0';
			DOUT_PEND <= '0';
			FIFO_RD_REQ <= '0';
			
			STAT_COUNT  <= (others => '0');
			
			DATAIN_CNT <= (others => '0');

		elsif rising_edge( CLK ) then
			if STAT_GET = '1' then
				STAT_PEND <= '1';
			end if;
			
			if DOUT_REQ = '1' then
				DOUT_PEND <= '1';
			end if;
			

			COMM_OUT <= '0';
			DATA_OUT <= '0';
			CD_DATA_END <= '0';
			FIFO_RD_REQ <= '0';
			
			if RST_N = '0' then
				BSY_Nr <= '1';
				MSG_Nr <= '1';
				CD_Nr <= '1';
				IO_Nr <= '1';
				REQ_Nr <= '1';
			else
				case SP is
					when SP_FREE =>
						if SEL_N = '0' then
							BSY_Nr <= '0';
							MSG_Nr <= '1';
							CD_Nr <= '0';
							IO_Nr <= '1';
							REQ_Nr <= '0';
							SP <= SP_COMM_START;
							DATAIN_CNT <= (others => '0');
						elsif STAT_PEND = '1' then
							STAT_COUNT <= STAT_COUNT + 1;

							if (STAT_COUNT = 4500) then		-- CLK is 42.95 MHz; this gives ~105 usec delay.
																		-- this is empirical and may not be correct but it solves
																		-- the Sailor Moon hang issue
								STAT_COUNT <= (others => '0');
								STAT_PEND <= '0';
								DBO <= STATUS;
								BSY_Nr <= '0';
								MSG_Nr <= '1';
								CD_Nr <= '0';
								IO_Nr <= '0';
								REQ_Nr <= '0';
								SP <= SP_STAT_START;
							end if;
						elsif EMPTY = '0' then
							DBO <= FIFO_Q;
							BSY_Nr <= '0';
							MSG_Nr <= '1';
							CD_Nr <= '1';
							IO_Nr <= '0';
							REQ_Nr <= '0';
							FIFO_RD_REQ <= '1';
							SP <= SP_DATAIN_START;
						elsif DOUT_PEND = '1' then
							DOUT_PEND <= '0';
							BSY_Nr <= '0';
							MSG_Nr <= '1';
							CD_Nr <= '1';
							IO_Nr <= '1';
							REQ_Nr <= '0';
							SP <= SP_DATAOUT_START;
						end if;
						
					when SP_COMM_START =>
						if REQ_Nr = '0' and ACK_N = '0' then
							REQ_Nr <= '1';
							COMM(to_integer(COMM_POS)) <= DBI;
							COMM_POS <= COMM_POS + 1;
							SP <= SP_COMM_END;
						end if;
					
					when SP_COMM_END =>
						if REQ_Nr = '1' and ACK_N = '1' then
							if COMM_POS = COMM_LEN(to_integer(unsigned(COMM(0)(7 downto 4)))) then
								COMM_POS <= (others => '0');
								COMM_OUT <= '1';
								CD_Nr <= '1';
								SP <= SP_FREE;
								if ((COMM(0) = x"08") or (COMM(0) = x"DA")) then	-- READ6 and PAUSE commands should mute sound, but still drain FIFO
									STOP_CD_SND <= '1';
								end if;
								if ((COMM(0) = x"D8") or (COMM(0) = x"D9")) then	-- SAPSP and SAPEP commands should unmute sound (FIFO should be empty by now)
									STOP_CD_SND <= '0';
								end if;
							else
								REQ_Nr <= '0';
								SP <= SP_COMM_START;
							end if;
						end if;
					
					when SP_STAT_START =>
						if REQ_Nr = '0' and ACK_N = '0' then
							REQ_Nr <= '1';
							SP <= SP_STAT_END;
						end if;
					
					when SP_STAT_END =>
						if REQ_Nr = '1' and ACK_N = '1' then
							DBO <= MESSAGE;
							BSY_Nr <= '0';
							MSG_Nr <= '0';
							CD_Nr <= '0';
							IO_Nr <= '0';
							REQ_Nr <= '0';
							SP <= SP_MSGIN_START;
						end if;
					
					when SP_MSGIN_START =>
						if REQ_Nr = '0' and ACK_N = '0' then
							REQ_Nr <= '1';
							SP <= SP_MSGIN_END;
						end if;
					
					when SP_MSGIN_END =>
						if REQ_Nr = '1' and ACK_N = '1' then
							BSY_Nr <= '1';
							MSG_Nr <= '1';
							CD_Nr <= '1';
							IO_Nr <= '1';
							REQ_Nr <= '1';
							SP <= SP_FREE;
						end if;
						
					when SP_DATAIN_START =>
						if REQ_Nr = '0' and ACK_N = '0' then
							REQ_Nr <= '1';
							SP <= SP_DATAIN_END;
							STOP_CD_SND <= '0';		-- unmute
						end if;
					
					when SP_DATAIN_END =>
						if REQ_Nr = '1' and ACK_N = '1' then
							if EMPTY = '0' then
								DBO <= FIFO_Q;
								REQ_Nr <= '0';
								FIFO_RD_REQ <= '1';
								SP <= SP_DATAIN_START;
							else
								CD_DATA_END <= '1';
								SP <= SP_FREE;
							end if;
							DATAIN_CNT <= DATAIN_CNT + 1;
						end if;
						
					when SP_DATAOUT_START =>
						if REQ_Nr = '0' and ACK_N = '0' then
							REQ_Nr <= '1';
							DATA_BUF(to_integer(DATA_POS)) <= DBI;
							DATA_POS <= DATA_POS + 1;
							SP <= SP_DATAOUT_END;
						end if;
					
					when SP_DATAOUT_END =>
						if REQ_Nr = '1' and ACK_N = '1' then
							if DATA_POS = 10 then
								DATA_POS <= (others => '0');
								DATA_OUT <= '1';
								SP <= SP_FREE;
							else
								REQ_Nr <= '0';
								SP <= SP_DATAOUT_START;
							end if;
						end if;
						
					when others => null;
				end case;
			end if;
		end if;
	end process;
	
	BSY_N <= BSY_Nr;
	MSG_N <= MSG_Nr;
	CD_N <= CD_Nr;
	IO_N <= IO_Nr;
	REQ_N <= REQ_Nr;
	
	COMMAND <= COMM(11) & COMM(10) & COMM(9) & COMM(8) & COMM(7) & COMM(6) & COMM(5) & COMM(4) & COMM(3) & COMM(2) & COMM(1) & COMM(0);
	COMM_SEND <= COMM_OUT;
	
	DOUT <= DATA_BUF(9) & DATA_BUF(8) & DATA_BUF(7) & DATA_BUF(6) & DATA_BUF(5) & DATA_BUF(4) & DATA_BUF(3) & DATA_BUF(2) & DATA_BUF(1) & DATA_BUF(0);
	DOUT_SEND <= DATA_OUT;
	
	DBG_DATAIN_CNT <= DATAIN_CNT;

end rtl;
