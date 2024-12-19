// Seed: 745388086
module module_0;
  wire id_1;
  wire id_2 = id_1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output logic id_0
    , id_8,
    input logic id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri id_4,
    input wor id_5,
    input logic id_6
);
  logic id_9;
  always
    case (id_1)
      1: id_0 = 1'b0;
      id_6: id_8 <= 1;
      id_9: begin : LABEL_0
        id_0 <= 1;
        if (id_5) id_0 <= 1'b0;
      end
      default: id_8 = 1'b0 ? id_1 : 1;
    endcase
  module_0 modCall_1 ();
endmodule
