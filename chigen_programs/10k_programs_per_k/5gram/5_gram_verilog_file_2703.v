// Seed: 855351459
module module_0 (
    output wire  id_0,
    input  wand  id_1,
    output tri0  id_2,
    output uwire id_3,
    output wand  id_4,
    output wand  id_5,
    input  tri1  id_6
);
  assign id_5 = id_6;
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1
);
  wire  id_3;
  logic id_4;
  always_latch @* begin : LABEL_0
    disable id_5;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output tri0 id_1;
  assign id_1 = -1;
endmodule
module module_3 #(
    parameter id_1 = 32'd75,
    parameter id_4 = 32'd23,
    parameter id_6 = 32'd38
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  output logic [7:0] id_8;
  input wire id_7;
  inout wire _id_6;
  inout logic [7:0] id_5;
  inout wire _id_4;
  inout wire id_3;
  module_2 modCall_1 (
      id_3,
      id_3
  );
  inout logic [7:0] id_2;
  input wire _id_1;
  wire [-1 'b0 : id_1  -  id_4] id_9;
  wire id_10;
  logic [id_4 : id_6] id_11;
  ;
  assign id_3 = id_11;
  always @(posedge (id_2[id_1] | "") or posedge
  id_3++
  )
    if (1)
      #1 begin : LABEL_0
        id_5[-1] <= id_9 == $signed(18);
        ;
      end
endmodule
