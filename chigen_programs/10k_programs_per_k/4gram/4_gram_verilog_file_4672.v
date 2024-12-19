// Seed: 2829099308
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wor id_5,
    output tri id_6,
    output tri id_7
);
  wire id_9, id_10;
  assign id_6 = 1;
  wire id_11;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output tri0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri0 id_6,
    output wor id_7
);
  assign id_3 = 1;
  static id_9(
      .id_0(1'd0), .id_1(), .id_2(id_6), .id_3(1)
  );
  or primCall (id_6, id_0, id_9, id_4, id_5);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_0,
      id_5,
      id_5,
      id_6,
      id_6
  );
  wire id_10;
endmodule
