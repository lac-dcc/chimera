// Seed: 1398507395
module module_0 (
    output tri0 id_0,
    input wire id_1,
    output wire id_2,
    input tri0 id_3,
    output wor id_4,
    output wire id_5,
    output tri1 id_6,
    output wor id_7,
    input tri0 id_8,
    input uwire id_9,
    input supply1 id_10,
    output tri id_11,
    output tri0 id_12,
    output tri id_13,
    input wor id_14,
    input tri0 id_15,
    output tri1 id_16,
    input supply0 id_17,
    output wand id_18
);
  wand id_20;
  assign module_1.id_5 = 0;
  always @(id_20 or negedge 1'b0 or posedge 1 == 1 or posedge id_8)
    if (id_10) id_5 = 1;
    else id_5 = 1'b0;
  always @(1 or posedge id_17 - 1) id_12 = id_1;
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output tri1 id_4,
    output supply1 id_5
);
  id_7(
      .id_0(id_1), .id_1((1)), .id_2({id_0 <= 1{id_1}})
  );
  module_0 modCall_1 (
      id_0,
      id_3,
      id_5,
      id_3,
      id_5,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_4,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2
  );
endmodule
