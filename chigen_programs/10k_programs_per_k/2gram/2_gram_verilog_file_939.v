// Seed: 1066385030
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output supply1 id_2
);
  wire [1 : 1] id_4;
  assign module_1.id_4 = 0;
  parameter id_5 = 1;
  always disable id_6;
  assign id_4 = id_5;
  assign module_2.id_9 = 0;
endmodule
module module_1 (
    input tri1 id_0
    , id_7,
    input uwire id_1,
    input supply0 id_2,
    input tri id_3,
    input tri0 id_4,
    output wire id_5
);
  wire id_8;
  localparam \id_9 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_5
  );
  wire id_11;
endmodule
module module_2 #(
    parameter id_4 = 32'd91,
    parameter id_5 = 32'd54,
    parameter id_6 = 32'd57
) (
    output supply0 id_0,
    output wire id_1,
    inout tri0 id_2,
    input tri id_3,
    input wand _id_4,
    output supply0 _id_5,
    input supply1 _id_6,
    input uwire id_7
);
  assign id_0 = 'b0;
  logic [id_6 : id_5] id_9;
  wire [-1 : id_6  ==  id_4] id_10;
  bufif0 primCall (id_0, id_2, id_10);
  initial
    @(posedge -1 or posedge 1'h0, negedge 1 & id_7 & 1) begin : LABEL_0
      @(posedge -1 or posedge id_3 or id_7);
      id_9 = id_10 == id_10 - 1;
    end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0
  );
endmodule
