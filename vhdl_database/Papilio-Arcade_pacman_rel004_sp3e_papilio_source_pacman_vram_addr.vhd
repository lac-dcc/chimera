--
-- A simulation model of Pacman hardware
-- Copyright (c) MikeJ & CarlW - January 2006
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- You are responsible for any legal issues arising from your use of this code.
--
-- The latest version of this file can be found at: www.fpgaarcade.com
--
-- Email pacman@fpgaarcade.com
--
-- Revision list
--
-- version 003 Jan 2006 release, general tidy up
-- version 001 initial release
--
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

use work.pkg_pacman.all;

entity X74_157 is
  port (
    Y       : out   std_logic_vector (3 downto 0);
    B       : in    std_logic_vector (3 downto 0);
    A       : in    std_logic_vector (3 downto 0);
    G       : in    std_logic;
    S       : in    std_logic
    );
end;

architecture RTL of X74_157 is
begin
  p_y_comb      : process(S,G,A,B)
  begin
    for i in 0 to 3 loop
    -- quad 2 line to 1 line mux (true logic)
      if (G = '1') then
        Y(i) <= '0';
      else
        if (S = '0') then
          Y(i) <= A(i);
        else
          Y(i) <= B(i);
        end if;
      end if;
    end loop;
  end process;
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;

use work.pkg_pacman.all;

entity X74_257 is
  port (
    Y       : out   std_logic_vector (3 downto 0);
    B       : in    std_logic_vector (3 downto 0);
    A       : in    std_logic_vector (3 downto 0);
    S       : in    std_logic
    );
end;

architecture RTL of X74_257 is
signal ab   : std_logic_vector (3 downto 0);
begin

  Y <= ab; -- no tristate
  p_ab     : process(S,A,B)
  begin
    for i in 0 to 3 loop
      if (S = '0') then
        AB(i) <= A(i);
      else
        AB(i) <= B(i);
      end if;
    end loop;
  end process;
end RTL;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

use work.pkg_pacman.all;

entity PACMAN_VRAM_ADDR is
  port (
    AB      : out   std_logic_vector (11 downto 0);
    H256_L  : in    std_logic;
    H128    : in    std_logic;
    H64     : in    std_logic;
    H32     : in    std_logic;
    H16     : in    std_logic;
    H8      : in    std_logic;
    H4      : in    std_logic;
    H2      : in    std_logic;
    H1      : in    std_logic;
    V128    : in    std_logic;
    V64     : in    std_logic;
    V32     : in    std_logic;
    V16     : in    std_logic;
    V8      : in    std_logic;
    V4      : in    std_logic;
    V2      : in    std_logic;
    V1      : in    std_logic;
    FLIP    : in    std_logic
    );
end;

architecture RTL of PACMAN_VRAM_ADDR is

signal v128p        : std_logic;
signal v64p         : std_logic;
signal v32p         : std_logic;
signal v16p         : std_logic;
signal v8p          : std_logic;
signal h128p        : std_logic;
signal h64p         : std_logic;
signal h32p         : std_logic;
signal h16p         : std_logic;
signal h8p          : std_logic;
signal sel          : std_logic;
signal y157         : std_logic_vector (11 downto 0);

component X74_157
  port (
    Y       : out   std_logic_vector (3 downto 0);
    B       : in    std_logic_vector (3 downto 0);
    A       : in    std_logic_vector (3 downto 0);
    G       : in    std_logic;
    S       : in    std_logic
    );
end component;

component X74_257
  port (
    Y       : out   std_logic_vector (3 downto 0);
    B       : in    std_logic_vector (3 downto 0);
    A       : in    std_logic_vector (3 downto 0);
    S       : in    std_logic
    );
end component;

begin
  p_vp_comb : process(FLIP, V8, V16, V32, V64, V128)
  begin
    v128p   <= FLIP xor V128;
    v64p    <= FLIP xor V64;
    v32p    <= FLIP xor V32;
    v16p    <= FLIP xor V16;
    v8p     <= FLIP xor V8;
  end process;

  p_hp_comb : process(FLIP, H8, H16, H32, H64, H128)
  begin
    H128P   <= FLIP xor H128;
    H64P    <= FLIP xor H64;
    H32P    <= FLIP xor H32;
    H16P    <= FLIP xor H16;
    H8P     <= FLIP xor H8;
  end process;

  p_sel     : process(H16, H32, H64)
  begin
    sel  <= not((H32 xor H16) or (H32 xor H64));
  end process;

  --p_oe257   : process(H2)
  --begin
  --  oe   <= not(H2);
  --end process;

  U6        : X74_157
    port map(
      Y       => y157(11 downto 8),
      B(3)    => '0',
      B(2)    => H4,
      B(1)    => h64p,
      B(0)    => h64p,
      A       => "1111",
      G       => '0',
      S       => sel
      );

  U5        : X74_157
    port map(
      Y       => y157(7 downto 4),
      B(3)    => h64p,
      B(2)    => h64p,
      B(1)    => h8p,
      B(0)    => v128p,
      A       => "1111",
      G       => '0',
      S       => sel
      );

  U4        : X74_157
    port map(
      Y       => y157(3 downto 0),
      B(3)    => v64p,
      B(2)    => v32p,
      B(1)    => v16p,
      B(0)    => v8p,
      A(3)    => H64,
      A(2)    => H32,
      A(1)    => H16,
      A(0)    => H4,
      G       => '0',
      S       => sel
      );

  U3        : X74_257
    port map(
      Y       => AB(11 downto 8),
      B(3)    => '0',
      B(2)    => H4,
      B(1)    => v128p,
      B(0)    => v64p,
      A       => y157(11 downto 8),
      S       => H256_L
      );

  U2        : X74_257
    port map(
      Y       => AB(7 downto 4),
      B(3)    => v32p,
      B(2)    => v16p,
      B(1)    => v8p,
      B(0)    => h128p,
      A       => y157(7 downto 4),
      S       => H256_L
      );

  U1        : X74_257
    port map(
      Y       => AB(3 downto 0),
      B(3)    => h64p,
      B(2)    => h32p,
      B(1)    => h16p,
      B(0)    => h8p,
      A       => y157(3 downto 0),
      S       => H256_L
      );

end RTL;
