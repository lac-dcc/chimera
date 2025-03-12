// Seed: 3263052771
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd94,
    parameter id_2 = 32'd17,
    parameter id_3 = 32'd75,
    parameter id_7 = 32'd55,
    parameter id_8 = 32'd38
) (
    input supply0 id_0,
    output tri0 _id_1,
    input tri1 _id_2,
    output tri0 _id_3,
    output uwire id_4
);
  wire id_6, _id_7, _id_8, id_9;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_9,
      id_6,
      id_6,
      id_10,
      id_6,
      id_9
  );
  assign id_7 = id_10;
  logic id_11;
  real  id_12;
  ;
  logic id_13[1 : 1  ==  id_8  #  (
      .  id_8(  1  ),
      .  id_3(  id_3  ),
      .  id_2(  id_1  ),
      .  id_7(  id_2  )
)];
  ;
  logic id_14;
  reg   id_15;
  rnmos (.id_0(1), .id_1(1), .sum(1), .id_2(-1), .id_3(-1));
  id_16 :
  assert property (@(posedge 1 or id_10 & id_14) -1)
  else id_15 <= id_2;
endmodule
