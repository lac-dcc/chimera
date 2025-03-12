// Seed: 1702797102
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
    id_16,
    id_17
);
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    logic [1 : -1] id_18;
  endgenerate
endmodule
module module_1 (
    input supply1 id_0
    , id_18,
    input wand id_1,
    output tri1 id_2,
    output wor id_3,
    input tri0 id_4,
    input tri0 id_5
    , id_19,
    output supply1 id_6,
    input tri id_7,
    input tri0 id_8,
    input tri0 id_9,
    input wand id_10,
    input wire id_11,
    output supply1 id_12,
    input wand id_13
    , id_20,
    output uwire id_14,
    output wand id_15,
    output tri1 id_16
);
  localparam id_21 = 1;
  module_0 modCall_1 (
      id_21,
      id_19,
      id_19,
      id_18,
      id_20,
      id_19,
      id_21,
      id_19,
      id_19,
      id_20,
      id_19,
      id_21,
      id_19,
      id_20,
      id_20,
      id_20,
      id_21
  );
  always_ff @(posedge -1) begin : LABEL_0
    return id_4;
  end
  static logic id_22 = id_11;
endmodule
