// Seed: 339417066
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_15 = 32'd36
) (
    input tri0 id_0,
    output wor id_1,
    output logic id_2,
    input supply0 id_3,
    output logic id_4,
    output tri1 id_5,
    output tri0 id_6,
    input uwire id_7,
    input supply1 id_8,
    input tri id_9,
    output wand id_10,
    output wor id_11,
    input tri1 id_12,
    input wire id_13,
    input wire id_14,
    input supply0 _id_15,
    input uwire id_16,
    input supply0 id_17
);
  assign id_4 = id_15;
  assign id_2 = id_7;
  assign id_5 = id_12;
  wire [id_15 : -1] id_19;
  always begin : LABEL_0
    id_4 <= -1;
    id_2 <= 'b0;
  end
  and primCall (id_6, id_0, id_14, id_8, id_9, id_3, id_13, id_16, id_12, id_7, id_17);
  module_0 modCall_1 (
      id_19,
      id_19,
      id_19
  );
endmodule
