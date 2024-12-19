// Seed: 1267530594
module module_0 (
    input supply0 id_0,
    output tri id_1,
    output supply1 id_2,
    input supply1 id_3
    , id_9,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6,
    output wor id_7
);
  assign id_6 = {1, id_0, 1, 1'b0 == id_3};
  wire id_10;
  assign id_7 = id_9;
  wire id_11;
  always @(posedge id_0 or posedge 1) $display(1, id_9 == 1);
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    output tri id_2,
    output uwire id_3,
    input supply0 id_4,
    input supply0 id_5
);
  always #id_7 $display(id_4, 1, 1);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_5,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
