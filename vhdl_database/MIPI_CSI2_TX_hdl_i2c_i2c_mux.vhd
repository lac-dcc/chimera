
library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.NUMERIC_STD.ALL;


entity I2C_MUX is
	port(
		MCLK		: in	std_logic;
		nRST		: in	std_logic;
		SCL			: inout	std_logic;
		SDA			: inout	std_logic;
        EEPROM_ACTIVE : out std_logic;
        OV_ACTIVE : out std_logic;
        start_activated_by_i2c  : out std_logic
	);
end I2C_MUX;

architecture Behavioral of I2C_MUX is
-- COMPONENTS --
	component I2CSLAVE
		generic( DEVICE: std_logic_vector(7 downto 0));
		port(
			MCLK		: in	std_logic;
			nRST		: in	std_logic;
			SDA_IN		: in	std_logic;
			SCL_IN		: in	std_logic;
			SDA_OUT		: out	std_logic;
			SCL_OUT		: out	std_logic;
			ADDRESS		: out	std_logic_vector(7 downto 0);
			DATA_OUT	: out	std_logic_vector(7 downto 0);
			DATA_IN		: in	std_logic_vector(7 downto 0);
			WR			: out	std_logic;
			RD			: out	std_logic;
            DEVICE_ACTIVE : out std_logic
		);
	end component;
	
	component sp256x8_e54
		port(
			address		: in	std_logic_vector(7 downto 0);
			clock		: in	std_logic;
			data		: in	std_logic_vector(7 downto 0);
			wren		: in	std_logic;
			q			: out	std_logic_vector(7 downto 0)
		);
	end component;
	
    component sp256x8_e55
    port(
        address        : in    std_logic_vector(7 downto 0);
        clock        : in    std_logic;
        data        : in    std_logic_vector(7 downto 0);
        wren        : in    std_logic;
        q            : out    std_logic_vector(7 downto 0)
    );
    end component;
    
    component sp256x8_e56
    port(
        address        : in    std_logic_vector(7 downto 0);
        clock        : in    std_logic;
        data        : in    std_logic_vector(7 downto 0);
        wren        : in    std_logic;
        q            : out    std_logic_vector(7 downto 0)
    );
    end component;    
    
    component sp256x8_e57
    port(
        address        : in    std_logic_vector(7 downto 0);
        clock        : in    std_logic;
        data        : in    std_logic_vector(7 downto 0);
        wren        : in    std_logic;
        q            : out    std_logic_vector(7 downto 0)
    );
    end component;    
	
    component sp64Kx8
    port(
        address        : in    std_logic_vector(15 downto 0);
        clock        : in    std_logic;
        data        : in    std_logic_vector(7 downto 0);
        wren        : in    std_logic;
        q            : out    std_logic_vector(7 downto 0)
    );
    end component;
	
	-- SIGNALS --
	
	signal SDA_t		: std_logic;
    signal SCL_t        : std_logic;
	
    signal SDA_IN		: std_logic;
    signal SCL_IN        : std_logic;
    
	--EEPROM_54
	signal SDA_OUT		: std_logic;
	signal SCL_OUT		: std_logic;
	signal ADDRESS		: std_logic_vector(7 downto 0);
	signal DATA_OUT		: std_logic_vector(7 downto 0);
	signal DATA_IN		: std_logic_vector(7 downto 0);
	signal WR			: std_logic;
	signal RD			: std_logic;
	signal EEPROM_54_ACTIVE_sig: std_logic;
	
	signal q			: std_logic_vector(7 downto 0);
	signal BUFFER8		: std_logic_vector(7 downto 0);
	
	--EEPROM_55
    signal SDA_OUT_E55        : std_logic;
    signal SCL_OUT_E55        : std_logic;
    signal ADDRESS_E55        : std_logic_vector(7 downto 0);
    signal DATA_OUT_E55        : std_logic_vector(7 downto 0);
    signal DATA_IN_E55        : std_logic_vector(7 downto 0);
    signal WR_E55            : std_logic;
    signal RD_E55            : std_logic;
    signal EEPROM_55_ACTIVE_sig: std_logic;
    
    signal q_E55            : std_logic_vector(7 downto 0);
    signal BUFFER8_E55        : std_logic_vector(7 downto 0);	
    
    --EEPROM_56
    signal SDA_OUT_E56        : std_logic;
    signal SCL_OUT_E56        : std_logic;
    signal ADDRESS_E56        : std_logic_vector(7 downto 0);
    signal DATA_OUT_E56        : std_logic_vector(7 downto 0);
    signal DATA_IN_E56        : std_logic_vector(7 downto 0);
    signal WR_E56            : std_logic;
    signal RD_E56            : std_logic;
    signal EEPROM_56_ACTIVE_sig: std_logic;
    
    signal q_E56            : std_logic_vector(7 downto 0);
    signal BUFFER8_E56        : std_logic_vector(7 downto 0);
    
    --EEPROM_57
    signal SDA_OUT_E57        : std_logic;
    signal SCL_OUT_E57        : std_logic;
    signal ADDRESS_E57        : std_logic_vector(7 downto 0);
    signal DATA_OUT_E57        : std_logic_vector(7 downto 0);
    signal DATA_IN_E57        : std_logic_vector(7 downto 0);
    signal WR_E57            : std_logic;
    signal RD_E57            : std_logic;
    signal EEPROM_57_ACTIVE_sig: std_logic;
    
    signal q_E57            : std_logic_vector(7 downto 0);
    signal BUFFER8_E57        : std_logic_vector(7 downto 0);
	
	--OV5693
	signal SDA_OUT_OV		: std_logic;
    signal SCL_OUT_OV        : std_logic;
    signal ADDRESS_OV        : std_logic_vector(7 downto 0);    
    signal DATA_OUT_OV        : std_logic_vector(7 downto 0);
    signal DATA_IN_OV        : std_logic_vector(7 downto 0);
    signal WR_OV            : std_logic;
    signal RD_OV            : std_logic;
    signal OV5693_ACTIVE_sig: std_logic;
    
    signal q_OV            : std_logic_vector(7 downto 0);
    signal BUFFER8_OV        : std_logic_vector(7 downto 0);
    
    --16 bit RAM state management
    attribute keep : string;
        
    type addr_state_type is (IDLE,FIRST_BYTE,SECOND_BYTE,ADDRESS_VALID);
    signal addr_state_reg, addr_state_next : addr_state_type;
    signal  addr_16_bit_next, addr_16_bit_reg  : std_logic_vector(15 downto 0);
    signal wr_ov_reg, wr_ov_next : std_logic;
    
        --i2c triggerd start of video stream
    signal start_activated_by_i2c_reg,start_activated_by_i2c_next : std_logic;  
    
    signal dbg_addr_16_bit : std_logic_vector(15 downto 0);
    signal dbg_val_in_ov :  std_logic_vector(7 downto 0);
                    
    attribute keep of addr_state_reg : signal is "true";
    attribute keep of addr_16_bit_reg  : signal is "true";
    attribute keep of wr_ov_reg  : signal is "true";
    attribute keep of dbg_addr_16_bit : signal is "true";
    attribute keep of dbg_val_in_ov : signal is "true";
    attribute keep of start_activated_by_i2c_reg : signal is "true";
    attribute keep of OV5693_ACTIVE_sig : signal is "true";    
    attribute keep of DATA_OUT_OV : signal is "true";
    attribute keep of DATA_IN_OV  : signal is "true";

  
begin
	-- PORT MAP --
	I_RAM_EEPROM_E54 : sp256x8_e54
		port map (
			address	=> ADDRESS,
			clock		=> MCLK,
			data		=> DATA_OUT,
			wren		=> WR,
			q			=> q
		);
		
		
	I_RAM_EEPROM_E55 : sp256x8_e55
        port map (
            address    => ADDRESS_E55,
            clock        => MCLK,
            data        => DATA_OUT_E55,
            wren        => WR_E55,
            q            => q_E55
        );	
        
        
	I_RAM_EEPROM_E56 : sp256x8_e56
            port map (
                address    => ADDRESS_E56,
                clock        => MCLK,
                data        => DATA_OUT_E56,
                wren        => WR_E56,
                q            => q_E56
            );        	

	I_RAM_EEPROM_E57 : sp256x8_E57
        port map (
            address    => ADDRESS_E57,
            clock        => MCLK,
            data        => DATA_OUT_E57,
            wren        => WR_E57,
            q            => q_E57
        );
    
		
	I_EEPROM_54 : I2CSLAVE
		generic map (DEVICE => x"54") -- Our EEPROM Address
		port map (
			MCLK		=> MCLK,
			nRST		=> nRST,
			SDA_IN		=> SDA_IN,
			SCL_IN		=> SCL_IN,
			SDA_OUT		=> SDA_OUT,
			SCL_OUT		=> SCL_OUT,
			ADDRESS		=> ADDRESS,
			DATA_OUT	=> DATA_OUT,
			DATA_IN		=> DATA_IN,
			WR			=> WR,
			RD			=> RD,
			DEVICE_ACTIVE => EEPROM_54_ACTIVE_sig
		);
		
		
        I_EEPROM_55 : I2CSLAVE
        generic map (DEVICE => x"55") -- Our EEPROM Address
        port map (
            MCLK        => MCLK,
            nRST        => nRST,
            SDA_IN        => SDA_IN,
            SCL_IN        => SCL_IN,
            SDA_OUT        => SDA_OUT_E55,
            SCL_OUT        => SCL_OUT_E55,
            ADDRESS        => ADDRESS_E55,
            DATA_OUT    => DATA_OUT_E55,
            DATA_IN        => DATA_IN_E55,
            WR            => WR_E55,
            RD            => RD_E55,
            DEVICE_ACTIVE => EEPROM_55_ACTIVE_sig
        );
        
        
        I_EEPROM_56 : I2CSLAVE
        generic map (DEVICE => x"56") -- Our EEPROM Address
        port map (
            MCLK        => MCLK,
            nRST        => nRST,
            SDA_IN        => SDA_IN,
            SCL_IN        => SCL_IN,
            SDA_OUT        => SDA_OUT_E56,
            SCL_OUT        => SCL_OUT_E56,
            ADDRESS        => ADDRESS_E56,
            DATA_OUT    => DATA_OUT_E56,
            DATA_IN        => DATA_IN_E56,
            WR            => WR_E56,
            RD            => RD_E56,
            DEVICE_ACTIVE => EEPROM_56_ACTIVE_sig
        );
        
        
        I_EEPROM_57 : I2CSLAVE
        generic map (DEVICE => x"57") -- Our EEPROM Address
        port map (
            MCLK        => MCLK,
            nRST        => nRST,
            SDA_IN        => SDA_IN,
            SCL_IN        => SCL_IN,
            SDA_OUT        => SDA_OUT_E57,
            SCL_OUT        => SCL_OUT_E57,
            ADDRESS        => ADDRESS_E57,
            DATA_OUT    => DATA_OUT_E57,
            DATA_IN        => DATA_IN_E57,
            WR            => WR_E57,
            RD            => RD_E57,
            DEVICE_ACTIVE => EEPROM_57_ACTIVE_sig
        );
		
	I_OV5693_OTP_REGS : I2CSLAVE
            generic map (DEVICE => x"36")  -- 36 = 6C >> 1
            port map (
                MCLK        => MCLK,
                nRST        => nRST,
                SDA_IN        => SDA_IN,
                SCL_IN        => SCL_IN,
                SDA_OUT        => SDA_OUT_OV,
                SCL_OUT        => SCL_OUT_OV,
                ADDRESS        => ADDRESS_OV,
                DATA_OUT       => DATA_OUT_OV,
                DATA_IN        => DATA_IN_OV,
                WR            => WR_OV,
                RD            => RD_OV,
                DEVICE_ACTIVE  => OV5693_ACTIVE_sig
            );		
	
	B8 : process(MCLK,nRST)
	begin
		if (nRST = '0') then
			BUFFER8 <= (others => '0');
			BUFFER8_E55 <= (others => '0');
			BUFFER8_E56 <= (others => '0');
			BUFFER8_E57 <= (others => '0');
		elsif (MCLK'event and MCLK='1') then
			if (RD = '1') then
				BUFFER8 <= q;
				BUFFER8_E55 <= q_E55;
				BUFFER8_E56 <= q_E56;
				BUFFER8_E57 <= q_E57;				
			end if;
		end if;
	end process B8;
	
	
    
    I_RAM_OV5693 : sp64Kx8
        port map (
            address    => addr_16_bit_reg,
            clock        => MCLK,
            data        => DATA_OUT_OV,
            wren        => wr_ov_reg,
            q            => q_OV
        );    
            
    OV5693_I2C_ARBITER : process(MCLK,addr_state_reg,OV5693_ACTIVE_sig,ADDRESS_OV,DATA_OUT_OV,WR_OV,wr_ov_reg,addr_16_bit_reg,start_activated_by_i2c_reg)
    begin
    
    addr_state_next <= addr_state_reg;
    wr_ov_next <= wr_ov_reg;
    addr_16_bit_next <= addr_16_bit_reg; 
    addr_16_bit_next(7 downto 0) <=  std_logic_vector( unsigned(ADDRESS_OV) - 1 );
    start_activated_by_i2c_next <= start_activated_by_i2c_reg;
        
    -- (IDLE,FIRST_BYTE,SECOND_BYTE,ADDRESS_VALID);
    case addr_state_reg is 
        when IDLE =>       
         wr_ov_next <= '0'; 
         if (OV5693_ACTIVE_sig = '1') then 
            addr_state_next <= FIRST_BYTE;
        end if;
                 
        when FIRST_BYTE =>
            wr_ov_next <= '0'; 
            --addr_16_bit_next(7 downto 0) <=  ADDRESS_OV;
            
            if (WR_OV = '1') then 
                addr_state_next <= SECOND_BYTE;
                addr_16_bit_next(15 downto 8) <=  DATA_OUT_OV;
                --wr_ov_next <= '1'; 
            end if;
            
        when SECOND_BYTE =>  
            --wr_ov_next <= '1'; 
            wr_ov_next <= '0'; 
            addr_state_next <= ADDRESS_VALID;
            
        when ADDRESS_VALID =>  
            wr_ov_next <= WR_OV;    
            if (OV5693_ACTIVE_sig = '0') then 
                addr_state_next <= IDLE;
            end if;
            --treat start signal
            --if (addr_16_bit_reg(15 downto 0) = std_logic_vector( to_unsigned(x"0100")),16 ) then
            if (unsigned(addr_16_bit_reg(15 downto 0)) = x"0100" ) then
            
                if (unsigned(DATA_OUT_OV(7 downto 0)) =  x"00" ) then
                    start_activated_by_i2c_next <= '1';
                elsif (unsigned(DATA_OUT_OV(7 downto 0)) = x"00" ) then
                    start_activated_by_i2c_next <= '0';
                end if;
            end if;
            
    end case; --state_reg

    end process OV5693_I2C_ARBITER;
        

    B8_2 : process(MCLK,nRST)
    begin
        if (nRST = '0') then
            addr_state_reg <= IDLE;             
            addr_16_bit_reg <= (others => '0');
            start_activated_by_i2c_reg <= '0';
            wr_ov_reg <= '0';
            BUFFER8_OV <= (others => '0');
        elsif (MCLK'event and MCLK='1') then
            addr_state_reg <=  addr_state_next;         
            addr_16_bit_reg <= addr_16_bit_next;
            start_activated_by_i2c_reg <= start_activated_by_i2c_next;
            wr_ov_reg <= wr_ov_next; 
            if (RD_OV = '1') then
                BUFFER8_OV <= q_OV;
            end if;
        end if;
    end process B8_2;
    
    DATA_IN <= BUFFER8;    
    DATA_IN_E55 <= BUFFER8_E55;
    DATA_IN_E56 <= BUFFER8_E56;
    DATA_IN_E57 <= BUFFER8_E57;
    DATA_IN_OV <= BUFFER8_OV;
    
	start_activated_by_i2c <= start_activated_by_i2c_reg;
	-- Original, working code. open drain PAD pull up 1.5K needed
--	SCL <= 'Z' when SCL_OUT='1' else '0';
--	SCL_IN <= to_UX01(SCL);
--	SDA <= 'Z' when SDA_OUT='1' else '0';
--	SDA_IN <= to_UX01(SDA);

    EEPROM_ACTIVE <= EEPROM_54_ACTIVE_sig;
	OV_ACTIVE <= OV5693_ACTIVE_sig;
	
--debug signals	
--	addr_state_reg
--    addr_16_bit_reg
--    wr_ov_reg
--    dbg_addr_16_bit
--    dbg_val_in_ov
--    start_activated_by_i2c_reg
--    OV5693_ACTIVE_sig    
--    DATA_OUT_OV
--    DATA_IN_OV
            
    dbg_addr_16_bit <= addr_16_bit_reg;
    dbg_val_in_ov  <= DATA_OUT_OV;


--    SCL_t <= SCL_OUT_OV when OV5693_ACTIVE_sig = '1' else SCL_OUT;
--    SDA_t <= SDA_OUT_OV when OV5693_ACTIVE_sig = '1' else SDA_OUT;

    i2c_mux_scl : process(MCLK)is
    begin
        if (MCLK'event and MCLK='1') then
             if OV5693_ACTIVE_sig = '1' then
                SCL_t <= SCL_OUT_OV;
            elsif EEPROM_54_ACTIVE_sig = '1' then
                SCL_t <= SCL_OUT;
            elsif EEPROM_55_ACTIVE_sig = '1' then
                SCL_t <= SCL_OUT_E55;
            elsif EEPROM_56_ACTIVE_sig = '1' then
                SCL_t <= SCL_OUT_E56;
            else --EEPROM_57_ACTIVE_sig = '1' then
                SCL_t <= SCL_OUT_E57;                                                
            end if;
        end if;   --mclk        
    end process;
    
    i2c_mux_sda : process(MCLK)is
    begin
        if (MCLK'event and MCLK='1') then
             if OV5693_ACTIVE_sig = '1' then
                SDA_t <= SDA_OUT_OV;
            elsif EEPROM_54_ACTIVE_sig = '1' then
                SDA_t <= SDA_OUT;
            elsif EEPROM_55_ACTIVE_sig = '1' then
                SDA_t <= SDA_OUT_E55;
            elsif EEPROM_56_ACTIVE_sig = '1' then
                SDA_t <= SDA_OUT_E56;
            else --EEPROM_57_ACTIVE_sig = '1' then
                SDA_t <= SDA_OUT_E57;                                                
            end if;
        end if;   --mclk        
    end process;

	SCL <= 'Z' when SCL_t='1' else '0';
	SCL_IN <= to_UX01(SCL);
	SDA <= 'Z' when SDA_t='1' else '0';
	SDA_IN <= to_UX01(SDA);

end Behavioral;


