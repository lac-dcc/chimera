// Seed: 1097035728
module module_0 (
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
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_12 = 1 > ~1 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  if ('d0) wire id_7, id_8, id_9;
  else begin : LABEL_0
    assign id_7 = id_9;
  end
  id_10(
      (id_6)
  );
  xnor primCall (id_5, id_2, id_12, id_11, id_4, id_6, id_3, id_8, id_7, id_9, id_13);
  wire id_11;
  assign id_10 = (id_5);
  wire [1 : ~&  1] id_12;
  id_13 :
  assert property (@(posedge 1 or posedge 1) -1'b0)
  else;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5,
      id_12,
      id_13,
      id_7,
      id_13,
      id_11,
      id_8,
      id_10
  );
endmodule
