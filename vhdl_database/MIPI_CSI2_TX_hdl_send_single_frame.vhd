----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2022 01:17:59 PM
-- Design Name: 
-- Module Name: send_single_frame - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.Common.all;

entity send_single_frame is
    Generic (	
        N_MIPI_LANES : integer := 4;
        LINE_CONTER_WIDTH : integer := 13; --bits width of line counter, 13 bit means max value for N_LINES = 8191
        PIXELS_PER_LINE : integer := 3240;--64;--3240;
        N_LINES : integer := 1944;-- 4;--1944;
        CLOCK_KHZ_LP : integer := 100000; --clock rate in KHz
        ADD_DEBUG_OVERLAY : integer := 1
    );
    Port (
        clk : in std_logic; --data in/out clock HS clock,every clock cicle prepare one byte of HS stream, per lane
        rst : in  std_logic;
        clk_DPHY_100Mhz : in std_logic;
        send_frame : in std_logic; --triggers frame sending, one clock cycle is enough          
        frame_done : out std_logic; --indicates that frame was sent successfully
        hs_active : out std_logic; -- ON when entrering HS mode, it is a good time to switch mixer lines and activate HS  
        hs_data_valid : out std_logic; -- when ON, csi_hs_data_out is valid to transmit
        csi_hs_data_1_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
        csi_hs_data_2_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
        csi_hs_data_3_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
        csi_hs_data_4_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal  
        lp_lanes : out std_logic_vector(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line
        lp_clk_lane  : out std_logic_vector(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line
        csi_clk_hs_active : out std_logic -- ON when entrering HS mode in clock lane, it is a good time to switch mixer lines and activate HS 
    );
end send_single_frame;

architecture Behavioral of send_single_frame is

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT one_lane_D_PHY is generic (	
	DATA_WIDTH_IN : integer := 8;
	DATA_WIDTH_OUT : integer := 8
	);
     Port(clk : in STD_LOGIC; --LP data in/out clock     
     rst : in  STD_LOGIC;
     start_transmission : in STD_LOGIC; --start of transmit trigger - performs the required LP dance
     stop_transmission  : in STD_LOGIC; --end of transmit trigger, enters into LP CTRL_Stop mode   
     ready_to_transmit : out STD_LOGIC; --goes high once ready for transmission
     hs_mode_flag : out STD_LOGIC; --signaling to enter/exit the HS mode. 1- enter, 0- exit
     lp_lanes : out STD_LOGIC_VECTOR(1 downto 0); --bit 1 = Dp line, bit 0 = Dn line
     lp_dance_complete : out STD_LOGIC; --1 when finished the LP state machine
     tLP_SOT_Delay : in integer;
     tLPX_Delay : in integer;
     is_short_packet : in STD_LOGIC;
     tLP_SOT_short_packet_delay : in integer;
     tHSprepare : in integer;
     tHSzero : in integer;
     tHSexit : in integer
     );
END COMPONENT;


COMPONENT gen_hs_lanes_stream is generic (    
    N_MIPI_LANES : integer := 2 --number of MIPI CSI lanes currently only 2 implemented
    );
Port(clk : in std_logic; --data in/out clock HS clock, ~100 MHZ
     rst : in  std_logic;
     is_short_packet : in std_logic; -- if high, no data sent, only short packet, Frame Start, Frame End etc. 
     --length of the valid payload, bytes: 8 bit example 320*240*8bit/8 =  76,800; 10 bit example: 320*240*10bit/8 =  96,000;
     word_cound : in std_logic_vector(15 downto 0); --data length for long packet MUST be devideble by 4, frame number or line number for short packet
     vc_num : in std_logic_vector(1 downto 0); --virtual channel number  
     data_type : in packet_type_t; --data type - YUV,RGB,RAW etc     
     --data_type : std_logic_vector(4 downto 0); -- for post-synthesis
     
     --video_data_in one byte of video payload, if 10 bit format, 10->8 bit arbitrage is done outside, but word count should represent corect number
     --valid length of payload. 8 bit example 320*240*8bit/8 =  76,800; 10 bit example: 320*240*10bit/8 =  96,000;
     video_data_in : in std_logic_vector(N_MIPI_LANES*8 -1 downto 0); 
     start_hs_transmit : in std_logic; --trigger to start transmission,one clock cycle enough- word_cound,vc_num,video_data_in should be valid.
     csi_hs_data_1_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
     csi_hs_data_2_out : out std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializersignal
     csi_hs_data_3_out : out  std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
     csi_hs_data_4_out : out  std_logic_vector(7 downto 0); --one byte of CSI stream that goes to serializer
     hs_data_out_valid : out std_logic; --goes high when csi_hs_data_out is valid          
     ready_for_hs_data_in_next_cycle : out std_logic --goest high one clock cycle before ready to get data
     );
END COMPONENT;


----Simple RAM based generator
COMPONENT colorbar_line_generator_raw10 is
    Generic (	
    N_MIPI_LANES : integer := 2;
    PIXELS_8BIT_PER_LINE : integer := 3240;
    BUS_WIDTH : integer := 8; --8 bits for now
    ADD_DEBUG_OVERLAY : integer := 1
);
    Port (
    clk : in std_logic; --every clock sends video_data_out 
    rst : in  std_logic;
    hs_active : in  std_logic;
    line_numer : in  std_logic; --0= line 1, 1 = line 2
    overlay_frame_number : in unsigned(15 downto 0);
    video_data_out : out std_logic_vector(N_MIPI_LANES*BUS_WIDTH -1 downto 0)
    );
end COMPONENT;


----More complex, on-the-fly generator, SV
--COMPONENT video_pattern_generator is
--    Generic (	
--    N_MIPI_LANES: integer := 2;
--    PIXELS_8BIT_PER_LINE: integer := 3240;
--    N_LINES: integer := 1944;
--    BUS_WIDTH: integer := 8;
--    WIDTH_N_PIXELS: integer := 13;
--    WIDTH_N_LINES: integer := 13
--);
--    Port (
--    clk : in std_logic; --every clock sends video_data_out 
--    rst : in  std_logic;
--    hs_active : in  std_logic;    
--    frame_number : in unsigned(15 downto 0);
--    line_number  : in unsigned(WIDTH_N_LINES -1 downto 0);
--    test_patter_selector : in unsigned(1 downto 0);
--    video_data_out : out std_logic_vector(N_MIPI_LANES*BUS_WIDTH -1 downto 0)
--    );
--end COMPONENT;


signal stop_transmission :  STD_LOGIC;
signal ready_to_transmit :  STD_LOGIC; --goes high once ready for transmission
signal hs_mode_flag      :  STD_LOGIC; --goes high when entering HS mode
signal phi_is_ready_to_send_new_packet : STD_LOGIC;


--video_data_in one byte of video payload, if 10 bit format, 10->8 bit arbitrage is done outside, but word count should represent corect number
--valid length of payload. 8 bit example 320*240*8bit/8 =  76,800; 10 bit example: 320*240*10bit/8 =  96,000;
signal video_data_in :  std_logic_vector(N_MIPI_LANES*8 -1 downto 0); --:= x"BEAF";--x"BABADEDA";
signal video_data_from_generator :  std_logic_vector(N_MIPI_LANES*8 -1 downto 0);
signal start_hs_transmit :  std_logic; --trigger to start transmission,one clock cycle enough- word_cound,vc_num,video_data_in should be valid.

--HS outputs
signal hs_data_out_valid : std_logic; --goes high when csi_hs_data_out is valid          
signal ready_for_hs_data_in_next_cycle : std_logic; --goest high one clock cycle before ready to get data

---Internal
type state_type is (IDLE,TURN_OFF_LP_ACTIVATE_HS,WAIT_FOR_HS,PHY_SENDS_PACKET_SP_or_LP,WAIT_SOME_TIME);	
signal state_reg, state_next : state_type := idle;
signal lp_clk_lane_state_reg, lp_clk_lane_state_next : state_type := idle;


signal is_short_packet  : std_logic; -- if high, no data sent, only short packet, Frame Start, Frame End etc. 
--length of the valid payload, bytes: 8 bit example 320*240*8bit/8 =  76,800; 10 bit example: 320*240*10bit/8 =  96,000;
signal word_count_or_framen_or_linen : std_logic_vector(15 downto 0); --data length for long packet, frame number or line number for short packet 
signal vc_num : std_logic_vector(1 downto 0); --virtual channel number  
signal data_type : packet_type_t; --data type - YUV,RGB,RAW etc
signal start_transmission_reg,start_transmission_next :  STD_LOGIC := '0';
signal start_hs_transmit_reg,start_hs_transmit_next : STD_LOGIC;

--for frame sending
type frame_state_type is (FS_IDLE,
                          FS_FRAME_START_SP, --SP = short packet
                          --FS_LINE_START_SP,
                          FS_LINE_PAYLOAD_LP, --LP = long packet
                          --FS_LINE_END_SP,
                          FS_FRAME_END_SP --SP = short packet
                          );
                          
signal frame_state_reg, frame_state_next : frame_state_type := FS_IDLE;
signal send_packet_reg, send_packet_next : std_logic;
signal line_counter_reg,line_counter_next :  unsigned (LINE_CONTER_WIDTH - 1 downto 0);
signal reset_colorbar_generator : std_logic; 
signal frame_number_reg,frame_number_next : unsigned(15 downto 0);
--LP clock lane
signal lp_clk_lane_start_transmission_reg,lp_clk_lane_start_transmission_next :  STD_LOGIC := '0';
signal lp_clk_lane_stop_transmission :  STD_LOGIC;
signal lp_clk_lane_ready_to_transmit :  STD_LOGIC; --goes high once ready for transmission
signal lp_clk_lane_hs_mode_flag      :  STD_LOGIC; --goes high when entering HS mode
signal lp_clk_lane_phi_is_ready_to_send_new_packet : STD_LOGIC;
signal lp_dance_complete_clk, lp_dance_complete_data : STD_LOGIC;

--LP timings
--constant tLP_SOT_Delay_clock : integer := 84; --420 ns at 200 MHz clock
--constant tLPX_Delay_clock : integer := 20;  --100 ns at 200 MHz clock
--constant tLP_SOT_Delay_data : integer := 375;  --1875 ns at 200 MHz clock
--constant tLPX_Delay_data : integer := 20;  --100 ns at 200 MHz clock
--constant tLP_SOT_short_packet_delay : integer := 1566;  --7830 ns at 200 MHz clock
--constant tHSprepare : integer := 30; --6 clock cycles of 100 Mhz = 60 ns
--constant tHSzero : integer := 160; --20 clock cycles of 100 Mhz = 200 ns --We encrease tHSzero to enable locking of clock of receiver (workaroud)
--constant tHSexit : integer := 20; --8 clock cycles of 100 Mhz = 100 ns

--constant CLOCK_KHZ_LP             : integer := 100000; --clock rate in KHz
constant TQ                       : integer := 80; --TQ = Time quanta in ns
constant N_CLOCK_PERIODS_IN_TQ    : integer := TQ*CLOCK_KHZ_LP/1000000;

constant tLP_SOT_Delay_clock_ns        : integer := 420; 
constant tLPX_Delay_clock_ns           : integer := 100; 
constant tLP_SOT_Delay_data_ns         : integer := 1875;
constant tLPX_Delay_data_ns            : integer := 100;
constant tLP_SOT_short_packet_delay_ns : integer := 7830;
constant tHSprepare_ns                 : integer := 150; 
constant tHSzero_ns                    : integer := 800;
constant tHSexit_ns                    : integer := 100;

constant tLP_SOT_Delay_clock        : integer := N_CLOCK_PERIODS_IN_TQ*tLP_SOT_Delay_clock_ns/TQ;
constant tLPX_Delay_clock           : integer := N_CLOCK_PERIODS_IN_TQ*tLPX_Delay_clock_ns/TQ;
constant tLP_SOT_Delay_data         : integer := N_CLOCK_PERIODS_IN_TQ*tLP_SOT_Delay_data_ns/TQ;
constant tLPX_Delay_data            : integer := N_CLOCK_PERIODS_IN_TQ*tLPX_Delay_data_ns/TQ;
constant tLP_SOT_short_packet_delay : integer := N_CLOCK_PERIODS_IN_TQ*tLP_SOT_short_packet_delay_ns/TQ;
constant tHSprepare                 : integer := N_CLOCK_PERIODS_IN_TQ*tHSprepare_ns/TQ; 
constant tHSzero                    : integer := N_CLOCK_PERIODS_IN_TQ*tHSzero_ns/TQ;
constant tHSexit                    : integer := N_CLOCK_PERIODS_IN_TQ*tHSexit_ns/TQ;


begin


--Simple RAM based generator
-- Instantiate the video generator 
Colorbar_generator : colorbar_line_generator_raw10
    Generic Map(	
    N_MIPI_LANES => N_MIPI_LANES,
    PIXELS_8BIT_PER_LINE => PIXELS_PER_LINE,-- Test vector is 3240 bytes length;
    ADD_DEBUG_OVERLAY => ADD_DEBUG_OVERLAY
    )
    Port Map(
    clk => clk, --every clock sends video_data_out 
    rst => reset_colorbar_generator,
    hs_active =>  hs_data_out_valid,
    line_numer => not line_counter_reg(0), --0= line 1, 1 = line 2
    overlay_frame_number => frame_number_reg,
    video_data_out => video_data_from_generator
    );

--More complex, on-the-fly generator, SV
-- Instantiate the video generator
--Colorbar_generator : video_pattern_generator
--    Generic Map(	
--    N_MIPI_LANES => N_MIPI_LANES,
--    PIXELS_8BIT_PER_LINE => PIXELS_PER_LINE,
--    N_LINES => N_LINES,
--    WIDTH_N_PIXELS => LINE_CONTER_WIDTH,
--    WIDTH_N_LINES => LINE_CONTER_WIDTH
--    )
--    Port Map(
--    clk => clk, --every clock sends video_data_out 
--    rst => reset_colorbar_generator,
--    hs_active =>  hs_data_out_valid, 
--    frame_number =>  frame_number_reg,
--    line_number  =>  line_counter_reg,
--    test_patter_selector => to_unsigned(test_pattern_t'pos(TPATTERN_0),2),--(others => '0'),--unsigned(1 downto 0)
--    video_data_out  => video_data_from_generator
--    );


reset_colorbar_generator <= (rst or (not hs_data_out_valid) or is_short_packet);
-- Instantiate the lanes
LP_Lane: one_lane_D_PHY PORT MAP(
     clk => clk_DPHY_100Mhz,
     rst => rst,
     start_transmission => start_transmission_reg,
     stop_transmission => stop_transmission,
     ready_to_transmit => ready_to_transmit,
     hs_mode_flag  => hs_mode_flag,
     lp_lanes => lp_lanes,
     lp_dance_complete => lp_dance_complete_data,
     tLP_SOT_Delay => tLP_SOT_Delay_data,
     tLPX_Delay => tLPX_Delay_data,
     is_short_packet => is_short_packet,
     tLP_SOT_short_packet_delay => tLP_SOT_short_packet_delay,
     tHSprepare => tHSprepare,  
     tHSzero    => tHSzero,
     tHSexit    => tHSexit
     );
     
Clk_LP_Lane: one_lane_D_PHY PORT MAP(
      clk => clk_DPHY_100Mhz,
      rst => rst,
      start_transmission => lp_clk_lane_start_transmission_reg,
      stop_transmission => lp_clk_lane_stop_transmission,
      ready_to_transmit => lp_clk_lane_ready_to_transmit,
      hs_mode_flag  => lp_clk_lane_hs_mode_flag,
      lp_lanes => lp_clk_lane,
      lp_dance_complete => lp_dance_complete_clk,
      tLP_SOT_Delay => tLP_SOT_Delay_clock,
      tLPX_Delay => tLPX_Delay_clock,
      is_short_packet => is_short_packet,
      tLP_SOT_short_packet_delay => tLP_SOT_short_packet_delay,
      tHSprepare => tHSprepare,  
      tHSzero    => tHSzero,
      tHSexit    => tHSexit
      );
     
          
--Instantiate the HS stream generator 

hs_stream_gen: gen_hs_lanes_stream  
     GENERIC MAP(    
       N_MIPI_LANES => N_MIPI_LANES --number of MIPI CSI lanes currently only 2 implemented
     )
     PORT MAP(
     clk => clk,
     rst => rst,
     is_short_packet => is_short_packet,
     word_cound => word_count_or_framen_or_linen,
     vc_num => vc_num,
     data_type => data_type,
     video_data_in =>  video_data_in,
     start_hs_transmit => start_hs_transmit,
     csi_hs_data_1_out => csi_hs_data_1_out,
     csi_hs_data_2_out => csi_hs_data_2_out,
     csi_hs_data_3_out => csi_hs_data_3_out,
     csi_hs_data_4_out => csi_hs_data_4_out,
     hs_data_out_valid =>       hs_data_out_valid,  
     ready_for_hs_data_in_next_cycle => ready_for_hs_data_in_next_cycle
     );        
          
     
--FSMD state & data registers
 FSMD_state : process(clk,rst)
 begin
     if (rst = '1') then 
         state_reg <= IDLE;               
         start_transmission_reg <= '0';       
         start_hs_transmit_reg <= '0';

         lp_clk_lane_state_reg <= IDLE;               
         lp_clk_lane_start_transmission_reg <= '0';       
         
         --for frame sending
         frame_state_reg <= FS_IDLE;
         line_counter_reg <= (others => '0'); 
         send_packet_reg <= '0';
         frame_number_reg <= (others => '0'); 
                 
     elsif (clk'event and clk = '1') then         
         state_reg <= state_next;
         start_transmission_reg <= start_transmission_next;
         start_hs_transmit_reg <= start_hs_transmit_next;

         lp_clk_lane_state_reg <= lp_clk_lane_state_next;
         lp_clk_lane_start_transmission_reg <= lp_clk_lane_start_transmission_next;
         
         --for frame sending
        frame_state_reg <= frame_state_next;
        frame_number_reg <= frame_number_next;

         line_counter_reg <= line_counter_next;
         send_packet_reg <= send_packet_next;
         
     end if;                             
 end process; --FSMD_state     
     
     
start_hs_transmit <= start_hs_transmit_reg;
hs_data_valid     <= hs_data_out_valid;
hs_active         <= hs_mode_flag; -- Switch mixer to HS lines and turn ON HS clock
csi_clk_hs_active       <=  lp_clk_lane_hs_mode_flag;
video_data_in     <=  video_data_from_generator;


Frame_Sending_FSMD : process(frame_state_reg,line_counter_reg,send_frame,
                            send_packet_reg,phi_is_ready_to_send_new_packet,
                            frame_number_reg
                            )

begin
    frame_state_next  <= frame_state_reg;
    line_counter_next <= line_counter_reg;
    send_packet_next  <= '0';--send_packet_reg;
    frame_number_next <= frame_number_reg;
    
    is_short_packet                 <= '0';
    vc_num                          <= (others => '0');
    data_type                       <= Default_Short_Packet;
    word_count_or_framen_or_linen   <= (others => '0');
    frame_done <= '0';    
 
    case frame_state_reg is 
        when FS_IDLE =>
        
        
            if (send_frame = '1') then
                --start frame trigger received            
                frame_state_next <= FS_FRAME_START_SP;
                frame_number_next <= frame_number_reg + 1;   
                send_packet_next <= '1';                
            end if;
            
        when FS_FRAME_START_SP =>
                
            is_short_packet <= '1'; --send short packet, frame start
            vc_num <= "00";--"00";
            data_type <= Frame_Start; 
            --for Frame_Start ,word_cound is a frame number starting from 1       
            word_count_or_framen_or_linen <= std_logic_vector(frame_number_reg);--x"0001";--x"1985"; --std_logic_vector(to_unsigned(0, 16));        
                   
            --wait until all sending is done
            if (phi_is_ready_to_send_new_packet = '1') then
                    --send long packet -line          
                    line_counter_next <=  to_unsigned(1, line_counter_reg'length); --set line counter to 1
                    frame_state_next <= FS_LINE_PAYLOAD_LP;
                    send_packet_next <= '1';
             end if;                                  

        when FS_LINE_PAYLOAD_LP =>
                
            --send long packet -line
            is_short_packet <= '0'; 
            vc_num <= "00";
            data_type <= RAW10; --0x2B 
            --for long packet (one line of pixels) word_count_or_framen_or_linen is number of bytes in line
            word_count_or_framen_or_linen <= std_logic_vector(to_unsigned(PIXELS_PER_LINE, 16)); --x"000C"; --12--x"CAD6"; --std_logic_vector(to_unsigned(0, 16)); 
        
              
        
            --wait until line sending is done
            if (phi_is_ready_to_send_new_packet = '1') then
                --send long packet -line
        
                line_counter_next <= line_counter_reg + 1;
                frame_state_next <= FS_LINE_PAYLOAD_LP;
                send_packet_next <= '1';
                
                                        
                if (line_counter_reg = N_LINES) then 
                    --we are done, send  frame end packet
                    send_packet_next <= '1';
                
                    frame_state_next <=  FS_FRAME_END_SP;
                    line_counter_next <= (others => '0'); --reset line counter to zero
                end if;
                    
            end if; --ready for sending
            
        when FS_FRAME_END_SP  =>
        
            is_short_packet <= '1'; --send short packet, frame start
            vc_num <= "00";--"00";
            data_type <= Frame_End; 
            --for Frame_End ,word_count_or_framen_or_linen is not relevant (TODO: validate it)     
            word_count_or_framen_or_linen <= x"1753"; --std_logic_vector(to_unsigned(0, 16));
            
            frame_done <= '1';
        
            if (phi_is_ready_to_send_new_packet = '1') then
                --if here  we are done
                frame_state_next <= FS_IDLE;
            end if;
        
    end case; --state_reg                          
 
end process; --Frame_Sending_FSMD


--video output state machine
Video_Out_FSMD : process(state_reg,send_packet_reg,
                         start_transmission_reg,hs_mode_flag,
                         hs_data_out_valid,ready_to_transmit,
                         start_hs_transmit_next,start_hs_transmit_reg,lp_dance_complete_clk )
 begin
 
   
 
     state_next <= state_reg;

     start_transmission_next <= start_transmission_reg;
     start_hs_transmit_next <= '0';
     phi_is_ready_to_send_new_packet <= '0';
     stop_transmission <= '0';     
                
     case state_reg is 
            when IDLE =>

                if (send_packet_reg = '1') then
                    --send packet trigger received
                    start_transmission_next <= '1'; --Trigger LP dance
                    state_next <= TURN_OFF_LP_ACTIVATE_HS;                                       
                end if;
                
                                
             when TURN_OFF_LP_ACTIVATE_HS =>  
                     start_transmission_next <= '0'; --Turn off LP dance trigger                     
                    --wait until hs_mode_flag_L2 = '1' and hs_mode_flag_L1 = '1'; -> DONE ABOVE                    
                     --wait until ready for HS data transmission
                    if (ready_to_transmit = '1') then
                        start_hs_transmit_next <= '1';
                        start_transmission_next <= '1';
                        state_next <= WAIT_FOR_HS;  
                    end if;
                                                         
             when WAIT_FOR_HS =>           
                 --wait for HS data start of transmission
                  if (hs_data_out_valid = '1') then               
                    start_transmission_next <= '0';                          
                    state_next <= PHY_SENDS_PACKET_SP_or_LP;
                   end if;
                
             when PHY_SENDS_PACKET_SP_or_LP =>                
             
                  if (hs_data_out_valid = '0') then
                    stop_transmission <= '1';
                    --state_next <= IDLE; --short packet sending done
                    state_next <= WAIT_SOME_TIME; --short packet sending done
                   end if;
                
             when WAIT_SOME_TIME =>
                  --TODO: add some delay                  
                  phi_is_ready_to_send_new_packet <= '0';
                  if (lp_dance_complete_clk = '1') then
                    phi_is_ready_to_send_new_packet <= '1';
                    state_next <= IDLE;
                  end if;          
            
     end case; --state_reg
 
 end process; --Video_Out_FSMD     


 
--LP clock lane
-- signal lp_clk_lane_start_transmission_reg,lp_clk_lane_start_transmission_next :  STD_LOGIC := '0';
-- signal lp_clk_lane_stop_transmission :  STD_LOGIC;
-- signal lp_clk_lane_ready_to_transmit :  STD_LOGIC; --goes high once ready for transmission
-- signal lp_clk_lane_hs_mode_flag      :  STD_LOGIC; --goes high when entering HS mode

--video output state machine
Clock_lane_FSMD : process(lp_clk_lane_state_reg,send_packet_reg,
                         lp_clk_lane_start_transmission_reg,lp_clk_lane_hs_mode_flag,
                         hs_data_out_valid,lp_clk_lane_ready_to_transmit,lp_dance_complete_data)
 begin
 
   
 
     lp_clk_lane_state_next <= lp_clk_lane_state_reg;

     lp_clk_lane_start_transmission_next <= lp_clk_lane_start_transmission_reg;
     lp_clk_lane_phi_is_ready_to_send_new_packet <= '0';
     lp_clk_lane_stop_transmission <= '0';     
                
     case lp_clk_lane_state_reg is 
            when IDLE =>

                if (send_packet_reg = '1') then
                    --send packet trigger received
                    lp_clk_lane_start_transmission_next <= '1'; --Trigger LP dance
                    lp_clk_lane_state_next <= TURN_OFF_LP_ACTIVATE_HS;                                       
                end if;
                
                                
             when TURN_OFF_LP_ACTIVATE_HS =>  
                     lp_clk_lane_start_transmission_next <= '0'; --Turn off LP dance trigger                     
                    --wait until hs_mode_flag_L2 = '1' and hs_mode_flag_L1 = '1'; -> DONE ABOVE                    
                     --wait until ready for HS data transmission
                    if (lp_clk_lane_ready_to_transmit = '1') then
                        lp_clk_lane_start_transmission_next <= '1';
                        lp_clk_lane_state_next <= WAIT_FOR_HS;  
                    end if;
                                                         
             when WAIT_FOR_HS =>           
                 --wait for HS data start of transmission
                  if (hs_data_out_valid = '1') then               
                    lp_clk_lane_start_transmission_next <= '0';                          
                    lp_clk_lane_state_next <= PHY_SENDS_PACKET_SP_or_LP;
                   end if;
                
             when PHY_SENDS_PACKET_SP_or_LP =>                
             
                  if (hs_data_out_valid = '0') then
                    lp_clk_lane_stop_transmission <= '1';
                    --state_next <= IDLE; --short packet sending done
                    lp_clk_lane_state_next <= WAIT_SOME_TIME; --short packet sending done
                   end if;
                
             when WAIT_SOME_TIME =>
                  --TODO: add some delay                  
                  lp_clk_lane_phi_is_ready_to_send_new_packet <= '0';
                  if (lp_dance_complete_data = '1') then
                    lp_clk_lane_phi_is_ready_to_send_new_packet <= '1';
                    lp_clk_lane_state_next <= IDLE;
                  end if;             
            
     end case; --state_reg
 
 end process; --Clock_lane_FSMD     
       
end Behavioral;
