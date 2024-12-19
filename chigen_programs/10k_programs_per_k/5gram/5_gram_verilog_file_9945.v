// Seed: 1457893475
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
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_20 = id_20;
  always @(id_18 or posedge id_20) begin : LABEL_0
    @(negedge id_10 == id_9);
  end
  wire id_21;
  wire id_22;
  wire id_23;
  wor  id_24 = id_10;
endmodule
module module_0 #(
    parameter id_22 = 32'd34,
    parameter id_23 = 32'd40
) (
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
    id_17,
    module_1,
    id_18,
    id_19
);
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_6,
      id_5,
      id_10,
      id_6,
      id_18,
      id_9,
      id_2,
      id_2,
      id_9,
      id_18,
      id_14,
      id_6,
      id_12,
      id_11,
      id_6,
      id_7,
      id_12
  );
  wire id_21;
  and primCall (
      id_12, id_11, id_4, id_6, id_18, id_19, id_10, id_2, id_15, id_7, id_16, id_1, id_9
  );
  always_ff @(posedge id_16) id_16 = id_12;
  defparam id_22.id_23 = 1;
endmodule
