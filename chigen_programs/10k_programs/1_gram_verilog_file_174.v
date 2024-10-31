// Seed: 3569406115
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  always id_1 = 1'b0;
  id_7(
      !id_4
  );
  assign id_5 = 1;
  always_ff @(*) begin
    $display(1);
    id_3 = id_3[1];
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_6;
  always_comb begin
    id_2 <= id_6[1];
  end
  wire id_7, id_8;
  module_0(
      id_8, id_1, id_6, id_1, id_7
  );
  wire id_9;
endmodule
