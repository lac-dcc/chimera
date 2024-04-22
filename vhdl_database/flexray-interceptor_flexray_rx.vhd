library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.flexray;

entity flexray_rx is
  port (
    clk   : in  std_ulogic;             -- Clock 8x higher than can bitrate
    rst   : in  std_ulogic;
    rx    : in  std_ulogic;
    msg   : out work.flexray.message;
    ready : out std_ulogic);
end entity flexray_rx;


architecture syn of flexray_rx is
begin

  decode : process (clk, rst)
    variable rx_prev      : std_ulogic;
    variable tick_counter : integer range 0 to 7;
    variable idle_counter : integer range 0 to 200;
    variable in_progress  : std_ulogic;
    variable in_tss       : std_ulogic;
    variable in_fss       : std_ulogic;
    variable in_frame     : std_ulogic;
    variable in_bss       : std_ulogic;

    variable bit_counter      : integer;  -- TODO: put range on this
    variable real_bit_counter : integer;  -- TODO: put range on this

    variable tmp_msg : work.flexray.message;

    variable computed_header_crc : std_ulogic_vector(10 downto 0);
    variable computed_crc        : std_ulogic_vector(23 downto 0);
    variable num_bits            : integer range 0 to 2039;

  begin
    if rst = '1' then
      rx_prev          := '1';
      in_progress      := '0';
      bit_counter      := 0;
      tick_counter     := 0;
      idle_counter     := 200;
      in_tss           := '0';
      in_fss           := '0';
      in_frame         := '0';
      in_bss           := '0';
      real_bit_counter := 0;

      computed_header_crc := (others => '0');
      computed_crc        := (others => '0');

      tmp_msg.flags          := (others => '0');
      tmp_msg.frame_id       := (others => '0');
      tmp_msg.payload_length := (others => '0');
      tmp_msg.header_crc     := (others => '0');
      tmp_msg.cycle_count    := (others => '0');
      tmp_msg.data           := (others => (others => '0'));
      tmp_msg.crc            := (others => '0');

    elsif rising_edge(clk) then
      num_bits := to_integer(unsigned(tmp_msg.payload_length)) * 16;

      -- Update tick counter
      if tick_counter = 7 then
        tick_counter := 0;
      else
        tick_counter := tick_counter + 1;
      end if;

      -- Sync on first falling edge
      if rx = '0' and rx_prev = '1' and in_progress = '0' then
        tick_counter := 0;
      end if;

      -- Sync on Frame Start Sequence
      if rx = '1' and rx_prev = '0' and in_tss = '1' then
        tick_counter := 0;
      end if;


      -- Sample at 50%
      if tick_counter = 3 then
        -- Signal is idle, increase idle counter
        if rx = '1' and idle_counter < 200 then
          idle_counter := idle_counter + 1;
        end if;

        -- Reset if idle
        if idle_counter = 200 then
          in_progress      := '0';
          bit_counter      := 0;
          real_bit_counter := 0;
          in_tss           := '0';
          in_fss           := '0';
          in_frame         := '0';
          in_bss           := '0';
        end if;

        -- Signal is not idle, set in progress
        if rx = '0' then
          -- First bit
          if in_progress = '0' then
            ready  <= '0';
            in_tss := '1';
          end if;

          in_progress  := '1';
          idle_counter := 0;
        end if;

        if in_progress = '1' then

          if in_fss = '1' then
            -- TODO Assert that rx is 1
            in_fss   := '0';
            in_frame := '1';

            -- Clear tmp_message
            tmp_msg.flags          := (others => '0');
            tmp_msg.frame_id       := (others => '0');
            tmp_msg.payload_length := (others => '0');
            tmp_msg.header_crc     := (others => '0');
            tmp_msg.cycle_count    := (others => '0');
            tmp_msg.data           := (others => (others => '0'));
            tmp_msg.crc            := (others => '0');

            computed_header_crc := b"00000011010";
            computed_crc        := b"111111101101110010111010";

            bit_counter      := 0;
            real_bit_counter := 0;
          end if;

          -- TSS is done, we go into FSS
          if rx = '1' and in_tss = '1' then
            in_tss := '0';
            in_fss := '1';
          end if;

          -- Handle BSS
          if in_tss = '0' and in_fss = '0' then
            if (bit_counter mod 10 = 0) then
              -- TODO check if 1
              in_bss := '1';
            elsif (bit_counter mod 10 = 1) then
              -- TODO check if 0
              in_bss := '1';
            else
              in_bss := '0';
            end if;
          else
            in_bss := '0';
          end if;

          if in_frame = '1' then
            bit_counter := bit_counter + 1;
          end if;

          -- Update header CRC
          if in_tss = '0' and in_bss = '0' and real_bit_counter >= 3 and real_bit_counter <= 22 then
            if (rx xor computed_header_crc(10)) = '1' then
              computed_header_crc := (computed_header_crc(9 downto 0) & '0') xor b"01110000101";
            else
              computed_header_crc := (computed_header_crc(9 downto 0) & '0');
            end if;
          end if;

          -- Update CRC
          if in_tss = '0' and in_bss = '0' and real_bit_counter >= 0 and real_bit_counter <= 40 + num_bits - 1 then
            if (rx xor computed_crc(23)) = '1' then
              computed_crc := (computed_crc(22 downto 0) & '0') xor b"010111010110110111001011";
            else
              computed_crc := (computed_crc(22 downto 0) & '0');
            end if;
          end if;

          if in_bss = '0' and in_tss = '0' and in_fss = '0' then

            if real_bit_counter >= 0 and real_bit_counter <= 4 then
              tmp_msg.flags(tmp_msg.flags'left - (real_bit_counter - 0)) := rx;
            elsif real_bit_counter >= 5 and real_bit_counter <= 15 then
              tmp_msg.frame_id(tmp_msg.frame_id'left - (real_bit_counter - 5)) := rx;
            elsif real_bit_counter >= 16 and real_bit_counter <= 22 then
              tmp_msg.payload_length(tmp_msg.payload_length'left - (real_bit_counter - 16)) := rx;
            elsif real_bit_counter >= 23 and real_bit_counter <= 33 then
              tmp_msg.header_crc(tmp_msg.header_crc'left - (real_bit_counter - 23)) := rx;
            elsif real_bit_counter >= 34 and real_bit_counter <= 39 then
              tmp_msg.cycle_count(tmp_msg.cycle_count'left - (real_bit_counter - 34)) := rx;
            elsif real_bit_counter >= 40 and real_bit_counter <= 40 + num_bits - 1 then
              tmp_msg.data((real_bit_counter - 40) / 8)(7 - (real_bit_counter - 40) mod 8) := rx;
            elsif real_bit_counter >= 40 + num_bits and real_bit_counter <= 63 + num_bits then
              tmp_msg.crc(tmp_msg.crc'left - (real_bit_counter - 40 - num_bits)) := rx;
            elsif real_bit_counter >= 64 + num_bits and computed_crc = tmp_msg.crc then
              ready        <= '1';
              msg          <= tmp_msg;
              idle_counter := 200;
            end if;

            real_bit_counter := real_bit_counter + 1;
          end if;
        end if;

      end if;

      rx_prev := rx;
    end if;
  end process;
end architecture syn;
