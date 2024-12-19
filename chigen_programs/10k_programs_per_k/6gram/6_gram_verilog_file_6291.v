// Seed: 3383779273
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
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_17;
  wire id_18, id_19 = id_18;
  wire id_20;
  wire id_21;
  wire id_22;
  wire id_23;
  assign id_1 = 1;
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
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_4 ? id_16 : id_2;
  id_17(
      .id_0(id_1),
      .id_1(id_5),
      .id_2(id_7 == 1),
      .id_3(""),
      .id_4(id_3 + 1),
      .id_5(1'd0),
      .id_6(1),
      .id_7(id_7)
  );
  always @(posedge 1) begin : LABEL_0
    assume #1  (id_5) $display(1'b0, id_2);
    else $display(id_3);
    #1;
    for (id_10 = 1; 1 !== 1'b0; id_2 = id_5) id_5 = #1 1;
  end
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_10,
      id_10,
      id_4,
      id_14,
      id_10,
      id_10,
      id_7,
      id_4,
      id_15,
      id_11,
      id_7,
      id_10,
      id_14
  );
endmodule
