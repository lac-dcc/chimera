------------------------------------------------------------------------------
-- Engineer:      Mike Field <hamster@snap.net.nz>
-- Description:   Converts VGA signals into DVID bitstreams.
--
--                'clk' and 'clk_n' should be 5x clk_pixel.
--
--                'blank' should be asserted during the non-display
--                portions of the frame
--
-- Major modifications by Ingo Korb:
-- - added a pixel clock enable signal
-- - added optional inversion for all three channels to allow swapped diff pairs
-- - added enhanced mode with audio and infoframe support
-- Original source from http://hamsterworks.co.nz/mediawiki/index.php/Dvid_test
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;

use work.dvienc_defs.all;
--use work.video_defs.all;

 

entity dvid is
    Generic ( -- allow inversion of each differential pair to account for pin swaps
      Invert_Red  : Boolean := false;
      Invert_Green: Boolean := false;
      Invert_Blue : Boolean := false;
      Invert_Clock: Boolean := false
    ); 
    Port ( clk           : in  STD_LOGIC;
           clk_n         : in  STD_LOGIC;
           clk_pixel     : in  STD_LOGIC;
           clk_pixel_en  : in  boolean;
           red_p         : in  STD_LOGIC_VECTOR (7 downto 0);
           green_p       : in  STD_LOGIC_VECTOR (7 downto 0);
           blue_p        : in  STD_LOGIC_VECTOR (7 downto 0);
           blank         : in  STD_LOGIC;
           hsync         : in  STD_LOGIC;
           vsync         : in  STD_LOGIC;

           EnhancedMode  : in  boolean;
           IsProgressive : in  boolean;
           IsPAL         : in  boolean;
           Is30kHz       : in  boolean;
           Limited_Range : in  boolean;
           Widescreen    : in  boolean;
		   
           --Audio         : in  AudioData;
		   HDMI_audio_L     : std_logic_vector(15 downto 0);
		   HDMI_audio_R     : std_logic_vector(15 downto 0);
		   HDMI_LeftEnable 	: boolean;
		   HDMI_RightEnable	: boolean; 
          -- Audio         : in  AudioData;

           -- test signals for simulation
           TMDSWord_Red  : out std_logic_vector(9 downto 0);
           TMDSWord_Green: out std_logic_vector(9 downto 0);
           TMDSWord_Blue : out std_logic_vector(9 downto 0);

           -- DDR single-ended signals (2 bits each)
           dvid_red     : out STD_LOGIC_VECTOR (1 downto 0);
           dvid_green   : out STD_LOGIC_VECTOR (1 downto 0);
           dvid_blue    : out STD_LOGIC_VECTOR (1 downto 0);
           dvid_clock   : out STD_LOGIC_VECTOR (1 downto 0);

           -- LVDS buffered signals
           red_s     : out STD_LOGIC_VECTOR (0 downto 0);
           green_s   : out STD_LOGIC_VECTOR (0 downto 0);
           blue_s    : out STD_LOGIC_VECTOR (0 downto 0);
           clock_s   : out STD_LOGIC_VECTOR (0 downto 0));
end dvid;

architecture Behavioral of dvid is

 
  -- sequencer outputs
  signal seq_encmode     : Enc_Mode_t;
  signal seq_bt4mux      : BT4_Mode_t;
  signal seq_c2c0        : std_logic_vector(1 downto 0);
  signal seq_shiftpkt    : boolean;
  signal seq_shift2ndpkt : boolean;
  signal seq_nfirstpkt   : boolean;
  signal seq_done        : boolean;
  signal header_send_ecc : boolean;
  signal data_send_ecc   : boolean;

  -- sequencer control
  signal seq_address   : natural range 0 to 511 := UCode_Addr_TMDS;
  signal seq_active    : boolean := false;
  signal seq_start     : boolean := false;
 
  type video_state_t   is (VS_VIDEO_PRE, VS_VIDEO_DATA, VS_AUX, VS_BLANKING);  
  signal video_state: video_state_t := VS_VIDEO_DATA;
  
  attribute syn_state_machine : boolean; 
  attribute syn_state_machine of video_state : signal is false;    

  signal c3c0: std_logic_vector(3 downto 0);
  signal c_blue: std_logic_vector(1 downto 0);

  signal aux_red,     aux_green,     aux_blue    : std_logic_vector(3 downto 0) := (others => '0');
  signal tmds_red,    tmds_green,    tmds_blue   : std_logic_vector(9 downto 0);
  signal auxenc_red,  auxenc_green,  auxenc_blue : std_logic_vector(9 downto 0);
  signal latched_red, latched_green, latched_blue: std_logic_vector(9 downto 0) := (others => '0');
  signal shift_red,   shift_green,   shift_blue  : std_logic_vector(9 downto 0) := (others => '0');

  signal out_red, out_green, out_blue, out_clock: std_logic_vector(1 downto 0);
  signal shift_clock: std_logic_vector(9 downto 0) := "0000011111";

  -- input delays
  constant delay_clocks: natural := 11; -- 10 pixels to generate the video preamble plus one bonus for delays
  type color_delay   is array(0 to delay_clocks-1) of std_logic_vector(7 downto 0);
  type control_delay is array(0 to delay_clocks-1) of std_logic;

  signal red_delay  : color_delay;
  signal green_delay: color_delay;
  signal blue_delay : color_delay;
  signal hsync_delay: control_delay;
  signal vsync_delay: control_delay;
  signal blank_delay: control_delay;

  signal red_d  : std_logic_vector(7 downto 0);
  signal green_d: std_logic_vector(7 downto 0);
  signal blue_d : std_logic_vector(7 downto 0);
  signal hsync_d: std_logic;
  signal vsync_d: std_logic;
  signal blank_d: std_logic;

  -- infoframe ROM signals
  signal ifr_fulladdr  : unsigned(11 downto 0);
  signal ifr_addr      : unsigned(4 downto 0) := (others => '0'); -- address counter
  signal ifr_frame     : unsigned(1 downto 0) := (others => '0'); -- frame in group
  signal ifr_select    : unsigned(4 downto 0) := (others => '0'); -- group selection
  signal ifr_prevselect: unsigned(4 downto 0) := (others => '0'); -- group selection backup during ACR
  signal ifr_data      : std_logic_vector(8 downto 0) := (others => '0');

  signal aux_ready        : boolean := false;
  signal per_frame_packets: natural range 0 to 4 := 0;

  -- subpackets
  signal subpacket1_odd,  subpacket2_odd,  subpacket3_odd,  subpacket4_odd : std_logic_vector(27 downto 0) := (others => '0');
  signal subpacket1_even, subpacket2_even, subpacket3_even, subpacket4_even: std_logic_vector(27 downto 0) := (others => '0');
  signal packet_header: std_logic_vector(23 downto 0) := (others => '0');

  signal sub1_pair, sub2_pair,
         sub3_pair, sub4_pair: std_logic_vector(1 downto 0);
  signal header_eccbit: std_logic;
  signal sub1_eccbits, sub2_eccbits,
         sub3_eccbits, sub4_eccbits: std_logic_vector(1 downto 0);

  -- audio
  type enable_syncer_t is array(2 downto 0) of boolean;

  signal channel_status    : std_logic_vector(191 downto 0) := x"00000000000000000000000000000000000000020200f904";
  signal channel_bit       : natural range 0 to 191 := 0;
  signal sample_count      : natural range 0 to 3   := 0;
  signal left_buffer       : std_logic_vector(15 downto 0);
  signal right_buffer      : std_logic_vector(15 downto 0);
  signal left_en_sync      : enable_syncer_t := (others => false);
  signal right_en_sync     : enable_syncer_t := (others => false);
  signal left_enable       : boolean := false;
  signal right_enable      : boolean := false;
  signal audio_sample_ready: boolean := false;
  signal audio_samples_sent: natural range 0 to 47 := 0;
  signal audio_needs_acr   : boolean := false;

  signal dummy10	: std_logic;
  signal dummy20	: std_logic;
  signal dummy11	: std_logic;
  signal dummy21	: std_logic;
  signal dummy12	: std_logic;
  signal dummy22	: std_logic;
  signal dummy13	: std_logic; 
  signal dummy23	: std_logic;

  ---- helper functions
  -- extract even bits of word
  function extract_even(v: std_logic_vector(55 downto 0))
    return std_logic_vector is
    variable tmp: std_logic_vector(27 downto 0);
    variable i: natural range 0 to 27;
  begin
    for i in 0 to 27 loop
      tmp(i) := v(2*i);
    end loop;

    return tmp;
  end function;

  -- extract odd bits of word
  function extract_odd(v: std_logic_vector(55 downto 0))
    return std_logic_vector is
    variable tmp: std_logic_vector(27 downto 0);
    variable i: natural range 0 to 27;
  begin
    for i in 0 to 27 loop
      tmp(i) := v(2*i + 1);
    end loop;

    return tmp;
  end function;

  -- calculate parity of audio sample
  function parity(v: std_logic_vector(15 downto 0))
    return std_logic is
    variable tmp: std_logic := '0';
    variable i: natural range 0 to 15;
  begin
    for i in 0 to 15 loop
      tmp := tmp xor v(i);
    end loop;

    return tmp;
  end function;

begin

  -- Sequencer ROM
  Inst_UCode: edvi_UCode PORT MAP (
    Clock           => clk_pixel,
    ClockEnable     => clk_pixel_en,
    Address         => seq_address,
    BT4_Mode        => seq_bt4mux,
    C2C0_Value      => seq_c2c0,
    Enc_Mode        => seq_encmode,
    ShiftPacket     => seq_shiftpkt,
    HeaderSendECC   => header_send_ecc,
    DataSendECC     => data_send_ecc,
    nFirstPacketBit => seq_nfirstpkt,
    ShiftSecondPkt  => seq_shift2ndpkt,
    Done            => seq_done
  );

  -- Infoframe ROM
  Inst_InfoFrameROM: infoframe_rom PORT MAP (
    Clock       => clk_pixel,
    ClockEnable => clk_pixel_en,
    Address     => ifr_fulladdr,
    Data        => ifr_data
  );
  ifr_fulladdr <= ifr_select & ifr_frame & ifr_addr;

  -- TMDS
  TMDSWord_Red   <= latched_red;
  TMDSWord_Green <= latched_green;
  TMDSWord_Blue  <= latched_blue;

  c_blue <= vsync_d & hsync_d;
  c3c0   <= "0" & seq_c2c0(1) & "0" & seq_c2c0(0);

  TDMS_encoder_red:   TDMS_encoder PORT MAP(clk => clk_pixel, clk_en => clk_pixel_en, data => red_d,   c => c3c0(3 downto 2), blank => blank_d, encoded => tmds_red);
  TDMS_encoder_green: TDMS_encoder PORT MAP(clk => clk_pixel, clk_en => clk_pixel_en, data => green_d, c => c3c0(1 downto 0), blank => blank_d, encoded => tmds_green);
  TDMS_encoder_blue:  TDMS_encoder PORT MAP(clk => clk_pixel, clk_en => clk_pixel_en, data => blue_d,  c => c_blue,           blank => blank_d, encoded => tmds_blue);

  AUX_encoder_red:    aux_encoder PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, Data => aux_red,   EncData => auxenc_red);
  AUX_encoder_green:  aux_encoder PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, Data => aux_green, EncData => auxenc_green);
  AUX_encoder_blue:   aux_encoder PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, Data => aux_blue,  EncData => auxenc_blue);

  -- ECC for aux data
  sub1_pair <= subpacket1_odd(0) & subpacket1_even(0);
  sub2_pair <= subpacket2_odd(0) & subpacket2_even(0);
  sub3_pair <= subpacket3_odd(0) & subpacket3_even(0);
  sub4_pair <= subpacket4_odd(0) & subpacket4_even(0);

  ECC_header:     aux_ecc1 PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, DataIn => packet_header(0), DataOut => header_eccbit, SendECC => header_send_ecc);
  ECC_subpacket1: aux_ecc2 PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, DataIn => sub1_pair,        DataOut => sub1_eccbits,  SendECC => data_send_ecc);
  ECC_subpacket2: aux_ecc2 PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, DataIn => sub2_pair,        DataOut => sub2_eccbits,  SendECC => data_send_ecc);
  ECC_subpacket3: aux_ecc2 PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, DataIn => sub3_pair,        DataOut => sub3_eccbits,  SendECC => data_send_ecc);
  ECC_subpacket4: aux_ecc2 PORT MAP (Clock => clk_pixel, ClockEnable => clk_pixel_en, DataIn => sub4_pair,        DataOut => sub4_eccbits,  SendECC => data_send_ecc);

	u2 : entity work.ddr_out_emard
    port map (iclkp=>clk, iclkn=>clk_n, ireset=>'0',
        idata(1 downto 0)=>shift_red(1 downto 0), odata=>red_s(0)); 
		 
	u3 : entity work.ddr_out_emard
    port map (iclkp=>clk, iclkn=>clk_n, ireset=>'0',
        idata(1 downto 0)=>shift_green(1 downto 0), odata=>green_s(0)); 
		
	u4 : entity work.ddr_out_emard
    port map (iclkp=>clk, iclkn=>clk_n, ireset=>'0',
        idata(1 downto 0)=>shift_blue(1 downto 0), odata=>blue_s(0));			

	u5 : entity work.ddr_out_emard
    port map (iclkp=>clk, iclkn=>clk_n, ireset=>'0',
        idata(1 downto 0)=>shift_clock(1 downto 0), odata=>clock_s(0));

  -- add optional inversion of the output bits
  out_red   <= not shift_red(1 downto 0)   when Invert_Red   else shift_red(1 downto 0);
  out_green <= not shift_green(1 downto 0) when Invert_Green else shift_green(1 downto 0);
  out_blue  <= not shift_blue(1 downto 0)  when Invert_Blue  else shift_blue(1 downto 0);
  out_clock <= not shift_clock(1 downto 0) when Invert_Clock else shift_clock(1 downto 0);
 
  dvid_red <= out_red;
  dvid_green <= out_green;
  dvid_blue <= out_blue;
  dvid_clock <= out_clock;

  -- select between the output of the various encoders
  process(clk_pixel, clk_pixel_en)
  begin
    if rising_edge(clk_pixel) and clk_pixel_en then
      case seq_encmode is
        when ENC_TMDS =>
          latched_red   <= tmds_red;
          latched_green <= tmds_green;
          latched_blue  <= tmds_blue;
        when ENC_TERC =>
          latched_red   <= auxenc_red;
          latched_green <= auxenc_green;
          latched_blue  <= auxenc_blue;
        when ENC_GuardV =>
          latched_red   <= "1011001100";
          latched_green <= "0100110011";
          latched_blue  <= "1011001100";
        when ENC_GuardD =>
          latched_red   <= "0100110011";
          latched_green <= "0100110011";
          latched_blue  <= auxenc_blue;
      end case;
    end if;
  end process;

  -- always send vsync+hsync on blue channel if in aux mode
  aux_blue(1 downto 0) <= (vsync_d, hsync_d);
  aux_blue(2) <= '1' when seq_bt4mux = BT4_Send_1 else header_eccbit;
  aux_blue(3) <= '1' when seq_nfirstpkt           else '0';

  -- copy ecc'ed aux data to TERC4 inputs
  aux_green <= sub4_eccbits(0) & sub3_eccbits(0) & sub2_eccbits(0) & sub1_eccbits(0);
  aux_red   <= sub4_eccbits(1) & sub3_eccbits(1) & sub2_eccbits(1) & sub1_eccbits(1);

  -- large video+audio handling process including state machine
  process(clk_pixel, clk_pixel_en)
    variable audio_packet: std_logic_vector(55 downto 0);
  begin
    if rising_edge(clk_pixel) and clk_pixel_en then
      -- delay signals to get an early warning before the active window
      red_delay(0 to delay_clocks-2)   <= red_delay(1 to delay_clocks-1);
      green_delay(0 to delay_clocks-2) <= green_delay(1 to delay_clocks-1);
      blue_delay(0 to delay_clocks-2)  <= blue_delay(1 to delay_clocks-1);
      hsync_delay(0 to delay_clocks-2) <= hsync_delay(1 to delay_clocks-1);
      vsync_delay(0 to delay_clocks-2) <= vsync_delay(1 to delay_clocks-1);
      blank_delay(0 to delay_clocks-2) <= blank_delay(1 to delay_clocks-1);
      red_delay(delay_clocks-1)   <= red_p;
      green_delay(delay_clocks-1) <= green_p;
      blue_delay(delay_clocks-1)  <= blue_p;
      hsync_delay(delay_clocks-1) <= hsync;
      vsync_delay(delay_clocks-1) <= vsync;
      blank_delay(delay_clocks-1) <= blank;
      red_d   <= red_delay(0);
      green_d <= green_delay(0);
      blue_d  <= blue_delay(0);
      hsync_d <= hsync_delay(0);
      vsync_d <= vsync_delay(0);
      blank_d <= blank_delay(0);

      -- assemble audio data
      left_en_sync(1 downto 0)  <= left_en_sync(2 downto 1);
      left_en_sync(2)           <= HDMI_LeftEnable;
      left_enable               <= left_en_sync(0) and not left_en_sync(1); -- falling edge

      right_en_sync(1 downto 0) <= right_en_sync(2 downto 1);
      right_en_sync(2)          <= HDMI_RightEnable;
      right_enable              <= right_en_sync(0) and not right_en_sync(1);

      if left_enable then
        -- buffer until the right channel is also available
        left_buffer <= HDMI_audio_L;
      end if;

      if right_enable then
        -- buffering the right channel for one clock relaxes timing
        right_buffer       <= HDMI_audio_R;
        audio_sample_ready <= true;
      end if;

      if EnhancedMode and not seq_active and audio_sample_ready then
        -- only queue new audio data while the sequencer is not running
        -- (a new sample is available every 281 pixels,
        --  a worst-case packet is <80 pixels long -> no additional buffer needed)
        audio_packet := (others => '0');
        audio_packet(23 downto  8) := std_logic_vector(left_buffer);
        audio_packet(47 downto 32) := std_logic_vector(right_buffer);
        audio_packet(50) := channel_status(0);
        audio_packet(54) := channel_status(0);
        audio_packet(51) := parity(std_logic_vector(left_buffer))  xor channel_status(0);
        audio_packet(55) := parity(std_logic_vector(right_buffer)) xor channel_status(0);

        -- move sample data into the correct subpacket
        case sample_count is
          when 0 =>
            subpacket1_even <= extract_even(audio_packet);
            subpacket1_odd  <= extract_odd(audio_packet);

          when 1 =>
            subpacket2_even <= extract_even(audio_packet);
            subpacket2_odd  <= extract_odd(audio_packet);

          when 2 =>
            subpacket3_even <= extract_even(audio_packet);
            subpacket3_odd  <= extract_odd(audio_packet);

          when 3 =>
            subpacket4_even <= extract_even(audio_packet);
            subpacket4_odd  <= extract_odd(audio_packet);
        end case;

        -- set flags in packet header
        packet_header(8 + sample_count) <= '1';
        if channel_bit = 0 then
          packet_header(20 + sample_count) <= '1';
        end if;

        -- count samples sent
        sample_count <= sample_count + 1;
        if audio_samples_sent = 47 then
          audio_samples_sent <= 0;
          audio_needs_acr    <= true;
        else
          audio_samples_sent <= audio_samples_sent + 1;
        end if;

        -- shift channel status
        channel_status <= channel_status(0) & channel_status(191 downto 1);
        if channel_bit = 0 then
          channel_bit <= 191;
        else
          channel_bit <= channel_bit - 1;
        end if;

        audio_sample_ready <= false;
      end if;

      -- sequencer control
      if not EnhancedMode then
        -- pure DVI mode stays in a single state,
        -- the 8b10b encoder handles active+blanking itself
        seq_address <= UCode_Addr_TMDS;
        video_state <= VS_BLANKING;
      elsif EnhancedMode and (seq_active or seq_start) then
        if seq_done and not seq_start then
          seq_active <= false;
        else
          seq_active  <= true;
          seq_start   <= false;
          seq_address <= seq_address + 1;
        end if;
      end if;

      -- video state machine
      case video_state is
        when VS_BLANKING =>
          if EnhancedMode then
            if blank = '0' then -- check for early warning
              video_state <= VS_VIDEO_PRE;
              seq_start   <= true;
              seq_address <= UCode_Addr_Blank2Vid;
            elsif aux_ready then
              -- an aux packet is queued
              aux_ready   <= false;
              video_state <= VS_AUX;
              seq_start   <= true;

              if audio_needs_acr then
                -- send an Audio Clock Regeneration packet ASAP
                seq_address    <= UCode_Addr_TwoPackets;
                ifr_prevselect <= ifr_select;
                ifr_select     <= (others => '0');

              elsif per_frame_packets /= 0 then
                -- send another of the once-per-frame packets
                seq_address       <= UCode_Addr_TwoPackets;
                per_frame_packets <= per_frame_packets - 1;

              else
                seq_address <= UCode_Addr_OnePacket;
              end if;
            end if;
          end if;

        when VS_VIDEO_PRE =>
          if seq_done then
            video_state <= VS_VIDEO_DATA;
          end if;

        when VS_VIDEO_DATA =>
          if blank_delay(0) = '1' then
            video_state <= VS_BLANKING;
          end if;

        when VS_AUX =>
          if seq_done then
            -- end of data island, prepare for the next one
            -- (at this point seq_active is still true,
            --  so this will not overwrite un-sent audio data)
            video_state <= VS_BLANKING;

            if audio_needs_acr then
              -- restore previous once-per-frame group
              ifr_select <= ifr_prevselect;

            elsif per_frame_packets /= 0 then
              ifr_frame <= ifr_frame + 1;
            end if;

            -- clear audio data
            packet_header   <= x"000002";
            subpacket1_even <= (others => '0');
            subpacket1_odd  <= (others => '0');
            subpacket2_even <= (others => '0');
            subpacket2_odd  <= (others => '0');
            subpacket3_even <= (others => '0');
            subpacket3_odd  <= (others => '0');
            subpacket4_even <= (others => '0');
            subpacket4_odd  <= (others => '0');
            sample_count    <= 0;
            audio_needs_acr <= false;
          end if;

      end case;

      -- start packet transmission at every HSync start
      if hsync_delay(0) = '1' and hsync_delay(1) = '0' then
        aux_ready <= true;
      end if;

      -- enable once-per-frame packet transmission at VSync start
      if vsync_delay(0) = '1' and vsync_delay(1) = '0' then
        per_frame_packets <= 3;
        ifr_frame         <= (others => '0');

        -- choose the packet sequence to send for the current video mode
        ifr_select <= (others => '0');
        if Limited_Range then
          ifr_select(0) <= '1';
        end if;

        if IsPAL then
          ifr_select(1) <= '1';
        end if;

        if IsProgressive then
          ifr_select(2) <= '1';
        end if;

        if not Is30kHz then
          ifr_select(3) <= '1';
        end if;

        if Widescreen then
          ifr_select(4) <= '1';
        end if;
      end if;

      -- packet shifting
      if seq_shiftpkt then
        packet_header   <= ifr_data(0) & packet_header(23 downto 1);
        subpacket1_even <= ifr_data(1) & subpacket1_even(27 downto 1);
        subpacket1_odd  <= ifr_data(2) & subpacket1_odd (27 downto 1);
        subpacket2_even <= ifr_data(3) & subpacket2_even(27 downto 1);
        subpacket2_odd  <= ifr_data(4) & subpacket2_odd (27 downto 1);
        subpacket3_even <= ifr_data(5) & subpacket3_even(27 downto 1);
        subpacket3_odd  <= ifr_data(6) & subpacket3_odd (27 downto 1);
        subpacket4_even <= ifr_data(7) & subpacket4_even(27 downto 1);
        subpacket4_odd  <= ifr_data(8) & subpacket4_odd (27 downto 1);
      end if;

      if seq_shift2ndpkt then
        ifr_addr <= ifr_addr + 1;
      else
        ifr_addr <= (others => '0');
      end if;

    end if;
  end process;

  -- bit shifting at half pixel clock rate
  process(clk)
  begin
    if rising_edge(clk) then
      if shift_clock = "0000011111" then
        shift_red   <= latched_red;
        shift_green <= latched_green;
        shift_blue  <= latched_blue;
      else
        shift_red   <= "00" & shift_red  (9 downto 2);
        shift_green <= "00" & shift_green(9 downto 2);
        shift_blue  <= "00" & shift_blue (9 downto 2);
      end if;
      shift_clock <= shift_clock(1 downto 0) & shift_clock(9 downto 2);
    end if;
  end process;

end Behavioral;

