// Seed: 2783210603
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
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always
    if (-1) begin : LABEL_0
      #id_9 #1 id_8 <= id_6;
      id_5 = id_7;
    end
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
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_11, id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_12,
      id_12,
      id_5,
      id_4,
      id_9
  );
  wor id_13;
  always #1 if (id_13) $display;
  initial id_9 <= id_5;
  initial @* id_9 <= id_6;
  nor primCall (id_7, id_3, id_2, id_11, id_4, id_6, id_5, id_12);
endmodule
