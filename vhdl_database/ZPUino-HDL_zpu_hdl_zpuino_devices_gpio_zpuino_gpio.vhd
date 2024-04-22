--
--  GPIO for ZPUINO
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all; 

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;

entity zpuino_gpio is
  generic (
    gpio_count: integer := 32
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
    id:       out slot_id;

    spp_data: in std_logic_vector(PPSCOUNT_OUT-1 downto 0);
    spp_read: out std_logic_vector(PPSCOUNT_IN-1 downto 0);

    gpio_o:   out std_logic_vector(gpio_count-1 downto 0);
    gpio_t:   out std_logic_vector(gpio_count-1 downto 0);
    gpio_i:   in std_logic_vector(gpio_count-1 downto 0);

    spp_cap_in:  in std_logic_vector(gpio_count-1 downto 0); -- SPP capable pin for INPUT
    spp_cap_out:  in std_logic_vector(gpio_count-1 downto 0) -- SPP capable pin for OUTPUT
  );
end entity zpuino_gpio;


architecture behave of zpuino_gpio is

signal gpio_q:        std_logic_vector(127 downto 0); -- GPIO output data FFs
signal gpio_tris_q:   std_logic_vector(127 downto 0); -- Tristate FFs
signal ppspin_q:      std_logic_vector(127 downto 0); -- SPP pin mode FFs

subtype input_number is integer range 0 to 127;
type mapper_q_type is array(0 to 127) of input_number;

signal input_mapper_q:  mapper_q_type; -- Mapper for output pins (input data)
signal output_mapper_q: mapper_q_type; -- Mapper for input pins (output data)

signal gpio_r_i:        std_logic_vector(127 downto 0);
signal gpio_tris_r_i:   std_logic_vector(127 downto 0);
signal gpio_i_q:        std_logic_vector(127 downto 0);
signal gpio_inten_q:    std_logic_vector(127 downto 0); -- Interrupt enable
signal gpio_intline_q:  input_number; -- Interrupt line
signal gpio_int_q:      std_logic; -- Interrupt being processed
begin

id <= x"08" & x"12"; -- Vendor: ZPUino  Device: GPIO

wb_ack_o <= wb_cyc_i and wb_stb_i;
wb_inta_o <= '0';

gpio_t <= gpio_tris_q(gpio_count-1 downto 0);


 -- Generate muxers for output.

tgen: for i in 0 to gpio_count-1 generate
  process( wb_clk_i )
  begin

    if rising_edge(wb_clk_i) then -- synchronous output
      -- Enforce RST on gpio_o
      if wb_rst_i='1' then
        gpio_o(i)<='1';
      else
        if ppspin_q(i)='1' and spp_cap_out(i)='1' then
          gpio_o(i) <= spp_data( input_mapper_q(i));
        else
          gpio_o(i) <= gpio_q(i);
        end if;
      end if;
    end if;
  end process;
end generate;

-- Generate muxers for input

spprgen: for i in 0 to gpio_count-1 generate

  gpio_i_q(i) <= gpio_i(i) when spp_cap_in(i)='1' else DontCareValue;

end generate;


spprgen2: for i in 0 to PPSCOUNT_IN-1 generate

  process( gpio_i_q(i), output_mapper_q(i) )
  begin
    if i<PPSCOUNT_IN then
      spp_read(i) <= gpio_i_q( output_mapper_q(i) );
    end if;
  end process;

end generate;


ilink1: for i in 0 to gpio_count-1 generate
  gpio_r_i(i) <= gpio_i(i);
  gpio_tris_r_i(i) <= gpio_tris_q(i);
end generate;

ilink2: for i in gpio_count to 127 generate
  gpio_r_i(i) <= DontCareValue;
  gpio_tris_r_i(i) <= DontCareValue;
end generate;


process(wb_adr_i,gpio_r_i,gpio_tris_r_i,ppspin_q)
begin
  case wb_adr_i(6 downto 4) is
    when "000" =>

      case wb_adr_i(3 downto 2) is
        when "00" =>
          wb_dat_o <= gpio_r_i(31 downto 0);  
        when "01" =>
          wb_dat_o <= gpio_r_i(63 downto 32);
        when "10" =>
          wb_dat_o <= gpio_r_i(95 downto 64);
        when "11" =>
          wb_dat_o <= gpio_r_i(127 downto 96);
        when others =>
      end case;

    when "001" =>
      case wb_adr_i(3 downto 2) is
        when "00" =>
          wb_dat_o <= gpio_tris_r_i(31 downto 0);
        when "01" =>
          wb_dat_o <= gpio_tris_r_i(63 downto 32);
        when "10" =>
          wb_dat_o <= gpio_tris_r_i(95 downto 64);
        when "11" =>
          wb_dat_o <= gpio_tris_r_i(127 downto 96);
        when others =>
      end case;

    when "010" =>
      case wb_adr_i(3 downto 2) is
        when "00" =>
          wb_dat_o <= ppspin_q(31 downto 0);
        when "01" =>
          wb_dat_o <= ppspin_q(63 downto 32);
        when "10" =>
          wb_dat_o <= ppspin_q(95 downto 64);
        when "11" =>
          wb_dat_o <= ppspin_q(127 downto 96);
        when others =>
      end case;

    when "011" =>
      case wb_adr_i(3 downto 2) is
        when "00" =>
          wb_dat_o <= gpio_inten_q(31 downto 0);
        when "01" =>
          wb_dat_o <= gpio_inten_q(63 downto 32);
        when "10" =>
          wb_dat_o <= gpio_inten_q(95 downto 64);
        when "11" =>
          wb_dat_o <= gpio_inten_q(127 downto 96);
        when others =>
      end case;

    when "100" =>
      case wb_adr_i(3 downto 2) is
        when "00" =>
          wb_dat_o <= std_logic_vector(to_unsigned(gpio_intline_q,32));
        when others =>
          wb_dat_o <= (others => DontCareValue);
      end case;

    when others =>
      wb_dat_o <= (others => DontCareValue);
  end case;
end process;

process(wb_clk_i)
begin
  if rising_edge(wb_clk_i) then
    if wb_rst_i='1' then
      gpio_tris_q <= (others => '1');
      ppspin_q <= (others => '0');
      gpio_inten_q <= (others => '0');
      gpio_q <= (others => DontCareValue);
      -- Default values for input/output mapper
      --for i in 0 to 127 loop
      --  input_mapper_q(i) <= 0;
      --  output_mapper_q(i) <= 0;
      --end loop;
    elsif wb_stb_i='1' and wb_cyc_i='1' and wb_we_i='1' then
      case wb_adr_i(10 downto 9) is
        when "00" =>
          case wb_adr_i(6 downto 4) is
            when "000" =>
              case wb_adr_i(3 downto 2) is
                when "00" =>
                  gpio_q(31 downto 0) <= wb_dat_i;
                when "01" =>
                  gpio_q(63 downto 32) <= wb_dat_i;
                when "10" =>
                  gpio_q(95 downto 64) <= wb_dat_i;
                when "11" =>
                  gpio_q(127 downto 96) <= wb_dat_i;
                when others =>
              end case;
            when "001" =>
              case wb_adr_i(3 downto 2) is
                when "00" =>
                  gpio_tris_q(31 downto 0) <= wb_dat_i;
                when "01" =>
                  gpio_tris_q(63 downto 32) <= wb_dat_i;
                when "10" =>
                  gpio_tris_q(95 downto 64) <= wb_dat_i;
                when "11" =>
                  gpio_tris_q(127 downto 96) <= wb_dat_i;
                when others =>
              end case;
            when "010" =>
              if zpuino_pps_enabled then
                case wb_adr_i(3 downto 2) is
                  when "00" =>
                    ppspin_q(31 downto 0) <= wb_dat_i;
                  when "01" =>
                    ppspin_q(63 downto 32) <= wb_dat_i;
                  when "10" =>
                    ppspin_q(95 downto 64) <= wb_dat_i;
                  when "11" =>
                    ppspin_q(127 downto 96) <= wb_dat_i;
                  when others =>
                end case;
              end if;
				when "100" =>		-- set bits
              case wb_adr_i(3 downto 2) is
                when "00" =>
                  gpio_q(31 downto 0) <= gpio_q(31 downto 0) or wb_dat_i;
                when "01" =>
                  gpio_q(63 downto 32) <= gpio_q(63 downto 32) or wb_dat_i;
                when "10" =>
                  gpio_q(95 downto 64) <= gpio_q(95 downto 64) or wb_dat_i;
                when "11" =>
                  gpio_q(127 downto 96) <= gpio_q(127 downto 96) or wb_dat_i;
                when others =>
              end case;				
				when "101" =>		-- clear bits
              case wb_adr_i(3 downto 2) is
                when "00" =>
                  gpio_q(31 downto 0) <= gpio_q(31 downto 0) and not wb_dat_i;
                when "01" =>
                  gpio_q(63 downto 32) <= gpio_q(63 downto 32) and not wb_dat_i;
                when "10" =>
                  gpio_q(95 downto 64) <= gpio_q(95 downto 64) and not wb_dat_i;
                when "11" =>
                  gpio_q(127 downto 96) <= gpio_q(127 downto 96) and not wb_dat_i;
                when others =>
              end case;						
				when "110" =>		-- toggle bits
              case wb_adr_i(3 downto 2) is
                when "00" =>
                  gpio_q(31 downto 0) <= gpio_q(31 downto 0) xor wb_dat_i;
                when "01" =>
                  gpio_q(63 downto 32) <= gpio_q(63 downto 32) xor wb_dat_i;
                when "10" =>
                  gpio_q(95 downto 64) <= gpio_q(95 downto 64) xor wb_dat_i;
                when "11" =>
                  gpio_q(127 downto 96) <= gpio_q(127 downto 96) xor wb_dat_i;
                when others =>
              end case;							  
            when others =>

          end case;
        when "01" =>
          if zpuino_pps_enabled then
            input_mapper_q( conv_integer(wb_adr_i(8 downto 2)) ) <= conv_integer(wb_dat_i(6 downto 0));
          end if;
        when "10" =>
          if zpuino_pps_enabled then
            output_mapper_q( conv_integer(wb_adr_i(8 downto 2)) ) <= conv_integer(wb_dat_i(6 downto 0));
          end if;
        when others =>
      end case;
    end if;
  end if;
end process;

end behave;

