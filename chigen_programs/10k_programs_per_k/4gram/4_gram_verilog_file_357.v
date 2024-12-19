// Seed: 1261301359
module module_0 (
    output wand id_0,
    input supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wire id_6,
    output wire id_7,
    input wand id_8,
    input wor id_9,
    input wire id_10,
    input wire id_11,
    input tri0 id_12,
    output supply1 id_13,
    output supply0 id_14,
    output supply1 id_15,
    input tri0 id_16,
    output tri0 id_17
);
  wire id_19;
  assign module_1.type_24 = 0;
  id_20(
      ~id_11, 1, module_0 - id_7++, {id_5, (id_5)}, 1, id_8
  );
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input wor id_2,
    input tri id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply0 id_6
    , id_13,
    input wor id_7,
    input wire id_8,
    input logic id_9,
    output logic id_10,
    input supply0 id_11
);
  wor id_14, id_15;
  always @(posedge id_9) begin : LABEL_0
    id_14 = 1'b0;
  end
  tri0 id_16;
  module_0 modCall_1 (
      id_16,
      id_5,
      id_1,
      id_5,
      id_5,
      id_3,
      id_1,
      id_16,
      id_0,
      id_16,
      id_3,
      id_8,
      id_6,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
  final begin : LABEL_0
    id_10 = #id_17(id_15) == id_7 && 1;
  end
  id_18 :
  assert property (@(posedge id_3#(.id_8(""))) id_16)
  else $display(1);
  assign id_15 = 1;
endmodule
