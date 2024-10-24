// Seed: 1189437974
module module_0 (
    input logic id_0,
    input id_1,
    output id_2,
    input logic id_3
    , id_14,
    output id_4,
    input id_5,
    input logic id_6,
    input logic id_7,
    output id_8,
    output id_9,
    output id_10,
    input id_11,
    input logic id_12,
    output id_13
);
  logic id_15;
  logic id_16;
  assign id_9[1] = id_0;
  logic id_17;
  assign id_15 = id_0;
  assign id_15 = 1 ? 1 : id_11 ? id_14 : id_5;
  logic id_18;
  logic id_19;
  integer id_20 (
      .id_0(id_13),
      .id_1(id_17),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_13),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(id_17)
  );
  defparam id_21.id_22 = id_16, id_23.id_24 = 1 & 1'b0, id_25.id_26 = id_16, id_27.id_28 = id_20,
      id_29.id_30 = "", id_31.id_32 = 1, id_33.id_34 = 1;
endmodule
module module_1 (
    input logic id_0,
    output id_1,
    input logic id_2,
    input id_3,
    output logic id_4,
    input logic id_5,
    output id_6,
    input id_7,
    input id_8,
    input logic id_9,
    input id_10,
    input logic id_11,
    output id_12,
    input id_13,
    output id_14,
    input logic id_15
);
  logic id_16;
  type_30 id_17 (
      .id_0(id_11),
      .id_1(id_0),
      .id_2(1'b0),
      .id_3(1),
      .id_4(id_2)
  );
  specify
    (posedge id_18 *> (id_19 +: 1)) = (1'b0 : 1  : {1{id_10}}, ~id_15);
    (id_20 => id_21) = (|id_20  : id_15  : 1, 1);
  endspecify
endmodule
