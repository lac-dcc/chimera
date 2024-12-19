// Seed: 1036205851
module module_0 (
    output uwire id_0,
    output tri id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4,
    output tri id_5
);
endmodule
module module_1 (
    output wand  id_0
    , id_10,
    output logic id_1,
    inout  logic id_2,
    input  logic id_3,
    input  uwire id_4,
    output tri   id_5
    , id_11,
    input  logic id_6,
    input  logic id_7,
    output tri   id_8
);
  logic id_12, id_13;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_4,
      id_4,
      id_4,
      id_8
  );
  assign modCall_1.type_7 = 0;
  logic id_14;
  initial begin : LABEL_0
    casex (id_4 + (id_3))
      id_7: id_13 <= 1 ? id_13 : id_7;
      id_14, 1'd0 == id_6, id_7, 1, 1, id_6, 1, id_6, 1: id_14 <= 1;
      default: begin : LABEL_0
        id_11 <= 1 - 1;
      end
    endcase
    id_2 <= id_14;
    id_1 <= 1;
    wait (id_7);
    if ((id_12) && id_13 && 1 && id_4) begin : LABEL_0
      id_2 <= id_7;
    end else begin : LABEL_0
      id_2 <= id_3;
    end
  end
endmodule
