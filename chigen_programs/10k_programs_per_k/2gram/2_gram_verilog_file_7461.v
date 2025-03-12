// Seed: 3315848739
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri id_2,
    input tri id_3,
    output wire id_4,
    output supply1 id_5,
    input uwire id_6,
    output tri0 id_7,
    input wand id_8,
    output tri id_9,
    input wor id_10,
    input wand id_11,
    input tri id_12,
    output supply1 id_13,
    output wor id_14,
    output uwire id_15,
    input tri id_16
);
  assign id_14 = id_16;
  localparam id_18 = "";
endmodule
module module_1 #(
    parameter id_6 = 32'd51,
    parameter id_7 = 32'd49
) (
    input supply0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    output uwire id_3,
    input wand id_4,
    input tri0 id_5,
    input supply1 _id_6,
    input tri1 _id_7
);
  logic id_9;
  wire [id_7 : id_6] id_10;
  assign id_3 = 1;
  buf primCall (id_1, id_10);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_0,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_1,
      id_1,
      id_3,
      id_0
  );
endmodule
