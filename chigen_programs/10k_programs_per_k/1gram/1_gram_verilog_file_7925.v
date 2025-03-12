// Seed: 4175649972
module module_0 (
    input wand  id_0,
    input wire  id_1,
    input uwire id_2,
    input tri   id_3
);
  id_5[1] (
      id_3 || -1'h0
  );
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri id_0,
    output supply0 id_1
);
  logic id_3 = id_3;
  logic id_4;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0
  );
endmodule
module module_2 #(
    parameter id_1 = 32'd43,
    parameter id_7 = 32'd50
) (
    output uwire id_0,
    input  wor   _id_1,
    input  wor   id_2,
    input  tri1  id_3 [id_1 : -1],
    input  wor   id_4
);
  assign id_0 = 1'd0;
  wire id_6 = id_6;
  logic _id_7;
  bit id_8;
  struct packed {logic id_9;} id_10;
  assign id_8 = id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_2
  );
  assign modCall_1.id_3 = 0;
  reg [1 : id_1] id_11;
  reg id_12, id_13[id_7 : {  1  }], id_14;
  parameter id_15 = 1;
  logic id_16;
  assign id_10 = id_15;
  initial id_11 = id_16;
  assign id_11 = -1;
  logic id_17;
  always @(id_10 or ~-1 - 1) begin : LABEL_0
    $unsigned(34);
    ;
  end
  bit [1 : -1 'b0] id_18;
  initial begin : LABEL_1
    begin : LABEL_2
      id_17 = 1'b0;
    end
  end
  always
    if (id_15) id_13 <= id_13 & -1;
    else begin : LABEL_3
      begin : LABEL_4
        @(negedge id_16) id_18 = 1;
        #1
        #(id_7)
        if ({-1}) begin : LABEL_5
          id_16 <= id_2;
        end else id_16 <= -1;
        begin : LABEL_6
          id_14 = id_18;
          id_8 <= id_2;
        end
      end
    end
endmodule
