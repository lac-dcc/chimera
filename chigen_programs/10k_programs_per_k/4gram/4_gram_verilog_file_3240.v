// Seed: 1743279083
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = 1;
  reg id_6;
  reg id_7;
  assign id_6 = id_6;
  supply0 id_8;
  assign id_1 = 1'h0 ? {1{id_6}} : {1{id_4 - 1}};
  wire id_9;
  always @({id_8,
    1
  } or 1)
  begin : LABEL_0
    #1 begin : LABEL_0
      disable id_10;
    end
    if (1) begin : LABEL_0
      id_7 <= 1;
    end else begin : LABEL_0
      id_4 = 1;
      id_6 <= 1;
    end
    cover (1);
  end
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    input  tri1  id_2
);
  reg  id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5,
      id_5
  );
  always @(posedge 1) begin : LABEL_0
    id_0 <= id_4;
  end
  id_6 :
  assert property (@(negedge 1) 1'h0 * 1)
  else $display(1 - id_4, id_1, 1'h0, 1);
  assign id_6 = id_2;
  integer id_8 = "";
  wire id_9;
  wire id_10 = id_10;
endmodule
