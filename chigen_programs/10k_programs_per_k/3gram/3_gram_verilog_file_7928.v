// Seed: 964625661
module module_0 (
    input tri1 id_0
    , id_2
);
  logic id_3;
  ;
endmodule
module module_1 (
    input  wor id_0,
    output tri id_1,
    input  tri id_2
);
  wire id_4;
  integer id_5;
  module_0 modCall_1 (id_0);
  always @(posedge id_4) id_5 <= id_5 * -1;
  wire id_6;
  ;
  wire id_7;
  integer [-1 : 1] id_8;
  ;
endmodule
module module_2 #(
    parameter id_1 = 32'd90,
    parameter id_2 = 32'd24
) (
    output tri0  id_0,
    input  uwire _id_1,
    input  tri1  _id_2
);
  id_4 :
  assert property (@(negedge id_1) id_4)
  else begin : LABEL_0
    id_4[~id_1+id_1*id_2+:""<<{id_2, -1?-1 : ""==id_2}] = id_2 ^ -1;
  end
  parameter id_5 = 1;
  wire id_6;
endmodule
module module_3 #(
    parameter id_15 = 32'd96,
    parameter id_3  = 32'd49,
    parameter id_7  = 32'd63
) (
    input wand id_0,
    input wor id_1,
    output tri id_2,
    input wor _id_3,
    input wor id_4,
    input uwire id_5,
    input tri id_6,
    input wor _id_7,
    output uwire id_8,
    output supply1 id_9,
    output uwire id_10,
    output wor id_11,
    output wire id_12,
    input tri1 id_13
);
  parameter id_15 = 1;
  wire [id_7 : -1] id_16;
  assign id_16 = id_3;
  wire [id_3 : id_15] id_17;
  wire ["" : id_7] id_18;
  final $clog2(id_15);
  ;
  module_2 modCall_1 (
      id_9,
      id_15,
      id_15
  );
endmodule
