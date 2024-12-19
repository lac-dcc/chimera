// Seed: 2772895695
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
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
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  if (id_6 - 1) tri id_7 = 1;
  else begin : LABEL_0
    wire id_8;
    wire id_9;
  end
  wire id_10;
  wire id_11;
  id_12 :
  assert property (@(posedge id_2) id_6)
  else @(*) id_1 = 1;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_5,
      id_12
  );
endmodule
