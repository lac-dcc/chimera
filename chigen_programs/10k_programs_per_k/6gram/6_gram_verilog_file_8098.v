// Seed: 3107837039
module module_0 (
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
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_16;
  always @(posedge 1 or posedge id_3(id_14
  ))
  begin : LABEL_0
    id_10 = #id_17 1;
  end
  wire id_18;
  wor  id_19 = 1, id_20;
  assign id_18 = id_16;
  wor  id_21 = 1;
  wire id_22;
  id_23(
      .id_0(id_11)
  );
  tri id_24 = 1 + 1'b0;
  assign id_1 = id_16;
  uwire id_25 = 1'b0;
  assign id_3 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    wait (id_6);
    #1 id_5 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4,
      id_6,
      id_3,
      id_5,
      id_6,
      id_2,
      id_3,
      id_4,
      id_4
  );
endmodule
