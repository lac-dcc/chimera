// Seed: 4246837317
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output wor id_3,
    input wor id_4,
    input uwire id_5,
    output tri1 id_6,
    output supply1 id_7,
    input wire id_8,
    output wire id_9
);
  wire id_11;
  assign id_6 = id_0;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    input wire id_2,
    output wire id_3
    , id_20,
    input tri1 id_4,
    input uwire id_5,
    input wire id_6,
    input tri1 id_7,
    output wire id_8,
    input supply1 id_9,
    input tri1 id_10,
    output tri id_11,
    input supply1 id_12,
    input wor id_13,
    input wor id_14,
    input wor id_15,
    inout wand id_16,
    input wire id_17,
    output supply1 id_18
);
  genvar id_21;
  assign id_8 = 1 ? id_5 : id_20 ? 1'd0 : id_17;
  id_22(
      .id_0(1'b0), .id_1(1), .id_2(1), .id_3((id_16))
  );
  wor id_23 = 1'h0;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_2,
      id_3,
      id_4,
      id_0,
      id_3,
      id_11,
      id_2,
      id_18
  );
  assign modCall_1.type_3 = 0;
  assign id_3 = 1 ? id_4 : 1;
endmodule
