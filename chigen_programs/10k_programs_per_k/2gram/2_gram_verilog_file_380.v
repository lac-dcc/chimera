// Seed: 2172362541
module module_0 (
    id_1,
    id_2
);
  output tri1 id_2;
  output logic [7:0] id_1;
  assign id_2 = 1;
  assign id_1[-1] = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd87
) (
    output supply0 id_0,
    output logic id_1,
    input tri0 id_2,
    output tri1 id_3
    , id_11,
    output tri id_4,
    input tri1 _id_5,
    input supply1 id_6,
    input uwire id_7,
    inout tri1 id_8,
    output supply1 id_9
);
  logic [7:0][id_5 : -1] id_12;
  assign id_0 = -1;
  wire id_13;
  parameter id_14 = 1;
  localparam id_15 = ~1;
  wire id_16;
  final assert (id_16);
  assign id_16 = id_15;
  initial begin : LABEL_0
    @(posedge id_11) id_12[id_5-1] <= id_6;
    id_1 = -1'b0;
  end
  module_0 modCall_1 (
      id_12,
      id_16
  );
  assign modCall_1.id_2 = 0;
endmodule
