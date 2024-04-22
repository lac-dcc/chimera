library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity Settings is	
	port (
		-- reference clock
		CLK: in std_logic;		
		
		-- get notified when CPU writes into the registers
		WRITEADDR : in std_logic_vector(5 downto 0);
		WRITEDATA : in std_logic_vector(7 downto 0);
		WRITEEN : in std_logic;
		
		-- color palette conversion
		QUERYREGISTER : in std_logic_vector(8 downto 0);
		REGISTERDATA : out std_logic_vector(15 downto 0)
	);	
end entity;


architecture immediate of Settings is
	component ram_dual is
	generic
	(
		data_width : integer := 9;
		addr_width : integer := 16
	); 
	port 
	(
		data	: in std_logic_vector(data_width-1 downto 0);
		raddr	: in std_logic_vector(addr_width-1 downto 0);
		waddr	: in std_logic_vector(addr_width-1 downto 0);
		we		: in std_logic := '1';
		rclk	: in std_logic;
		wclk	: in std_logic;
		q		: out std_logic_vector(data_width-1 downto 0)
	);	
	end component;

	component SETTINGSFLASH is
	port (
		clock                   : in  std_logic                     := '0';             --    clk.clk
		avmm_csr_addr           : in  std_logic                     := '0';             --    csr.address
		avmm_csr_read           : in  std_logic                     := '0';             --       .read
		avmm_csr_writedata      : in  std_logic_vector(31 downto 0) := (others => '0'); --       .writedata
		avmm_csr_write          : in  std_logic                     := '0';             --       .write
		avmm_csr_readdata       : out std_logic_vector(31 downto 0);                    --       .readdata
		avmm_data_addr          : in  std_logic_vector(11 downto 0) := (others => '0'); --   data.address
		avmm_data_read          : in  std_logic                     := '0';             --       .read
		avmm_data_writedata     : in  std_logic_vector(31 downto 0) := (others => '0'); --       .writedata
		avmm_data_write         : in  std_logic                     := '0';             --       .write
		avmm_data_readdata      : out std_logic_vector(31 downto 0);                    --       .readdata
		avmm_data_waitrequest   : out std_logic;                                        --       .waitrequest
		avmm_data_readdatavalid : out std_logic;                                        --       .readdatavalid
		avmm_data_burstcount    : in  std_logic_vector(1 downto 0)  := (others => '0'); --       .burstcount
		reset_n                 : in  std_logic                     := '0'              -- nreset.reset_n
	);
	end component;	

	-- communicate with the ram
	signal ram_rdaddress : std_logic_vector(8 downto 0);
	signal ram_rddata : std_logic_vector(15 downto 0);
	signal ram_wrdata : std_logic_vector(15 downto 0);
	signal ram_wraddress : std_logic_vector(8 downto 0);
	signal ram_we : std_logic;
	
	-- communicate with the flash memory controller
	signal avmm_clock : std_logic;
	signal avmm_csr_addr: std_logic := '0';
	signal avmm_csr_read: std_logic := '0';
	signal avmm_csr_writedata :  std_logic_vector(31 downto 0) := "11111111111111111111111111111111";
	signal avmm_csr_write: std_logic := '0';
	signal avmm_csr_readdata: std_logic_vector(31 downto 0);
	signal avmm_data_addr:  std_logic_vector(11 downto 0) := "000000000000";
	signal avmm_data_read:  std_logic := '0';
	signal avmm_data_writedata: std_logic_vector(31 downto 0) := "11111111111111111111111111111111";
	signal avmm_data_write: std_logic := '0';
	signal avmm_data_readdata: std_logic_vector(31 downto 0);
	signal avmm_data_waitrequest: std_logic;
	signal avmm_data_readdatavalid: std_logic;  
--	signal avmm_data_burstcount: std_logic_vector(1 downto 0);
	signal reset_n : std_logic := '0';
	
	

begin

	ram: ram_dual generic map(data_width => 16, addr_width => 9)
		port map (
			ram_wrdata,
			ram_rdaddress,
			ram_wraddress,
			ram_we,
			CLK,
			CLK,
			ram_rddata 
		);

	flash : SETTINGSFLASH port map (
		avmm_clock, 
		avmm_csr_addr,        --   : in  std_logic
		avmm_csr_read,        --   : in  std_logic
		avmm_csr_writedata,   --   : in  std_logic_vector(31 downto 0) 
		avmm_csr_write,       --   : in  std_logic   
		avmm_csr_readdata,     --  : out std_logic_vector(31 downto 0)
		avmm_data_addr,        --       : in  std_logic_vector(11 downto 0) := (others => '0'); --   data.address
		avmm_data_read,        --       : in  std_logic                     := '0';             --       .read
		avmm_data_writedata,   --      : in  std_logic_vector(31 downto 0) := (others => '0'); --       .writedata
		avmm_data_write,       --         : in  std_logic                     := '0';             --       .write
		avmm_data_readdata,    --       : out std_logic_vector(31 downto 0);                    --       .readdata
      avmm_data_waitrequest,  --	      : out std_logic;                                        --       .waitrequest
		avmm_data_readdatavalid,  --     : out std_logic;                                        --       .readdatavalid
		"01", -- avmm_data_burstcount    : in  std_logic_vector(1 downto 0)  := (others => '0'); --       .burstcount
		reset_n        --                : in  std_logic                     := '0'              -- nreset.reset_n
	);
	
	------------------ manage user settings (colors and such) 
	process (CLK, QUERYREGISTER, ram_rddata) 

	-- state machine 
	variable tick : integer range 0 to 3 := 0;

	TYPE state_type IS
	(	POWERUP, READING, WAITFORDATA, IDLE,
      ENABLEWRITE, CLEAR, AFTERCLEAR, WAITFORCLEARFINISHED,
		FETCHFORWRITE, WRITING, AFTERWRITE, WAITFORWRITEFINISHED,
		DISABLEWRITE, AFTERDISABLEWRITE,
		SETREGISTERBANK1
	);  
	variable state: state_type := POWERUP;

	variable startdelay : integer range 0 to 2000 := 0;
	variable readcursor : integer range 0 to 511 := 0;	
	variable writecursor : integer range 0 to 511 := 0;
	variable enablebank: std_logic_vector(1 downto 0) := "11";

	variable out_reset : std_logic := '0';
	variable out_csr_addr : std_logic := '0';
	variable out_csr_writedata : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";
	variable out_csr_read : std_logic := '0';
	variable out_csr_write : std_logic := '0';
	variable out_data_addr : std_logic_vector(11 downto 0) := "000000000000";
	variable out_data_read : std_logic := '0';
	variable out_data_writedata : std_logic_vector(31 downto 0) := "11111111111111111111111111111111";
	variable out_data_write : std_logic := '0';
	
	variable overridequery : boolean := false;
	variable overridequeryaddress : std_logic_vector(8 downto 0) := "000000000";
	
	begin
		if rising_edge(CLK) then
			-- by default do not access the RAM from here
			ram_we <= '0';		
			
			-- the state machine is a bit complicated because the clock for the UFM needs to
			-- be slower than the rest of the system. therefore the slower clock is 
			-- generated with a counter, but for this, the signals into the UFM block must be
			-- a little delayed to avoid race conditions of the signals. 
			-- reading and state machine changes occurs at tick 1, the signals going to the UFM
			-- are delayed by just a tick.
			
			case tick is
			when 0 =>
				tick := 1;

			when 1 =>
				tick := 2;
				avmm_clock <= '1';
				
				-- state machine handling
				case state is 
				
				when POWERUP =>
					if startdelay<1000 then
						out_reset := '0';
						startdelay := startdelay+1;
					elsif startdelay<2000 then
						out_reset := '1';
						startdelay := startdelay+1;
					else
						state := READING;
					end if;
					
				-- transfer settings into the ram
				when READING =>
					out_data_addr := std_logic_vector(to_unsigned(readcursor,12));
					out_data_read := '1';
					state := WAITFORDATA;
					
				when WAITFORDATA =>
					out_data_read := '0';
					if avmm_data_readdatavalid='1' then
						state := READING;
						ram_wraddress <= std_logic_vector(to_unsigned(readcursor,9));
						ram_wrdata <= avmm_data_readdata(15 downto 0);
							
						ram_we <= '1';
						if readcursor = 511 then
							state := IDLE;
						else
							readcursor := readcursor+1;
						end if;
					end if;
						
				when IDLE => -- wait for request from CPU
				when SETREGISTERBANK1 => -- this is handled in a seperate state flow
					
				-- clear page 0 of the flash
				when ENABLEWRITE =>
					out_csr_addr := '1';  -- write into control register
					out_csr_writedata := 
						"1111"    -- padding
					 & "11110"   -- disable write protecting on sector UFM1
					 & "111"     -- no sector erase operation
					 & "11111111111111111111";  -- no page erase yet					 
					out_csr_write := '1';
					state := CLEAR;
				
				when CLEAR =>
					out_csr_addr := '1';  -- write into control register
					out_csr_writedata := 
						"1111"    -- padding
					 & "11110"   -- keep write protecting on sector UFM1 disabled
					 & "111"     -- no sector erase operation
					 & "00000000000000000000";  -- erase page 0					 
					out_csr_read := '0';
					out_csr_write := '1';
					state := AFTERCLEAR;
					
				when AFTERCLEAR =>
					out_csr_addr := '0';  -- read from status register
					out_csr_read := '1';
					out_csr_write := '0';
					state := WAITFORCLEARFINISHED;
				
				when WAITFORCLEARFINISHED =>
					if avmm_csr_readdata(1 downto 0) = "00" then
						out_csr_read := '0';
						state := FETCHFORWRITE;
						writecursor := 0;
					end if;	
		
				when FETCHFORWRITE =>
					overridequery := true;
					overridequeryaddress := std_logic_vector(to_unsigned(writecursor,9));
					state := WRITING;
					
				when WRITING =>
					out_data_addr := std_logic_vector(to_unsigned(writecursor,12));
					out_data_writedata := "0000000000000000" & ram_rddata;
					out_data_write := '1';					
					overridequery := false;
					state := AFTERWRITE;
					
				when AFTERWRITE =>
					if avmm_data_waitrequest='0' then				
						out_data_write := '0';
						out_csr_addr := '0';  -- read from status register
						out_csr_read := '1';
						state := WAITFORWRITEFINISHED;
					end if;
					
				when WAITFORWRITEFINISHED =>
					if avmm_csr_readdata(1 downto 0) = "00" then
						out_csr_read := '0';
						if writecursor=511 then 
							state := DISABLEWRITE;
						else
							writecursor := writecursor+1;
							state := FETCHFORWRITE;
						end if;
					end if;	

				when DISABLEWRITE =>
					out_csr_addr := '1';  -- write into control register
					out_csr_writedata := 
						"1111"    -- padding
					 & "11110"   -- disable write protecting on sector UFM1
					 & "111"     -- no sector erase operation
					 & "11111111111111111111";  -- no page erase yet					 
					out_csr_write := '1';
					state := AFTERDISABLEWRITE;

				when AFTERDISABLEWRITE =>
					out_csr_write := '0';
					state := IDLE;
				
				end case;
				
			when 2 =>
				tick := 3;
				-- send delayed writing signals to the UFM		
				reset_n <= out_reset;	
				avmm_csr_addr <= out_csr_addr;
				avmm_csr_writedata <= out_csr_writedata;
				avmm_csr_read <= out_csr_read;
				avmm_csr_write <= out_csr_write;
				avmm_data_addr <= out_data_addr;
				avmm_data_read <= out_data_read;
				avmm_data_writedata <= out_data_writedata;
				avmm_data_write <= out_data_write;

			when 3 =>
				tick := 0;
				avmm_clock <= '0';			
			end case;
			

			-- CPU wants to write into registers 
			if WRITEEN='1' and state=IDLE then  
				case to_integer(unsigned(WRITEADDR)) is 
					when 60 => 
						ram_wrdata(7 downto 0) <= WRITEDATA;
					when 61 => 
						ram_wrdata(15 downto 8) <= WRITEDATA;
					when 62 => 
						ram_wraddress <= "0" & WRITEDATA;
						ram_we <= enablebank(0);			
						state := SETREGISTERBANK1;
						
					when 63 =>
						-- enable to write to bank 0 only
						if WRITEDATA="00000000" then   
							enablebank := "01";
						-- enable to write to bank 1 only
						elsif WRITEDATA="00000001" then   
							enablebank := "10";
						-- write to both banks again (magic number 137)
						elsif WRITEDATA="10001001" then   
							enablebank := "11";
						-- start storing data (after clearing the sector)
						elsif WRITEDATA="10001010" then   -- store command : 138
							state := ENABLEWRITE;
						end if;
					when others => null;
				end case;
			-- do second write for second register bank
			elsif state = SETREGISTERBANK1 then
				ram_wraddress(8) <= '1';
				ram_we <= enablebank(1);			
				state := IDLE;
			end if;		
			
		end if;	
		
		-- async processing to splice in a different access address
		REGISTERDATA <= ram_rddata;		
		if overridequery then
			ram_rdaddress <= overridequeryaddress;
		else
			ram_rdaddress <= QUERYREGISTER;
		end if;
	end process;
	
end immediate;

