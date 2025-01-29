// Seed: 3943199019
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output uwire id_4,
    output tri1 id_5,
    output supply1 id_6
);
  tri1 id_8, id_9;
  uwire id_10;
  supply1 id_11, id_12;
  generate
    begin : LABEL_0
      wire id_13;
    end
    assign id_10 = id_2 <-> 1;
    id_14(
        id_5, !-1, id_0
    );
  endgenerate
  assign id_9  = -1;
  assign id_12 = 1;
  assign id_8  = id_11 ? 1 : -1'b0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    input wor id_2,
    input supply1 id_3,
    output tri0 id_4,
    input supply0 id_5,
    input tri id_6,
    output tri1 id_7,
    output wor id_8
);
  assign id_8 = -1;
  wire id_10, id_11;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_1,
      id_6,
      id_8,
      id_8,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
