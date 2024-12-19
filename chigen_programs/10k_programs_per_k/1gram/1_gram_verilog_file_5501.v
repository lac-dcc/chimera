// Seed: 4287703677
module module_0;
  wire id_2;
  wire id_3;
  assign id_1 = 1;
  wire id_4;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output supply1 id_0
);
  reg id_2, id_3, id_4;
  wire id_5, id_6;
  wire id_7;
  module_0 modCall_1 ();
  always @(id_6) id_2 <= 1;
  wire id_8;
endmodule
module module_2 (
    input tri1 id_0
);
  if (1) assign id_2 = "";
  else begin : LABEL_0
    begin : LABEL_0
      wire id_3, id_4;
    end
  end
  module_0 modCall_1 ();
endmodule
module module_3 (
    input  logic   id_0,
    input  supply0 id_1,
    input  logic   id_2,
    input  supply0 id_3,
    output logic   id_4,
    input  supply1 id_5
);
  reg id_7;
  id_8 :
  assert property (@(1'b0) id_1 - id_2) begin : LABEL_0
    begin : LABEL_0
      id_4 <= "";
    end
    id_8 <= (id_2);
    begin : LABEL_0$display
      ;
    end
    $display(id_2, 1, 1, 1,, id_3 == id_5, id_2.id_7 === 1);
    @(posedge id_0) id_4 <= id_7;
  end
  reg id_9;
  module_0 modCall_1 ();
  reg id_10, id_11, id_12;
  always id_11 <= #1 1;
  assign id_12 = 1;
  wire id_13;
  assign id_7 = 1;
  always id_10 <= id_9;
endmodule
