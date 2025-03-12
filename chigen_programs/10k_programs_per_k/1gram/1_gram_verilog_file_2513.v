// Seed: 2206231658
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout logic [7:0] id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign #1 id_7[-1] = id_2[-1 : $realtime];
endmodule
module module_1 #(
    parameter id_5 = 32'd23
) (
    id_1[id_5 : 1],
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  input wire id_7;
  not primCall (id_3, id_1);
  input wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1
  );
  output wire _id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
endmodule
