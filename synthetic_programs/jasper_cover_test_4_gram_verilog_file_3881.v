module module_0 #(
    parameter id_1 = id_1,
    parameter id_2 = id_2,
    parameter id_3 = id_3,
    parameter id_4 = id_1,
    parameter id_5 = id_2
) (
    input id_6,
    output logic id_7,
    output logic id_8,
    input id_9,
    input logic id_10,
    input id_11,
    output logic [id_7 : id_11] id_12,
    output id_13,
    output id_14,
    input id_15,
    output id_16,
    output [id_4 : id_7] id_17,
    output [id_15 : id_12] id_18,
    input id_19,
    output [id_10 : id_18] id_20
);
  assign id_1 = id_17 ? id_14 : id_20;
  always @(posedge id_14) begin
    id_8 <= id_4;
  end
  id_21 id_22 (
      .id_23(id_24),
      .id_25(id_23)
  );
  logic id_26;
  assign id_23[id_24] = id_26 ? id_22 : 1 ? id_24 : id_24;
  id_27 id_28 (
      .id_22(1),
      .id_24(id_26)
  );
  id_29 id_30 (
      .id_26(id_26),
      .id_28(id_24)
  );
  logic id_31;
  assign id_24 = id_22;
  id_32 id_33 (
      .id_25(id_26),
      .id_25(id_30)
  );
  logic id_34;
endmodule
