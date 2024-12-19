// Seed: 1763529406
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output tri0 id_2,
    input tri id_3,
    input tri1 id_4,
    output tri1 id_5,
    input tri1 id_6,
    input wire id_7,
    input uwire id_8,
    output tri1 id_9,
    input wire id_10,
    input supply1 id_11,
    input tri id_12,
    input supply0 id_13,
    output tri0 id_14
);
  assign id_2 = {1{1}};
  initial
  fork
  join : SymbolIdentifier
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  wand  id_2,
    input  uwire id_3,
    output logic id_4
);
  always #(1) begin : LABEL_0
    if (id_3) begin : LABEL_0
      case (1)
        1: id_0 <= 1;
        id_3: id_0 = id_1;
        1: id_4 <= id_3 & id_3 && id_2 == id_1;
        default: begin : LABEL_0
          disable id_6;
        end
      endcase
    end else id_0 <= id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_3,
      id_2,
      id_6,
      id_3,
      id_6,
      id_2,
      id_6,
      id_6,
      id_3,
      id_2,
      id_3,
      id_6
  );
  assign modCall_1.type_21 = 0;
endmodule
