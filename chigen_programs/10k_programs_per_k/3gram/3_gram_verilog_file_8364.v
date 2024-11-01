// Seed: 3050395209
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_0(
      id_4, id_3, id_5
  );
  wire id_6;
  always @(|1) begin
    id_1 <= 1;
  end
  xnor (id_3, id_4, id_1, id_2);
endmodule
module module_2 (
    input uwire id_0,
    input supply1 id_1,
    input wire id_2,
    output wand id_3,
    input tri0 id_4,
    input supply1 id_5,
    output uwire id_6,
    input tri id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wire id_10,
    input supply0 id_11,
    output tri id_12,
    input tri0 id_13,
    output wand id_14,
    input wire id_15
);
  assign id_12 = 1;
endmodule
module module_3 (
    output tri id_0,
    output uwire id_1,
    input tri0 id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri id_5,
    input wand id_6,
    output wire id_7,
    output uwire id_8,
    input tri1 id_9,
    output wand id_10,
    input wire id_11,
    input supply0 id_12,
    input wand id_13,
    output tri0 id_14,
    input uwire id_15,
    output supply0 id_16
);
  assign id_0 = 1'b0;
  module_2(
      id_6,
      id_11,
      id_3,
      id_16,
      id_15,
      id_5,
      id_8,
      id_12,
      id_2,
      id_15,
      id_9,
      id_9,
      id_10,
      id_12,
      id_1,
      id_12
  );
endmodule
