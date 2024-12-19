// Seed: 1427467567
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    input uwire id_3,
    input supply1 id_4,
    output uwire id_5,
    input wire id_6,
    output supply1 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    output supply0 id_11,
    input tri id_12,
    input wor id_13,
    output wire id_14,
    output supply0 id_15,
    output supply1 id_16,
    output tri0 id_17,
    input wire id_18,
    input wire id_19,
    input wor id_20,
    input wand id_21,
    input supply0 id_22,
    input wand id_23,
    input tri id_24,
    input tri1 id_25,
    input supply1 id_26,
    output tri1 id_27,
    output wire id_28
);
  id_30(
      .id_0(1), .id_1({id_2{1'b0}}), .id_2(1), .id_3(id_13 * id_16)
  );
  wire id_31, id_32, id_33, id_34;
  wire id_35;
  assign id_28 = 1'h0;
  tri1 id_36, id_37 = 1;
  supply1 id_38 = id_36;
  assign id_5  = id_24;
  assign id_31 = id_6;
  wire id_39;
  assign id_15 = 1;
endmodule
macromodule module_1 (
    input tri0 id_0,
    inout supply0 id_1,
    input tri1 id_2,
    output wire id_3,
    output wire id_4
    , id_9,
    input wire id_5,
    input wire id_6,
    input tri0 id_7
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1,
      id_7,
      id_3,
      id_3,
      id_5,
      id_2,
      id_4,
      id_5,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_5,
      id_5,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_15 = 0;
endmodule
