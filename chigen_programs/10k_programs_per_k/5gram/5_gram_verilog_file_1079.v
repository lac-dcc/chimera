// Seed: 3627225952
module module_0 (
    input tri0 id_0,
    input wand id_1
);
  wire [-1 : {  -1  {  -1  }  }] id_3;
endmodule
module module_1 #(
    parameter id_5 = 32'd47
) (
    input supply0 id_0,
    input uwire id_1,
    output wand id_2,
    output logic id_3
);
  logic [1 : -1] _id_5;
  ;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire id_6;
  ;
  assign id_3 = id_0;
  logic [7:0] id_7[id_5 : -1];
  assign id_3 = 1;
  always #1 begin : LABEL_0
    id_7[1] <= id_6;
  end
  always #(id_5 == id_7#(1)) id_3 = id_6;
endmodule
