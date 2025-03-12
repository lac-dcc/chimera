// Seed: 1854377664
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_6 = 32'd62
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output reg id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_4,
      id_3,
      id_4
  );
  always @(id_4)
    #1 begin : LABEL_0
      id_1 <= id_4;
    end
  logic id_5;
  localparam id_6 = 1;
  wire id_7;
  localparam id_8 = id_6;
  wire [(  (  id_6  )  )  ?  -1  -  &  -1 : 1  ?  -1 : -1 'b0 : -1] id_9;
endmodule
