// Seed: 1412627697
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
    id_15#(
        .id_16(1),
        .id_17(1),
        .id_18(1)
    ),
    id_19,
    id_20,
    id_21,
    id_22
);
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  final id_4 = id_18 !== 1;
  wire id_23;
  wire id_24;
  assign id_1 = id_22;
  id_25(
      .id_0(""), .id_1(1), .id_2(1'h0)
  );
  reg
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
      id_40,
      id_41,
      id_42,
      id_43,
      id_44,
      id_45,
      id_46,
      id_47,
      id_48,
      id_49,
      id_50,
      id_51 = id_44,
      id_52,
      id_53,
      id_54 = 1,
      id_55,
      id_56,
      id_57,
      id_58,
      id_59,
      id_60,
      id_61,
      id_62;
  assign id_52 = id_32;
  always begin
    if (1) begin
      id_41 <= 1;
    end else begin
      @(posedge id_28 or posedge id_41) assert (id_60);
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  tri0 id_5;
  assign id_5#(
      .id_5(id_5),
      .id_1(id_2),
      .id_1(1)
  ) = id_1;
  module_0(
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
