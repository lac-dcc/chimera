--
--  StreamServer functions for JTAG/GHDL/OpenOCD integration
-- 
--  Copyright 2012 Alvaro Lopes <alvieboy@alvie.com>
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

package openocd_rbb is
  function rbb_initialize return integer;
  function rbb_transmit(i:integer) return integer;
  function rbb_receive return integer;
  function rbb_available return integer;
  function rbb_close return integer;

  attribute foreign of rbb_initialize:  function is "VHPIDIRECT rbb_initialize";
  attribute foreign of rbb_transmit:    function is "VHPIDIRECT rbb_transmit";
  attribute foreign of rbb_receive:     function is "VHPIDIRECT rbb_receive";
  attribute foreign of rbb_available:   function is "VHPIDIRECT rbb_available";
  attribute foreign of rbb_close:       function is "VHPIDIRECT rbb_close";

end openocd_rbb;

package body openocd_rbb is
  function rbb_initialize return integer is begin
    assert false severity failure;
  end rbb_initialize;

  function rbb_transmit(i:integer) return integer is begin
    assert false severity failure;
  end rbb_transmit;

  function rbb_receive return integer is begin
    assert false severity failure;
  end rbb_receive;

  function rbb_close return integer is begin
    assert false severity failure;
  end rbb_close;

  function rbb_available return integer is begin
    assert false severity failure;
  end rbb_available;
end openocd_rbb;
