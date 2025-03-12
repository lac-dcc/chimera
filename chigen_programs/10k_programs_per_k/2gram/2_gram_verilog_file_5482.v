// Seed: 674896914
module module_0 (
    input  wand  id_0,
    input  tri1  id_1,
    input  tri   id_2,
    input  wor   id_3,
    input  uwire id_4,
    output uwire id_5,
    output wire  id_6,
    output uwire id_7,
    input  tri0  id_8,
    input  uwire id_9,
    input  tri1  id_10,
    input  wire  id_11,
    input  tri   id_12
);
  supply1 id_14 = -1;
  tri1 id_15 = 1;
  wire id_16;
  logic id_17;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd56
) (
    input supply0 _id_0,
    output wand id_1,
    input wor id_2,
    input wire id_3,
    output logic id_4
);
  always begin : LABEL_0
    case (1)
      1'b0: id_4 <= 1'b0;
      {id_3 & id_3{id_3}} :
      if (1)
        for (id_4 = id_2; -1; id_4 = -1'b0)
        #1 begin : LABEL_1
          if (1) begin : LABEL_2
            $unsigned(47);
            ;
          end else SystemTFIdentifier(-1, -1 + -1, (id_0), id_0, -1'b0);
        end
    endcase
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_6 = 0;
  assign id_4 = -1'b0;
  wire [1 : -1] id_6;
  logic [id_0 : ~  1] id_7;
  ;
endmodule
