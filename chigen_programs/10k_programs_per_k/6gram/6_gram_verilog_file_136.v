// Seed: 839710300
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  assign module_2.id_7 = 0;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  inout wire id_1;
endmodule
module module_2 (
    output uwire id_0,
    output tri1  id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wand  id_4,
    output logic id_5,
    input  tri0  id_6,
    output logic id_7,
    output logic id_8,
    input  uwire id_9,
    input  wand  id_10,
    output wor   id_11,
    input  wire  id_12,
    input  tri0  id_13
    , id_15
);
  module_0 modCall_1 (
      id_15,
      id_15
  );
  always @(id_13 or 1'b0)
    case (id_10 & -1 & -1'b0)
      1:  id_5 = -1;
      -1: begin : LABEL_0
        id_8 <= -1'h0;
        id_5 <= id_2;
        begin : LABEL_1
          id_5 = id_6;
        end
      end
      -1: id_7 = id_3;
    endcase
  nand primCall (id_11, id_6, id_2, id_15, id_3, id_9, id_12, id_10, id_13);
endmodule
