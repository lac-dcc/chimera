// Seed: 329116359
module module_0 #(
    parameter id_10 = 32'd36,
    parameter id_8  = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] _id_8, id_9, _id_10;
  logic id_11;
  ;
  assign module_1.id_4 = 0;
  assign id_4 = id_8;
  assign id_7 = 1;
  logic [7:0][id_10 : -1 'h0] id_12;
  assign id_6 = id_9[id_8] ? 1 - id_1 : 1'b0;
  id_13 :
  assert property (@(negedge id_8 or id_9, posedge -1) id_8 == id_12[-1])
  else id_13 <= -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd71
) (
    input tri1 id_0,
    input wor id_1,
    output tri1 id_2,
    input supply0 id_3,
    input tri1 _id_4
);
  wire id_6;
  wire [id_4 : 1] id_7;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6
  );
  wire id_8;
endmodule
