// Seed: 1330228945
module module_0 (
    output wand id_0,
    input wand id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    input supply0 id_5,
    output tri id_6,
    input tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    input wand id_10,
    input tri1 id_11,
    input tri1 id_12,
    input wor id_13,
    input wand id_14,
    input supply0 id_15,
    input wor id_16,
    input wor id_17,
    input supply0 id_18,
    input supply0 id_19,
    output supply1 id_20,
    input supply0 id_21,
    input supply0 id_22,
    input wand module_0,
    output uwire id_24,
    output supply0 id_25,
    output tri id_26,
    output tri id_27,
    input wor id_28
);
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    output wor id_2,
    input tri id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input wire id_7,
    input wire id_8,
    input supply0 id_9,
    input wire id_10,
    input tri0 id_11,
    output wand id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    inout tri0 id_16,
    output tri0 id_17,
    input tri1 id_18,
    input tri0 id_19,
    output tri id_20,
    input tri id_21,
    input uwire id_22
);
  wire  id_24;
  wire  id_25;
  uwire id_26;
  wire  id_27;
  assign id_6 = 1;
  id_28(
      .id_0(id_5), .id_1(1'b0), .id_2(1), .id_3(id_27)
  );
  always @(posedge 1 or id_27 + id_1) id_20 -= 1;
  wire id_29;
  id_30(
      .id_0(id_3), .id_1(id_4), .id_2(1 - id_1)
  );
  wire id_31;
  assign id_31 = !id_14;
  wire id_32;
  wire id_33;
  id_34(
      .id_0(1), .id_1(~id_26), .id_2(1), .id_3(), .id_4(1), .id_5(id_22), .id_6(id_29), .id_7(1)
  );
  initial begin : LABEL_0
    id_2 = id_7;
  end
  wire id_35;
  module_0 modCall_1 (
      id_17,
      id_22,
      id_2,
      id_4,
      id_18,
      id_10,
      id_17,
      id_4,
      id_4,
      id_9,
      id_7,
      id_14,
      id_22,
      id_8,
      id_14,
      id_15,
      id_8,
      id_15,
      id_4,
      id_3,
      id_12,
      id_18,
      id_21,
      id_22,
      id_2,
      id_12,
      id_2,
      id_12,
      id_4
  );
  assign modCall_1.type_15 = 0;
  wire id_36;
  wire id_37;
endmodule
