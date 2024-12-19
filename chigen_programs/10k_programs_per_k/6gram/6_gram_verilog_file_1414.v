// Seed: 1146113530
module module_0 (
    input wor id_0,
    input supply0 id_1,
    output tri1 id_2
);
  assign id_2 = 1;
  wire id_4;
  assign module_1.id_6 = 0;
  assign id_2 = (1);
  wand id_5 = 1;
  tri1 id_6 = 1;
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    output logic id_2,
    input logic id_3,
    input wor id_4
);
  logic id_6;
  reg   id_7;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1
  );
  always id_7 <= #1 id_6;
  logic id_8;
  logic id_9 = 1 ==? id_7;
  always @(posedge id_6 or posedge id_8)
    case (1)
      1: id_6 = 1'h0 == id_8;
      1: id_2 = 1 && id_3 && 1;
      id_3: id_6 = id_8;
      1: id_7 <= id_9;
      1: id_0 <= 1;
    endcase
  assign id_0 = 1 ? 1 | 1'b0 : id_9;
  wire id_10, id_11;
endmodule
