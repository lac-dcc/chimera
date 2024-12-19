// Seed: 3038956582
module module_0 (
    output uwire id_0,
    output wire id_1,
    input supply0 id_2,
    output wand id_3,
    input wor id_4,
    output tri1 id_5,
    output tri1 id_6,
    input wire id_7,
    input tri0 id_8,
    input wand id_9,
    input tri id_10
);
  wire id_12;
  supply1 id_13 = id_8;
  wire id_14;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output wor id_2,
    output tri1 id_3,
    output tri id_4,
    input wand id_5
);
  supply1 id_7 = "" + id_0;
  or primCall (id_3, id_0, id_7, id_5);
  always @(negedge 1) begin : LABEL_0
    id_2 = id_0;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2,
      id_5,
      id_3,
      id_1,
      id_0,
      id_0,
      id_5,
      id_0
  );
  assign modCall_1.type_8 = 0;
endmodule
