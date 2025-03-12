// Seed: 1161368242
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_5 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd17
) (
    id_1,
    _id_2
);
  inout wire _id_2;
  input wire id_1;
  logic id_3;
  assign id_3 = id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3
  );
  wire [1 : id_2] id_5;
endmodule
module module_2 (
    input tri1 id_0,
    output uwire id_1,
    input wire id_2,
    output wand id_3,
    input supply1 id_4,
    input uwire id_5,
    output supply1 id_6,
    input wire id_7,
    input uwire id_8,
    output wand id_9
);
  final $clog2(63);
  ;
  wire id_11;
endmodule
module module_3 #(
    parameter id_3 = 32'd1
) (
    input supply0 id_0,
    input tri id_1,
    input wand id_2,
    input supply0 _id_3,
    input wor id_4,
    input wor id_5,
    input wand id_6,
    input wand id_7,
    output supply0 id_8
);
  wire id_10;
  module_2 modCall_1 (
      id_2,
      id_8,
      id_1,
      id_8,
      id_5,
      id_2,
      id_8,
      id_1,
      id_2,
      id_8
  );
  assign modCall_1.id_5 = 0;
  logic [-1 'b0 : id_3] id_11;
  localparam id_12 = 1 & 1;
  always_latch @(-1 or posedge 1) begin : LABEL_0
    id_11 = -1;
    {-1'h0, (1)} <= id_11++;
  end
endmodule
