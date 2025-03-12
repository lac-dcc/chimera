// Seed: 3358602790
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply1 id_3
);
  assign id_3 = id_1;
  assign id_0 = -1;
  wire id_5;
  assign id_0 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    output wor id_1,
    output wand id_2,
    input tri id_3,
    input tri0 id_4,
    inout supply1 id_5
    , id_8,
    output tri1 id_6
);
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output reg id_1;
  assign id_6[-1] = id_7;
  wire id_8;
  always @(posedge id_8 or posedge -1'b0) begin : LABEL_0
    id_1 <= id_6;
  end
endmodule
module module_3 #(
    parameter id_2 = 32'd25
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output reg id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  inout logic [7:0] id_1;
  always @(id_2 or id_5) begin : LABEL_0
    fork
      id_8#(.id_9(1));
      $unsigned(81);
      ;
    join_any
    id_7 <= #id_5 -1'b0;
    disable id_10;
  end
  module_2 modCall_1 (
      id_7,
      id_4,
      id_5,
      id_3,
      id_4,
      id_1,
      id_5
  );
  wire id_11;
  assign id_1[id_2] = id_5 - !id_4;
endmodule
