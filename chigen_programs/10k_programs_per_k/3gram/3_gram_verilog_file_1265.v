// Seed: 3541356122
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input wire id_3,
    input tri1 id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7
);
  assign id_0 = id_5;
  id_9(
      id_0 ? id_6 : id_3, 1, id_7, 1, id_3
  );
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    output wand id_0
    , id_8,
    input wand id_1,
    input tri id_2,
    output logic id_3
    , id_9,
    output tri1 id_4,
    input wor id_5,
    output supply1 id_6
);
  assign id_8[1'd0] = id_8;
  generate
    initial begin : LABEL_0
      id_3 <= "";
    end
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_5,
      id_5,
      id_5,
      id_6
  );
  assign modCall_1.type_13 = 0;
endmodule
