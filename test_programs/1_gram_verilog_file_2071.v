// Seed: 1039818328
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_9(
      .id_0(-1), .id_1(1)
  );
  wire id_10;
  always id_2 <= id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(posedge id_2 > -1'b0)
  fork
    id_1 <= id_2;
    if (id_2) id_1 <= id_2;
  join_any
  parameter id_3 = 1;
  string id_4 = "", id_5;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
