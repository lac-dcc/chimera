// Seed: 2730903007
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output tri id_2,
    output wand id_3,
    output supply0 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input supply0 id_7
);
  assign id_0 = id_6 != -1;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd43,
    parameter id_4  = 32'd46,
    parameter id_7  = 32'd68
) (
    output supply0 id_0,
    input wor id_1,
    output wand id_2,
    output supply1 id_3,
    input wor _id_4,
    output tri id_5,
    output uwire id_6,
    input supply0 _id_7,
    output supply0 id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_8,
      id_2,
      id_6,
      id_0,
      id_1,
      id_1
  );
  logic _id_10;
  ;
  logic id_11;
  wire [1 : id_4  < ""] id_12;
  logic [id_7 : id_10] id_13;
  bit id_14;
  always @(posedge 1) id_14 = id_11[-1'b0];
endmodule
