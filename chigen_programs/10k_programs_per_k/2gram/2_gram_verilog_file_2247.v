// Seed: 1569011488
module module_0 ();
  wor  id_1 = 1'b0;
  wire id_2;
endmodule
module module_1 #(
    parameter id_12 = 32'd16,
    parameter id_13 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_9 = ~1;
  task automatic id_10;
    fork
      if (1) id_9 <= 1;
    join_any
  endtask
  assign id_9 = id_6;
  assign id_4 = id_5 <-> 1 == id_3;
  for (id_11 = 1; id_5; id_9 = 1) begin
    defparam id_12.id_13 = 1;
  end
  assign id_11 = id_9;
  wire id_14;
  module_0();
endmodule
