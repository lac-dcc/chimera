// Seed: 941629643
module module_0 #(
    parameter id_0 = 32'd28,
    parameter id_2 = 32'd74,
    parameter id_4 = 32'd66
) (
    input tri0 _id_0
    , _id_2
);
  logic [7:0][id_2 : (  -1  )] id_3;
  _id_4 :
  assert property (@(posedge {id_3, 1'b0}) ~id_3[id_4+id_0])
  else $clog2(45);
  ;
  logic [1 : -1  *  id_0] id_5;
  assign id_3[id_0 :-1'b0] = id_2 ==? id_2;
  tri0 id_6, id_7;
  logic id_8;
  ;
  wire [1 : id_4] id_9;
  id_10 :
  assert property (@(posedge 1) -1)
  else $signed(44);
  ;
  assign id_7 = -1'b0 - id_0;
endmodule
module module_1 #(
    parameter id_1  = 32'd15,
    parameter id_11 = 32'd69,
    parameter id_12 = 32'd46
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output reg id_4;
  output logic [7:0] id_3;
  input wire id_2;
  inout wire _id_1;
  wire id_8;
  ;
  parameter id_9 = 1;
  assign id_3[-1] = id_2;
  always @(-1 or -1) begin : LABEL_0
    id_4 <= 1'b0;
  end
  always
  fork : SymbolIdentifier
  join : SymbolIdentifier
  localparam  id_10  =  id_9  ,  id_11  =  1  &  id_10  !==  id_2  ,  id_12  =  id_2  ,  id_13  =  id_11  ,  id_14  = "" ,  id_15  =  1  ;
  assign id_4 = id_12;
  wire [id_11  -  id_12 : id_1] id_16;
  module_0 modCall_1 (id_15);
endmodule
