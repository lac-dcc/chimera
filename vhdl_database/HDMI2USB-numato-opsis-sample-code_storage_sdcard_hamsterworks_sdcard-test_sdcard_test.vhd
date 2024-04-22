----------------------------------------------------------------------------------
-- Engineer:      Mike Field <hamster@snap.net.nz>
-- 
-- Module Name:   sdcard_test - Behavioral 
--
-- Description:   Playing with initialising a SD/microSD card.
--
--                Gets both SD and SDHC cards into the idle state, then starts a
--                single block read. 
--                
--                After the data block is transferred it goes into an idle 
--                state, as it is just a proof of concept.
--
--                Tested on the following cards:
--                   - Verbatim 2GB SDHC
--                   - Adata 16GB Class 4 SDHC
--                   - SanDisk TransFlash (64MB)
--                   - and any others I have tried
--
-- v 0.1 - Initial release
-- v 0.2 - Checks card's voltage settings
-- v 0.3 - Enable high speed transfers
-- v 0.4 - Verifies data transfer checksums
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity sdcard_test is
    Port ( clk32         : in  STD_LOGIC; 
           sd_clk        : out STD_LOGIC := '0';
           sd_cs         : out STD_LOGIC := '0';
           sd_mosi       : out STD_LOGIC := '0';
           sd_miso       : in  STD_LOGIC;
           sd_cd         : in  STD_LOGIC;
           data_ready    : out STD_LOGIC := '0';
           data          : out std_logic_VECTOR(7 downto 0);
           read_complete : OUT std_logic;
           crc_error     : OUT std_logic;
           status        : out STD_LOGIC_VECTOR(7 downto 0) := (others => '1'));
end sdcard_test;

architecture Behavioral of sdcard_test is
   constant DIVIDER_400K : unsigned(7 downto 0)  := to_unsigned(80, 8);
   constant DIVIDER_HS   : unsigned(7 downto 0)  := to_unsigned(4, 8);
   constant DETECT_DELAY : unsigned(11 downto 0) := to_unsigned(200000/80, 12);

   signal clock_divider  : unsigned(7 downto 0)  := DIVIDER_400K;
   signal countdown      : unsigned(11 downto 0) := (others => '1');
   
   signal seq_mosi : std_logic_vector(1023 downto 0) := (others => '1');
   signal seq_cs   : std_logic_vector(1023 downto 0) := (others => '1');
   signal seq_scke : std_logic_vector(1023 downto 0) := (others => '1');
   
   signal address       : unsigned(9 downto 0)         := (others => '1');
   signal bitcount      : unsigned(7 downto 0)         := (others => '0');
   signal received      : std_logic_vector(7 downto 0) := (others => '0');

   signal ocr  : std_logic_vector(31 downto 0) := (others => '0');
   
   -- These are all used to hold significant addresses in the command sequence.
   signal powerup_address     : natural;
   signal response_init       : natural;
   signal response_cmd8       : natural;
   signal response_cmd58_v1x  : natural;
   signal response_cmd55_v1x  : natural;
   signal response_acmd41_v1x : natural;

   signal start_v2x_init      : natural;
   signal response_cmd58_v2x  : natural;
   signal response_cmd55_v2x  : natural;
   signal response_acmd41_v2x : natural;
   
   signal start_cmd17_read    : natural;
   signal response_cmd17      : natural;
   signal response_cmd17_wait : natural;
   signal response_cmd17_data : natural;
   signal response_cmd17_crc  : natural;

   signal interface_idle_firstbit : natural;
   signal interface_idle_lastbit  : natural;
   signal v1_v2_decision          : natural;
   signal card_is_v2              : std_logic;
   signal terminal_bitcount       : std_logic := '0';

   signal crc_from_card_high : std_logic_vector(7 downto 0) := (others => '0');
   signal crc       : std_logic_vector(15 downto 0) := (others => '0');
   signal crc_accum : std_logic_vector(15 downto 0) := (others => '0');
   signal sd_cd_sync : std_logic_vector(1 downto 0) := (others => '1');
begin   
   -- Loop through the first 8 bits for a while, then bring up the data lines
   seq_mosi(1023 downto 896) <= x"0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF";  -- Sequencing for powerup (must be at least 80 clocks)
   seq_cs  (1023 downto 896) <= x"0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF";
   seq_scke(1023 downto 896) <= x"000000FFFFFFFFFFFFFFFFFFFFFFFFFF";  -- I use 104 clocks
   powerup_address <= 1016; 

   -- Then reset the card
   seq_mosi(895 downto 832) <= x"FF400000000095FF";   -- CMD0 - should return 0x01 - busy.
   seq_cs  (895 downto 832) <= x"FF00000000000000";
   seq_scke(895 downto 832) <= x"FFFFFFFFFFFFFFFF";
   response_init <= 832;
               
   -- This command has to be sent for SDHC cards to reveal their true identity...
   -- See http://www.netlist.com/files/6313/9482/1001/DS_SDVAULT_1v9_GENERAL.pdf
   seq_mosi(831 downto 704) <= x"FF48000001AA87FFFFFFFFFFFFFFFFFF";   -- CMD8 - SEND_IF_COND (SEND INTERFACE CONDITIONS)
   seq_cs  (831 downto 704) <= x"FF000000000000000000000000FFFFFF";   -- should gives x09 for v1.x cards, a 48-bit reply for v2.x cards
   seq_scke(831 downto 704) <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";   -- "01AA" = 2.7-3.3V, check pattern of 'AA'
   response_cmd8 <= 768;
   v1_v2_decision <= 704;

   ---------------------------------
   --- These are used for v1.x cards
   ---------------------------------
   seq_mosi(703 downto 576) <= x"FF7A0000000075FFFFFFFFFFFFFFFFFF";   -- CMD58 - Read Operating Conditions Register
   seq_cs  (703 downto 576) <= x"FF000000000000000000000000FFFFFF";   -- should give a 48 bit reply
   seq_scke(703 downto 576) <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
   response_cmd58_v1x <= 640;

    -- SD card version 1.X standard initalisation
   seq_mosi(575 downto 512) <= x"FF770000000065FF";   -- CMD55 - APP_CMD prefix
   seq_cs  (575 downto 512) <= x"FF00000000000000";   
   seq_scke(575 downto 512) <= x"FFFFFFFFFFFFFFFF";
   response_cmd55_v1x <= 512;
               
   seq_mosi(511 downto 448) <= x"FF69001000005FFF";   -- ACMD41 - SD_SEND_OP_COND - actually triggers the card to come ready
   seq_cs  (511 downto 448) <= x"FF00000000000000";   
   seq_scke(511 downto 448) <= x"FFFFFFFFFFFFFFFF";
   response_acmd41_v1x <= 448;

   ----------------------------------------------
   -- SD card version 2.x standard initalisation
   ----------------------------------------------
   start_v2x_init <= 447;
   seq_mosi(447 downto 384) <= x"FF770000000065FF";   -- CMD55 - APP_CMD prefix
   seq_cs  (447 downto 384) <= x"FF00000000000000";   
   seq_scke(447 downto 384) <= x"FFFFFFFFFFFFFFFF";
   response_cmd55_v2x <= 384;
               
   seq_mosi(383 downto 320) <= x"FF69401000005FFF";   -- ACMD41 - SD_SEND_OP_COND - actually triggers the card to come ready
   seq_cs  (383 downto 320) <= x"FF00000000000000";   
   seq_scke(383 downto 320) <= x"FFFFFFFFFFFFFFFF";
   response_acmd41_v2x <= 320;

   seq_mosi(319 downto 192) <= x"FF7A0000000075FFFFFFFFFFFFFFFFFF";   -- CMD58 - Read Operating Conditions Register
   seq_cs  (319 downto 192) <= x"FF000000000000000000000000FFFFFF";   -- should give a 48 bit reply
   seq_scke(319 downto 192) <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
   response_cmd58_v2x <= 256;

   seq_mosi(191 downto 64) <= x"FF510000000075FFFFFFFFFFFFFFFFFF";   -- CMD17 - Single block read, starting at address 0
   seq_cs  (191 downto 64) <= x"FF0000000000000000000000FFFFFFFF";   -- should give an 8-bit reply, followed by data block
   seq_scke(191 downto 64) <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";   -- which is structured 0xFE, 512x Data bytes, 2xCRC bytes
   start_cmd17_read <= 192;
   response_cmd17 <= 128;
   response_cmd17_wait <= 120;
   response_cmd17_data <= 112;
   response_cmd17_crc  <= 104;
   
   interface_idle_firstbit <= 15;
   interface_idle_lastbit  <= 8;

   ---------------------0
   -- power down when address = 0 (done or on error)
   ---------------------   
   seq_mosi(7 downto 0) <= x"00";   
   seq_cs  (7 downto 0) <= x"00";   
   seq_scke(7 downto 0) <= x"00";

process(clk32)
   begin
      if rising_edge(clk32) then
         data_ready <= '0';
         read_complete <= '0';
         
         if bitcount = 0 then
            sd_mosi  <= seq_mosi(to_integer(address));
            sd_cs    <= seq_cs(to_integer(address));
            sd_clk   <= '0';
         end if;
         
         if bitcount = "0" & clock_divider(7 downto 1) then
            sd_clk   <= seq_scke(to_integer(address));
            received <= received(6 downto 0) & sd_miso;
            if (sd_miso xor crc_accum(15)) = '0' then
               crc_accum <= crc_accum(14 downto 0) & '0';
            else
               crc_accum <= (crc_accum(14 downto 0) & '0') xor x"1021";
            end if;
         end if;
         
         if bitcount = clock_divider-2 then
            terminal_bitcount <= '1';
         else     
            terminal_bitcount <= '0';
         end if;

         if terminal_bitcount = '1' then
            bitcount <= (others => '0');
            if address(2 downto 0) = "00" then
               countdown <= countdown-1;
            end if;
            address <= address - 1;         
         end if;   
         
            
         if terminal_bitcount = '1' then
            -- We are waiting a while for the card to initialise
            if address = powerup_address and countdown /= 0 then
               address <= address + 7;            
            end if;

            if address = response_init then
               case received is
                  when x"FF" =>  address <= address + 7  ;-- no answer
                  when x"01" =>  null;  -- the expected reply - keep going!
                  when others => address <= (others => '0');
               end case;
            end if;

            if address = response_cmd8 then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't recieved back data after the CMD8 then wait
                  when x"05" =>  card_is_v2 <= '0'; -- command not supported - this is a V1.x card
                  when x"01" =>  card_is_v2 <= '1'; -- if the card is a HC card you will get here, and get a 48-bit reply
                  when others => address <= (others => '0');
               end case;
            end if;
            
            if address = v1_v2_decision and card_is_v2 = '1' then
               address <= to_unsigned(start_v2x_init,10);
            end if;

            ----------------------------------------
            -- V1.x intialisation
            ----------------------------------------
            if address = response_cmd58_v1x  then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't received back data after the CMD58 then wait
                  when x"01" =>  NULL;   -- expected reply - keep going!
                  when others => address <= (others => '0'); 
               end case;
            end if;
            
            -- These are for reading valid OCR bytes 
            if address = response_cmd58_v1x-8 then
               ocr(31 downto 24) <= received;
            end if;
            if address = response_cmd58_v1x-16 then
               ocr(23 downto 16) <= received;
            end if;
            if address = response_cmd58_v1x-24 then
               ocr(15 downto 8) <= received;
            end if;
            if address = response_cmd58_v1x-32 then
               ocr(7 downto 0) <= received;
            end if;

            -- check the operating voltage Card must support (3.4V - 3.3V) & (3.3V - 3.2V)
            if address = response_cmd58_v1x-40 and (ocr(21) = '0' or ocr(20) = '0') then
               address <= (others => '0');                   
            end if;

            if address = response_cmd55_v1x  then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't received back data after the CMD55 then wait
                  when x"00" =>  NULL;   
                  when x"01" =>  null; -- keep going to next command!
                  when others => address <= (others => '0');
               end case ;
            end if;

            if address = response_acmd41_v1x  then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't received back data after the ACMD41 then wait
                  when x"01" =>  address <= to_unsigned(response_cmd58_v1x - 1,10); -- get ready resend the CMD55 again
                  when x"00" =>  address <= to_unsigned(start_cmd17_read-1,10);  -- Yay! Card is initialised 
                  when others => address <= (others => '0');
               end case;
            end if;

            ----------------------------------------
            -- V2.x intialisation
            ----------------------------------------
            if address = response_cmd55_v2x  then
               case received is 
                  when x"FF" =>  address <= address + 7;-- If we haven't received back data after the CMD55 then wait
                  when x"00" =>  NULL;   
                  when x"01" =>  NULL;   
                  when others => address <= (others => '0');
               end case;
            end if;

            if address = response_acmd41_v2x  then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't received back data after the ACMD41 then wait
                  when x"01" =>  address <= to_unsigned(start_v2x_init, 10); -- get ready resend the CMD55 again
                  when x"00" =>  NULL ;                                      -- Yay! Card is initialised - go to read the OCR again
                  when others => address <= (others => '0');
               end case;
            end if;

            if address = response_cmd58_v2x  then
               case received  is 
                  when x"FF" =>  address <= address + 7; -- If we haven't received back data after the CMD58 then wait
                  when x"00" =>  NULL;   
                  when others => address <= (others => '0');
               end case;
            end if;
            
            -- These are for reading valid OCR bytes 
            if address = response_cmd58_v2x-8 then
               ocr(31 downto 24) <= received;
            end if;
            if address = response_cmd58_v2x-16 then
               ocr(23 downto 16) <= received;
            end if;
            if address = response_cmd58_v2x-24 then
               ocr(15 downto 8) <= received;
            end if;
            if address = response_cmd58_v2x-32 then
               ocr(7 downto 0) <= received;
            end if;

            ----------------------------------------
            -- Block data reading 
            ----------------------------------------
            if address = start_cmd17_read-1 then -- switch to high speed to read data
               clock_divider <= DIVIDER_HS;
               crc <= (others => '0');
            end if;
            
            if address = response_cmd17 then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't received status after the CMD18 then wait                  
                  when x"01" =>  null;
                  when x"00" =>  null;
                  when others => address <= (others => '0');
               end case;
            end if;
            
            if address = response_cmd17_wait then
               case received is
                  when x"FF" =>  address <= address + 7; -- If we haven't received the start of data then wait
                  when x"FE" =>  countdown <= to_unsigned(512, 12);
                                 crc_accum <= (others => '0');
                  when others => address <= (others => '0');  -- Error state
               end case;
            end if;

            if address = response_cmd17_data then
               ------------------------------------
               -- All of these are data bytes
               -- Could be output to a FIFO perhaps
               ------------------------------------
               data <= received;
               data_ready <= '1';
               if countdown = 0 then
                  crc <= crc_accum;
                  null; -- fall through to idle state
               else                         
                  address <= address + 7; -- get next byte
               end if;
            end if;

            if address = response_cmd17_crc then
               ------------------------------------
               -- Ignore the data CRC byte
               -- Could pass up to the higher layer
               ------------------------------------
               crc_from_card_high <= received;
            end if;

            if address = response_cmd17_crc-8 then
               crc_error <= '0';
               if crc /= crc_from_card_high & received then 
                  crc_error <= '1';
               end if;
               read_complete <= '1';
            end if;
            -----------------------------------------------
            -- Idle state - just send clocks over and over
            -----------------------------------------------
            if address = interface_idle_lastbit then
               address <= address + 7;  
            end if;

            -----------------------------------------------
            -- ERROR state - stop here with all signals are now set to low
            -----------------------------------------------
            if address = 0 then
               address <= address + 7;
            end if;
         else
            bitcount <= bitcount+1;
         end if;
         
         ----------------------------------
         -- Restart if the card is removed
         ----------------------------------
         if sd_cd_sync(sd_cd_sync'high) = '1' then
            address       <= (others => '1');
            countdown     <= (others => '1');
            ocr           <= (others => '0');
            bitcount      <= (others => '0');
            terminal_bitcount  <= '0';
            clock_divider <= DIVIDER_400K;
            crc_error     <= '0';
         end if;
         
         ----------------------------------
         -- synchronise the SD Card Detect signal.
         ----------------------------------
         sd_cd_sync <= sd_cd_sync(sd_cd_sync'high-1 downto 0) & sd_cd;
         status <= std_logic_vector(address(9 downto 2));
      end if;
   end process;
end Behavioral;
