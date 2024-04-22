

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.Common.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


--Sends entire video line to the serializer
-- *Assigns entire virtual channel to entire line
-- *Generates packet header
---*generates ECC for packet footer
---buffers first 4 bytes of data

entity gen_hs_lanes_stream is generic (    
    N_MIPI_LANES : integer := 2; --number of MIPI CSI lanes currently only 2 or 4 implemented
    N_TRAIL_BAITS : integer := 16;--16 works up to 400 mhz; --number of tails baits after HS payload sending complete. 2^Maximum HS_TRAIL_COUNTER_WIDTH - 1
    HS_TRAIL_COUNTER_WIDTH : integer := 6 --trail counter width
    );
Port(clk : in std_logic; --data in/out clock HS clock, ~100 MHZ
     rst : in  std_logic;
     is_short_packet : in std_logic; -- if high, no data sent, only short packet, Frame Start, Frame End etc. 
     --length of the valid payload, bytes: 8 bit example 320*240*8bit/8 =  76,800; 10 bit example: 320*240*10bit/8 =  96,000;
     word_cound : in std_logic_vector(15 downto 0); --data length for long packet MUST be devideble by 4, frame number or line number for short packet 
     vc_num : in std_logic_vector(1 downto 0); --virtual channel number  
     data_type : in packet_type_t; --data type - YUV,RGB,RAW etc
     
     --video_data_in one byte of video payload, if 10 bit format, 10->8 bit arbitrage is done outside, but word count should represent corect number
     --valid length of payload. 8 bit example 320*240*8bit/8 =  76,800; 10 bit example: 320*240*10bit/8 =  96,000;
     video_data_in : in std_logic_vector(N_MIPI_LANES*8 -1  downto 0); 
     start_hs_transmit : in std_logic; --trigger to start transmission,one clock cycle enough- word_cound,vc_num,video_data_in should be valid.
     csi_hs_data_1_out : out  std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
     csi_hs_data_2_out : out  std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
     csi_hs_data_3_out : out  std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
     csi_hs_data_4_out : out  std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
     hs_data_out_valid : out std_logic; --goes high when csi_hs_data_out is valid       
     ready_for_hs_data_in_next_cycle : out std_logic --goest high one clock cycle before ready to get data
     );
end gen_hs_lanes_stream;

architecture Behavioral of gen_hs_lanes_stream is


type state_type is (idle,send_first_and_second_bytes,send_third_and_forth_bytes,
                   send_first_four_bytes,transmission_loop_two_lane,transmission_loop_four_lanes,send_src,
                   hs_trail_short_packet,hs_trail_long_packet,hs_trail_loop);
signal state_reg, state_next : state_type := idle;
signal hs_data_out_valid_reg,hs_data_out_valid_next : STD_LOGIC := '0';
signal data_in_reg,data_in_next : std_logic_vector(N_MIPI_LANES*8 - 1 downto 0) := (others  => '0');
signal data_out_1_reg,data_out_1_next : std_logic_vector(7 downto 0) := (others  => '0');
signal data_out_2_reg,data_out_2_next : std_logic_vector(7 downto 0) := (others  => '0');
signal data_out_3_reg,data_out_3_next : std_logic_vector(7 downto 0) := (others  => '0');
signal data_out_4_reg,data_out_4_next : std_logic_vector(7 downto 0) := (others  => '0');
signal packet_header : std_logic_vector(31 downto 0) := (others  => '0'); --long packet header
signal word_count_reg,word_count_next : std_logic_vector(15 downto 0); --data counters
signal crc_reg,crc_next:  std_logic_vector(15 downto 0) := x"FFFF";

signal trail_counter_val_reg,trail_counter_val_next :  unsigned (HS_TRAIL_COUNTER_WIDTH downto 0);

signal dummy_test_short_packed : std_logic_vector(31 downto 0) := x"B8B8B8B8";--x"DEADBEAF";


begin

--FSMD state & data registers
FSMD_state : process(clk,rst)
begin
        if (rst = '1') then 
            state_reg <= idle;
            hs_data_out_valid_reg <= '0';
            data_in_reg <= (others => '0');
            data_out_1_reg <= (others => '0');
            data_out_2_reg <= (others => '0');
            data_out_3_reg <= (others => '0');
            data_out_4_reg <= (others => '0');
            word_count_reg <= (others => '0');
            trail_counter_val_reg <= (others => '0');
            crc_reg  <= x"FFFF";            
            
        elsif (clk'event and clk = '1') then         
            hs_data_out_valid_reg <= hs_data_out_valid_next;
            data_in_reg <= data_in_next;
            state_reg <= state_next;          
            data_out_1_reg <= data_out_1_next;
            data_out_2_reg <= data_out_2_next;
            data_out_3_reg <= data_out_3_next;
            data_out_4_reg <= data_out_4_next;
            word_count_reg <= word_count_next;
            trail_counter_val_reg <= trail_counter_val_next;
            crc_reg <= crc_next;
            
        end if;
                        
end process; --FSMD_state

hs_data_out_valid <= hs_data_out_valid_reg;
csi_hs_data_1_out       <= data_out_1_reg;
csi_hs_data_2_out       <= data_out_2_reg;
csi_hs_data_3_out       <= data_out_3_reg;
csi_hs_data_4_out       <= data_out_4_reg;
packet_header <= get_short_packet(vc_num,data_type,word_cound); --production
--packet_header <= dummy_test_short_packed; --test

--line output state machine
LINE_OUT_FSMD : process(state_reg,data_in_reg,hs_data_out_valid_reg,start_hs_transmit,video_data_in,
                                data_out_1_reg,data_out_2_reg,data_out_3_reg,data_out_4_reg,
                                packet_header,word_count_reg,crc_reg,word_cound,is_short_packet,
                                trail_counter_val_reg)
begin

    state_next   <= state_reg;
    data_in_next <= data_in_reg;    
    data_out_1_next    <=  data_out_1_reg;
    data_out_2_next    <=  data_out_2_reg;
    data_out_3_next    <=  data_out_3_reg;
    data_out_4_next    <=  data_out_4_reg;
    trail_counter_val_next <=  trail_counter_val_reg;
    word_count_next  <=  word_count_reg;
    crc_next <= crc_reg;
    ready_for_hs_data_in_next_cycle <= '0'; --default
    hs_data_out_valid_next <= hs_data_out_valid_reg;
     --idle,send_first_and_second_bytes,send_third_and_forth_bytes,transmission_loop,send_src
    case state_reg is 
    
        when idle =>
           hs_data_out_valid_next <= '0'; --no valid by default
           word_count_next <= (others => '0');
           data_out_1_next <= (others => '0');
           data_out_2_next <= (others => '0');
           
           crc_next  <= x"FFFF";
           
            if (start_hs_transmit = '1') then
                hs_data_out_valid_next <= '1';
                
                if (N_MIPI_LANES = 2) then
                    data_out_1_next <= Sync_Sequence; --Syncronization byte of packet header,  start of transmission, lane 1
                    data_out_2_next <= Sync_Sequence; --Syncronization byte of packet header,  start of transmission, lane 2
                    state_next <= send_first_and_second_bytes;
                 elsif (N_MIPI_LANES = 4) then
                     data_out_1_next <= Sync_Sequence; --Syncronization byte of packet header,  start of transmission, lane 1
                     data_out_2_next <= Sync_Sequence; --Syncronization byte of packet header,  start of transmission, lane 2
                     data_out_3_next <= Sync_Sequence; --Syncronization byte of packet header,  start of transmission, lane 3
                     data_out_4_next <= Sync_Sequence; --Syncronization byte of packet header,  start of transmission, lane 4

                     if (is_short_packet = '0') then
                     --long packet
                         ready_for_hs_data_in_next_cycle  <= '1';
                     end if; --is_short_packet                     
                     state_next <= send_first_four_bytes;                 
                 end if;
                                                                      
            end if;--start_hs_transmit
            
            
        when send_first_and_second_bytes =>
            data_out_1_next <= packet_header(7 downto 0); --first byte of packet header
            data_out_2_next <= packet_header(15 downto 8); --second byte of packet header
            
            if (is_short_packet = '0') then
            --long packet
                ready_for_hs_data_in_next_cycle  <= '1';
            end if; --is_short_packet
            
            state_next <= send_third_and_forth_bytes;
                     
        when send_third_and_forth_bytes =>

            data_out_1_next <= packet_header(23 downto 16); --third byte of packet header
            data_out_2_next <= packet_header(31 downto 24); --forth byte of packet header

            if (is_short_packet = '0') then  
                --long packet
                data_in_next <= video_data_in;
                --Seems not correct
                --crc_next <= nextCRC16_D8(video_data_in(7  downto 0),crc_reg);
                --crc_next <= nextCRC16_D8(video_data_in(15 downto 8),crc_next);                
                crc_next <= nextCRC16_D8(video_data_in(15 downto 8),nextCRC16_D8(video_data_in(7  downto 0),crc_reg)); --lets try this one
                
                word_count_next <= x"0002"; --reduces 100 MHz speed on Artix 7
                state_next <= transmission_loop_two_lane;                        
            else --short packet
                state_next <= hs_trail_short_packet;                        
            end if; --short/long packet
            
        when send_first_four_bytes =>      
            if (N_MIPI_LANES = 4) then
                data_out_1_next <= packet_header(7 downto 0); --first byte of packet header
                data_out_2_next <= packet_header(15 downto 8); --second byte of packet header   
                data_out_3_next <= packet_header(23 downto 16); --third byte of packet header
                data_out_4_next <= packet_header(31 downto 24); --forth byte of packet header
                if (is_short_packet = '0') then  
                    --long packet
                    data_in_next <= video_data_in;
                    --Seems not correct
                    --crc_next <= nextCRC16_D8(video_data_in(7  downto 0),crc_reg);
                    --crc_next <= nextCRC16_D8(video_data_in(15 downto 8),crc_next);
                    --crc_next <= nextCRC16_D8(video_data_in(23 downto 16),crc_next);
                    --crc_next <= nextCRC16_D8(video_data_in(31 downto 24),crc_next);
                    --lets try this one
                    crc_next <= nextCRC16_D8(video_data_in(31 downto 24),nextCRC16_D8(video_data_in(23 downto 16),nextCRC16_D8(video_data_in(15 downto 8),nextCRC16_D8(video_data_in(7  downto 0),crc_reg))));
                    
                    
                    word_count_next <= x"0004"; --reduces 100 MHz speed on Artix 7
                    state_next <= transmission_loop_four_lanes;        
                else --short packet
                    state_next <= hs_trail_short_packet;                        
                end if; --short/long packet
             end if; --N_MIPI_LANES = 4
            
        when transmission_loop_four_lanes =>
        if (N_MIPI_LANES = 4) then        
                    data_in_next <= video_data_in;
                    data_out_1_next <= data_in_reg(7  downto 0);
                    data_out_2_next <= data_in_reg(15 downto 8);
                    data_out_3_next <= data_in_reg(23 downto 16);
                    data_out_4_next <= data_in_reg(31 downto 24);
                    --Seems not correct
                    --crc_next <= nextCRC16_D8(video_data_in(7  downto 0),crc_reg);
                    --crc_next <= nextCRC16_D8(video_data_in(15 downto 8),crc_next);
                    --crc_next <= nextCRC16_D8(video_data_in(23 downto 16),crc_next);
                    --crc_next <= nextCRC16_D8(video_data_in(31 downto 24),crc_next);
                     --lets try this one
                    crc_next <= nextCRC16_D8(video_data_in(31 downto 24),nextCRC16_D8(video_data_in(23 downto 16),nextCRC16_D8(video_data_in(15 downto 8),nextCRC16_D8(video_data_in(7  downto 0),crc_reg))));
                   
                    
                    word_count_next <= std_logic_vector( unsigned(word_count_reg) + 4 ); --reduces 100 MHz speed on Artix 7
                    --Treat the cases of short and long packets
                    if (word_count_reg = std_logic_vector( unsigned(word_cound))) then --finish of transmission
                       crc_next <= crc_reg; --no more CRC calc. needed
                        state_next <= send_src;   
                        
                     end if;
        end if; --N_MIPI_LANES = 4             
                                        
        when transmission_loop_two_lane =>
            data_in_next <= video_data_in;
            data_out_1_next <= data_in_reg(7  downto 0);
            data_out_2_next <= data_in_reg(15 downto 8);
            --Seems not correct
            --crc_next <= nextCRC16_D8(video_data_in(7  downto 0),crc_reg);
            --crc_next <= nextCRC16_D8(video_data_in(15 downto 8),crc_next);
            --lets try this one
            crc_next <= nextCRC16_D8(video_data_in(15 downto 8),nextCRC16_D8(video_data_in(7  downto 0),crc_reg));
            
            word_count_next <= std_logic_vector( unsigned(word_count_reg) + 2 ); --reduces 100 MHz speed on Artix 7
            --Treat the cases of short and long packets
            if (word_count_reg = std_logic_vector( unsigned(word_cound))) then --finish of transmission
               crc_next <= crc_reg; --no more CRC calc. needed
                state_next <= send_src;   
            end if;                    
        
        when send_src =>
            crc_next <= crc_reg;
            data_out_1_next <= crc_reg(7 downto 0);  --send out first byte of CRC (LSB)
            data_out_2_next <= crc_reg(15  downto 8);  --send out second byte of CRC (MSB)
            data_out_3_next <= (others => (not data_out_3_reg(7))); --HS-TRAIL bit flip of last payload bit of THIS lane      
            data_out_4_next <= (others => (not data_out_4_reg(7))); --HS-TRAIL bit flip of last payload bit of THIS lane      
            
            crc_next  <= x"FFFF";            
            state_next  <= hs_trail_long_packet;
            
        when hs_trail_long_packet =>
            --different from hs_trail_short_packet in data_out_3_next and data_out_4_next treatment
            data_out_1_next <= (others => (not data_out_1_reg(7)));  --HS-TRAIL bit flip of last payload bit of THIS lane      
            data_out_2_next <= (others => (not data_out_2_reg(7)));  --HS-TRAIL bit flip of last payload bit of THIS lane            
            --no change in lanes   data_out_3_next, data_out_4_next we already assigned the right value in the send_src state
            
            trail_counter_val_next <= to_unsigned(1, trail_counter_val_reg'length);
            state_next  <= hs_trail_loop;            
            
        when hs_trail_short_packet =>
            --different from hs_trail_long_packet in data_out_3_next and data_out_4_next treatment
            data_out_1_next <= (others => (not data_out_1_reg(7)));  --HS-TRAIL bit flip of last payload bit of THIS lane      
            data_out_2_next <= (others => (not data_out_2_reg(7)));  --HS-TRAIL bit flip of last payload bit of THIS lane            
            data_out_3_next <= (others => (not data_out_3_reg(7)));  --HS-TRAIL bit flip of last payload bit of THIS lane      
            data_out_4_next <= (others => (not data_out_4_reg(7)));  --HS-TRAIL bit flip of last payload bit of THIS lane         
            
            trail_counter_val_next <= to_unsigned(1, trail_counter_val_reg'length);
            state_next  <= hs_trail_loop;
            
        when hs_trail_loop => 
    
            --data remains the same
            --if (trail_counter_val_reg = N_TRAIL_BAITS or (trail_counter_val_reg = 15)) then
            if (trail_counter_val_reg = N_TRAIL_BAITS or (trail_counter_val_reg = to_unsigned(2**HS_TRAIL_COUNTER_WIDTH -1 ,HS_TRAIL_COUNTER_WIDTH))) then
            
                state_next  <= idle;
                trail_counter_val_next <= (others => '0');
            else
                trail_counter_val_next <= trail_counter_val_reg + 1;
            end if;                                     
        
               
    end case; --state_reg

end process; --LINE_OUT_FSMD



end Behavioral;
