// Seed: 1449152694
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output tri id_5,
    output tri0 id_6,
    output uwire id_7,
    input tri1 id_8,
    output wire id_9,
    output supply1 id_10,
    input tri id_11
);
  wire id_13;
  localparam id_14 = 1;
  assign id_13 = id_0;
  assign module_1.id_2 = 0;
  assign id_9 = -1;
endmodule
module module_1 #(
    parameter id_5 = 32'd55,
    parameter id_8 = 32'd80
) (
    output supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    output tri1 id_3,
    output wire id_4,
    input wor _id_5,
    output supply1 id_6,
    input tri id_7,
    output tri1 _id_8
);
  module_0 modCall_1 (
      id_7,
      id_1,
      id_7,
      id_2,
      id_7,
      id_0,
      id_6,
      id_0,
      id_2,
      id_6,
      id_3,
      id_2
  );
  wire [-1 'b0 : 1] id_10;
  wor id_11;
  assign id_11 = 1'b0;
  logic [id_8 : id_5] id_12 = -1, id_13;
  assign id_0 = id_7 === id_7;
  logic [-1 : ""] id_14;
  ;
endmodule
