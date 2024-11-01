// Seed: 121976230
module module_0 (
    output logic id_0,
    output tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output tri0  id_4,
    output tri1  id_5
);
  initial begin
    id_0 <= 1;
    if (1'b0) assert (~id_2);
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    output uwire id_2,
    input  wire  id_3,
    input  logic id_4,
    output logic id_5,
    input  uwire id_6,
    output tri0  id_7,
    input  tri0  id_8,
    output wor   id_9,
    output uwire id_10
);
  always @(posedge 'h0) begin
    id_5 <= id_4;
  end
  module_0(
      id_5, id_7, id_1, id_8, id_7, id_2
  );
endmodule
