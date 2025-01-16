// Seed: 3881603855
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  tri0 id_8, id_9;
  assign id_8 = id_5;
  assign id_6 = {1{id_8}} && -1;
endmodule
module module_1 (
    input tri id_0
);
  wire id_2, id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.type_10 = 0;
endmodule
module module_2 (
    output logic id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  logic id_3
);
  assign id_0 = id_3;
  integer id_5;
  logic id_6, id_7, id_8, id_9, id_10;
  always @(*) begin : LABEL_0
    id_6 = 1 & id_9;
    begin : LABEL_0
      begin : LABEL_0
        id_7 = id_3;
        id_6 <= !-1'b0;
        `define pp_11 0
      end
    end
  end
  tri id_12 = 1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
  assign modCall_1.id_5 = 0;
  assign id_8 = id_10;
  wire id_13, id_14;
endmodule
