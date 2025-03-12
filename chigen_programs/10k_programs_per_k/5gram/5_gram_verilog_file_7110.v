// Seed: 1240611065
module module_0 #(
    parameter id_7 = 32'd23
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  parameter id_6 = 1;
  _id_7 :
  assert property (@(posedge id_1[1>={1'b0, id_7}+1'b0]) id_1)
  else $signed(98);
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout logic [7:0] id_5;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_10,
      id_9,
      id_9
  );
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5[1] = 1'h0;
endmodule
