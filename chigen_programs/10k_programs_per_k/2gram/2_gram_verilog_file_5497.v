// Seed: 743654423
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  assign module_1.id_3 = 0;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  logic [-1 : 1] id_8;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd14,
    parameter id_4 = 32'd85
) (
    input uwire id_0
    , id_9,
    output supply1 _id_1,
    input tri0 id_2,
    output uwire id_3,
    input wand _id_4,
    input tri id_5,
    output supply1 id_6,
    output wire id_7
);
  wire [id_4 : -1] id_10;
  and primCall (id_6, id_10, id_9, id_0, id_5, id_2);
  module_0 modCall_1 (
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
  logic [-1 : id_1] id_11;
  ;
  assign id_11 = 1;
  assign id_6  = id_5;
endmodule
