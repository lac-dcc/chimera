// Seed: 1255948862
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = 1 | id_5;
  wire id_7;
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    if (id_7) id_9 <= id_4;
    else begin : LABEL_0
      id_5 <= 1'd0 ^ id_11;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_2,
      id_7,
      id_10
  );
endmodule
