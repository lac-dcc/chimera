// Seed: 3852998351
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_6[1] = 1;
  wire id_7;
  assign id_6[1] = id_2.id_5 ? id_1 : 1;
  assign module_1.id_4 = 0;
  tri id_8;
  assign id_8 = 1;
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
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_1,
      id_7
  );
  always @(1, ({1{!id_7 != 1}})) begin : LABEL_0
    id_4 <= id_6;
  end
  wire id_9;
  uwire id_10, id_11, id_12;
  always @((id_6) or id_5) if (id_10) if (id_12) id_8 <= 1;
endmodule
