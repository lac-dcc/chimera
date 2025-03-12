// Seed: 4022335896
module module_0 (
    output tri id_0,
    input wand id_1,
    input wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wire id_5,
    input tri0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input supply1 id_9,
    output uwire id_10,
    output wand id_11,
    output tri0 id_12,
    output uwire id_13#(
        .id_22(1),
        .id_23(1),
        .id_24(1)
    ),
    output wire id_14,
    output tri0 id_15,
    input wire id_16,
    input wand id_17,
    input tri0 id_18,
    input wor id_19,
    input supply0 id_20
);
  always id_22 <= id_19;
  wire id_25, id_26;
  assign id_10 = id_26;
  assign id_11 = -1;
  assign module_1._id_7 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd91,
    parameter id_7 = 32'd47,
    parameter id_8 = 32'd7
) (
    input tri1 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wand _id_5,
    input tri1 id_6[id_5 : 1],
    input supply1 _id_7,
    input wand _id_8,
    output uwire id_9
);
  logic id_11;
  assign id_9 = -1;
  module_0 modCall_1 (
      id_9,
      id_4,
      id_4,
      id_0,
      id_6,
      id_3,
      id_4,
      id_6,
      id_6,
      id_0,
      id_2,
      id_9,
      id_2,
      id_2,
      id_2,
      id_9,
      id_0,
      id_1,
      id_4,
      id_6,
      id_3
  );
  assign id_9 = 1'h0;
  wire id_12, id_13;
  wire [id_7  ||  id_8 : -1] id_14, id_15, id_16;
endmodule
