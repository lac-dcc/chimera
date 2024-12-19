// Seed: 189027406
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign #1 id_4 = 1;
  wire id_5;
endmodule
module module_1 (
    output wire id_0
);
  wire id_3;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
module module_2 (
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
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_13;
  id_14 :
  assert property (@(posedge 1) 1'b0)
  else begin : LABEL_0
    id_11 <= ({1, "", 1 == id_2.sum});
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_13
  );
  assign id_9 = 1;
endmodule
