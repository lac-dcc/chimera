// Seed: 1297579338
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output supply0 id_1;
  wand  id_6 = 1;
  logic id_7;
  assign id_1 = id_6 - id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout logic [7:0] id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_7,
      id_1,
      id_7,
      id_1,
      id_7
  );
  inout wire id_1;
  always_ff @(id_2) id_8[-1] <= 1;
  always @(posedge id_3) begin : LABEL_0
    force id_1 = 1;
    forever assume ({id_8, id_6 - 1});
  end
endmodule
