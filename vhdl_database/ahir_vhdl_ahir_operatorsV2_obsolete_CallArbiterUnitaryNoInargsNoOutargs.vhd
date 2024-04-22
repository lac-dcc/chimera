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

-- the unitary call arbiter interfaces a set
-- of callers (num_reqs in number) from a single
-- called module.
--
-- the caller is identified by a caller tag.  The unitary
-- arbiter registers the caller tag and returns it when
-- the current call has finished.
--
entity CallArbiterUnitaryNoInargsNoOutargs is
  generic(num_reqs: integer;
	  caller_tag_length: integer;
          callee_tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_tag    : in  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks   : out std_logic_vector(num_reqs-1 downto 0);
    return_tag    : out  std_logic_vector((num_reqs*caller_tag_length)-1 downto 0);
    -- ports connected to the called module
    call_start   : out std_logic;
    call_fin   : in  std_logic;
    call_in_tag   : out std_logic_vector(callee_tag_length-1 downto 0);
    -- from the called module
    call_out_tag : in  std_logic_vector(callee_tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end CallArbiterUnitaryNoInargsNoOutargs;


architecture Struct of CallArbiterUnitaryNoInargsNoOutargs is
  signal call_acks_sig : std_logic_vector(num_reqs-1 downto 0);
  signal call_mreq, call_mack: std_logic;
  signal call_mtag : std_logic_vector(callee_tag_length-1 downto 0);
  signal return_mreq, return_mack: std_logic;
  signal return_mtag : std_logic_vector(callee_tag_length-1 downto 0);
  signal enable_in_args, enable_out_args: std_logic;
begin

  call_acks <= call_acks_sig;
  
  -- caller tags are registered here.  It is impossible
  -- for caller line I to be re-used until the current
  -- call has finished.  So we can just register the
  -- incoming call-tag to the outgoing return-tag.
  TagGen: for I in num_reqs-1 downto 0 generate
    process(clk)
    begin
      if(clk'event and clk = '1') then
        if(call_reqs(I) = '1' and call_acks_sig(I) = '1') then
          return_tag(((I+1)*caller_tag_length)-1 downto (I*caller_tag_length))
            <=
            call_tag(((I+1)*caller_tag_length)-1 downto (I*caller_tag_length));
        end if;
      end if;
    end process;
  end generate TagGen;

  -- this is the basic call-arbiter which is a bit incomplete,
  -- because it does not provide a handle for the caller to
  -- pass a tag to the callee (this is OK if there is only one
  -- caller, but in general there can be many).
  base: CallArbiterNoInargsNoOutargs
    generic map(num_reqs => num_reqs,
                tag_length => callee_tag_length)
    port map(call_reqs => call_reqs,
             call_acks => call_acks_sig,
             call_mreq => call_mreq,
             call_mack => call_mack,
             call_mtag => call_mtag,
             return_reqs => return_reqs,
             return_acks => return_acks,
             return_mreq => return_mreq,
             return_mack => return_mack,
             return_mtag => return_mtag,
             clk => clk,
             reset => reset);

  -- need the call-mediator to match the split protocol from
  -- the caller side with the unitary protocol of the callee.
  mediator: CallMediator 
    port map(call_req => call_mreq,
             call_ack => call_mack,
             enable_call_data => enable_in_args,
             return_req => return_mack, -- cross-over
             return_ack => return_mreq, -- cross-over
             enable_return_data => enable_out_args,
             start => call_start,
             fin => call_fin,
             clk => clk,
             reset => reset); 
  

  -- to register the call tag
  callTagReg: BypassRegister generic map(data_width => callee_tag_length, enable_bypass => true)
    port map(clk=> clk, reset => reset,
             enable => enable_in_args,
             data_in => call_mtag,
             data_out => call_in_tag);

  -- to register the return tag
  returnTagReg: BypassRegister generic map(data_width => callee_tag_length, enable_bypass => true)
    port map(clk=> clk, reset => reset,
             enable => enable_out_args,
             data_in => call_out_tag,
             data_out => return_mtag);
  

end Struct;
