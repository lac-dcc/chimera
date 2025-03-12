// Seed: 3871535663
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wand id_3,
    input tri id_4,
    input wand id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri1 id_8,
    input supply0 id_9,
    input tri1 id_10,
    input wire module_0,
    input tri1 id_12,
    input wire id_13,
    output wand id_14,
    input tri1 id_15,
    input wor id_16,
    input tri id_17,
    output wire id_18
);
  parameter id_20 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd57,
    parameter id_4 = 32'd44
) (
    output wand id_0,
    input supply1 id_1,
    input tri1 _id_2,
    input wor id_3,
    input supply0 _id_4,
    output logic id_5,
    input wire id_6,
    input tri0 id_7,
    output wor id_8,
    input tri1 id_9,
    input tri0 id_10,
    input tri1 id_11,
    output supply1 id_12,
    output tri0 id_13,
    output tri0 id_14
);
  logic [id_2 : id_4] id_16;
  always @(id_4 or id_9, -1 or -1 or id_3 or -1) begin : LABEL_0
    id_5 <= -1;
  end
  integer id_17;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_3,
      id_3,
      id_9,
      id_3,
      id_7,
      id_3,
      id_1,
      id_9,
      id_9,
      id_7,
      id_7,
      id_6,
      id_8,
      id_1,
      id_3,
      id_10,
      id_14
  );
  xor primCall (id_14, id_9, id_17, id_6, id_10, id_11, id_7, id_16, id_1);
  wire id_18;
endmodule
