module CrossBar (output reg [63:0] OE,OW,ON,OS,Eject, input [2:0] S_E, S_W, S_N, S_S, S_Ejec, input [63:0] IE, IW, IN, IS, Inject);
  
  always @(*)
  begin
    case (S_E)
      3'd0: OE = IE;
      3'd1: OE = IW;
      3'd2: OE = IN;
      3'd3: OE = IS;
      3'd4: OE = Inject;
      default:
        OE = 64'b0;
    endcase
    
    case (S_W)
      3'd0: OW = IE;
      3'd1: OW = IW;
      3'd2: OW = IN;
      3'd3: OW = IS;
      3'd4: OW = Inject;
      default:
        OW = 64'b0;
    endcase
    
    case (S_N)
      3'd0: ON = IE;
      3'd1: ON = IW;
      3'd2: ON = IN;
      3'd3: ON = IS;
      3'd4: ON = Inject;
      default:
        ON = 64'b0;
    endcase
    
    case (S_S)
      3'd0: OS = IE;
      3'd1: OS = IW;
      3'd2: OS = IN;
      3'd3: OS = IS;
      3'd4: OS = Inject;
      default:
        OS = 64'b0;
    endcase
    
    case (S_Ejec)
      3'd0: Eject = IE;
      3'd1: Eject = IW;
      3'd2: Eject = IN;
      3'd3: Eject = IS;
      3'd4: Eject = Inject;
      default:
        Eject = 64'b0;
    endcase
    
  end
  
endmodule
