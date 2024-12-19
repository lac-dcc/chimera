// Seed: 177978726
module module_0 (
    output supply0 id_0,
    input wor id_1,
    output wor id_2,
    output supply0 id_3,
    input wor id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    input tri id_9,
    input tri1 id_10,
    input tri1 id_11,
    input supply1 id_12,
    input uwire id_13,
    input tri1 void id_14,
    output wor id_15,
    input wire id_16,
    input tri0 id_17,
    output wand id_18,
    input wor id_19
);
  always begin : LABEL_0
    id_18 = id_4;
  end
  id_21(
      ~id_5
  );
  assign #1 id_3 = 1'b0;
  id_22(
      1, 1
  );
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri1 id_4,
    input supply0 id_5
);
  uwire id_7 = 1'd0;
  wand  id_8;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_1,
      id_1,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_0,
      id_8,
      id_5,
      id_3,
      id_2,
      id_8,
      id_0,
      id_8,
      id_8,
      id_8
  );
  assign modCall_1.id_2 = 0;
  uwire id_9 = 1;
  assign id_7 = 1;
  wire id_10, id_11;
  assign id_1 = id_8.id_3;
endmodule
