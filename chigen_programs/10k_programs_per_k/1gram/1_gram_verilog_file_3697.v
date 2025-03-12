// Seed: 2199461202
module module_0 (
    output tri id_0
);
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    input supply0 id_2
);
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endmodule : SymbolIdentifier
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_5 = 1;
  struct packed {
    logic id_6;
    id_7  id_8;
    logic id_9;
  } id_10;
  id_11 :
  assert property (@(id_10.id_9) -1'b0) id_10.id_7 <= id_10.id_6 - id_5;
  logic id_12;
  ;
  assign id_11 = 1;
  wire  id_13 = ~id_10 - 1;
  logic id_14;
endmodule
module module_3 #(
    parameter id_3 = 32'd19,
    parameter id_7 = 32'd56,
    parameter id_9 = 32'd46
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    id_10,
    id_11[1 : ""]
);
  inout logic [7:0] id_11;
  output wire id_10;
  module_2 modCall_1 (
      id_8,
      id_5,
      id_5,
      id_5
  );
  input wire _id_9;
  input wire id_8;
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  output wire id_2;
  output wire id_1;
  wire [id_3 : id_9] id_12, id_13;
  wire id_14 [id_7 : 1];
  wire id_15;
  assign id_5 = id_3;
endmodule
