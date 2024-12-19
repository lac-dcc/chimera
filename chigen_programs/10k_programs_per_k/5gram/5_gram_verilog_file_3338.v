// Seed: 3493287718
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input tri id_2,
    input uwire id_3,
    input tri0 id_4
);
  uwire id_6;
  assign id_6 = id_2 ? 1 : id_3 ? 1 : 1;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    output supply1 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input supply1 id_5,
    input supply1 id_6,
    input uwire id_7
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.id_6 = 0;
  assign id_1 = 1;
  wire id_9;
  supply1 id_10 = id_3;
endmodule
