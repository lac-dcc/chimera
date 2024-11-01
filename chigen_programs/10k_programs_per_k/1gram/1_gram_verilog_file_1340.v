// Seed: 2862852834
module module_0 #(
    parameter id_47 = 32'd5
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
    id_36
);
  inout wire id_36;
  input wire id_35;
  input wire id_34;
  inout wire id_33;
  output wire id_32;
  inout wire id_31;
  output wire id_30;
  input wire id_29;
  inout wire id_28;
  inout wire id_27;
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_37(
      1
  );
  wire id_38, id_39, id_40, id_41, id_42;
  wire id_43, id_44, id_45, id_46;
  defparam id_47 = 1'b0 * 1;
  supply1 id_48, id_49 = 1'b0, id_50;
  assign id_30 = 1;
  assign id_21 = id_31;
  wire id_51;
  wire id_52 = 1;
  assign id_23 = id_36;
endmodule
module module_1 (
    input  supply1 id_0
    , id_3,
    output uwire   id_1
);
  tri  id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  module_0(
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_4,
      id_6,
      id_5,
      id_3,
      id_6,
      id_4,
      id_3,
      id_7,
      id_7,
      id_3,
      id_7,
      id_3,
      id_4,
      id_3,
      id_7,
      id_4,
      id_4,
      id_3,
      id_5,
      id_3,
      id_4,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_4,
      id_5,
      id_3,
      id_7,
      id_4
  ); id_8 :
  assert property (@(posedge id_4) 1'b0) #id_9 $display(id_9);
  wire id_10, id_11, id_12;
endmodule
