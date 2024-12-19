// Seed: 3406648552
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output tri0  id_3
    , id_10,
    input  wire  id_4,
    output wire  id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output logic id_8
);
  always id_8 = #(1'b0 : 1  : 1) 1'b0;
endmodule
module module_1 (
    output tri0 id_0,
    output tri0 id_1,
    output logic id_2,
    input tri1 id_3,
    input wor id_4,
    input supply0 id_5,
    output wire id_6,
    input supply0 id_7,
    input tri1 id_8,
    input wand id_9,
    input supply1 id_10,
    output tri1 id_11,
    input wor id_12,
    input supply1 id_13,
    input supply0 id_14,
    input tri0 id_15,
    output wire id_16
    , id_18
);
  wire id_19;
  wire id_20;
  always @(posedge id_15 | (id_13) or 1) id_2 <= 1'b0;
  module_0 modCall_1 (
      id_15,
      id_14,
      id_15,
      id_0,
      id_4,
      id_6,
      id_13,
      id_9,
      id_2
  );
  assign modCall_1.type_13 = 0;
  wor id_21 = 1;
  or primCall (id_11, id_8, id_13, id_5, id_18, id_12, id_19, id_10, id_7, id_3, id_4, id_14);
  id_22(
      .id_0(1'b0), .id_1(1)
  );
endmodule
