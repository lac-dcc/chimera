--
--  ADC interface
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity zpuino_adc is
  generic (
    fifo_width_bits: integer := 16;
    upper_offset: integer := 15;
    lower_offset: integer := 4
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;

    sample:   in std_logic; -- External trigger

    -- GPIO SPI pins

    mosi:     out std_logic;
    miso:     in std_logic;
    sck:      out std_logic;
    seln:     out std_logic;
    enabled:  out std_logic

  );
end entity zpuino_adc;


architecture behave of zpuino_adc is

  component spi is
    port (
      clk:  in std_logic;
      rst:  in std_logic;
      din:  in std_logic_vector(31 downto 0);
      dout:  out std_logic_vector(31 downto 0);
      en:   in std_logic;
      ready: out std_logic;
      transfersize: in std_logic_vector(1 downto 0);
  
      miso: in std_logic;
      mosi: out std_logic;
  
      clk_en:    out std_logic;
  
      clkrise: in std_logic;
      clkfall: in std_logic;
      samprise:in std_logic
    );
  end component spi;

  component spiclkgen is
    port (
      clk:   in std_logic;
      rst:   in std_logic;
      en:    in std_logic;
      cpol:  in std_logic;
      pres:  in std_logic_vector(2 downto 0);
    
      clkrise: out std_logic;
      clkfall: out std_logic;
      spiclk:  out std_logic
  );
  end component spiclkgen;

  constant fifo_lower_bit: integer := fifo_width_bits/8;

  signal request_samples_q: unsigned(11-fifo_lower_bit downto 0); -- Maximum 4K samples
  signal current_sample_q: unsigned(11-fifo_lower_bit downto 0); -- Current sample

  signal read_fifo_ptr_q: unsigned(10 downto 2);

--  signal dly_interval_q: unsigned(31 downto 0); -- Additional clock delay between samples


  signal fifo_read: std_logic_vector(31 downto 0);
  signal fifo_read_address: std_logic_vector(10 downto 2);


  signal fifo_write_address: std_logic_vector(11-fifo_lower_bit downto 0);
  signal fifo_write: std_logic_vector(fifo_width_bits-1 downto 0);


  signal fifo_wr: std_logic;

  signal spi_dout: std_logic_vector(31 downto 0);
  signal spi_enable: std_logic;
  signal spi_ready: std_logic;
  signal spi_clk_en: std_logic;
  signal spi_clkrise: std_logic;
  signal spi_clkfall: std_logic;
  -- Configuration registers

  signal adc_enabled_q: std_logic;
  signal adc_source_external_q: std_logic;

  signal run_spi: std_logic;
  signal do_sample: std_logic;

begin

  enabled <= adc_enabled_q;
  wb_ack_o <= wb_cyc_i and wb_stb_i;
  wb_inta_o <= '0';


  process(spi_enable,spi_ready)
  begin
    seln<='1';
    if spi_enable='1' or spi_ready='0' then
      seln<='0';
    end if;
  end process;

  adcspi: spi
    port map (
      clk           => wb_clk_i,
      rst           => wb_rst_i,
      din           => (others => '0'), -- Change to channel number
      dout          => spi_dout,
      en            => spi_enable,
      ready         => spi_ready,
      transfersize  => "01", -- Fixed 16-bit transfers
  
      miso          => miso,
      mosi          => mosi,
  
      clk_en        => spi_clk_en,
      clkrise       => spi_clkrise,
      clkfall       => spi_clkfall,
      samprise      => '1'
    );

  acdclkgen: spiclkgen
    port map (
      clk     => wb_clk_i,
      rst     => wb_rst_i,
      en      => spi_clk_en,
      cpol    => '1',
      pres    => "010", -- Fixed
    
      clkrise => spi_clkrise,
      clkfall => spi_clkfall,
      spiclk  => sck
  );

  process (wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        read_fifo_ptr_q <= (others => '0');
      else

        if wb_we_i='1' and wb_adr_i(4 downto 2)="100" then
          read_fifo_ptr_q <= unsigned(wb_dat_i(10 downto 2));
        else
          if wb_cyc_i='1' and wb_we_i='0' and wb_stb_i='1' and wb_adr_i(4 downto 2)="101" then
            -- FIFO wb_dat_o, increment wb_adr_i
            read_fifo_ptr_q <= read_fifo_ptr_q+1;
          end if;
        end if;
      end if;
    end if;
  end process;


  -- READ muxer
  process(wb_adr_i,fifo_read,request_samples_q,current_sample_q)
  begin
    wb_dat_o <= (others => DontCareValue);
    case wb_adr_i(4 downto 2) is
      when "000" =>
        if (request_samples_q /= current_sample_q) then
          wb_dat_o(0) <= '0';
        else
          wb_dat_o(0) <= '1';
        end if;
      when "101" =>
        wb_dat_o <= fifo_read;
      when others =>
    end case;
  end process;

  fifo_write_address <= std_logic_vector(current_sample_q);
  fifo_read_address <= std_logic_vector(read_fifo_ptr_q);

  process(spi_dout)
  begin
    fifo_write <= (others => '0');
    fifo_write(upper_offset-lower_offset downto 0) <= spi_dout(upper_offset downto lower_offset); -- Data from SPI
  end process;

  ram8: if fifo_width_bits=8 generate

  ram: RAMB16_S9_S36
    port map (
      DOA  => open,
      DOB  => fifo_read,
      DOPA => open,
      DOPB => open,
      ADDRA => fifo_write_address,
      ADDRB => fifo_read_address,
      CLKA  => wb_clk_i,
      CLKB  => wb_clk_i,
      DIA   => fifo_write,
      DIB   => (others => '0'),
      DIPA  => (others => '0'),
      DIPB  => (others => '0'),
      ENA   => '1',
      ENB   => '1',
      SSRA  => '0',
      SSRB  => '0',
      WEA   => fifo_wr,
      WEB   => '0'
    );
  end generate;

  ram16: if fifo_width_bits=16 generate

  ram: RAMB16_S18_S36
    port map (
      DOA  => open,
      DOB  => fifo_read,
      DOPA => open,
      DOPB => open,
      ADDRA => fifo_write_address,
      ADDRB => fifo_read_address,
      CLKA  => wb_clk_i,
      CLKB  => wb_clk_i,
      DIA   => fifo_write,
      DIB   => (others => '0'),
      DIPA  => (others => '0'),
      DIPB  => (others => '0'),
      ENA   => '1',
      ENB   => '1',
      SSRA  => '0',
      SSRB  => '0',
      WEA   => fifo_wr,
      WEB   => '0'
    );
  end generate;


  spi_enable <= '1' when run_spi='1' and spi_ready='1' and do_sample='1' else '0';
  do_sample <= sample when adc_source_external_q='1' else '1';

  -- Main process
  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        request_samples_q <= (others => '0');
        current_sample_q <= (others => '0');
        run_spi <= '0';
        fifo_wr <= '0';
        adc_source_external_q <= '0';
        adc_enabled_q<='0';
      else

        fifo_wr <= '0';

        if wb_we_i='1' then
          case wb_adr_i(4 downto 2) is
            when "000" =>
              -- Write configuration
              adc_enabled_q <= wb_dat_i(0);
              adc_source_external_q <= wb_dat_i(1);
            when "001" =>
              -- Write request samples
              request_samples_q <= unsigned(wb_dat_i(11-fifo_lower_bit downto 0));
              current_sample_q <= (others => '1'); -- WARNING - this will overwrite last value on RAM
              run_spi <= '1';
            when others =>
          end case;
        else
          -- Normal run.
          if (request_samples_q /= current_sample_q) then
            -- Sampling right now.
              if spi_ready='1' then
                -- Add delay here.
                if do_sample='1' then
                  fifo_wr <= '1';
                  run_spi <= '1';
                end if;
              end if;
          else
            run_spi <= '0';
          end if;
          if fifo_wr='1' then
            current_sample_q <= current_sample_q + 1;
          end if;
        end if;
      end if;
    end if;
  end process;
end behave;

