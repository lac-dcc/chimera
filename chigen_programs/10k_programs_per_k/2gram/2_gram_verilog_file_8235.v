// Seed: 1086116001
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
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  id_7(
      .id_0(id_2)
  );
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_13 :
  assert property (@(posedge id_12) 1)
  else id_9 <= 1;
  wire id_14;
  module_0(
      id_8, id_4, id_13, id_13, id_8, id_8
  );
  assign id_12 = 1;
endmodule
