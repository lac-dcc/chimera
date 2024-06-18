// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;
  parameter p_real      = 1.2345 ;
  parameter p_real_x2   = p_real * 2 ; // <-- here

  real v_real, v_real_x2 ;

  initial begin
    v_real    = p_real ;
    v_real_x2 = p_real * 2 ;
    $display("p_real=%f, v_real=%f, v_real_x2=%f", p_real, v_real, v_real_x2) ;
  end

endmodule
