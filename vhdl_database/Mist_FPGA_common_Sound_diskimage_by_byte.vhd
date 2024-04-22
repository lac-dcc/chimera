library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;


entity diskimage_by_byte is
generic (
	lbahigh : integer := 31;
	lbalow : integer := 9
);
port (
	clk : in std_logic;
	reset_n : in std_logic;
	-- Disk image interface
	sd_lba : out std_logic_vector(lbahigh-lbalow downto 0);
	sd_rd : out std_logic;
	sd_ack : in std_logic;
	sd_d : in std_logic_vector(7 downto 0);
	sd_d_strobe : in std_logic;
	sd_imgsize : in std_logic_vector(lbahigh downto 0);
	sd_imgmounted : in std_logic;
	-- Word interface
	client_mounted : out std_logic;
	client_addr : in std_logic_vector(lbahigh downto 0); -- Offset from start of file, in bytes - but LSB should be zero
	client_rd : in std_logic; 
	client_rd_next : in std_logic;
	client_q : out std_logic_vector(7 downto 0);
	client_ack : out std_logic
);
end entity;

architecture rtl of diskimage_by_byte is
	type bufdata_t is array(0 to 1024) of std_logic_vector(7 downto 0);
	signal buf : bufdata_t;
	type states_t is (IDLE,WAITACK,READING,READEND);
	signal state : states_t;
	signal fillbuf : std_logic;
	signal drainbuf : std_logic;
	signal client_mounted_i : std_logic :='0';
begin

	sdinterface : block
		signal imgsize : unsigned(lbahigh downto 0);
		signal fillidx : unsigned(lbahigh downto 0);	-- Byte index into file
		signal fillbuf_d : std_logic;
	begin
		
		client_mounted <= client_mounted_i;

		fillbuf <= fillidx(lbalow);
		
		process(clk) begin
			if rising_edge(clk) then
				if sd_imgmounted='1' then
					imgsize <= unsigned(sd_imgsize);
					if or_reduce(sd_imgsize) /= '0' then
						client_mounted_i <= '1';
					else
						client_mounted_i <= '0';
					end if;
				end if;
			end if;
		end process;

		process(clk) begin
			if rising_edge(clk) then

				case(state) is

					when IDLE =>
						-- If the read pointer has progressed into the last buffer, read the next sector into the newly-vacated buffer
						if fillbuf /= drainbuf then
							if fillidx(lbahigh downto lbalow)<imgsize(lbahigh downto lbalow) then
								sd_lba <= std_logic_vector(fillidx(lbahigh downto lbalow));
								sd_rd <= '1';
								state <= WAITACK;
							end if;
						end if;

						if client_rd='1' and client_mounted_i='1' then
							fillidx(lbahigh downto lbalow) <= unsigned(client_addr(lbahigh downto lbalow));
							fillidx(lbalow-1 downto 0) <= (others => '0');
							sd_lba <= client_addr(lbahigh downto lbalow);
							sd_rd <= '1';
							state <= WAITACK;
						end if;

					when WAITACK =>
						if sd_ack='1' then
							sd_rd<='0';
							state <= READING;
						end if;

					when READING =>
						if sd_d_strobe='1' then
							buf(to_integer(fillidx(lbalow downto 0))) <= sd_d;
							fillidx <= fillidx+1;
						end if;
						if fillbuf /= fillbuf_d then
							state <= READEND;
						end if;
						fillbuf_d<=fillbuf;
						
					when READEND =>
						if sd_ack='0' then
							state <= IDLE;
						end if;

					when others => 
						null;

				end case;
				if reset_n='0' or sd_imgmounted='1' then
					fillidx<=(others => '0');
					sd_rd<='0';
					state <= IDLE;
				end if;
			end if;
		end process;
	end block;
	
	clientinterface : block 
		signal drainidx : unsigned(lbahigh downto 0);
		signal rd_d : std_logic;
		signal client_ack_i : std_logic;
	begin

		client_ack <= client_ack_i;
		drainbuf <= drainidx(lbalow);

		process(clk) begin

			if rising_edge(clk) then
				client_ack_i <='0';

				if client_rd='1' and client_ack_i='0' then
					drainidx <= unsigned(client_addr);
				end if;

				if client_rd = '1' or client_rd_next='1' then -- Latch incoming read requests, and give SM time to respond
					rd_d <= not client_ack_i;
				end if;

				if client_ack_i='0' and rd_d='1' and (state=IDLE or fillbuf /= drainbuf) then
					client_q <= buf(to_integer(drainidx(lbalow downto 0)));
					drainidx <= drainidx+1;
					rd_d <= '0';
					client_ack_i <= '1';
				end if;
				
				if sd_imgmounted='1' then
					rd_d <= '0';
					drainidx<=(others => '0');
				end if;
				
				if reset_n='0' or client_mounted_i='0' then
					rd_d<='0';
					client_ack_i<='0';
				end if;
				
			end if;
		end process;

	end block;

end architecture;

