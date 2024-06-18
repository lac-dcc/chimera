// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

program test;

  class a;
    function new(string str);
      $display(str);
    endfunction
  endclass // a

  initial begin
    a m_a;
    m_a = new("PASSED");
  end

endprogram
