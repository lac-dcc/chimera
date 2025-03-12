// Seed: 97611624
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output logic [7:0] id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  localparam id_13 = 1;
  assign id_7[1] = "";
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    output logic id_2,
    output tri id_3,
    output wor id_4,
    input tri1 id_5,
    input supply0 id_6,
    output tri1 id_7
);
  logic id_9;
  assign id_9[1 :-1] = 1 != id_6;
  assign id_3 = -1'b0;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_9,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
  id_11 :
  assert property (@(posedge id_9) 1 & 1)
  else begin : LABEL_0
    id_2 <= 1;
  end
  wire id_12;
endmodule
