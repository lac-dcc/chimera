// Seed: 1634479622
module module_0 (
    input uwire id_0,
    output wor id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4,
    input tri id_5,
    output uwire id_6,
    input wor id_7,
    input uwire id_8,
    output uwire id_9,
    input tri id_10,
    input wand id_11
);
  wire id_13 = (1);
  wire id_14;
  specify
    $setup(id_15, posedge id_16[-1===1], id_11);
    if (id_15) (posedge id_17 => (id_18 +: -1)) = (id_18);
    (id_19 => id_20) = 1;
  endspecify
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input tri1 id_2,
    output uwire id_3,
    output uwire id_4,
    output wire id_5,
    input supply1 id_6,
    input supply1 id_7,
    input tri id_8,
    input tri0 id_9,
    output tri0 id_10,
    input supply1 id_11,
    output supply0 id_12,
    input supply1 id_13
);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_11,
      id_13,
      id_9,
      id_2,
      id_4,
      id_8,
      id_11,
      id_12,
      id_9,
      id_7
  );
  assign modCall_1.type_24 = 0;
endmodule
