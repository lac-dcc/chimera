// Seed: 3340379259
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output wire id_3,
    output wire id_4,
    input supply1 id_5,
    output tri id_6,
    output wand id_7,
    input supply0 id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    output wire id_12,
    output tri0 id_13
);
  supply1 id_15;
  final $display(1, "", 1, 1 == 1);
  supply0 id_16 = 1;
  tri id_17;
  tri id_18 = id_2;
  always @(posedge 1 && id_15 && id_8 !=? id_18++
  && id_8)
  begin
    if (id_16) begin
      id_12 = id_17;
    end
  end
  assign id_4 = id_9;
  wire id_19;
  always @(id_15 or negedge id_10) begin
    fork
      id_20(id_18 && id_10);
      #1;
    join
  end
endmodule
module module_1 (
    input  wor   id_0,
    input  wand  id_1,
    output wor   id_2,
    input  logic id_3,
    output logic id_4,
    input  uwire id_5
);
  always
    case (1)
      1'b0: id_4 <= id_3;
      1: id_4 = id_3;
    endcase
  supply1 id_7, id_8, id_9, id_10;
  module_0(
      id_10, id_10, id_1, id_9, id_9, id_5, id_7, id_10, id_10, id_1, id_1, id_0, id_2, id_2
  );
  integer id_11;
  xnor (id_2, id_0, id_9, id_10, id_8, id_5, id_3, id_7);
  assign id_9 = id_0;
endmodule
