// Seed: 80666011
module module_0 (
    output uwire id_0,
    output supply0 id_1,
    input wire id_2,
    input wire id_3,
    output uwire id_4,
    output uwire id_5,
    output wire id_6,
    output tri1 id_7,
    input supply1 id_8,
    input supply0 id_9,
    output tri0 id_10,
    input tri1 id_11,
    input wand id_12,
    output tri id_13
);
  wire id_15;
endmodule
module module_1 (
    input  tri   id_0,
    output tri   id_1,
    input  logic id_2,
    output uwire id_3,
    input  logic id_4,
    input  wire  id_5,
    input  tri1  id_6,
    input  wire  id_7,
    input  logic id_8,
    output logic id_9,
    output tri0  id_10,
    input  logic id_11,
    input  wire  id_12,
    output logic id_13,
    input  tri1  id_14,
    output tri1  id_15
);
  assign id_1 = 1;
  logic id_17, id_18;
  id_19 :
  assert property (@(negedge 1 or negedge 1 or(1 ? 1 : id_17)) id_4) begin : LABEL_0
    begin : LABEL_0
      id_9 <= 1;
      begin : LABEL_0
        id_13 <= id_2;
        @(posedge 1 or 1) if (1) id_19 <= id_5.id_19 - id_2;
      end
      id_13 <= id_11;
      id_13 <= id_8;
    end
  end
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6,
      id_5,
      id_1,
      id_3,
      id_10,
      id_10,
      id_5,
      id_0,
      id_3,
      id_7,
      id_14,
      id_10
  );
  assign modCall_1.type_5 = 0;
endmodule
