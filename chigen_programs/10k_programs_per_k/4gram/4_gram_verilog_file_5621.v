// Seed: 602562033
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_3;
  assign id_3[1] = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0(
      id_4, id_2
  );
  always @(posedge id_2 or posedge id_2)
    if (1 - id_2) begin
      id_2 = 1;
    end else if (id_4) id_1 <= 1;
    else id_6 <= 'b0;
endmodule
