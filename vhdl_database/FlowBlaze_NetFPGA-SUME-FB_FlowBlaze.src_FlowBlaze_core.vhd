-- ----------------------------------------------------------------------------
--                             Entity declaration
-- ----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

Library UNISIM;
use UNISIM.vcomponents.all;
use work.salutil.all;

Library cam;

entity FlowBlaze_core is 
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

-- Master Stream Ports.
	M_DEBUG   : out axis;

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
             S_AXI_ACLK	    : in std_logic;  
             S_AXI_ARESETN	: in std_logic;                                     
             S_AXI_AWADDR	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);     
             S_AXI_AWVALID	: in std_logic; 
             S_AXI_WDATA 	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0); 
             S_AXI_WSTRB 	: in std_logic_vector(C_S00_AXI_DATA_WIDTH/8-1 downto 0);   
             S_AXI_WVALID	: in std_logic;                                    
             S_AXI_BREADY	: in std_logic;                                    
             S_AXI_ARADDR	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
             S_AXI_ARVALID	: in std_logic;                                     
             S_AXI_RREADY	: in std_logic;                                     
             S_AXI_ARREADY	: out std_logic;             
             S_AXI_RDATA	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
             S_AXI_RRESP	: out std_logic_vector(1 downto 0);
             S_AXI_RVALID	: out std_logic;                                   
             S_AXI_WREADY	: out std_logic; 
             S_AXI_BRESP	: out std_logic_vector(1 downto 0);                         
             S_AXI_BVALID	: out std_logic;                                    
             S_AXI_AWREADY  : out std_logic 
         );
end entity;

architecture full of FlowBlaze_core is

    
    signal write_in,write_out,modify_out: axis;
    signal write_TREADY,write_in_TREADY,write_out_TREADY,modify_in_TREADY,modify_out_TREADY:std_logic;
    signal enable_write,enable_modify: std_logic;
    
    function myror (L: std_logic_vector; R: integer) return std_logic_vector is
    begin
        return to_stdlogicvector(to_bitvector(L) ror R);
    end function myror;

    signal RESETN,RESET   : std_logic;

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

    type fsm_states is (IDLE, PKT1,PKT2,WAIT5);
    --type fsm_states is (IDLE, PKT1,PKT2,PKT3,PKT4,PKT5);
    type full_header_type is array (11 downto 0) of std_logic_vector(431 downto 0);

    signal curr_state, next_state : fsm_states;
    --signal FSMnowait,step: boolean;
    signal FSMnowait,step: boolean;
    
-- ----------------------------------------------------------------------------
-- signals for packet classification 
-- ----------------------------------------------------------------------------
    signal is_IP,is_UDP,is_TCP: boolean;
    signal src_if: std_logic_vector(7 downto 0);
    signal dst_if: std_logic_vector(7 downto 0);
    signal pkt_len: std_logic_vector(15 downto 0);
    signal metadata1: std_logic_vector(31 downto 0);
    signal metadata2: std_logic_vector(31 downto 0);
    signal random: std_logic_vector(31 downto 0);
    signal timer: std_logic_vector(63 downto 0);
    signal enable_timer: std_logic;
    signal timestamp: std_logic_vector(31 downto 0);
    signal threshold: std_logic_vector(31 downto 0);
    signal conditions: std_logic_vector(15 downto 0);
    signal src_mac,dst_mac: std_logic_vector(47 downto 0);
    signal src_ip,dst_ip: std_logic_vector(31 downto 0);
    signal src_port,dst_port: std_logic_vector(15 downto 0);
    signal full_header: std_logic_vector(431 downto 0);
    signal full_header_d: full_header_type;
    signal full_input_1: std_logic_vector(127 downto 0);
    signal full_input_ht: std_logic_vector(127 downto 0);
    signal full_input_2: std_logic_vector(119 downto 0);
    signal data_ht: std_logic_vector(255 downto 0);


-- ----------------------------------------------------------------------------
-- stats  
-- ----------------------------------------------------------------------------
    signal ip_count,tcp_count,udp_count:std_logic_vector(31 downto 0);
    --signal ip_count1,tcp_count1,udp_count1:std_logic_vector(31 downto 0);
    --signal ip_count2,tcp_count2,udp_count2:std_logic_vector(31 downto 0);
    --signal ip_count3,tcp_count3,udp_count3:std_logic_vector(31 downto 0);
    --signal ip_count4,tcp_count4,udp_count4:std_logic_vector(31 downto 0);

    signal  match_ht,match_t1, match_t2: std_logic;
    signal  startd     : std_logic_vector(11 downto 0);
    signal  start      : std_logic;
    signal  idle_opp   : std_logic;        
    signal  release_number,release_date: std_logic_vector(31 downto 0);
    signal  match_addr_tcam1, match_addr_tcam2: std_logic_vector (4 downto 0);	
    signal  addr_ram1, addr_ram2,addr_ram3: std_logic_vector (4 downto 0);	
    signal  flow_state_tcam1: std_logic_vector (31 downto 0);	
    signal  flow_state_tcam2: std_logic_vector (31 downto 0);
    signal  flow_state_tcam2_d3: std_logic_vector (31 downto 0);		
    signal  timeout: std_logic_vector (31 downto 0);

    signal  flow_context: std_logic_vector (125 downto 0);

    signal  R1: std_logic_vector (31 downto 0);
    signal  R1d: std_logic_vector (31 downto 0);
    signal  R1dd: std_logic_vector (31 downto 0);
    signal  O1: std_logic_vector (31 downto 0);
    signal  Res1: std_logic_vector (31 downto 0);

    signal  R2: std_logic_vector (31 downto 0);
    signal  R2d: std_logic_vector (31 downto 0);
    signal  R2dd: std_logic_vector (31 downto 0);
    signal  O2: std_logic_vector (31 downto 0);
    signal  Res2: std_logic_vector (31 downto 0);

    signal  R3: std_logic_vector (31 downto 0);
    signal  R3d: std_logic_vector (31 downto 0);
    signal  R3dd: std_logic_vector (31 downto 0);
    signal  O3: std_logic_vector (31 downto 0);
    signal  Res3: std_logic_vector (31 downto 0);

    signal  OffO1: std_logic_vector (5 downto 0);
    signal  LenO1: std_logic_vector (1 downto 0);

    signal  OffO2: std_logic_vector (5 downto 0);
    signal  LenO2: std_logic_vector (1 downto 0);

    signal  OffO3: std_logic_vector (5 downto 0);
    signal  LenO3: std_logic_vector (1 downto 0);



    signal  update_context: std_logic_vector (125 downto 0);	



    signal  we_r1,we_r2,we_r3,we_r4,we_pipealu:std_logic;
    signal  ht_rd: std_logic;	

    signal  ht_en,ht_we,cam1_we,cam2_we:std_logic;
    signal  tcam_mask : std_logic_vector(255 downto 0);
    signal  tcam_data_in : std_logic_vector(255 downto 0);
    signal 	read_from_ram1,read_from_ram2,read_from_ram3,read_from_ram4 :std_logic_vector(31 downto 0);
    signal  ht_data_in : std_logic_vector(255 downto 0);


--signal  lookup_mask: std_logic_vector(335 downto 0);
    signal  lookup_scope: std_logic_vector(31 downto 0);
    signal  FSM_scope: std_logic_vector(31 downto 0);
    signal  update_scope: std_logic_vector(31 downto 0);
    signal  action_value: std_logic_vector(31 downto 0);
    signal  pause,reg_test0: std_logic_vector(31 downto 0);


    signal  aluGR0, GR0: std_logic_vector(31 downto 0);
    signal  aluGR1, GR1: std_logic_vector(31 downto 0);
    signal  aluGR2, GR2: std_logic_vector(31 downto 0);
    signal  aluGR3, GR3: std_logic_vector(31 downto 0);
--    signal  aluGR4, GR4: std_logic_vector(31 downto 0);
--    signal  aluGR5, GR5: std_logic_vector(31 downto 0);
--    signal  aluGR6, GR6: std_logic_vector(31 downto 0);
--    signal  aluGR7, GR7: std_logic_vector(31 downto 0);
--    signal  aluGR8, GR8: std_logic_vector(31 downto 0);
--    signal  aluGR9, GR9: std_logic_vector(31 downto 0);
--    signal  aluGR10, GR10: std_logic_vector(31 downto 0);
--    signal  aluGR11, GR11: std_logic_vector(31 downto 0);
--    signal  aluGR12, GR12: std_logic_vector(31 downto 0);
--    signal  aluGR13, GR13: std_logic_vector(31 downto 0);
--    signal  aluGR14, GR14: std_logic_vector(31 downto 0);
--    signal  aluGR15, GR15: std_logic_vector(31 downto 0);

-- ----------------------------------------------------------------------------
-- action signals 
-- ----------------------------------------------------------------------------
    signal  mask_lookup:   std_logic_vector(127 downto 0);
    signal  mask_update:   std_logic_vector(127 downto 0);
    signal  action_header: std_logic_vector(127 downto 0);
    signal  update_key: std_logic_vector(127 downto 0);
    signal  slot_delayer,enable_delay  : std_logic;
    signal  enable_ht     : std_logic;
    signal  remove_action: std_logic;
    signal  insert_action: std_logic;
    signal  drop_action:   std_logic;
    
    signal modify_offset :std_logic_vector(13 downto 0);
    signal modify_size   :std_logic_vector(1 downto 0);
    signal modify_field  :std_logic_vector(31 downto 0);


    signal int_M0_AXIS_TUSER: std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
    signal int_S0_AXIS_TVALID,int_S0_AXIS_TREADY: std_logic;

    signal 	action:std_logic_vector(31 downto 0);
    signal action_d3:std_logic_vector(31 downto 0);
    signal action_value_d3:std_logic_vector(31 downto 0);


-- ----------------------------------------------------------------------------
-- checksum signals 
-- ----------------------------------------------------------------------------
    signal oldIPchksum,oldTCPchksum: std_logic_vector(17 downto 0);
    signal newIPchksum,newTCPchksum: std_logic_vector(15 downto 0);
    signal out_dst_ip,t1,tt1: std_logic_vector(17 downto 0);
    signal t2,tt2: std_logic_vector(16 downto 0);
    signal t3,tt3: std_logic_vector(15 downto 0);



    signal tot_num_entry_stash,num_entry_stash,num_present : std_logic_vector(31 downto 0);
    signal count_cuckoo_insert : std_logic_vector(31 downto 0);
    signal count_collision : std_logic_vector(31 downto 0);
    signal count_item      : std_logic_vector(31 downto 0);
    signal evicted_entry : std_logic_vector(31 downto 0);  
    signal clear_count_collision : std_logic;
         
    signal write_M0_AXIS_TVALID   : std_logic;
    signal write_M0_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
    signal write_M0_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
    signal write_M0_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
    signal write_M0_AXIS_TLAST    : std_logic;
    signal write_M0_AXIS_TREADY   : std_logic;

    signal start_Lfsr :std_logic:='0';
    signal finish_lfsr: std_logic;
    signal id: std_logic_vector(1 downto 0):=(others=>'0');
     signal LFSR_Data: std_logic_vector(31 downto 0):=(others=>'0');
     
     signal CR1: std_logic_vector(31 downto 0):=(others=>'0');
     signal CR2: std_logic_vector(31 downto 0):=(others=>'0');
     signal CR3: std_logic_vector(31 downto 0):=(others=>'0');
     signal CR4: std_logic_vector(31 downto 0):=(others=>'0');
     signal  op3, op4, op5,op6, op7,op8 : std_logic_vector(31 downto 0);

  
  signal full_input_2_debug : std_logic_vector(31 downto 0);
  signal flow_state_tcam2_debug : std_logic_vector(31 downto 0);
  signal match_addr_tcam2_debug : std_logic_vector(31 downto 0);
  signal update_context_debug_1,update_context_debug_2 : std_logic_vector(31 downto 0);
  signal action_debug : std_logic_vector(31 downto 0);
  signal full_input_1_1_debug: std_logic_vector(31 downto 0);
  signal full_input_1_2_debug: std_logic_vector(31 downto 0);
  signal full_input_ht_1_debug: std_logic_vector(31 downto 0);
  signal full_input_ht_2_debug:std_logic_vector(31 downto 0);
  signal flow_context_debug_2:std_logic_vector(31 downto 0);
  signal flow_context_debug_1:std_logic_vector(31 downto 0);
  signal count_startd_3:std_logic_vector(31 downto 0);
  signal count_step :std_logic_vector(31 downto 0);
   signal count_step_1 :std_logic_vector(31 downto 0);
     signal count_step_2 :std_logic_vector(31 downto 0); 
     signal count_startp_3 :std_logic_vector(31 downto 0);
     signal count_start :std_logic_vector(31 downto 0);
     signal count_frames: std_logic_vector(31 downto 0);
     signal startp :std_logic_vector(11 downto 0);
     signal start_p:std_logic;   



  attribute mark_debug: string;
  attribute max_fanout:integer;
  attribute keep:string;
  attribute dont_touch:string;
    
  attribute keep of startd   :signal is "TRUE";
  attribute dont_touch of startd   :signal is "TRUE";
  attribute mark_debug of startd   :signal is "TRUE";
    
  attribute keep of start    :signal is "TRUE";
  attribute dont_touch of start    :signal is "TRUE";
  attribute mark_debug of start    :signal is "TRUE";
    
  attribute keep of step    :signal is "TRUE";
  attribute dont_touch of step    :signal is "TRUE";
  attribute mark_debug of step    :signal is "TRUE";
    
  attribute keep of curr_state          :signal is "TRUE";
  attribute dont_touch of curr_state    :signal is "TRUE";
  attribute mark_debug of curr_state    :signal is "TRUE";
  
  attribute keep of count_frames          :signal is "TRUE";
  attribute dont_touch of count_frames    :signal is "TRUE";
  attribute mark_debug of count_frames    :signal is "TRUE";
  
  attribute keep of S0_AXIS_TVALID          :signal is "TRUE";
  attribute dont_touch of S0_AXIS_TVALID    :signal is "TRUE";
  attribute mark_debug of S0_AXIS_TVALID    :signal is "TRUE";
    
  attribute keep of int_S0_AXIS_TREADY          :signal is "TRUE";
  attribute dont_touch of int_S0_AXIS_TREADY    :signal is "TRUE";
  attribute mark_debug of int_S0_AXIS_TREADY    :signal is "TRUE";
      
  attribute keep of int_S0_AXIS_TVALID          :signal is "TRUE";
  attribute dont_touch of int_S0_AXIS_TVALID    :signal is "TRUE";
  attribute mark_debug of int_S0_AXIS_TVALID    :signal is "TRUE";
    
  attribute keep of full_input_1          :signal is "TRUE";
  attribute dont_touch of full_input_1    :signal is "TRUE";
  attribute mark_debug of full_input_1    :signal is "TRUE";
          
  attribute keep of full_input_2          :signal is "TRUE";
  attribute dont_touch of full_input_2    :signal is "TRUE";
  attribute mark_debug of full_input_2    :signal is "TRUE";
      
  attribute keep of insert_action          :signal is "TRUE";
  attribute dont_touch of insert_action    :signal is "TRUE";
  attribute mark_debug of insert_action    :signal is "TRUE";
    
  attribute keep of action          :signal is "TRUE";
  attribute dont_touch of action    :signal is "TRUE";
  attribute mark_debug of action    :signal is "TRUE";
     
  attribute keep of match_ht          :signal is "TRUE";
  attribute dont_touch of match_ht    :signal is "TRUE";
  attribute mark_debug of match_ht    :signal is "TRUE";
    
    


-- ----------------------------------------------------------------------------
--                             Architecture body
-- ----------------------------------------------------------------------------

begin

    RESETN<=S0_AXIS_ARESETN;
    RESET<=not (S0_AXIS_ARESETN);



    --M_DEBUG_TVALID<='0';
    M_DEBUG.TUSER(127 downto 32)  <= (others =>'0');
    M_DEBUG.TUSER(31 downto 0) <= x"02100060";
    M_DEBUG.TKEEP  <= (others =>'1');
    M_DEBUG.TLAST  <= startd(3);--startd(5);
    M_DEBUG.TVALID <= startd(1) or startd(2) or startd(3);
    M_DEBUG.TDATA  <= match_ht & "0000000" &  full_input_ht(31 downto 0) & full_input_2(31 downto 0) & "000" & match_addr_tcam2 & flow_state_tcam2 & x"3200" & x"0045" & x"0008" & x"010c42363996" & x"3633159196B4";




-- -------------------------------------------------------------------------
--
-- process to detect if the next word is available
--
-- -------------------------------------------------------------------------

    step_assign: step<= true when (S0_AXIS_TVALID='1') and (int_S0_AXIS_TREADY = '1') else false;

-- -------------------------------------------------------------------------
--
-- extract Header ETH-IP-TCP/UDP
--
-- -------------------------------------------------------------------------

    --process(S0_AXIS_ACLK, S0_AXIS_ARESETN)
      process(S0_AXIS_ACLK)
    begin
        if (S0_AXIS_ACLK'event and S0_AXIS_ACLK = '1') then
            if (S0_AXIS_ARESETN = '0') then
                --FSMnowait<=true;
                curr_state <= IDLE;
                full_header <= (others => '0');
                start <='0';
                --startd<= (others => '0');
                ip_count<= (others => '0');
                udp_count<= (others => '0');
                tcp_count<= (others => '0');
                count_step_1<= (others => '0');
                count_step<= (others => '0');
                count_step_2<= (others => '0');
		        count_frames<=  (others => '0');
            else              
		        count_frames<= count_frames+1;
                case curr_state is
                    when IDLE =>
                        start <='0';
			            
                        --FSMnowait<=true;
                        if (step) then
                            count_step<=count_step+1;
                            curr_state <= PKT1;
                            pkt_len <= S0_AXIS_TUSER(15 downto 0);
			                dst_if <= S0_AXIS_TUSER(31 downto 24);
                            src_if <= S0_AXIS_TUSER(23 downto 16);
                            metadata1 <= S0_AXIS_TUSER(63 downto 32);
                            metadata2 <= S0_AXIS_TUSER(95 downto 64);

                            dst_mac <= S0_AXIS_TDATA(47 downto 0);
                            src_mac <= S0_AXIS_TDATA(95 downto 48);
                            full_header(255 downto 0) <=S0_AXIS_TDATA;
                            src_ip <= (others => '0');
                            dst_ip <= (others => '0');
                            src_port <= (others => '0');
                            dst_port <= (others => '0');
                            is_ip<=false;
                            is_UDP<=false;
                            is_TCP<=false;
                            if (S0_AXIS_TDATA(111 downto 96)=x"0008") then --> 0x0800 reversed
                                ip_count <= ip_count+1;
                                is_ip<=true;
                                if (S0_AXIS_TDATA(191 downto 184)=x"11") then --FIXME does not check eth header lenght
                                    udp_count <= udp_count+1;
                                    is_UDP<=true;
                                end if;
                                if (S0_AXIS_TDATA(191 downto 184)=x"06") then --FIXME does not check eth header lenght
                                    tcp_count <= tcp_count+1;
                                    is_TCP<=true;
                                end if;
                                src_ip <= S0_AXIS_TDATA(239 downto 208);
                                dst_ip(15 downto 0) <=S0_AXIS_TDATA(255 downto 240);
                            end if; --IS_IP 
                        end if;
                    when PKT1 =>
                        count_frames<=  x"00000002";
                        start <='0';
                        if (step) then
                            count_step_1<=count_step_1+1;
                            dst_ip(31 downto 16) <=S0_AXIS_TDATA(15 downto 0);
                            full_header(431 downto 256) <= metadata2 & metadata1 & dst_if & timer(46 downto 7) & random(7 downto 0)  & src_if & S0_AXIS_TDATA(47 downto 0);
                            start <='1';
                            if (is_TCP or is_UDP) then
                                src_port <= S0_AXIS_TDATA(31 downto 16);
                                dst_port <= S0_AXIS_TDATA(47 downto 32);
                            end if;
                            if (S0_AXIS_TLAST='1') then
				                curr_state <= WAIT5;
                            else
				                curr_state <= PKT2;
                            end if;
                        end if;
                    when PKT2 =>
                        start <='0';
                        if (step and S0_AXIS_TLAST='1') then
                            if (count_frames<5) then
			    	            curr_state <= WAIT5;
                            else
				                curr_state <= IDLE;
                            end if;
                        end if;
                    when WAIT5 =>
                        start <='0';
                        if (count_frames>10) then  --7
                            curr_state <= IDLE;
                        end if;
                end case;
            end if;
        end if;
    end process;


    process (S0_AXIS_ACLK)
    begin
        if (rising_edge(S0_AXIS_ACLK)) then
            if (RESET = '1') then
                random<= x"25C827F1";
                timer<=(others => '0'); --x"00000000000f4240"; --(others => '0');
            else
                random <= random xor myror(random,19) xor myror(random,8); 
                --if(enable_timer='1') then
                    timer <= timer+1;
                --elsif(enable_timer='0') then
                    --timer<=(others=>'0');
                 --end if;
            end if;
        end if;
    end process;
--    idle_opp <='0' when start='1'     else
--               '0' when startd(0)='1' else
--               '0' when startd(1)='1' else
--               '0' when startd(2)='1' else
--               '0' when startd(3)='1' else
--               '0' when startd(4)='1' else
--               '0' when startd(5)='1' else
--               '1'; 


    process (S0_AXIS_ACLK)
    begin
        if (rising_edge(S0_AXIS_ACLK)) then
            if (RESET = '1') then
                full_header_d <= (others =>(others => '0'));
                R1d<= (others => '0');
                R1dd<= (others => '0');
                R2d<= (others => '0');
                R2dd<= (others => '0');
                R3d<= (others => '0');
                R3dd<= (others => '0');
                startd<= (others => '0');
            elsif (step or (curr_state = PKT2) or (curr_state = WAIT5) or (curr_state = IDLE) ) then
                startd<=startd(10 downto 0) & start;
                full_header_d<=full_header_d(10 downto 0) & full_header;
                
                R1d<= R1;
               
                R1dd<= R1d;
                R2d<= R2;
                R2dd<= R2d;
                R3d<= R3;
                R3dd<= R3d;                     
            end if;
        end if;
    end process;







    -- -------------------------------------------------------------------------
    --  ADDRESS:
    -- 0x8000 0000 : Release number
    -- 0x8000 0004 : Release DATE 
    -- 0x8000 0008 : reg_test0
    -- 0x8000 000C : timer
    -- 0x8000 0010 : lookup_scope 
    -- 0x8000 0020 : update_scope
    -- 0x8000 0024 : 
    -- 0x8000 0030 : mask_lookup 
    -- 0x8000 0040 : mask_update
    -- 0x8000 0050 : FSM_scope
    -- 0x8000 0060 : OffO1-LenO1
    -- 0x8000 0070 : OffO2-LenO2
    -- 0x8000 0080 : OffO3-LenO3
    -- 0x8000 0090 : pause
    -- 0x8000 0100 : GR0
    -- 0x8000 0104 : GR1
    -- ..
    -- 0x8000 013C : GR15
    
    -- ..
    -- 0x8000 8000 : ip_count 
    -- 0x8000 8004 : udp_count
    -- 0x8000 8008 : tcp_count
    -- 0x8000 800C : 
    -- 0x8000 8010 : ip_count1 
    -- 0x8000 8014 : udp_count1
    -- 0x8000 8018 : tcp_count1
    -- 0x8000 801C : 
    -- 0x8000 8020 : ip_count2 
    -- 0x8000 8024 : udp_count2
    -- 0x8000 8028 : tcp_count2
    -- 0x8000 802C : 
    -- 0x8000 8030 : ip_count3
    -- 0x8000 8034 : udp_count3
    -- 0x8000 8038 : tcp_count3
    -- 0x8000 803C : 
    -- 0x8000 8040 : ip_count4
    -- 0x8000 8044 : udp_count4
    -- 0x8000 8048 : tcp_count4
    -- 0x8000 804C : 
    -- ..
    -- 0x8001 0000 : tcam1 32x128 ADDR 0 DIN[31:0]
    -- 0x8001 0004 : tcam1 32x128 ADDR 0 DIN[63:32]
    -- 0x8001 0008 : tcam1 32x128 ADDR 0 DIN[95:64]
    -- 0x8001 000C : tcam1 32x128 ADDR 0 DIN[127:96]
    -- 0x8001 0010 : tcam1 32x128 ADDR 0 DIN[159:128]
    -- [...]
    -- 0x8001 001C : tcam1 32x128 ADDR 0 DIN[255:223]

    -- 0x8001 0020 : tcam1 32x128 ADDR 0 DMASK[31:0]
    -- 0x8001 0024 : tcam1 32x128 ADDR 0 DMASK[63:32]
    -- 0x8001 0028 : tcam1 32x128 ADDR 0 DMASK[95:64]
    -- 0x8001 002C : tcam1 32x128 ADDR 0 DMASK[127:96]
    -- [...]
    -- 0x8001 003C : tcam1 32x128 ADDR 0 DMASK[255:223]

    -- 0x8001 0040 : tcam1 32x128 ADDR 1
    -- 0x8001 07F0 : tcam1 32x128 ADDR 31

    -- ..
    -- 0x8001 1000 : tcam2 32x161 ADDR 0
    -- 0x8001 1040 : tcam2 32x161 ADDR 1
    -- ..
    -- 0x8001 17F0 : tcam2 32x161 ADDR 31

    -- ..
    -- 0x8002 0000 : ram 32x32 ram1 ADDR0
    -- 0x8002 0004 : ram 32x32 ram1 ADDR1
    -- ..
    -- 0x8002 1000 : ram 32x32 ram2 ADDR 0
    -- ..
    -- 0x8002 2000 : ram 32x32 ram3 ADDR 0
    -- ..
    -- 0x8002 3000 : ram 32x32 ram4 ADDR 0
    -- ..
    -- 0x8003 0000 : pipe_alu ram: 256x512 ADDR 0
    -- 0x8003 3FFF : pipe_alu ram: 256x512 ADDR 255
    -- ..
    -- 0x8010 0000 : hash table
    -- ..
    -- 0x8020 0000 : num_entry_stash 
    -- 0x8020 0004 : count_collision
    -- 0x8020 0008 : count_item
    -- 0x8020 000C : tot_num_entry_stash      
    -- 0x8020 0010 : num evicted entry  
    -- 0x8020 0014 : num_present        
    -- 0x8020 0018 : count_cuckoo_insert  
    -- -------------------------------------------------------------------------


    -- unused signals
    S_AXI_BRESP <= "00";
    S_AXI_RRESP <= "00";
    process (S0_AXIS_ACLK)
    begin
        if (S0_AXIS_ACLK'event and S0_AXIS_ACLK = '1') then
        if RESET='1' then
                action_debug<=x"00000000";
                full_input_2_debug<=(others=>'0');
                full_input_1_1_debug<=(others=>'0');
                full_input_1_2_debug<=(others=>'0');
                full_input_ht_1_debug<=(others=>'0');
                full_input_ht_2_debug<=(others=>'0');
                flow_context_debug_2<=(others=>'0');
                flow_context_debug_1<=(others=>'0');
                flow_state_tcam2_debug<=(others=>'0');
                match_addr_tcam2_debug<=(others=>'0');
                update_context_debug_1<=(others=>'0');
                update_context_debug_2<=(others=>'0');
                count_startd_3<= (others => '0');
                startp<=(others=>'0');
                count_startp_3<=(others=>'0');
                count_start<=(others=>'0');
            else
            
             startp(0)<=start ;
                for i in 0 to 10 loop
                     startp(i+1)<=startp(i);
                end loop; 
                if(startd(3)='1') then
                   flow_state_tcam2_debug<=flow_state_tcam2;
                    action_debug<=action;
                    count_startd_3<=count_startd_3+1;
                   
                    update_context_debug_1<=update_context(31 downto 0);
                    update_context_debug_2<=update_context(103 downto 72);
                   
                 elsif(startd(2)='1') then    
                   match_addr_tcam2_debug<=x"000000" & "000"& match_addr_tcam2;
                   
                   elsif (startd(0)='1') then 
                  full_input_1_1_debug<=full_input_1(31 downto 0);
                                         full_input_1_2_debug<=full_input_1(63 downto 32);
                                         full_input_ht_1_debug<=full_input_ht(31 downto 0);
                                         full_input_ht_2_debug<=full_input_ht(63 downto 32);
                   
                    
                 elsif (startd(1)='1') then
                     full_input_2_debug<= full_input_2(31 downto 0);
                     
                      
                      flow_context_debug_1<=flow_context(31 downto 0);
                      flow_context_debug_1<=flow_context(103 downto 72);
                 
                 
                 end if;
                 if (startp(3)='1') then
                     count_startp_3<=count_startp_3+1;
                  end if;
                 if (start='1') then
                      count_start<=count_start+1;
                      end if;
                 
          end if;
         end if;
        end process;
  

  
  
  
  
  
  
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
                            address <= S_AXI_ARADDR - (C_BASEADDR -x"80000000");
                            read_enable <= '1';
                        elsif (S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' ) then -- write
                            --axi_state <= write_state;
                            axi_state <= "100";
                            address <= S_AXI_AWADDR - (C_BASEADDR -x"80000000");
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
                      if ( S_AXI_RREADY = '1') or (int_S_AXI_BVALID = '1' and S_AXI_BREADY = '1') then -- if (( int_S_AXI_BVALID = '0' and S_AXI_RREADY = '1') or (int_S_AXI_BVALID = '1' and S_AXI_BREADY = '1')) then ---
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
            clear_count_collision <='0';
            if (S_AXI_ARESETN = '0') then
                --mask_lookup(127 downto 48)   <=(others =>'0');
                --mask_lookup(47 downto 0)   <=(others =>'1');
                --mask_update(127 downto 48)   <=(others =>'0');
                --mask_update(47 downto 0)   <=(others =>'1');
                 
                clear_count_collision <='0';
                reg_test0      <= (others =>'0');
                pause          <= (others =>'0');
                tcam_data_in   <= (others =>'0');
                tcam_mask      <= (others =>'0');
                ht_data_in     <= (others =>'0');
                CR1            <= (others =>'0');
                CR2            <= (others =>'0');
                CR3            <= (others =>'0');
                CR4            <= (others =>'0');
                lookup_scope          <= x"0000001A";
                GR0                   <= x"00000000";--1
                GR1                   <= x"00000000";--64
                GR2                   <= x"00000000";
                GR3                   <= x"00000000";
--                GR4                   <= x"00000000";
--                GR5                   <= x"00000000";
--                GR6                   <= x"00000000";
--                GR7                   <= x"00000000";
--                GR8                   <= x"00000000";
--                GR9                   <= x"00000000";
--                GR10                  <= x"00000000";
--                GR11                  <= x"00000000";
--                GR12                  <= x"00000000";
--                GR13                  <= x"00000000";
--                GR14                  <= x"00000000";
--                GR15                  <= x"00000000";
                
                
                update_scope          <= x"0000001A";
                FSM_scope             <= x"0000002E";
                mask_lookup           <= x"000000000000000000000000ffffffff"; 
                mask_update           <= x"000000000000000000000000ffffffff"; 
                OffO1                 <= "101000";
                LenO1                 <= "11";
                OffO2                 <= "101000";
                LenO2                 <= "11";
                OffO3                 <= "010000";
                LenO3                 <= "01";
         else
            if ((write_enable='0') and (startd(8)='1')) then
                GR0                   <= aluGR0;
                GR1                   <= aluGR1;
                GR2                   <= aluGR2;
                GR3                   <= aluGR3;
--                GR4                   <= aluGR4;
--                GR5                   <= aluGR5;
--                GR6                   <= aluGR6;
--                GR7                   <= aluGR7;
--                GR8                   <= aluGR8;
--                GR9                   <= aluGR9;
--                GR10                  <= aluGR10;
--                GR11                  <= aluGR11;
--                GR12                  <= aluGR12;
--                GR13                  <= aluGR13;
--                GR14                  <= aluGR14;
--                GR15                  <= aluGR15;
            elsif (write_enable='1' and (startd(8)/='1')) then
                if (address=x"80000008") then
                    reg_test0 <= S_AXI_WDATA;
                end if;
                --if (address=x"8000000C") then
                --    reg_test1 <= S_AXI_WDATA;
                --end if;
                if (address=x"80000010") then
                    lookup_scope <= S_AXI_WDATA;
                end if;
                if (address=x"80000020") then
                    update_scope <= S_AXI_WDATA;
                end if;
                if (address=x"80000024") then
		            null;
                end if;
                if (address=x"80000030") then
                    mask_lookup(31 downto 0) <= S_AXI_WDATA;
                end if;
                if (address=x"80000034") then
                    mask_lookup(63 downto 32) <= S_AXI_WDATA;
                end if;
                if (address=x"80000038") then
                    mask_lookup(95 downto 64) <= S_AXI_WDATA;
                end if;
                if (address=x"8000003C") then
                    mask_lookup(127 downto 96) <= S_AXI_WDATA;
                end if;
                if (address=x"80000040") then
                    mask_update(31 downto 0) <= S_AXI_WDATA;
                end if;
                if (address=x"80000044") then
                    mask_update(63 downto 32) <= S_AXI_WDATA;
                end if;
                if (address=x"80000048") then
                    mask_update(95 downto 64) <= S_AXI_WDATA;
                end if;
                if (address=x"8000004C") then
                    mask_update(127 downto 96) <= S_AXI_WDATA;
                end if;
                if (address=x"80000050") then
                    FSM_scope <= S_AXI_WDATA;
                end if;
                if (address=x"80000060") then
                    OffO1 <= S_AXI_WDATA(5 downto 0);
                    LenO1 <= S_AXI_WDATA(7 downto 6);
                end if;
                if (address=x"80000070") then
                    OffO2 <= S_AXI_WDATA(5 downto 0);
                    LenO2 <= S_AXI_WDATA(7 downto 6);
                end if;
                if (address=x"80000080") then
                    OffO3 <= S_AXI_WDATA(5 downto 0);
                    LenO3 <= S_AXI_WDATA(7 downto 6);
                end if;
                if (address=x"80000090") then
                    pause  <= S_AXI_WDATA;
                end if;
                if (address=x"80000100") then
                    GR0 <= S_AXI_WDATA;
                end if;
                if (address=x"80000104") then
                    GR1 <= S_AXI_WDATA;
                end if;
                if (address=x"80000108") then
                    GR2 <= S_AXI_WDATA;
                end if;
                if (address=x"8000010C") then
                    GR3 <= S_AXI_WDATA;
                end if;
--                if (address=x"80000110") then
--                    GR4 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000114") then
--                    GR5 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000118") then
--                    GR6 <= S_AXI_WDATA;
--                end if;
--                if (address=x"8000011C") then
--                    GR7 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000120") then
--                    GR8 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000124") then
--                    GR9 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000128") then
--                    GR10 <= S_AXI_WDATA;
--                end if;
--                if (address=x"8000012C") then
--                    GR11 <= S_AXI_WDATA;
--                end if;                                                
--                if (address=x"80000130") then
--                    GR12 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000134") then
--                    GR13 <= S_AXI_WDATA;
--                end if;
--                if (address=x"80000138") then
--                    GR14 <= S_AXI_WDATA;
--                end if;
--                if (address=x"8000013C") then
--                    GR15 <= S_AXI_WDATA;
--                end if;
--                if (address=x"81000000") then
--                   modify_field <= S_AXI_WDATA;
--                end if;
--                if (address=x"81000004") then
--                   modify_size <= S_AXI_WDATA(1 downto 0);
--                end if;
--                if (address=x"81000008") then
--                    modify_offset <= S_AXI_WDATA(13 downto 0);
--                end if;
                
--                if (address=x"8100000c") then
--                    enable_write <= S_AXI_WDATA(0);
--                end if;
--                if (address=x"81000010") then
--                    enable_modify <= S_AXI_WDATA(0);
--                end if;
 

                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="000000") then
                    tcam_data_in(31 downto 0)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="000100") then
                    tcam_data_in(63 downto 32)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="001000") then
                    tcam_data_in(95 downto 64)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="001100") then
                    tcam_data_in(127 downto 96)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="010000") then
                    tcam_data_in(159 downto 128)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="010100") then
                    tcam_data_in(191 downto 160)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="011000") then
                    tcam_data_in(223 downto 192)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="011100") then
                    tcam_data_in(255 downto 224)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="100000") then
                    tcam_mask(31 downto 0)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="100100") then
                    tcam_mask(63 downto 32)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="101000") then
                    tcam_mask(95 downto 64)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="101100") then
                    tcam_mask(127 downto 96)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="110000") then
                    tcam_mask(159 downto 128)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="110100") then
                    tcam_mask(191 downto 160)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="111000") then
                    tcam_mask(223 downto 192)<= S_AXI_WDATA;
                end if;
                if ((address(31 downto 16)=x"8001") and address(5 downto 0)="111100") then
                    tcam_mask(255 downto 224)<= S_AXI_WDATA;
                end if;
                --if (address(31 downto 23)="100000000" and address(4 downto 2)="000") then    
                --if (address(31 downto 22)="1000000000" and address(4 downto 2)="000") then    
                --if (address(31 downto 21)="10000000000" and address(4 downto 2)="000") then    
                if (address(31 downto 20)=x"801" and address(4 downto 2)="000") then    
                    ht_data_in(31 downto 0)<=S_AXI_WDATA;
                end if;        
                if (address(31 downto 20)=x"801" and address(4 downto 2)="001") then    
                    ht_data_in(63 downto 32)<=S_AXI_WDATA;
                end if;        
                if (address(31 downto 20)=x"801" and address(4 downto 2)="010") then    
                    ht_data_in(95 downto 64)<=S_AXI_WDATA;
                end if;        
                if (address(31 downto 20)=x"801" and address(4 downto 2)="011") then    
                    ht_data_in(127 downto 96)<=S_AXI_WDATA;
                end if;        
                if (address(31 downto 20)=x"801" and address(4 downto 2)="100") then    
                    ht_data_in(159 downto 128)<=S_AXI_WDATA;
                end if;        
                if (address(31 downto 20)=x"801" and address(4 downto 2)="101") then    
                    ht_data_in(191 downto 160)<=S_AXI_WDATA;
                end if;
                if (address(31 downto 20)=x"801" and address(4 downto 2)="110") then    
                    ht_data_in(223 downto 192)<=S_AXI_WDATA;
                end if;        
                if (address(31 downto 20)=x"801" and address(4 downto 2)="111") then    
                    ht_data_in(255 downto 224)<=S_AXI_WDATA;
                end if;
                if address =x"80200004" then 
                    clear_count_collision<='1';
                end if;
                if address =x"80ffff48" then 
                     CR1<=S_AXI_WDATA;
                end if;
                 if address =x"80ffff4c" then 
                      CR2<=S_AXI_WDATA;
                end if;
                 if address =x"80ffff50" then 
                       CR3<=S_AXI_WDATA;
                end if;
                 if address =x"80ffff54" then 
                      CR4<=S_AXI_WDATA;
                 end if;
--                if address = x"80ffff30" then    
--                    count_startd_3<=S_AXI_WDATA;
--               end if; 
--                if address = x"80ffff00" then
--                     full_input_2_debug <=S_AXI_WDATA ;
--                end if;
--                if address = x"80ffff04" then
--                      flow_state_tcam2_debug <=S_AXI_WDATA;
--                end if;
--                if address = x"80ffff08" then
--                      match_addr_tcam2_debug <=S_AXI_WDATA;
--                end if;
--                if address = x"80ffff0c" then
--                      update_context_debug_1 <=S_AXI_WDATA;
--                end if;
--                if address = x"80ffff10" then
--                      update_context_debug_2 <=S_AXI_WDATA; 
--                end if;
--                if address = x"80ffff14" then
--                      action_debug <=S_AXI_WDATA; 
--                end if;               
              end if;
            end if;
        end if;
    end process;

    release_number<=x"12345678";


    USR_ACCESS_inst: if C_BASEADDR=x"80000000" generate
        U0: USR_ACCESSE2 port map( DATA => release_date);
    end generate;
    USR_ACCESS_noinst: if C_BASEADDR/=x"80000000" generate
        release_date <=x"11223344";
    end generate;




    REG_READ_PROCESS: process(CR1,CR2,CR4,count_cuckoo_insert,num_present,evicted_entry,tot_num_entry_stash,count_item,count_collision,num_entry_stash,GR0,GR1,GR2,GR3,mask_update,mask_lookup,read_enable,address,release_number,release_date,pause,reg_test0,timer,lookup_scope,update_scope,FSM_scope,ip_count,udp_count,tcp_count,read_from_ram1,read_from_ram2,read_from_ram3,read_from_ram4,data_ht,OffO1,OffO2,OffO3,LenO1,LenO2,LenO3)
    begin
        S_AXI_RDATA <= x"deadbeef";
        if address = x"80000000" then
            S_AXI_RDATA<=release_number;
        elsif address = x"80000004" then 
            S_AXI_RDATA <= release_date;
        elsif address = x"80000008" then 
            S_AXI_RDATA <= reg_test0;
        elsif address = x"8000000C" then 
            S_AXI_RDATA <= timer(47 downto 16);
        elsif address = x"80000010" then
            S_AXI_RDATA <= lookup_scope;
        elsif address = x"80000020" then
            S_AXI_RDATA <= update_scope;
        elsif address = x"80000024" then
            S_AXI_RDATA <=  x"deadbeef";
        elsif address = x"80000030" then
            S_AXI_RDATA <= mask_lookup(31 downto 0);
        elsif address = x"80000034" then
            S_AXI_RDATA <= mask_lookup(63 downto 32);
        elsif address = x"80000038" then
            S_AXI_RDATA <= mask_lookup(95 downto 64);
        elsif address = x"8000003C" then
            S_AXI_RDATA <= mask_lookup(127 downto 96);
        elsif address = x"80000040" then
            S_AXI_RDATA <= mask_update(31 downto 0);
        elsif address = x"80000044" then
            S_AXI_RDATA <= mask_update(63 downto 32);
        elsif address = x"80000048" then
            S_AXI_RDATA <= mask_update(95 downto 64);
        elsif address = x"8000004C" then
            S_AXI_RDATA <= mask_update(127 downto 96);
        elsif address = x"80000050" then
            S_AXI_RDATA <= FSM_scope;
        elsif address = x"80000060" then
            S_AXI_RDATA(5 downto 0) <= OffO1;
            S_AXI_RDATA(7 downto 6) <= LenO1;
            S_AXI_RDATA(31 downto 8) <= x"000000";
        elsif address = x"80000070" then
            S_AXI_RDATA(5 downto 0) <= OffO2;
            S_AXI_RDATA(7 downto 6) <= LenO2;
            S_AXI_RDATA(31 downto 8) <= x"000000";
        elsif address = x"80000080" then
            S_AXI_RDATA(5 downto 0) <= OffO3;
            S_AXI_RDATA(7 downto 6) <= LenO3;
            S_AXI_RDATA(31 downto 8) <= x"000000";
        elsif address = x"80000090" then 
            S_AXI_RDATA <= pause;
        elsif address = x"80000100" then    
            S_AXI_RDATA <= GR0;
        elsif address = x"80000104" then    
            S_AXI_RDATA <= GR1;
        elsif address = x"80000108" then    
            S_AXI_RDATA <= GR2; 
        elsif address = x"8000010C" then    
            S_AXI_RDATA <= GR3;

        elsif address = x"80008000" then 
            S_AXI_RDATA <= ip_count;
        elsif address = x"80008004" then
            S_AXI_RDATA <= udp_count;
        elsif address = x"80008008" then
            S_AXI_RDATA <= tcp_count;

        elsif (address(31 downto 8)=x"800200" and address(7)='0') then
            S_AXI_RDATA <=read_from_ram1;
        elsif (address(31 downto 8)=x"800210" and address(7)='0') then
            S_AXI_RDATA <=read_from_ram2;
        elsif (address(31 downto 8)=x"800220" and address(7)='0') then
            S_AXI_RDATA <=read_from_ram3;
        elsif (address(31 downto 8)=x"800230" and address(7)='0') then
            S_AXI_RDATA <=read_from_ram4;
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="000") then    
            S_AXI_RDATA <=data_ht(31 downto 0);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="001") then    
            S_AXI_RDATA <=data_ht(63 downto 32);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="010") then    
            S_AXI_RDATA <=data_ht(95 downto 64);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="011") then    
            S_AXI_RDATA <=data_ht(127 downto 96);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="100") then    
            S_AXI_RDATA <=data_ht(159 downto 128);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="101") then    
            S_AXI_RDATA <=data_ht(191 downto 160);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="110") then    
            S_AXI_RDATA<=data_ht(223 downto 192);
        elsif (address(31 downto 20)=x"801" and address(4 downto 2)="111") then     
            S_AXI_RDATA <=data_ht(255 downto 224);

        elsif address = x"80200000" then
            S_AXI_RDATA <= num_entry_stash; 
        elsif address = x"80200004" then
            S_AXI_RDATA <= count_collision;
        elsif address = x"80200008" then
            S_AXI_RDATA <= count_item;
        elsif address = x"8020000C" then
            S_AXI_RDATA <= tot_num_entry_stash;
        elsif address = x"80200010" then
            S_AXI_RDATA <= evicted_entry;
        elsif address = x"80200014" then
            S_AXI_RDATA <= num_present;
        elsif address = x"80200018" then
            S_AXI_RDATA <= count_cuckoo_insert;
        elsif address = x"80ffff00" then
--            S_AXI_RDATA <= full_input_2_debug;
--        elsif address = x"80ffff04" then
--             S_AXI_RDATA <= flow_state_tcam2_debug;
--        elsif address = x"80ffff08" then
--             S_AXI_RDATA <= match_addr_tcam2_debug;
--        elsif address = x"80ffff0c" then
--             S_AXI_RDATA <= update_context_debug_1;
--        elsif address = x"80ffff10" then
--             S_AXI_RDATA <= update_context_debug_2;     
--        elsif address = x"80ffff14" then
--             S_AXI_RDATA <= action_debug;     
--         elsif address = x"80ffff18" then     
--             S_AXI_RDATA <= full_input_1_1_debug;
--         elsif address = x"80ffff1c" then     
--              S_AXI_RDATA <=full_input_1_2_debug;    
--         elsif address = x"80ffff20" then    
--            S_AXI_RDATA <= full_input_ht_1_debug;
--         elsif address = x"80ffff24" then  
--              S_AXI_RDATA <= full_input_ht_2_debug;
--          elsif address = x"80ffff28" then                          
--              S_AXI_RDATA <= flow_context_debug_1;
--           elsif address = x"80ffff2c" then    
--              S_AXI_RDATA <=flow_context_debug_2;
--           elsif address = x"80ffff30" then    
--              S_AXI_RDATA <=count_startd_3;  
--            elsif address = x"80ffff34" then  
--               S_AXI_RDATA <=count_step;
--            elsif address = x"80ffff38" then  
--                S_AXI_RDATA <=count_step_1;
--            elsif address = x"80ffff3c" then  
--                S_AXI_RDATA <=count_step_2;
--            elsif address = x"80ffff40" then  
--                S_AXI_RDATA <= count_start;
--            elsif address = x"80ffff44" then      
--                  S_AXI_RDATA <=count_startp_3;
            elsif address = x"80ffff48" then      
                  S_AXI_RDATA <=CR1;
            elsif address = x"80ffff4c" then      
                 S_AXI_RDATA <=CR2;
            elsif address = x"80ffff50" then      
                  S_AXI_RDATA <=CR3;
            elsif address = x"80ffff54" then      
                  S_AXI_RDATA <=CR4;               
        else
            S_AXI_RDATA <= x"deadeeef";
        end if;
    end process;



    SAMls1: entity work.sam64 port map(full_header,lookup_scope(5 downto 0),full_input_1(63 downto 0));    
    SAMls2: entity work.sam64 port map(full_header,lookup_scope(21 downto 16),full_input_1(127 downto 64));

    full_input_ht <= (full_input_1 and mask_lookup); 

    -- un cc dopo che lookup-key è pronta
    ht_en <=  startd(0); --or startd(1);-- or startd(2);                  

    enable_ht<= '1' when (pause=x"00000000") else '0'; 
    
    HT1: entity work.cuckoo
    --HT1: entity work.ht128dp
    --generic map (
    --                key_len =>128,
    --                value_len => 126 -- +2 per update e present
    --            )
    port map(
                clock => S0_AXIS_ACLK,
                reset => RESET,
                enable => enable_ht,
                                 
                --MI interface
                we => ht_we,
                rd => ht_rd,
                input_din => ht_data_in,
                addr  => address(16 downto 5),
                data_out => data_ht,
                
                num_entry_stash => num_entry_stash,
                num_present => num_present,
                count_cuckoo_insert => count_cuckoo_insert,  
                count_collision => count_collision,
                clear_count_collision => clear_count_collision,
                count_item => count_item,
                tot_num_entry_stash => tot_num_entry_stash,
                evicted_entry => evicted_entry,                         
                
                remove => remove_action,
                insert => insert_action,
		pre_insert => startd(2),     
                key    => update_key,
                value  => update_context,
                search_key => full_input_ht,
                hit  => match_ht,
                search_value => flow_context,
                search  => ht_en
            );
     --R1<=x"aaaaaaaa"  when match_ht='1' else x"00000000";
    R1<=flow_context(31 downto 0)  when match_ht='1' else x"00000000";
    R2<=flow_context(63 downto 32) when match_ht='1' else x"00000000";
    R3<=flow_context(95 downto 64) when match_ht='1' else x"00000000";
         


    -- critical path qui!!!
    -- posso provare con:
    -- SAM1: entity work.sam32_c port map(S0_AXIS_ACLK,RESET,full_header_d(0),'0' & OffO1,LenO1,O1);
        
     
--    SAM1: entity work.sam32 port map(full_header_d(1),'0' & OffO1,LenO1,O1);
--    SAM2: entity work.sam32 port map(full_header_d(1),'0' & OffO2,LenO2,O2);
--    SAM3: entity work.sam32 port map(full_header_d(1),'0' & OffO3,LenO3,O3);
    SAM1: entity work.sam32_c port map(S0_AXIS_ACLK,RESET,full_header_d(0),'0' & OffO1,LenO1,O1);
    SAM2: entity work.sam32_c port map(S0_AXIS_ACLK,RESET,full_header_d(0),'0' & OffO2,LenO2,O2);
    SAM3: entity work.sam32_c port map(S0_AXIS_ACLK,RESET,full_header_d(0),'0' & OffO3,LenO3,O3);


    conditions_i: entity work.conditions
        port map(
        CR1=>CR1, 
        CR2=>CR2,
        CR3=>CR3,
        CR4=>CR4,
        GR0=>GR0,
        GR1=>GR1,
        GR2=>GR2,
        GR3=>GR3,
        R1=>R1,
        R2=>R2,
        R3=>R3,
        O1=>O1,
        O2=>O2,
        O3=>O3,
        timer=>timer(38 downto 7),

        conditions=>conditions 
    
        );





    Tcam1bis: entity cam.cam_top
    generic map (
                    --C_DEPTH =>32,
                    C_DEPTH =>8,
                    C_WIDTH =>128,
                    C_MEM_INIT_FILE  => "./init_cam_1.mif"
                )
    port map(
                CLK => S0_AXIS_ACLK,
                CMP_DIN => full_input_1,
                CMP_DATA_MASK => x"00000000000000000000000000000000",
                BUSY => open,    
                MATCH  => match_t1,
                MATCH_ADDR  => match_addr_tcam1(2 downto 0),
                WE       =>   cam1_we,
                WR_ADDR  => address(8 downto 6),
                DATA_MASK => tcam_mask(127 downto 0),
                DIN => tcam_data_in(127 downto 0),
                EN  => '1'
            );
    match_addr_tcam1(4 downto 3)<="00";


    -- from 0x8001_0000 to 0x8001_07FF
    cam1_we <=  write_enable when ((address(31 downto 12)=x"80010") and (address(11 downto 9 )="000")  and (address(5 downto 0)="111100")) else '0';

    -- from 0x8001_1000 to 0x8001_3FFF
    cam2_we <=  write_enable when ((address(31 downto 12)=x"80011") and (address(11)='0')  and (address(5 downto 0)="111100")) else '0';



    -- from 0x8010_0000 to 0x801f_ffff
    ht_we <= write_enable when ((address(31 downto 20)=x"801") and (address(4 downto 2)="111")) else '0';          
    ht_rd <= read_enable when (address(31 downto 20)=x"801") else '0';


    --  O3,O2,O1,conditions,state --120 bits
    full_input_2<= O3 & O2 & O1 & conditions & flow_context(103 downto 96) when match_ht='1' else
                   O3 & O2 & O1 & conditions & flow_state_tcam1(7 downto 0);
                     
    Tcam2bis: entity cam.cam_top
    generic map (
                    C_DEPTH =>32,
                    C_WIDTH =>120,
                    C_MEM_INIT_FILE  => "./init_cam_2.mif"
                )
    port map(
                CLK => S0_AXIS_ACLK,
                CMP_DIN => full_input_2,
                CMP_DATA_MASK =>x"000000000000000000000000000000",
                BUSY => open,    
                MATCH  => match_t2,
                MATCH_ADDR  =>match_addr_tcam2 ,
                WE       =>   cam2_we,
                WR_ADDR  => address(10 downto 6), 
                DATA_MASK =>tcam_mask(119 downto 0),
                DIN =>tcam_data_in(119 downto 0),
                EN  => '1'
            );


    we_r1 <= write_enable when ((address(31 downto 8)=x"800200") and (address(7)='0') ) else '0';
    we_r2 <= write_enable when ((address(31 downto 8)=x"800210") and (address(7)='0')) else '0';
    we_r3 <= write_enable when ((address(31 downto 8)=x"800220") and (address(7)='0')) else '0';
    we_r4 <= write_enable when ((address(31 downto 8)=x"800230") and (address(7)='0')) else '0';
    we_pipealu <= write_enable when ((address(31 downto 16)=x"8003") and (address(15)='0') and (address(14)='0')) else '0';



    --this ram provides the default state for the keys not in the flow context table (cuckoo) 
    r1dp:  entity work.ram32x32dp
    generic map (init_file => "./init_ram_1.mif")
    port map 
    (

        --AXI interface
        axi_clock => S_AXI_ACLK,
        we =>we_r1,
        axi_addr => address(6 downto 2), 
        axi_data_in => S_AXI_WDATA,
        axi_data_out => read_from_ram1,

        -- AXIS interface
        clock => S0_AXIS_ACLK,
        addr    => match_addr_tcam1,
        data_out => flow_state_tcam1
    );

    --this ram provides the next state [7:0] and the instruction for pipe ALU [15:8] 
    r2dp:entity work.ram32x32dp
    generic map (init_file => "./init_ram_2.mif")
    port map 
    (

        --AXI interface
        axi_clock => S_AXI_ACLK,
        we =>we_r2,
        axi_addr => address(6 downto 2), 
        axi_data_in => S_AXI_WDATA,
        axi_data_out => read_from_ram2,

        -- AXIS interface
        clock => S0_AXIS_ACLK,
        addr     => match_addr_tcam2,
        data_out => flow_state_tcam2
    );

    --this ram provides the 3 actions to apply to the packet [15:0] for table update, [23:16] push/modify pkt, [31:24] select dst_if
    r3dp:entity work.ram32x32dp
    generic map (init_file => "./init_ram_3.mif")
    port map 
    (

        --AXI interface
        axi_clock => S_AXI_ACLK,
        we =>we_r3,
        axi_addr => address(6 downto 2), 
        axi_data_in => S_AXI_WDATA,
        axi_data_out => read_from_ram3,

        -- AXIS interface
        clock => S0_AXIS_ACLK,
        addr     => match_addr_tcam2,
        data_out => action
    );

    --this ram provides the action values to apply to the packet
    r4dp:entity work.ram32x32dp
    generic map (init_file => "./init_ram_4.mif")
    port map 
    (

        --AXI interface
        axi_clock => S_AXI_ACLK,
        we =>we_r4,
        axi_addr => address(6 downto 2), 
        axi_data_in => S_AXI_WDATA,
        axi_data_out => read_from_ram4,

        -- AXIS interface
        clock => S0_AXIS_ACLK,
        addr     => match_addr_tcam2,
        data_out => action_value
    );

    --SAM1a: entity work.sam32 port map(full_header_d(X),OFF1_I1,"11",OPa_I1);
    --SAM1b: entity work.sam32 port map(full_header_d(X),OFF2_I1,"11",OPb_I1);
    --ALU1:  entity work.alu port map(OPa_I1,OPb_I1,Opcode_I1,Res1);

    --N.B.: controllare se prende i valori giusti di R1,R2,R3

    --Res1 <= R1dd+flow_state_tcam2(15 downto 8);
    --Res2 <= R2dd+flow_state_tcam2(23 downto 16);
    --Res3 <= R3dd+flow_state_tcam2(31 downto 24);

    -- latency= 2 CLK
    --Res3(31 downto 24)<=x"00";
    --d0: entity work.div_gen_0 port map (CLK,'1',R1dd(7 downto 0),'1',R2dd(15 downto 0),open,Res3(23 downto 0));


    Pipealu_i: entity work.pipealu port map(
                                               clk   => S0_AXIS_ACLK,
                                               reset => RESET,
                                               wea   => we_pipealu, --: IN STD_LOGIC;
                                               addra => address(13 downto 2), --: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
                                               dina => S_AXI_WDATA, -- : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
                                               header => full_header_d(3), --: in std_logic_vector(367 downto 0);
                                               instruction => flow_state_tcam2(15 downto 8),  --: in std_logic_vector(7 downto 0);
                                               inGR0 => GR0,
                                               inGR1 => GR1,
                                               inGR2 => GR2,
                                               inGR3 => GR3,
                                                                                              
                                               GR0 => aluGR0,
                                               GR1 => aluGR1,
                                               GR2 => aluGR2,
                                               GR3 => aluGR3,
--                                               GR4 => aluGR4,
--                                               GR5 => aluGR5,
--                                               GR6 => aluGR6,
--                                               GR7 => aluGR7,
--                                               GR8 => aluGR8,
--                                               GR9 => aluGR9,
--                                               GR10 => aluGR10,
--                                               GR11 => aluGR11,
--                                               GR12 => aluGR12,
--                                               GR13 => aluGR13,
--                                               GR14 => aluGR14,
--                                               GR15 => aluGR15,
                                               Rina => R1dd,-- : in STD_LOGIC_VECTOR (31 downto 0);
                                               Rinb => R2dd,-- : in STD_LOGIC_VECTOR (31 downto 0);
                                               Rinc => R3dd,-- : in STD_LOGIC_VECTOR (31 downto 0);
                                               Res3a => Res1, --: out STD_LOGIC_VECTOR (31 downto 0);
                                               Res3b => Res2, --: out STD_LOGIC_VECTOR (31 downto 0);
                                               Res3c => Res3  --: out STD_LOGIC_VECTOR (31 downto 0);
     --Res3d : out STD_LOGIC_VECTOR (31 downto 0)
                                           );


    --SAMus1: entity work.sam64 port map(full_header_d(3),update_scope(5 downto 0),action_header(63 downto 0));
    --SAMus2: entity work.sam64 port map(full_header_d(3),update_scope(21 downto 16),action_header(127 downto 64));
      SAMus1: entity work.sam64 port map(full_header_d(8),update_scope(5 downto 0),action_header(63 downto 0));--6
     SAMus2: entity work.sam64 port map(full_header_d(8),update_scope(21 downto 16),action_header(127 downto 64));--6
    update_key <= action_header and mask_update;


    update_context(95 downto 0) <=  Res3 & Res2 & Res1;
    --set the next state
    update_context(103 downto 96) <=  flow_state_tcam2_d3(7 downto 0); --sync con startd(3)
    -- per pipe: sh1:  entity work.shreg generic map (3,8) port map (clk,flow_state_tcam2(7  downto 0),update_context(103 downto 96)); --sync con startd(6)

 
    
    update_context(125 downto 104) <= (others =>'0');



--    insert_action <= startd(3) when action(15 downto 0)= x"FF00" else '0';
--    remove_action <= startd(3) when action(15 downto 0)= x"FFFF"  else '0';
    -- controllare lunghezza WAIT
    insert_action <= startd(8) when action_d3(15 downto 0)= x"FF00" else '0';  --sync con Res3 .. Res1 ------5
    remove_action <= startd(8) when action_d3(15 downto 0)= x"FFFF"  else '0'; --sync con Res3 .. Res1
    sh2:  entity work.shreg generic map (5,32) port map (S0_AXIS_ACLK,action,action_d3); --sync con startd(6) --
    sh3:  entity work.shreg generic map (5,32) port map (S0_AXIS_ACLK,action_value,action_value_d3); --sync con startd(6)
    sh4:  entity work.shreg generic map (5,32) port map (S0_AXIS_ACLK,flow_state_tcam2,flow_state_tcam2_d3); --sync con startd(6)
    enable_write <='1'  when action_d3(23 downto 16)=x"0A" else 
                   '1'  when action_d3(23 downto 16)=x"1A" else 
                   '0'; 
    enable_modify <='1' when action_d3(23 downto 16)=x"0B" else
                    '1' when action_d3(23 downto 16)=x"1B" else 
                    '0'; 
  
  
  
         process (S0_AXIS_ACLK)
               begin
                   if (S0_AXIS_ACLK'event and S0_AXIS_ACLK = '1') then
                        if (RESET='1') then
                            enable_timer<='0';
                        else
                            if(flow_state_tcam2(31 downto 24)=x"0C") then
                                enable_timer<='1';
                            elsif(flow_state_tcam2(31 downto 24)=x"1C") then
                                enable_timer<='0';  
                            end if;
                         end if;
                    end if;
               end process;                       



--      enable_modify<='0';
--      enable_write <='1';
    modify_offset<=action_value_d3(13 downto 0);
    modify_size<=action_value_d3(15 downto 14);
    modify_field<=x"0000" & action_value_d3(31 downto 16) when action_d3(23 downto 20)=x"0" else  Res1; --Res3

--modify_offset<="00" & x"00a" when IN_SIMULATION else (others =>'Z');
--modify_size<="11" when IN_SIMULATION else (others =>'Z');
--modify_field<=x"DEADBEEF" when IN_SIMULATION else (others =>'Z');
   
    enable_delay <= '0' when (pause /=x"00000000") else 
                    '1'; -- when (curr_state /= PKT1 or S0_AXIS_TVALID='1') else
                     --'0'; 
--    elsif (step or (curr_state = PKT2) or (curr_state = WAIT5) or (curr_state = IDLE) ) then
                                                               
                                   
                                       
    S0_AXIS_TREADY<= '0' when (curr_state = WAIT5) else int_S0_AXIS_TREADY;
    int_S0_AXIS_TVALID <= '0' when (curr_state = WAIT5) else S0_AXIS_TVALID; 
    slot_delayer <= '0' when (curr_state = PKT1 and S0_AXIS_TVALID='0') else '1';
                                       
    delayer_axi_i: entity work.delayer_axi
    generic map (DELAY_LENGHT =>10) --7
    port map (
                 -- Global ports
                 enable          => enable_delay,
                 slot            => slot_delayer,
                 S0_AXIS_ACLK    => S0_AXIS_ACLK   ,
                 S0_AXIS_ARESETN => S0_AXIS_ARESETN,

                 -- Slave Stream ports.
                 S0_AXIS_TVALID  => int_S0_AXIS_TVALID ,
                 S0_AXIS_TDATA   => S0_AXIS_TDATA  ,
                 S0_AXIS_TKEEP   => S0_AXIS_TKEEP  ,
                 S0_AXIS_TUSER   => S0_AXIS_TUSER  ,
                 S0_AXIS_TLAST   => S0_AXIS_TLAST  ,
                 S0_AXIS_TREADY  => int_S0_AXIS_TREADY,
                 
                   
                 -- Master Stream ports.
                 M0_AXIS_TVALID  => write_M0_AXIS_TVALID ,
                 M0_AXIS_TDATA   => write_M0_AXIS_TDATA  ,
                 M0_AXIS_TKEEP   => write_M0_AXIS_TKEEP  ,
                 M0_AXIS_TUSER   => write_M0_AXIS_TUSER,
                 M0_AXIS_TLAST   => write_M0_AXIS_TLAST ,
                 M0_AXIS_TREADY  => write_TREADY


--                 M0_AXIS_TVALID  => write_in.TVALID ,
--                 M0_AXIS_TDATA   => write_in.TDATA  ,
--                 M0_AXIS_TKEEP   => write_in.TKEEP  ,
--                 M0_AXIS_TUSER   => write_in.TUSER,
--                 M0_AXIS_TLAST   => write_in.TLAST  ,
--                 M0_AXIS_TREADY  => write_TREADY
             );

                    

       write_in.TVALID <=write_M0_AXIS_TVALID;
       write_in.TDATA  <=write_M0_AXIS_TDATA;
       write_in.TKEEP  <=write_M0_AXIS_TKEEP;
       write_in.TUSER  <=write_M0_AXIS_TUSER;
       write_in.TLAST  <=write_M0_AXIS_TLAST;
       



    -- inserisco l'azione come TUSER[31:24]. In questo modo i bit dell'azione definiscono su quali porte di uscita
    -- mandare i pacchetti
    -- TUSER[31:24]:   destination port: identifies the port from which the packet is to be transmitted.
    -- Note one-hot encoding, and that multicast is possible as each port is associated with each bit. (A maximum of 8 ports is supported.)
    -- even-numbered bits represent physical Ethernet (MAC) ports, and odd-numbered bits represent PCI queues (i.e. host interfaces). 

    M0_AXIS_TUSER<= int_M0_AXIS_TUSER(127 downto 32) & action_d3(31 downto 24) & int_M0_AXIS_TUSER(23 downto 0) when reg_test0=x"00000000" else
                    int_M0_AXIS_TUSER(127 downto 32) & reg_test0(7 downto 0) & int_M0_AXIS_TUSER(23 downto 0); 
                    
    
------------------------------
--- azioni oper il pacchetto
------------------------------


M0_AXIS_TLAST<= write_out.TLAST  when enable_write='1' else
                modify_out.TLAST when enable_modify='1' else
                write_M0_AXIS_TLAST;

M0_AXIS_TKEEP<= write_out.TKEEP  when enable_write='1' else
                modify_out.TKEEP when enable_modify='1' else
                write_M0_AXIS_TKEEP;
                 
M0_AXIS_TVALID<= write_out.TVALID  when enable_write='1' else
                 modify_out.TVALID when enable_modify='1' else
                 write_M0_AXIS_TVALID;
                 
                 
int_M0_AXIS_TUSER <= write_out.TUSER  when enable_write='1' else
                     modify_out.TUSER when enable_modify='1' else
                     write_M0_AXIS_TUSER;
                     
M0_AXIS_TDATA<= write_out.TDATA  when enable_write='1' else
                modify_out.TDATA when enable_modify='1' else
                write_M0_AXIS_TDATA;                     
                 
                 
write_out_TREADY  <= M0_AXIS_TREADY;
modify_out_TREADY <= M0_AXIS_TREADY;
 

write_TREADY<=  write_in_TREADY  when enable_write='1'  else
                modify_in_TREADY when enable_modify='1' else
                M0_AXIS_TREADY;
                        

--writer_i: entity work.modify_field
writer_i: entity work.add_field
port map (
		-- Global ports
		axis_aclk     => S0_AXIS_ACLK   ,
		axis_resetn   => S0_AXIS_ARESETN,

		in_offset     => modify_offset,
		in_size       => modify_size,
		in_field      => modify_field,
		enable        => startd(8),
		-- Slave Stream ports.
		s_axis        => write_in,
		s_axis_tready => write_in_TREADY,  

		-- Master Stream ports.
		m_axis        => write_out,
		m_axis_tready => write_out_TREADY
	 );


    --writer_i: entity work.modify_field
    modify_i: entity work.modify_field
    port map (
		    -- Global ports
		    axis_aclk     => S0_AXIS_ACLK   ,
		    axis_resetn   => S0_AXIS_ARESETN,

		    in_offset	  => modify_offset,
		    in_size       => modify_size,
		    in_field      => modify_field,
		    enable        => startd(8),
		    -- Slave Stream ports.
		    s_axis        => write_in,
		    s_axis_tready => modify_in_TREADY,  

		    -- Master Stream ports.
		    m_axis        => modify_out,
		    m_axis_tready => modify_out_TREADY
	     );

end architecture full;

