// Seed: 1603075771
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
    id_11
);
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
macromodule module_1;
  wire id_1;
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1, id_1
  );
endmodule
module module_2 (
    input wand id_0,
    output supply1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri id_4,
    output tri1 id_5,
    input tri0 id_6,
    input wor id_7,
    output tri1 id_8,
    input wand id_9,
    output supply1 id_10,
    input wor id_11,
    input wand id_12,
    output wire id_13,
    input tri0 id_14,
    input tri1 id_15,
    input supply1 id_16,
    input wire id_17,
    input wand id_18,
    output wor id_19,
    input wire id_20,
    input supply0 id_21,
    input wor id_22,
    input wire id_23,
    input wor id_24
);
  id_26(
      .id_0(id_19),
      .id_1((1)),
      .id_2(1),
      .id_3({id_7, 1} - id_16),
      .id_4(),
      .id_5(id_9),
      .id_6(id_3),
      .id_7(1),
      .id_8(1'h0),
      .id_9(id_2)
  );
endmodule
module module_3 (
    input tri1 id_0,
    input wire id_1,
    output uwire id_2,
    input logic id_3,
    input supply1 id_4,
    output logic id_5,
    output logic id_6
);
  always @(posedge 'h0 or posedge id_1) id_6 <= 1'b0;
  always_comb @(1) id_5 <= id_3;
  module_2(
      id_0,
      id_2,
      id_4,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_2,
      id_1,
      id_0,
      id_4,
      id_4,
      id_1
  );
endmodule
