// Seed: 2101413737
module module_0 ();
  wand id_1 = 1 - 1;
  assign id_1 = 1;
  task id_2;
    begin
      fork
      join
    end
  endtask
  assign id_2 = id_1;
endmodule
module module_1 ();
  always id_1 = 1;
  module_0();
endmodule
module module_2 (
    input tri1 id_0,
    input wand id_1
);
  always id_3 = 1'b0;
  genvar id_4;
  module_0(); id_5(
      .id_0(1'd0)
  );
endmodule
module module_3;
  always_latch id_1 <= 1;
  module_0();
endmodule
