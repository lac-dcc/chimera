// Seed: 2014449161
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output wire id_2,
    input wire id_3,
    inout supply1 id_4,
    output supply1 id_5,
    output tri id_6,
    output wand id_7,
    input supply0 id_8,
    input wand id_9,
    input wor id_10
);
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  tri  id_16;
  assign id_5 = !id_14;
  localparam id_17 = 1'b0;
  tri id_18 = 1;
  localparam id_19 = 1;
  wire id_20;
  always if (-1) id_16 = -1;
  initial $display;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input wand id_2,
    inout wire id_3,
    input wire id_4,
    id_26,
    input wor id_5,
    input tri1 id_6,
    output tri1 id_7,
    input wire id_8,
    input wor id_9,
    input uwire id_10,
    output uwire id_11,
    input tri1 id_12,
    output uwire id_13,
    input wor id_14,
    input uwire id_15,
    input uwire id_16,
    output wand id_17,
    output tri0 id_18,
    output wire id_19,
    input wor id_20,
    input uwire id_21,
    input tri id_22,
    output wire id_23,
    output wor id_24
);
  wire id_27;
  id_28(
      .id_0(1), .id_1(1), .id_2(((id_24))), .id_3(-1), .id_4(id_12), .id_5((-1'b0))
  );
  module_0 modCall_1 (
      id_8,
      id_22,
      id_3,
      id_4,
      id_3,
      id_18,
      id_3,
      id_1,
      id_5,
      id_9,
      id_16
  );
  assign modCall_1.id_18 = 0;
  wor id_29 = id_6;
endmodule
