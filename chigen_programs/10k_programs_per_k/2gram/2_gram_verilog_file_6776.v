// Seed: 2726897121
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd24,
    parameter id_14 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_6 :
  assert property (@(posedge 1) {(1) {id_5}})
  else;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_4,
      id_2,
      id_2,
      id_3
  );
  wire id_8, id_9, id_10, id_11, id_12;
  defparam id_13.id_14 = 1;
endmodule
