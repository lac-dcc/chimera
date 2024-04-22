--Copyright (c) 2014, Tim Wawrzynczak.
--All rights reserved.

--Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

--2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

--3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity debouncer is
  port ( 
    clk : in  STD_LOGIC;
    reset : in  STD_LOGIC;
    input : in  STD_LOGIC;
    output : out  STD_LOGIC
    );
end debouncer;

architecture Behavioral of debouncer is
  signal sync_d, sync_q : std_logic_vector( 1 downto 0 ) := "00" ;
  signal counter_d, counter_q : unsigned( 18 downto 0 ) := ( others => '0' ) ;
begin

  output <= '1' when ( counter_q = "1111111111111111111" ) else '0' ;

  -- standard double input flop to synchronize the input
  sync : process( input, sync_d( 0 ) )
  begin
    sync_d( 0 ) <= input ;
    sync_d( 1 ) <= sync_d( 0 ) ;
  end process sync ;
  
  -- debounce the input
  debounce : process( counter_q, sync_q( 1 ) )
  begin
    counter_d <= counter_q + 1 ;
    
    -- hold the counter in saturation
    if( counter_q = "1111111111111111111" ) then
      counter_d <= counter_q ;
    end if ;
    
    -- but reset if the synced input goes low
    if( sync_q( 1 ) = '0' ) then
      counter_d <= ( others => '0' ) ;
    end if ;
    
  end process debounce ;

  -- create registers
  registers : process( clk )
  begin
    if rising_edge( clk ) then
      if( reset = '1' ) then
        sync_q <= "00" ;
        counter_q <= ( others => '0' ) ;
      else
        sync_q <= sync_d ;
        counter_q <= counter_d ;
      end if ;
    end if ;
  end process registers;

end Behavioral;
