// Seed: 1471808885
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
    id_11,
    id_12
);
  inout wire id_12;
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
  reg id_13;
  reg id_14, id_15;
  id_16 :
  assert property (@(posedge id_2 - id_10 or posedge 1'b0) 1)
  else begin : LABEL_0
    id_5 <= id_13;
  end
  assign id_13 = id_14 ? 1 : id_14;
  always $display(id_14);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  always id_3 <= 1;
endmodule
