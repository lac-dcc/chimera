// Seed: 4059212995
module module_0 (
    input  wor  id_0,
    input  wire module_0,
    output wire id_2,
    output wand id_3
);
  initial begin : LABEL_0
    wait (1);
  end
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    output logic id_2,
    output tri id_3,
    input logic id_4,
    input tri0 id_5,
    output supply1 id_6,
    inout logic id_7,
    output logic id_8
);
  assign id_8 = id_1;
  always @(posedge id_0 < 1 or posedge 1 == id_1) begin : LABEL_0
    id_8 <= id_7;
    id_7 = #id_10(id_5 == 1);
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_3,
      id_6
  );
  always @(posedge id_1 or posedge 1)
    case (id_4)
      id_7: if (1) id_8 <= id_7;
      id_0 ^ id_5: id_8 = id_0;
      1: id_2 = id_7;
      default: id_3 = id_5;
    endcase
  or primCall (id_8, id_1, id_4, id_5, id_0, id_10, id_7);
endmodule
