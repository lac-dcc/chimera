// Seed: 2180049048
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wire id_7,
    input wor id_8,
    output supply0 id_9,
    output supply1 id_10,
    output tri id_11,
    output tri1 id_12,
    output wor id_13,
    input supply0 id_14,
    input tri id_15,
    input supply0 id_16,
    output supply0 id_17,
    output wor id_18,
    input tri id_19,
    output tri id_20,
    input supply1 id_21,
    output tri id_22,
    input supply0 id_23,
    input supply0 id_24,
    output wire id_25
);
  wire id_27;
  supply0 id_28;
  wand id_29 = 1'b0;
  assign id_20 = 1;
  generate
    for (id_30 = 1; id_14; id_25 = 1'b0) begin : LABEL_0
      tri id_31 = id_15;
    end
  endgenerate
endmodule
module module_1 (
    input tri0 id_0,
    output tri id_1,
    input uwire id_2,
    input supply1 id_3,
    input wor id_4,
    output supply1 id_5,
    output supply1 id_6,
    input logic id_7,
    output logic id_8
);
  logic [7:0] id_10, id_11;
  always @(id_10[1] or negedge 1) begin : LABEL_0
    id_8 += id_2;
  end
  always @(posedge id_4 or negedge 1'b0 == 1) id_8 = #1 id_7;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_0,
      id_0,
      id_3,
      id_2,
      id_3,
      id_0,
      id_2,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_3,
      id_3,
      id_2,
      id_6,
      id_5,
      id_2,
      id_6,
      id_4,
      id_1,
      id_2,
      id_4,
      id_5
  );
  assign modCall_1.type_40 = 0;
  id_12(
      .id_0(id_4 & ""),
      .id_1(id_3 * 1 - 1),
      .id_2(1),
      .id_3(1'b0),
      .id_4(id_1),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(1'h0),
      .id_9(("")),
      .id_10()
  );
endmodule
