--------------------------------------------------------------------------------
---- FPGA GALAXIAN  VIDEO
----
---- Version : 2.50
----
---- Copyright(c) 2004 Katsumi Degawa , All rights reserved
----
---- Important !
----
---- This program is freeware for non-commercial use. 
---- The author does not guarantee this program.
---- You can use this at your own risk.
----
---- 2004- 4-30  galaxian modify by K.DEGAWA
---- 2004- 5- 6  first release.
---- 2004- 8-23  Improvement with T80-IP.
---- 2004- 9-22  The problem where missile sometimes didn't come out was fixed.
--------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
-- H_CNT(0), H_CNT(1), H_CNT(2), H_CNT(3), H_CNT(4), H_CNT(5), H_CNT(6), H_CNT(7), H_CNT(8),  
--    1 H       2 H       4 H       8 H      16 H     32H        64 H     128 H     256 H
-------------------------------------------------------------------------------------------
-- V_CNT(0), V_CNT(1), V_CNT(2), V_CNT(3), V_CNT(4), V_CNT(5), V_CNT(6), V_CNT(7)  
--    1 V      2 V       4 V       8 V       16 V      32 V      64 V     128 V 
-------------------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;
  use work.mc_pack.all;

entity MC_VIDEO is
	port(
		I_CLK_12M     : in  std_logic;
		I_CLK_6M      : in  std_logic;
		I_HWSEL       : in  integer;
		I_H_CNT       : in  std_logic_vector(8 downto 0);
		I_V_CNT       : in  std_logic_vector(7 downto 0);
		I_H_FLIP      : in  std_logic;
		I_V_FLIP      : in  std_logic;
		I_V_BLn       : in  std_logic;
		I_C_BLn       : in  std_logic;
		I_H_BLn       : in  std_logic;

		I_A           : in  std_logic_vector(9 downto 0);
		I_BD          : in  std_logic_vector(7 downto 0);
		I_OBJ_SUB_A   : in  std_logic_vector(2 downto 0);
		I_OBJ_RAM_RQ  : in  std_logic;
		I_OBJ_RAM_RD  : in  std_logic;
		I_OBJ_RAM_WR  : in  std_logic;
		I_VID_RAM_RD  : in  std_logic;
		I_VID_RAM_WR  : in  std_logic;
		I_DRIVER_WR   : in  std_logic;

		I_DL_ADDR     : in  std_logic_vector(15 downto 0);
		I_DL_DATA     : in  std_logic_vector(7 downto 0);
		I_DL_WR       : in  std_logic;

		O_C_BLnX      : out std_logic;
		O_H_BLnX      : out std_logic;
		O_8HF         : out std_logic;
		O_256HnX      : out std_logic;
		O_1VF         : out std_logic;
		O_MISSILEn    : out std_logic;
		O_SHELLn      : out std_logic;

		O_BD          : out std_logic_vector(7 downto 0);
		O_VID         : out std_logic_vector(1 downto 0);
		O_COL         : out std_logic_vector(2 downto 0)
	);
end;

architecture RTL of MC_VIDEO is

	signal WB_LDn       : std_logic := '0';
	signal WB_CNTRLDn   : std_logic := '0';
	signal WB_CNTRCLRn  : std_logic := '0';
	signal WB_COLLn     : std_logic := '0';
	signal WB_VPLn      : std_logic := '0';
	signal WB_OBJDATALn : std_logic := '0';
	signal WB_MLDn      : std_logic := '0';
	signal WB_SLDn      : std_logic := '0';
	signal W_3D         : std_logic := '0';
	signal W_LDn        : std_logic := '0';
	signal W_CNTRLDn    : std_logic := '0';
	signal W_CNTRCLRn   : std_logic := '0';
	signal W_COLLn      : std_logic := '0';
	signal W_VPLn       : std_logic := '0';
	signal W_OBJDATALn  : std_logic := '0';
	signal W_MLDn       : std_logic := '0';
	signal W_SLDn       : std_logic := '0';
	signal W_VID        : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_COL        : std_logic_vector( 2 downto 0) := (others => '0');

	signal W_H_POSI     : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_D      : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_2M_Q       : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6K_Q       : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_6P_Q       : std_logic_vector( 6 downto 0) := (others => '0');
	signal W_45T_Q      : std_logic_vector( 7 downto 0) := (others => '0');
	signal reg_2KL      : std_logic_vector( 7 downto 0) := (others => '0');
	signal reg_2HJ      : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_RV         : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_RC         : std_logic_vector( 2 downto 0) := (others => '0');

	signal W_O_OBJ_ROM_A  : std_logic_vector(11 downto 0) := (others => '0');
	signal W_VID_RAM_A    : std_logic_vector(11 downto 0) := (others => '0');
	signal W_VID_RAM_AA   : std_logic_vector(11 downto 0) := (others => '0');
	signal W_VID_RAM_AB   : std_logic_vector(11 downto 0) := (others => '0');
	signal C_2HJ          : std_logic_vector( 1 downto 0) := (others => '0');
	signal C_2KL          : std_logic_vector( 1 downto 0) := (others => '0');
	signal W_CD           : std_logic_vector( 2 downto 0) := (others => '0');
	signal W_1M           : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_3L_A         : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_3L_B         : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_3L_Y         : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_LRAM_DI      : std_logic_vector( 4 downto 0) := (others => '0');
	signal W_LRAM_DO      : std_logic_vector( 4 downto 0) := (others => '0');
	signal W_1H_D         : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_1K_D         : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_LRAM_A       : std_logic_vector( 7 downto 0) := (others => '0');
--	signal W_OBJ_RAM_A    : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_RAM_AB   : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_RAM_D    : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_RAM_DOA  : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_RAM_DOB  : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_ROM_A    : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_ROM_AB   : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VF_CNT       : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VID_RAM_D    : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VID_RAM_DI   : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VID_RAM_DOA  : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VID_RAM_DOB  : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_HF_CNT       : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_45N_Q        : std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6J_Q         : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_6J_DA        : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_6J_DB        : std_logic_vector( 3 downto 0) := (others => '0');
	signal W_256HnX       : std_logic := '0';
	signal W_2N           : std_logic := '0';
	signal W_45T_CLR      : std_logic := '0';
	signal W_C_BLnX       : std_logic := '0';
	signal W_H_FLIP1      : std_logic := '0';
	signal W_H_FLIP2      : std_logic := '0';
	signal W_H_FLIP1X     : std_logic := '0';
	signal W_H_FLIP2X     : std_logic := '0';
	signal W_LRAM_AND     : std_logic := '0';
	signal W_RAW0         : std_logic := '0';
	signal W_RAW1         : std_logic := '0';
	signal W_RAW_OR       : std_logic := '0';
	signal W_SRCLK        : std_logic := '0';
	signal W_SRLD         : std_logic := '0';
	signal W_VID_RAM_CS   : std_logic := '0';

	signal W_K_ROM_WR     : std_logic := '0';
	signal W_H_ROM_WR     : std_logic := '0';

	type bank_a is array(0 to 3) of std_logic_vector(7 downto 0);
	signal bank     : bank_a;
	signal pisces_gfxbank : std_logic;

begin

	ld_pls : entity work.MC_LD_PLS
	port map(
		I_CLK_6M    => I_CLK_6M,
		I_H_CNT     => I_H_CNT,
		I_3D_DI     => W_3D,

		O_LDn       => WB_LDn,
		O_CNTRLDn   => WB_CNTRLDn,
		O_CNTRCLRn  => WB_CNTRCLRn,
		O_COLLn     => WB_COLLn,
		O_VPLn      => WB_VPLn,
		O_OBJDATALn => WB_OBJDATALn,
		O_MLDn      => WB_MLDn,
		O_SLDn      => WB_SLDn
	);

	obj_ram : entity work.MC_OBJ_RAM 
	port map(
		I_CLKA  => I_CLK_12M,
		I_ADDRA => I_A(7 downto 0),
		I_WEA   => I_OBJ_RAM_WR,
		I_CEA   => I_OBJ_RAM_RQ,
		I_DA    => I_BD,
		O_DA    => W_OBJ_RAM_DOA,

		I_CLKB  => I_CLK_12M,
		I_ADDRB => W_OBJ_RAM_AB,
		I_WEB   => '0',
		I_CEB   => '1',
		I_DB    => x"00",
		O_DB    => W_OBJ_RAM_DOB
	);

	lram : entity work.MC_LRAM
	port map(
		I_WCLK => I_CLK_6M,
		I_RCLK => I_CLK_12M,
		I_ADDR => W_LRAM_A,
		I_D    => W_LRAM_DI,
		O_Dn   => W_LRAM_DO
	);

	missile : entity work.MC_MISSILE
	port map(
		I_CLK_6M   => I_CLK_6M,
		I_C_BLn_X  => W_C_BLnX,
		I_MLDn     => W_MLDn,
		I_SLDn     => W_SLDn,
		I_HPOS     => W_H_POSI,
		O_MISSILEn => O_MISSILEn,
		O_SHELLn   => O_SHELLn
	);

	vid_ram : entity work.MC_VID_RAM
	port map (
		I_CLKA  => I_CLK_12M,
		I_ADDRA => I_A(9 downto 0),
		I_DA    => W_VID_RAM_DI,
		I_WEA   => I_VID_RAM_WR,
		I_CEA   => W_VID_RAM_CS,
		O_DA    => W_VID_RAM_DOA,

		I_CLKB  => I_CLK_12M,
		I_ADDRB => W_VID_RAM_A(9 downto 0),
		I_DB    => x"00",
		I_WEB   => '0',
		I_CEB   => '1',
		O_DB    => W_VID_RAM_DOB
	);

	-- 1K VID-Rom
--	k_rom : entity work.ROM_1K
--	port map (
--		CLK  => I_CLK_12M,
--		ADDR => W_O_OBJ_ROM_A,
--		DATA => W_1K_D
--	);
	k_rom : work.dpram generic map (12,8)
	port map
	(
		clock_a   => I_CLK_12M,
		wren_a    => W_K_ROM_WR,
		address_a => I_DL_ADDR(11 downto 0),
		data_a    => I_DL_DATA,

		clock_b   => I_CLK_12M,
		address_b => W_O_OBJ_ROM_A,
		q_b       => W_1K_D
	);

	W_K_ROM_WR <= '1' when I_DL_WR = '1' and I_DL_ADDR(15 downto 12) = "0100" else '0'; -- 4000-4FFF

	-- 1H VID-Rom
--	h_rom : entity work.ROM_1H
--	port map(
--		CLK  => I_CLK_12M,
--		ADDR => W_O_OBJ_ROM_A,
--		DATA => W_1H_D
--	);

	h_rom : work.dpram generic map (12,8)
	port map
	(
		clock_a   => I_CLK_12M,
		wren_a    => W_H_ROM_WR,
		address_a => I_DL_ADDR(11 downto 0),
		data_a    => I_DL_DATA,

		clock_b   => I_CLK_12M,
		address_b => W_O_OBJ_ROM_A,
		q_b       => W_1H_D
	);

	W_H_ROM_WR <= '1' when I_DL_WR = '1' and I_DL_ADDR(15 downto 12) = "0101" else '0'; -- 5000-5FFF

-----------------------------------------------------------------------------------

	process(I_CLK_12M)
	begin
		if falling_edge(I_CLK_12M) then
			W_LDn       <= WB_LDn;
			W_CNTRLDn   <= WB_CNTRLDn;
			W_CNTRCLRn  <= WB_CNTRCLRn;
			W_COLLn     <= WB_COLLn;
			W_VPLn      <= WB_VPLn;
			W_OBJDATALn <= WB_OBJDATALn;
			W_MLDn      <= WB_MLDn;
			W_SLDn      <= WB_SLDn;
		end if;
	end process;

	W_6J_DA <= I_H_FLIP & W_HF_CNT(7) & W_HF_CNT(3) & I_H_CNT(2);
	W_6J_DB <= W_OBJ_D(6) & ( W_HF_CNT(3) and I_H_CNT(1) ) & I_H_CNT(2) & I_H_CNT(1);
	W_6J_Q  <= W_6J_DB when I_H_CNT(8) = '1' else W_6J_DA;

	W_H_FLIP1 <= (not I_H_CNT(8)) and I_H_FLIP;

	W_HF_CNT(7 downto 3)  <= not I_H_CNT(7 downto 3) when W_H_FLIP1 = '1' else I_H_CNT(7 downto 3);
	W_VF_CNT              <= not I_V_CNT             when I_V_FLIP  = '1' else I_V_CNT;

	O_8HF <= W_HF_CNT(3);
	O_1VF <= W_VF_CNT(0);
	W_H_FLIP2 <= W_6J_Q(3);

--   Parts  4F,5F
	W_OBJ_RAM_AB <= "0" & I_H_CNT(8) & W_6J_Q(2) & W_HF_CNT(6 downto 4) & W_6J_Q(1 downto 0);
--	W_OBJ_RAM_A  <= W_OBJ_RAM_AB when I_OBJ_RAM_RQ = '0' else I_A(7 downto 0) ;

	process(I_CLK_12M)
	begin
		if rising_edge(I_CLK_12M) then
			W_H_POSI <= W_OBJ_RAM_DOB;
		end if;
	end process;

	W_OBJ_RAM_D <= W_OBJ_RAM_DOA when I_OBJ_RAM_RD = '1' else (others => '0');

--   Parts  4L
	process(W_OBJDATALn)
	begin
		if rising_edge(W_OBJDATALn) then
			W_OBJ_D <= W_H_POSI; 
		end if;
	end process;

--   Parts  4,5N
	W_45N_Q <= W_VF_CNT + W_H_POSI;
	W_3D    <= '0' when W_45N_Q = x"FF" else '1'; 

	process(W_VPLn, I_V_BLn)
	begin
		if (I_V_BLn = '0') then
			W_2M_Q <= (others => '0');
		elsif rising_edge(W_VPLn) then
			W_2M_Q <= W_45N_Q;
		end if;
	end process;

	process(I_CLK_12M)
	begin
		if rising_edge(I_CLK_12M) then
			if I_DRIVER_WR = '1' and I_A(2) = '0' then
				bank(to_integer(unsigned(I_A(1 downto 0)))) <= I_BD;
			end if;
			if I_DRIVER_WR = '1' and I_A(2 downto 0) = "010" then
				pisces_gfxbank <= I_BD(0);
			end if;
		end if;
	end process;

	W_2N          <= I_H_CNT(8) and W_OBJ_D(7);
	W_1M          <= W_2M_Q(3 downto 0) xor (W_2N & W_2N & W_2N & W_2N);
	W_VID_RAM_CS  <= I_VID_RAM_RD or I_VID_RAM_WR;
	W_VID_RAM_DI  <= I_BD when I_VID_RAM_WR = '1' else (others => '0');
	W_VID_RAM_AA  <= (not ( W_2M_Q(7) and W_2M_Q(6) and W_2M_Q(5) and W_2M_Q(4))) & (not W_VID_RAM_CS) & "0000000000"; -- I_A(9:0)
	W_VID_RAM_AB  <= "00" & W_2M_Q(7 downto 4) & W_1M(3) & W_HF_CNT(7 downto 3);
	W_VID_RAM_A   <= W_VID_RAM_AB when I_C_BLn = '1' else W_VID_RAM_AA;
	W_VID_RAM_D   <= W_VID_RAM_DOA when I_VID_RAM_RD = '1' else (others => '0');

----  VIDEO DATA OUTPUT  --------------

	O_BD          <= W_OBJ_RAM_D or W_VID_RAM_D;
	W_SRLD        <= not (W_LDn or W_VID_RAM_A(11));
	W_OBJ_ROM_AB  <= W_OBJ_D(5 downto 0) & W_1M(3) & (W_OBJ_D(6) xor I_H_CNT(3));
	W_OBJ_ROM_A   <= W_OBJ_ROM_AB when I_H_CNT(8) = '1' else W_VID_RAM_DOB;

	rom_a : process(I_HWSEL, W_OBJ_ROM_A, W_1M, I_H_CNT, bank, pisces_gfxbank)
	begin
		if I_HWSEL = HW_MOONCR then
			if (bank(2) /= X"00" and W_OBJ_ROM_A(7 downto 6) = "10") then
				W_O_OBJ_ROM_A <= '1' & bank(0)(0) & bank(1)(0) & W_OBJ_ROM_A(5 downto 0) & W_1M(2 downto 0);
			else
				W_O_OBJ_ROM_A <='0' & W_OBJ_ROM_A & W_1M(2 downto 0);
			end if;
		elsif I_HWSEL = HW_DEVILFSH then
			W_O_OBJ_ROM_A <=  not I_H_CNT(8) & W_OBJ_ROM_A & W_1M(2 downto 0);
		elsif I_HWSEL = HW_ZIGZAG then
			W_O_OBJ_ROM_A <=  I_H_CNT(8) & W_OBJ_ROM_A & W_1M(2 downto 0);
		elsif I_HWSEL = HW_PISCES or I_HWSEL = HW_UNIWARS then
			W_O_OBJ_ROM_A <=  pisces_gfxbank & W_OBJ_ROM_A & W_1M(2 downto 0);
		else
			W_O_OBJ_ROM_A <= '0' & W_OBJ_ROM_A & W_1M(2 downto 0);
		end if;
	end process;

-----------------------------------------------------------------------------------

	W_3L_A  <= reg_2HJ(7) & reg_2KL(7) & "1"    & W_SRLD;
	W_3L_B  <= reg_2HJ(0) & reg_2KL(0) & W_SRLD & "1";
	W_3L_Y  <= W_3L_B when W_H_FLIP2X = '1' else W_3L_A;   --  (3)=RAW1,(2)=RAW0
	C_2HJ   <= W_3L_Y(1 downto 0);
	C_2KL   <= W_3L_Y(1 downto 0);
	W_RAW0  <= W_3L_Y(2);
	W_RAW1  <= W_3L_Y(3);
	W_SRCLK <= I_CLK_6M;

--------  PARTS 2KL  ---------------------------------------------- 

	process(W_SRCLK)
	begin
		if rising_edge(W_SRCLK) then
			case(C_2KL) is
				when "00" => reg_2KL <= reg_2KL;
				when "10" => reg_2KL <= reg_2KL(6 downto 0) & "0";
				when "01" => reg_2KL <= "0" & reg_2KL(7 downto 1);
				when "11" => reg_2KL <= W_1K_D;
				when others => null;
			end case;
		end if;
	end process;

--------  PARTS 2HJ  ---------------------------------------------- 

	process(W_SRCLK)
	begin
		if rising_edge(W_SRCLK) then
			case(C_2HJ) is
				when "00" => reg_2HJ <= reg_2HJ;
				when "10" => reg_2HJ <= reg_2HJ(6 downto 0) & "0";
				when "01" => reg_2HJ <= "0" & reg_2HJ(7 downto 1);
				when "11" => reg_2HJ <= W_1H_D;
				when others => null;
			end case;
		end if;
	end process;

-------  SHT2 -----------------------------------------------------

--  Parts 6K
	process(W_COLLn)
	begin
		if rising_edge(W_COLLn) then
			W_6K_Q <= W_H_POSI(2 downto 0);
		end if;
	end process;

--  Parts 6P
	process(I_CLK_6M)
	begin
		if rising_edge(I_CLK_6M) then
			if (W_LDn = '0') then
				W_6P_Q <= W_H_FLIP2 & W_H_FLIP1 & I_C_BLn & (not I_H_CNT(8)) & W_6K_Q(2 downto 0);
				O_H_BLnX <= I_H_BLn;
			end if;
		end if;
	end process;

	W_H_FLIP2X <= W_6P_Q(6);
	W_H_FLIP1X <= W_6P_Q(5);
	W_C_BLnX   <= W_6P_Q(4);
	W_256HnX   <= W_6P_Q(3);
	W_CD       <= W_6P_Q(2 downto 0);
	O_256HnX   <= W_256HnX;
	O_C_BLnX   <= W_C_BLnX;
	W_45T_CLR  <= W_CNTRCLRn or W_256HnX ;

	process(I_CLK_6M, W_45T_CLR)
	begin
		if (W_45T_CLR = '0') then
			W_45T_Q <= (others => '0');
		elsif rising_edge(I_CLK_6M) then
			if (W_CNTRLDn = '0') then
				W_45T_Q <= W_H_POSI;
			else
				W_45T_Q <= W_45T_Q + 1;
			end if;
		end if;
	end process;

	W_LRAM_A <= (not W_45T_Q) when W_H_FLIP1X = '1' else W_45T_Q;

	process(I_CLK_6M)
	begin
		if falling_edge(I_CLK_6M) then
			W_RV <= W_LRAM_DO(1 downto 0);
			W_RC <= W_LRAM_DO(4 downto 2);
		end if;
	end process;

	W_LRAM_AND <= not (not ((W_LRAM_A(4) or W_LRAM_A(5)) or (W_LRAM_A(6) or W_LRAM_A(7))) or W_256HnX );
	W_RAW_OR   <= W_RAW0 or W_RAW1 ;

	W_VID(0) <= not (not (W_RAW0   and W_RV(1)) and W_RV(0));
	W_VID(1) <= not (not (W_RAW1   and W_RV(0)) and W_RV(1));
	W_COL(0) <= not (not (W_RAW_OR and W_CD(0)  and W_RC(1) and W_RC(2)) and W_RC(0));
	W_COL(1) <= not (not (W_RAW_OR and W_CD(1)  and W_RC(2) and W_RC(0)) and W_RC(1));
	W_COL(2) <= not (not (W_RAW_OR and W_CD(2)  and W_RC(0) and W_RC(1)) and W_RC(2));

	O_VID <= W_VID;
	O_COL <= W_COL;

	W_LRAM_DI(0) <= W_LRAM_AND and W_VID(0);
	W_LRAM_DI(1) <= W_LRAM_AND and W_VID(1); 
	W_LRAM_DI(2) <= W_LRAM_AND and W_COL(0);
	W_LRAM_DI(3) <= W_LRAM_AND and W_COL(1);
	W_LRAM_DI(4) <= W_LRAM_AND and W_COL(2);

end RTL;
