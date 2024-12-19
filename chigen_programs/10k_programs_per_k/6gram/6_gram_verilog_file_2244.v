// Seed: 3299240390
module module_0 (
    input wire id_0,
    output wand id_1,
    output supply1 id_2,
    output wand id_3
);
  always @(posedge 1'b0 == 1) begin : LABEL_0
    assert (id_0);
  end
endmodule
module module_1 (
    output tri  id_0,
    input  wand id_1,
    input  wand id_2,
    output tri0 id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_2 #(
    parameter id_8 = 32'd8,
    parameter id_9 = 32'd15
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_8.id_9 = id_9;
endmodule
module module_3 #(
    parameter id_5 = 32'd17,
    parameter id_6 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  defparam id_5.id_6 = 1'b0;
  module_2 modCall_1 (
      id_4,
      id_1,
      id_3,
      id_2,
      id_1,
      id_4,
      id_4
  );
endmodule
