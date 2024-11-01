// Seed: 3738435568
module module_0 #(
    parameter id_20 = 32'd37,
    parameter id_21 = 32'd62
) (
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
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  supply1 id_13;
  wire id_14;
  wire id_15 = id_8;
  tri1 id_16;
  id_17 :
  assert property (@(posedge 1) id_17)
  else $display(id_13, id_15 ^ 1);
  assign id_14 = id_5;
  wire id_18;
  for (id_19 = id_9; id_4; id_16 = id_17) begin
    defparam id_20.id_21 = 1;
  end
  wire id_22 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_0(
      id_1, id_1, id_5, id_5, id_1, id_2, id_1, id_5, id_2, id_5, id_5, id_2
  );
endmodule
