// Seed: 1159303406
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2
);
  assign id_4 = 1'b0 ? {id_2, id_1} : 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input wire id_2,
    output supply0 id_3
);
  assign id_3 = ~id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0
  );
  wire id_5, id_6, id_7, id_8;
  specify
    (id_9 => id_10) = 1;
    (id_11 => id_12[1]) = 1;
    (id_13 *> id_14) = 1;
  endspecify
endmodule
