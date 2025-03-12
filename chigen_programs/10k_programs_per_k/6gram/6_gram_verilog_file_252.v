// Seed: 2598955843
module module_0 (
    input  tri  id_0,
    output tri1 id_1
);
  assign id_1 = id_0;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output wand id_0,
    output supply0 id_1,
    input uwire id_2,
    input wor id_3,
    output wire id_4,
    input supply0 id_5,
    output wand id_6
    , id_12,
    output wire id_7,
    input uwire id_8,
    output supply1 id_9,
    output wand id_10
);
  logic id_13;
  module_0 modCall_1 (
      id_8,
      id_7
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  assign module_3.id_1 = 0;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(-1 > id_7 or id_1) begin : LABEL_0
    assert (!id_4[-1'h0]);
  end
endmodule
module module_3 #(
    parameter id_1 = 32'd47,
    parameter id_6 = 32'd0
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  input wire id_7;
  input wire _id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  input wire _id_1;
  wire [id_6 : id_6] id_8;
  localparam id_9 = 1 ? 1 : 1;
  wire [id_1 : -1] id_10;
  module_2 modCall_1 (
      id_9,
      id_10,
      id_8,
      id_2,
      id_8,
      id_5,
      id_7,
      id_8,
      id_4,
      id_4,
      id_10,
      id_9
  );
  always @* id_2[1==id_6 : 'b0] = 1;
endmodule
