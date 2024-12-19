// Seed: 1107246989
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_8;
  initial id_5 = #1 id_8;
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
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1'h0;
  assign id_3[1] = 1'o0 ? 1 : id_8;
  assign id_8 = id_6;
  tri id_10 = 1;
  or primCall (id_5, id_4, id_12, id_8, id_9, id_7, id_2, id_11, id_10, id_6);
  wire id_11 = id_7, id_12;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_9,
      id_5,
      id_8,
      id_5,
      id_5
  );
  initial begin : LABEL_0
    id_8 <= 1;
    disable id_13;
  end
  assign id_1[1] = 1;
endmodule
