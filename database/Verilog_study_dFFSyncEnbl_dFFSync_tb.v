// This program was cloned from: https://github.com/mehedi37/Verilog_study
// License: MIT License

module dFFSync_tb;
reg clk, reset, d, en;
wire q;

  dFFSync uut(
    .clk(clk),
    .reset(reset),
    .d(d),
    .en(en),
    .q(q)
  );

  always begin
    clk = ~clk;
    #5;
  end

  initial begin
    $dumpfile("dFFSync_tb.vcd");
    $dumpvars(0, dFFSync_tb);
    clk <= 0;
    reset <= 1;
    en <= 0;
    d <= 0;

    #10 reset <= 0; en <= 1; d <= 1;
    #10 reset <= 0; en <= 0; d <= 0;
    #10 reset <= 1; en <= 1;
    #5 d <= 1;
    #10;
    $finish;
  end

    initial begin
      $monitor("time=%0t clk=%b reset=%b en=%b d=%b q=%b", $time, clk, reset, en, d, q);
    end
endmodule