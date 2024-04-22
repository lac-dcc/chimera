LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--this is comment
ENTITY spi_slave IS
  GENERIC(
    data_length : INTEGER := 16);     --data length in bits
  PORT(
    reset_n      : IN     STD_LOGIC;  																	 --asynchronous active low reset
	 cpol    	  : IN 	  STD_LOGIC;  																	 --clock polarity mode
    cpha    	  : IN 	  STD_LOGIC;  																	 --clock phase mode
    sclk         : IN     STD_LOGIC;  																	 --spi clk
	 ss_n         : IN     STD_LOGIC;  																	 --slave select
    mosi         : IN     STD_LOGIC;  																	 --master out slave in
    miso         : OUT    STD_LOGIC;  																	 --master in slave out
	 rx_enable    : IN     STD_LOGIC;  																	 --enable signal to wire rxBuffer to outside 
    tx			  : IN     STD_LOGIC_VECTOR(data_length-1 DOWNTO 0);  						 --data to transmit
    rx		     : OUT    STD_LOGIC_VECTOR(data_length-1 DOWNTO 0) := (OTHERS => '0');  --data received
    busy         : OUT    STD_LOGIC := '0');  														 --slave busy signal	 
END spi_slave;

ARCHITECTURE behavioural OF spi_slave IS
  SIGNAL mode    : STD_LOGIC;  																	  --according to CPOL and CPHA
  SIGNAL clk     : STD_LOGIC;  
  SIGNAL bit_counter : STD_LOGIC_VECTOR(data_length DOWNTO 0); 						  --active bit indicator
  SIGNAL rxBuffer  : STD_LOGIC_VECTOR(data_length-1 DOWNTO 0) := (OTHERS => '0');  --receiver buffer
  SIGNAL txBuffer  : STD_LOGIC_VECTOR(data_length-1 DOWNTO 0) := (OTHERS => '0');  --transmit buffer
BEGIN
  busy <= NOT ss_n;  
  
  mode <= cpol XOR cpha;  

  PROCESS (mode, ss_n, sclk)
  BEGIN
  IF(ss_n = '1') then
     clk <= '0';
  ELSE
     IF (mode = '1') then
	     clk <= sclk;
	  ELSE
	     clk <= NOT sclk;
	  END IF;
  END IF;
  END PROCESS;

  --where is the active bit
  PROCESS(ss_n, clk)
  BEGIN
    IF(ss_n = '1' OR reset_n = '0') THEN                         
	   bit_counter <= (conv_integer(NOT cpha) => '1', OTHERS => '0'); --reset active bit indicator
    ELSE                                                         
      IF(rising_edge(clk)) THEN                                  
        bit_counter <= bit_counter(data_length-1 DOWNTO 0) & '0';    --left shift active bit indicator
      END IF;
    END IF;
  END PROCESS;


  PROCESS(ss_n, clk, rx_enable, reset_n)
  BEGIN      
  
	 --receive mosi bit
    IF(cpha = '0') then
		 IF(reset_n = '0') THEN			--reset the buffer
			rxBuffer <= (OTHERS => '0');
		 ELSIF(bit_counter /= "00000000000000010" and falling_edge(clk)) THEN
			rxBuffer(data_length-1 DOWNTO 0) <= rxBuffer(data_length-2 DOWNTO 0) & mosi;  --shift in the received bit
		 END IF;
	 ELSE
		 IF(reset_n = '0') THEN       --reset the buffer
			rxBuffer <= (OTHERS => '0');
		 ELSIF(bit_counter /= "00000000000000001" and falling_edge(clk)) THEN
			rxBuffer(data_length-1 DOWNTO 0) <= rxBuffer(data_length-2 DOWNTO 0) & mosi;  --shift in the received bit
		 END IF;
	 END IF;

    --if user wants the received data output it
    IF(reset_n = '0') THEN
      rx <= (OTHERS => '0');
    ELSIF(ss_n = '1' AND rx_enable = '1') THEN  
      rx <= rxBuffer;
    END IF;

    --transmit registers
    IF(reset_n = '0') THEN
      txBuffer <= (OTHERS => '0');
    ELSIF(ss_n = '1') THEN  
      txBuffer <= tx;
    ELSIF(bit_counter(data_length) = '0' AND rising_edge(clk)) THEN
      txBuffer(data_length-1 DOWNTO 0) <= txBuffer(data_length-2 DOWNTO 0) & txBuffer(data_length-1);  --shift through tx data
    END IF;

    --transmit miso bit
    IF(ss_n = '1' OR reset_n = '0') THEN           
      miso <= 'Z';
    ELSIF(rising_edge(clk)) THEN
      miso <= txBuffer(data_length-1);               
    END IF;
    
  END PROCESS;
END behavioural;
