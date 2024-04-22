--
-- esepwm.vhd
--   Filtered Pulse Wave Modulation D/A Conveter
--   Revision 1.00
--
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity esepwm is
  generic (
    MSBI : integer
  );
  port (
    clk     : in std_logic;
    reset   : in std_logic;
    DACin   : in std_logic_vector(MSBI downto 0);
    DACout  : out std_logic
  );
end esepwm;

architecture RTL of esepwm is

  component esefir5
    generic (
      MSBI : integer
    );
    port (
      clk    : in std_logic;
      reset  : in std_logic;
      wavin  : in std_logic_vector ( MSBI downto 0 );
      wavout : out std_logic_vector ( MSBI downto 0 )
    );
  end component;

  signal FIRout : std_logic_vector( MSBI downto 0 );

begin

  U1: esefir5 generic map ( MSBI ) port map (clk, reset, DACin, FIRout);

  process (clk, reset)

    variable Acu : std_logic_vector(FIRout'high+1 downto 0);

  begin

    if reset = '1' then

      Acu := (others=>'0');
      DACout <= '0';

    elsif clk'event and clk = '1' then

      Acu := ("0"&Acu(Acu'high-1 downto 0)) + ("0"&FIRout);
      DACout <= Acu(Acu'high);

    end if;

  end process;

end RTL;
