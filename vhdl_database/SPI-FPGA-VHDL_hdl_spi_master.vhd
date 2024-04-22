LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY spi_master IS
  GENERIC(
    data_length : INTEGER := 16);     --data length in bits
  PORT(
    clk     : IN     STD_LOGIC;                             --system clock
    reset_n : IN     STD_LOGIC;                             --asynchronous active low reset
    enable  : IN     STD_LOGIC;                             --initiate communication
	 cpol    : IN     STD_LOGIC;  									--clock polarity mode
    cpha    : IN     STD_LOGIC;  									--clock phase mode
    miso    : IN     STD_LOGIC;                             --master in slave out
    sclk    : OUT    STD_LOGIC;                             --spi clock
    ss_n    : OUT    STD_LOGIC;                             --slave select
    mosi    : OUT    STD_LOGIC;                             --master out slave in
    busy    : OUT    STD_LOGIC;                             --master busy signal
    tx		: IN     STD_LOGIC_VECTOR(data_length-1 DOWNTO 0);  --data to transmit
    rx	   : OUT    STD_LOGIC_VECTOR(data_length-1 DOWNTO 0)); --data received
END spi_master;

ARCHITECTURE behavioural OF spi_master IS
  TYPE FSM IS(init, execute);                           		--state machine
  SIGNAL state       : FSM;                             
  SIGNAL receive_transmit : STD_LOGIC;                      --'1' for tx, '0' for rx 
  SIGNAL clk_toggles : INTEGER RANGE 0 TO data_length*2 + 1;    --clock toggle counter
  SIGNAL last_bit		: INTEGER RANGE 0 TO data_length*2;        --last bit indicator
  SIGNAL rxBuffer    : STD_LOGIC_VECTOR(data_length-1 DOWNTO 0) := (OTHERS => '0'); --receive data buffer
  SIGNAL txBuffer    : STD_LOGIC_VECTOR(data_length-1 DOWNTO 0) := (OTHERS => '0'); --transmit data buffer
  SIGNAL INT_ss_n    : STD_LOGIC;                            --Internal register for ss_n 
  SIGNAL INT_sclk    : STD_LOGIC;                            --Internal register for sclk 


BEGIN
	
  -- wire internal registers to outside	
  ss_n <= INT_ss_n;
  sclk <= INT_sclk;
  
  PROCESS(clk, reset_n)
  BEGIN

    IF(reset_n = '0') THEN        --reset everything
      busy <= '1';                
      INT_ss_n <= '1';            
      mosi <= 'Z';                
      rx <= (OTHERS => '0');      
      state <= init;              

    ELSIF(falling_edge(clk)) THEN
      CASE state IS               

        WHEN init =>					 -- bus is idle
          busy <= '0';             
          INT_ss_n <= '1'; 		  
          mosi <= 'Z';             
   
          IF(enable = '1') THEN       		--initiate communication
            busy <= '1';             
            INT_sclk <= cpol;        		--set spi clock polarity
            receive_transmit <= NOT cpha; --set spi clock phase
            txBuffer <= tx;    				--put data to buffer to transmit
            clk_toggles <= 0;        		--initiate clock toggle counter
            last_bit <= data_length*2 + conv_integer(cpha) - 1; --set last rx data bit
            state <= execute;        
          ELSE
            state <= init;          
          END IF;


        WHEN execute =>
          busy <= '1';               
          INT_ss_n <= '0';           						--pull the slave select signal down
			 receive_transmit <= NOT receive_transmit;   --change receive transmit mode
          
			 -- counter
			 IF(clk_toggles = data_length*2 + 1) THEN
				clk_toggles <= 0;               				--reset counter
          ELSE
				clk_toggles <= clk_toggles + 1; 				--increment counter
          END IF;
            
          -- toggle sclk
          IF(clk_toggles <= data_length*2 AND INT_ss_n = '0') THEN 
            INT_sclk <= NOT INT_sclk; --toggle spi clock
          END IF;
            
          --receive miso bit
          IF(receive_transmit = '0' AND clk_toggles < last_bit + 1 AND INT_ss_n = '0') THEN 
            rxBuffer <= rxBuffer(data_length-2 DOWNTO 0) & miso; 
          END IF;
            
          --transmit mosi bit
          IF(receive_transmit = '1' AND clk_toggles < last_bit) THEN 
            mosi <= txBuffer(data_length-1);                    
            txBuffer <= txBuffer(data_length-2 DOWNTO 0) & '0'; 
          END IF;
            
          -- Finish/ resume the communication
          IF(clk_toggles = data_length*2 + 1) THEN   
            busy <= '0';             
            INT_ss_n <= '1';         
            mosi <= 'Z';             
            rx <= rxBuffer;    
            state <= init;          
          ELSE                       
            state <= execute;        
          END IF;
      END CASE;
    END IF;
  END PROCESS; 
END behavioural;
