// Seed: 3670894784
module module_0 #(
    parameter id_9 = 32'd40
) (
    input tri0 id_0,
    input uwire id_1,
    output uwire id_2,
    output tri id_3,
    output supply0 id_4,
    input tri id_5,
    output wand id_6,
    output tri0 id_7,
    input tri0 id_8,
    input wor _id_9,
    output tri1 id_10,
    output uwire id_11
);
  logic id_13;
  ;
  logic [id_9 : 1] id_14 = ~1;
endmodule
module module_1 #(
    parameter id_10 = 32'd60,
    parameter id_4  = 32'd50,
    parameter id_6  = 32'd27
) (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    output supply0 id_3,
    output tri _id_4
);
  parameter id_6 = 1;
  logic [7:0][1 : 1] id_7;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
  assign id_4 = id_7;
  assign id_3 = 1;
  static logic [id_6 : id_4] id_8;
  wire id_9;
  ;
  wire _id_10;
  ;
  assign id_10 = id_10;
  logic [7:0] id_11;
  assign id_7[-1] = 1;
  assign id_7 = id_6;
  logic [id_10 : 1 'b0] id_12;
  logic id_13 = id_11[1 :-1];
endmodule
