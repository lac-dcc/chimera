// Seed: 3133702514
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    input logic id_5,
    input supply0 id_6,
    input uwire id_7
    , id_10,
    output logic id_8
);
  wire id_11;
  assign module_1.type_0 = 0;
  reg id_12;
  always @(negedge !id_6) begin : LABEL_0
    if (id_7) id_8 <= 1;
    else id_12 <= id_5;
  end
endmodule
module module_1 (
    input  supply1 id_0,
    input  logic   id_1,
    output logic   id_2
);
  logic id_4 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_0,
      id_2
  );
  always
  fork : SymbolIdentifier
    logic id_5;
    begin : LABEL_0
      if (1) begin : LABEL_0
        id_6(id_1, id_4);
        @(negedge id_1) id_2 <= id_1;
        id_5 = id_1;
        if (id_1) begin : LABEL_0
          id_4 = #1 1 != id_5;
        end
        id_6 <= (1);
        if (1'b0 && id_0 == id_1) id_5 = 1;
        else disable id_7;
      end else begin : LABEL_0
        begin : LABEL_0
          id_2 <= 1;
          release id_5;
        end
        $display(&id_5);
      end
    end
    #1 id_4 = id_1;
  join : SymbolIdentifier
  assign id_5 = 1;
endmodule
