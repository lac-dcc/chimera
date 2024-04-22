-- Copyright (c) 2013, Jahanzeb Ahmad
-- All rights reserved.

-- Redistribution and use in source and binary forms, with or without modification, 
-- are permitted provided that the following conditions are met:

 -- * Redistributions of source code must retain the above copyright notice, 
   -- this list of conditions and the following disclaimer.
 -- * Redistributions in binary form must reproduce the above copyright notice, 
   -- this list of conditions and the following disclaimer in the documentation and/or 
   -- other materials provided with the distribution.

   -- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
   -- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
   -- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
   -- SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
   -- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
   -- LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
   -- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
   -- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
   -- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
   -- POSSIBILITY OF SUCH DAMAGE.

 -- * http://opensource.org/licenses/MIT
 -- * http://copyfree.org/licenses/mit/license.txt

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;


entity image_buffer is
generic(
    C3_P0_MASK_SIZE           : integer := 4;
    C3_P0_DATA_PORT_SIZE      : integer := 32;
    C3_P1_MASK_SIZE           : integer := 4;
    C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD          : integer := 3200;
    C3_RST_ACT_LOW            : integer := 0;
    C3_INPUT_CLK_TYPE         : string := "SINGLE_ENDED";
    C3_CALIB_SOFT_IP          : string := "TRUE";
    C3_SIMULATION             : string := "FALSE";
    DEBUG_EN                  : integer := 0;
    C3_MEM_ADDR_ORDER         : string := "ROW_BANK_COLUMN";
    C3_NUM_DQ_PINS            : integer := 16;
    C3_MEM_ADDR_WIDTH         : integer := 13;
    C3_MEM_BANKADDR_WIDTH     : integer := 3
);
port(
	no_frame_read                           : out std_logic; --debug signal
	write_img_s                             : out std_logic; --debug signal
	mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
	mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
	mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
	mcb3_dram_ras_n                         : out std_logic;
	mcb3_dram_cas_n                         : out std_logic;
	mcb3_dram_we_n                          : out std_logic;
	mcb3_dram_cke                           : out std_logic;
	mcb3_dram_dm                            : out std_logic;
	mcb3_dram_udqs                          : inout  std_logic;
	mcb3_dram_udqs_n                        : inout  std_logic;
	mcb3_rzq                                : inout  std_logic;
	mcb3_zio                                : inout  std_logic;
	mcb3_dram_udm                           : out std_logic;
	mcb3_dram_odt                           : out std_logic;
	mcb3_dram_dqs                           : inout  std_logic;
	mcb3_dram_dqs_n                         : inout  std_logic;
	mcb3_dram_ck                            : out std_logic;
	mcb3_dram_ck_n                          : out std_logic;
	img_in     	: in std_logic_vector(23 downto 0);
	img_in_en      : in std_logic;	
	img_out     	: out std_logic_vector(23 downto 0);
	img_out_en      : out std_logic;	
	jpg_fifo_afull    : in std_logic;
	raw_fifo_afull    : in std_logic;
	clk		: in std_logic;
	clk_out	: out std_logic;
	jpg_or_raw		: in std_logic; -- 1 = jpg, 0 = raw
	vsync		: in std_logic; 
	jpg_busy		: in std_logic; 
	jpg_done		: in std_logic; 
	jpg_start		: out std_logic; 
	resX			: in std_logic_vector(15 downto 0);
	resY			: in std_logic_vector(15 downto 0);	
	to_send 		: out std_logic_vector(23 downto 0);
	rst 	: in std_logic;
	uvc_rst	: in std_logic;
	error	: out std_logic
);
end image_buffer;

architecture rtl of image_buffer is
component ddr2ram
 generic(
    C3_P0_MASK_SIZE           : integer := 4;
    C3_P0_DATA_PORT_SIZE      : integer := 32;
    C3_P1_MASK_SIZE           : integer := 4;
    C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD          : integer := 3200;
    C3_RST_ACT_LOW            : integer := 0;
    C3_INPUT_CLK_TYPE         : string := "SINGLE_ENDED";
    C3_CALIB_SOFT_IP          : string := "TRUE";
    C3_SIMULATION             : string := "FALSE";
    DEBUG_EN                  : integer := 0;
    C3_MEM_ADDR_ORDER         : string := "ROW_BANK_COLUMN";
    C3_NUM_DQ_PINS            : integer := 16;
    C3_MEM_ADDR_WIDTH         : integer := 13;
    C3_MEM_BANKADDR_WIDTH     : integer := 3
);
    port (
   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
   mcb3_dram_ras_n                         : out std_logic;
   mcb3_dram_cas_n                         : out std_logic;
   mcb3_dram_we_n                          : out std_logic;
   mcb3_dram_odt                           : out std_logic;
   mcb3_dram_cke                           : out std_logic;
   mcb3_dram_dm                            : out std_logic;
   mcb3_dram_udqs                          : inout  std_logic;
   mcb3_dram_udqs_n                        : inout  std_logic;
   mcb3_rzq                                : inout  std_logic;
   mcb3_zio                                : inout  std_logic;
   mcb3_dram_udm                           : out std_logic;
   c3_sys_clk                              : in  std_logic;
   c3_sys_rst_i                            : in  std_logic;
   c3_calib_done                           : out std_logic;
   c3_clk0                                 : out std_logic;
   c3_rst0                                 : out std_logic;
   mcb3_dram_dqs                           : inout  std_logic;
   mcb3_dram_dqs_n                         : inout  std_logic;
   mcb3_dram_ck                            : out std_logic;
   mcb3_dram_ck_n                          : out std_logic;
   clk_img 			                       : out std_logic;
   c3_p2_cmd_clk                           : in std_logic;
   c3_p2_cmd_en                            : in std_logic;
   c3_p2_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p2_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p2_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p2_cmd_empty                         : out std_logic;
   c3_p2_cmd_full                          : out std_logic;
   c3_p2_rd_clk                            : in std_logic;
   c3_p2_rd_en                             : in std_logic;
   c3_p2_rd_data                           : out std_logic_vector(31 downto 0);
   c3_p2_rd_full                           : out std_logic;
   c3_p2_rd_empty                          : out std_logic;
   c3_p2_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p2_rd_overflow                       : out std_logic;
   c3_p2_rd_error                          : out std_logic;
   c3_p3_cmd_clk                           : in std_logic;
   c3_p3_cmd_en                            : in std_logic;
   c3_p3_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p3_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p3_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p3_cmd_empty                         : out std_logic;
   c3_p3_cmd_full                          : out std_logic;
   c3_p3_wr_clk                            : in std_logic;
   c3_p3_wr_en                             : in std_logic;
   c3_p3_wr_mask                           : in std_logic_vector(3 downto 0);
   c3_p3_wr_data                           : in std_logic_vector(31 downto 0);
   c3_p3_wr_full                           : out std_logic;
   c3_p3_wr_empty                          : out std_logic;
   c3_p3_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p3_wr_underrun                       : out std_logic;
   c3_p3_wr_error                          : out std_logic
);
end component;
COMPONENT rgbfifo
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    almost_full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    almost_empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC
  );
END COMPONENT;

-------------------------------------------------------------------------------
signal c3_calib_done                           :  std_logic;
signal c3_clk0                                 :  std_logic;
signal c3_rst0                                 :  std_logic;

signal c3_p2_cmd_en                            :  std_logic;
signal c3_p2_cmd_instr                         :  std_logic_vector(2 downto 0);
signal c3_p2_cmd_bl                            :  std_logic_vector(5 downto 0);
signal c3_p2_cmd_byte_addr                     :  std_logic_vector(29 downto 0);
signal c3_p2_cmd_empty                         :  std_logic;
signal c3_p2_cmd_full                          :  std_logic;

signal c3_p2_rd_en                             :  std_logic;
signal c3_p2_rd_data                           :  std_logic_vector(31 downto 0);
signal c3_p2_rd_full                           :  std_logic;
signal c3_p2_rd_empty                          :  std_logic;
signal c3_p2_rd_count                          :  std_logic_vector(6 downto 0);
signal c3_p2_rd_overflow                       :  std_logic;
signal c3_p2_rd_error                          :  std_logic;

signal c3_p3_cmd_en                            :  std_logic;
signal c3_p3_cmd_instr                         :  std_logic_vector(2 downto 0);
signal c3_p3_cmd_bl                            :  std_logic_vector(5 downto 0);
signal c3_p3_cmd_byte_addr                     :  std_logic_vector(29 downto 0);
signal c3_p3_cmd_empty                         :  std_logic;
signal c3_p3_cmd_full                          :  std_logic;

signal c3_p3_wr_en                             :  std_logic;
signal c3_p3_wr_mask                           :  std_logic_vector(3 downto 0):="0000";
signal c3_p3_wr_data                           :  std_logic_vector(31 downto 0);
signal c3_p3_wr_full                           :  std_logic;
signal c3_p3_wr_empty                          :  std_logic;
signal c3_p3_wr_count                          :  std_logic_vector(6 downto 0);
signal c3_p3_wr_underrun                       :  std_logic;
signal c3_p3_wr_error                          :  std_logic;

signal wrAdd : std_logic_vector(29 downto 0);
signal wrAdd_q : std_logic_vector(29 downto 0);
signal rdAdd : std_logic_vector(29 downto 0);

signal counter_rd : std_logic_vector(5 downto 0);
signal counter_wr : std_logic_vector(5 downto 0);


type write_states is (write_cmd,reset,write_data,write_wait,write_cmd_skip);
signal wr_state : write_states;

type read_states is (read_cmd,reset,read_data,read_wait,wait_data);
signal rd_state : read_states;

type rd_wr_states is (s_reset,wait_for_start1,wait_for_line_ready,wait_for_busy,wait_for_done,wait_for_write_finish,wait_for_read_finish);
signal rd_wr_state : rd_wr_states;

-- fifo signals
signal wr_en : std_logic;
signal rd_en : std_logic;

signal fullr : std_logic;
signal almost_fullr : std_logic;
signal emptyr : std_logic;
signal almost_emptyr : std_logic;
signal validr : std_logic;
signal dinr : std_logic_vector(7 downto 0);
signal doutr : std_logic_vector(7 downto 0);


signal fullg : std_logic;
signal almost_fullg : std_logic;
signal emptyg : std_logic;
signal almost_emptyg : std_logic;
signal validg : std_logic;
signal ding : std_logic_vector(7 downto 0);
signal doutg : std_logic_vector(7 downto 0);


signal fullb : std_logic;
signal almost_fullb : std_logic;
signal emptyb : std_logic;
signal almost_emptyb : std_logic;
signal validb : std_logic;
signal dinb : std_logic_vector(7 downto 0);
signal doutb : std_logic_vector(7 downto 0);


signal clk_img : std_logic;

signal write_img 	: std_logic;
signal read_img 	: std_logic;
signal vsync_rising_edge 	: std_logic;
signal vsync_q 	: std_logic;

signal line_ready : std_logic;


begin -- Architecture 


process(uvc_rst, clk_img)
begin

if uvc_rst = '1' then
	rd_wr_state <= s_reset;
	write_img 	<= '0';
	read_img 	<= '0';
	jpg_start <= '0';
elsif rising_edge(clk_img) then	

vsync_rising_edge <= ((vsync xor vsync_q) and vsync) ;	
vsync_q <= vsync;

	case rd_wr_state is 
		when s_reset =>
			write_img 	<= '0';
			read_img 	<= '0';
			jpg_start <= '0';
			rd_wr_state <= wait_for_start1;
		-- Wait for start of frame
		when wait_for_start1 =>		
			if vsync_rising_edge = '1' then
				rd_wr_state <= wait_for_line_ready;
				write_img <= '1';
			end if;
			
		-- Wait for 8 line to be written
		when wait_for_line_ready =>
			if line_ready = '1' then
								
				if jpg_or_raw = '1' then 
					rd_wr_state <= wait_for_busy;
					jpg_start <= '1';				
					wrAdd_q <= (others=>'1');
				else
					rd_wr_state <= wait_for_write_finish;
					
				end if;
			end if;
		-- Wait for encoder to start
		when wait_for_busy =>
			if jpg_busy = '1' then
				rd_wr_state <= wait_for_write_finish;
				jpg_start <= '0';	
								
			end if;
		-- Wait for end of frame
		when wait_for_write_finish =>
			read_img <= '1';		
			if vsync_rising_edge = '1' then
				wrAdd_q <= wrAdd;
				to_send <= resX(10 downto 0)*resY(10 downto 0)*"10";
				write_img <= '0';
				rd_wr_state <= wait_for_read_finish;
			end if;
		when wait_for_read_finish =>
			if wrAdd_q = rdAdd  then
				read_img <= '0';
				if jpg_or_raw = '1' then 
					rd_wr_state <= wait_for_done;
				else
					rd_wr_state <= wait_for_start1;
				end if;
			end if;
		
		when wait_for_done =>
			if  jpg_done = '1' then
				rd_wr_state <= wait_for_start1;				
			end if;
		
		when others => 
			rd_wr_state <= s_reset;
			
	end case;

end if; -- uvc_rst  -- clk


end process;

-- Controls the no_frame_read signal
debug:process(clk_img,rst)
begin
	if rst = '1' then
		no_frame_read <= '0';
	elsif rising_edge(clk_img) then
		if rd_wr_state = wait_for_line_ready then
			no_frame_read <= '1';
		elsif rd_wr_state = wait_for_start1 then
			no_frame_read <= '0';
		end if;
	end if;
end process;

-- debug signal
write_img_s <= write_img;

clk_out <= clk_img;
clk_img <= c3_clk0;
-----------------------------------------------------------------
-- ram read 

img_out <= c3_p2_rd_data(23 downto 0);

ramread : process(rst,clk_img)
begin
if rst = '1' then
	c3_p2_cmd_en <= '0'; -- stop read command fifo
	c3_p2_rd_en <= '0'; -- read data fifo
	img_out_en <= '0';
	counter_rd <= (others => '0');		
	rdAdd <= "000000000000000000000000000000";	
	c3_p2_cmd_byte_addr <= (others => '0');
	rd_state <= reset;
	
elsif rising_edge(clk_img) then -- read_img

	c3_p2_cmd_instr <= "001"; -- prepare to read
	c3_p2_cmd_bl <= "111111"; --total words to read (must be -1 from total)

	c3_p2_cmd_en <= '0'; -- stop read command fifo
	c3_p2_rd_en <= '0'; -- read data fifo
	img_out_en <= '0';
	
	case rd_state is

		when  reset =>
			counter_rd <= (others => '0');		
			rdAdd <= (others => '0');
			
			if (c3_calib_done = '1' ) then
				rd_state <= read_cmd;
			end if;
	
		when read_cmd =>
			if read_img = '1' then
				rd_state <= wait_data;
				c3_p2_cmd_byte_addr <= rdAdd; -- address increments in 4
				c3_p2_cmd_en <= '1';			
				rdAdd <= rdAdd +256;
			else 
				rdAdd <= (others => '0');
				-- c3_p2_rd_en <= not c3_p2_rd_empty;
			end if;
		
		when  wait_data =>
			if c3_p2_rd_full = '1' then
				rd_state <= read_data;
				counter_rd <= (others => '0');
			end if;
			
		when  read_data =>
			if (jpg_fifo_afull = '0' and jpg_or_raw = '1') or (raw_fifo_afull = '0' and jpg_or_raw = '0') then
				
				img_out_en <= '1';
				c3_p2_rd_en <= '1';
				counter_rd <= counter_rd +1;
				if counter_rd = 63 then
					rd_state <= read_cmd;
				end if;
			end if;

		when others =>
			rd_state <= reset;
			
	end case;	

end if; -- clk
end process;

-- ram write

ramwrite: process(rst,clk_img)
begin
if rst = '1' then
	wrAdd <= "000000000000000000000000000000";
	counter_wr <= (others => '0');
	c3_p3_cmd_byte_addr <= (others => '0');
	c3_p3_cmd_en <= '0'; -- stop Write to command FIFO
	c3_p3_wr_en <= '0'; -- write data fifo
	rd_en <= '0';	
	c3_p3_cmd_instr <= "000"; -- prepare to write
	c3_p3_cmd_bl <= "111111"; --total words to write
	line_ready <= '0';
	wr_state <= reset;
elsif falling_edge(clk_img) then

	c3_p3_cmd_instr <= "000"; -- prepare to write
	c3_p3_cmd_bl <= "111111"; --total words to write
	c3_p3_cmd_en <= '0'; -- stop Write to command FIFO
	c3_p3_wr_en <= '0'; -- write data fifo
	rd_en <= '0';
	
	case wr_state is

		when  reset =>
			wrAdd <= (others => '0');
			counter_wr <= (others => '0');
			line_ready <= '0';
			if (c3_calib_done = '1' ) then
				wr_state <= write_data;				
			end if;
			
		when  write_data =>			
			if write_img = '1' then
				if emptyr = '0' and validr = '1' and  emptyg = '0' and validg = '1' and  emptyb = '0' and validb = '1' then 					
					rd_en <= '1';
					c3_p3_wr_en <= '1';
					c3_p3_wr_data <=  ("00000000" & doutb  & doutg  & doutr );
					counter_wr <= counter_wr +1;
					if counter_wr = 63 then
						wr_state <= write_cmd_skip;
						counter_wr <= (others => '0');						
					end if;
				end if;
			else 
				wrAdd <= (others => '0');
				-- c3_p3_cmd_en <= not c3_p3_wr_empty;
				rd_en <= not emptyb;
			end if;
			
		when  write_cmd_skip =>		
			if c3_p3_wr_full = '1' then
				wr_state <= write_cmd;			
			end if;
				
		when  write_cmd =>
			wr_state <= write_wait;
			c3_p3_cmd_instr <= "000"; -- prepare to write
			c3_p3_cmd_bl <= "111111"; --total words to write
			c3_p3_cmd_byte_addr <= wrAdd; -- address 
			c3_p3_cmd_en <= '1'; --Write to command FIFO
			wrAdd <= wrAdd +256;

		when write_wait =>
			-- Checks whether 8 lines have been written
			if conv_integer(unsigned(wrAdd)) > conv_integer(unsigned(resX * ("100000"))) then
				line_ready <= '1';
			end if;
			if c3_p3_wr_empty = '1' then
				wr_state <= write_data;
			end if;
		
		when others =>
			wr_state <= reset;
			
	end case;	
	
end if; -- clk
end process ramwrite;


-- fifo write
fifowrite: process(rst,clk_img) -- additional buffering
begin
if rst = '1' then
	wr_en <= '0';
	dinr <= (others => '0');
	ding <= (others => '0');
	dinb <= (others => '0');
elsif falling_edge(clk_img) then
	wr_en <= '0';
	dinr <= (others => '0');
	ding <= (others => '0');
	dinb <= (others => '0');

	if write_img = '1' and img_in_en = '1' then		
		dinb <= img_in(23 downto 16);
		ding <= img_in(15 downto 8);
		dinr <= img_in(7 downto 0);
		wr_en <= '1';		
	end if;

end if; -- rst clk
end process fifowrite;

rgbfifo_r : rgbfifo
  PORT MAP (
    clk => clk_img,
    rst => rst,
    din => dinr,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => doutr,
    full => fullr,
    almost_full => almost_fullr,
    empty => emptyr,
    almost_empty => almost_emptyr,
    valid => validr
  );


rgbfifo_g : rgbfifo
  PORT MAP (
    clk => clk_img,
    rst => rst,
    din => ding,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => doutg,
    full => fullg,
    almost_full => almost_fullg,
    empty => emptyg,
    almost_empty => almost_emptyg,
    valid => validg
  );


rgbfifo_b : rgbfifo
  PORT MAP (
    clk => clk_img,
    rst => rst,
    din => dinb,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => doutb,
    full => fullb,
    almost_full => almost_fullb,
    empty => emptyb,
    almost_empty => almost_emptyb,
    valid => validb
  );


---------------------------------------------------

ramComp : ddr2ram
generic map (
C3_P0_MASK_SIZE => C3_P0_MASK_SIZE,
C3_P0_DATA_PORT_SIZE => C3_P0_DATA_PORT_SIZE,
C3_P1_MASK_SIZE => C3_P1_MASK_SIZE,
C3_P1_DATA_PORT_SIZE => C3_P1_DATA_PORT_SIZE,
C3_MEMCLK_PERIOD => C3_MEMCLK_PERIOD,
C3_RST_ACT_LOW => C3_RST_ACT_LOW,
C3_INPUT_CLK_TYPE => C3_INPUT_CLK_TYPE,
C3_CALIB_SOFT_IP => C3_CALIB_SOFT_IP,
C3_SIMULATION => C3_SIMULATION,
DEBUG_EN => DEBUG_EN,
C3_MEM_ADDR_ORDER => C3_MEM_ADDR_ORDER,
C3_NUM_DQ_PINS => C3_NUM_DQ_PINS,
C3_MEM_ADDR_WIDTH => C3_MEM_ADDR_WIDTH,
C3_MEM_BANKADDR_WIDTH => C3_MEM_BANKADDR_WIDTH
)
port map (

c3_sys_clk  		=>    clk,
c3_sys_rst_i    	=>    rst,
mcb3_dram_dq       	=>    mcb3_dram_dq,  
mcb3_dram_a        	=>    mcb3_dram_a,  
mcb3_dram_ba       	=>    mcb3_dram_ba,
mcb3_dram_ras_n    	=>    mcb3_dram_ras_n,                        
mcb3_dram_cas_n    	=>    mcb3_dram_cas_n,                        
mcb3_dram_we_n     	=>    mcb3_dram_we_n,                          
mcb3_dram_odt    	=>    mcb3_dram_odt,
mcb3_dram_cke      	=>    mcb3_dram_cke,                          
mcb3_dram_ck       	=>    mcb3_dram_ck,                          
mcb3_dram_ck_n     	=>    mcb3_dram_ck_n,       
mcb3_dram_dqs      	=>    mcb3_dram_dqs,                          
mcb3_dram_dqs_n  	=>    mcb3_dram_dqs_n,
mcb3_dram_udqs  	=>    mcb3_dram_udqs,    -- for X16 parts           
mcb3_dram_udqs_n    =>    mcb3_dram_udqs_n,  -- for X16 parts
mcb3_dram_udm  		=>    mcb3_dram_udm,     -- for X16 parts
mcb3_dram_dm  		=>    mcb3_dram_dm,
c3_clk0				=>	  c3_clk0,
c3_rst0				=>    c3_rst0,
c3_calib_done      	=>    c3_calib_done,
mcb3_rzq        	=>    mcb3_rzq,
mcb3_zio        	=>    mcb3_zio,


-- clk_img				=>   clk_img,
-- read port
c3_p2_cmd_clk      	                    =>  clk_img,
c3_p2_cmd_en                            =>  c3_p2_cmd_en,
c3_p2_cmd_instr                         =>  c3_p2_cmd_instr,
c3_p2_cmd_bl                            =>  c3_p2_cmd_bl,
c3_p2_cmd_byte_addr                     =>  c3_p2_cmd_byte_addr,
c3_p2_cmd_empty                         =>  c3_p2_cmd_empty,
c3_p2_cmd_full                          =>  c3_p2_cmd_full,

c3_p2_rd_clk                            =>  clk_img,
c3_p2_rd_en                             =>  c3_p2_rd_en,
c3_p2_rd_data                           =>  c3_p2_rd_data,
c3_p2_rd_full                           =>  c3_p2_rd_full,
c3_p2_rd_empty                          =>  c3_p2_rd_empty,
c3_p2_rd_count                          =>  c3_p2_rd_count,
c3_p2_rd_overflow                       =>  c3_p2_rd_overflow,
c3_p2_rd_error                          =>  c3_p2_rd_error,

-- write port
c3_p3_cmd_clk                           =>  clk_img,
c3_p3_cmd_en                            =>  c3_p3_cmd_en,
c3_p3_cmd_instr                         =>  c3_p3_cmd_instr,
c3_p3_cmd_bl                            =>  c3_p3_cmd_bl,
c3_p3_cmd_byte_addr                     =>  c3_p3_cmd_byte_addr,
c3_p3_cmd_empty                         =>  c3_p3_cmd_empty,
c3_p3_cmd_full                          =>  c3_p3_cmd_full,

c3_p3_wr_clk                            =>  clk_img,
c3_p3_wr_en                             =>  c3_p3_wr_en,
c3_p3_wr_mask                           =>  c3_p3_wr_mask,
c3_p3_wr_data                           =>  c3_p3_wr_data,
c3_p3_wr_full                           =>  c3_p3_wr_full,
c3_p3_wr_empty                          =>  c3_p3_wr_empty,
c3_p3_wr_count                          =>  c3_p3_wr_count,
c3_p3_wr_underrun                       =>  c3_p3_wr_underrun,
c3_p3_wr_error                          =>  c3_p3_wr_error
);

end rtl;

