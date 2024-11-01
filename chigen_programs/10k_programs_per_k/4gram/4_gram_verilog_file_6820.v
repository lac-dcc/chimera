// Seed: 3600092326
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1[1'b0] = 1;
  reg id_8;
  always id_8 = #id_9 id_9;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2[1] = {1'd0, 1, id_1};
  logic [7:0] id_3;
  always_ff @(posedge id_3[1'b0]) id_2 = id_3;
  assign id_2[1] = 1;
  wire id_4;
  module_0(
      id_3, id_1, id_4, id_4, id_4, id_4, id_4
  );
  wire id_5;
endmodule
