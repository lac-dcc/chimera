// Seed: 261729168
module module_0 (
    input uwire id_0,
    input tri0 module_0,
    output tri0 id_2,
    input wand id_3,
    input tri id_4,
    input wor id_5,
    input tri1 id_6,
    input uwire id_7,
    input tri1 id_8,
    output tri0 id_9,
    input uwire id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri1 id_13
);
  supply0 id_15 = 1'b0;
  wire id_16, id_17;
  assign module_1.id_6 = 0;
  wire id_18;
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    input wire id_2,
    input logic id_3,
    input tri id_4,
    input wor id_5,
    output logic id_6,
    input tri0 id_7,
    input wand id_8,
    input supply1 id_9
);
  always @(1'b0) begin : LABEL_0
    id_0 = id_1 << id_7;
    id_6 = #id_11 id_3;
  end
  wire id_12;
  wire id_13;
  wire id_14;
  id_15(
      .id_0(0), .id_1(id_7), .id_2(id_1), .id_3(1'h0)
  );
  module_0 modCall_1 (
      id_8,
      id_2,
      id_0,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_0,
      id_9,
      id_7,
      id_7,
      id_8
  );
endmodule
