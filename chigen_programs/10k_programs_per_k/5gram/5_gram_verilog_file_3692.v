// Seed: 1470153925
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_10;
endmodule
module module_1 (
    output wand  id_0,
    input  uwire id_1,
    input  logic id_2,
    output wand  id_3,
    inout  uwire id_4,
    output tri   id_5,
    output logic id_6,
    input  logic id_7,
    output tri1  id_8,
    output tri0  id_9
);
  reg id_11;
  nand (id_4, id_12, id_11, id_13, id_1, id_7, id_2, id_14);
  supply1 id_12;
  wire id_13;
  always_ff @("" == id_12 or posedge id_1) begin
    if ('b0) forever id_5 = 1;
    else begin
      wait (1);
      id_11 <= id_2;
      id_6  <= id_7;
    end
  end
  wire id_14;
  module_0(
      id_13, id_13, id_13, id_13, id_14, id_12, id_14, id_14, id_12
  );
endmodule
