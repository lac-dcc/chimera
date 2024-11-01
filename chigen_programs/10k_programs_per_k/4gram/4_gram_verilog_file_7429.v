// Seed: 4195171061
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_9 :
  assert property (@(posedge 1 - 1) 1'b0)
  else $display(1'b0);
  wire id_10;
  wire id_11;
  assign id_1 = 1'b0;
endmodule
module module_1 (
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
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_14, id_15, id_16;
  module_0(
      id_13, id_13, id_2, id_5, id_5, id_7, id_12, id_4
  );
  always @(1 or negedge 1)
    if (id_8) id_3 <= 1;
    else begin
      id_16 <= {id_10{id_1[1 : 1]}};
    end
endmodule
