----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    19:34:26 12/01/2015
-- Design Name:
-- Module Name:    gpmc_wishbone_wrapper_aad - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Recommended GPMC settings:
--      gpmc,sync-read;
--      gpmc,sync-write;
--      gpmc,burst-length = <16>;
--      gpmc,mux-add-data = <1>;
--      gpmc,sync-clk-ps = <20000>;
--      gpmc,clk-activation-ns = <0>;
--     	gpmc,cs-on-ns = <0>;
--      gpmc,cs-rd-off-ns = <160>;
--      gpmc,cs-wr-off-ns = <80>;
--      gpmc,adv-aadmux-on-ns = <0>;
--      gpmc,adv-aadmux-rd-off-ns = <20>;
--      gpmc,adv-aadmux-wr-off-ns = <20>;
--      gpmc,adv-on-ns = <40>;
--      gpmc,adv-rd-off-ns = <60>;
--      gpmc,adv-wr-off-ns = <60>;
--      gpmc,we-on-ns = <60>;
--      gpmc,we-off-ns = <80>;
--      gpmc,oe-aadmux-on-ns = <0>;
--      gpmc,oe-aadmux-off-ns = <20>;
--      gpmc,oe-on-ns = <60>;
--      gpmc,oe-off-ns = <160>;
--      gpmc,page-burst-access-ns = <20>;
--      gpmc,access-ns = <140>;
--      gpmc,rd-cycle-ns = <180>;
--      gpmc,wr-cycle-ns = <100>;
--      gpmc,wr-access-ns = <70>;
--      gpmc,wr-data-mux-bus-ns = <60>;
--      gpmc,bus-turnaround-ns = <40>;
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.logi_utils_pack.all;

-- ----------------------------------------------------------------------------
entity gpmc_wishbone_wrapper_aad is
	generic(
		sync : boolean := true;
		burst : boolean := false;
		addr_width : natural := 28
	);
	port (
		-- GPMC SIGNALS
		gpmc_ad    : inout std_logic_vector(15 downto 0);
		gpmc_csn   : in    std_logic;
		gpmc_oen   : in    std_logic;
		gpmc_wen   : in    std_logic;
		gpmc_advn  : in    std_logic;
		gpmc_clk   : in    std_logic;
		-- Global Signals
		gls_reset  : in std_logic;
		gls_clk    : in std_logic;
		-- Wishbone master interface signals
		wbm_address   : out std_logic_vector(addr_width-1 downto 0);
		wbm_readdata  : in  std_logic_vector(15 downto 0);
		wbm_writedata : out std_logic_vector(15 downto 0);
		wbm_strobe    : out std_logic;
		wbm_write     : out std_logic;
		wbm_ack       : in std_logic;
		wbm_cycle     : out std_logic
	);
end entity;

-- ----------------------------------------------------------------------------
Architecture RTL of gpmc_wishbone_wrapper_aad is

	-- New types
	type buffer_t is array (0 to 15) of std_logic_vector(15 downto 0);

	-- IOBUF signals for gpmc_ad port
	signal gpmc_ad_iob_hiz : std_logic;
	signal gpmc_ad_iob_in  : std_logic_vector(15 downto 0);

	-- IOB signals (input signals registered at falling edge of GPMC clock)
	signal iob_ad_in  : std_logic_vector(15 downto 0) := (others => '1');
	signal iob_ad_out : std_logic_vector(15 downto 0) := (others => '1');
	signal iob_csn    : std_logic := '1';
	signal iob_advn   : std_logic := '1';
	signal iob_oen    : std_logic := '1';
	signal iob_wen    : std_logic := '1';

	-- Use the IOB flip-flop for the GPMC signals
	attribute IOB : string;
	attribute IOB of iob_ad_in  : signal is "FORCE";
	attribute IOB of iob_ad_out : signal is "FORCE";
	attribute IOB of iob_csn    : signal is "FORCE";
	attribute IOB of iob_advn   : signal is "FORCE";
	attribute IOB of iob_oen    : signal is "FORCE";
	attribute IOB of iob_wen    : signal is "FORCE";

	-- Auxiliary signals to indicate a read or write phase
	signal iob_read  : std_logic;
	signal iob_write : std_logic;

	-- Base address
	signal reg_addr  : std_logic_vector(addr_width-1 downto 0) := (others => '0');

	-- The read and write signals are crossed to the GLS clock domain and will
	-- indicate the beginning of a new transaction on the WBM side
	signal reg_read  : std_logic := '0';
	signal reg_write : std_logic := '0';
	signal gls_read  : std_logic := '0';
	signal gls_write : std_logic := '0';

	-- Use a write buffer to avoid coherency issues in the CDC. Each data in
	-- the burst is stored in a different location in the buffer, so when the
	-- data is read by the WBM interface its value is stable.
	signal write_buf : buffer_t;

	-- These counters are used to index the write buffer during a write
	-- operation and to generate the WBM addresses during a burst. The counter
	-- value is CDC using a Gray encoder to prevent bus coherency issues.
	signal gpmc_counter : std_logic_vector(3 downto 0) := (others => '0');
	signal gpmc_counter_1 : std_logic_vector(3 downto 0);
	signal gpmc_gray_counter : std_logic_vector(3 downto 0) := (others => '0');
	signal gls_counter : std_logic_vector(3 downto 0) := (others => '0');
	signal gls_gray_counter : std_logic_vector(3 downto 0) := (others => '0');

begin

	-- IOBUF cells
	gpmc_ad_iob_hiz <= iob_csn or iob_oen or not iob_advn;
	iob_gpmc_ad : for i in 0 to 15 generate
	begin
		iob_dq_iob: IOBUF
		generic map (DRIVE => 12, IOSTANDARD => "LVTTL", SLEW => "FAST")
		port map (
			O  => gpmc_ad_iob_in(i),
			IO => gpmc_ad(i),
			I  => iob_ad_out(i),
			T  => gpmc_ad_iob_hiz
		);
	end generate;

	-- Input signals are registered in the falling edge of the GPMC clock.
	-- Since they are generated by the GPMC master in the rising edge, their
	-- value should be stable
	gpmc_iob_input: process
	begin
		wait until falling_edge(gpmc_clk);
		iob_ad_in <= gpmc_ad_iob_in;
		iob_csn <= gpmc_csn;
		iob_advn <= gpmc_advn;
		iob_wen <= gpmc_wen;
		iob_oen <= gpmc_oen;
	end process;

	-- GPMC output is registered in the falling edge (empirically, this
	-- results in more stable signals at the master end)
	gpmc_iob_output: process
	begin
		wait until falling_edge(gpmc_clk);
		if (gls_reset = '1') then
			iob_ad_out <= (others => '1');
		else
			iob_ad_out <= wbm_readdata;
		end if;
	end process;

	-- Auxiliary signals to indicate a read or write access
	iob_write <= (not iob_csn) and iob_advn and (not iob_wen);
	iob_read  <= (not iob_csn) and iob_advn and (not iob_oen);

	-- Same signals registered in the rising edge of the GPMC clock
	process
	begin
		wait until rising_edge(gpmc_clk);
		if (gls_reset = '1') then
			reg_write <= '0';
			reg_read <= '0';
		else
			reg_write <= iob_write;
			reg_read <= iob_read;
		end if;
	end process;

	-- Demultiplex the GPMC address
	demux_addr: process
	begin
		wait until rising_edge(gpmc_clk);
		if (gls_reset = '1') then
			reg_addr <= (others => '0');
		else
			if ((iob_csn = '0') and (iob_advn = '0')) then
				if (iob_oen = '0') then
					reg_addr(addr_width-1 downto 16) <= iob_ad_in(addr_width-17 downto 0);
				else
					reg_addr(15 downto 0) <= iob_ad_in;
				end if;
			end if;
		end if;
	end process;

	-- Process to increment the burst counter
	gen_burst: if burst = true generate
		process
		begin
			wait until rising_edge(gpmc_clk);
			if (gls_reset = '1') then
				gpmc_counter <= (others => '0');
			else
				if (iob_csn = '0') then
					if (iob_advn = '1') then
						if ((iob_oen and iob_wen) = '0') then
							gpmc_counter <= gpmc_counter + '1';
						end if;
					end if;
				else
					gpmc_counter <= (others => '0');
				end if;
			end if;
		end process;
		
		-- The GPMC counter is used to index the write buffer input, so we
		-- cannot use the same value to index the output at the WBM interface.
		-- The output index should be one less than the input index in order
		-- to guarantee a stable value in the buffer while reading it.
		gpmc_counter_1 <= gpmc_counter - 1;
	end generate;

	gen_no_burst: if burst = false generate
		-- In this case, both indexes (input and output) are zero
		gpmc_counter <= (others => '0');
		gpmc_counter_1 <= (others => '0');
	end generate;

	-- Store the incoming data into the write buffer. The position in the
	-- buffer is given by the GPMC counter.
	process
	begin
		wait until rising_edge(gpmc_clk);
		if (gls_reset = '1') then
		else
			if ((iob_csn = '0') and (iob_advn = '1') and (iob_wen = '0')) then
				write_buf(conv_integer(gpmc_counter)) <= iob_ad_in;
			end if;
		end if;
	end process;

	-- Control signals CDC (read/write)
	read_sync: ff_sync
	port map(
		clk => gls_clk,
		reset => gls_reset,
		din(0) => reg_read,
		dout(0) => gls_read
	);

	write_sync: ff_sync
	port map(
		clk => gls_clk,
		reset => gls_reset,
		din(0) => reg_write,
		dout(0) => gls_write
	);

	-- Convert the counter to gray
	bin2gray: bin2gray4
	port map (
		bin => gpmc_counter_1,
		gray => gpmc_gray_counter
	);
	
	-- Counter CDC
	counter_sync: ff_sync
	generic map(
		WIDTH => 4
	)
	port map(
		clk => gls_clk,
		reset => gls_reset,
		din => gpmc_gray_counter,
		dout => gls_gray_counter
	);

	-- Convert back to binary
	gray2bin: gray2bin4
	port map (
		gray => gls_gray_counter,
		bin => gls_counter
	);

	-- ------------------------------------------------------------------------
	-- Whisbone Master Interface
	--
	-- Following the Wishbone rules and recommendations, the WBM signals are
	-- all registered and respond to a synchronous reset.
	-- ------------------------------------------------------------------------

	-- WBM address
	process
	begin
		wait until rising_edge(gls_clk);
		if (gls_reset = '1') then
			wbm_address <= (others => '0');
		else
			if ((gls_write or gls_read) = '1') then
				wbm_address <= reg_addr + gls_counter;
			end if;
		end if;
	end process;

	-- WBM write process
	process
	begin
		wait until rising_edge(gls_clk);
		if (gls_reset = '1') then
			wbm_writedata <= (others => '0');
		else
			if (gls_write = '1') then
				wbm_writedata <= write_buf(conv_integer(gls_counter));
			end if;
		end if;
	end process;

	-- Control signals
	process
	begin
		wait until rising_edge(gls_clk);
		if (gls_reset = '1') then
			wbm_cycle <= '0';
			wbm_strobe <= '0';
			wbm_write <= '0';
		else
			wbm_cycle <= gls_read or gls_write;
			wbm_strobe <= gls_read or gls_write;
			wbm_write <= gls_write;
		end if;
	end process;

end architecture RTL;
