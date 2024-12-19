// Seed: 3818634395
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri1 id_7,
    output tri id_8,
    input supply0 id_9,
    input tri id_10,
    output wor id_11
    , id_21,
    input wire id_12
    , id_22,
    output tri id_13,
    output uwire id_14,
    output tri1 id_15,
    input tri1 id_16,
    input supply0 id_17,
    input tri0 id_18,
    output uwire id_19
);
  wor id_23, id_24;
  assign id_23 = 1 == id_21;
  wor id_25 = id_16;
  assign id_21 = id_3;
  wire id_26;
  assign id_24 = id_23;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    output tri0  id_2,
    output tri0  id_3,
    output wire  id_4,
    output tri0  id_5,
    output tri0  id_6,
    output wand  id_7,
    input  uwire id_8,
    input  wire  id_9,
    input  tri   id_10
);
  module_0 modCall_1 (
      id_9,
      id_7,
      id_1,
      id_9,
      id_9,
      id_2,
      id_10,
      id_8,
      id_3,
      id_10,
      id_10,
      id_5,
      id_9,
      id_3,
      id_4,
      id_4,
      id_10,
      id_8,
      id_8,
      id_3
  );
  assign modCall_1.id_8 = 0;
  id_12(
      .id_0(1),
      .id_1(1),
      .id_2(1'b0),
      .id_3(id_10),
      .id_4(id_3),
      .id_5(""),
      .id_6(id_2),
      .id_7(id_7)
  );
  generate
    always @(posedge 1 or posedge 1) begin : LABEL_0
      #1;
    end
  endgenerate
endmodule
