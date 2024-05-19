// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

class my_class;
  task run_test();
    $display("PASSED");
  endtask
endclass

class extended_class extends my_class;
endclass

module test();

extended_class obj;

initial begin
  obj = new();
  obj.run_test();
end

endmodule
