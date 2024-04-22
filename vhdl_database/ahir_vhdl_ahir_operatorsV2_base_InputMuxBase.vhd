------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity InputMuxBase is
  generic (name: string; iwidth: integer := 10;
	   owidth: integer := 10;
	   twidth: integer := 3;
	   nreqs: integer := 1;
	   no_arbitration: Boolean := false;
	   registered_output: Boolean := true);
  port (
    -- req/ack follow pulse protocol
    reqL                 : in  BooleanArray(nreqs-1 downto 0);
    ackL                 : out BooleanArray(nreqs-1 downto 0);
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- output side req/ack level protocol
    reqR                 : out std_logic;
    ackR                 : in  std_logic;
    dataR                : out std_logic_vector(owidth-1 downto 0);
    -- tag specifies the requester index 
    tagR                : out std_logic_vector(twidth-1 downto 0);
    clk, reset          : in std_logic);
end InputMuxBase;


architecture Behave of InputMuxBase is

  signal reqP,ackP,fEN : std_logic_vector(nreqs-1 downto 0);

  type WordArray is array (natural range <>) of std_logic_vector(owidth-1 downto 0);
  signal dataP : WordArray(nreqs-1 downto 0);

  constant tag0 : std_logic_vector(twidth-1 downto 0) := (others => '0');

  -- one-cycle delay between req and ack => in order to break long
  -- combinational (false) paths.
  constant suppress_immediate_ack : BooleanArray(reqL'length-1 downto 0) := (others => true);

  -- intermediate signals.
  signal reqR_sig                : std_logic;
  signal ackR_sig                : std_logic;
  signal dataR_sig               : std_logic_vector(owidth-1 downto 0);
  signal tagR_sig                : std_logic_vector(twidth-1 downto 0);
  signal fair_reqP, fair_ackP    : std_logic_vector(nreqs-1 downto 0);

begin  -- Behave


  assert(iwidth = owidth*nreqs) report "mismatched i/o widths in InputMuxBase" severity error;

  -----------------------------------------------------------------------------
  -- "fairify" the level-reqs.
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (name=> name & "-fairify", num_reqs => nreqs)
		port map (clk => clk, reset => reset, reqIn => reqP, ackOut => ackP,
					reqOut => fair_reqP, ackIn => fair_ackP);


  -----------------------------------------------------------------------------
  -- output queue if registered_output is set.
  -----------------------------------------------------------------------------
  OutputRepeater: if registered_output generate

    -- purpose: output queue
    OqBlock: block
      signal oq_data_in : std_logic_vector((twidth + owidth)-1 downto 0);
      signal oq_data_out : std_logic_vector((twidth + owidth)-1 downto 0);
    begin  -- block OqBlock

      oq_data_in <= dataR_sig & tagR_sig;
      dataR <= oq_data_out((twidth+owidth)-1 downto twidth);
      tagR <= oq_data_out(twidth-1 downto 0);

        
      oqueue : QueueBase generic map (
        name => name & "-oqueue",
        queue_depth => 2,
        data_width  => twidth + owidth)
        port map (
          clk      => clk,
          reset    => reset,
          data_in  => oq_data_in,
          push_req => reqR_sig,
          push_ack => ackR_sig,
          data_out => oq_data_out,
          pop_ack  => reqR,
          pop_req  => ackR);
      
    end block OqBlock;
  end generate OutputRepeater;

  NoOutputRepeater: if not registered_output generate
    
    dataR <= dataR_sig;
    reqR <= reqR_sig;
    ackR_sig <= ackR;
    tagR <= tagR_sig;
    
  end generate NoOutputRepeater;
  
  -----------------------------------------------------------------------------
  -- pulse to level translate
  -----------------------------------------------------------------------------
  P2L: for I in nreqs-1 downto 0 generate
    p2Linstance: Pulse_To_Level_Translate_Entity
      generic map (name => name & "-p2Linstance-" & Convert_To_String(I))
      port map(rL => reqL(I), rR => reqP(I), aL => ackL(I), aR => ackP(I),
               clk => clk, reset => reset);     

    process(dataL)
      variable regv : std_logic_vector(owidth-1 downto 0);
    begin
      Extract(dataL,I,regv);
      dataP(I) <= regv;
    end process;
    
  end generate P2L;

  -----------------------------------------------------------------------------
  -- priority encoding or pass through
  -----------------------------------------------------------------------------
  NoArbitration: if no_arbitration generate
    fEN <= fair_reqP;
    reqR_sig <= OrReduce(fEN);
    fair_ackP <= fEN when ackR_sig = '1' else (others => '0');
  end generate NoArbitration;

  Arbitration: if not no_arbitration generate
    fEN <= PriorityEncode(fair_reqP);
    reqR_sig <= OrReduce(fEN);
    fair_ackP <= fEN when ackR_sig = '1' else (others => '0');
  end generate Arbitration;

  -----------------------------------------------------------------------------
  -- final multiplexor
  -----------------------------------------------------------------------------
  process(fEN,dataP)
  begin
    dataR_sig <= (others => '0');
    for J in 0 to nreqs-1 loop
      if(fEN(J) = '1') then
        dataR_sig <= dataP(J);
        exit;
      end if;
    end loop;
  end process;    

  -----------------------------------------------------------------------------
  -- tag generation
  -----------------------------------------------------------------------------
  taggen : BinaryEncoder generic map (
    name => name & "-taggen",
    iwidth => nreqs,
    owidth => twidth)
    port map (
      din  => fEN,
      dout => tagR_sig);

end Behave;
