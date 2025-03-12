// Seed: 276367035
module module_0 (
    input tri0 id_0,
    input wand id_1
    , id_3
);
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    output logic id_2,
    input tri1 id_3,
    output logic id_4
    , id_8,
    input supply0 id_5,
    input wire id_6
);
  wire id_9;
  ;
  assign id_2 = id_0 ? ~id_6 : id_6;
  parameter id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_5
  );
  always @(-1) begin : LABEL_0
    id_4 <= 1;
    id_2 <= 1;
  end
endmodule
module module_2 #(
    parameter id_6 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_5 :
  assert property (@(posedge id_4) -1)
  else $clog2(51);
  ;
  logic _id_6;
  ;
  wire [-1 : id_6] id_7 = (-1) ? id_6 : id_4;
  wire id_8;
endmodule
module module_3 #(
    parameter id_1 = 32'd26
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  module_2 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_5 = 0;
  output wire id_2;
  inout wire _id_1;
  wire [id_1 : id_1] id_5;
  wire id_6;
endmodule
