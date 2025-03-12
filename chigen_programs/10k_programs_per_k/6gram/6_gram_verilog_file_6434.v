// Seed: 822426877
module module_0 #(
    parameter id_3 = 32'd81
) (
    output wire id_0,
    output wire id_1
);
  logic _id_3;
  assign id_0 = id_3 + id_3 * 1 / 1'b0 / id_3 - id_3;
  assign id_3 = id_3;
  wire id_4;
  wire [1 : ""] id_5;
  assign module_1._id_2 = 0;
  wire [1 : 1] id_6;
  logic id_7;
  wire id_8[-1 : id_3][1 : -1];
  wire id_9;
  ;
  wire id_10;
  initial begin : LABEL_0
    disable id_11;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd84,
    parameter id_1 = 32'd17,
    parameter id_2 = 32'd12,
    parameter id_6 = 32'd31,
    parameter id_7 = 32'd17
) (
    output uwire   _id_0,
    input  supply1 _id_1,
    input  supply1 _id_2,
    output logic   id_3
    , _id_6,
    output supply1 id_4
);
  logic _id_7, id_8;
  wire  id_9  [  id_7  :  -1  ]  [ "" <  -1  :  1  ^  -1 'b0 ^  {  1  }  ^  -1  ^  id_0  ^  id_1  ^  1  ^  id_0  ^  1  ^  1 'd0 ^  1  ^  ~  id_1  ^  id_6  ^  id_6  +  id_6  ^  -1  ^  1  ^  id_2  ^  -1 'b0 ^  id_7  ^  -1  ^  -1  ^  -1  ~^  -1  ]  ;
  ;
  always @(posedge id_2) begin : LABEL_0
    id_3 <= 1;
  end
  not primCall (id_3, id_9);
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
