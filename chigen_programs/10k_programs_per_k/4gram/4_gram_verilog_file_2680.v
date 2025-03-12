// Seed: 2372351864
module module_0 (
    input tri id_0,
    input wire id_1,
    input wand id_2,
    input supply1 id_3,
    input wire id_4,
    input wor id_5,
    output uwire id_6,
    output wor id_7,
    output wand id_8
);
  wire id_10;
  assign module_1._id_3 = 0;
  localparam id_11 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd45
) (
    input wire id_0,
    output uwire id_1,
    input wire id_2,
    input supply0 _id_3,
    input tri0 id_4,
    output supply1 id_5
);
  localparam [id_3 : -1] id_7 = -1;
  nor primCall (id_1, id_7, id_0);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_4,
      id_0,
      id_4,
      id_5,
      id_5,
      id_1
  );
endmodule
