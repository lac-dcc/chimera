// Seed: 1817890669
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_7;
endmodule
module module_1 #(
    parameter id_6 = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  _id_6 :
  assert property (@(posedge id_4) id_4[id_6-:1])
  else $clog2(64);
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_2
  );
endmodule
