// Seed: 3599278278
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
program module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7 (id_8),
        .id_9 (id_10),
        .id_11(1),
        .id_12(1)
    ),
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
    id_34
);
  input wire id_28;
  input wire id_27;
  inout wire id_26;
  inout wire id_25;
  output wire id_24;
  input wire id_23;
  inout wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always begin
    id_18 <= id_25;
  end
  wire id_35;
  nand (
      id_24,
      id_40,
      id_13,
      id_3,
      id_6,
      id_44,
      id_20,
      id_17,
      id_25,
      id_29,
      id_16,
      id_9,
      id_42,
      id_22,
      id_38,
      id_19,
      id_28,
      id_7,
      id_34,
      id_26,
      id_1,
      id_35,
      id_33,
      id_41,
      id_30,
      id_23,
      id_27,
      id_39,
      id_37,
      id_21,
      id_43,
      id_11,
      id_31,
      id_32,
      id_4,
      id_36,
      id_15
  );
  wire id_36;
  wire id_37;
  generate
    assign id_1 = id_13 & id_32;
  endgenerate
  supply0 id_38 = 1, id_39, id_40, id_41, id_42;
  reg  id_43;
  wire id_44;
  module_0(
      id_41, id_36, id_34, id_2
  );
  reg id_45;
  assign id_30 = id_28 | 1 <-> id_28;
  id_46(
      .id_0(id_16),
      .id_1(id_29),
      .id_2(id_28 - id_34),
      .id_3({id_21, (1), (1 - 1 || $display(id_18, id_43)), 1}),
      .id_4(id_38),
      .id_5(1)
  );
  wire id_47;
  wire id_48;
  wire id_49;
  initial id_45 <= id_15;
endprogram
