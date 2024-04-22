
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- -----------------------------------------------------------------------

entity sdram_controller is
	port (
		-- System
		clk : in std_logic;

		-- SDRAM interface
		sd_data : inout unsigned(15 downto 0);
		sd_addr : out unsigned((12-1) downto 0);
		sd_we_n : out std_logic;
		sd_ras_n : out std_logic;
		sd_cas_n : out std_logic;
		sd_ba_0 : out std_logic;
		sd_ba_1 : out std_logic;
		sd_ldqm : out std_logic;
		sd_udqm : out std_logic;

--GE PCE VDC ports
		vdccpu_req : in std_logic;
		vdccpu_ack : out std_logic;
		vdccpu_we : in std_logic;
		vdccpu_a : in std_logic_vector(16 downto 1);
		vdccpu_d : in std_logic_vector(15 downto 0);
		vdccpu_q : out std_logic_vector(15 downto 0);

		vdcbg_req : in std_logic;
		vdcbg_ack : out std_logic;
		vdcbg_a : in std_logic_vector(16 downto 1);
		vdcbg_q : out std_logic_vector(15 downto 0);

		vdcsp_req : in std_logic;
		vdcsp_ack : out std_logic;
		vdcsp_a : in std_logic_vector(16 downto 1);
		vdcsp_q : out std_logic_vector(15 downto 0);

		vdcdma_req : in std_logic;
		vdcdma_ack : out std_logic;
		vdcdma_we : in std_logic;
		vdcdma_a : in std_logic_vector(16 downto 1);
		vdcdma_d : in std_logic_vector(15 downto 0);
		vdcdma_q : out std_logic_vector(15 downto 0);
		
		vdcdmas_req : in std_logic;
		vdcdmas_ack : out std_logic;
		vdcdmas_a : in std_logic_vector(16 downto 1);
		vdcdmas_q : out std_logic_vector(15 downto 0);
		
		romwr_req : in std_logic;
		romwr_ack : out std_logic;
		romwr_a : in unsigned((12+8+2) downto 0);
		romwr_d : in std_logic_vector(7 downto 0);
		
		romrd_req : in std_logic;
		romrd_ack : out std_logic;
		romrd_a : in std_logic_vector((12+8+2) downto 3);
		romrd_q : out std_logic_vector(63 downto 0);

		
--GE Temporary
		initDone : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of sdram_controller is
	signal rom_a_u : unsigned((12+8+2) downto 0);
	signal rom_q_u : unsigned(7 downto 0);

	signal vdccpu_a_u : unsigned((12+8+2) downto 1);
	signal vdccpu_d_u : unsigned(15 downto 0);
	signal vdccpu_q_u : unsigned(15 downto 0);

	signal vdcbg_a_u : unsigned((12+8+2) downto 1);
	signal vdcbg_q_u : unsigned(15 downto 0);

	signal vdcsp_a_u : unsigned((12+8+2) downto 1);
	signal vdcsp_q_u : unsigned(15 downto 0);

	signal vdcdma_a_u : unsigned((12+8+2) downto 1);
	signal vdcdma_d_u : unsigned(15 downto 0);
	signal vdcdma_q_u : unsigned(15 downto 0);

	signal vdcdmas_a_u : unsigned((12+8+2) downto 1);
	signal vdcdmas_q_u : unsigned(15 downto 0);

	signal romrd_a_u : unsigned((12+8+2) downto 3);
	signal romrd_q_u : unsigned(63 downto 0);

	signal romwr_d_u : unsigned(7 downto 0);
	
begin
	
	romrd_a_u <= unsigned(romrd_a);
	romrd_q <= std_logic_vector(romrd_q_u);
	
	romwr_d_u <= unsigned(romwr_d);
	
	vdccpu_a_u <= unsigned("00" & "1000" & vdccpu_a);
	vdccpu_d_u <= unsigned(vdccpu_d);
	vdccpu_q <= std_logic_vector(vdccpu_q_u);
	
	vdcbg_a_u <= unsigned("00" & "1000" & vdcbg_a);
	vdcbg_q <= std_logic_vector(vdcbg_q_u);
	
	vdcsp_a_u <= unsigned("00" & "1000" & vdcsp_a);
	vdcsp_q <= std_logic_vector(vdcsp_q_u);

	vdcdma_a_u <= unsigned("00" & "1000" & vdcdma_a);
	vdcdma_d_u <= unsigned(vdcdma_d);
	vdcdma_q <= std_logic_vector(vdcdma_q_u);

	vdcdmas_a_u <= unsigned("00" & "1000" & vdcdmas_a);
	vdcdmas_q <= std_logic_vector(vdcdmas_q_u);
	
-- -----------------------------------------------------------------------
-- SDRAM Controller
-- -----------------------------------------------------------------------
	sdr : entity work.chameleon_sdram
		generic map (
			casLatency => 2,
--			casLatency => 3,
			colAddrBits => 8,
			rowAddrBits => 12,
--			t_ck_ns => 10.0
--			t_ck_ns => 6.7
			t_ck_ns => 11.7
--			t_ck_ns => 23.5
--			t_ck_ns => 8.3	
		)
		port map (
			clk => clk,

			reserve => '0',

			sd_data => sd_data,
			sd_addr => sd_addr,
			sd_we_n => sd_we_n,
			sd_ras_n => sd_ras_n,
			sd_cas_n => sd_cas_n,
			sd_ba_0 => sd_ba_0,
			sd_ba_1 => sd_ba_1,
			sd_ldqm => sd_ldqm,
			sd_udqm => sd_udqm,
			
			cache_req => '0',
			cache_ack => open,
			cache_we => '0',
			cache_burst => '0',
			cache_a => (others => '0'),
			cache_d => (others => '0'),
			cache_q => open,
			
			vid0_req => '0',
			vid0_ack => open,
			vid0_addr => (others => '0'),
			vid0_do => open,

			vid1_rdStrobe => '0',
			vid1_busy => open,
			vid1_addr => (others => '0'),
			vid1_do => open,
			
			vicvid_wrStrobe => '0',
			vicvid_addr => (others => '0'),
			vicvid_di => (others => '0'),
			
			cpu6510_request => '0',
			cpu6510_ack => open,
			cpu6510_we => '0',
			cpu6510_a => (others => '0'),
			cpu6510_d => (others => '0'),
			cpu6510_q => open,

			reuStrobe => '0',
			reuBusy => open,
			reuWe => '0',
			reuA => (others => '0'),
			reuD => (others => '0'),
			reuQ => open,

			cpu1541_req => '0',
			cpu1541_we => '0',
			cpu1541_a => (others => '0'),
			cpu1541_d => (others => '0'),
			
			vdccpu_req => vdccpu_req,
			vdccpu_ack => vdccpu_ack,
			vdccpu_we => vdccpu_we,
			vdccpu_a => vdccpu_a_u,
			vdccpu_d => vdccpu_d_u,
			vdccpu_q => vdccpu_q_u,
			
			vdcbg_req => vdcbg_req,
			vdcbg_ack => vdcbg_ack,
			vdcbg_a => vdcbg_a_u,
			vdcbg_q => vdcbg_q_u,			
			
			vdcsp_req => vdcsp_req,
			vdcsp_ack => vdcsp_ack,
			vdcsp_a => vdcsp_a_u,
			vdcsp_q => vdcsp_q_u,			
						
			vdcdma_req => vdcdma_req,
			vdcdma_ack => vdcdma_ack,
			vdcdma_we => vdcdma_we,
			vdcdma_a => vdcdma_a_u,
			vdcdma_d => vdcdma_d_u,
			vdcdma_q => vdcdma_q_u,

			vdcdmas_req => vdcdmas_req,
			vdcdmas_ack => vdcdmas_ack,
			vdcdmas_a => vdcdmas_a_u,
			vdcdmas_q => vdcdmas_q_u,
			
			romwr_req => romwr_req,
			romwr_ack => romwr_ack,
			romwr_a => romwr_a,
			romwr_d => romwr_d_u,
			
			romrd_req => romrd_req,
			romrd_ack => romrd_ack,
			romrd_a => romrd_a_u,
			romrd_q => romrd_q_u,
			
			initDone => initDone,
			
			debugIdle => open,
			debugRefresh => open
		);

end architecture;
