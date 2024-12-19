// Seed: 641080980
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  wire id_10 = id_3, id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg  id_8;
  wire id_9;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_5,
      id_9,
      id_6,
      id_4,
      id_6
  );
  always @(posedge id_2) begin : LABEL_0
    id_8 <= 1;
    id_2 <= 1;
  end
endmodule
