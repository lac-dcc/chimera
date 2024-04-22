library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PACE_WF68K00IP_TOP_SOC is
	port 
	(
		CLK						: in std_logic;
		RESET_COREn		: in std_logic; -- Core reset.
		
		-- Address and data:
		ADR_OUT				: out std_logic_vector(23 downto 1);
		ADR_EN				: out std_logic;
		DATA_IN				: in std_logic_vector(15 downto 0);
		DATA_OUT			: out std_logic_vector(15 downto 0);
		DATA_EN				: out std_logic;

		-- System control:
		BERRn					: in std_logic;
		RESET_INn			: in std_logic;
		RESET_OUT_EN	: out std_logic; -- Open drain.
		HALT_INn			: in std_logic;
		HALT_OUT_EN		: out std_logic; -- Open drain.
		
		-- Processor status:
		FC_OUT				: out std_logic_vector(2 downto 0);
		FC_OUT_EN			: out std_logic;
		
		-- Interrupt control:
		AVECn					: in std_logic; -- Originally 68Ks use VPAn.
		IPLn					: in std_logic_vector(2 downto 0);
		
		-- Aynchronous bus control:
		DTACKn				: in std_logic;
		AS_OUTn				: out std_logic;
		AS_OUT_EN			: out std_logic;
		RWn_OUT				: out std_logic;
		RW_OUT_EN			: out std_logic;
		UDS_OUTn			: out std_logic;
		UDS_OUT_EN		: out std_logic;
		LDS_OUTn			: out std_logic;
		LDS_OUT_EN		: out std_logic;
		
		-- Synchronous peripheral control:
		E							: out std_logic;
		VMA_OUTn			: out std_logic;
		VMA_OUT_EN		: out std_logic;
		VPAn					: in std_logic;
		
		-- Bus arbitration control:
		BRn						: in std_logic;
		BGn						: out std_logic;
		BGACKn				: in std_logic
		);
end entity PACE_WF68K00IP_TOP_SOC;
	
architecture SYN of PACE_WF68K00IP_TOP_SOC is

	signal CLK_s					: bit;
	signal RESET_COREn_s	: bit;
		
	-- Address and data:
	signal ADR_EN_s				: bit;
	signal DATA_EN_s			: bit;

	-- System control:
	signal BERRn_s				: bit;
	signal RESET_INn_s		: bit;
	signal RESET_OUT_EN_s	: bit; -- Open drain.
	signal HALT_OUT_EN_s	: bit; -- Open drain.
		
	-- Processor status:
	signal FC_OUT_EN_s		: bit;
		
	-- Interrupt control:
	signal AVECn_s				: bit; -- Originally 68Ks use VPAn.
	signal IPLn_s					: std_logic_vector(2 downto 0);
		
	-- Aynchronous bus control:
	signal DTACKn_s				: bit;
	signal AS_OUTn_s			: bit;
	signal AS_OUT_EN_s		: bit;
	signal RWn_OUT_s			: bit;
	signal RW_OUT_EN_s		: bit;
	signal UDS_OUTn_s			: bit;
	signal UDS_OUT_EN_s		: bit;
	signal LDS_OUTn_s			: bit;
	signal LDS_OUT_EN_s		: bit;
		
	-- Synchronous peripheral control:
	signal E_s						: bit;
	signal VMA_OUTn_s			: bit;
	signal VMA_OUT_EN_s		: bit;
	signal VPAn_s					: bit;
		
	-- Bus arbitration control:
	signal BRn_s					: bit;
	signal BGn_s					: bit;
	signal BGACKn_s				: bit;

begin

	CLK_s	<= TO_BIT(CLK);
	RESET_COREn_s	<= TO_BIT(RESET_COREn);
		
	-- Address and data:
	ADR_EN <= TO_X01(ADR_EN_s);
	DATA_EN <= TO_X01(DATA_EN_s);

	-- System control:
	BERRn_s <= TO_BIT(BERRn);
	RESET_INn_s <= TO_BIT(RESET_INn);
	RESET_OUT_EN <= TO_X01(RESET_OUT_EN_s);
	HALT_OUT_EN <= TO_X01(HALT_OUT_EN_s);
		
	-- Processor status:
	FC_OUT_EN <= TO_X01(FC_OUT_EN_s);
		
	-- Interrupt control:
	AVECn_s <= TO_BIT(AVECn);
	IPLn_s <= IPLn;
		
	-- Aynchronous bus control:
	DTACKn_s <= TO_BIT(DTACKn);
	AS_OUTn <= TO_X01(AS_OUTn_s);
	AS_OUT_EN <= TO_X01(AS_OUT_EN_s);
	RWn_OUT <= TO_X01(RWn_OUT_s);
	RW_OUT_EN <= TO_X01(RW_OUT_EN_s);
	UDS_OUTn <= TO_X01(UDS_OUTn_s);
	UDS_OUT_EN <= TO_X01(UDS_OUT_EN_s);
	LDS_OUTn <= TO_X01(LDS_OUTn_s);
	LDS_OUT_EN <= TO_X01(LDS_OUT_EN_s);
		
	-- Synchronous peripheral control:
	E <= TO_X01(E_s);
	VMA_OUTn <= TO_X01(VMA_OUTn_s);
	VMA_OUT_EN <= TO_X01(VMA_OUT_EN_s);
	VPAn_s <= TO_BIT(VPAn);
		
	-- Bus arbitration control:
	BRn_s <= TO_BIT(BRn);
	BGn <= TO_X01(BGn_s);
	BGACKn_s <= TO_BIT(BGACKn);

	WF68K00IP_TOP_SOC_inst : entity work.WF68K00IP_TOP_SOC
		port map
		(
			CLK								=> CLK_s,
			RESET_COREn				=> RESET_COREn_s,
			
			-- Address and data:
			ADR_OUT						=> ADR_OUT,
			ADR_EN						=> ADR_EN_s,
			DATA_IN						=> DATA_IN,
			DATA_OUT					=> DATA_OUT,
			DATA_EN						=> DATA_EN_s,

			-- System control:
			BERRn							=> BERRn_s,
			RESET_INn					=> RESET_INn_s,
			RESET_OUT_EN			=> RESET_OUT_EN_s,
			HALT_INn					=> HALT_INn,
			HALT_OUT_EN				=> HALT_OUT_EN_s,
			
			-- Processor status:
			FC_OUT						=> FC_OUT,
			FC_OUT_EN					=> FC_OUT_EN_s,
			
			-- Interrupt control:
			AVECn							=> AVECn_s,
			IPLn							=> IPLn_s,
			
			-- Aynchronous bus control:
			DTACKn						=> DTACKn_s,
			AS_OUTn						=> AS_OUTn_s,
			AS_OUT_EN					=> AS_OUT_EN_s,
			RWn_OUT						=> RWn_OUT_s,
			RW_OUT_EN					=> RW_OUT_EN_s,
			UDS_OUTn					=> UDS_OUTn_s,
			UDS_OUT_EN				=> UDS_OUT_EN_s,
			LDS_OUTn					=> LDS_OUTn_s,
			LDS_OUT_EN				=> LDS_OUT_EN_s,
			
			-- Synchronous peripheral control:
			E									=> E_s,
			VMA_OUTn					=> VMA_OUTn_s,
			VMA_OUT_EN				=> VMA_OUT_EN_s,
			VPAn							=> VPAn_s,
			
			-- Bus arbitration control:
			BRn								=> BRn_s,
			BGn								=> BGn_s,
			BGACKn						=> BGACKn_s
		);

end SYN;
