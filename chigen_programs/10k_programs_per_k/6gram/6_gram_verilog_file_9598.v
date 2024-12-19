// Seed: 1158231162
module module_0 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    output wor id_3,
    input tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    output supply1 id_7,
    output tri1 id_8,
    output wand id_9,
    input wire id_10,
    input wand id_11,
    output tri id_12
);
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2,
    input  tri1  id_3,
    input  uwire id_4,
    output tri0  id_5
);
  always begin : LABEL_0
    #1;
    id_5 = id_3;
    if ("" && 1 && id_4 == (1) && 1 != id_0)
      case (id_3)
        1: id_2 <= id_1;
        default: begin : LABEL_0
          assign id_2 = 1;
        end
      endcase
    id_2 <= id_0;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_5,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5,
      id_5,
      id_4,
      id_3,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
