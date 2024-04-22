library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SPECK_CONSTANTS.all;

entity Speck_Block_Cipher_v1_0 is
	generic (
		-- Users to add parameters here
        KEY_SIZE : integer range 0 to 256 := 256;
        BLOCK_SIZE : integer range 0 to 128 := 128;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 7
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end Speck_Block_Cipher_v1_0;

architecture arch_imp of Speck_Block_Cipher_v1_0 is

	-- component declaration
	component Speck_Block_Cipher_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
		);
		port (
		-- Cipher Block Input 
        SLV_REG00_OUT : out std_logic_vector(31 downto 0);
        SLV_REG01_OUT : out std_logic_vector(31 downto 0);
        SLV_REG02_OUT : out std_logic_vector(31 downto 0);
        SLV_REG03_OUT : out std_logic_vector(31 downto 0); 
       
        -- Cipher Key Input
        SLV_REG04_OUT : out std_logic_vector(31 downto 0);
        SLV_REG05_OUT : out std_logic_vector(31 downto 0);
        SLV_REG06_OUT : out std_logic_vector(31 downto 0);
        SLV_REG07_OUT : out std_logic_vector(31 downto 0);
        SLV_REG08_OUT : out std_logic_vector(31 downto 0);
        SLV_REG09_OUT : out std_logic_vector(31 downto 0);
        SLV_REG10_OUT : out std_logic_vector(31 downto 0);
        SLV_REG11_OUT : out std_logic_vector(31 downto 0);
       
        -- Cipher Control/Rest Register
        SLV_REG12_OUT : out std_logic_vector(31 downto 0);
       
        -- Cipher Block Output       
        SLV_REG13_IN : in std_logic_vector(31 downto 0);
        SLV_REG14_IN : in std_logic_vector(31 downto 0);
        SLV_REG15_IN : in std_logic_vector(31 downto 0);
        SLV_REG16_IN : in std_logic_vector(31 downto 0);
       
        -- Cipher Status Output      
        SLV_REG17_IN : in std_logic_vector(31 downto 0);
		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component Speck_Block_Cipher_v1_0_S00_AXI;


COMPONENT SPECK_CIPHER
     GENERIC(KEY_SIZE : integer range 0 to 256;
                BLOCK_SIZE : integer range 0 to 128;
                ROUND_LIMIT: integer range 0 to 34);
    PORT(
         SYS_CLK : IN  std_logic;
         RST : IN  std_logic;
         BUSY : OUT  std_logic;
         CONTROL : IN  std_logic_vector(1 downto 0);
         KEY : IN  std_logic_vector(KEY_SIZE - 1 downto 0);
         BLOCK_INPUT : IN  std_logic_vector(BLOCK_SIZE - 1 downto 0);
         BLOCK_OUTPUT : OUT  std_logic_vector(BLOCK_SIZE - 1 downto 0)
        );
    END COMPONENT;
    
-- Signals
signal input_key_buffer : std_logic_vector(KEY_SIZE -1 downto 0);
signal input_block_buffer : std_logic_vector(BLOCK_SIZE -1 downto 0);
signal output_block_buffer : std_logic_vector(BLOCK_SIZE -1 downto 0);

signal input_block_register_0 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_block_register_1 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_block_register_2 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_block_register_3 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);

signal output_block_register_0 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal output_block_register_1 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal output_block_register_2 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal output_block_register_3 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);

signal input_key_register_0 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_1 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_2 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_3 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_4 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_5 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_6 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal input_key_register_7 : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);

signal block_control_rst : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
signal block_status : std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);

signal busy_buffer : std_logic;
signal control_buffer : std_logic_vector(1 downto 0);
signal reset_buffer : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXI
Speck_Block_Cipher_v1_0_S00_AXI_inst : Speck_Block_Cipher_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	       	-- Cipher Block Input 
        SLV_REG00_OUT => input_block_register_0,
        SLV_REG01_OUT => input_block_register_1,
        SLV_REG02_OUT => input_block_register_2,
        SLV_REG03_OUT => input_block_register_3, 
       
        -- Cipher Key Input
        SLV_REG04_OUT => input_key_register_0,
        SLV_REG05_OUT => input_key_register_1,
        SLV_REG06_OUT => input_key_register_2,
        SLV_REG07_OUT => input_key_register_3,
        SLV_REG08_OUT => input_key_register_4,
        SLV_REG09_OUT => input_key_register_5,
        SLV_REG10_OUT => input_key_register_6,
        SLV_REG11_OUT => input_key_register_7,
       
        -- Cipher Control/Rest Register
        SLV_REG12_OUT => block_control_rst,
       
        -- Cipher Block Output       
        SLV_REG13_IN => output_block_register_0,
        SLV_REG14_IN => output_block_register_1,
        SLV_REG15_IN => output_block_register_2,
        SLV_REG16_IN => output_block_register_3,
       
        -- Cipher Status Output      
        SLV_REG17_IN => block_status,
        
        -- AXI Bus
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Add user logic here
    Block_Cipher_Instance: SPECK_CIPHER
        GENERIC MAP (KEY_SIZE => KEY_SIZE,
                         BLOCK_SIZE => BLOCK_SIZE,
                         ROUND_LIMIT => Round_Count_Lookup(KEY_SIZE, BLOCK_SIZE))
        PORT MAP (
              SYS_CLK => s00_axi_aclk,
              RST => reset_buffer,
              BUSY => busy_buffer,
              CONTROL => control_buffer,
              KEY => input_key_buffer,
              BLOCK_INPUT => input_block_buffer,
              BLOCK_OUTPUT => output_block_buffer
        );
	-- User logic ends
	
	block_status <= X"0000000" & "000" & busy_buffer;  
	
	control_buffer <= block_control_rst(1 downto 0);
	
	reset_buffer <= block_control_rst(C_S00_AXI_DATA_WIDTH - 1);
	
	BLOCK_32 : if (BLOCK_SIZE = 32) generate
    begin
        
        input_block_buffer <= input_block_register_0;
        
        output_block_register_0 <= output_block_buffer;
        output_block_register_1 <= (OTHERS => '0');
        output_block_register_2 <= (OTHERS => '0');
        output_block_register_3 <= (OTHERS => '0');
         
    end generate;


    BLOCK_48 : if (BLOCK_SIZE = 48) generate
    begin
        
        input_block_buffer <= input_block_register_1(15 downto 0) & input_block_register_0;
        
        output_block_register_0 <= output_block_buffer(31 downto 0);
        output_block_register_1 <= output_block_buffer(47 downto 32);
        output_block_register_2 <= (OTHERS => '0');
        output_block_register_3 <= (OTHERS => '0');
         
    end generate;

    
    BLOCK_64 : if (BLOCK_SIZE = 64) generate
        begin
            
            input_block_buffer <= input_block_register_1 & input_block_register_0;
            
            output_block_register_0 <= output_block_buffer(31 downto 0);
            output_block_register_1 <= output_block_buffer(63 downto 32);
            output_block_register_2 <= (OTHERS => '0');
            output_block_register_3 <= (OTHERS => '0');
    end generate;


    BLOCK_96 : if (BLOCK_SIZE = 96) generate
        begin
            
            input_block_buffer <= input_block_register_2 & input_block_register_1 & input_block_register_0;
            
            output_block_register_0 <= output_block_buffer(31 downto 0);
            output_block_register_1 <= output_block_buffer(63 downto 32);
            output_block_register_2 <= output_block_buffer(95 downto 64);
            output_block_register_3 <= (OTHERS => '0');
    end generate;	
    
    
    BLOCK_128 : if (BLOCK_SIZE = 128) generate
        begin
                
            input_block_buffer <= input_block_register_3 & input_block_register_2 & input_block_register_1 & input_block_register_0;
                
            output_block_register_0 <= output_block_buffer(31 downto 0);
            output_block_register_1 <= output_block_buffer(63 downto 32);
            output_block_register_2 <= output_block_buffer(95 downto 64);
            output_block_register_3 <= output_block_buffer(127 downto 96);
    end generate;
	
	
	KEY_64 : if (KEY_SIZE = 64) generate
        begin
            input_key_buffer <= input_key_register_1 & input_key_register_0;        
    end generate;

    KEY_72 : if (KEY_SIZE = 72) generate
        begin
            input_key_buffer <= input_key_register_2(7 downto 0) & input_key_register_1 & input_key_register_0;        
    end generate;	

    KEY_96 : if (KEY_SIZE = 96) generate
        begin
            input_key_buffer <= input_key_register_2 & input_key_register_1 & input_key_register_0;        
    end generate;

    KEY_128 : if (KEY_SIZE = 128) generate
        begin
            input_key_buffer <= input_key_register_3 & input_key_register_2 & input_key_register_1 & input_key_register_0;        
    end generate;

    KEY_144 : if (KEY_SIZE = 144) generate
        begin
            input_key_buffer <= input_key_register_4(15 downto 0) & input_key_register_3 & input_key_register_2 & input_key_register_1 & input_key_register_0;        
    end generate;

    KEY_192 : if (KEY_SIZE = 192) generate
        begin
            input_key_buffer <= input_key_register_5 & input_key_register_4 & input_key_register_3 & input_key_register_2 & input_key_register_1 & input_key_register_0;        
    end generate;

    KEY_256 : if (KEY_SIZE = 256) generate
        begin
            input_key_buffer <= input_key_register_7 & input_key_register_6  & input_key_register_5 & input_key_register_4 & input_key_register_3 & input_key_register_2 & input_key_register_1 & input_key_register_0;        
    end generate;

end arch_imp;
