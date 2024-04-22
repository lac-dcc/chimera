library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity can_rx is
  port (
    clk   : in  std_ulogic;             -- Clock 8x higher than can bitrate
    rst   : in  std_ulogic;
    rx    : in  std_ulogic;
    debug : out std_ulogic;

    tx    : out std_ulogic;
    msg   : out work.can.message;
    ready : out std_ulogic);
end entity can_rx;


architecture syn of can_rx is
begin

  decode : process (clk, rst)
    variable tick_counter : integer range 0 to 7;
    variable rx_prev      : std_ulogic;

    variable idle_counter : integer range 0 to 6;

    variable same_counter : integer range 0 to 5;
    variable is_stuffed   : std_ulogic;

    variable prev_bit    : std_ulogic;
    variable bit_counter : integer range 0 to 255;

    variable msg_tmp     : work.can.message;
    variable num_bits    : integer range 0 to 255;
    variable in_progress : std_ulogic;

    variable msg_crc      : std_ulogic_vector(14 downto 0);
    variable computed_crc : std_ulogic_vector(14 downto 0);
  begin
    if rst = '1' then
      rx_prev     := '1';
      msg_tmp.id  := (others => '0');
      msg_tmp.len := (others => '0');
      msg_tmp.dat := (others => '0');

      -- Output signals
      tx      <= '1';
      ready   <= '0';
      msg.id  <= (others => '0');
      msg.len <= (others => '0');
      msg.dat <= (others => '0');

      in_progress  := '0';
      idle_counter := 6;
      bit_counter  := 0;

    elsif rising_edge(clk) then
      num_bits := to_integer(unsigned(msg_tmp.len)) * 8;

      -- Update tick counter
      if tick_counter = 7 then
        tick_counter := 0;
      else
        tick_counter := tick_counter + 1;
      end if;

      -- Reset tick counter on falling edge of rx
      if rx = '0' and rx_prev = '1' then
        tick_counter := 0;
      end if;


      -- Send ack
      if (bit_counter = 35 + num_bits and tick_counter < 4)
        or (bit_counter = 36 + num_bits and tick_counter >= 4)
      then
        tx <= '0';
      else
        tx <= '1';
      end if;

      -- Sample rx at 50%
      if tick_counter = 3 then
        debug <= '1';

        -- Signal is idle, increase idle counter
        if rx = '1' and idle_counter < 6 then
          idle_counter := idle_counter + 1;
        end if;

        -- Reset if idle
        if idle_counter = 6 then
          in_progress  := '0';
          bit_counter  := 0;
        end if;

        -- Signal is not idle, set in progress
        if rx = '0' then
          -- First bit
          if in_progress = '0' then
            ready        <= '0';
            same_counter := 0;

            msg_crc      := "000000000000000";
            computed_crc := "000000000000000";
          end if;

          in_progress  := '1';
          idle_counter := 0;
        end if;

        -- Handle bit stuffing
        if same_counter = 5 then
          is_stuffed := '1';
          same_counter := 0;
        else
          is_stuffed := '0';
        end if;

        if rx = prev_bit then
          if same_counter < 5 then
            same_counter := same_counter + 1;
          end if;
        else
          same_counter := 1;
        end if;

        if is_stuffed = '0' then
          -- update CRC
          if (bit_counter = 19 and rx = '1') or bit_counter < 19 + num_bits then
            if (rx xor computed_crc(14)) = '1' then
              computed_crc := (computed_crc(13 downto 0) & '0') xor b"100010110011001";
            else
              computed_crc := (computed_crc(13 downto 0) & '0');
            end if;
          end if;

          -- ID
          if bit_counter >= 1 and bit_counter <= 11 then
            msg_tmp.id(10 - (bit_counter - 1)) := rx;
          -- LEN
          elsif bit_counter >= 15 and bit_counter <= 18 then
            msg_tmp.len(3 - (bit_counter - 15)) := rx;
          -- DATA
          elsif bit_counter >= 19 and bit_counter < 19 + num_bits then
            msg_tmp.dat(63 - (bit_counter - 19)) := rx;
          -- CRC
          elsif bit_counter >= 19 + num_bits and bit_counter <= 33 + num_bits then
            msg_crc(14 - (bit_counter - 19 - num_bits)) := rx;
          -- Done
          elsif bit_counter >= 34 + num_bits and bit_counter <= 40 + num_bits then
            idle_counter := 0;
            same_counter := 0;
          elsif bit_counter = 41 + num_bits and computed_crc = msg_crc then
            msg   <= msg_tmp;
            ready <= '1';

            -- Reset for next message
            in_progress  := '0';
            bit_counter  := 0;
            msg_crc      := "000000000000000";
            computed_crc := "000000000000000";
          end if;

          bit_counter := bit_counter + 1;
        end if;

        prev_bit := rx;
      end if;

      rx_prev := rx;
    end if;
  end process;
end architecture syn;
