// Seed: 2712003658
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout supply1 id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_10 :
  assert property (@(posedge id_7) 1 != {id_7, id_7})
  else disable id_11;
  assign id_9 = -1;
  string id_12 = "";
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  xnor primCall (id_3, id_6, id_7, id_2, id_4, id_5);
  inout wire id_2;
  output wire id_1;
  logic id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_4,
      id_6,
      id_1,
      id_2,
      id_2,
      id_6
  );
  assign modCall_1.id_9 = 0;
endmodule
