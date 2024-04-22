-- ----------------------------------------------------------------------------
--                             Entity declaration
-- ----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

Library UNISIM;
use UNISIM.vcomponents.all;

Library work;

entity test_flowblaze is 
    generic (
-- Parameters of AxiStream Slave Bus Interface S00_AXIS
                C_S00_AXIS_DATA_WIDTH  : integer   := 256;
                C_S00_AXIS_TUSER_WIDTH : integer   := 128;
-- Parameters of AxiStream Master Bus Interface M00_AXIS
                C_M00_AXIS_DATA_WIDTH  : integer   := 256;
                C_M00_AXIS_TUSER_WIDTH : integer   := 128;
-- Parameters of Axi Slave Bus Interface S00_AXIS
                C_S00_AXI_DATA_WIDTH  : integer   := 32;
                C_S00_AXI_ADDR_WIDTH  : integer   := 32;
                C_BASEADDR  : std_logic_vector(31 downto 0)   := x"80000000"
--                C_HIGHADDR  : std_logic_vector(31 downto 0)   := x"9FFFFFFF"
            );
    port (
-- Ports of Axi Master Bus Interface M00_AXIS
    
    -- Global ports
                 M0_AXIS_ACLK : in std_logic;
                 M0_AXIS_ARESETN  : in std_logic;
    
    -- Master Stream Ports.
                 M0_AXIS_TVALID   : out std_logic;
                 M0_AXIS_TDATA    : out std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
                 M0_AXIS_TKEEP    : out std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
                 M0_AXIS_TUSER    : out std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
                 M0_AXIS_TLAST    : out std_logic;
                 M0_AXIS_TREADY   : in std_logic;
    
    -- Ports of Axi Stream Slave Bus Interface S00_AXIS
    
                 S0_AXIS_ACLK    : in std_logic;
                 S0_AXIS_ARESETN : in std_logic;
                 S0_AXIS_TVALID  : in std_logic;
                 S0_AXIS_TDATA   : in std_logic_vector(C_S00_AXIS_DATA_WIDTH-1 downto 0);
                 S0_AXIS_TKEEP   : in std_logic_vector((C_S00_AXIS_DATA_WIDTH/8)-1 downto 0);
                 S0_AXIS_TUSER   : in std_logic_vector(C_S00_AXIS_TUSER_WIDTH-1 downto 0);
                 S0_AXIS_TLAST   : in std_logic;
                 S0_AXIS_TREADY  : out std_logic;
    
    -- Ports of Axi Slave Bus Interface S_AXI
                 S_AXI_ACLK        : in std_logic;  
                 S_AXI_ARESETN    : in std_logic;                                     
                 S_AXI_AWADDR    : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);     
                 S_AXI_AWVALID    : in std_logic; 
                 S_AXI_WDATA     : in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0); 
                 S_AXI_WSTRB     : in std_logic_vector(C_S00_AXI_DATA_WIDTH/8-1 downto 0);   
                 S_AXI_WVALID    : in std_logic;                                    
                 S_AXI_BREADY    : in std_logic;                                    
                 S_AXI_ARADDR    : in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
                 S_AXI_ARVALID    : in std_logic;                                     
                 S_AXI_RREADY    : in std_logic;                                     
                 S_AXI_ARREADY    : out std_logic;             
                 S_AXI_RDATA    : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
                 S_AXI_RRESP    : out std_logic_vector(1 downto 0);
                 S_AXI_RVALID    : out std_logic;                                   
                 S_AXI_WREADY    : out std_logic; 
                 S_AXI_BRESP    : out std_logic_vector(1 downto 0);                         
                 S_AXI_BVALID    : out std_logic;                                    
                 S_AXI_AWREADY  : out std_logic 
             );      
         attribute core_generation_info : string;
         attribute core_generation_info of test_flowblaze : entity is "test_flowblaze{x_ipProduct=Vivado 2017.4,x_ipVendor=cnit.it}";
end entity;

architecture full of test_flowblaze is

    
    signal RESETN,RESET   : std_logic;

    
    signal M_DEBUG_TVALID   : std_logic;
    signal M_DEBUG_TDATA    : std_logic_vector(255 downto 0);
    signal M_DEBUG_TKEEP    : std_logic_vector(31 downto 0);
    signal M_DEBUG_TUSER    : std_logic_vector(127 downto 0);
    signal M_DEBUG_TLAST    : std_logic;
    signal M_DEBUG_TREADY   : std_logic;
                 
    
    -- ----------------------------------------------------------------------------
    -- signals for AXI Lite
    -- ----------------------------------------------------------------------------

    --type axi_states is (addr_wait, read_state, write_state, response_state);
    --signal axi_state : axi_states;
    signal axi_state :std_logic_vector(2 downto 0);
    signal address : std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    signal write_enable: std_logic;
    signal read_enable: std_logic;
    signal int_S_AXI_BVALID: std_logic;

    -- ----------------------------------------------------------------------------
    -- signals for ETH decoding 
    -- ----------------------------------------------------------------------------

    type pkt_states is (IDLE, PKT1,PKT2);

    signal curr_state, next_state : pkt_states;
    signal FSMnowait,step: boolean; -- FSMnowait evita pacchetti back to back
    signal stall : std_logic;
    signal dry_stall : std_logic;
    signal halfkey :std_logic_vector(255 downto 0);
    signal current_flowkey,flowkey_1,flowkey_2,flowkey_3,flowkey_4,flowkey_5,flowkey_6,mask_key,flowkey :std_logic_vector(511 downto 0);
    signal flowkey_1v,flowkey_2v,flowkey_3v,flowkey_4v,flowkey_5v,flowkey_6v,flowkey_valid : std_logic;
    signal mask_sip,mask_dip,mask_pair,mask_5tuple: std_logic_vector(511 downto 0);
    signal slot_delayer  : std_logic;
    -- ----------------------------------------------------------------------------
    -- signals for packet classification 
    -- ----------------------------------------------------------------------------
    signal is_IP,is_UDP,is_TCP: boolean;
    signal pkt_len: std_logic_vector(15 downto 0);
    signal src_ip,dst_ip: std_logic_vector(31 downto 0);
    signal src_port,dst_port: std_logic_vector(15 downto 0);
    signal timer: std_logic_vector(63 downto 0);
    signal freq,tick: std_logic_vector(31 downto 0);
    signal nanotimer: std_logic_vector(7 downto 0);
    signal src_if: std_logic_vector(7 downto 0);

    signal int_M0_AXIS_TUSER: std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
    signal int_S0_AXIS_TREADY: std_logic;

    signal release_number,release_date: std_logic_vector(31 downto 0);
    signal reg_test0: std_logic_vector(31 downto 0);
    signal enable_stall: std_logic_vector(31 downto 0);
    signal count_pkt_1   : std_logic_vector(31 downto 0);       
    signal count_bytes_1 : std_logic_vector(31 downto 0);     
    signal count_pkt_2   : std_logic_vector(31 downto 0);     
    signal count_bytes_2 : std_logic_vector(31 downto 0);     
    signal count_pkt_3   : std_logic_vector(31 downto 0);     
    signal count_bytes_3 : std_logic_vector(31 downto 0);     
    signal count_pkt_4   : std_logic_vector(31 downto 0);     
    signal count_bytes_4 : std_logic_vector(31 downto 0);     
    signal num_stalls    : std_logic_vector(31 downto 0);
    
    signal debug_enable    : std_logic_vector(31 downto 0);
    
    signal delayed_M_DEBUG_TVALID,we_timestamp: std_logic; 


    signal MY_BASEADDR  : std_logic_vector(31 downto 0)   := x"80000000";       


    attribute X_INTERFACE_INFO: string;
    attribute X_INTERFACE_INFO of M0_AXIS_ACLK: signal is "xilinx.com:signal:clock:1.0 M0_AXIS_ACLK CLK";
    attribute X_INTERFACE_INFO of S0_AXIS_ACLK: signal is "xilinx.com:signal:clock:1.0 S0_AXIS_ACLK CLK";
    attribute X_INTERFACE_PARAMETER: string;
    attribute X_INTERFACE_PARAMETER of M0_AXIS_ACLK: signal is "ASSOCIATED_BUSIF M0_AXIS";                     
    attribute X_INTERFACE_PARAMETER of S0_AXIS_ACLK: signal is "ASSOCIATED_BUSIF S0_AXIS";                     
    attribute max_fanout:integer;

-- ----------------------------------------------------------------------------
--                             Architecture body
-- ----------------------------------------------------------------------------

 begin

    MY_BASEADDR<=x"80000000";    
    RESETN<=S0_AXIS_ARESETN;
    RESET<=not (S0_AXIS_ARESETN);
    mask_sip(511 downto 240) <= (others   =>'0');
    mask_sip(239 downto 208) <= (others   =>'1'); 
    mask_sip(207 downto 0) <= (others   =>'0');
    
    mask_dip(511 downto 272) <= (others   =>'0'); 
    mask_dip(271 downto 240) <= (others   =>'1'); 
    mask_dip(239 downto 0) <= (others   =>'0'); 
    
    mask_pair <= mask_sip or mask_dip;
     
    mask_5tuple(183 downto 0) <= (others   =>'0'); 
    mask_5tuple(191 downto 184) <= (others   =>'1');  --PROT
    mask_5tuple(207 downto 192) <= (others   =>'0'); 
    mask_5tuple(303 downto 208) <= (others   =>'1');  --SIP,DIP,SP,DP
    mask_5tuple(511 downto 304) <= (others   =>'0'); 
        
-- -------------------------------------------------------------------------
--
-- process to detect if the next word is available
--
-- -------------------------------------------------------------------------

    step_assign: step<= true when (S0_AXIS_TVALID='1') and (int_S0_AXIS_TREADY = '1') and (stall ='0') else false;

-- -------------------------------------------------------------------------
--
-- extract Header ETH-IP-TCP/UDP
--
-- -------------------------------------------------------------------------

    process(S0_AXIS_ACLK, S0_AXIS_ARESETN)
    begin
	if (S0_AXIS_ACLK'event and S0_AXIS_ACLK = '1') then
	    if (S0_AXIS_ARESETN = '0') then
		FSMnowait<=true;
		curr_state <= IDLE;
		
		count_pkt_1   <= (others   =>'0'); 
		count_bytes_1 <= (others   =>'0'); 
		count_pkt_2   <= (others   =>'0'); 
		count_bytes_2 <= (others   =>'0'); 
		count_pkt_3   <= (others   =>'0');  
		count_bytes_3 <= (others   =>'0');  
		count_pkt_4   <= (others   =>'0');  
		count_bytes_4 <= (others   =>'0'); 
	    else              
		flowkey_valid   <=  '0';
		case curr_state is
		    when IDLE =>
			FSMnowait<=true;
			if (step) then
                halfkey(255 downto 0)   <= S0_AXIS_TDATA;
			    src_if <=S0_AXIS_TUSER(23 downto 16);
			    if S0_AXIS_TUSER(23 downto 16)=x"01" then 
				count_pkt_1   <= count_pkt_1 + 1 ;
				count_bytes_1 <= count_bytes_1 + S0_AXIS_TUSER(15 downto 0);
			    elsif S0_AXIS_TUSER(23 downto 16)=x"04" then 
				count_pkt_2   <= count_pkt_2 + 1 ;
				count_bytes_2 <= count_bytes_2 + S0_AXIS_TUSER(15 downto 0);
			    elsif S0_AXIS_TUSER(23 downto 16)=x"10" then 
				count_pkt_3   <= count_pkt_3 + 1 ;
				count_bytes_3 <= count_bytes_3 + S0_AXIS_TUSER(15 downto 0);
			    elsif S0_AXIS_TUSER(23 downto 16)=x"40" then 
				count_pkt_4   <= count_pkt_4 + 1 ;
				count_bytes_4 <= count_bytes_4 + S0_AXIS_TUSER(15 downto 0);
			    end if;

			    curr_state <= PKT1;

			    if (S0_AXIS_TDATA(111 downto 96)=x"0008") then --> 0x0800 reversed
				if (S0_AXIS_TDATA(191 downto 184)=x"11") then --FIXME does not check eth header lenght
				    is_UDP<=true;
				end if;
				if (S0_AXIS_TDATA(191 downto 184)=x"06") then --FIXME does not check eth header lenght
				    is_TCP<=true;
				end if;
                    src_ip <= S0_AXIS_TDATA(239 downto 208);
                    dst_ip(15 downto 0) <=S0_AXIS_TDATA(255 downto 240);
			    end if; --IS_IP 
			end if;
			if (step and S0_AXIS_TLAST='1') then
			    curr_state <= IDLE;
			end if;                        

		    when PKT1 =>
			if (step) then
			    flowkey_valid   <=  '1';
                flowkey(255 downto 0)   <= halfkey and mask_key(255 downto 0);
                flowkey(511 downto 256) <= S0_AXIS_TDATA and mask_key(511 downto 256);
                dst_ip(31 downto 16)    <= S0_AXIS_TDATA(15 downto 0);
                if (is_TCP or is_UDP) then
                      src_port <= S0_AXIS_TDATA(31 downto 16);
                      dst_port <= S0_AXIS_TDATA(47 downto 32);
                end if;
			    curr_state <= PKT2;
			end if;
			if (step and S0_AXIS_TLAST='1') then
			    curr_state <= IDLE;
			end if;
		    when PKT2 =>
			if (step and S0_AXIS_TLAST='1') then
			    curr_state <= IDLE;
			end if;
		end case;
            end if;
        end if;
    end process;

current_flowkey(255 downto 0)   <= halfkey and mask_key(255 downto 0);
current_flowkey(511 downto 256) <= S0_AXIS_TDATA and mask_key(511 downto 256);
               
stall <= dry_stall when (enable_stall =x"ffffffff") else '0'; --'0'; --dry_stall;
dry_stall <= '1' when ((flowkey_2v='1') and (current_flowkey=flowkey_1) and (curr_state = PKT1) )  else 
             '1' when ((flowkey_2v='1') and (current_flowkey=flowkey_2) and (curr_state = PKT1) ) else 
             '1' when ((flowkey_3v='1') and (current_flowkey=flowkey_3) and (curr_state = PKT1) ) else 
             '1' when ((flowkey_4v='1') and (current_flowkey=flowkey_4) and (curr_state = PKT1) ) else 
             '1' when ((flowkey_5v='1') and (current_flowkey=flowkey_5) and (curr_state = PKT1) ) else 
             '1' when ((flowkey_6v='1') and (current_flowkey=flowkey_6) and (curr_state = PKT1) ) else 
             '0';


  process (S0_AXIS_ACLK)
    begin
	if (rising_edge(S0_AXIS_ACLK)) then
	    if (RESET = '1') then
        num_stalls <= (others =>'0');
		flowkey_1 <=  (others =>'0');
		flowkey_2 <=  (others =>'0');
		flowkey_3 <=  (others =>'0');
		flowkey_4 <=  (others =>'0');
		flowkey_5 <=  (others =>'0');
		flowkey_6 <=  (others =>'0');
		flowkey_1v <= '0';
		flowkey_2v <= '0';
		flowkey_3v <= '0';
		flowkey_4v <= '0';
		flowkey_5v <= '0';
		flowkey_6v <= '0';
	    else
          if (dry_stall='1') then 
		    num_stalls <= num_stalls +1;
		  end if;
		flowkey_6 <= flowkey_5; 
		flowkey_5 <= flowkey_4; 
		flowkey_4 <= flowkey_3; 
		flowkey_3 <= flowkey_2; 
		flowkey_2 <= flowkey_1; 
		flowkey_1 <= flowkey; 
		flowkey_6v <= flowkey_5v; 
		flowkey_5v <= flowkey_4v; 
		flowkey_4v <= flowkey_3v; 
		flowkey_3v <= flowkey_2v; 
		flowkey_2v <= flowkey_1v; 
		flowkey_1v <= flowkey_valid; 
	    end if;
        end if;
    end process;
    
    
    process (S0_AXIS_ACLK)
    begin
        if (rising_edge(S0_AXIS_ACLK)) then
            if (RESET = '1') then

                M_DEBUG_TVALID<='0';
                delayed_M_DEBUG_TVALID<='0';
                M_DEBUG_TLAST  <= '0';
                M_DEBUG_TDATA  <= (others =>'0');
                M_DEBUG_TUSER  <= (others =>'0');
                M_DEBUG_TKEEP  <= (others =>'0');
                                
                nanotimer<= (others => '0');
                timer(31 downto 0) <=  (others => '0'); --x"00007530"; --initial_timestamp;
                timer(63 downto 32)<= (others => '0');
                tick <= (others => '0');
            else
                M_DEBUG_TUSER(127 downto 32)  <= (others =>'0');
                M_DEBUG_TUSER(31 downto 0) <= x"02010040"; -- check this: 02 dovrebbe essere una PCI host interface
                M_DEBUG_TKEEP  <= (others =>'1');
                delayed_M_DEBUG_TVALID<='0'; 
                M_DEBUG_TVALID <= delayed_M_DEBUG_TVALID;
                M_DEBUG_TLAST  <= delayed_M_DEBUG_TVALID;
		
                --secondo frame di DEBUG msg
		        M_DEBUG_TDATA <= x"01" & count_pkt_3 & count_pkt_4 & count_bytes_1 & count_bytes_2 & count_bytes_3 & count_bytes_4 & num_stalls & x"000000";
                
                                
                nanotimer <= nanotimer+1;
                if (((nanotimer=x"85") and (freq=x"00")) or  --133 MHz
                   ((nanotimer=x"9C")  and (freq=x"01")) or  --156 Mhz
                   ((nanotimer=x"A6")  and (freq=x"02")) or  --166 MHz
                   ((nanotimer=x"B4")  and (freq=x"03")) or  --180 MHz
                   ((nanotimer=x"C8")  and (freq=x"04")))    --200 MHz
                then
                    nanotimer <= x"00";
                    timer <= timer+1;
                    tick  <= tick+1;
                end if;
                if ((tick = x"3E8") and (debug_enable=x"00000001")) then
                    tick <= x"00000000";
                    M_DEBUG_TVALID<= '1'; 
                    delayed_M_DEBUG_TVALID<= '1';
                    M_DEBUG_TLAST  <= '0';
                    --primo frame di DEBUG msg
                    M_DEBUG_TDATA <= x"01" & count_pkt_1 & count_pkt_2 & x"00000000000000" & x"0045" & x"0008" & x"010c42363996" & x"3633159196B4";
                end if;
            end if;
        end if;
    end process;

    -- -------------------------------------------------------------------------
    --  ADDRESS:
    -- 0x8000 0000 : Release number
    -- 0x8000 0004 : Release DATE 
    -- 0x8000 0008 : reg_test0
    -- 0x8000 000C : freq
    -- ..
    -- -------------------------------------------------------------------------


    -- unused signals
    S_AXI_BRESP <= "00";
    S_AXI_RRESP <= "00";

    -- axi-lite slave state machine
    AXI_SLAVE_FSM: process (S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN='0' then -- slave reset state
                S_AXI_RVALID <= '0';
                int_S_AXI_BVALID <= '0';
                S_AXI_ARREADY <= '0';
                S_AXI_WREADY <= '0';
                S_AXI_AWREADY <= '0';
                --axi_state <= addr_wait;
                axi_state <= "000";
                address <= (others=>'0');
                write_enable <= '0';
            else
                case axi_state is
                    --when addr_wait => 
                    when "000" => 
                        S_AXI_AWREADY <= '1';
                        S_AXI_ARREADY <= '1';
                        S_AXI_WREADY <= '0';
                        S_AXI_RVALID <= '0';
                        int_S_AXI_BVALID <= '0';
                        read_enable <= '0';
                        write_enable <= '0';
                        -- wait for a read or write address and latch it in
                        
                        if (S_AXI_ARVALID = '1') then -- read
                            --axi_state <= read_state;
                            axi_state <= "001";   -- TODO: only when curr_state=IDLE. Also put pause=1
                            address <= S_AXI_ARADDR - (MY_BASEADDR -x"80000000");
                            read_enable <= '1';
                        elsif (S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' ) then -- write
                            --axi_state <= write_state;
                            axi_state <= "100";
                            address <= S_AXI_AWADDR - (MY_BASEADDR -x"80000000");
                        else
                            --axi_state <= addr_wait;
                            axi_state <= "000";
                        end if;

                    --when read_state (wait1) =>
                    when "001" =>
                        read_enable <= '1';
                        S_AXI_AWREADY <= '0';
                        S_AXI_ARREADY <= '0';
                        -- place correct data on bus and generate valid pulse
                        int_S_AXI_BVALID <= '0';
                        S_AXI_RVALID <= '0';
                        --axi_state <= read_wait2;
                        axi_state <= "010";

                    --when read_state (wait2) =>
                    when "010" =>
                        read_enable <= '1';
                        S_AXI_AWREADY <= '0';
                        S_AXI_ARREADY <= '0';
                        -- place correct data on bus and generate valid pulse
                        int_S_AXI_BVALID <= '0';
                        S_AXI_RVALID <= '0';
                        --axi_state <= response_state;
                        axi_state <= "011";

                    --when read_state =>
                    when "011" =>
                        read_enable <= '1';
                        S_AXI_AWREADY <= '0';
                        S_AXI_ARREADY <= '0';
                        -- place correct data on bus and generate valid pulse
                        int_S_AXI_BVALID <= '0';
                        S_AXI_RVALID <= '1';
                        --axi_state <= response_state;
                        axi_state <= "111";

                    --when write_state =>
                    when "100" =>
                        -- generate a write pulse
                        write_enable <= '1';
                        S_AXI_AWREADY <= '0';
                        S_AXI_ARREADY <= '0';
                        S_AXI_WREADY <= '1';
                        int_S_AXI_BVALID <= '1';
                        --axi_state <= response_state;
                        axi_state <= "111";

                    --when response_state =>
                    when "111" =>
                        read_enable <= '0';
                        write_enable <= '0';
                        S_AXI_AWREADY <= '0';
                        S_AXI_ARREADY <= '0';
                        S_AXI_WREADY <= '0';
                        -- wait for response from master
                        if (int_S_AXI_BVALID = '0' and S_AXI_RREADY = '1') or (int_S_AXI_BVALID = '1' and S_AXI_BREADY = '1') then
                            S_AXI_RVALID <= '0';
                            int_S_AXI_BVALID <= '0';
                            --axi_state <= addr_wait;
                            axi_state <= "000";
                        else
                            --axi_state <= response_state;
                            axi_state <= "111";
                        end if;
                    when others =>
                        null; 
                end case;
            end if;
        end if;
    end process;
    S_AXI_BVALID <= int_S_AXI_BVALID;


    REG_WRITE_PROCESS: process(S_AXI_ACLK)
    begin
	if (S_AXI_ACLK'event and S_AXI_ACLK = '1') then
	    we_timestamp<='0';
	    if (S_AXI_ARESETN = '0') then
		freq <=x"00000000";
		debug_enable <=x"00000000";
		mask_key <= (others => '1');
		enable_stall<= (others => '1');
		reg_test0<= (others => '0');

	    elsif (write_enable='1') then
		if (address=x"80000008") then
		    reg_test0 <= S_AXI_WDATA;
		end if;
		if (address=x"8000000C") then
		    freq <= S_AXI_WDATA;
		end if;
		if address = x"80000010" then             
		    mask_key(31 downto 0)    <= S_AXI_WDATA; 
		end if;
		if address = x"80000014" then             
		    mask_key(63 downto 32)   <= S_AXI_WDATA;
		end if;
		if address = x"80000018" then            
		    mask_key(95 downto 64)   <= S_AXI_WDATA;
		end if;
		if address = x"8000001C" then            
		    mask_key(127 downto 96)  <= S_AXI_WDATA;
		end if;
		if address = x"80000020" then            
		    mask_key(159 downto 128) <= S_AXI_WDATA;
		end if;
		if address = x"80000024" then            
		    mask_key(191 downto 160) <= S_AXI_WDATA;
		end if;
		if address = x"80000028" then            
		    mask_key(223 downto 192) <= S_AXI_WDATA;
		end if;
		if address = x"8000002C" then            
		    mask_key(255 downto 224) <= S_AXI_WDATA;
		end if;
		if address = x"80000030" then            
		    mask_key(287 downto 256) <= S_AXI_WDATA;
		end if;
		if address = x"80000034" then            
		    mask_key(319 downto 288) <= S_AXI_WDATA;
		end if;
		if address = x"80000038" then            
		    mask_key(351 downto 320) <= S_AXI_WDATA;
		end if;
		if address = x"8000003C" then            
		    mask_key(383 downto 352) <= S_AXI_WDATA;
		end if;
		if address = x"80000040" then            
		    mask_key(415 downto 384) <= S_AXI_WDATA;
		end if;
		if address = x"80000044" then            
		    mask_key(447 downto 416) <= S_AXI_WDATA;
		end if;
		if address = x"80000048" then            
		    mask_key(479 downto 448) <= S_AXI_WDATA;
		end if;
		if address = x"8000004C" then            
		    mask_key(511 downto 480) <= S_AXI_WDATA;
		end if;
		if address = x"80000050" then
		    debug_enable <= S_AXI_WDATA;
		end if;
		if address = x"80000054" then
		    enable_stall <= S_AXI_WDATA;
		end if;                
		if address = x"80000060" then
            if (S_AXI_WDATA =x"00000000") then
		        mask_key <= (others =>'0');
		    end if;
            if (S_AXI_WDATA =x"00000001") then
		        mask_key <= (others =>'1');
		   end if;
		    if (S_AXI_WDATA =x"00000002") then
                mask_key <= mask_sip;
            end if;
		    if (S_AXI_WDATA =x"00000003") then
                mask_key <= mask_dip;
            end if;
            if (S_AXI_WDATA =x"00000004") then
                mask_key <= mask_pair;
            end if;
            if (S_AXI_WDATA =x"00000005") then
                mask_key <= mask_5tuple;
            end if;
		end if;                
	    end if;
	end if;
    end process;

    release_number<=x"12345678";

	    U0: USR_ACCESSE2 port map( DATA => release_date);

    --REG_READ_PROCESS:
S_AXI_RDATA<= release_number     when address = x"80000000" else
			  release_date       when address = x"80000004" else 
              reg_test0          when address = x"80000008" else 
              freq               when address = x"8000000C" else
              mask_key(31 downto 0)    when address = x"80000010" else            
              mask_key(63 downto 32)   when address = x"80000014" else            
              mask_key(95 downto 64)   when address = x"80000018" else            
              mask_key(127 downto 96)  when address = x"8000001C" else            
              mask_key(159 downto 128) when address = x"80000020" else            
              mask_key(191 downto 160) when address = x"80000024" else            
              mask_key(223 downto 192) when address = x"80000028" else            
              mask_key(255 downto 224) when address = x"8000002C" else            
              mask_key(287 downto 256) when address = x"80000030" else            
              mask_key(319 downto 288) when address = x"80000034" else            
              mask_key(351 downto 320) when address = x"80000038" else            
              mask_key(383 downto 352) when address = x"8000003C" else            
              mask_key(415 downto 384) when address = x"80000040" else            
              mask_key(447 downto 416) when address = x"80000044" else            
              mask_key(479 downto 448) when address = x"80000048" else            
              mask_key(511 downto 480) when address = x"8000004C" else  
              debug_enable  when address = x"80000050" else  
              enable_stall  when address = x"80000054" else  
              count_pkt_1   when address = x"80000100" else
              count_pkt_2   when address = x"80000104" else
              count_pkt_3   when address = x"80000108" else
              count_pkt_4   when address = x"8000010C" else
              count_bytes_1 when address = x"80000200" else
              count_bytes_2 when address = x"80000204" else
              count_bytes_3 when address = x"80000208" else
              count_bytes_4 when address = x"8000020C" else
              num_stalls    when address = x"80000300" else     
              timer(31 downto 0) when address = x"80000400" else
              timer(63 downto 32) when address = x"80000404" else
              x"deadbeef";
            
--DELAYER

    M0_AXIS_TUSER<= int_M0_AXIS_TUSER(127 downto 32) & int_M0_AXIS_TUSER(23 downto 16) & int_M0_AXIS_TUSER(23 downto 0) when reg_test0=x"00000000" else
                    int_M0_AXIS_TUSER(127 downto 32) & reg_test0(7 downto 0) & int_M0_AXIS_TUSER(23 downto 0); 


    slot_delayer <= '1'; --'0' when (curr_state = PKT1 and S0_AXIS_TVALID='0') else '1';
    delayer_axi_i: entity work.delayer_axi
        generic map (DELAY_LENGHT =>5)
        port map (
                     -- Global ports
                     enable          => '1',
		     slot            => slot_delayer,
                     S0_AXIS_ACLK    => M0_AXIS_ACLK   ,
                     S0_AXIS_ARESETN => M0_AXIS_ARESETN,
    
                     -- Master Stream ports.
                     M0_AXIS_TVALID  => M0_AXIS_TVALID ,
                     M0_AXIS_TDATA   => M0_AXIS_TDATA  ,
                     M0_AXIS_TKEEP   => M0_AXIS_TKEEP  ,
                     M0_AXIS_TUSER   => int_M0_AXIS_TUSER,
                     M0_AXIS_TLAST   => M0_AXIS_TLAST  ,
                     M0_AXIS_TREADY  => M0_AXIS_TREADY ,
    
                     -- Slave Stream ports.
                     S0_AXIS_TVALID  => S0_AXIS_TVALID ,
                     S0_AXIS_TDATA   => S0_AXIS_TDATA  ,
                     S0_AXIS_TKEEP   => S0_AXIS_TKEEP  ,
                     S0_AXIS_TUSER   => S0_AXIS_TUSER  ,
                     S0_AXIS_TLAST   => S0_AXIS_TLAST  ,
                     S0_AXIS_TREADY  => int_S0_AXIS_TREADY  
                 );
    
        
    S0_AXIS_TREADY<=int_S0_AXIS_TREADY and not stall;              
--    S0_AXIS_TREADY<= not stall;              

end architecture full;
