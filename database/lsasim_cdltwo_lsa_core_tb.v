module lsa_core_tb;

reg clk;
reg rst;

initial
begin
    clk = 0;
    forever #1 clk = !clk;
end

initial
begin
  rst = 0;
  #13 rst = 1;
  #2000 $finish;
end

lsa_core lsa_core0 (clk,rst);

initial
 begin
    $dumpfile("test.vcd");
    $dumpvars(0,lsa_core0);
 end

endmodule
