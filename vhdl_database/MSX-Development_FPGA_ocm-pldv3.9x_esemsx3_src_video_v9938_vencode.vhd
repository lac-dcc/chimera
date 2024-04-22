--
-- vencode.vhd
--   RGB to NTSC video encoder
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

entity vencode is
  port(
    -- VDP clock ... 21.477MHz
    clk21m  : in std_logic;
    reset   : in std_logic;

    -- Video Input
    videoR : in std_logic_vector( 5 downto 0);
    videoG : in std_logic_vector( 5 downto 0);
    videoB : in std_logic_vector( 5 downto 0);
    videoHS_n : in std_logic;
    videoVS_n : in std_logic;

    -- Video Output
    videoY    : out std_logic_vector( 5 downto 0);
    videoC    : out std_logic_vector( 5 downto 0);
    videoV    : out std_logic_vector( 5 downto 0)
    );
end vencode;

architecture rtl of vencode is

  signal seq    : std_logic_vector(2 downto 0);

  signal burphase : std_logic;
  signal vcounter : std_logic_vector(8 downto 0);
  signal hcounter : std_logic_vector(11 downto 0);
  signal window_v : std_logic;
  signal window_h : std_logic;
  signal window_c : std_logic;
  signal TableAdr : std_logic_vector(4 downto 0);
  signal TableDat : std_logic_vector(7 downto 0);
  signal palDetectCounter : std_logic_vector(8 downto 0);
  signal palMode : std_logic;

  signal ivideoR  : std_logic_vector(5 downto 0);
  signal ivideoG  : std_logic_vector(5 downto 0);
  signal ivideoB  : std_logic_vector(5 downto 0);

  signal Y  : std_logic_vector(7 downto 0);
  signal C  : std_logic_vector(7 downto 0);
  signal V  : std_logic_vector(7 downto 0);

  signal C0 : std_logic_vector(7 downto 0);
  signal Y1 : std_logic_vector(13 downto 0);
  signal Y2 : std_logic_vector(13 downto 0);
  signal Y3 : std_logic_vector(13 downto 0);
  signal U1 : std_logic_vector(13 downto 0);
  signal U2 : std_logic_vector(13 downto 0);
  signal U3 : std_logic_vector(13 downto 0);
  signal V1 : std_logic_vector(13 downto 0);
  signal V2 : std_logic_vector(13 downto 0);
  signal V3 : std_logic_vector(13 downto 0);
  signal W1 : std_logic_vector(13 downto 0);
  signal W2 : std_logic_vector(13 downto 0);
  signal W3 : std_logic_vector(13 downto 0);

  constant vref : std_logic_vector(7 downto 0) := X"3B";
  constant cent : std_logic_vector(7 downto 0) := X"80";

  type typTable is array (0 to 31) of std_logic_vector(7 downto 0);
  constant table : typTable :=(
    X"00", X"FA", X"0C", X"EE", X"18", X"E7", X"18", X"E7",
    X"18", X"E7", X"18", X"E7", X"18", X"E7", X"18", X"E7",
    X"18", X"E7", X"18", X"EE", X"0C", X"FA", X"00", X"00",
    X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00"
  );

begin

  --  Y = +0.299R +0.587G +0.114B
  -- +U = +0.615R -0.518G -0.097B (  0)
  -- +V = +0.179R -0.510G +0.331B ( 60)
  -- +W = -0.435R +0.007G +0.428B (120)
  -- -U = -0.615R +0.518G +0.097B (180)
  -- -V = -0.179R +0.510G -0.331B (240)
  -- -W = +0.435R -0.007G -0.428B (300)

  Y <= (('0' & Y1(11 downto 5)) + (('0' & Y2(11 downto 5)) + ('0' & Y3(11 downto 5))) + vref);

  V <= Y(7 downto 0) + C0(7 downto 0) when seq = "110" else --  +U
       Y(7 downto 0) + C0(7 downto 0) when seq = "101" else --  +V
       Y(7 downto 0) + C0(7 downto 0) when seq = "100" else --  +W
       Y(7 downto 0) - C0(7 downto 0) when seq = "010" else --  -U
       Y(7 downto 0) - C0(7 downto 0) when seq = "001" else --  -V
       Y(7 downto 0) - C0(7 downto 0);                      --  -W

  C <= cent          + C0(7 downto 0) when seq = "110" else --  +U
       cent          + C0(7 downto 0) when seq = "101" else --  +V
       cent          + C0(7 downto 0) when seq = "100" else --  +W
       cent          - C0(7 downto 0) when seq = "010" else --  -U
       cent          - C0(7 downto 0) when seq = "001" else --  -V
       cent          - C0(7 downto 0);                      --  -W


  C0 <= (X"00" + ('0' & U1(11 downto 5)) - ('0' & U2(11 downto 5)) - ('0' & U3(11 downto 5))) when seq(1) = '1' else
        (X"00" + ('0' & V1(11 downto 5)) - ('0' & V2(11 downto 5)) + ('0' & V3(11 downto 5))) when seq(0) = '1' else
        (X"00" - ('0' & W1(11 downto 5)) + ('0' & W2(11 downto 5)) + ('0' & W3(11 downto 5)));

  Y1 <= (X"18" * ivideoR);  -- hex(0.299*(2*0.714*256/3.3)*0.72*16) = $17.D
  Y2 <= (X"2F" * ivideoG);  -- hex(0.587*(2*0.714*256/3.3)*0.72*16) = $2E.D
  Y3 <= (X"09" * ivideoB);  -- hex(0.114*(2*0.714*256/3.3)*0.72*16) = $09.1

  U1 <= (X"32" * ivideoR);  -- hex(0.615*(2*0.714*256/3.3)*0.72*16) = $31.0
  U2 <= (X"29" * ivideoG);  -- hex(0.518*(2*0.714*256/3.3)*0.72*16) = $29.5
  U3 <= (X"08" * ivideoB);  -- hex(0.097*(2*0.714*256/3.3)*0.72*16) = $07.B

  V1 <= (X"0F" * ivideoR);  -- hex(0.179*(2*0.714*256/3.3)*0.72*16) = $0E.4
  V2 <= (X"28" * ivideoG);  -- hex(0.510*(2*0.714*256/3.3)*0.72*16) = $28.A
  V3 <= (X"1A" * ivideoB);  -- hex(0.331*(2*0.714*256/3.3)*0.72*16) = $1A.6

  W1 <= (X"24" * ivideoR);  -- hex(0.435*(2*0.714*256/3.3)*0.72*16) = $22.B
  W2 <= (X"01" * ivideoG);  -- hex(0.007*(2*0.714*256/3.3)*0.72*16) = $00.8
  W3 <= (X"22" * ivideoB);  -- hex(0.428*(2*0.714*256/3.3)*0.72*16) = $22.2

  process(clk21m)

    variable clkena     : std_logic;
    variable ivideoVS_n : std_logic;
    variable ivideoHS_n : std_logic;

  begin

    if (clk21m'event and clk21m = '1') then

      -- Clock phase : 3.58MHz(1fsc) = 21.48MHz(6fsc) / 6
      -- seq : (7) 654 (3) 210
      if ((videoHS_n = '0' and ivideoHS_n = '1')) then
        seq <= "110";
      elsif (seq(1 downto 0) = "00") then
        seq <= seq - 2;
      else
        seq <= seq - 1;
      end if;

      -- vertical counter : MSX_Y=0[vcounter=22h], MSX_Y=211[vcounter=F5h]
      if (videoVS_n = '1' and ivideoVS_n = '0') then
        vcounter <= (others => '0');
        burphase <= '0';
      elsif (videoHS_n = '0' and ivideoHS_n = '1') then
        vcounter <= vcounter + 1;
        burphase <= burphase xor (not hcounter(1)); -- hcounter:1364/1367
      end if;

      -- horizontal counter : MSX_X=0[hcounter=100h], MSX_X=511[hcounter=4FF]
      if (videoHS_n = '0' and ivideoHS_n = '1') then
        hcounter <= X"000";
      else
        hcounter <= hcounter + 1;
      end if;

      -- vertical display window
      if (vcounter = (X"22" - X"10" - 1)) then
        window_v <= '1';
      elsif ( ((vcounter = 262-7) and (palMode = '0')) or
              ((vcounter = 312-7) and (palMode = '1')) ) then
        -- JP: -7という数字にあまり根拠は無い。オリジナルのソースが
        -- JP:  vcounter = X"FF"
        -- JP: という条件判定をしていたのでそれを 262-7と表現し直した。
        -- JP: 恐らく、オリジナルのソースはカウンタが8ビットだっため、
        -- JP: 255が最大値だったのだろう。
        -- JP: 大中的には 262-3= 259くらいで良いと思う(ボトムボーダ領域は
        -- JP: 3ラインだから)
        window_v <= '0';
      end if;

      -- horizontal display window
      if (hcounter = (X"100" - X"030" - 1)) then
        window_h <= '1';
      elsif (hcounter = (X"4FF" + X"030" - 1)) then
        window_h <= '0';
      end if;

      -- color burst window
      if ((window_v = '0') or (hcounter = X"0CC")) then
        window_c <= '0';
      elsif (window_v = '1' and (hcounter = X"06C")) then
        window_c <= '1';
      end if;

        -- color burst table pointer
      if (window_c = '0') then
        TableAdr <= (others => '0');
      elsif (seq = "101" or seq = "001") then
        TableAdr <= TableAdr + 1;
      end if;
      TableDat <= table(conv_integer(TableAdr));

      -- video encode
      if ((videoVS_n xor videoHS_n) = '1') then
        videoY <= (others => '0');
        videoC <= cent(7 downto 2);
        videoV <= (others => '0');
      elsif (window_v = '1' and window_h = '1') then
        videoY <= Y(7 downto 2);
        videoC <= C(7 downto 2);
        videoV <= V(7 downto 2);
        if (hcounter(0) = '0') then
          ivideoR <= videoR;
          ivideoG <= videoG;
          ivideoB <= videoB;
        end if;
      else
        videoY <= vref(7 downto 2);
        if (seq(1 downto 0) = "10") then
          videoC <= cent(7 downto 2);
          videoV <= vref(7 downto 2);
        elsif (burphase = '1') then
          videoC <= cent(7 downto 2) + TableDat(7 downto 2);
          videoV <= vref(7 downto 2) + TableDat(7 downto 2);
        else
          videoC <= cent(7 downto 2) - TableDat(7 downto 2);
          videoV <= vref(7 downto 2) - TableDat(7 downto 2);
          end if;
      end if;

      -- PAL auto detection
      if (videoVS_n = '1' and ivideoVS_n = '0') then
        palDetectCounter <= (others => '0');
        if( palDetectCounter > 300 ) then
          palMode <= '1';
        else
          palMode <= '0';
        end if;
      elsif (videoHS_n = '0' and ivideoHS_n = '1') then
        palDetectCounter <= palDetectCounter + 1;
      end if;

      --
      ivideoVS_n := videoVS_n;
      ivideoHS_n := videoHS_n;

    end if;
  end process;

end rtl;
