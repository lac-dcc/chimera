// Seed: 1650332279
module module_0;
endmodule
module module_1 (
    output wor   id_0,
    input  wor   id_1,
    input  uwire id_2,
    output uwire id_3,
    input  tri0  id_4,
    input  wor   id_5,
    input  wire  id_6,
    input  uwire id_7,
    output wor   id_8
);
  assign id_0 = 1'b0;
  nand (id_0, id_1, id_2, id_4, id_5, id_6, id_7);
  module_0();
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
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
  assign id_12 = id_8;
  logic [7:0] id_15;
  module_0();
  always @(negedge 1'b0) begin
    if (1) begin
      #1;
      id_11 <= 1 == id_12;
    end
  end
  always_ff @(posedge (id_9) > id_10) begin
    #1 begin
      id_1 = id_15[1];
    end
    id_1 <= 1;
    if (id_3)
      if (id_9 * id_8 - 1) id_4 <= 1'd0 + 1;
      else begin
        id_5 <= id_2;
        release id_5;
      end
  end
  wire id_16;
endmodule
