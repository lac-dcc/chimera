// Seed: 3192750149
module module_0 (
    output tri  id_0,
    input  tri0 id_1,
    input  wand id_2,
    output wire id_3,
    output tri  id_4
);
  assign id_4 = -1;
endmodule
module module_1 (
    output wand  id_0,
    output uwire id_1,
    input  tri   id_2,
    inout  wand  id_3,
    output logic id_4,
    input  tri1  id_5
);
  logic id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_1 = 1'b0;
  always id_4 <= -1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign module_3.id_4 = 0;
endmodule
module module_3 #(
    parameter id_1 = 32'd16,
    parameter id_3 = 32'd52,
    parameter id_4 = 32'd50
) (
    input supply1 id_0,
    input tri0 _id_1
);
  wire _id_3;
  ;
  wire [id_1 : id_1] _id_4, id_5;
  logic [{  id_3  {  ~  id_1  }  } : id_4  <  id_3] id_6;
  ;
  module_2 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  always begin : LABEL_0
    id_6 <= id_5;
  end
endmodule
