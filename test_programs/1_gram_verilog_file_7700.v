// Seed: 9403730
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  integer id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  tri0 id_6 = 1'b0;
  final begin : LABEL_0
    id_5 = -1;
    id_5 <= id_4 ? id_5 - 1 : id_4;
    begin : LABEL_0
      id_2 = id_3;
      begin : LABEL_0
        if (1) begin : LABEL_0
          begin : LABEL_0
            begin : LABEL_0
              id_2 = -1'b0;
            end
          end
        end
      end
      id_2 <= 1;
      force id_2 = id_4;
    end : SymbolIdentifier
  end
  assign id_2 = id_3;
  assign id_2 = 1'b0;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_6
  );
  assign id_6 = (1);
endmodule
