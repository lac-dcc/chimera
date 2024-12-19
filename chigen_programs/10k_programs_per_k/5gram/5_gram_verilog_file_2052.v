// Seed: 1259604721
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
    id_10
);
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
  assign id_3  = id_9;
  assign id_10 = id_7;
  id_11 :
  assert property (@(posedge id_8) 1'h0)
  else $display(id_3, 1, 1'b0);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_9,
      id_10,
      id_6,
      id_12,
      id_5,
      id_7,
      id_12,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
