-- ----------------------------------------------------------------------------
--                             Entity declaration
-- ----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

Library UNISIM;
use UNISIM.vcomponents.all;

--Library cam;

entity FlowBlaze156_2 is 
    generic (
-- Parameters of AxiStream Slave Bus Interface S00_AXIS
                C_S00_AXIS_DATA_WIDTH  : integer   := 256;
                C_S00_AXIS_TUSER_WIDTH : integer   := 128;
-- Parameters of AxiStream Master Bus Interface M00_AXIS
                C_M00_AXIS_DATA_WIDTH  : integer   := 256;
                C_M00_AXIS_TUSER_WIDTH : integer   := 128;
-- Parameters of Axi Slave Bus Interface S00_AXIS
                C_S00_AXI_DATA_WIDTH  : integer   := 32;
                C_S00_AXI_ADDR_WIDTH  : integer   := 32
--                C_BASEADDR  : std_logic_vector(31 downto 0)   := x"80000000";
--                C_HIGHADDR  : std_logic_vector(31 downto 0)   := x"9FFFFFFF"
            );
    port (
            CLK_100 : in std_logic;
            ARESETN_100  : in std_logic;
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

architecture full of FlowBlaze156_2 is

signal toos2_AXIS_TVALID   : std_logic;
signal toos2_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
signal toos2_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
signal toos2_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
signal toos2_AXIS_TLAST    : std_logic;
signal toos2_AXIS_TREADY   : std_logic;

signal to100_AXIS_TVALID   : std_logic;
signal to100_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
signal to100_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
signal to100_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
signal to100_AXIS_TLAST    : std_logic;
signal to100_AXIS_TREADY   : std_logic;

signal from100_AXIS_TVALID   : std_logic;
signal from100_AXIS_TDATA    : std_logic_vector(C_M00_AXIS_DATA_WIDTH-1 downto 0);
signal from100_AXIS_TKEEP    : std_logic_vector((C_M00_AXIS_DATA_WIDTH/8)-1 downto 0);
signal from100_AXIS_TUSER    : std_logic_vector(C_M00_AXIS_TUSER_WIDTH-1 downto 0);
signal from100_AXIS_TLAST    : std_logic;
signal from100_AXIS_TREADY   : std_logic;


signal OS_AXI_ACLK	: std_logic;  
signal OS_AXI_ARESETN	: std_logic;                                     
signal OS_AXI_AWADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);     
signal OS_AXI_AWVALID	: std_logic_vector(0 downto 0); 
signal OS_AXI_WDATA 	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0); 
signal OS_AXI_WSTRB 	: std_logic_vector(C_S00_AXI_DATA_WIDTH/8-1 downto 0);   
signal OS_AXI_WVALID	: std_logic_vector(0 downto 0);                                    
signal OS_AXI_BREADY	: std_logic_vector(0 downto 0);                                    
signal OS_AXI_ARADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
signal OS_AXI_ARVALID	: std_logic_vector(0 downto 0);                                     
signal OS_AXI_RREADY	: std_logic_vector(0 downto 0);                                     
signal OS_AXI_ARREADY	: std_logic_vector(0 downto 0);             
signal OS_AXI_RDATA	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal OS_AXI_RRESP	: std_logic_vector(1 downto 0);
signal OS_AXI_RVALID	: std_logic_vector(0 downto 0);                                   
signal OS_AXI_WREADY	: std_logic_vector(0 downto 0); 
signal OS_AXI_BRESP	: std_logic_vector(1 downto 0);                         
signal OS_AXI_BVALID	: std_logic_vector(0 downto 0);                                    
signal OS_AXI_AWREADY   : std_logic_vector(0 downto 0); 


signal OS1_AXI_ACLK	: std_logic;  
signal OS1_AXI_ARESETN	: std_logic;                                     
signal OS1_AXI_AWADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);     
signal OS1_AXI_AWVALID	: std_logic_vector(0 downto 0); 
signal OS1_AXI_WDATA 	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0); 
signal OS1_AXI_WSTRB 	: std_logic_vector(C_S00_AXI_DATA_WIDTH/8-1 downto 0);   
signal OS1_AXI_WVALID	: std_logic_vector(0 downto 0);                                    
signal OS1_AXI_BREADY	: std_logic_vector(0 downto 0);                                    
signal OS1_AXI_ARADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
signal OS1_AXI_ARVALID	: std_logic_vector(0 downto 0);                                     
signal OS1_AXI_RREADY	: std_logic_vector(0 downto 0);                                     
signal OS1_AXI_ARREADY	: std_logic_vector(0 downto 0);             
signal OS1_AXI_RDATA	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal OS1_AXI_RRESP	: std_logic_vector(1 downto 0);
signal OS1_AXI_RVALID	: std_logic_vector(0 downto 0);                                   
signal OS1_AXI_WREADY	: std_logic_vector(0 downto 0); 
signal OS1_AXI_BRESP	: std_logic_vector(1 downto 0);                         
signal OS1_AXI_BVALID	: std_logic_vector(0 downto 0);                                    
signal OS1_AXI_AWREADY   : std_logic_vector(0 downto 0); 


signal OS2_AXI_ACLK	: std_logic;  
signal OS2_AXI_ARESETN	: std_logic;                                     
signal OS2_AXI_AWADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);     
signal OS2_AXI_AWVALID	: std_logic_vector(0 downto 0); 
signal OS2_AXI_WDATA 	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0); 
signal OS2_AXI_WSTRB 	: std_logic_vector(C_S00_AXI_DATA_WIDTH/8-1 downto 0);   
signal OS2_AXI_WVALID	: std_logic_vector(0 downto 0);                                    
signal OS2_AXI_BREADY	: std_logic_vector(0 downto 0);                                    
signal OS2_AXI_ARADDR	: std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
signal OS2_AXI_ARVALID	: std_logic_vector(0 downto 0);                                     
signal OS2_AXI_RREADY	: std_logic_vector(0 downto 0);                                     
signal OS2_AXI_ARREADY	: std_logic_vector(0 downto 0);             
signal OS2_AXI_RDATA	: std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
signal OS2_AXI_RRESP	: std_logic_vector(1 downto 0);
signal OS2_AXI_RVALID	: std_logic_vector(0 downto 0);                                   
signal OS2_AXI_WREADY	: std_logic_vector(0 downto 0); 
signal OS2_AXI_BRESP	: std_logic_vector(1 downto 0);                         
signal OS2_AXI_BVALID	: std_logic_vector(0 downto 0);                                    
signal OS2_AXI_AWREADY   : std_logic_vector(0 downto 0); 

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

component FlowBlaze_core generic (
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


component axilite_interconnect port(
  aclk        : in  std_logic;                  
  aresetn     : in  std_logic;  
  
  s00_axi_awaddr      : in  std_logic_vector(31 downto 0);  
  s00_axi_awprot      : in  std_logic_vector(2 downto 0);
  s00_axi_awvalid     : in  std_logic_vector(0 downto 0);
  s00_axi_awready     : out std_logic_vector(0 downto 0);
  s00_axi_wdata       : in  std_logic_vector(31 downto 0);
  s00_axi_wstrb       : in  std_logic_vector(3 downto 0);
  s00_axi_wvalid      : in  std_logic_vector(0 downto 0);
  s00_axi_wready      : out std_logic_vector(0 downto 0);
  s00_axi_bresp       : out std_logic_vector(1 downto 0);
  s00_axi_bvalid      : out std_logic_vector(0 downto 0);
  s00_axi_bready      : in  std_logic_vector(0 downto 0);
  s00_axi_araddr      : in  std_logic_vector(31 downto 0);
  s00_axi_arprot      : in  std_logic_vector(2 downto 0);
  s00_axi_arvalid     : in  std_logic_vector(0 downto 0);
  s00_axi_arready     : out std_logic_vector(0 downto 0);
  s00_axi_rdata       : out  std_logic_vector(31 downto 0);
  s00_axi_rresp       : out std_logic_vector(1 downto 0);
  s00_axi_rvalid      : out std_logic_vector(0 downto 0);  
  s00_axi_rready      : in std_logic_vector(0 downto 0);
    
  m00_axi_awaddr      : out std_logic_vector(31 downto 0); 
  m00_axi_awprot      : out std_logic_vector(2 downto 0);  
  m00_axi_awvalid     : out std_logic_vector(0 downto 0);                     
  m00_axi_awready     : in  std_logic_vector(0 downto 0);                     
  m00_axi_wdata       : out std_logic_vector(31 downto 0); 
  m00_axi_wstrb       : out std_logic_vector(3 downto 0);  
  m00_axi_wvalid      : out std_logic_vector(0 downto 0);                     
  m00_axi_wready      : in  std_logic_vector(0 downto 0);                     
  m00_axi_bresp       : in  std_logic_vector(1 downto 0);  
  m00_axi_bvalid      : in  std_logic_vector(0 downto 0);                     
  m00_axi_bready      : out std_logic_vector(0 downto 0);                     
  m00_axi_araddr      : out std_logic_vector(31 downto 0); 
  m00_axi_arprot      : out std_logic_vector(2 downto 0);  
  m00_axi_arvalid     : out std_logic_vector(0 downto 0);                     
  m00_axi_arready     : in  std_logic_vector(0 downto 0);                     
  m00_axi_rdata       : in  std_logic_vector(31 downto 0);
  m00_axi_rresp       : in  std_logic_vector(1 downto 0);  
  m00_axi_rvalid      : in  std_logic_vector(0 downto 0);                     
  m00_axi_rready      : out std_logic_vector(0 downto 0); 
      
  m01_axi_awaddr      : out std_logic_vector(31 downto 0); 
  m01_axi_awprot      : out std_logic_vector(2 downto 0);  
  m01_axi_awvalid     : out std_logic_vector(0 downto 0);                     
  m01_axi_awready     : in  std_logic_vector(0 downto 0);                     
  m01_axi_wdata       : out std_logic_vector(31 downto 0); 
  m01_axi_wstrb       : out std_logic_vector(3 downto 0);  
  m01_axi_wvalid      : out std_logic_vector(0 downto 0);                     
  m01_axi_wready      : in  std_logic_vector(0 downto 0);                     
  m01_axi_bresp       : in  std_logic_vector(1 downto 0);  
  m01_axi_bvalid      : in  std_logic_vector(0 downto 0);                     
  m01_axi_bready      : out std_logic_vector(0 downto 0);                     
  m01_axi_araddr      : out std_logic_vector(31 downto 0); 
  m01_axi_arprot      : out std_logic_vector(2 downto 0);  
  m01_axi_arvalid     : out std_logic_vector(0 downto 0);                     
  m01_axi_arready     : in  std_logic_vector(0 downto 0);                     
  m01_axi_rdata       : in  std_logic_vector(31 downto 0);
  m01_axi_rresp       : in  std_logic_vector(1 downto 0);  
  m01_axi_rvalid      : in  std_logic_vector(0 downto 0);                     
  m01_axi_rready      : out std_logic_vector(0 downto 0)                      
 );
 end component;

begin

--axi156to100: entity work.axis_clock_converter_0 
axi156to100: axis_clock_converter_0
port map (
  s_axis_aresetn => ARESETN_156,
  s_axis_aclk    => CLK_156,
  s_axis_tvalid  => S0_AXIS_TVALID,
  s_axis_tready  => S0_AXIS_TREADY,
  s_axis_tdata   => S0_AXIS_TDATA,
  s_axis_tkeep   => S0_AXIS_TKEEP,
  s_axis_tlast   => S0_AXIS_TLAST,
  s_axis_tuser   => S0_AXIS_TUSER,
  m_axis_aresetn => ARESETN_100,
  m_axis_aclk    => CLK_100,
  m_axis_tvalid  => to100_AXIS_TVALID,
  m_axis_tready  => to100_AXIS_TREADY,
  m_axis_tdata   => to100_AXIS_TDATA,
  m_axis_tkeep   => to100_AXIS_TKEEP,
  m_axis_tlast   => to100_AXIS_TLAST,
  m_axis_tuser   => to100_AXIS_TUSER  
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
             M_AXI_ACLK	    =>  CLK_100,	    
             M_AXI_ARESETN  =>  ARESETN_100,  
             M_AXI_AWADDR   =>  OS_AXI_AWADDR,   
             M_AXI_AWVALID  =>  OS_AXI_AWVALID(0),  
             M_AXI_WDATA    =>  OS_AXI_WDATA,    
             M_AXI_WSTRB    =>  OS_AXI_WSTRB,    
             M_AXI_WVALID   =>  OS_AXI_WVALID(0),   
             M_AXI_BREADY   =>  OS_AXI_BREADY(0),   
             M_AXI_ARADDR   =>  OS_AXI_ARADDR,   
             M_AXI_ARVALID  =>  OS_AXI_ARVALID(0),  
             M_AXI_RREADY   =>  OS_AXI_RREADY(0),   
             M_AXI_ARREADY  =>  OS_AXI_ARREADY(0),  
             M_AXI_RDATA    =>  OS_AXI_RDATA,    
             M_AXI_RRESP    =>  OS_AXI_RRESP,    
             M_AXI_RVALID   =>  OS_AXI_RVALID(0),   
             M_AXI_WREADY   =>  OS_AXI_WREADY(0),   
             M_AXI_BRESP    =>  OS_AXI_BRESP,    
             M_AXI_BVALID   =>  OS_AXI_BVALID(0),   
             M_AXI_AWREADY  =>  OS_AXI_AWREADY(0)
);

axi_crossbar_0i: axilite_interconnect 
port map (
             ACLK	    =>  CLK_100,	    
             ARESETN    =>  ARESETN_100,
             
             S00_AXI_AWADDR   =>  OS_AXI_AWADDR,
             S00_AXI_AWPROT   =>  STD_LOGIC_VECTOR'(B"000"),   
             S00_AXI_AWVALID  =>  OS_AXI_AWVALID,  
             S00_AXI_WDATA    =>  OS_AXI_WDATA,    
             S00_AXI_WSTRB    =>  OS_AXI_WSTRB,    
             S00_AXI_WVALID   =>  OS_AXI_WVALID,   
             S00_AXI_BREADY   =>  OS_AXI_BREADY,   
             S00_AXI_ARADDR   =>  OS_AXI_ARADDR,
             S00_AXI_ARPROT   =>  STD_LOGIC_VECTOR'(B"000"),   
             S00_AXI_ARVALID  =>  OS_AXI_ARVALID,  
             S00_AXI_RREADY   =>  OS_AXI_RREADY,   
             S00_AXI_ARREADY  =>  OS_AXI_ARREADY,  
             S00_AXI_RDATA    =>  OS_AXI_RDATA,    
             S00_AXI_RRESP    =>  OS_AXI_RRESP,    
             S00_AXI_RVALID   =>  OS_AXI_RVALID,   
             S00_AXI_WREADY   =>  OS_AXI_WREADY,   
             S00_AXI_BRESP    =>  OS_AXI_BRESP,    
             S00_AXI_BVALID   =>  OS_AXI_BVALID,   
             S00_AXI_AWREADY  =>  OS_AXI_AWREADY,
             
             M00_AXI_AWADDR   =>  OS1_AXI_AWADDR,  
             M00_AXI_AWVALID  =>  OS1_AXI_AWVALID,  
             M00_AXI_WDATA    =>  OS1_AXI_WDATA,    
             M00_AXI_WSTRB    =>  OS1_AXI_WSTRB,    
             M00_AXI_WVALID   =>  OS1_AXI_WVALID,   
             M00_AXI_BREADY   =>  OS1_AXI_BREADY,   
             M00_AXI_ARADDR   =>  OS1_AXI_ARADDR,   
             M00_AXI_ARVALID  =>  OS1_AXI_ARVALID,  
             M00_AXI_RREADY   =>  OS1_AXI_RREADY,   
             M00_AXI_ARREADY  =>  OS1_AXI_ARREADY,  
             M00_AXI_RDATA    =>  OS1_AXI_RDATA,    
             M00_AXI_RRESP    =>  OS1_AXI_RRESP,    
             M00_AXI_RVALID   =>  OS1_AXI_RVALID,   
             M00_AXI_WREADY   =>  OS1_AXI_WREADY,   
             M00_AXI_BRESP    =>  OS1_AXI_BRESP,    
             M00_AXI_BVALID   =>  OS1_AXI_BVALID,   
             M00_AXI_AWREADY  =>  OS1_AXI_AWREADY,
             
             M01_AXI_AWADDR   =>  OS2_AXI_AWADDR,
             M01_AXI_AWVALID  =>  OS2_AXI_AWVALID,  
             M01_AXI_WDATA    =>  OS2_AXI_WDATA,    
             M01_AXI_WSTRB    =>  OS2_AXI_WSTRB,    
             M01_AXI_WVALID   =>  OS2_AXI_WVALID,   
             M01_AXI_BREADY   =>  OS2_AXI_BREADY,   
             M01_AXI_ARADDR   =>  OS2_AXI_ARADDR,   
             M01_AXI_ARVALID  =>  OS2_AXI_ARVALID,  
             M01_AXI_RREADY   =>  OS2_AXI_RREADY,   
             M01_AXI_ARREADY  =>  OS2_AXI_ARREADY,  
             M01_AXI_RDATA    =>  OS2_AXI_RDATA,    
             M01_AXI_RRESP    =>  OS2_AXI_RRESP,    
             M01_AXI_RVALID   =>  OS2_AXI_RVALID,   
             M01_AXI_WREADY   =>  OS2_AXI_WREADY,   
             M01_AXI_BRESP    =>  OS2_AXI_BRESP,    
             M01_AXI_BVALID   =>  OS2_AXI_BVALID,   
             M01_AXI_AWREADY  =>  OS2_AXI_AWREADY    
);


FB_i: entity work.FlowBlaze_core
generic map (
        C_S00_AXIS_DATA_WIDTH,
        C_S00_AXIS_TUSER_WIDTH,
        C_M00_AXIS_DATA_WIDTH,
        C_M00_AXIS_TUSER_WIDTH,
        C_S00_AXI_DATA_WIDTH,
        C_S00_AXI_ADDR_WIDTH,
        x"80000000" --C_BASEADDR
        )
port map (
-- Ports of Axi Stream Slave Bus Interface S00_AXIS
             S0_AXIS_ACLK    =>  CLK_100,
             S0_AXIS_ARESETN =>  ARESETN_100,
             S0_AXIS_TVALID  =>  toos2_AXIS_TVALID, --in
             S0_AXIS_TDATA   =>  toos2_AXIS_TDATA,
             S0_AXIS_TKEEP   =>  toos2_AXIS_TKEEP,
             S0_AXIS_TUSER   =>  toos2_AXIS_TUSER,
             S0_AXIS_TLAST   =>  toos2_AXIS_TLAST,
             S0_AXIS_TREADY  =>  toos2_AXIS_TREADY,--out

-- Master Stream Ports.
             M0_AXIS_ACLK    =>  CLK_100,
             M0_AXIS_ARESETN =>  ARESETN_100,
             M0_AXIS_TVALID  =>  from100_AXIS_TVALID, --out
             M0_AXIS_TDATA   =>  from100_AXIS_TDATA, 
             M0_AXIS_TKEEP   =>  from100_AXIS_TKEEP, 
             M0_AXIS_TUSER   =>  from100_AXIS_TUSER, 
             M0_AXIS_TLAST   =>  from100_AXIS_TLAST, 
             M0_AXIS_TREADY  =>  from100_AXIS_TREADY, --in
             
-- Ports of Axi Slave Bus Interface S_AXI
             S_AXI_ACLK	    =>  CLK_100,	    
             S_AXI_ARESETN  =>  ARESETN_100,  
             S_AXI_AWADDR   =>  OS1_AXI_AWADDR,   
             S_AXI_AWVALID  =>  OS1_AXI_AWVALID(0),  
             S_AXI_WDATA    =>  OS1_AXI_WDATA,    
             S_AXI_WSTRB    =>  OS1_AXI_WSTRB,    
             S_AXI_WVALID   =>  OS1_AXI_WVALID(0),   
             S_AXI_BREADY   =>  OS1_AXI_BREADY(0),   
             S_AXI_ARADDR   =>  OS1_AXI_ARADDR,   
             S_AXI_ARVALID  =>  OS1_AXI_ARVALID(0),  
             S_AXI_RREADY   =>  OS1_AXI_RREADY(0),   
             S_AXI_ARREADY  =>  OS1_AXI_ARREADY(0),  
             S_AXI_RDATA    =>  OS1_AXI_RDATA,    
             S_AXI_RRESP    =>  OS1_AXI_RRESP,    
             S_AXI_RVALID   =>  OS1_AXI_RVALID(0),   
             S_AXI_WREADY   =>  OS1_AXI_WREADY(0),   
             S_AXI_BRESP    =>  OS1_AXI_BRESP,    
             S_AXI_BVALID   =>  OS1_AXI_BVALID(0),   
             S_AXI_AWREADY  =>  OS1_AXI_AWREADY(0)  
);
 
FB_i2: FlowBlaze_core
generic map (
        C_S00_AXIS_DATA_WIDTH,
        C_S00_AXIS_TUSER_WIDTH,
        C_M00_AXIS_DATA_WIDTH,
        C_M00_AXIS_TUSER_WIDTH,
        C_S00_AXI_DATA_WIDTH,
        C_S00_AXI_ADDR_WIDTH,
        x"81000000" --C_BASEADDR
        )
port map (
-- Ports of Axi Stream Slave Bus Interface S00_AXIS
             S0_AXIS_ACLK    =>  CLK_100,
             S0_AXIS_ARESETN =>  ARESETN_100,
             S0_AXIS_TVALID  =>  to100_AXIS_TVALID, --in
             S0_AXIS_TDATA   =>  to100_AXIS_TDATA,
             S0_AXIS_TKEEP   =>  to100_AXIS_TKEEP,
             S0_AXIS_TUSER   =>  to100_AXIS_TUSER,
             S0_AXIS_TLAST   =>  to100_AXIS_TLAST,
             S0_AXIS_TREADY  =>  to100_AXIS_TREADY,--out

-- Master Stream Ports.
             M0_AXIS_ACLK    =>  CLK_100,
             M0_AXIS_ARESETN =>  ARESETN_100,
             M0_AXIS_TVALID  =>  toos2_AXIS_TVALID, --out
             M0_AXIS_TDATA   =>  toos2_AXIS_TDATA, 
             M0_AXIS_TKEEP   =>  toos2_AXIS_TKEEP, 
             M0_AXIS_TUSER   =>  toos2_AXIS_TUSER, 
             M0_AXIS_TLAST   =>  toos2_AXIS_TLAST, 
             M0_AXIS_TREADY  =>  toos2_AXIS_TREADY, --in
             
-- Ports of Axi Slave Bus Interface S_AXI
             S_AXI_ACLK	    =>  CLK_100,	    
             S_AXI_ARESETN  =>  ARESETN_100,  
             S_AXI_AWADDR   =>  OS2_AXI_AWADDR,   
             S_AXI_AWVALID  =>  OS2_AXI_AWVALID(0),  
             S_AXI_WDATA    =>  OS2_AXI_WDATA,    
             S_AXI_WSTRB    =>  OS2_AXI_WSTRB,    
             S_AXI_WVALID   =>  OS2_AXI_WVALID(0),   
             S_AXI_BREADY   =>  OS2_AXI_BREADY(0),   
             S_AXI_ARADDR   =>  OS2_AXI_ARADDR,   
             S_AXI_ARVALID  =>  OS2_AXI_ARVALID(0),  
             S_AXI_RREADY   =>  OS2_AXI_RREADY(0),   
             S_AXI_ARREADY  =>  OS2_AXI_ARREADY(0),  
             S_AXI_RDATA    =>  OS2_AXI_RDATA,    
             S_AXI_RRESP    =>  OS2_AXI_RRESP,    
             S_AXI_RVALID   =>  OS2_AXI_RVALID(0),   
             S_AXI_WREADY   =>  OS2_AXI_WREADY(0),   
             S_AXI_BRESP    =>  OS2_AXI_BRESP,    
             S_AXI_BVALID   =>  OS2_AXI_BVALID(0),   
             S_AXI_AWREADY  =>  OS2_AXI_AWREADY(0)  
);

--axi100to156: entity work.axis_clock_converter_0 
axi100to156: axis_clock_converter_0 
port map (
  s_axis_aresetn => ARESETN_100,
  s_axis_aclk    => CLK_100,
  s_axis_tvalid  => from100_AXIS_TVALID,
  s_axis_tready  => from100_AXIS_TREADY,
  s_axis_tdata   => from100_AXIS_TDATA,
  s_axis_tkeep   => from100_AXIS_TKEEP,
  s_axis_tlast   => from100_AXIS_TLAST,
  s_axis_tuser   => from100_AXIS_TUSER,
  m_axis_aresetn => ARESETN_156,
  m_axis_aclk    => CLK_156,
  m_axis_tvalid  => M0_AXIS_TVALID,
  m_axis_tready  => M0_AXIS_TREADY,
  m_axis_tdata   => M0_AXIS_TDATA,
  m_axis_tkeep   => M0_AXIS_TKEEP,
  m_axis_tlast   => M0_AXIS_TLAST,
  m_axis_tuser   => M0_AXIS_TUSER
);

end architecture full;
