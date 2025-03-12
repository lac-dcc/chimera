// Seed: 2326884662
program module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  assign module_1.id_1 = 0;
  inout wire id_1;
  localparam id_3 = {-1, 1, 1};
endprogram
module module_1 (
    id_1
);
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign id_1 = 1;
endmodule
module module_2 (
    input wire id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    input tri id_4,
    input tri0 id_5,
    input wor id_6,
    output tri id_7,
    input tri1 id_8,
    output supply0 id_9,
    input wand id_10,
    output wor id_11,
    output tri1 id_12
);
endmodule
module module_3 #(
    parameter id_0 = 32'd70
) (
    output wire _id_0,
    output wire id_1,
    output wand id_2,
    output uwire id_3,
    input wire id_4,
    input tri1 id_5,
    output wor id_6,
    output wor id_7,
    input uwire id_8,
    input tri1 id_9,
    output logic id_10,
    input wire id_11,
    input supply1 id_12,
    input tri1 id_13,
    input tri id_14,
    output supply1 id_15,
    output wor id_16,
    input wand id_17,
    output wire id_18,
    input supply1 id_19,
    input wor id_20,
    input tri0 id_21,
    output tri1 id_22[id_0 : -1 'b0]
);
  always_ff id_10 = id_21;
  module_2 modCall_1 (
      id_20,
      id_11,
      id_20,
      id_4,
      id_9,
      id_12,
      id_4,
      id_3,
      id_19,
      id_2,
      id_9,
      id_16,
      id_22
  );
  assign modCall_1.id_4 = 0;
endmodule
