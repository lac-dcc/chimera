// Seed: 196826837
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
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_9;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd56,
    parameter id_6 = 32'd97
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7
);
  input wire id_7;
  input wire _id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5[id_4-:id_6] = id_2;
  tri1 id_8 = 1'b0 ? 'h0 - id_7 : id_7;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_3,
      id_2,
      id_3,
      id_3,
      id_8,
      id_8
  );
endmodule
