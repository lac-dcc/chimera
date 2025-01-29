// Seed: 2353869296
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
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = id_4;
  wire id_10;
  supply1 id_11;
  parameter id_12 = -1;
  assign id_4 = id_12;
  id_13(
      -1'b0, (id_6)
  );
  wire id_14;
  assign id_11 = id_12;
  wire id_15;
  wire id_16;
  assign id_8  = id_16;
  assign id_13 = id_11;
  supply0 id_17 = id_13;
  wire id_18, id_19, id_20;
  wire id_21;
  wire id_22;
  wire id_23;
  wire id_24, id_25, id_26;
  wire id_27;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wand id_6, id_7, id_8, id_9;
  wire id_10;
  reg  id_11;
  generate
    wand id_12, id_13;
    always begin : LABEL_0
      begin : LABEL_0
        if (~id_6 + id_9 * id_13) id_1 <= id_11;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_7,
      id_12,
      id_13,
      id_7,
      id_13,
      id_6
  );
endmodule
