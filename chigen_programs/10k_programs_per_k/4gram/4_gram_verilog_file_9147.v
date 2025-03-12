// Seed: 3320308418
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  input wire id_30;
  inout wire id_29;
  input wire id_28;
  output wire id_27;
  input wire id_26;
  inout wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire _id_4;
  input wire id_3;
  output logic [7:0] id_2;
  inout logic [7:0] id_1;
  wire id_7;
  ;
  always @(negedge -1) begin : LABEL_0
    wait (id_1[1]);
  end
  and primCall (id_6, id_5, id_1, id_8, id_3, id_7);
  wire id_8;
  ;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_8,
      id_6,
      id_7,
      id_5,
      id_7,
      id_6,
      id_3,
      id_7,
      id_8,
      id_6,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_5,
      id_3,
      id_8,
      id_7,
      id_7,
      id_8,
      id_6,
      id_6,
      id_5,
      id_7,
      id_6,
      id_6,
      id_6
  );
  always @(id_8, posedge 1) begin : LABEL_1
    assert (id_7);
  end
  logic [id_4 : id_4] id_9;
endmodule
