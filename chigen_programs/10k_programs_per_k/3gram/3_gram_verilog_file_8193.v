// Seed: 3584153704
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
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_12;
  assign id_5 = id_6;
  assign id_5 = {1'b0, id_9};
  wire id_13;
  wire id_14;
  wire id_15;
  wire id_16;
  wire id_17;
  assign module_1.type_0 = 0;
  id_18 :
  assert property (@(posedge 1) id_8)
  else id_12[1] <= 1;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1
);
  assign id_3 = id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
