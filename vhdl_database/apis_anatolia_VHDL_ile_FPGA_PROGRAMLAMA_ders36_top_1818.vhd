library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- DATA PROCOL:
-- COMMAND SENT BY PC TO TOP MODULE:
-- [START_BYTE1] | [START_BYTE2] | [CMND] | [ADDR] | [DATA] | [CHECKSUM]

-- RESPONSE SENT BY TOP MODULE TO PC:
-- [START_BYTE1] | [START_BYTE2] | [CMND] | [ADDR] | [DATA] | [CHECKSUM]


entity top is
    generic
    (
        C_CLKFREQ       : integer := 100_000_000;   --hz
        C_BAUDRATE      : integer := 115_200;       --bps
        START_BYTE1     : integer := 171; -- 0xAB         
        START_BYTE2     : integer := 205; -- 0xCD;
        CMND_WR         : integer :=  17; -- 0x11;
        CMND_RD         : integer :=  34; -- 0x22;
        RESP_WR_DONE    : integer :=  51; -- 0x33;
        RESP_RD_DONE    : integer :=  68; -- 0x44;
        RESP_CSE        : integer := 238; -- 0xEE;
        ADDR_LEN        : integer := 1; --bytes
        DATA_LEN        : integer := 1  --bytes

    );
    Port
    (
        CLK : in STD_LOGIC;
        RX_I : in STD_LOGIC;
        TX_O : out STD_LOGIC
    );
end top;

architecture Behavioral of top is

    --ic veri turu tanimlamalari
    type std_lv8_array is array ( natural range <>) of std_logic_vector( 7 downto 0 );

    type states is (
        S_IDLE,
        S_START_1,
        S_RD_CMND,
        S_RD_CMND_ADDR,
        S_RD_CMND_DATA,
        S_RD_CMND_CS,
        S_CHECK_CMND_CS,
        S_WR_BRAM,
        S_RD_BRAM,
        S_SND_RESP
        );
    

    --sabit tanimlari
    constant C_BUFFLEN  : integer := ( 1 + ADDR_LEN + DATA_LEN + 1); -- 2 start byte'i islevi olmadigi icin buffer'da bulunmayacak
    constant C_BITTIMERLIM  : integer := C_CLKFREQ/C_BAUDRATE;
    constant C_TIMEOUTLIM  : integer := C_BITTIMERLIM*12;
    constant CBUFF  : std_lv8_array( 0 to ( C_BUFFLEN - 1 ) ) := (others => (others => '0'));


    --ic sinyal tanimlamalari
    --- UART Bufferlari
    signal cmnd_buff   : std_lv8_array(0 to ( C_BUFFLEN - 1 ) ) := CBUFF;
    signal resp_buff   : std_lv8_array(0 to ( C_BUFFLEN - 1 ) ) := CBUFF;

    --- UART RX modulu sinyalleri
    signal urx_dout    : std_logic_vector (7 downto 0) := (others => '0');
    signal urx_done    : std_logic := '0';
    
    --- UART TX modulu sinyalleri
    signal utx_din     : std_logic_vector (7 downto 0) := (others => '0');
    signal utx_done    : std_logic := '0';
    signal utx_trig    : std_logic := '0';

    --- BRAM modulu sinyalleri
    signal bram_wea   : std_logic := '0';
    signal bram_wea_d : std_logic := '0';
    signal bram_addra : std_logic_vector( ( ( 8 * ADDR_LEN ) - 1 ) downto 0 ) := (others => '0');
    signal bram_dina  : std_logic_vector( ( ( 8 * DATA_LEN ) - 1 ) downto 0 ) := (others => '0');
    signal bram_douta : std_logic_vector( ( ( 8 * DATA_LEN ) - 1 ) downto 0 ) := (others => '0');
    signal bram_douta_arr : std_lv8_array( 0 to ( DATA_LEN - 1 ) ) := (others => ( others => '0' ) ); 
    --- modul ici sinyaller
    signal state : states    := S_IDLE;
    signal timeout_timer     : integer range 0 to C_TIMEOUTLIM                   := 0;
    --signal addr_idx          : integer range 0 to ADDR_LEN                       := 0;
    signal addr_idx          : integer                        := 0;
    --signal data_idx          : integer range 0 to DATA_LEN                       := 0;
    signal data_idx          : integer                        := 0;
    --signal rsp_idx           : integer range 0 to C_BUFFLEN                      := 0;
    signal rsp_idx           : integer                        := 0;
    signal utx_inprogress    : std_logic                                         := '0';

    signal sumOfTXBuf_lv   : std_logic_vector( ( 7+2 + C_BUFFLEN ) downto 0 )     := (others => '0');
    signal sumOfRXBuf_lv   : std_logic_vector( ( 7+2 + C_BUFFLEN ) downto 0 )     := (others => '0');
    
    signal csOfRXBuf         : std_logic_vector (7 downto 0)                     := (others => '0');
    signal csOfTXBuf         : std_logic_vector (7 downto 0)                     := (others => '0');

    --Component tanimlamalari
    component uart_rx is
        generic (
            C_CLKFREQ       : integer;
            C_BAUDRATE      : integer
        );
        Port
        (
            CLK             : in STD_LOGIC;
            RX_I            : in STD_LOGIC;
            DATA_O          : out STD_LOGIC_VECTOR (7 downto 0);
            RX_DONE_TICK_O  : out std_logic
        );
    end component uart_rx;

    component uart_tx is
        generic (
            C_CLKFREQ       : integer ;
            C_BAUDRATE      : integer ;
            C_STOPBIT       : integer
        );
        Port
        (
            CLK : in STD_LOGIC;
            DATA_I : in STD_LOGIC_VECTOR (7 downto 0);
            TX_START_I      : in std_logic;
            TX_O : out STD_LOGIC;
            TX_DONE_TICK_O  : out std_logic
        );
    end Component uart_tx;

    component block_ram is
    generic (
        RAM_WIDTH       : integer;
        RAM_DEPTH       : integer;
        RAM_PERFORMANCE : string; 
        C_RAM_TYPE      : string    := "block"
        );
    
    port (
        -- Address bus, width determined from RAM_DEPTH
        ADDRA : in std_logic_vector( ( ( 8 * ADDR_LEN ) - 1 ) downto 0);
        -- RAM input data
        DINA  : in std_logic_vector( ( ( 8 * DATA_LEN ) - 1 ) downto 0);
        -- Clock
        CLKA  : in std_logic;
        -- Write enable
        WEA   : in std_logic;
        -- RAM output data
        DOUTA : out std_logic_vector( ( ( 8 * DATA_LEN ) - 1 ) downto 0)
        );
    end Component block_ram;
begin

    --combinational part
    csOfRXBuf <= sumOfRXBuf_lv( 7 downto 0 );
    csOfTXBuf <= sumOfTXBuf_lv( 7 downto 0 );


    bram_dataconcater : for byteIdx in 0 to (DATA_LEN -1  ) generate
        bram_dina( (( 8 * ( 1 + byteIdx ) ) - 1 ) downto ( 8 * byteIdx ) )  <= cmnd_buff( byteIdx + ADDR_LEN + 1 );
    end generate bram_dataconcater;

    bram_addrconcater : for byteIdx in 0 to (ADDR_LEN -1  ) generate
        bram_addra( (( 8 * ( 1 + byteIdx ) ) - 1 ) downto ( 8 * byteIdx ) )  <= cmnd_buff( byteIdx + 1 );
    end generate bram_addrconcater;

    bram_datasplitter : for byteIdx in 0 to (DATA_LEN -1  ) generate
        bram_douta_arr( byteIdx )  <= bram_douta( ( ( 8 * ( 1 + byteIdx ) ) - 1 ) downto ( 8 * byteIdx ) ) ;
    end generate bram_datasplitter;


    --main process
    P_MAIN : process ( CLK )
        variable sumOfTXBuf     : unsigned( ( 7+2 + C_BUFFLEN ) downto 0 )     := ( others => ('0'));
        variable sumOfRXBuf     : unsigned( ( 7+2 + C_BUFFLEN ) downto 0 )     := ( others => ('0'));
    begin
        if ( rising_edge( CLK ) ) then

            bram_wea_d  <=  bram_wea;

            case state is
            
                --XXX
                when S_IDLE =>
                    timeout_timer  <= 0;
                    -- burada mumkun olan tum sinyaller restte duracak.
                    utx_trig        <=  '0';
                    utx_din         <=  (others => '0');
                    cmnd_buff       <=  CBUFF;
                    resp_buff       <=  CBUFF;
                    addr_idx        <=  0;
                    data_idx        <=  0;
                    rsp_idx         <=  0;
                    bram_wea        <=  '0';
                    utx_inprogress  <= '0';
                    rsp_idx         <= 0;
                    if (
                        urx_done = '1' and
                        urx_dout =  std_logic_vector( to_unsigned( START_BYTE1 , 8 ) )
                    ) then
                        state   <= S_START_1;
                    end if;
                
                --XXX
                when S_START_1 =>

                    if (
                        urx_done = '1' and
                        urx_dout = std_logic_vector( to_unsigned( START_BYTE2 , 8 ) )
                    ) then

                        state   <= S_RD_CMND;
                        timeout_timer  <= 0;

                    else
                        if ( timeout_timer = C_TIMEOUTLIM - 1 ) then

                            -- 12 bit gelene kadar komut beklendi komut gelmedi
                            -- sistem timeout oldu. IDLE a donuluyor
                            state   <= S_IDLE;
                            timeout_timer  <= 0;
                        else
                            timeout_timer <= timeout_timer + 1 ;
                        end if;
                    end if;
                
                --XXX
                when S_RD_CMND =>

                    if ( urx_done = '1' ) then

                        state              <= S_RD_CMND_ADDR;
                        addr_idx           <= 0;
                        timeout_timer      <= 0;
                        cmnd_buff( 0 )     <=  urx_dout;

                    else
                        if ( timeout_timer = C_TIMEOUTLIM - 1 ) then

                            -- 12 bit gelene kadar komut beklendi komut gelmedi
                            -- sistem timeout oldu. IDLE a donuluyor
                            state   <= S_IDLE;
                            timeout_timer  <= 0;
                        else
                            timeout_timer <= timeout_timer + 1 ;
                        end if;
                    end if;
                
                --XXX
                when S_RD_CMND_ADDR =>

                    if ( urx_done = '1' ) then

                        timeout_timer                 <= 0;
                        cmnd_buff( addr_idx + 1 )     <=  urx_dout;

                        if ( addr_idx = ( ADDR_LEN - 1 ) ) then
                            state                     <= S_RD_CMND_DATA;
                            addr_idx                  <= 0;
                            data_idx                  <= 0;

                        else
                            addr_idx                  <= addr_idx + 1;
                        end if;
                    else
                        if ( timeout_timer = C_TIMEOUTLIM - 1 ) then

                            -- 12 bit gelene kadar komut beklendi komut gelmedi
                            -- sistem timeout oldu. IDLE a donuluyor
                            state   <= S_IDLE;
                            timeout_timer  <= 0;
                        else
                            timeout_timer <= timeout_timer + 1 ;
                        end if;
                    end if;
            
                --XXX
                when S_RD_CMND_DATA =>

                    if ( urx_done = '1' ) then

                        timeout_timer                           <= 0;
                        cmnd_buff( data_idx + ADDR_LEN + 1 )    <=  urx_dout;

                        if ( data_idx = ( ADDR_LEN - 1 ) ) then
                            state                     <= S_RD_CMND_CS;
                            data_idx                  <= 0;

                        else
                            data_idx                  <= data_idx + 1;
                        end if;
                    else
                        if ( timeout_timer = C_TIMEOUTLIM - 1 ) then

                            -- 12 bit gelene kadar komut beklendi komut gelmedi
                            -- sistem timeout oldu. IDLE a donuluyor
                            state   <= S_IDLE;
                            timeout_timer  <= 0;
                        else
                            timeout_timer <= timeout_timer + 1 ;
                        end if;
                    end if;
                
                --XXX
                when S_RD_CMND_CS =>

                    if ( urx_done = '1' ) then

                        state   <= S_CHECK_CMND_CS;
                        timeout_timer                            <= 0;
                        cmnd_buff( 1 + ADDR_LEN + DATA_LEN )     <=  urx_dout;

                    else
                        if ( timeout_timer = C_TIMEOUTLIM - 1 ) then

                            -- 12 bit gelene kadar komut beklendi komut gelmedi
                            -- sistem timeout oldu. IDLE a donuluyor
                            state              <= S_IDLE;
                            timeout_timer      <= 0;
                        else
                            timeout_timer      <= timeout_timer + 1 ;
                        end if;
                    end if;
                
                --XXX
                when S_CHECK_CMND_CS =>

                    if ( cmnd_buff( 1 + ADDR_LEN + DATA_LEN ) = csOfRXBuf ) then

                        -- yazma komutu gelmisse yazma sate ine git
                        if ( cmnd_buff( 0 ) =  std_logic_vector( to_unsigned( CMND_WR, 8 ) ) ) then
                            state       <= S_WR_BRAM;
                            bram_wea    <= '0';

                        -- tanimsiz komut gelmisse de belirlenen adrese okuma yap
                        else
                        --elsif ( cmnd_buff( 1 ) =  std_logic_vector( to_unsigned( CMND_RD, 8 ) ) ) then
                            state  <= S_RD_BRAM;
                        end if;

                    else
                        --checksum error
                        resp_buff( 0 )  <= std_logic_vector( to_unsigned( RESP_CSE, 8 ) ) ;

                        loop1 : for addloop in 0 to ( ADDR_LEN - 1 ) loop
                            resp_buff( 1 + addloop )  <= x"00" ;
                        end loop loop1;

                        loop2 : for dataloop in 0 to (DATA_LEN - 1 ) loop
                            resp_buff( 1 + ADDR_LEN + dataloop )  <= x"00" ;
                        end loop loop2;

                        state              <= S_SND_RESP;
                        utx_inprogress     <= '0';
                        rsp_idx            <= 0;
                    end if;

                --XXX
                when S_WR_BRAM => 
                    if ( bram_wea   ='0' and bram_wea_d ='0' ) then
                        bram_wea  <= '1';
                        --state e ilk giris
                    elsif ( bram_wea   ='1' and bram_wea_d ='0' ) then
                        --state e ikinci giris
                    elsif ( bram_wea   ='1' and bram_wea_d ='1' ) then
                        bram_wea  <= '0';
                        resp_buff( 0 )  <= std_logic_vector( to_unsigned( RESP_WR_DONE , 8 ) );

                        responsewriter : for byteIdx in 0 to ( ADDR_LEN + DATA_LEN - 1 ) loop
                            resp_buff( 1 + byteIdx )  <= cmnd_buff( 1 + byteIdx );
                        end loop responsewriter;

                        state  <= S_SND_RESP;

                    end if;
                --XXX
                when S_RD_BRAM =>
                    resp_buff( 0 )  <= std_logic_vector( to_unsigned( RESP_RD_DONE , 8 ) );

                    responseAddrwriter : for byteIdx in 0 to ( ADDR_LEN - 1 ) loop
                        resp_buff( 1 + byteIdx )  <= cmnd_buff( 1 + byteIdx );
                    end loop responseAddrwriter;

                    responseDatawriter : for byteIdx in 0 to ( DATA_LEN - 1 ) loop
                        resp_buff( 1 + ADDR_LEN + byteIdx )  <= bram_douta_arr( byteIdx );
                    end loop responseDatawriter;

                    state  <= S_SND_RESP;
                --XXX
                when S_SND_RESP =>

                    if ( utx_done ='1' ) then
                        utx_inprogress  <= '0';
                    end if;

                    if ( utx_inprogress = '0') then
                        if ( rsp_idx < ( C_BUFFLEN +2 ) ) then
                            utx_inprogress  <= '1';
                            utx_trig  <= '1';
                            rsp_idx  <=  rsp_idx + 1;

                            if ( rsp_idx = 0 ) then
                                utx_din   <= std_logic_vector( to_unsigned( START_BYTE1, 8 ) );

                            elsif ( rsp_idx = 1 ) then
                                utx_din   <= std_logic_vector( to_unsigned( START_BYTE2, 8 ) );

                            elsif ( rsp_idx = ( C_BUFFLEN +1 ) ) then
                                utx_din   <=  csOfTXBuf;
                            else
                                utx_din   <= resp_buff ( rsp_idx - 2 );
                            end if;

                        else
                            --gonderim tamamlandi.
                            state  <=  S_IDLE;
                        end if;
                    else
                        utx_trig  <= '0';
                    end if;

            end case;

            -- Checksum calculation FOR RX buffer
            rxbuffCSCalculate : for rxbuffidx in 0 to ( C_BUFFLEN - 2 ) loop
                if (rxbuffidx = 0) then
                    sumOfRXBuf  :=  to_unsigned( START_BYTE1, sumOfRXBuf'length ) +
                        to_unsigned( START_BYTE2, sumOfRXBuf'length ) +
                        resize( unsigned( cmnd_buff( 0 ) ), sumOfRXBuf'length );
                else
                    sumOfRXBuf  := sumOfRXBuf + resize( unsigned( cmnd_buff( rxbuffidx ) ), sumOfRXBuf'length ) ;
                end if;
            end loop rxbuffCSCalculate;
            sumOfRXBuf_lv  <= std_logic_vector( sumOfRXBuf );

            -- Checksum calculation FOR RX buffer
            txbuffCSCalculate : for txbuffidx in 0 to ( C_BUFFLEN - 1 ) loop
                if (txbuffidx = 0) then
                    sumOfTXBuf  :=  to_unsigned( START_BYTE1, sumOfTXBuf'length ) +
                        to_unsigned( START_BYTE2, sumOfTXBuf'length ) +
                        resize( unsigned( resp_buff( 0 ) ), sumOfTXBuf'length ) ;
                else
                    sumOfTXBuf  := sumOfTXBuf + resize( unsigned( resp_buff( txbuffidx ) ), sumOfTXBuf'length ) ;
                end if;
            end loop txbuffCSCalculate;
            sumOfTXBuf_lv  <= std_logic_vector( sumOfTXBuf );

        end if;
    end process;

    --Component Instances
    uart_rx_ins : uart_rx
        generic map
        (
            C_CLKFREQ       => C_CLKFREQ,
            C_BAUDRATE      => C_BAUDRATE
        )
        port map
        (
            CLK             => CLK                ,
            RX_I            => RX_I               ,
            DATA_O          => urx_dout           ,
            RX_DONE_TICK_O  => urx_done
        );

    uart_tx_ins : uart_tx
        generic map
        (
            C_CLKFREQ       => C_CLKFREQ,
            C_BAUDRATE      => C_BAUDRATE,
            C_STOPBIT       => 1
        )
        Port map
        (
            CLK             => CLK,
            DATA_I          => utx_din,
            TX_START_I      => utx_trig,
            TX_O            => TX_O,
            TX_DONE_TICK_O  => utx_done
        );

    bram_ins : block_ram
        generic map(
            RAM_WIDTH       => (8*DATA_LEN)        ,
            RAM_DEPTH       => (256**ADDR_LEN)     ,
            RAM_PERFORMANCE => "LOW_LATENCY"       ,
            C_RAM_TYPE      => "block"       
            )
        port map(
            ADDRA => bram_addra    ,
            DINA  => bram_dina     ,
            CLKA  => CLK           ,
            WEA   => bram_wea      ,
            DOUTA => bram_douta
            );

end Behavioral;
