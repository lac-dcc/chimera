// Seed: 2756607716
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
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36,
    id_37,
    id_38,
    id_39,
    id_40
);
  output wire id_40;
  output wire id_39;
  inout wire id_38;
  output wire id_37;
  output wire id_36;
  output wire id_35;
  inout wire id_34;
  input wire id_33;
  output wire id_32;
  output wire id_31;
  output wire id_30;
  input wire id_29;
  input wire id_28;
  input wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_comb @(id_7 or posedge 1 && id_18 && 1 && id_28) id_23 <= (id_16);
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  always #1 id_2 <= 1;
  always @(posedge id_1)
    @(posedge 1'b0) begin : LABEL_0
      id_3(id_1);
      id_2 <= 1;
      wait (1'b0);
      wait (1);
      id_3 = id_3;
    end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  always @(id_1 + 1, negedge (id_1)) id_2 <= !1 ? id_2 : 1;
  wire id_5;
  assign id_4 = id_5;
endmodule
