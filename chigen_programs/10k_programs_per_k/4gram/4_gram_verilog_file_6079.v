// Seed: 2625813610
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
  wire id_3;
endmodule
module module_1 #(
    parameter id_4 = 32'd46
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  output wire _id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_5;
  ;
  struct packed {
    logic [1 'b0 : -1 'h0] id_6;
    id_7 id_8;
  } [1 'b0 : id_4]
      id_9, id_10;
  module_0 modCall_1 (
      id_5,
      id_2
  );
  wire id_11 = id_5;
  assign id_9 = id_2;
  assign id_10[1] = 1;
endmodule
