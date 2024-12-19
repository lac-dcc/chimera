// Seed: 1124654465
module module_0 (
    input  wand  id_0,
    input  wor   id_1
    , id_7,
    input  tri   id_2,
    input  uwire id_3,
    output wor   id_4,
    output wand  id_5
);
  id_8(
      .id_0(), .id_1(1), .id_2(1'h0)
  );
  uwire id_9 = 1 ? 1 : 1;
  logic [7:0] id_10, id_11, id_12;
  id_13(
      .id_0(1 - 1),
      .id_1(1 & 1),
      .id_2(""),
      .id_3((1) ^ id_3),
      .id_4(id_10[1]),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(id_1),
      .id_9(id_3)
  );
  wire id_14;
  wire id_15;
  logic [7:0] id_16 = id_10;
  wire id_17 = id_0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input uwire id_7,
    output tri1 id_8,
    input supply1 id_9,
    input tri1 id_10,
    input wor id_11,
    input tri id_12,
    output tri1 id_13,
    input supply0 id_14,
    input wand id_15,
    input uwire id_16,
    output tri1 id_17,
    input supply0 id_18,
    input wor id_19,
    output wor id_20,
    inout supply0 id_21
);
  wor id_23 = id_9;
  module_0 modCall_1 (
      id_19,
      id_11,
      id_19,
      id_10,
      id_5,
      id_0
  );
  assign modCall_1.id_17 = 0;
  assign id_20 = id_15 ? id_3 : 1;
  assign id_20 = id_16;
  always @(negedge 1'b0 or posedge id_19) begin : LABEL_0
    #1;
  end
  nor primCall (
      id_0,
      id_2,
      id_12,
      id_11,
      id_14,
      id_6,
      id_19,
      id_15,
      id_23,
      id_4,
      id_21,
      id_3,
      id_7,
      id_16,
      id_18,
      id_1,
      id_10,
      id_9
  );
endmodule
