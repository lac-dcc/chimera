// Seed: 1674601356
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input wire id_2
);
  always @(posedge id_2 or posedge 1'b0) assign id_0 = 1;
endmodule
module module_1 #(
    parameter id_15 = 32'd32,
    parameter id_16 = 32'd51
) (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    output wand id_3,
    input tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input uwire id_7,
    output wand id_8,
    input tri1 id_9,
    input tri0 id_10,
    output supply1 id_11,
    input tri id_12,
    output uwire id_13
);
  assign id_3 = 1;
  if (~|id_4) begin
    defparam id_15.id_16 = 1;
  end
  module_0(
      id_8, id_10, id_6
  );
endmodule
