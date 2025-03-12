// Seed: 1771815642
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input supply1 id_6,
    output tri1 id_7
    , id_31,
    input wor id_8,
    input wand id_9,
    input supply0 id_10,
    output tri id_11,
    input wor id_12,
    input wand id_13,
    output supply1 id_14,
    input tri1 id_15,
    input uwire id_16,
    output uwire id_17,
    input supply1 id_18,
    output tri0 id_19,
    input supply0 id_20,
    input wire id_21
    , id_32,
    output tri1 id_22,
    input wand id_23,
    input uwire id_24,
    input wor id_25,
    input tri0 id_26,
    output tri1 id_27,
    input wand id_28,
    input tri0 id_29
);
  assign id_31 = id_20;
  wire id_33;
  generate
    final
      if (1'b0)
        #1
          @(posedge id_2) begin : LABEL_0
            logic id_34;
          end
      else @(posedge id_10 + -1 + -1 or posedge -1);
  endgenerate
  wire id_35;
endmodule
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    input  tri   id_2,
    input  wor   id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2,
      id_0,
      id_3,
      id_2,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_0,
      id_2,
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_1,
      id_2,
      id_3,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
