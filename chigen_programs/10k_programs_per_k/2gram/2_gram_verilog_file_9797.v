// Seed: 1783217630
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial id_1 = 1;
  id_7(
      .id_0(id_2)
  );
  wire id_8 = $display;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  integer id_11 (.id_0((id_7)));
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_2,
      id_8,
      id_6,
      id_12
  );
  supply1 id_13 = 1;
  id_14 :
  assert property (@(1 or posedge 1'b0) id_8 - (1))
  else;
endmodule
