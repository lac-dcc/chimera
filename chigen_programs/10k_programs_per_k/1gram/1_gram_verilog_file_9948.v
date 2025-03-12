// Seed: 2560516671
module module_0 (
    input uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input wor id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri id_6,
    output supply1 id_7,
    input supply1 id_8,
    output tri id_9,
    input wor id_10,
    input tri id_11,
    input tri1 id_12,
    input tri1 id_13,
    input wor id_14
);
  logic id_16 = 1;
  assign module_1.id_0 = 0;
  parameter id_17 = 1;
  assign id_9 = id_0;
  wire id_18, id_19;
  always begin : LABEL_0
    id_16 = id_16;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd51,
    parameter id_4 = 32'd49
) (
    input supply1 id_0,
    input tri _id_1,
    input supply1 id_2,
    input wor id_3[-1 : 1],
    input tri1 _id_4
    , id_9,
    input wire id_5,
    output tri1 id_6[1 : id_4],
    input uwire id_7
    , id_10
);
  assign id_10 = id_5 !== id_4;
  localparam id_11[-1 : id_1] = 1;
  assign id_10 = id_3 && 1'b0 == id_7 - id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_0,
      id_6,
      id_2,
      id_5,
      id_6,
      id_2,
      id_6,
      id_3,
      id_0,
      id_5,
      id_3,
      id_2
  );
endmodule
