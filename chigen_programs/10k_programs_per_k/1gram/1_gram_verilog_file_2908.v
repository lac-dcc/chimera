// Seed: 564838581
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wire id_2,
    output wand id_3,
    input wire id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri0 id_7[1 : 1  |  -1],
    output uwire id_8,
    input supply0 id_9,
    output tri1 id_10,
    input tri0 id_11,
    output wor id_12,
    input wire id_13,
    input wand id_14,
    output tri0 id_15,
    input tri1 id_16,
    input wire id_17,
    input supply1 id_18,
    input wand id_19,
    input supply1 id_20,
    output supply0 id_21,
    output tri id_22[-1 : 1],
    output wand id_23
);
  logic id_25;
  assign module_1.id_12 = 0;
  wire id_26;
endmodule
module module_1 #(
    parameter id_20 = 32'd42,
    parameter id_26 = 32'd4
) (
    input wire id_0,
    input uwire id_1,
    input wor id_2,
    input supply1 id_3,
    input uwire id_4,
    output wor id_5,
    inout tri1 id_6,
    output supply1 id_7,
    input supply1 id_8,
    output tri0 id_9,
    output wire id_10,
    output wand id_11,
    output tri1 id_12,
    input wor id_13,
    input supply0 id_14,
    input tri id_15,
    input tri id_16[id_26  &&  !  id_20 : ""],
    input supply1 id_17,
    input tri0 id_18,
    input supply0 id_19,
    output supply0 _id_20,
    input tri id_21,
    input supply1 id_22,
    output wand id_23,
    output wand id_24,
    input supply1 id_25,
    input supply0 _id_26[1 : -1]
);
  wire id_28 [1 'h0 : 1 'b0];
  wire id_29;
  assign id_24 = 1;
  module_0 modCall_1 (
      id_21,
      id_16,
      id_10,
      id_11,
      id_17,
      id_19,
      id_11,
      id_14,
      id_10,
      id_21,
      id_9,
      id_1,
      id_12,
      id_2,
      id_2,
      id_6,
      id_6,
      id_0,
      id_21,
      id_18,
      id_0,
      id_24,
      id_6,
      id_11
  );
  logic id_30;
endmodule
