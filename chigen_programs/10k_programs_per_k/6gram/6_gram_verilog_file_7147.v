// Seed: 2401201989
module module_0 (
    output wor id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri id_5,
    output wor id_6,
    output wor id_7
);
  wire id_9;
  assign module_1.type_16 = 0;
  assign id_6 = 1'b0;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    output supply1 id_2,
    output tri0 id_3,
    input wor id_4,
    output tri0 id_5,
    input wire id_6,
    output wire id_7,
    output wire id_8,
    output tri0 id_9
);
  assign id_5 = id_1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_1,
      id_6,
      id_6,
      id_7,
      id_2
  );
  id_11(
      .id_0(1), .id_1(1), .id_2((id_9) | id_1), .id_3({1 !=? 1'h0{id_3}})
  );
  wire id_12;
  initial assume (1);
endmodule
