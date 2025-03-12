// Seed: 4294760734
module module_0 (
    output tri   id_0,
    output tri   id_1,
    output uwire id_2,
    output wor   id_3,
    output tri0  id_4,
    output tri   id_5
);
  assign id_0 = -1;
  assign module_1.id_16 = 0;
  wire id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd26,
    parameter id_4  = 32'd72,
    parameter id_7  = 32'd36
) (
    input supply0 id_0,
    input uwire id_1,
    input wor id_2,
    output tri id_3,
    output uwire _id_4,
    input wor id_5,
    input tri id_6,
    output supply1 _id_7,
    output wire id_8,
    output wire id_9,
    input tri1 id_10,
    input supply1 _id_11,
    input tri1 id_12,
    output tri id_13,
    output uwire id_14,
    output wand id_15,
    output uwire id_16,
    output uwire id_17
);
  wire id_19;
  module_0 modCall_1 (
      id_16,
      id_3,
      id_15,
      id_3,
      id_3,
      id_17
  );
  struct packed {
    id_20 id_21;
    struct packed {
      logic [1 'h0 : id_11] id_22;
      logic [id_4 : -1] id_23;
    } [id_7 : 1] id_24;
  } [-1 : 1 'h0] id_25;
endmodule
