// Seed: 808626707
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  parameter id_4 = "";
  string id_5 = "";
endmodule
module module_1 #(
    parameter id_0 = 32'd4
) (
    input supply0 _id_0,
    input tri0 id_1,
    output tri1 id_2,
    output supply1 id_3,
    input tri id_4
    , id_16,
    input wire id_5,
    output tri1 id_6,
    output uwire id_7,
    input supply1 id_8,
    input wand id_9,
    input supply0 id_10,
    input tri0 id_11,
    input tri id_12,
    output tri1 id_13,
    output wire id_14
);
  logic [1 : id_0  ==  -1] id_17;
  ;
  wand id_18 = id_16[1], id_19 = !id_8, id_20 = 1'b0, id_21 = id_4 == -1, id_22 = 1, id_23 = 1;
  assign id_17 = id_11;
  parameter id_24 = 1;
  module_0 modCall_1 (
      id_22,
      id_24,
      id_20
  );
  id_25 :
  assert property (@(negedge 1 or posedge -1) id_22)
  else;
endmodule
