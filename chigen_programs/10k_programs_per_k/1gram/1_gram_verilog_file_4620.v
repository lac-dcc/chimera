// Seed: 4137977967
macromodule module_0 (
    output supply1 id_0,
    input tri1 id_1
    , id_9,
    input tri0 id_2,
    input wor id_3,
    output wire id_4,
    input wand void id_5,
    input tri0 id_6,
    input wand id_7
);
  wire id_10;
  wire id_11;
  always $display(~id_9, id_11);
  id_12 :
  assert property (@(1) id_12) release id_10;
  id_13(
      id_11
  );
  assign id_12 = 1'b0;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1
);
  assign id_3 = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  wire id_4;
endmodule
