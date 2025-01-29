// Seed: 1253791664
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    output wand id_5,
    input wand id_6,
    input wire id_7,
    input wire id_8,
    output supply1 id_9,
    input tri id_10,
    input tri id_11,
    input wand id_12,
    output supply1 id_13,
    input uwire id_14,
    input supply0 id_15
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output wand id_0,
    output tri1 id_1,
    input tri0 id_2,
    input logic id_3,
    input uwire id_4,
    output logic id_5,
    input supply0 id_6
);
  assign id_0 = -1;
  logic [7:0] id_8;
  if (1'b0) begin : LABEL_0
    begin : LABEL_0
      id_9(
          id_2
      );
    end
  end else assign id_8[1] = id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_2,
      id_0,
      id_1,
      id_6,
      id_6,
      id_6,
      id_0,
      id_4,
      id_4,
      id_2,
      id_1,
      id_2,
      id_6
  );
  wire id_10;
  assign id_1 = 'b0;
  wire id_11;
  final id_5 <= id_3;
  wire id_12, id_13;
endmodule
