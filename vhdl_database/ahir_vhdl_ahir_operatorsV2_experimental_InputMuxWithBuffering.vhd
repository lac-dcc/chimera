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

entity InputMuxWithBuffering is
  generic (name: string;
	   iwidth: integer := 10;
	   owidth: integer := 10;
	   twidth: integer := 3;
	   nreqs: integer := 1;
	   buffering: IntegerArray;
	   no_arbitration: Boolean := false;
	   registered_output: Boolean := true;
	   full_rate: boolean);
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
end InputMuxWithBuffering;


architecture Behave of InputMuxWithBuffering is

  type WordArray is array (natural range <>) of std_logic_vector(owidth-1 downto 0);
  signal rx_data_in, rx_data_out : WordArray(nreqs-1 downto 0);

  signal reqFromRx, ackToRx: std_logic_vector(nreqs-1 downto 0);
  signal fairReqs, fairAcks: std_logic_vector(nreqs-1 downto 0);
  signal reqP, ackP: std_logic_vector(nreqs-1 downto 0);
  signal reqFair, ackFair: std_logic_vector(nreqs-1 downto 0);

  signal kill_zero: std_logic;
  signal reqR_sig, ackR_sig: std_logic;
  signal dataR_sig: std_logic_vector(owidth-1 downto 0);
  signal tagR_sig                : std_logic_vector(twidth-1 downto 0);
  signal oq_data_in : std_logic_vector((twidth + owidth)-1 downto 0);
  signal oq_data_out : std_logic_vector((twidth + owidth)-1 downto 0);

  --alias cbuffering: IntegerArray(nreqs-1 downto 0) is buffering;

begin  -- Behave

   kill_zero <= '0';


  assert(iwidth = owidth*nreqs) report "mismatched i/o widths in InputMuxBase" severity error;

  -----------------------------------------------------------------------------
  -- first stage: receive buffers.
  -----------------------------------------------------------------------------
  RxGen: for I in 0 to nreqs-1 generate 
     process(dataL)
        --variable regv : std_logic_vector(owidth-1 downto 0);
     begin
        -- Extract(dataL,I,regv);
        rx_data_in(I) <= dataL(((I+1)*owidth)-1 downto I*owidth);
     end process;


     rxBuf: ReceiveBuffer generic map(name => name & "-rxBuf-" & Convert_To_String(I),
					buffer_size =>  buffering(I),
					data_width => owidth,
					full_rate => full_rate)
		port map (write_req => reqL(I),
			  write_ack => ackL(I),
			  write_data => rx_data_in(I),
			  -------------------------
			  -- note: cross-over.
			  read_req => ackToRx(I),
			  read_ack => reqFromRx(I),
			  -------------------------
			  read_data => rx_data_out(I),
			  clk => clk, reset => reset);
					
  end generate RxGen;

  -----------------------------------------------------------------------------
  -- second-stage "fairify" the level-reqs (to avoid starvation).
  -----------------------------------------------------------------------------
  fairify: NobodyLeftBehind generic map (name => name & "-fairify", num_reqs => nreqs)
		port map (clk => clk, reset => reset, reqIn => reqFromRx, ackOut => ackToRx,
					reqOut => reqFair, ackIn => ackFair);


  -----------------------------------------------------------------------------
  -- priority encoding or pass through
  -----------------------------------------------------------------------------
  NoArbitration: if no_arbitration generate
    reqP <= reqFair;
    reqR_sig <= OrReduce(reqP);
    ackFair <= reqP when ackR_sig = '1' else (others => '0');
  end generate NoArbitration;

  Arbitration: if not no_arbitration generate
    reqP <= PriorityEncode(reqFair);
    reqR_sig <= OrReduce(reqP);
    ackFair <= reqP when ackR_sig = '1' else (others => '0');
  end generate Arbitration;

  -----------------------------------------------------------------------------
  -- data multiplexor
  -----------------------------------------------------------------------------
  process(reqP,rx_data_out)
  begin
    dataR_sig <= (others => '0');
    for J in 0 to nreqs-1 loop
      if(reqP(J) = '1') then
        dataR_sig <= rx_data_out(J);
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
      din  => reqP,
      dout => tagR_sig);

  -----------------------------------------------------------------------------
  -- output queue.. data and tag passed out of mux. 
  -- TODO: link the output queue to the input muxing to save
  --       one stage?
  -----------------------------------------------------------------------------
  ifReg: if registered_output generate
        
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
      
  end generate ifReg;

  ifNoReg: if (not registered_output) generate
     oq_data_out <= oq_data_in;
     reqR <= reqR_sig;
     ackR_sig <= ackR;
  end generate ifNoReg;

  oq_data_in <= dataR_sig & tagR_sig;
  dataR <= oq_data_out((twidth+owidth)-1 downto twidth);
  tagR  <= oq_data_out(twidth-1 downto 0);

end Behave;
