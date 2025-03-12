// Seed: 3731681329
module module_0 (
    input wand id_0,
    input wor id_1,
    input tri id_2,
    output supply0 id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    output uwire id_8,
    output supply0 id_9,
    input supply0 id_10,
    output supply1 id_11,
    input supply0 id_12,
    input tri1 id_13
);
  always begin : LABEL_0
    wait (id_0);
  end
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input uwire id_2
    , id_4
);
  bit id_5;
  initial begin : LABEL_0
    id_5 <= id_2;
  end
  wire id_6;
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_10 = 0;
  wire id_7;
endmodule
