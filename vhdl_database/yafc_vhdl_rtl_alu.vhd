--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.common.all;

entity alu is
  port (
    tos     : in    word;
    nos     : in    word;
    results : out   alu_results_t
    );
end alu;

architecture Behavioral of alu is
  signal alu_results : alu_results_t;
begin

  -- assign outputs
  results <= alu_results;

  -- where the magic happens... :-)
  alu_proc : process( tos, nos )
    variable not_shiftable : std_logic;
  begin
    
    -- arithmetic
    alu_results.add_result <= std_logic_vector( signed( nos ) + signed( tos ) );
    alu_results.sub_result <= std_logic_vector( signed( nos ) - signed( tos ) );

    -- logic
    not_shiftable := or_vector( tos( 15 downto 4 ) );
    if not_shiftable = '1' then
      alu_results.sll_result <= ( others => '0' );
      alu_results.srl_result <= ( others => '0' );
    else
      alu_results.sll_result <= std_logic_vector( shift_left( signed( nos ), to_integer( signed( tos ) ) ) );
      alu_results.srl_result <= std_logic_vector( shift_right( signed( nos ), to_integer( signed( tos ) ) ) );
    end if;
    
    alu_results.or_result   <= nos or tos;
    alu_results.and_result  <= nos and tos;
    
    -- relational
    if tos = nos then
      alu_results.eq_result <= ( others => '1' );
    else
      alu_results.eq_result <= ( others => '0' );
    end if;
    
  end process alu_proc;

end Behavioral;

