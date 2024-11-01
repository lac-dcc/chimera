// Seed: 171712937
module module_0 (
    output tri id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3
);
  wire id_5;
  genvar id_6;
endmodule
module module_1 (
    input  wand id_0,
    input  wire id_1,
    input  wand id_2,
    output tri  id_3
);
  module_0(
      id_3, id_2, id_0, id_2
  );
endmodule
module module_2 (
    input  logic id_0,
    input  tri   id_1,
    input  uwire id_2,
    input  wor   id_3,
    output wor   id_4,
    output uwire id_5,
    output uwire id_6,
    input  logic id_7,
    output wand  id_8
);
  logic id_10;
  wire  id_11;
  always @(posedge 1 - id_1 or posedge id_0) begin
    #1 begin
      id_5 = 1;
    end
    id_10 = id_0;
    id_10 <= id_7;
  end
  wire id_12;
  module_0(
      id_4, id_3, id_3, id_1
  );
  assign id_12 = id_1;
endmodule
