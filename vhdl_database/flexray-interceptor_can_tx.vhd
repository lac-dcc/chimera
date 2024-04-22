library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.can;


entity can_tx is
  port (
    clk : in std_ulogic;                -- Clock 8x higher than can bitrate
    rst : in std_ulogic;

    ready : in std_ulogic;
    msg   : in work.can.message;

    busy : out   std_ulogic;
    tx   : inout std_ulogic;
    done : inout std_ulogic);
end entity can_tx;


architecture syn of can_tx is
  signal prev_ready : std_ulogic;

  signal prev_send_req : std_ulogic;
  signal send_req      : std_ulogic;

  signal to_send : work.can.message;
begin

  send : process(clk, rst)
    variable should_crc   : std_ulogic             := '0';
    variable should_stuff : std_ulogic             := '0';
    variable new_tx       : std_ulogic             := '0';
    variable sending      : std_ulogic             := '0';
    variable bit_counter  : integer range 0 to 255 := 0;
    variable tick_counter : integer range -1 to 7  := 0;
    variable same_counter : integer range 0 to 7;
    variable computed_crc : std_ulogic_vector(14 downto 0);
    variable num_bits     : integer range 0 to 255;

  begin
    if rst = '1' then
      bit_counter := 0;

      sending := '0';
      done    <= '0';
      tx      <= '1';
    elsif rising_edge(clk) then
      busy <= sending;

      -- Start sending message
      if send_req = '1' and prev_send_req = '0' then
        done         <= '0';
        sending      := '1';
        tick_counter := 0;
        bit_counter  := 0;
        same_counter := 1;
      end if;

      if sending = '1' then
        num_bits := to_integer(unsigned(to_send.len)) * 8;

        if tick_counter = 0 then
          should_crc   := '1';
          should_stuff := '1';

          -- Start of frame
          if bit_counter = 0 then
            computed_crc := "000000000000000";
            new_tx       := '0';
          -- ID
          elsif bit_counter >= 1 and bit_counter <= 11 then
            new_tx := to_send.id(10 - (bit_counter - 1));
          -- RTR
          elsif bit_counter = 12 then
            new_tx := '0';
          -- IDE
          elsif bit_counter = 13 then
            new_tx := '0';
          -- r0
          elsif bit_counter = 14 then
            new_tx := '0';
          -- LEN
          elsif bit_counter >= 15 and bit_counter <= 18 then
            new_tx := to_send.len(3 - (bit_counter - 15));
          -- DATA
          elsif bit_counter >= 19 and bit_counter < 19 + num_bits then
            new_tx := to_send.dat(63 - (bit_counter - 19));
          -- CRC
          elsif bit_counter >= 19 + num_bits and bit_counter <= 33 + num_bits then
            should_crc := '0';
            new_tx     := computed_crc(14 - (bit_counter - 19 - num_bits));
          -- CRC delimiter till end of frame
          elsif bit_counter >= 34 + num_bits and bit_counter <= 43 + num_bits then
            should_stuff := '0';
            new_tx       := '1';
          elsif bit_counter >= 44 + num_bits then
            new_tx       := '1';
            should_stuff := '0';

            done    <= '1';
            sending := '0';
          end if;

          if should_stuff = '1' then
            if same_counter = 5 then
              should_crc  := '0';
              new_tx      := not tx;
              bit_counter := bit_counter - 1;
            end if;

            if tx = new_tx then
              same_counter := same_counter + 1;
            else
              same_counter := 1;
            end if;
          else
            same_counter := 1;
          end if;

          -- update CRC
          if should_crc = '1' then
            if (new_tx xor computed_crc(14)) = '1' then
              computed_crc := (computed_crc(13 downto 0) & '0') xor b"100010110011001";
            else
              computed_crc := (computed_crc(13 downto 0) & '0');
            end if;
          end if;

          -- Write output
          tx <= new_tx;
        end if;


        -- Update bit and tick counters
        if tick_counter < 7 then
          tick_counter := tick_counter + 1;
        else
          tick_counter := 0;
          bit_counter  := bit_counter + 1;
        end if;
      end if;

    end if;
  end process;

  main : process(clk, rst)
  begin
    if rst = '1' then
      prev_ready    <= '0';
      send_req      <= '0';
      prev_send_req <= '0';
    elsif rising_edge(clk) then
      prev_ready    <= ready;
      prev_send_req <= send_req;

      if ready = '1' and prev_ready = '0' then
        to_send  <= msg;
        send_req <= '1';
      elsif done = '1' then
        send_req <= '0';
      end if;

    end if;
  end process;
end architecture;
