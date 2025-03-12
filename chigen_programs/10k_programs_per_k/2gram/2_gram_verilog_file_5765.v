// Seed: 949208836
module module_0 (
    input supply1 id_0,
    output tri id_1,
    output supply0 id_2,
    input wire id_3,
    input wor id_4,
    input supply1 id_5,
    output wor id_6,
    output wand id_7,
    output supply0 id_8,
    output wire id_9
    , id_15,
    input uwire id_10,
    output tri0 id_11,
    input wand id_12,
    input wor id_13
);
  logic id_16;
  ;
  assign id_15 = id_3 ~^ 1;
  wire [-1 : 1] id_17;
  wire id_18;
  assign id_1 = id_3;
  parameter id_19 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd55
) (
    output supply0 id_0,
    input supply0 id_1,
    input tri id_2,
    input tri1 id_3,
    output wire id_4,
    input tri _id_5,
    input supply0 id_6,
    input uwire id_7
);
  wire [id_5 : id_5] id_9;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_1,
      id_7,
      id_7,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_0,
      id_6,
      id_3
  );
  assign modCall_1.id_11 = 0;
  localparam id_10 = 1 ? -1 : 1;
  wire id_11;
  parameter id_12 = id_10;
endmodule
