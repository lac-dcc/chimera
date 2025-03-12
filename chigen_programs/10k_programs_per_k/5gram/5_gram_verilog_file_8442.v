// Seed: 3028862022
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    input  wand  id_2
);
  assign id_0 = id_1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd86,
    parameter id_3 = 32'd69,
    parameter id_6 = 32'd32,
    parameter id_8 = 32'd69,
    parameter id_9 = 32'd10
) (
    output wor id_0,
    input uwire _id_1,
    input uwire id_2,
    input tri0 _id_3,
    output logic id_4,
    input wand id_5,
    input wor _id_6,
    input supply1 id_7,
    input tri0 _id_8,
    input tri0 _id_9
);
  assign id_0 = id_7;
  function void id_11[- 1'd0 : id_9];
    input [id_3  <  (  id_8  ==  id_6  ) : id_8  ==  id_3] id_12;
    begin : LABEL_0
      id_4 = id_9 & -1 == id_3;
    end
  endfunction
  wire [1 : id_1] id_13;
  wire [-1 : 1] id_14;
  wire id_15;
  ;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_2
  );
  assign id_4 = 1;
  initial begin
    id_11(id_14);
  end
endmodule
