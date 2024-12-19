// Seed: 1539239539
module module_0;
  wire id_1 = id_1;
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input wand id_2,
    output tri id_3,
    input wand id_4,
    output wand id_5,
    input tri0 id_6,
    input wor id_7
    , id_10,
    output supply1 id_8
);
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  assign id_8 = 1;
  assign id_3 = id_1;
  module_0 modCall_1 ();
endmodule
program module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1'b0) begin : LABEL_0
    id_6 <= 1;
  end
  reg id_9;
  module_0 modCall_1 ();
  wire id_10;
  always @(1 or negedge id_9) begin : LABEL_0
    begin : LABEL_0
      if ((id_8) >>> id_9) id_9 <= (id_9);
      else begin : LABEL_0
        id_6 <= id_9;
        id_1 <= id_8;
        assert (id_6);
      end
    end
  end
  wire   id_11;
  string id_12 = "";
endprogram
