// Seed: 3365031038
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5
    , id_19, id_20,
    output tri id_6,
    output tri0 id_7,
    output tri1 id_8,
    output tri1 id_9,
    input wor id_10,
    output wire id_11,
    input supply1 id_12,
    output supply1 id_13,
    output supply1 id_14,
    output wire id_15,
    input wire id_16,
    input tri id_17
);
  wire id_21;
endmodule
module module_1 (
    output wand id_0,
    input wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wor id_4,
    input wire id_5,
    input wire id_6,
    output wire id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input wire id_11,
    input tri id_12,
    output tri1 id_13,
    input tri id_14
    , id_32,
    output supply1 id_15,
    input wand id_16,
    output supply1 id_17,
    input tri0 id_18,
    output tri1 id_19,
    input tri id_20
    , id_33,
    input wire id_21,
    output wire id_22,
    input tri1 id_23,
    output tri id_24,
    input tri0 id_25,
    output tri id_26,
    input supply1 id_27,
    output tri id_28,
    output uwire id_29,
    input wire id_30
);
  wire id_34;
  assign id_7 = id_5;
  module_0 modCall_1 (
      id_4,
      id_19,
      id_30,
      id_21,
      id_14,
      id_24,
      id_15,
      id_24,
      id_24,
      id_17,
      id_8,
      id_17,
      id_20,
      id_24,
      id_29,
      id_7,
      id_3,
      id_18
  );
  assign modCall_1.id_4 = 0;
  always
    repeat (id_16 == id_8) begin : LABEL_0
      @(posedge id_9 or posedge 1);
      assume (1 + 1'b0) $display;
    end
endmodule
