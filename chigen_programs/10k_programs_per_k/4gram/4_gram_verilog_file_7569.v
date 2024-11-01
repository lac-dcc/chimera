// Seed: 2422046595
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
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_10;
  wire id_11;
  wire id_12, id_13;
  assign id_1 = id_13;
  always @(posedge id_6) begin
    id_9 = id_11;
    wait (1);
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wire  id_2,
    output tri   id_3
);
  wire id_5;
  module_0(
      id_5, id_5, id_5, id_5, id_5, id_5, id_5, id_5, id_5
  );
  assign id_3 = 1 ? id_1 : id_0 & id_1;
endmodule
