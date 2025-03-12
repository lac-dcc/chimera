// Seed: 658069323
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout supply0 id_2;
  output wire id_1;
  assign id_2 = id_5 ? -1'b0 + id_2 : 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd92
) (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire [1 : 'b0] _id_3;
  logic id_4;
  ;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = id_3;
  wire [id_3 : -1 'b0] id_5;
endmodule
