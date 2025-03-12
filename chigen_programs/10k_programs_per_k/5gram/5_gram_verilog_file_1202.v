// Seed: 2919341795
module module_0 (
    input supply0 id_0,
    output wor id_1,
    output wor id_2,
    input tri0 id_3,
    input uwire id_4
);
  id_6 :
  assert property (@(posedge id_6) "")
  else $unsigned(60);
  ;
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1,
    output wire  id_2,
    output tri1  id_3
);
  not primCall (id_2, id_0);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 #(
    parameter id_4 = 32'd65
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout tri1 id_7;
  input wire id_6;
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_7;
  wire id_12;
  ;
  logic [-1  -  {  id_4  <  -1  {  -1 'b0 }  } : 1] id_13;
  ;
  logic id_14;
  assign id_7 = -1;
endmodule
module module_3 #(
    parameter id_1  = 32'd6,
    parameter id_17 = 32'd49
) (
    input  tri   id_0,
    input  wire  _id_1,
    output logic id_2
    , id_7,
    output tri1  id_3,
    output tri   id_4,
    output logic id_5
    , id_8, id_9
);
  localparam id_10 = !1 == 1;
  wire id_11;
  parameter id_12 = id_10 * id_10;
  always_ff @(posedge id_11) begin : LABEL_0
    begin : LABEL_1
      if (1'b0 == id_10 && -1'b0) begin : LABEL_2
        id_5 <= -1;
      end else id_2 = 1;
      id_8 = id_12;
    end
  end
  assign id_5 = id_9 || id_8 == id_10;
  wire id_13;
  logic [7:0][-1 : 1] id_14;
  logic [7:0] id_15;
  assign id_15[id_1] = id_1;
  assign id_13 = ~id_8;
  wire id_16;
  parameter id_17 = 1;
  initial
    #(1'b0 == -1) begin : LABEL_3
      fork
        id_9 <= id_10;
        assign id_4.id_0 = id_9 & id_13;
        $unsigned(id_17);
        ;
      join
    end
  wire id_18;
  assign id_14[1] = -1;
  id_19 :
  assert property (@(posedge id_1) id_11)
  else $signed(id_17);
  ;
  wire [id_17 : 1  ==  -1] id_20;
  localparam id_21 = -1;
  logic [1 'h0 : 1] id_22 = 1 < "";
  wire id_23;
  id_24 :
  assert property (@(posedge id_20) id_17)
  else $signed(id_17);
  ;
  module_2 modCall_1 (
      id_21,
      id_12,
      id_12,
      id_17,
      id_12,
      id_20,
      id_22,
      id_18,
      id_11,
      id_21,
      id_12
  );
  wire id_25;
  wire id_26;
endmodule
