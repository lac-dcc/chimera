// Seed: 1627441050
module module_0 (
    input supply0 id_0
);
  assign id_2 = 1'b0;
  wire id_3;
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wire id_5
);
  module_0(
      id_2
  );
  wire id_7;
  assign #id_8 id_0 = id_5;
  bufif0 (id_1, id_4, id_5);
  tri1 id_9 = 1;
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
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_10;
  generate
    assign id_9 = id_9 ~^ id_10[1] && 1'd0;
  endgenerate
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_7;
  always @(posedge 1) begin
    id_1[1] = id_5;
  end
  assign id_3[1] = id_5;
  wire id_8;
  module_2(
      id_8, id_6, id_5, id_2, id_7, id_5, id_8, id_7, id_7
  );
endmodule
