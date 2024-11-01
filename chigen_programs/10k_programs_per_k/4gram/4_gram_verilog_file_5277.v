// Seed: 3167916195
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
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_9;
  assign id_8 = id_3;
  wire id_10;
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_12 = id_10;
  or (id_11, id_14, id_15, id_10, id_2, id_13, id_12, id_16, id_8, id_1, id_9);
  assign id_4 = 1 ? id_8 : 1 - id_13;
  always @(posedge 0) begin
    $display(id_16);
    id_17 <= id_14;
    id_5  <= 1;
    fork
      id_17 <= id_2;
      id_11[1-:1] = 1'b0;
      id_5 <= 1 & id_1;
    join
  end
  module_0(
      id_16, id_12, id_1, id_9, id_4, id_13, id_4, id_10
  ); id_19 :
  assert property (@(posedge !id_13) 1 ? 1 : id_13)
  else $display(id_1);
endmodule
