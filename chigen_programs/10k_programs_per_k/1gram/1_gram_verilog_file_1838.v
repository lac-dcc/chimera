// Seed: 2757110381
module module_0 (
    output supply1 id_0,
    input tri id_1,
    output tri id_2,
    output supply0 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input uwire id_7,
    output uwire id_8,
    input wand id_9,
    output supply0 id_10,
    input wire id_11,
    output logic id_12,
    output wor id_13
);
  assign id_2 = 1;
  always id_12 <= id_11 >> id_5;
  logic id_15;
  assign id_12 = -1;
  wire id_16;
  assign id_0  = id_1;
  assign id_10 = 1'h0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    inout  tri1  id_2
);
  initial id_0 <= -1;
  wire id_4;
  id_5 :
  assert property (@(id_2) id_1) begin : LABEL_0
    begin : LABEL_1
      this = (id_2) == ^1;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_11 = 0;
  assign id_5 = {1'b0 - id_5{id_5}};
endmodule
