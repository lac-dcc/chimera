// Seed: 3952464031
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
  always @(posedge id_4 == 1 or posedge id_3) begin : LABEL_0
    id_2 = 1 & id_3;
  end
  assign id_1 = 1;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 (
    input supply0 id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri id_4,
    output supply0 id_5,
    output tri1 id_6
);
  supply1 id_8 = id_1;
  tri1 id_9;
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(id_4 + 1),
      .id_2(id_8),
      .id_3(1),
      .id_4(id_2),
      .id_5(""),
      .id_6(id_9),
      .id_7(id_10),
      .id_8(1),
      .id_9(id_6)
  );
  assign id_9 = 1;
endmodule
module module_3 (
    output wand id_0,
    input supply1 id_1,
    output logic id_2,
    input tri1 id_3,
    input uwire id_4,
    input wire id_5,
    input uwire id_6,
    output uwire id_7,
    input supply1 id_8,
    input wire id_9,
    input logic id_10,
    input supply0 id_11,
    output supply0 id_12,
    input wire id_13,
    output tri1 id_14,
    input supply0 id_15,
    input wire id_16,
    input wand id_17,
    input wor id_18,
    input uwire id_19,
    input logic id_20,
    input tri id_21,
    input wand id_22,
    input wor id_23
);
  always @(posedge id_17 or posedge 1 & 1)
    if (1)
      if (id_20) begin : LABEL_0
        id_2 = id_10;
      end else if (((1)) & id_20) id_2 <= id_20;
  or primCall (
      id_14,
      id_20,
      id_11,
      id_1,
      id_17,
      id_5,
      id_6,
      id_8,
      id_22,
      id_15,
      id_23,
      id_10,
      id_3,
      id_13,
      id_16,
      id_19,
      id_9,
      id_21,
      id_4
  );
  module_2 modCall_1 (
      id_22,
      id_18,
      id_13,
      id_13,
      id_16,
      id_0,
      id_14
  );
endmodule
