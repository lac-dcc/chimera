// Seed: 3370858174
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  ;
  wire id_9;
  ;
  always_ff @(-1 or negedge id_4) begin : LABEL_0
    {id_9, id_4 * -1} = id_3;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd63,
    parameter id_4 = 32'd26,
    parameter id_5 = 32'd40
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  input wire id_2;
  inout wire id_1;
  logic _id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  logic _id_5;
  ;
  logic [7:0][-1 'b0 >  id_3 : ~  id_4] id_6;
  wire id_7;
  wire id_8;
  assign id_6[1===id_5] = 1;
  wire id_9;
  logic [7:0] id_10 = id_10[1 : id_3];
endmodule
