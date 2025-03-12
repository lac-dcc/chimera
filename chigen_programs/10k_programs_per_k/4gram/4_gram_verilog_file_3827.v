// Seed: 3157542669
module module_0 (
    output wor id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri id_4,
    input supply1 id_5
    , id_24,
    input tri0 id_6,
    input wor id_7
    , id_25,
    input tri0 id_8,
    output wand id_9,
    input uwire id_10,
    input supply1 id_11,
    input tri id_12,
    input supply1 id_13,
    input tri id_14,
    input supply0 id_15,
    input uwire id_16,
    input supply0 id_17,
    output tri1 id_18,
    output supply0 id_19,
    output tri0 id_20,
    input wand id_21,
    output wire module_0
);
endmodule
module module_1 #(
    parameter id_12 = 32'd82
) (
    input tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input wor id_4,
    output wire id_5,
    input wor id_6
);
  integer [-1 : 1] id_8;
  ;
  assign id_1 = -1;
  bit id_9;
  wire id_10;
  reg [-1 'b0 : -1] id_11;
  wire _id_12, id_13;
  wire id_14;
  logic [id_12 : -1] id_15 = 1'b0;
  always @(id_3 or -1)
    forever begin : LABEL_0
      begin : LABEL_1
        id_9 = ~id_9;
        id_11 <= -1'b0;
      end
      id_9 <= -1'h0;
    end
  or primCall (id_5, id_13, id_9, id_14, id_15, id_8, id_4, id_2, id_3, id_0, id_6, id_11);
  assign id_11 = -1;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_5,
      id_6,
      id_5,
      id_0,
      id_3,
      id_4,
      id_3,
      id_5,
      id_4,
      id_2,
      id_3,
      id_2,
      id_0,
      id_3,
      id_4,
      id_2,
      id_1,
      id_1,
      id_1,
      id_6,
      id_5
  );
  assign modCall_1.id_7 = 0;
endmodule
