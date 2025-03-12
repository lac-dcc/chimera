// Seed: 1259744045
module module_0 (
    input tri  id_0,
    input wand id_1,
    input tri1 id_2
    , id_5,
    input tri1 id_3
);
  always
    case (-1 == 1)
      -1: id_5 <= 1;
      1: id_5 <= "";
      (1) == id_5: id_5 = 1;
      1: id_5 = -1;
      default: begin : LABEL_0
        if (-1) begin : LABEL_1
          id_5 = 1;
        end
      end
    endcase
  assign id_5 = id_1 & 1;
  assign id_5 = -1;
endmodule
module module_1 (
    output logic id_0
    , id_6,
    output wor   id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  tri0  id_4
);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_3
  );
  always @(negedge id_4 or posedge ~id_4 or posedge -1) begin : LABEL_0
    id_0 = id_4 != 1'b0;
    id_6 <= id_2;
    wait (id_3);
  end
  wire  id_7;
  logic id_8;
endmodule
