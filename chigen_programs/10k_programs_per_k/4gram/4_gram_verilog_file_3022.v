// Seed: 168528768
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output uwire id_5;
  inout supply0 id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = -1;
  assign id_5 = id_3 ? 1 : (-1'b0);
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd62,
    parameter id_3 = 32'd27,
    parameter id_4 = 32'd90
) (
    input supply1 id_0,
    inout supply0 _id_1
);
  assign id_1 = id_1;
  _id_3 :
  assert property (@(negedge id_0) 1'b0 | -1)
  else $signed(id_1);
  ;
  logic _id_4;
  parameter id_5 = 1;
  wand [id_3 : id_1  -  id_4  ^  1] id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5
  );
endmodule
