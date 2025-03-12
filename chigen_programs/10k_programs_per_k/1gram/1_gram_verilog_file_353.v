// Seed: 2622863886
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input wand id_2
);
  assign id_0 = 1'd0;
  logic id_4;
  logic id_5;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd24,
    parameter id_3 = 32'd95
) (
    input tri0 id_0,
    input supply1 id_1,
    input tri0 _id_2,
    input wire _id_3,
    input wor id_4,
    output wire id_5
);
  struct {logic id_7;} id_8[-1 : id_3];
  localparam id_9 = -1;
  assign id_5 = {id_3{id_8}};
  logic id_10 = id_0, id_11;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_1
  );
  wire [1 : 1  &&  id_2] id_12, id_13, id_14;
endmodule
