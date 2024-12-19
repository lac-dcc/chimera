// Seed: 1861301393
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output tri id_2,
    input tri id_3
    , id_30,
    input tri0 id_4,
    input supply1 id_5,
    output supply1 id_6
    , id_31,
    input supply0 id_7,
    input supply0 id_8,
    input wor id_9,
    input wire id_10,
    output supply1 id_11,
    input wor id_12,
    input tri0 id_13,
    output wire id_14,
    input tri1 id_15,
    input tri0 id_16,
    input tri0 id_17,
    input supply1 id_18,
    input supply0 id_19,
    output supply1 id_20,
    input tri0 id_21,
    input wire id_22,
    output wire id_23,
    input wor id_24,
    input wand id_25,
    input supply0 id_26,
    output wand id_27,
    output tri id_28
);
  wire id_32;
  always @(1 or 1);
  wire id_33;
  id_34(
      .id_0(id_24), .id_1(1), .id_2(1), .id_3(1), .id_4(), .id_5(id_13 - id_23), .id_6(id_25)
  );
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_23 = 0;
  id_3(
      .id_0(id_0 & 1'b0), .id_1(id_1), .id_2(id_4), .id_3(1), .id_4(1), .id_5(1), .id_6(id_0)
  );
  always @(posedge id_4 or posedge id_0 * 1)
    if (id_4) begin : LABEL_0
      id_1 = id_0;
    end
  wire id_5;
  wire id_6;
endmodule
