// Seed: 3922886196
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri0 id_3,
    output wire id_4,
    input supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8,
    output wand id_9,
    input tri id_10,
    input supply0 id_11
);
  assign #(-1'b0) id_3 = 1'h0 - id_5;
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    input wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    output tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    input uwire id_8,
    input uwire id_9,
    output wand id_10
);
  supply0 id_12;
  integer id_13, id_14;
  wire id_15 = id_0;
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_15,
      id_5,
      id_5,
      id_3,
      id_12,
      id_4,
      id_15,
      id_15,
      id_3,
      id_8
  );
  assign modCall_1.id_1 = 0;
  assign id_12 = -1;
  id_17(
      .id_0(1), .id_1(id_12), .id_2(id_6), .id_3(-1), .id_4(1), .id_5(id_5 * id_0), .id_6(id_9)
  );
  assign id_12 = id_9;
  wire id_18;
  localparam integer id_19 = -1'd0 && id_9;
  wire id_20, id_21, id_22;
  wire id_23;
  wire id_24, id_25, id_26;
endmodule
