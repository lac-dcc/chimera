// Seed: 2572828656
module module_0 (
    output wand id_0,
    input  tri0 id_1
);
  assign id_0 = 1;
endmodule
module module_1 (
    output wor   id_0,
    output uwire id_1,
    output wor   id_2,
    output tri1  id_3,
    input  tri1  id_4,
    input  wand  id_5,
    output uwire id_6
);
  assign id_1 = id_5;
  module_0(
      id_3, id_5
  );
  assign id_0 = id_5 + 1;
endmodule
module module_2 #(
    parameter id_3 = 32'd77,
    parameter id_4 = 32'd13
) (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  generate
    defparam id_3.id_4 = 1;
  endgenerate
endmodule
module module_3 (
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
    id_18,
    id_19,
    id_20
);
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_21;
  always_latch id_3 = #1 1'b0;
  always_latch #1 begin
    if (id_18#(1, 1))
      if (1) begin
        id_2 <= id_5;
        `define pp_22 0
        if (id_20) begin
          id_3 = id_18 == !id_9;
          id_21 <= 1'b0;
        end
      end else id_19 <= 1;
  end
  module_2(
      id_7, id_16
  );
endmodule
