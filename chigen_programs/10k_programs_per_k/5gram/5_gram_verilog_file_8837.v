// Seed: 2506045895
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9 = id_7;
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
    id_10
);
  input wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always @(1 or posedge id_3 !=? 1) begin : LABEL_0
    id_2 <= id_6;
    if (1) $display(id_3);
  end
  module_0 modCall_1 (
      id_10,
      id_7,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_4
  );
endmodule
