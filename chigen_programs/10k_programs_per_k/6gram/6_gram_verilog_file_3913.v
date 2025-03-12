// Seed: 3019882840
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    output wire id_3,
    input tri1 id_4,
    input wire id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    output tri0 id_9,
    output tri1 id_10
    , id_16,
    input tri id_11,
    input wor id_12,
    input tri1 id_13,
    input tri0 id_14
);
  assign id_16 = id_1;
endmodule
module module_1 #(
    parameter id_5 = 32'd31
) (
    input supply1 id_0,
    output tri0 id_1,
    input tri id_2,
    input tri id_3,
    input wor id_4,
    input tri _id_5,
    output supply1 id_6,
    output uwire id_7
);
  logic id_9;
  assign id_1 = id_3;
  assign id_6 = 1;
  wire [id_5 : -1 'b0] id_10, id_11;
  wire id_12;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_6,
      id_2,
      id_4,
      id_4,
      id_4,
      id_0,
      id_7,
      id_1,
      id_3,
      id_4,
      id_0,
      id_2
  );
  assign modCall_1.id_13 = 0;
  tri0 id_13 = id_3;
  assign id_13 = id_11 ? 1 : id_5 - 1 ? 1 : 1 ? -1'b0 : id_11 ? id_4 : -1'b0;
endmodule
