package pty is
  function pty_initialize return integer;
  function pty_transmit(i:integer) return integer;
  function pty_receive return integer;
  function pty_available return integer;

  attribute foreign of pty_initialize:  function is "VHPIDIRECT pty_initialize";
  attribute foreign of pty_transmit:    function is "VHPIDIRECT pty_transmit";
  attribute foreign of pty_receive:     function is "VHPIDIRECT pty_receive";
  attribute foreign of pty_available:     function is "VHPIDIRECT pty_available";

end pty;

package body pty is
  function pty_initialize return integer is begin
    assert false severity failure;
  end pty_initialize;

  function pty_transmit(i:integer) return integer is begin
    assert false severity failure;
  end pty_transmit;

  function pty_receive return integer is begin
    assert false severity failure;
  end pty_receive;

  function pty_available return integer is begin
    assert false severity failure;
  end pty_available;
end pty;
