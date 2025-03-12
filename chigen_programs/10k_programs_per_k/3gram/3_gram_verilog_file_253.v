// Seed: 2216775447
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output tri1 id_2,
    input wire id_3,
    input wire id_4,
    input tri id_5,
    output tri id_6,
    output supply1 id_7,
    input tri id_8,
    output uwire id_9
);
  assign id_2 = id_8;
  wire id_11;
  wire id_12;
  wire id_13;
  parameter id_14 = 1;
  localparam id_15 = -1'h0;
endmodule
module module_1 #(
    parameter id_5 = 32'd76
) (
    input wor id_0,
    input supply0 id_1,
    output tri1 id_2,
    output wand id_3,
    output uwire id_4,
    input wor _id_5,
    input supply0 id_6,
    output tri id_7,
    output tri1 id_8,
    input supply1 id_9,
    input supply1 id_10
    , id_17,
    input uwire id_11,
    output tri id_12,
    inout tri id_13,
    output wire id_14,
    output tri1 id_15
);
  assign id_15 = -1;
  xor primCall (id_4, id_17, id_19, id_0, id_13, id_1, id_6, id_11, id_9);
  wire id_18;
  logic [id_5 : 1] id_19 = {id_0{1 ? -1 : id_5}};
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_9,
      id_13,
      id_13,
      id_3,
      id_7,
      id_11,
      id_4
  );
  assign modCall_1.id_9 = 0;
  assign id_2 = id_9;
endmodule
