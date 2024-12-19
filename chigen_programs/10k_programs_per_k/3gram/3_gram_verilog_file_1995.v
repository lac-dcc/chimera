// Seed: 1435303175
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_10 = 1;
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
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wand id_9 = 1;
  assign id_5 = 1;
  assign #id_10 id_10 = id_8;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_9,
      id_5,
      id_1,
      id_2,
      id_2,
      id_2
  );
  always_ff @(negedge id_9) begin : LABEL_0
    id_4 = id_7[1];
    id_7 = id_7;
  end
  assign id_6 = id_8;
endmodule
