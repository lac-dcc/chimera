// Seed: 835255918
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
    id_15,
    id_16
);
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_17(
      id_4 - id_8
  );
  wire id_18, id_19;
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
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_14 = id_14;
  wire id_15, id_16;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_15,
      id_5,
      id_7,
      id_2,
      id_15,
      id_4,
      id_15,
      id_16,
      id_16,
      id_8,
      id_7,
      id_7,
      id_10,
      id_10
  );
  for (id_17 = id_9; ~-1'b0; id_4 += -1)
  always begin : LABEL_0
    if (id_11) if (-1) id_11.id_17 <= id_3;
  end
  wire id_18;
  bit id_19, id_20;
  always @(posedge "") id_12 <= {id_19, 1};
endmodule
