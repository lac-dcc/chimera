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

--Library cam;

entity FlowBlaze156 is 
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
            CLK_1XX : in std_logic;
            ARESETN_1XX  : in std_logic;
            CLK_156 : in std_logic;
            ARESETN_156  : in std_logic;
            
-- Master Stream Ports.
             --M0_AXIS_ACLK : in std_logic;
             --M0_AXIS_ARESETN  : in std_logic;
             M0_AXIS_TVALID   : out std_logic;
             M0_AXIS_TDATA    : out std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
             M0_AXIS_TKEEP    : out std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
             M0_AXIS_TUSER    : out std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
             M0_AXIS_TLAST    : out std_logic;
             M0_AXIS_TREADY   : in std_logic;

-- Ports of Axi Stream Slave Bus Interface S00_AXIS
             --S0_AXIS_ACLK    : in std_logic;
             --S0_AXIS_ARESETN : in std_logic;
             S0_AXIS_TVALID  : in std_logic;
             S0_AXIS_TDATA   : in std_logic_vector(C_S00_AXIS_DATA_WIDTH-1 downto 0);
             S0_AXIS_TKEEP   : in std_logic_vector((C_S00_AXIS_DATA_WIDTH/8)-1 downto 0);
             S0_AXIS_TUSER   : in std_logic_vector(C_S00_AXIS_TUSER_WIDTH-1 downto 0);
             S0_AXIS_TLAST   : in std_logic;
             S0_AXIS_TREADY  : out std_logic;

-- Master Stream Ports.
		M_DEBUG_TVALID   : out std_logic;
		M_DEBUG_TDATA    : out std_logic_vector(255 downto 0);
		M_DEBUG_TKEEP    : out std_logic_vector(31 downto 0);
		M_DEBUG_TUSER    : out std_logic_vector(127 downto 0);
		M_DEBUG_TLAST    : out std_logic;
		M_DEBUG_TREADY   : in std_logic;

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

architecture full of FlowBlaze156 is


signal random: std_logic_vector(31 downto 0);
signal temp_to1XX_AXIS_TVALID   : std_logic;
signal to1XX_AXIS_TVALID   : std_logic;
signal to1XX_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
signal to1XX_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
signal to1XX_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
signal to1XX_AXIS_TLAST    : std_logic;
signal to1XX_AXIS_TREADY   : std_logic;
signal temp_to1XX_AXIS_TREADY   : std_logic;

signal from1XX_AXIS_TVALID   : std_logic;
signal from1XX_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
signal from1XX_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
signal from1XX_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
signal from1XX_AXIS_TLAST    : std_logic;
signal from1XX_AXIS_TREADY   : std_logic;


signal OS_AXI_ACLK	: std_logic;  
signal OS_AXI_ARESETN	: std_logic;                                     
signal OS_AXI_AWADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);     
signal OS_AXI_AWVALID	: std_logic; 
signal OS_AXI_WDATA 	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0); 
signal OS_AXI_WSTRB 	: std_logic_vector(C_S00_AXI_DATA_WIDTH/8-1 downto 0);   
signal OS_AXI_WVALID	: std_logic;                                    
signal OS_AXI_BREADY	: std_logic;                                    
signal OS_AXI_ARADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
signal OS_AXI_ARVALID	: std_logic;                                     
signal OS_AXI_RREADY	: std_logic;                                     
signal OS_AXI_ARREADY	: std_logic;             
signal OS_AXI_RDATA	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal OS_AXI_RRESP	: std_logic_vector(1 downto 0);
signal OS_AXI_RVALID	: std_logic;                                   
signal OS_AXI_WREADY	: std_logic; 
signal OS_AXI_BRESP	: std_logic_vector(1 downto 0);                         
signal OS_AXI_BVALID	: std_logic;                                    
signal OS_AXI_AWREADY   : std_logic; 



signal M_DEBUG_1XX: axis;



-- ----------------------------------------------------------------------------
--                             Architecture body
-- ----------------------------------------------------------------------------

component axis_clock_converter_0 port(
  s_axis_aresetn: in std_logic;
  m_axis_aresetn: in std_logic;
  s_axis_aclk: in std_logic;
  s_axis_tvalid: in std_logic;
  s_axis_tready: out std_logic;
  s_axis_tdata: in std_logic_vector(255 downto 0);
  s_axis_tkeep: in std_logic_vector(31 downto 0);
  s_axis_tlast: in std_logic;
  s_axis_tuser: in std_logic_vector(127 downto 0);
  m_axis_aclk: in std_logic;
  m_axis_tvalid: out std_logic;
  m_axis_tready: in std_logic;
  m_axis_tdata: out std_logic_vector(255 downto 0);
  m_axis_tkeep: out std_logic_vector(31 downto 0);
  m_axis_tlast: out std_logic;
  m_axis_tuser: out std_logic_vector(127 downto 0)
  );
end component;

component axi_clock_converter_0 port(
  s_axi_aclk        : in  std_logic;                  
  s_axi_aresetn     : in  std_logic;  
  s_axi_awaddr      : in  std_logic_vector(31 downto 0);  
  s_axi_awprot      : in  std_logic_vector(2 downto 0);
  s_axi_awvalid     : in  std_logic;
  s_axi_awready     : out std_logic;
  s_axi_wdata       : in  std_logic_vector(31 downto 0);
  s_axi_wstrb       : in  std_logic_vector(3 downto 0);
  s_axi_wvalid      : in  std_logic;
  s_axi_wready      : out std_logic;
  s_axi_bresp       : out std_logic_vector(1 downto 0);
  s_axi_bvalid      : out std_logic;
  s_axi_bready      : in  std_logic;
  s_axi_araddr      : in  std_logic_vector(31 downto 0);
  s_axi_arprot      : in  std_logic_vector(2 downto 0);
  s_axi_arvalid     : in  std_logic;
  s_axi_arready     : out std_logic;
  s_axi_rdata       : out  std_logic_vector(31 downto 0);
  s_axi_rresp       : out std_logic_vector(1 downto 0);
  s_axi_rvalid      : out std_logic;  
  s_axi_rready      : in std_logic;
    
  m_axi_aclk        : in  std_logic;                     
  m_axi_aresetn     : in  std_logic;                     
  m_axi_awaddr      : out std_logic_vector(31 downto 0); 
  m_axi_awprot      : out std_logic_vector(2 downto 0);  
  m_axi_awvalid     : out std_logic;                     
  m_axi_awready     : in  std_logic;                     
  m_axi_wdata       : out std_logic_vector(31 downto 0); 
  m_axi_wstrb       : out std_logic_vector(3 downto 0);  
  m_axi_wvalid      : out std_logic;                     
  m_axi_wready      : in  std_logic;                     
  m_axi_bresp       : in  std_logic_vector(1 downto 0);  
  m_axi_bvalid      : in  std_logic;                     
  m_axi_bready      : out std_logic;                     
  m_axi_araddr      : out std_logic_vector(31 downto 0); 
  m_axi_arprot      : out std_logic_vector(2 downto 0);  
  m_axi_arvalid     : out std_logic;                     
  m_axi_arready     : in  std_logic;                     
  m_axi_rdata       : in  std_logic_vector(31 downto 0);
  m_axi_rresp       : in  std_logic_vector(1 downto 0);  
  m_axi_rvalid      : in  std_logic;                     
  m_axi_rready      : out std_logic                      
 );
 end component;



begin

--axi156to1XX: entity work.axis_clock_converter_0 
axi156to1XX: axis_clock_converter_0
port map (
  s_axis_aresetn => ARESETN_156,
  s_axis_aclk    => CLK_156,
  s_axis_tvalid  => S0_AXIS_TVALID,
  s_axis_tready  => S0_AXIS_TREADY,
  s_axis_tdata   => S0_AXIS_TDATA,
  s_axis_tkeep   => S0_AXIS_TKEEP,
  s_axis_tlast   => S0_AXIS_TLAST,
  s_axis_tuser   => S0_AXIS_TUSER,
  m_axis_aresetn => ARESETN_1XX,
  m_axis_aclk    => CLK_1XX,
  m_axis_tvalid  => temp_to1XX_AXIS_TVALID,
  m_axis_tready  => to1XX_AXIS_TREADY,
  m_axis_tdata   => to1XX_AXIS_TDATA,
  m_axis_tkeep   => to1XX_AXIS_TKEEP,
  m_axis_tlast   => to1XX_AXIS_TLAST,
  m_axis_tuser   => to1XX_AXIS_TUSER  
);

axi_clock_converter_i: axi_clock_converter_0
port map (
-- Ports of Axi Slave Bus Interface S_AXI
             S_AXI_ACLK	    =>  S_AXI_ACLK,	    
             S_AXI_ARESETN  =>  S_AXI_ARESETN,  
             S_AXI_AWADDR   =>  S_AXI_AWADDR,   
             s_axi_awprot   =>  STD_LOGIC_VECTOR'(B"000"),
             S_AXI_AWVALID  =>  S_AXI_AWVALID,  
             S_AXI_WDATA    =>  S_AXI_WDATA,    
             S_AXI_WSTRB    =>  S_AXI_WSTRB,    
             S_AXI_WVALID   =>  S_AXI_WVALID,   
             S_AXI_BREADY   =>  S_AXI_BREADY,   
             S_AXI_ARADDR   =>  S_AXI_ARADDR,
             s_axi_arprot   =>  STD_LOGIC_VECTOR'(B"000"),  
             S_AXI_ARVALID  =>  S_AXI_ARVALID,  
             S_AXI_RREADY   =>  S_AXI_RREADY,   
             S_AXI_ARREADY  =>  S_AXI_ARREADY,  
             S_AXI_RDATA    =>  S_AXI_RDATA,    
             S_AXI_RRESP    =>  S_AXI_RRESP,    
             S_AXI_RVALID   =>  S_AXI_RVALID,   
             S_AXI_WREADY   =>  S_AXI_WREADY,   
             S_AXI_BRESP    =>  S_AXI_BRESP,    
             S_AXI_BVALID   =>  S_AXI_BVALID,   
             S_AXI_AWREADY  =>  S_AXI_AWREADY,
             M_AXI_ACLK	    =>  CLK_1XX,	    
             M_AXI_ARESETN  =>  ARESETN_1XX,  
             M_AXI_AWADDR   =>  OS_AXI_AWADDR,   
             M_AXI_AWVALID  =>  OS_AXI_AWVALID,  
             M_AXI_WDATA    =>  OS_AXI_WDATA,    
             M_AXI_WSTRB    =>  OS_AXI_WSTRB,    
             M_AXI_WVALID   =>  OS_AXI_WVALID,   
             M_AXI_BREADY   =>  OS_AXI_BREADY,   
             M_AXI_ARADDR   =>  OS_AXI_ARADDR,   
             M_AXI_ARVALID  =>  OS_AXI_ARVALID,  
             M_AXI_RREADY   =>  OS_AXI_RREADY,   
             M_AXI_ARREADY  =>  OS_AXI_ARREADY,  
             M_AXI_RDATA    =>  OS_AXI_RDATA,    
             M_AXI_RRESP    =>  OS_AXI_RRESP,    
             M_AXI_RVALID   =>  OS_AXI_RVALID,   
             M_AXI_WREADY   =>  OS_AXI_WREADY,   
             M_AXI_BRESP    =>  OS_AXI_BRESP,    
             M_AXI_BVALID   =>  OS_AXI_BVALID,   
             M_AXI_AWREADY  =>  OS_AXI_AWREADY
);


--for sym
--to1XX_AXIS_TVALID   <= temp_to1XX_AXIS_TVALID when (random(1 downto 0) ="00"  or IN_SYNTHESIS) else '0';
--to1XX_AXIS_TREADY   <= temp_to1XX_AXIS_TREADY when (random(1 downto 0) ="00"  or IN_SYNTHESIS) else '0';
--to1XX_AXIS_TVALID   <= temp_to1XX_AXIS_TVALID ; --when (random(0)='0' or IN_SYNTHESIS) else '0';
--to1XX_AXIS_TREADY   <= temp_to1XX_AXIS_TREADY ; --when (random(0)='0' or IN_SYNTHESIS) else '0';
to1XX_AXIS_TVALID   <= temp_to1XX_AXIS_TVALID ; 
to1XX_AXIS_TREADY   <= temp_to1XX_AXIS_TREADY ; 

rand: if IN_SIMULATION generate
    rand_p:process (CLK_1XX)
    begin
        if (rising_edge(CLK_1XX)) then
            if (ARESETN_1XX = '0') then
                random<= x"25C827F1";
            else
                random <= random xor myror(random,19) xor myror(random,8); 
            end if;
        end if;
    end process;
end generate;


--FB_core_i: entity work.test_flowblaze
FB_core_i: entity work.FlowBlaze_core
generic map (
        C_S00_AXIS_DATA_WIDTH,
        C_S00_AXIS_TUSER_WIDTH,
        C_M00_AXIS_DATA_WIDTH,
        C_M00_AXIS_TUSER_WIDTH,
        C_S00_AXI_DATA_WIDTH,
        C_S00_AXI_ADDR_WIDTH
--      C_BASEADDR  : std_logic_vector(31 downto 0)   := x"80000000";
--      C_HIGHADDR  : std_logic_vector(31 downto 0)   := x"9FFFFFFF"
        )
port map (
-- Ports of Axi Stream Slave Bus Interface S00_AXIS
             S0_AXIS_ACLK    =>CLK_1XX,
             S0_AXIS_ARESETN =>  ARESETN_1XX,
             S0_AXIS_TVALID  =>  to1XX_AXIS_TVALID, --in
             S0_AXIS_TDATA   =>  to1XX_AXIS_TDATA,
             S0_AXIS_TKEEP   =>  to1XX_AXIS_TKEEP,
             S0_AXIS_TUSER   =>  to1XX_AXIS_TUSER,
             S0_AXIS_TLAST   =>  to1XX_AXIS_TLAST,
             S0_AXIS_TREADY  =>  temp_to1XX_AXIS_TREADY,--out

-- Master Stream Ports.
             M0_AXIS_ACLK    => CLK_1XX,
             M0_AXIS_ARESETN => ARESETN_1XX,
             M0_AXIS_TVALID  => from1XX_AXIS_TVALID, --out
             M0_AXIS_TDATA   =>from1XX_AXIS_TDATA, 
             M0_AXIS_TKEEP   =>from1XX_AXIS_TKEEP, 
             M0_AXIS_TUSER   =>from1XX_AXIS_TUSER, 
             M0_AXIS_TLAST   =>from1XX_AXIS_TLAST, 
             M0_AXIS_TREADY  =>from1XX_AXIS_TREADY, --in
             
	     M_DEBUG         => M_DEBUG_1XX,
-- Ports of Axi Slave Bus Interface S_AXI
             S_AXI_ACLK	    =>  CLK_1XX,	    
             S_AXI_ARESETN  => ARESETN_1XX,  
             S_AXI_AWADDR   => OS_AXI_AWADDR,   
             S_AXI_AWVALID  => OS_AXI_AWVALID,  
             S_AXI_WDATA    => OS_AXI_WDATA,    
             S_AXI_WSTRB    => OS_AXI_WSTRB,    
             S_AXI_WVALID   =>  OS_AXI_WVALID,   
             S_AXI_BREADY   =>  OS_AXI_BREADY,   
             S_AXI_ARADDR   =>  OS_AXI_ARADDR,   
             S_AXI_ARVALID  =>  OS_AXI_ARVALID,  
             S_AXI_RREADY   =>  OS_AXI_RREADY,   
             S_AXI_ARREADY  =>  OS_AXI_ARREADY,  
             S_AXI_RDATA    =>  OS_AXI_RDATA,    
             S_AXI_RRESP    => OS_AXI_RRESP,    
             S_AXI_RVALID   =>  OS_AXI_RVALID,   
             S_AXI_WREADY   =>  OS_AXI_WREADY,   
             S_AXI_BRESP    => OS_AXI_BRESP,    
             S_AXI_BVALID   =>OS_AXI_BVALID,   
             S_AXI_AWREADY  =>OS_AXI_AWREADY  
);
 
--axi100to156: entity work.axis_clock_converter_0 
axi100to156: axis_clock_converter_0 
port map (
  s_axis_aresetn => ARESETN_1XX,
  s_axis_aclk    => CLK_1XX,
  s_axis_tvalid  => from1XX_AXIS_TVALID,
  s_axis_tready  => from1XX_AXIS_TREADY,
  s_axis_tdata   => from1XX_AXIS_TDATA,
  s_axis_tkeep   => from1XX_AXIS_TKEEP,
  s_axis_tlast   => from1XX_AXIS_TLAST,
  s_axis_tuser   => from1XX_AXIS_TUSER,
  m_axis_aresetn => ARESETN_156,
  m_axis_aclk    => CLK_156,
  m_axis_tvalid  => M0_AXIS_TVALID,
  m_axis_tready  => M0_AXIS_TREADY,
  m_axis_tdata   => M0_AXIS_TDATA,
  m_axis_tkeep   => M0_AXIS_TKEEP,
  m_axis_tlast   => M0_AXIS_TLAST,
  m_axis_tuser   => M0_AXIS_TUSER
);

--axi100to156: entity work.axis_clock_converter_0 
axi100to156debug: axis_clock_converter_0 
port map (
  s_axis_aresetn => ARESETN_1XX,
  s_axis_aclk    => CLK_1XX,
  s_axis_tvalid  => M_DEBUG_1XX.TVALID,
--  s_axis_tready  => open,
  s_axis_tdata   => M_DEBUG_1XX.TDATA,
  s_axis_tkeep   => M_DEBUG_1XX.TKEEP,
  s_axis_tlast   => M_DEBUG_1XX.TLAST,
  s_axis_tuser   => M_DEBUG_1XX.TUSER,
  m_axis_aresetn => ARESETN_156,
  m_axis_aclk    => CLK_156,
  m_axis_tvalid  => M_DEBUG_TVALID,
  m_axis_tready  => '1',
  m_axis_tdata   => M_DEBUG_TDATA,
  m_axis_tkeep   => M_DEBUG_TKEEP,
  m_axis_tlast   => M_DEBUG_TLAST,
  m_axis_tuser   => M_DEBUG_TUSER
);


end architecture full;
