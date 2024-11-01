// Seed: 1628399691
module module_0 (
    output uwire id_0
    , id_22,
    input wor id_1,
    input uwire id_2,
    input wor id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri id_6,
    output tri id_7,
    input supply1 id_8,
    output wire id_9,
    input wire id_10,
    output tri1 id_11,
    output supply1 id_12,
    input tri1 id_13,
    input uwire id_14,
    input uwire id_15,
    output tri id_16,
    input wand id_17,
    input wire id_18,
    output wor id_19,
    input supply0 id_20
);
  assign id_16 = id_10 - id_14;
  assign id_19 = 1;
  supply1 id_23;
  assign id_9 = id_17;
  id_24(
      .id_0('b0), .id_1(1), .id_2(id_7), .id_3(1), .id_4('b0), .id_5(id_18)
  );
  wire id_25;
  wand id_26;
  assign id_7 = {1 & 1 & ""{id_13}};
  wire id_27;
  wire id_28;
  assign id_26 = 1;
  generate
    assign id_23 = id_17;
  endgenerate
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output tri1 id_2,
    output tri id_3,
    input supply1 id_4,
    input supply0 id_5
);
  module_0(
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_4,
      id_3,
      id_1,
      id_3,
      id_5,
      id_3,
      id_2,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_5,
      id_3,
      id_4
  );
endmodule
