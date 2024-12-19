// Seed: 3136903339
module module_0 (
    output tri id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    output tri id_5,
    output uwire id_6
);
  assign id_6 = id_2;
  assign module_1.type_0 = 0;
  wire id_8;
  id_9(
      .id_0(id_6), .id_1(1'b0), .id_2(id_1), .id_3()
  );
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    output uwire id_3,
    output uwire id_4,
    output wire id_5
);
  assign id_4 = 1;
  assign id_5 = 1'b0 ? id_2 : id_2 ? id_0 : 1'b0;
  wire id_7, id_8;
  logic [7:0] id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_5,
      id_3,
      id_5
  );
  assign id_9[1] = 1;
endmodule
