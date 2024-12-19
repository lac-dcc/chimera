// Seed: 3615699272
module module_0;
  assign id_1 = 1;
  wire id_2;
  id_3(
      id_1, 1'b0, id_2
  );
  tri0 id_4, id_5, id_6, id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  logic [7:0] id_12;
  wire id_13;
  assign id_5 = 1;
  assign id_12[1 : 1] = 1;
endmodule
module module_1 (
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
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always begin : LABEL_0
    if (1'b0) id_4 = id_8;
    else @(id_2);
  end
  assign id_11 = id_2[1];
  assign id_9  = 1;
  module_0 modCall_1 ();
  initial
    @(1 or negedge id_6 or posedge 1)
      if (1) assign id_3 = 1;
      else id_4 <= id_8;
endmodule
