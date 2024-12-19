// Seed: 1298368731
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_8(
      .id_0(1),
      .id_1(1),
      .id_2(id_6),
      .id_3(id_7),
      .id_4(1 == 1'b0),
      .id_5(1),
      .id_6(1 << id_2++),
      .id_7(id_6),
      .id_8(id_3 & id_5),
      .id_9(1'b0 == 1),
      .id_10(id_2),
      .id_11(id_2),
      .id_12(1)
  );
  wire id_9;
  wire id_10;
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    wire id_14 = id_3;
    always @(posedge 1) begin : LABEL_0
      if (id_7 * ~id_2) id_7 <= id_5;
      else begin : LABEL_0
        `define pp_15 0
        id_12 <= #1 1 - 1;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_8,
      id_11,
      id_13,
      id_13,
      id_8,
      id_2,
      id_14
  );
endmodule
