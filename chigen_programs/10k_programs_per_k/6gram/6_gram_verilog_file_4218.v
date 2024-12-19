// Seed: 2250882187
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
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
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always force id_7 = 1;
  wire id_9;
  always @(posedge id_4) begin : LABEL_0
    id_6 = id_8;
    {1'b0} <= id_4;
  end
  module_0 modCall_1 (
      id_1,
      id_9,
      id_6,
      id_9,
      id_6,
      id_6
  );
  assign id_1 = 1;
  wire id_10 = id_8;
  assign id_6 = 1;
endmodule
