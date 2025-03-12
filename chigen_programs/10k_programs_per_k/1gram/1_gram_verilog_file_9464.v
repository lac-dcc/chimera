// Seed: 2585290997
module module_0 (
    output uwire id_0,
    input tri id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri id_5,
    input tri0 id_6,
    input wire id_7,
    input supply1 id_8,
    input supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    output wor id_12,
    input wire id_13,
    input supply1 id_14
    , id_16
);
  assign id_12 = -1;
  localparam id_17 = -1;
  assign id_0 = 1;
  logic id_18;
  ;
  parameter id_19 = {1'b0, 1, id_17, -1 ? 1 : -1};
  logic id_20;
endmodule
module module_1 #(
    parameter id_1 = 32'd48
) (
    input supply1 id_0,
    input uwire _id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri1 id_4,
    output logic id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_2,
      id_3,
      id_4,
      id_4
  );
  wire [-1 : id_1] id_8, id_9, id_10;
  id_11 :
  assert property (@(-1'h0) id_8 == id_11) id_5 <= -1;
  parameter id_12 = 1;
endmodule
