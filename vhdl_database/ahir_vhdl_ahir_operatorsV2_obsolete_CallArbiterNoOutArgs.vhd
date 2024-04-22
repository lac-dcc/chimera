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

entity CallArbiterNoOutArgs is
  generic(num_reqs: integer;
	  call_data_width: integer;
	  tag_length: integer);
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector(num_reqs-1 downto 0);
    call_acks   : out std_logic_vector(num_reqs-1 downto 0);
    call_data   : in  std_logic_vector((num_reqs*call_data_width)-1 downto 0);
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector(call_data_width-1 downto 0);
    call_mtag   : out std_logic_vector(tag_length-1 downto 0);
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector(num_reqs-1 downto 0);
    return_acks : out std_logic_vector(num_reqs-1 downto 0);
    -- return from function
    -- function to assert mreq arbiter to return mack
    -- ( NOTE: It has to be this way, the arbiter should
    -- accept the return value if it has room)
    return_mreq : in std_logic;
    return_mack : out std_logic;
    return_mtag : in  std_logic_vector(tag_length-1 downto 0);
    clk: in std_logic;
    reset: in std_logic);
end CallArbiterNoOutArgs;


architecture Struct of CallArbiterNoOutArgs is
   signal pe_call_reqs: std_logic_vector(num_reqs-1 downto 0);
   signal return_mack_sig, return_acks_sig: std_logic_vector(num_reqs-1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(call_reqs);

   ----------------------------------------------------------------------------
   -- combinational process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(pe_call_reqs, call_data, call_mack)
     variable there_is_a_call : std_logic;
     variable out_data : std_logic_vector(call_data_width-1 downto 0);
   begin
     there_is_a_call := OrReduce(pe_call_reqs);
     out_data := (others => '0');
     call_acks <= (others => '0');
     if(there_is_a_call = '1') then
       for I in num_reqs-1 downto 0 loop
         if(pe_call_reqs(I) = '1') then
           Extract(call_data,I,out_data);
           call_acks(I) <= call_mack;
           exit;
         end if;
       end loop;  -- I
     end if;
     call_mreq <= there_is_a_call;
     call_mdata <= out_data;
   end process;

   tagGen : BinaryEncoder generic map (iwidth => num_reqs, owidth => tag_length)
     port map (din => pe_call_reqs, dout => call_mtag);      

   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------

   -- the acks in both directions
   return_acks <= return_acks_sig;
   return_mack <= OrReduce(return_mack_sig);
   
   -- incoming data written into appropriate register.
   RetGen: for I in return_reqs'high downto return_reqs'low generate

     fsm: block
       signal ack_reg, mack_sig, valid_flag : std_logic;
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mreq = '1' and (I = To_Integer(To_Unsigned(return_mtag))) else '0';

       -- mack if valid and mreq and (either ack bit is not set or return_reqs
       -- is asserted)
       mack_sig <= (return_reqs(I) or (not ack_reg)) and return_mreq and valid_flag;

       --------------------------------------------------------------------------
       -- ack ff
       --------------------------------------------------------------------------
       -- set if mack_sig is asserted, else clear if return_reqs is asserted
       -- and register is already set.
       process(clk)
       begin
         if clk'event and clk= '1' then
           if(reset = '1') then
             ack_reg <= '0';
           elsif mack_sig = '1' then
             ack_reg <= '1';
           elsif return_reqs(I) = '1' and ack_reg = '1' then
             ack_reg <= '0';
           end if;
         end if;
       end process;

       -- pass info out of the generate
       return_acks_sig(I) <= ack_reg;
       return_mack_sig(I) <= mack_sig;
       
     end block fsm;

     
   end generate RetGen;
end Struct;
