// Seed: 790487875
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    output tri id_2,
    input tri module_0,
    input supply1 id_4,
    input wire id_5,
    input wire id_6,
    output uwire id_7,
    output uwire id_8,
    output wor id_9
);
  always @(posedge id_4 or posedge {-1'd0, -1'b0}) #1;
endmodule
module module_1 #(
    parameter id_2 = 32'd27
) (
    input  tri0  id_0,
    output wand  id_1,
    input  wire  _id_2,
    output logic id_3
);
  supply0 [(  1  ) : id_2] id_5 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  bit id_6;
  ;
  always @* begin : LABEL_0
    id_6 = new;
    id_3 <= id_2;
    begin : LABEL_1
    end
    $clog2(55);
    ;
  end
endmodule
