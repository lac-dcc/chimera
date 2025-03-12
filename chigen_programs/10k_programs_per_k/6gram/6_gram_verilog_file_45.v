// Seed: 3077803004
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output supply1 id_2;
  inout wire id_1;
  assign id_2 = -1;
endmodule
module module_1 (
    output tri   id_0,
    input  tri   id_1,
    output logic id_2
);
  localparam id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_2 = -1 ? {-1, -1, id_1, -1 - (1)} : id_4;
  always @(posedge id_4 or id_4 + -1) begin : LABEL_0
    id_2 <= "";
  end
endmodule
